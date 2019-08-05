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
        
    
! OPS  134*ADD + 296*MUL + 41*NEG + 34*SUB = 505  (1685 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60,&
                v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71,&
                v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82,&
                v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93,&
                v94, v95, v96, v97, v98, v99, h, u
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
#define M_xxxxxxxx           M(64)
#define M_xxxxxxxy           M(65)
#define M_xxxxxxxz           M(66)
#define M_xxxxxxyy           M(67)
#define M_xxxxxxyz           M(68)
#define M_xxxxxyyy           M(69)
#define M_xxxxxyyz           M(70)
#define M_xxxxyyyy           M(71)
#define M_xxxxyyyz           M(72)
#define M_xxxyyyyy           M(73)
#define M_xxxyyyyz           M(74)
#define M_xxyyyyyy           M(75)
#define M_xxyyyyyz           M(76)
#define M_xyyyyyyy           M(77)
#define M_xyyyyyyz           M(78)
#define M_yyyyyyyy           M(79)
#define M_yyyyyyyz           M(80)
    v0         = W*x
    v1         = W*y
    v2         = W*z
    v3         = v0*y
    v4         = v0*z
    v5         = v1*z
    v6         = v3*z
    M_0        = W
    M_x        = v0
    M_y        = v1
    M_z        = v2
    M_xy       = v3
    M_xz       = v4
    M_yz       = v5
    M_xyz      = v6
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v7         = a2
    v52        = 3.0d0*v7
    a3         = a1*a2
    a4         = a2*a2
    v19        = a4
    a5         = a2*a3
    a6         = a3*a3
    v38        = a6
    a7         = a3*a4
    a8         = a4*a4
    b2         = b1*b1
    v8         = b2
    v97        = v7 + v8
    v9         = v97
    v25        = v7*v8
    v46        = v19*v8
    v48        = 2.0d0*v7 + v8
    v49        = v7 + 6.0d0*v8
    v53        = 3.0d0*v8
    v54        = v53 + v7
    v57        = v7 + 2.0d0*v8
    v58        = 6.0d0*v7 + v8
    v60        = v52 + v8
    b3         = b1*b2
    b4         = b2*b2
    v29        = b4
    v56        = v29*v7
    b5         = b2*b3
    b6         = b3*b3
    v62        = b6
    b7         = b3*b4
    b8         = b4*b4
    c2         = c1*c1
    h          = c2 + v9
    v98        = h*v7
    v99        = h*v8
    v10        = 0.333333333333333d0*h
    v11        = -v10
    v12        = v11 + v7
    v13        = v11 + v8
    v14        = -0.6d0*h
    v15        = 0.2d0*h
    v16        = -v15
    v17        = v16 + v7
    v18        = v16 + v8
    v20        = h*h
    v21        = 0.0857142857142857d0*v20
    v22        = v98
    v23        = -0.428571428571429d0*h
    v24        = v23 + v7
    v26        = 0.142857142857143d0*h
    v27        = -v26
    v28        = v23 + v8
    v30        = v99
    v31        = 0.238095238095238d0*v20
    v32        = 0.0476190476190476d0*v20
    v33        = 0.666666666666667d0*v22
    v34        = -v33 + v19 + v32
    v35        = v25 + v32
    v100       = -v35
    v36        = h*v9
    v37        = 0.333333333333333d0*(-2.0d0*v30) + v29 + v32
    v39        = h*h*h
    v40        = -0.0216450216450216d0*v39
    v41        = h*v19
    v42        = v20*v7
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
    v64        = v20*v8
    v65        = -0.0815850815850816d0*v39
    v66        = -0.0116550116550117d0*v39
    v67        = v38 + v66 + 0.00699300699300699d0*(-165.0d0*v41 + 45.0d0*v42)
    v68        = 0.104895104895105d0*v20
    v69        = -0.00699300699300699d0*v39
    v70        = v8*v98
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
    v80        = v39*v7
    v81        = -0.048951048951049d0*v39
    v82        = v38 + v81 + 0.0153846153846154d0*(-91.0d0*v41 + 35.0d0*v42)
    v83        = 0.000777000777000777d0*v76
    v104       = -v83
    v84        = 143.0d0*v39
    v85        = 0.0769230769230769d0*v42
    v86        = -v84
    v87        = -v33*v8
    v88        = 0.00699300699300699d0*(-3.0d0*v39) + v87
    v89        = 0.0769230769230769d0*v20
    v90        = v69 + v87
    v91        = 0.0769230769230769d0*v64
    v92        = 0.0153846153846154d0*v20
    v93        = -0.0041958041958042d0*v39
    v94        = h*v62
    v95        = v39*v8
    v96        = v62 + v81 + 0.0153846153846154d0*(-91.0d0*v63 + 35.0d0*v64)
    M_xx       = W*v12
    M_yy       = W*v13
    M_xxx      = v0*(v14 + v7)
    M_xxy      = v1*v17
    M_xxz      = v17*v2
    M_xyy      = v0*v18
    M_yyy      = v1*(v14 + v8)
    M_yyz      = v18*v2
    M_xxxx     = W*(0.142857142857143d0*(-6.0d0*v22) + v19 + v21)
    M_xxxy     = v24*v3
    M_xxxz     = v24*v4
    M_xxyy     = W*(0.0285714285714286d0*v20 + v25 - v26*v9)
    M_xxyz     = v5*(v27 + v7)
    M_xyyy     = v28*v3
    M_xyyz     = v4*(v27 + v8)
    M_yyyy     = W*(0.142857142857143d0*(-6.0d0*v30) + v21 + v29)
    M_yyyz     = v28*v5
    M_xxxxx    = v0*(0.111111111111111d0*(-10.0d0*v22) + v19 + v31)
    M_xxxxy    = v1*v34
    M_xxxxz    = v2*v34
    M_xxxyy    = -v0*(0.111111111111111d0*v22 + v10*v8 + v100)
    M_xxxyz    = v12*v6
    M_xxyyy    = -v1*(0.111111111111111d0*v30 + v10*v7 + v100)
    M_xxyyz    = v2*(v25 + 0.0158730158730159d0*(v20 - 7.0d0*v36))
    M_xyyyy    = v0*v37
    M_xyyyz    = v13*v6
    M_yyyyy    = v1*(0.111111111111111d0*(-10.0d0*v30) + v29 + v31)
    M_yyyyz    = v2*v37
    M_xxxxxx   = W*(v38 + v40 + 0.0909090909090909d0*(-15.0d0*v41 + 5.0d0*v42))
    M_xxxxxy   = v3*v44
    M_xxxxxz   = v4*v44
    M_xxxxyy   = W*(0.0909090909090909d0*(-v50) + v45 + v46 + v47*v48)
    M_xxxxyz   = v5*(0.0909090909090909d0*(-6.0d0*v22) + v19 + v47)
    M_xxxyyy   = v3*(v25 - v51*(-h + v52 + v53))
    M_xxxyyz   = -v4*(v101 + v51*v54)
    M_xxyyyy   = W*(0.0909090909090909d0*(-v59) + v45 + v47*v57 + v56)
    M_xxyyyz   = -v5*(v101 + v51*v60)
    M_xyyyyy   = v3*v61
    M_xyyyyz   = v4*(0.0909090909090909d0*(-6.0d0*v30) + v29 + v47)
    M_yyyyyy   = W*(v40 + v62 + 0.0909090909090909d0*(-15.0d0*v63 + 5.0d0*v64))
    M_yyyyyz   = v5*v61
    M_xxxxxxx  = v0*(v38 + v65 + 0.00699300699300699d0*(-231.0d0*v41 + 105.0d0*v42))
    M_xxxxxxy  = v1*v67
    M_xxxxxxz  = v2*v67
    M_xxxxxyy  = v0*(0.00699300699300699d0*(-11.0d0*v22*(v7 + 10.0d0*v8) + 10.0d0*v42) + &
      v46 + v66 + v68*v8)
    M_xxxxxyz  = v6*(0.0769230769230769d0*(-10.0d0*v22) + v19 + v68)
    M_xxxxyyy  = v1*(v102 + v71 + 0.00699300699300699d0*(-33.0d0*v41 + 18.0d0*v42))
    M_xxxxyyz  = v2*(v102 + v73 + 0.00699300699300699d0*(6.0d0*v42 - 11.0d0*v50))
    M_xxxyyyy  = v0*(v103 + v71 + 0.00699300699300699d0*(-33.0d0*v63 + 18.0d0*v64))
    M_xxxyyyz  = v6*(v25 + 0.00699300699300699d0*(9.0d0*v20 - 33.0d0*v36))
    M_xxyyyyy  = v1*(0.00699300699300699d0*(-11.0d0*v30*(10.0d0*v7 + v8) + 10.0d0*v64) + &
      v56 + v66 + v68*v7)
    M_xxyyyyz  = v2*(v103 + v73 + 0.00699300699300699d0*(-11.0d0*v59 + 6.0d0*v64))
    M_xyyyyyy  = v0*v75
    M_xyyyyyz  = v6*(0.0769230769230769d0*(-10.0d0*v30) + v29 + v68)
    M_yyyyyyy  = v1*(v62 + v65 + 0.00699300699300699d0*(-231.0d0*v63 + 105.0d0*v64))
    M_yyyyyyz  = v2*v75
    M_xxxxxxxx = W*(0.000466200466200466d0*(-4004.0d0*v78 - 420.0d0*v80) + a8 + v19*v79 + &
      v77)
    M_xxxxxxxy = v3*v82
    M_xxxxxxxz = v4*v82
    M_xxxxxxyy = -W*(v104 + v41*v8 + 15.0d0*v78 + v8*v84 + 429.0d0*v80 - (v38*v8 + v54* &
      v85))
    M_xxxxxxyz = v5*(0.0769230769230769d0*(3.0d0*v42) + v38 - v41 + v86)
    M_xxxxxyyy = v3*(v46 + v88 - v15*v19 + v48*v89)
    M_xxxxxyyz = v4*(0.00512820512820513d0*(-13.0d0*v41 + 10.0d0*v42) + v46 + v90 + v91)
    M_xxxxyyyy = W*(v19*v29 + v92*(v19 + 12.0d0*v25 + v29) + 0.000466200466200466d0*( &
      -18.0d0*v39*v9 - 858.0d0*v70*v97 + v76))
    M_xxxxyyyz = v5*(v46 + v93 - v15*v57*v7 + v58*v92)
    M_xxxyyyyy = v3*(v56 + v88 - v15*v29 + v57*v89)
    M_xxxyyyyz = v4*(v56 + v93 - v15*v48*v8 + v49*v92)
    M_xxyyyyyy = -W*(v104 + v63*v7 + v7*v84 + 15.0d0*v94 + 429.0d0*v95 - (v60*v91 + v62* &
      v7))
    M_xxyyyyyz = v5*(0.00512820512820513d0*(-13.0d0*v63 + 10.0d0*v64) + v56 + v85 + v90)
    M_xyyyyyyy = v3*v96
    M_xyyyyyyz = v4*(0.0769230769230769d0*(3.0d0*v64) + v62 - v63 + v86)
    M_yyyyyyyy = W*(0.000466200466200466d0*(-4004.0d0*v94 - 420.0d0*v95) + b8 + v29*v79 + &
      v77)
    M_yyyyyyyz = v5*v96
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
    
! OPS  5217*ADD + 4679*MUL + 196*NEG + 1480*SUB = 11572  (23236 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v1000, v1001, v1002, v1003, v1004, v1005, v1006, v1007,&
                v1008, v1009, v101, v1010, v1011, v1012, v1013, v1014, v1015,&
                v1016, v1017, v1018, v1019, v102, v1020, v1021, v1022, v1023,&
                v1024, v1025, v1026, v1027, v1028, v1029, v103, v1030, v1031,&
                v1032, v1033, v1034, v1035, v1036, v1037, v1038, v1039, v104,&
                v1040, v1041, v1042, v1043, v1044, v1045, v1046, v1047, v1048,&
                v1049, v105, v1050, v1051, v1052, v1053, v1054, v1055, v1056,&
                v1057, v1058, v1059, v106, v1060, v1061, v1062, v1063, v1064,&
                v1065, v1066, v1067, v1068, v1069, v107, v1070, v1071, v1072,&
                v1073, v1074, v1075, v1076, v1077, v1078, v1079, v108, v1080,&
                v1081, v1082, v1083, v1084, v1085, v1086, v1087, v1088, v1089,&
                v109, v1090, v1091, v1092, v1093, v1094, v1095, v1096, v1097,&
                v1098, v1099, v11, v110, v1100, v1101, v1102, v1103, v1104,&
                v1105, v1106, v1107, v1108, v1109, v111, v1110, v1111, v1112,&
                v1113, v1114, v1115, v1116, v1117, v1118, v1119, v112, v1120,&
                v1121, v1122, v1123, v1124, v1125, v1126, v1127, v1128, v1129,&
                v113, v1130, v1131, v1132, v1133, v1134, v1135, v1136, v1137,&
                v1138, v1139, v114, v1140, v1141, v1142, v1143, v1144, v1145,&
                v1146, v1147, v1148, v1149, v115, v1150, v1151, v1152, v1153,&
                v1154, v1155, v1156, v1157, v1158, v1159, v116, v1160, v1161,&
                v1162, v1163, v1164, v1165, v1166, v1167, v1168, v1169, v117,&
                v1170, v1171, v1172, v1173, v1174, v1175, v1176, v1177, v1178,&
                v1179, v118, v1180, v1181, v1182, v1183, v1184, v1185, v1186,&
                v1187, v1188, v1189, v119, v1190, v1191, v1192, v1193, v1194,&
                v1195, v1196, v1197, v1198, v1199, v12, v120, v1200, v1201,&
                v1202, v1203, v1204, v1205, v1206, v1207, v1208, v1209, v121,&
                v1210, v1211, v1212, v1213, v1214, v1215, v1216, v1217, v1218,&
                v1219, v122, v1220, v1221, v1222, v1223, v1224, v1225, v1226,&
                v1227, v1228, v1229, v123, v1230, v1231, v1232, v1233, v1234,&
                v1235, v1236, v1237, v1238, v1239, v124, v1240, v1241, v1242,&
                v1243, v1244, v1245, v1246, v1247, v1248, v1249, v125, v1250,&
                v1251, v1252, v1253, v1254, v1255, v1256, v1257, v1258, v1259,&
                v126, v1260, v1261, v1262, v1263, v1264, v1265, v1266, v1267,&
                v1268, v1269, v127, v1270, v1271, v1272, v1273, v1274, v1275,&
                v1276, v1277, v1278, v1279, v128, v1280, v1281, v1282, v1283,&
                v1284, v1285, v1286, v1287, v1288, v1289, v129, v1290, v1291,&
                v1292, v1293, v1294, v1295, v1296, v1297, v1298, v1299, v13,&
                v130, v1300, v1301, v1302, v1303, v1304, v1305, v1306, v1307,&
                v1308, v1309, v131, v1310, v1311, v1312, v1313, v1314, v1315,&
                v1316, v1317, v1318, v1319, v132, v1320, v1321, v1322, v1323,&
                v1324, v1325, v1326, v1327, v1328, v1329, v133, v1330, v1331,&
                v1332, v1333, v1334, v1335, v1336, v1337, v1338, v1339, v134,&
                v1340, v1341, v1342, v1343, v1344, v1345, v1346, v1347, v1348,&
                v1349, v135, v1350, v1351, v1352, v1353, v1354, v1355, v1356,&
                v1357, v1358, v1359, v136, v1360, v1361, v1362, v1363, v1364,&
                v1365, v1366, v1367, v1368, v1369, v137, v1370, v1371, v1372,&
                v1373, v1374, v1375, v1376, v1377, v1378, v1379, v138, v1380,&
                v1381, v1382, v1383, v1384, v1385, v1386, v1387, v1388, v1389,&
                v139, v1390, v1391, v1392, v1393, v1394, v1395, v1396, v1397,&
                v1398, v1399, v14, v140, v1400, v1401, v1402, v1403, v1404,&
                v1405, v1406, v1407, v1408, v1409, v141, v1410, v1411, v1412,&
                v1413, v1414, v1415, v1416, v1417, v1418, v1419, v142, v1420,&
                v1421, v1422, v1423, v1424, v1425, v1426, v1427, v1428, v1429,&
                v143, v1430, v1431, v1432, v1433, v1434, v1435, v1436, v1437,&
                v1438, v1439, v144, v1440, v1441, v1442, v1443, v1444, v1445,&
                v1446, v1447, v1448, v1449, v145, v1450, v1451, v1452, v1453,&
                v1454, v1455, v1456, v1457, v1458, v1459, v146, v1460, v1461,&
                v1462, v1463, v1464, v1465, v1466, v1467, v1468, v1469, v147,&
                v1470, v1471, v1472, v1473, v1474, v1475, v1476, v1477, v1478,&
                v1479, v148, v1480, v1481, v1482, v1483, v1484, v1485, v1486,&
                v1487, v1488, v1489, v149, v1490, v1491, v1492, v1493, v1494,&
                v1495, v1496, v1497, v1498, v1499, v15, v150, v1500, v1501,&
                v1502, v1503, v1504, v1505, v1506, v1507, v1508, v1509, v151,&
                v1510, v1511, v1512, v1513, v1514, v1515, v1516, v1517, v1518,&
                v1519, v152, v1520, v1521, v1522, v1523, v1524, v1525, v1526,&
                v1527, v1528, v1529, v153, v1530, v1531, v1532, v1533, v1534,&
                v1535, v1536, v1537, v1538, v1539, v154, v1540, v1541, v1542,&
                v1543, v1544, v1545, v1546, v1547, v1548, v1549, v155, v1550,&
                v1551, v1552, v1553, v1554, v1555, v1556, v1557, v1558, v1559,&
                v156, v1560, v1561, v1562, v1563, v1564, v1565, v1566, v1567,&
                v1568, v1569, v157, v1570, v1571, v1572, v1573, v1574, v1575,&
                v1576, v1577, v1578, v1579, v158, v1580, v1581, v1582, v1583,&
                v1584, v1585, v1586, v1587, v1588, v1589, v159, v1590, v1591,&
                v1592, v1593, v1594, v1595, v1596, v1597, v1598, v1599, v16,&
                v160, v1600, v1601, v1602, v1603, v1604, v1605, v1606, v1607,&
                v1608, v1609, v161, v1610, v1611, v1612, v1613, v1614, v1615,&
                v1616, v1617, v1618, v1619, v162, v1620, v1621, v1622, v1623,&
                v1624, v1625, v1626, v1627, v1628, v1629, v163, v1630, v1631,&
                v1632, v1633, v1634, v1635, v1636, v1637, v1638, v1639, v164,&
                v1640, v1641, v1642, v1643, v1644, v1645, v1646, v1647, v1648,&
                v1649, v165, v1650, v1651, v1652, v1653, v1654, v1655, v1656,&
                v1657, v1658, v1659, v166, v1660, v1661, v1662, v1663, v1664,&
                v1665, v1666, v1667, v1668, v1669, v167, v1670, v1671, v1672,&
                v1673, v1674, v1675, v1676, v1677, v1678, v1679, v168, v1680,&
                v1681, v1682, v1683, v1684, v1685, v1686, v1687, v1688, v1689,&
                v169, v1690, v1691, v1692, v1693, v1694, v1695, v1696, v1697,&
                v1698, v1699, v17, v170, v1700, v1701, v1702, v1703, v1704,&
                v1705, v1706, v1707, v1708, v1709, v171, v1710, v1711, v1712,&
                v1713, v1714, v1715, v1716, v1717, v1718, v1719, v172, v1720,&
                v1721, v1722, v1723, v1724, v1725, v1726, v1727, v1728, v1729,&
                v173, v1730, v1731, v1732, v1733, v1734, v1735, v1736, v1737,&
                v1738, v1739, v174, v1740, v1741, v1742, v1743, v1744, v1745,&
                v1746, v1747, v1748, v1749, v175, v1750, v1751, v1752, v1753,&
                v1754, v1755, v1756, v1757, v1758, v1759, v176, v1760, v1761,&
                v1762, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v177,&
                v1770, v1771, v1772, v1773, v1774, v1775, v1776, v1777, v1778,&
                v1779, v178, v1780, v1781, v1782, v1783, v1784, v1785, v1786,&
                v1787, v1788, v1789, v179, v1790, v1791, v1792, v1793, v1794,&
                v1795, v1796, v1797, v1798, v1799, v18, v180, v1800, v1801,&
                v1802, v1803, v1804, v1805, v1806, v1807, v1808, v1809, v181,&
                v1810, v1811, v1812, v1813, v1814, v1815, v1816, v1817, v1818,&
                v1819, v182, v1820, v1821, v1822, v1823, v1824, v1825, v1826,&
                v1827, v1828, v1829, v183, v1830, v1831, v1832, v1833, v1834,&
                v1835, v1836, v1837, v1838, v1839, v184, v1840, v1841, v1842,&
                v1843, v1844, v1845, v1846, v1847, v1848, v1849, v185, v1850,&
                v1851, v1852, v1853, v1854, v1855, v1856, v1857, v1858, v1859,&
                v186, v1860, v1861, v1862, v1863, v1864, v1865, v1866, v1867,&
                v1868, v1869, v187, v1870, v1871, v1872, v1873, v1874, v1875,&
                v1876, v1877, v1878, v1879, v188, v1880, v1881, v1882, v1883,&
                v1884, v1885, v1886, v1887, v1888, v1889, v189, v1890, v1891,&
                v1892, v1893, v1894, v1895, v1896, v1897, v1898, v1899, v19,&
                v190, v1900, v1901, v1902, v1903, v1904, v1905, v1906, v1907,&
                v1908, v1909, v191, v1910, v1911, v1912, v1913, v1914, v1915,&
                v1916, v1917, v1918, v1919, v192, v1920, v1921, v1922, v1923,&
                v1924, v1925, v1926, v1927, v1928, v1929, v193, v1930, v1931,&
                v1932, v1933, v194, v195, v196, v197, v198, v199, v2, v20,&
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
                v882, v883, v884, v885, v886, v887, v888, v889, v89, v890,&
                v891, v892, v893, v894, v895, v896, v897, v898, v899, v9, v90,&
                v900, v901, v902, v903, v904, v905, v906, v907, v908, v909,&
                v91, v910, v911, v912, v913, v914, v915, v916, v917, v918,&
                v919, v92, v920, v921, v922, v923, v924, v925, v926, v927,&
                v928, v929, v93, v930, v931, v932, v933, v934, v935, v936,&
                v937, v938, v939, v94, v940, v941, v942, v943, v944, v945,&
                v946, v947, v948, v949, v95, v950, v951, v952, v953, v954,&
                v955, v956, v957, v958, v959, v96, v960, v961, v962, v963,&
                v964, v965, v966, v967, v968, v969, v97, v970, v971, v972,&
                v973, v974, v975, v976, v977, v978, v979, v98, v980, v981,&
                v982, v983, v984, v985, v986, v987, v988, v989, v99, v990,&
                v991, v992, v993, v994, v995, v996, v997, v998, v999, h, u,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
                M_xxxyyzz, M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz,&
                M_xxyzzzz, M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz,&
                M_xyzzzzz, M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz,&
                M_yyzzzzz, M_yzzzzzz, M_zzzzzzz, M_xxxxxxzz, M_xxxxxyzz,&
                M_xxxxxzzz, M_xxxxyyzz, M_xxxxyzzz, M_xxxxzzzz, M_xxxyyyzz,&
                M_xxxyyzzz, M_xxxyzzzz, M_xxxzzzzz, M_xxyyyyzz, M_xxyyyzzz,&
                M_xxyyzzzz, M_xxyzzzzz, M_xxzzzzzz, M_xyyyyyzz, M_xyyyyzzz,&
                M_xyyyzzzz, M_xyyzzzzz, M_xyzzzzzz, M_xzzzzzzz, M_yyyyyyzz,&
                M_yyyyyzzz, M_yyyyzzzz, M_yyyzzzzz, M_yyzzzzzz, M_yzzzzzzz,&
                M_zzzzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz,&
                S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz, S_yyy, S_yyz,&
                S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz, S_xxzz,&
                S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy, S_yyyz, S_yyzz,&
                S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz,&
                S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz, S_xxzzz, S_xyyyy, S_xyyyz,&
                S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy, S_yyyyz, S_yyyzz, S_yyzzz,&
                S_yzzzz, S_zzzzz, S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy,&
                S_xxxxyz, S_xxxxzz, S_xxxyyy, S_xxxyyz, S_xxxyzz, S_xxxzzz,&
                S_xxyyyy, S_xxyyyz, S_xxyyzz, S_xxyzzz, S_xxzzzz, S_xyyyyy,&
                S_xyyyyz, S_xyyyzz, S_xyyzzz, S_xyzzzz, S_xzzzzz, S_yyyyyy,&
                S_yyyyyz, S_yyyyzz, S_yyyzzz, S_yyzzzz, S_yzzzzz, S_zzzzzz,&
                S_xxxxxxx, S_xxxxxxy, S_xxxxxxz, S_xxxxxyy, S_xxxxxyz,&
                S_xxxxxzz, S_xxxxyyy, S_xxxxyyz, S_xxxxyzz, S_xxxxzzz,&
                S_xxxyyyy, S_xxxyyyz, S_xxxyyzz, S_xxxyzzz, S_xxxzzzz,&
                S_xxyyyyy, S_xxyyyyz, S_xxyyyzz, S_xxyyzzz, S_xxyzzzz,&
                S_xxzzzzz, S_xyyyyyy, S_xyyyyyz, S_xyyyyzz, S_xyyyzzz,&
                S_xyyzzzz, S_xyzzzzz, S_xzzzzzz, S_yyyyyyy, S_yyyyyyz,&
                S_yyyyyzz, S_yyyyzzz, S_yyyzzzz, S_yyzzzzz, S_yzzzzzz,&
                S_zzzzzzz, S_xxxxxxxx, S_xxxxxxxy, S_xxxxxxxz, S_xxxxxxyy,&
                S_xxxxxxyz, S_xxxxxyyy, S_xxxxxyyz, S_xxxxyyyy, S_xxxxyyyz,&
                S_xxxyyyyy, S_xxxyyyyz, S_xxyyyyyy, S_xxyyyyyz, S_xyyyyyyy,&
                S_xyyyyyyz, S_yyyyyyyy, S_yyyyyyyz
#define M_0                  M(0)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define y                    r(2)
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
#define Ms_xxx               Ms(9)
#define M_xxx                M(9)
#define M_xxy                M(10)
#define Ms_xxy               Ms(10)
#define Ms_xxz               Ms(11)
#define M_xxz                M(11)
#define M_xyy                M(12)
#define Ms_xyy               Ms(12)
#define Ms_xyz               Ms(13)
#define M_xyz                M(13)
#define Ms_yyy               Ms(14)
#define M_yyy                M(14)
#define M_yyz                M(15)
#define Ms_yyz               Ms(15)
#define Ms_xxxx              Ms(16)
#define M_xxxx               M(16)
#define Ms_xxxy              Ms(17)
#define M_xxxy               M(17)
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
#define Ms_yyyy              Ms(23)
#define M_yyyy               M(23)
#define Ms_yyyz              Ms(24)
#define M_yyyz               M(24)
#define Ms_xxxxx             Ms(25)
#define M_xxxxx              M(25)
#define Ms_xxxxy             Ms(26)
#define M_xxxxy              M(26)
#define Ms_xxxxz             Ms(27)
#define M_xxxxz              M(27)
#define M_xxxyy              M(28)
#define Ms_xxxyy             Ms(28)
#define Ms_xxxyz             Ms(29)
#define M_xxxyz              M(29)
#define M_xxyyy              M(30)
#define Ms_xxyyy             Ms(30)
#define M_xxyyz              M(31)
#define Ms_xxyyz             Ms(31)
#define Ms_xyyyy             Ms(32)
#define M_xyyyy              M(32)
#define M_xyyyz              M(33)
#define Ms_xyyyz             Ms(33)
#define Ms_yyyyy             Ms(34)
#define M_yyyyy              M(34)
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
#define Ms_xxyyyz            Ms(44)
#define M_xxyyyz             M(44)
#define M_xyyyyy             M(45)
#define Ms_xyyyyy            Ms(45)
#define Ms_xyyyyz            Ms(46)
#define M_xyyyyz             M(46)
#define Ms_yyyyyy            Ms(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define Ms_yyyyyz            Ms(48)
#define M_xxxxxxx            M(49)
#define Ms_xxxxxxx           Ms(49)
#define Ms_xxxxxxy           Ms(50)
#define M_xxxxxxy            M(50)
#define M_xxxxxxz            M(51)
#define Ms_xxxxxxz           Ms(51)
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
#define M_xxyyyyz            M(59)
#define Ms_xxyyyyz           Ms(59)
#define M_xyyyyyy            M(60)
#define Ms_xyyyyyy           Ms(60)
#define M_xyyyyyz            M(61)
#define Ms_xyyyyyz           Ms(61)
#define M_yyyyyyy            M(62)
#define Ms_yyyyyyy           Ms(62)
#define Ms_yyyyyyz           Ms(63)
#define M_yyyyyyz            M(63)
#define M_xxxxxxxx           M(64)
#define Ms_xxxxxxxx          Ms(64)
#define M_xxxxxxxy           M(65)
#define Ms_xxxxxxxy          Ms(65)
#define Ms_xxxxxxxz          Ms(66)
#define M_xxxxxxxz           M(66)
#define Ms_xxxxxxyy          Ms(67)
#define M_xxxxxxyy           M(67)
#define M_xxxxxxyz           M(68)
#define Ms_xxxxxxyz          Ms(68)
#define M_xxxxxyyy           M(69)
#define Ms_xxxxxyyy          Ms(69)
#define Ms_xxxxxyyz          Ms(70)
#define M_xxxxxyyz           M(70)
#define M_xxxxyyyy           M(71)
#define Ms_xxxxyyyy          Ms(71)
#define Ms_xxxxyyyz          Ms(72)
#define M_xxxxyyyz           M(72)
#define M_xxxyyyyy           M(73)
#define Ms_xxxyyyyy          Ms(73)
#define M_xxxyyyyz           M(74)
#define Ms_xxxyyyyz          Ms(74)
#define M_xxyyyyyy           M(75)
#define Ms_xxyyyyyy          Ms(75)
#define M_xxyyyyyz           M(76)
#define Ms_xxyyyyyz          Ms(76)
#define M_xyyyyyyy           M(77)
#define Ms_xyyyyyyy          Ms(77)
#define M_xyyyyyyz           M(78)
#define Ms_xyyyyyyz          Ms(78)
#define Ms_yyyyyyyy          Ms(79)
#define M_yyyyyyyy           M(79)
#define Ms_yyyyyyyz          Ms(80)
#define M_yyyyyyyz           M(80)
    v0          = x*y
    v1          = x*z
    v2          = y*z
    v3          = v0*z
    v9          = M_x*x
    v10         = M_y*y
    v11         = -0.666666666666667d0*M_z*z
    v15         = M_xx*x
    v16         = M_xy*y
    v17         = M_xz*z
    v24         = M_xy*x
    v26         = M_yy*y
    v27         = M_yz*z
    v30         = M_xx*z
    v31         = M_xz*x
    v33         = M_yy*z
    v34         = M_yz*y
    v48         = M_xxx*x
    v49         = 1.71428571428571d0*y
    v50         = M_xxy*v49
    v51         = M_xxz*z
    v53         = 1.71428571428571d0*M_y
    v60         = 0.857142857142857d0*M_xyz
    v65         = M_xxy*x
    v68         = M_xyy*y
    v72         = 3.0d0*M_xx
    v73         = M_xxx*z
    v74         = M_xxz*x
    v76         = M_xyy*z
    v77         = 3.0d0*M_xz
    v85         = 1.71428571428571d0*M_x
    v87         = 1.71428571428571d0*x
    v88         = M_xyy*v87
    v90         = M_yyy*y
    v91         = M_yyz*z
    v95         = M_xxy*z
    v99         = M_yyy*z
    v100        = M_yyz*y
    v108        = 3.0d0*M_yz
    v119        = M_xxxx*x
    v120        = M_xxxy*y
    v121        = M_xxxz*z
    v123        = M_xxyy*x
    v134        = M_yyyy*x
    v150        = M_xxxx*y
    v151        = M_xxxy*x
    v154        = M_xxyy*y
    v155        = M_xxyz*z
    v169        = M_yyyy*y
    v174        = M_xxyy*z
    v187        = M_xxxx*z
    v188        = M_xxxz*x
    v190        = M_xxyz*y
    v200        = M_yyyy*z
    v210        = M_xyyy*y
    v211        = M_xyyz*z
    v219        = M_xxxy*z
    v221        = M_xxyz*x
    v225        = M_xyyy*z
    v226        = M_xyyz*y
    v227        = 3.0d0*M_xyz
    v237        = M_xyyy*x
    v238        = M_yyyz*z
    v241        = M_xyyz*x
    v243        = M_yyyz*y
    v250        = M_xxyyz*z
    v274        = M_xxxxx*x
    v275        = M_xxxxy*y
    v276        = M_xxxxz*z
    v278        = M_xxxyy*x
    v285        = M_xxyyy*y
    v294        = M_xyyyy*x
    v311        = M_yyyyy*y
    v312        = M_yyyyz*z
    v348        = M_xxxxx*y
    v349        = M_xxxxy*x
    v352        = M_xxxyy*y
    v353        = 1.81818181818182d0*M_xxxyz
    v356        = M_xxyyy*x
    v364        = M_xyyyy*y
    v376        = M_yyyyy*x
    v388        = 10.0d0*M_xxx
    v391        = M_xxxxx*z
    v392        = M_xxxxz*x
    v394        = M_xxxyy*z
    v395        = v353*y
    v402        = M_xxyyz*x
    v412        = M_xyyyy*z
    v416        = 5.45454545454545d0*M_xyz
    v429        = M_yyyyz*x
    v474        = M_xxxxy*z
    v475        = M_xxxxz*y
    v477        = M_xxxyz*x
    v482        = M_xxyyy*z
    v483        = M_xxyyz*y
    v502        = M_yyyyy*z
    v503        = M_yyyyz*y
    v515        = 0.545454545454545d0*z
    v518        = 0.545454545454545d0*M_z
    v522        = M_xyyyz*y
    v531        = 1.81818181818182d0*M_xyyyz
    v532        = v531*x
    v563        = M_xxxxxx*x
    v564        = M_xxxxxy*y
    v565        = M_xxxxxz*z
    v567        = M_xxxxyy*x
    v574        = M_xxxyyy*y
    v575        = M_xxxyyz*z
    v588        = M_xxyyyy*x
    v613        = M_xyyyyy*y
    v614        = M_xyyyyz*z
    v642        = M_yyyyyy*x
    v693        = M_xxxxxx*y
    v694        = M_xxxxxy*x
    v697        = M_xxxxyy*y
    v698        = M_xxxxyz*z
    v704        = M_xxxyyy*x
    v718        = M_xxyyyy*y
    v719        = M_xxyyyz*z
    v739        = M_xyyyyy*x
    v767        = M_yyyyyy*y
    v768        = M_yyyyyz*z
    v817        = M_xxxxxx*z
    v818        = M_xxxxxz*x
    v820        = M_xxxxyy*z
    v821        = 0.559440559440559d0*v820
    v822        = M_xxxxyz*y
    v828        = M_xxxyyz*x
    v839        = M_xxyyyy*z
    v840        = M_xxyyyz*y
    v863        = M_xyyyyz*x
    v893        = M_yyyyyy*z
    v894        = M_yyyyyz*y
    v950        = M_xxxyyy*z
    v993        = M_xxxxxy*z
    v994        = M_xxxxxz*y
    v996        = M_xxxxyz*x
    v1000       = M_xxxyyz*y
    v1007       = M_xxyyyz*x
    v1016       = M_xyyyyy*z
    v1017       = M_xyyyyz*y
    v1032       = M_yyyyyz*x
    v1057       = 0.909090909090909d0*M_xxxxyyz
    v1067       = 0.559440559440559d0*v839
    v1084       = 0.909090909090909d0*M_xxyyyyz
    v1152       = M_xxxxxxx*x
    v1153       = M_xxxxxxy*y
    v1154       = M_xxxxxxz*z
    v1156       = M_xxxxxyy*x
    v1163       = M_xxxxyyy*y
    v1164       = M_xxxxyyz*z
    v1174       = M_xxxyyyy*x
    v1195       = M_xxyyyyy*y
    v1196       = M_xxyyyyz*z
    v1231       = M_xyyyyyy*x
    v1273       = M_yyyyyyy*y
    v1274       = M_yyyyyyz*z
    v1314       = M_xxxyyyz*z
    v1373       = M_xxxxxxx*y
    v1374       = M_xxxxxxy*x
    v1377       = M_xxxxxyy*y
    v1378       = M_xxxxxyz*z
    v1384       = M_xxxxyyy*x
    v1398       = M_xxxyyyy*y
    v1418       = M_xxyyyyy*x
    v1448       = M_xyyyyyy*y
    v1449       = M_xyyyyyz*z
    v1486       = M_yyyyyyy*x
    v1527       = M_xxxxxxx*z
    v1528       = M_xxxxxxz*x
    v1530       = M_xxxxxyy*z
    v1531       = M_xxxxxyz*y
    v1537       = M_xxxxyyz*x
    v1548       = M_xxxyyyy*z
    v1549       = M_xxxyyyz*y
    v1573       = M_xxyyyyz*x
    v1609       = M_xyyyyyy*z
    v1610       = M_xyyyyyz*y
    v1658       = M_yyyyyyz*x
    v1737       = M_xxxxxxy*z
    v1738       = M_xxxxxxz*y
    v1740       = M_xxxxxyz*x
    v1745       = M_xxxxyyy*z
    v1746       = M_xxxxyyz*y
    v1758       = M_xxxyyyz*x
    v1778       = M_xxyyyyy*z
    v1779       = M_xxyyyyz*y
    v1812       = M_xyyyyyz*x
    v1851       = M_yyyyyyy*z
    v1852       = M_yyyyyyz*y
    Ms_0        = M_0
    Ms_x        = M_0*x + M_x
    Ms_y        = M_0*y + M_y
    Ms_z        = M_0*z + M_z
    M_zz        = -(M_xx + M_yy)
    M_xzz       = -(M_xxx + M_xyy)
    M_yzz       = -(M_xxy + M_yyy)
    M_zzz       = -(M_xxz + M_yyz)
    M_xxzz      = -(M_xxxx + M_xxyy)
    v125        = M_xxzz*x
    v141        = M_xxzz*y
    v175        = M_xxzz*z
    M_xyzz      = -(M_xxxy + M_xyyy)
    M_xzzz      = -(M_xxxz + M_xyyz)
    M_yyzz      = -(M_xxyy + M_yyyy)
    v135        = M_yyzz*x
    v144        = M_yyzz*y
    v178        = M_yyzz*z
    M_yzzz      = -(M_xxyz + M_yyyz)
    M_zzzz      = -(M_xxzz + M_yyzz)
    M_xxxzz     = -(M_xxxxx + M_xxxyy)
    v280        = M_xxxzz*x
    v325        = M_xxxzz*y
    v398        = M_xxxzz*z
    M_xxyzz     = -(M_xxxxy + M_xxyyy)
    v287        = M_xxyzz*y
    v328        = M_xxyzz*x
    v456        = M_xxyzz*z
    M_xxzzz     = -(M_xxxxz + M_xxyyz)
    v252        = M_xxzzz*z
    v407        = M_xxzzz*x
    v458        = M_xxzzz*y
    M_xyyzz     = -(M_xxxyy + M_xyyyy)
    v1912       = M_xxxzz + M_xyyzz
    v295        = M_xyyzz*x
    v334        = M_xyyzz*y
    v415        = M_xyyzz*z
    M_xyzzz     = -(M_xxxyz + M_xyyyz)
    M_xzzzz     = -v1912
    M_yyyzz     = -(M_xxyyy + M_yyyyy)
    v1913       = M_xxyzz + M_yyyzz
    v313        = M_yyyzz*y
    v338        = M_yyyzz*x
    v461        = M_yyyzz*z
    M_yyzzz     = -(M_xxyyz + M_yyyyz)
    v255        = M_yyzzz*z
    v433        = M_yyzzz*x
    v463        = M_yyzzz*y
    M_yzzzz     = -v1913
    M_zzzzz     = -(M_xxzzz + M_yyzzz)
    M_xxxxzz    = -(M_xxxxxx + M_xxxxyy)
    v569        = M_xxxxzz*x
    v700        = M_xxxxzz*y
    v825        = M_xxxxzz*z
    v938        = 0.104895104895105d0*v569
    v1064       = 0.174825174825175d0*v825
    M_xxxyzz    = -(M_xxxxxy + M_xxxyyy)
    v577        = M_xxxyzz*y
    v706        = M_xxxyzz*x
    v952        = M_xxxyzz*z
    M_xxxzzz    = -(M_xxxxxz + M_xxxyyz)
    v582        = M_xxxzzz*z
    v833        = M_xxxzzz*x
    v954        = M_xxxzzz*y
    v1066       = 0.0699300699300699d0*v833
    M_xxyyzz    = -(M_xxxxyy + M_xxyyyy)
    v590        = M_xxyyzz*x
    v660        = M_xxyyzz*y
    v789        = M_xxyyzz*z
    v790        = -1.22377622377622d0*v789
    v1068       = -0.244755244755245d0*v789
    M_xxyzzz    = -(M_xxxxyz + M_xxyyyz)
    v661        = M_xxyzzz*z
    v847        = M_xxyzzz*y
    v848        = 0.0699300699300699d0*v847
    v958        = M_xxyzzz*x
    M_xxzzzz    = -(M_xxxxzz + M_xxyyzz)
    v598        = M_xxzzzz*x
    v663        = M_xxzzzz*y
    v791        = M_xxzzzz*z
    v792        = 0.0815850815850816d0*v791
    v1069       = 0.0163170163170163d0*v791
    M_xyyyzz    = -(M_xxxyyy + M_xyyyyy)
    v615        = M_xyyyzz*y
    v740        = M_xyyyzz*x
    v965        = M_xyyyzz*z
    M_xyyzzz    = -(M_xxxyyz + M_xyyyyz)
    v1914       = M_xxxzzz + M_xyyzzz
    v620        = M_xyyzzz*z
    v867        = M_xyyzzz*x
    v967        = M_xyyzzz*y
    v1073       = 0.0699300699300699d0*v867
    M_xyzzzz    = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz    = -v1914
    M_yyyyzz    = -(M_xxyyyy + M_yyyyyy)
    v644        = M_yyyyzz*x
    v770        = M_yyyyzz*y
    v771        = 0.104895104895105d0*v770
    v898        = M_yyyyzz*z
    v899        = 0.174825174825175d0*v898
    M_yyyzzz    = -(M_xxyyyz + M_yyyyyz)
    v1915       = M_xxyzzz + M_yyyzzz
    v667        = M_yyyzzz*z
    v904        = M_yyyzzz*y
    v905        = 0.0699300699300699d0*v904
    v977        = M_yyyzzz*x
    M_yyzzzz    = -(M_xxyyzz + M_yyyyzz)
    v1931       = M_xxzzzz + M_yyzzzz
    v651        = M_yyzzzz*x
    v669        = M_yyzzzz*y
    v793        = M_yyzzzz*z
    v794        = 0.0815850815850816d0*v793
    v1076       = 0.0163170163170163d0*v793
    M_yzzzzz    = -v1915
    M_zzzzzz    = -v1931
    M_xxxxxzz   = -(M_xxxxxxx + M_xxxxxyy)
    v935        = 0.034965034965035d0*M_xxxxxzz
    v1158       = M_xxxxxzz*x
    v1380       = M_xxxxxzz*y
    v1534       = M_xxxxxzz*z
    M_xxxxyzz   = -(M_xxxxxxy + M_xxxxyyy)
    v675        = 0.27972027972028d0*M_xxxxyzz
    v1094       = M_xxxxyzz*y
    v1386       = M_xxxxyzz*x
    v1749       = M_xxxxyzz*z
    M_xxxxzzz   = -(M_xxxxxxz + M_xxxxyyz)
    v1058       = 0.034965034965035d0*M_xxxxzzz
    v1170       = M_xxxxzzz*z
    v1542       = M_xxxxzzz*x
    v1753       = M_xxxxzzz*y
    M_xxxyyzz   = -(M_xxxxxyy + M_xxxyyyy)
    v539        = -0.244755244755245d0*M_xxxyyzz
    v936        = -0.104895104895105d0*M_xxxyyzz
    v1176       = M_xxxyyzz*x
    v1400       = M_xxxyyzz*y
    v1552       = M_xxxyyzz*z
    M_xxxyzzz   = -(M_xxxxxyz + M_xxxyyyz)
    v1315       = M_xxxyzzz*z
    v1556       = M_xxxyzzz*y
    v1763       = M_xxxyzzz*x
    M_xxxzzzz   = -(M_xxxxxzz + M_xxxyyzz)
    v1183       = M_xxxzzzz*x
    v1318       = M_xxxzzzz*y
    v1566       = M_xxxzzzz*z
    M_xxyyyzz   = -(M_xxxxyyy + M_xxyyyyy)
    v676        = -0.244755244755245d0*M_xxyyyzz
    v1048       = -0.104895104895105d0*M_xxyyyzz
    v1198       = M_xxyyyzz*y
    v1420       = M_xxyyyzz*x
    v1782       = M_xxyyyzz*z
    M_xxyyzzz   = -(M_xxxxyyz + M_xxyyyyz)
    v786        = -0.244755244755245d0*M_xxyyzzz
    v1059       = -0.048951048951049d0*M_xxyyzzz
    v1101       = M_xxyyzzz*z
    v1578       = M_xxyyzzz*x
    v1705       = M_xxyyzzz*y
    M_xxyzzzz   = -(M_xxxxyzz + M_xxyyyzz)
    v1208       = M_xxyzzzz*y
    v1323       = M_xxyzzzz*x
    v1706       = M_xxyzzzz*z
    M_xxzzzzz   = -(M_xxxxzzz + M_xxyyzzz)
    v787        = 0.0116550116550117d0*M_xxzzzzz
    v1060       = 0.00233100233100233d0*M_xxzzzzz
    v1105       = M_xxzzzzz*z
    v1593       = M_xxzzzzz*x
    v1708       = M_xxzzzzz*y
    M_xyyyyzz   = -(M_xxxyyyy + M_xyyyyyy)
    v1086       = 0.27972027972028d0*M_xyyyyzz
    v1110       = M_xyyyyzz*x
    v1451       = M_xyyyyzz*y
    v1613       = M_xyyyyzz*z
    M_xyyyzzz   = -(M_xxxyyyz + M_xyyyyyz)
    v1329       = M_xyyyzzz*z
    v1617       = M_xyyyzzz*y
    v1817       = M_xyyyzzz*x
    M_xyyzzzz   = -(M_xxxyyzz + M_xyyyyzz)
    v1916       = M_xxxzzzz + M_xyyzzzz
    v1238       = M_xyyzzzz*x
    v1332       = M_xyyzzzz*y
    v1627       = M_xyyzzzz*z
    M_xyzzzzz   = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz   = -v1916
    M_yyyyyzz   = -(M_xxyyyyy + M_yyyyyyy)
    v677        = 0.034965034965035d0*M_yyyyyzz
    v1276       = M_yyyyyzz*y
    v1488       = M_yyyyyzz*x
    v1855       = M_yyyyyzz*z
    M_yyyyzzz   = -(M_xxyyyyz + M_yyyyyyz)
    v801        = 0.034965034965035d0*M_yyyyzzz
    v1281       = M_yyyyzzz*z
    v1663       = M_yyyyzzz*x
    v1859       = M_yyyyzzz*y
    M_yyyzzzz   = -(M_xxyyyzz + M_yyyyyzz)
    v1917       = M_xxyzzzz + M_yyyzzzz
    v1287       = M_yyyzzzz*y
    v1342       = M_yyyzzzz*x
    v1712       = M_yyyzzzz*z
    M_yyzzzzz   = -(M_xxyyzzz + M_yyyyzzz)
    v788        = 0.0116550116550117d0*M_yyzzzzz
    v1061       = 0.00233100233100233d0*M_yyzzzzz
    v1117       = M_yyzzzzz*z
    v1678       = M_yyzzzzz*x
    v1714       = M_yyzzzzz*y
    M_yzzzzzz   = -v1917
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
    v1918       = M_xxxyzzzz + M_xyyyzzzz
    M_xyyzzzzz  = -(M_xxxyyzzz + M_xyyyyzzz)
    v1919       = M_xxxzzzzz + M_xyyzzzzz
    M_xyzzzzzz  = -v1918
    M_xzzzzzzz  = -v1919
    M_yyyyyyzz  = -(M_xxyyyyyy + M_yyyyyyyy)
    M_yyyyyzzz  = -(M_xxyyyyyz + M_yyyyyyyz)
    M_yyyyzzzz  = -(M_xxyyyyzz + M_yyyyyyzz)
    M_yyyzzzzz  = -(M_xxyyyzzz + M_yyyyyzzz)
    v1920       = M_xxyzzzzz + M_yyyzzzzz
    M_yyzzzzzz  = -(M_xxyyzzzz + M_yyyyzzzz)
    M_yzzzzzzz  = -v1920
    M_zzzzzzzz  = -(M_xxzzzzzz + M_yyzzzzzz)
    S_0         = 1
    S_x         = x
    S_y         = y
    S_z         = z
    S_xy        = v0
    v18         = M_y*S_xy
    v23         = M_x*S_xy
    v43         = M_xy*S_xy
    v64         = M_xx*S_xy
    v70         = M_yy*S_xy
    v80         = M_yz*S_xy
    v97         = M_xz*S_xy
    v122        = M_xxy*S_xy
    v149        = M_xxx*S_xy
    v159        = M_xyy*S_xy
    v177        = M_xyz*S_xy
    v214        = M_yyy*S_xy
    v222        = M_xxz*S_xy
    v231        = M_yyz*S_xy
    v277        = M_xxxy*S_xy
    v327        = M_xxyy*S_xy
    v329        = M_xxzz*S_xy
    v339        = M_yyzz*S_xy
    v347        = M_xxxx*S_xy
    v375        = M_yyyy*S_xy
    v403        = M_xxyz*S_xy
    v448        = M_xyyy*S_xy
    v478        = M_xxxz*S_xy
    v491        = M_xyyz*S_xy
    v524        = M_yyyz*S_xy
    v566        = M_xxxxy*S_xy
    v587        = M_xxyyy*S_xy
    v592        = M_xxyzz*S_xy
    v641        = M_yyyyy*S_xy
    v645        = M_yyyzz*S_xy
    v692        = M_xxxxx*S_xy
    v703        = M_xxxyy*S_xy
    v708        = M_xxxzz*S_xy
    v738        = M_xyyyy*S_xy
    v742        = M_xyyzz*S_xy
    v829        = M_xxxyz*S_xy
    v956        = M_xxyyz*S_xy
    v960        = M_xxzzz*S_xy
    v979        = M_yyzzz*S_xy
    v997        = M_xxxxz*S_xy
    v1033       = M_yyyyz*S_xy
    v1071       = M_xyyyz*S_xy
    v1096       = M_xxxyyy*S_xy
    v1097       = M_xxxyzz*S_xy
    v1111       = M_xyyyzz*S_xy
    v1155       = M_xxxxxy*S_xy
    v1230       = M_xyyyyy*S_xy
    v1320       = M_xxyyzz*S_xy
    v1325       = M_xxzzzz*S_xy
    v1344       = M_yyzzzz*S_xy
    v1372       = M_xxxxxx*S_xy
    v1383       = M_xxxxyy*S_xy
    v1388       = M_xxxxzz*S_xy
    v1417       = M_xxyyyy*S_xy
    v1485       = M_yyyyyy*S_xy
    v1490       = M_yyyyzz*S_xy
    v1538       = M_xxxxyz*S_xy
    v1574       = M_xxyyyz*S_xy
    v1582       = M_xxyzzz*S_xy
    v1659       = M_yyyyyz*S_xy
    v1667       = M_yyyzzz*S_xy
    v1741       = M_xxxxxz*S_xy
    v1759       = M_xxxyyz*S_xy
    v1767       = M_xxxzzz*S_xy
    v1813       = M_xyyyyz*S_xy
    v1820       = M_xyyzzz*S_xy
    Ms_xy       = M_xy + M_0*S_xy + M_x*y + M_y*x
    S_xz        = v1
    v19         = M_z*S_xz
    v29         = M_x*S_xz
    v52         = M_xz*S_xz
    v79         = M_yy*S_xz
    v96         = M_xy*S_xz
    v124        = M_xxz*S_xz
    v160        = M_xyz*S_xz
    v186        = M_xxx*S_xz
    v193        = M_xyy*S_xz
    v215        = M_yyz*S_xz
    v220        = 3.0d0*S_xz
    v230        = M_yyy*S_xz
    v279        = M_xxxz*S_xz
    v357        = M_xxyz*S_xz
    v390        = M_xxxx*S_xz
    v401        = M_xxyy*S_xz
    v406        = M_xxzz*S_xz
    v428        = M_yyyy*S_xz
    v432        = M_yyzz*S_xz
    v446        = 0.242424242424242d0*v279
    v449        = M_xyyz*S_xz
    v476        = M_xxxy*S_xz
    v490        = M_xyyy*S_xz
    v517        = M_yyyz*S_xz
    v568        = M_xxxxz*S_xz
    v589        = M_xxyyz*S_xz
    v597        = M_xxzzz*S_xz
    v643        = M_yyyyz*S_xz
    v650        = M_yyzzz*S_xz
    v705        = M_xxxyz*S_xz
    v816        = M_xxxxx*S_xz
    v827        = M_xxxyy*S_xz
    v832        = M_xxxzz*S_xz
    v862        = M_xyyyy*S_xz
    v866        = M_xyyzz*S_xz
    v957        = M_xxyzz*S_xz
    v976        = M_yyyzz*S_xz
    v995        = M_xxxxy*S_xz
    v1006       = M_xxyyy*S_xz
    v1031       = M_yyyyy*S_xz
    v1049       = 0.839160839160839d0*v705
    v1051       = M_xyyyz*S_xz
    v1065       = 0.34965034965035d0*v832
    v1072       = 0.34965034965035d0*v866
    v1157       = M_xxxxxz*S_xz
    v1175       = M_xxxyyz*S_xz
    v1182       = M_xxxzzz*S_xz
    v1232       = M_xyyyyz*S_xz
    v1237       = M_xyyzzz*S_xz
    v1322       = M_xxyzzz*S_xz
    v1341       = M_yyyzzz*S_xz
    v1385       = M_xxxxyz*S_xz
    v1419       = M_xxyyyz*S_xz
    v1487       = M_yyyyyz*S_xz
    v1526       = M_xxxxxx*S_xz
    v1536       = M_xxxxyy*S_xz
    v1541       = M_xxxxzz*S_xz
    v1572       = M_xxyyyy*S_xz
    v1577       = M_xxyyzz*S_xz
    v1592       = M_xxzzzz*S_xz
    v1657       = M_yyyyyy*S_xz
    v1662       = M_yyyyzz*S_xz
    v1677       = M_yyzzzz*S_xz
    v1739       = M_xxxxxy*S_xz
    v1757       = M_xxxyyy*S_xz
    v1762       = M_xxxyzz*S_xz
    v1811       = M_xyyyyy*S_xz
    v1816       = M_xyyyzz*S_xz
    Ms_xz       = M_xz + M_0*S_xz + M_x*z + M_z*x
    S_yz        = v2
    v28         = M_z*S_yz
    v32         = M_y*S_yz
    v56         = M_yz*S_yz
    v75         = M_xy*S_yz
    v94         = M_xx*S_yz
    v107        = 3.0d0*S_yz
    v129        = M_xyz*S_yz
    v156        = M_xxz*S_yz
    v170        = M_yyz*S_yz
    v189        = M_xxy*S_yz
    v199        = M_yyy*S_yz
    v218        = M_xxx*S_yz
    v286        = M_xxyz*S_yz
    v354        = M_xxxz*S_yz
    v365        = M_xyyz*S_yz
    v393        = M_xxxy*S_yz
    v411        = M_xyyy*S_yz
    v452        = M_yyyz*S_yz
    v453        = 0.242424242424242d0*v452
    v457        = M_xxzz*S_yz
    v462        = M_yyzz*S_yz
    v473        = M_xxxx*S_yz
    v481        = M_xxyy*S_yz
    v501        = M_yyyy*S_yz
    v576        = M_xxxyz*S_yz
    v662        = M_xxzzz*S_yz
    v668        = M_yyzzz*S_yz
    v699        = M_xxxxz*S_yz
    v720        = M_xxyyz*S_yz
    v769        = M_yyyyz*S_yz
    v819        = M_xxxxy*S_yz
    v838        = M_xxyyy*S_yz
    v845        = M_xxyzz*S_yz
    v846        = 0.34965034965035d0*v845
    v892        = M_yyyyy*S_yz
    v902        = M_yyyzz*S_yz
    v903        = 0.34965034965035d0*v902
    v939        = M_xyyyz*S_yz
    v940        = 0.839160839160839d0*v939
    v953        = M_xxxzz*S_yz
    v966        = M_xyyzz*S_yz
    v992        = M_xxxxx*S_yz
    v999        = M_xxxyy*S_yz
    v1015       = M_xyyyy*S_yz
    v1165       = M_xxxxyz*S_yz
    v1197       = M_xxyyyz*S_yz
    v1207       = M_xxyzzz*S_yz
    v1275       = M_yyyyyz*S_yz
    v1286       = M_yyyzzz*S_yz
    v1317       = M_xxxzzz*S_yz
    v1331       = M_xyyzzz*S_yz
    v1379       = M_xxxxxz*S_yz
    v1399       = M_xxxyyz*S_yz
    v1450       = M_xyyyyz*S_yz
    v1529       = M_xxxxxy*S_yz
    v1547       = M_xxxyyy*S_yz
    v1555       = M_xxxyzz*S_yz
    v1608       = M_xyyyyy*S_yz
    v1616       = M_xyyyzz*S_yz
    v1704       = M_xxyyzz*S_yz
    v1707       = M_xxzzzz*S_yz
    v1713       = M_yyzzzz*S_yz
    v1736       = M_xxxxxx*S_yz
    v1744       = M_xxxxyy*S_yz
    v1752       = M_xxxxzz*S_yz
    v1777       = M_xxyyyy*S_yz
    v1850       = M_yyyyyy*S_yz
    v1858       = M_yyyyzz*S_yz
    Ms_yz       = M_yz + M_0*S_yz + M_y*z + M_z*y
    S_xyz       = v3
    v61         = 0.857142857142857d0*S_xyz
    v62         = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v61 + v60*z)
    v136        = M_yz*S_xyz
    v161        = M_xz*S_xyz
    v176        = M_xy*S_xyz
    v253        = M_xyz*S_xyz
    v358        = M_xxz*S_xyz
    v377        = M_yyz*S_xyz
    v399        = 5.45454545454545d0*S_xyz
    v400        = M_xxy*v399
    v427        = M_yyy*S_xyz
    v472        = M_xxx*S_xyz
    v530        = M_xyy*v399
    v591        = M_xxyz*S_xyz
    v707        = M_xxxz*S_xyz
    v741        = M_xyyz*S_xyz
    v826        = M_xxxy*S_xyz
    v861        = M_xyyy*S_xyz
    v943        = M_yyyz*S_xyz
    v944        = 0.839160839160839d0*v943
    v955        = M_xxyy*S_xyz
    v959        = M_xxzz*S_xyz
    v978        = M_yyzz*S_xyz
    v991        = M_xxxx*S_xyz
    v1030       = M_yyyy*S_xyz
    v1050       = 0.839160839160839d0*v707
    v1177       = M_xxxyz*S_xyz
    v1319       = M_xxyyz*S_xyz
    v1324       = M_xxzzz*S_xyz
    v1343       = M_yyzzz*S_xyz
    v1387       = M_xxxxz*S_xyz
    v1489       = M_yyyyz*S_xyz
    v1535       = M_xxxxy*S_xyz
    v1571       = M_xxyyy*S_xyz
    v1581       = M_xxyzz*S_xyz
    v1656       = M_yyyyy*S_xyz
    v1666       = M_yyyzz*S_xyz
    v1698       = M_xyyyz*S_xyz
    v1699       = 3.35664335664336d0*v1698
    v1735       = M_xxxxx*S_xyz
    v1756       = M_xxxyy*S_xyz
    v1766       = M_xxxzz*S_xyz
    v1819       = M_xyyzz*S_xyz
    v1901       = 3.35664335664336d0*v1177
    v1904       = M_xyyyy*S_xyz
    Ms_xyz      = M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v4          = a2
    a3          = a1*a2
    a4          = a2*a2
    v38         = a4
    a5          = a2*a3
    a6          = a3*a3
    v245        = a6
    a7          = a3*a4
    a8          = a4*a4
    b2          = b1*b1
    v5          = b2
    v84         = v4*v5
    v443        = v38*v5
    b3          = b1*b2
    b4          = b2*b2
    v105        = b4
    v526        = v105*v4
    b5          = b2*b3
    b6          = b3*b3
    v535        = b6
    b7          = b3*b4
    b8          = b4*b4
    c2          = c1*c1
    h           = c2 + v4 + v5
    v1921       = h*v4
    v6          = 0.333333333333333d0*h
    v7          = -v6
    v8          = v4 + v7
    v12         = v5 + v7
    v13         = -0.6d0*h
    v20         = 0.2d0*h
    v21         = -v20
    v22         = v21 + v4
    v37         = v21 + v5
    v39         = h*h
    v1922       = v39*v4
    v40         = 0.0857142857142857d0*v39
    v41         = v1921
    v58         = -0.428571428571429d0*h
    v59         = v4 + v58
    v83         = 0.142857142857143d0*h
    v93         = -v83
    v104        = v5 + v58
    v106        = h*v5
    v109        = 0.238095238095238d0*v39
    v138        = 0.0476190476190476d0*v39
    v139        = 0.666666666666667d0*v41
    v140        = -v139 + v138 + v38
    v207        = -0.111111111111111d0*v41
    v235        = 0.111111111111111d0*(-v106) + v84
    v244        = 0.333333333333333d0*(-2.0d0*v106) + v105 + v138
    v246        = h*h*h
    v247        = -0.0216450216450216d0*v246
    v248        = h*v38
    v249        = v1922
    v320        = 0.151515151515152d0*v39
    v321        = 0.0909090909090909d0*(-10.0d0*v41) + v320 + v38
    v441        = 0.545454545454545d0*v41
    v442        = -0.00432900432900433d0*(v246 + 231.0d0*v441*v5)
    v444        = 0.0303030303030303d0*v39
    v513        = -0.272727272727273d0*v41
    v514        = -0.272727272727273d0*v106
    v519        = v444 + v84
    v525        = h*v105
    v527        = v39*v5
    v534        = 0.0909090909090909d0*(-10.0d0*v106) + v105 + v320
    v538        = -0.0815850815850816d0*v246
    v658        = -0.0116550116550117d0*v246
    v659        = v245 + v658 + 0.00699300699300699d0*(-165.0d0*v248 + 45.0d0*v249)
    v930        = -0.0769230769230769d0*v248
    v931        = 0.104895104895105d0*v39
    v932        = 0.769230769230769d0*v41
    v933        = -v5*v932
    v1924       = v658 + v933
    v1042       = 0.00699300699300699d0*v246
    v1043       = -v1042
    v1044       = v1921*v5
    v1045       = -0.461538461538462d0*v1044
    v1046       = v1043 + v1045
    v1047       = 0.020979020979021d0*v527
    v1925       = v1047 + v443
    v1055       = v1045 + 0.00233100233100233d0*(-v246)
    v1082       = 0.020979020979021d0*v249
    v1927       = v1082 + v526
    v1083       = -0.0769230769230769d0*v525
    v1085       = 0.00699300699300699d0*(-165.0d0*v525 + 45.0d0*v527) + v535 + v658
    v1087       = h*h*h*h
    v1088       = 0.00543900543900544d0*v1087
    v1089       = h*v245
    v1090       = v38*v39
    v1091       = v246*v4
    v1310       = -0.048951048951049d0*v246
    v1311       = v1310 + v245 + 0.0153846153846154d0*(-91.0d0*v248 + 35.0d0*v249)
    v1693       = v1922*v5
    v1694       = 0.000777000777000777d0*(v1087 + 297.0d0*v1693)
    v1695       = 0.020979020979021d0*v246
    v1696       = v248*v5
    v1891       = 0.0769230769230769d0*v527
    v1929       = v1891 + v443
    v1892       = -v1695
    v1893       = -v20*v38
    v1894       = -v139*v5
    v1933       = v1892 + v1894
    v1896       = v1043 + v1894
    v1898       = v105*v39
    v1899       = v246*v5
    v1900       = v4*v525
    v1903       = -0.0013986013986014d0*(286.0d0*v1044 + 3.0d0*v246)
    v1906       = 0.0769230769230769d0*v249
    v1930       = v1906 + v526
    v1907       = -v105*v20
    v1908       = h*v535
    v1911       = v1310 + v535 + 0.0153846153846154d0*(-91.0d0*v525 + 35.0d0*v527)
    S_xx        = v8
    v14         = M_x*S_xx
    v35         = M_z*S_xx
    v44         = M_yy*S_xx
    v47         = M_xx*S_xx
    v66         = M_xy*S_xx
    v101        = M_yz*S_xx
    v117        = M_xxx*S_xx
    v127        = M_xyy*S_xx
    v152        = M_xxy*S_xx
    v167        = M_yyy*S_xx
    v191        = M_xxz*S_xx
    v201        = M_yyz*S_xx
    v272        = M_xxxx*S_xx
    v283        = M_xxyy*S_xx
    v289        = M_xxzz*S_xx
    v309        = M_yyyy*S_xx
    v315        = M_yyzz*S_xx
    v350        = M_xxxy*S_xx
    v362        = M_xyyy*S_xx
    v396        = M_xxxz*S_xx
    v413        = M_xyyz*S_xx
    v484        = M_xxyz*S_xx
    v504        = M_yyyz*S_xx
    v561        = M_xxxxx*S_xx
    v572        = M_xxxyy*S_xx
    v580        = M_xxxzz*S_xx
    v611        = M_xyyyy*S_xx
    v618        = M_xyyzz*S_xx
    v695        = M_xxxxy*S_xx
    v716        = M_xxyyy*S_xx
    v723        = M_xxyzz*S_xx
    v765        = M_yyyyy*S_xx
    v774        = M_yyyzz*S_xx
    v823        = M_xxxxz*S_xx
    v841        = M_xxyyz*S_xx
    v856        = M_xxzzz*S_xx
    v895        = M_yyyyz*S_xx
    v913        = M_yyzzz*S_xx
    v964        = M_xyyyz*S_xx
    v1001       = M_xxxyz*S_xx
    v1150       = M_xxxxxx*S_xx
    v1161       = M_xxxxyy*S_xx
    v1168       = M_xxxxzz*S_xx
    v1193       = M_xxyyyy*S_xx
    v1201       = M_xxyyzz*S_xx
    v1218       = M_xxzzzz*S_xx
    v1272       = M_yyyyyy*S_xx
    v1279       = M_yyyyzz*S_xx
    v1297       = M_yyzzzz*S_xx
    v1375       = M_xxxxxy*S_xx
    v1396       = M_xxxyyy*S_xx
    v1403       = M_xxxyzz*S_xx
    v1446       = M_xyyyyy*S_xx
    v1454       = M_xyyyzz*S_xx
    v1532       = M_xxxxxz*S_xx
    v1550       = M_xxxyyz*S_xx
    v1564       = M_xxxzzz*S_xx
    v1611       = M_xyyyyz*S_xx
    v1625       = M_xyyzzz*S_xx
    v1747       = M_xxxxyz*S_xx
    v1780       = M_xxyyyz*S_xx
    v1792       = M_xxyzzz*S_xx
    v1853       = M_yyyyyz*S_xx
    v1867       = M_yyyzzz*S_xx
    Ms_xx       = 0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11
    S_yy        = v12
    v25         = M_y*S_yy
    v36         = M_z*S_yy
    v42         = M_xx*S_yy
    v45         = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v43 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v42 + 4.0d0*v44))
    v55         = M_yy*S_yy
    v67         = M_xy*S_yy
    v78         = M_xz*S_yy
    v118        = M_xxx*S_yy
    v128        = M_xyy*S_yy
    v153        = M_xxy*S_yy
    v168        = M_yyy*S_yy
    v192        = M_xxz*S_yy
    v202        = M_yyz*S_yy
    v273        = M_xxxx*S_yy
    v284        = M_xxyy*S_yy
    v290        = M_xxzz*S_yy
    v310        = M_yyyy*S_yy
    v316        = M_yyzz*S_yy
    v351        = M_xxxy*S_yy
    v363        = M_xyyy*S_yy
    v397        = M_xxxz*S_yy
    v414        = M_xyyz*S_yy
    v485        = M_xxyz*S_yy
    v505        = M_yyyz*S_yy
    v562        = M_xxxxx*S_yy
    v573        = M_xxxyy*S_yy
    v581        = M_xxxzz*S_yy
    v612        = M_xyyyy*S_yy
    v619        = M_xyyzz*S_yy
    v696        = M_xxxxy*S_yy
    v717        = M_xxyyy*S_yy
    v724        = M_xxyzz*S_yy
    v766        = M_yyyyy*S_yy
    v775        = M_yyyzz*S_yy
    v824        = M_xxxxz*S_yy
    v842        = M_xxyyz*S_yy
    v857        = M_xxzzz*S_yy
    v896        = M_yyyyz*S_yy
    v897        = -0.20979020979021d0*v896
    v914        = M_yyzzz*S_yy
    v951        = M_xxxyz*S_yy
    v1018       = M_xyyyz*S_yy
    v1151       = M_xxxxxx*S_yy
    v1162       = M_xxxxyy*S_yy
    v1169       = M_xxxxzz*S_yy
    v1194       = M_xxyyyy*S_yy
    v1202       = M_xxyyzz*S_yy
    v1219       = M_xxzzzz*S_yy
    v1280       = M_yyyyzz*S_yy
    v1298       = M_yyzzzz*S_yy
    v1376       = M_xxxxxy*S_yy
    v1397       = M_xxxyyy*S_yy
    v1404       = M_xxxyzz*S_yy
    v1447       = M_xyyyyy*S_yy
    v1455       = M_xyyyzz*S_yy
    v1533       = M_xxxxxz*S_yy
    v1551       = M_xxxyyz*S_yy
    v1565       = M_xxxzzz*S_yy
    v1612       = M_xyyyyz*S_yy
    v1626       = M_xyyzzz*S_yy
    v1703       = M_yyyyyy*S_yy
    v1748       = M_xxxxyz*S_yy
    v1781       = M_xxyyyz*S_yy
    v1793       = M_xxyzzz*S_yy
    v1854       = M_yyyyyz*S_yy
    v1868       = M_yyyzzz*S_yy
    Ms_yy       = 0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11
    S_zz        = -(S_xx + S_yy)
    S_xxx       = x*(v13 + v4)
    v46         = M_x*S_xxx
    v81         = M_z*S_xxx
    v115        = M_xx*S_xxx
    v132        = M_yy*S_xxx
    v157        = M_xy*S_xxx
    v194        = M_xz*S_xxx
    v232        = M_yz*S_xxx
    v270        = M_xxx*S_xxx
    v292        = M_xyy*S_xxx
    v337        = M_yyy*S_xxx
    v355        = M_xxy*S_xxx
    v404        = 10.0d0*S_xxx
    v430        = M_yyz*S_xxx
    v492        = M_xyz*S_xxx
    v559        = M_xxxx*S_xxx
    v585        = M_xxyy*S_xxx
    v595        = M_xxzz*S_xxx
    v639        = M_yyyy*S_xxx
    v648        = M_yyzz*S_xxx
    v701        = M_xxxy*S_xxx
    v736        = M_xyyy*S_xxx
    v830        = M_xxxz*S_xxx
    v864        = M_xyyz*S_xxx
    v1034       = M_yyyz*S_xxx
    v1148       = M_xxxxx*S_xxx
    v1172       = M_xxxyy*S_xxx
    v1180       = M_xxxzz*S_xxx
    v1228       = M_xyyyy*S_xxx
    v1235       = M_xyyzz*S_xxx
    v1381       = M_xxxxy*S_xxx
    v1415       = M_xxyyy*S_xxx
    v1422       = M_xxyzz*S_xxx
    v1483       = M_yyyyy*S_xxx
    v1492       = M_yyyzz*S_xxx
    v1539       = M_xxxxz*S_xxx
    v1575       = M_xxyyz*S_xxx
    v1590       = M_xxzzz*S_xxx
    v1660       = M_yyyyz*S_xxx
    v1675       = M_yyzzz*S_xxx
    v1760       = M_xxxyz*S_xxx
    v1814       = M_xyyyz*S_xxx
    Ms_xxx      = M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19))
    S_xxy       = v22*y
    v54         = S_xxy*v53
    v63         = M_x*S_xxy
    v102        = M_z*S_xxy
    v126        = M_xy*S_xxy
    v147        = M_xx*S_xxy
    v165        = M_yy*S_xxy
    v203        = M_yz*S_xxy
    v281        = M_xxy*S_xxy
    v307        = M_yyy*S_xxy
    v333        = M_xyy*S_xxy
    v346        = M_xxx*S_xxy
    v417        = S_xxy*v416
    v486        = M_xxz*S_xxy
    v506        = M_yyz*S_xxy
    v570        = M_xxxy*S_xxy
    v609        = M_xyyy*S_xxy
    v690        = M_xxxx*S_xxy
    v714        = M_xxyy*S_xxy
    v727        = M_xxzz*S_xxy
    v763        = M_yyyy*S_xxy
    v778        = M_yyzz*S_xxy
    v843        = M_xxyz*S_xxy
    v900        = M_yyyz*S_xxy
    v1002       = M_xxxz*S_xxy
    v1019       = M_xyyz*S_xxy
    v1159       = M_xxxxy*S_xxy
    v1191       = M_xxyyy*S_xxy
    v1205       = M_xxyzz*S_xxy
    v1270       = M_yyyyy*S_xxy
    v1284       = M_yyyzz*S_xxy
    v1370       = M_xxxxx*S_xxy
    v1394       = M_xxxyy*S_xxy
    v1406       = M_xxxzz*S_xxy
    v1444       = M_xyyyy*S_xxy
    v1457       = M_xyyzz*S_xxy
    v1553       = M_xxxyz*S_xxy
    v1614       = M_xyyyz*S_xxy
    v1750       = M_xxxxz*S_xxy
    v1783       = M_xxyyz*S_xxy
    v1801       = M_xxzzz*S_xxy
    v1856       = M_yyyyz*S_xxy
    v1876       = M_yyzzz*S_xxy
    Ms_xxy      = M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v23 + 4.0d0* &
      v24 - v25 - v26 - v27 - v28))
    S_xxz       = v22*z
    v57         = M_z*S_xxz
    v71         = M_x*S_xxz
    v130        = M_xz*S_xxz
    v171        = M_yz*S_xxz
    v184        = M_xx*S_xxz
    v197        = M_yy*S_xxz
    v223        = M_xy*S_xxz
    v254        = M_yyz*S_xxz
    v288        = M_xxz*S_xxz
    v366        = M_xyz*S_xxz
    v409        = M_xyy*S_xxz
    v479        = M_xxy*S_xxz
    v500        = M_yyy*S_xxz
    v578        = M_xxxz*S_xxz
    v616        = M_xyyz*S_xxz
    v721        = M_xxyz*S_xxz
    v772        = M_yyyz*S_xxz
    v814        = M_xxxx*S_xxz
    v836        = M_xxyy*S_xxz
    v854        = M_xxzz*S_xxz
    v890        = M_yyyy*S_xxz
    v911        = M_yyzz*S_xxz
    v1014       = M_xyyy*S_xxz
    v1166       = M_xxxxz*S_xxz
    v1199       = M_xxyyz*S_xxz
    v1216       = M_xxzzz*S_xxz
    v1277       = M_yyyyz*S_xxz
    v1295       = M_yyzzz*S_xxz
    v1401       = M_xxxyz*S_xxz
    v1452       = M_xyyyz*S_xxz
    v1524       = M_xxxxx*S_xxz
    v1545       = M_xxxyy*S_xxz
    v1562       = M_xxxzz*S_xxz
    v1606       = M_xyyyy*S_xxz
    v1623       = M_xyyzz*S_xxz
    v1742       = M_xxxxy*S_xxz
    v1775       = M_xxyyy*S_xxz
    v1790       = M_xxyzz*S_xxz
    v1848       = M_yyyyy*S_xxz
    v1865       = M_yyyzz*S_xxz
    Ms_xxz      = M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v29 + v31) + 7.0d0*(v30 + v35) + 2.0d0 &
      *(-v32 + v33 - v34 + v36))
    S_xyy       = v37*x
    v69         = M_y*S_xyy
    v82         = M_z*S_xyy
    v86         = S_xyy*v85
    v116        = M_xx*S_xyy
    v133        = M_yy*S_xyy
    v158        = M_xy*S_xyy
    v195        = M_xz*S_xyy
    v271        = M_xxx*S_xyy
    v293        = M_xyy*S_xyy
    v326        = M_xxy*S_xyy
    v374        = M_yyy*S_xyy
    v405        = M_xxz*S_xyy
    v431        = M_yyz*S_xyy
    v533        = S_xyy*v416
    v560        = M_xxxx*S_xyy
    v586        = M_xxyy*S_xyy
    v596        = M_xxzz*S_xyy
    v640        = M_yyyy*S_xyy
    v649        = M_yyzz*S_xyy
    v702        = M_xxxy*S_xyy
    v737        = M_xyyy*S_xyy
    v831        = M_xxxz*S_xyy
    v865        = M_xyyz*S_xyy
    v1008       = M_xxyz*S_xyy
    v1035       = M_yyyz*S_xyy
    v1149       = M_xxxxx*S_xyy
    v1173       = M_xxxyy*S_xyy
    v1181       = M_xxxzz*S_xyy
    v1229       = M_xyyyy*S_xyy
    v1236       = M_xyyzz*S_xyy
    v1382       = M_xxxxy*S_xyy
    v1416       = M_xxyyy*S_xyy
    v1423       = M_xxyzz*S_xyy
    v1484       = M_yyyyy*S_xyy
    v1493       = M_yyyzz*S_xyy
    v1540       = M_xxxxz*S_xyy
    v1576       = M_xxyyz*S_xyy
    v1591       = M_xxzzz*S_xyy
    v1661       = M_yyyyz*S_xyy
    v1676       = M_yyzzz*S_xyy
    v1761       = M_xxxyz*S_xyy
    v1815       = M_xyyyz*S_xyy
    Ms_xyy      = M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19))
    S_xzz       = -(S_xxx + S_xyy)
    S_yyy       = y*(v13 + v5)
    v89         = M_y*S_yyy
    v103        = M_z*S_yyy
    v148        = M_xx*S_yyy
    v166        = M_yy*S_yyy
    v204        = M_yz*S_yyy
    v209        = M_xy*S_yyy
    v228        = M_xz*S_yyy
    v282        = M_xxy*S_yyy
    v308        = M_yyy*S_yyy
    v324        = M_xxx*S_yyy
    v361        = M_xyy*S_yyy
    v418        = M_xyz*S_yyy
    v487        = M_xxz*S_yyy
    v537        = 10.0d0*S_yyy
    v571        = M_xxxy*S_yyy
    v610        = M_xyyy*S_yyy
    v691        = M_xxxx*S_yyy
    v715        = M_xxyy*S_yyy
    v728        = M_xxzz*S_yyy
    v764        = M_yyyy*S_yyy
    v779        = M_yyzz*S_yyy
    v844        = M_xxyz*S_yyy
    v901        = M_yyyz*S_yyy
    v1003       = M_xxxz*S_yyy
    v1160       = M_xxxxy*S_yyy
    v1192       = M_xxyyy*S_yyy
    v1206       = M_xxyzz*S_yyy
    v1271       = M_yyyyy*S_yyy
    v1285       = M_yyyzz*S_yyy
    v1371       = M_xxxxx*S_yyy
    v1395       = M_xxxyy*S_yyy
    v1407       = M_xxxzz*S_yyy
    v1445       = M_xyyyy*S_yyy
    v1458       = M_xyyzz*S_yyy
    v1554       = M_xxxyz*S_yyy
    v1615       = M_xyyyz*S_yyy
    v1751       = M_xxxxz*S_yyy
    v1784       = M_xxyyz*S_yyy
    v1802       = M_xxzzz*S_yyy
    v1857       = M_yyyyz*S_yyy
    v1877       = M_yyzzz*S_yyy
    Ms_yyy      = M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v23 - 2.0d0*v24 + 3.0d0*v25 + &
      3.0d0*v26 - 2.0d0*v27 - 2.0d0*v28))
    S_yyz       = v37*z
    v92         = M_z*S_yyz
    v98         = M_y*S_yyz
    v172        = M_yz*S_yyz
    v185        = M_xx*S_yyz
    v198        = M_yy*S_yyz
    v212        = M_xz*S_yyz
    v224        = M_xy*S_yyz
    v251        = M_xxz*S_yyz
    v314        = M_yyz*S_yyz
    v367        = M_xyz*S_yyz
    v389        = M_xxx*S_yyz
    v410        = M_xyy*S_yyz
    v480        = M_xxy*S_yyz
    v536        = 10.0d0*S_yyz
    v579        = M_xxxz*S_yyz
    v617        = M_xyyz*S_yyz
    v722        = M_xxyz*S_yyz
    v773        = M_yyyz*S_yyz
    v815        = M_xxxx*S_yyz
    v837        = M_xxyy*S_yyz
    v855        = M_xxzz*S_yyz
    v891        = M_yyyy*S_yyz
    v912        = M_yyzz*S_yyz
    v998        = M_xxxy*S_yyz
    v1167       = M_xxxxz*S_yyz
    v1200       = M_xxyyz*S_yyz
    v1217       = M_xxzzz*S_yyz
    v1278       = M_yyyyz*S_yyz
    v1296       = M_yyzzz*S_yyz
    v1402       = M_xxxyz*S_yyz
    v1453       = M_xyyyz*S_yyz
    v1525       = M_xxxxx*S_yyz
    v1546       = M_xxxyy*S_yyz
    v1563       = M_xxxzz*S_yyz
    v1607       = M_xyyyy*S_yyz
    v1624       = M_xyyzz*S_yyz
    v1743       = M_xxxxy*S_yyz
    v1776       = M_xxyyy*S_yyz
    v1791       = M_xxyzz*S_yyz
    v1849       = M_yyyyy*S_yyz
    v1866       = M_yyyzz*S_yyz
    Ms_yyz      = M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v32 + v34) + 7.0d0*(v33 + v36) + 2.0d0 &
      *(-v29 + v30 - v31 + v35))
    S_yzz       = -(S_xxy + S_yyy)
    S_zzz       = -(S_xxz + S_yyz)
    S_xxxx      = 0.142857142857143d0*(-6.0d0*v41) + v38 + v40
    v110        = M_x*S_xxxx
    v162        = M_y*S_xxxx
    v205        = M_z*S_xxxx
    v265        = M_xx*S_xxxx
    v302        = M_yy*S_xxxx
    v359        = M_xy*S_xxxx
    v419        = M_xz*S_xxxx
    v507        = M_yz*S_xxxx
    v554        = M_xxx*S_xxxx
    v604        = M_xyy*S_xxxx
    v709        = M_xxy*S_xxxx
    v758        = M_yyy*S_xxxx
    v849        = M_xxz*S_xxxx
    v906        = M_yyz*S_xxxx
    v1020       = M_xyz*S_xxxx
    v1113       = M_yyyy*S_xxxx
    v1144       = M_xxxx*S_xxxx
    v1189       = M_xxyy*S_xxxx
    v1214       = M_xxzz*S_xxxx
    v1293       = M_yyzz*S_xxxx
    v1389       = M_xxxy*S_xxxx
    v1439       = M_xyyy*S_xxxx
    v1557       = M_xxxz*S_xxxx
    v1618       = M_xyyz*S_xxxx
    v1785       = M_xxyz*S_xxxx
    v1860       = M_yyyz*S_xxxx
    Ms_xxxx     = M_0*S_xxxx + v45 - v50 - v54 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v47 - 96.0d0*v52 + 80.0d0*(v46 + v48) - &
      60.0d0*(v51 + v57) + 24.0d0*(v55 + v56))
    S_xxxy      = v0*v59
    v131        = M_y*S_xxxy
    v146        = M_x*S_xxxy
    v233        = M_z*S_xxxy
    v291        = M_xy*S_xxxy
    v344        = M_xx*S_xxxy
    v372        = M_yy*S_xxxy
    v434        = M_yz*S_xxxy
    v493        = M_xz*S_xxxy
    v583        = M_xxy*S_xxxy
    v637        = M_yyy*S_xxxy
    v688        = M_xxx*S_xxxy
    v734        = M_xyy*S_xxxy
    v868        = M_xyz*S_xxxy
    v1036       = M_yyz*S_xxxy
    v1109       = M_xyyy*S_xxxy
    v1171       = M_xxxy*S_xxxy
    v1368       = M_xxxx*S_xxxy
    v1413       = M_xxyy*S_xxxy
    v1426       = M_xxzz*S_xxxy
    v1481       = M_yyyy*S_xxxy
    v1496       = M_yyzz*S_xxxy
    v1579       = M_xxyz*S_xxxy
    v1664       = M_yyyz*S_xxxy
    v1764       = M_xxxz*S_xxxy
    v1818       = M_xyyz*S_xxxy
    Ms_xxxy     = M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v62 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 + 5.0d0*v66 - 2.0d0*v67 &
      - 2.0d0*v68 - 2.0d0*v69 - 2.0d0*v70))
    S_xxxz      = v1*v59
    v137        = M_z*S_xxxz
    v183        = M_x*S_xxxz
    v296        = M_xz*S_xxxz
    v378        = M_yz*S_xxxz
    v386        = M_xx*S_xxxz
    v425        = M_yy*S_xxxz
    v450        = 0.242424242424242d0*v296
    v488        = M_xy*S_xxxz
    v593        = M_xxz*S_xxxz
    v646        = M_yyz*S_xxxz
    v743        = M_xyz*S_xxxz
    v812        = M_xxx*S_xxxz
    v859        = M_xyy*S_xxxz
    v1004       = M_xxy*S_xxxz
    v1029       = M_yyy*S_xxxz
    v1052       = 0.839160839160839d0*v743
    v1178       = M_xxxz*S_xxxz
    v1233       = M_xyyz*S_xxxz
    v1340       = M_yyyz*S_xxxz
    v1421       = M_xxyz*S_xxxz
    v1522       = M_xxxx*S_xxxz
    v1569       = M_xxyy*S_xxxz
    v1588       = M_xxzz*S_xxxz
    v1654       = M_yyyy*S_xxxz
    v1673       = M_yyzz*S_xxxz
    v1754       = M_xxxy*S_xxxz
    v1810       = M_xyyy*S_xxxz
    Ms_xxxz     = 0.142857142857143d0*(15.0d0*(v71 + v74) + 13.0d0*(v73 + v81) + 6.0d0*( &
      -v75 + v76 + v78 + v79 - v80 + v82)) + M_0*S_xxxz + M_xxxz - M_y* &
      v61 + S_xx*v77 + S_xz*v72 - v60*y
    S_xxyy      = 0.0285714285714286d0*v39 - v4*v83 - v5*v83 + v84
    v111        = M_x*S_xxyy
    v163        = M_y*S_xxyy
    v179        = M_z*S_xxyy
    v266        = M_xx*S_xxyy
    v303        = M_yy*S_xxyy
    v330        = M_xy*S_xxyy
    v420        = M_xz*S_xxyy
    v508        = M_yz*S_xxyy
    v555        = M_xxx*S_xxyy
    v605        = M_xyy*S_xxyy
    v710        = M_xxy*S_xxyy
    v759        = M_yyy*S_xxyy
    v850        = M_xxz*S_xxyy
    v907        = M_yyz*S_xxyy
    v968        = M_xyz*S_xxyy
    v1098       = M_xxyy*S_xxyy
    v1102       = M_xxzz*S_xxyy
    v1114       = M_yyzz*S_xxyy
    v1145       = M_xxxx*S_xxyy
    v1266       = M_yyyy*S_xxyy
    v1390       = M_xxxy*S_xxyy
    v1440       = M_xyyy*S_xxyy
    v1558       = M_xxxz*S_xxyy
    v1619       = M_xyyz*S_xxyy
    v1786       = M_xxyz*S_xxyy
    v1861       = M_yyyz*S_xxyy
    Ms_xxyy     = 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v43 + 39.0d0*(v42 + v44) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v46 + 12.0d0*v47 + &
      10.0d0*v48 + 10.0d0*v51 + 12.0d0*v52 + 12.0d0*v55 + 12.0d0*v56 + &
      10.0d0*v57 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91 + 10.0d0*v92)) &
      + M_0*S_xxyy + v50 + v54 + v86 + v88
    S_xxyz      = v2*(v4 + v93)
    v173        = M_z*S_xxyz
    v196        = M_y*S_xxyz
    v217        = M_x*S_xxyz
    v317        = M_yz*S_xxyz
    v368        = M_xz*S_xxyz
    v408        = M_xy*S_xxyz
    v470        = M_xx*S_xxyz
    v498        = M_yy*S_xxyz
    v621        = M_xyz*S_xxyz
    v725        = M_xxz*S_xxyz
    v776        = M_yyz*S_xxyz
    v834        = M_xxy*S_xxyz
    v888        = M_yyy*S_xxyz
    v1012       = M_xyy*S_xxyz
    v1203       = M_xxyz*S_xxyz
    v1282       = M_yyyz*S_xxyz
    v1330       = M_xyyz*S_xxyz
    v1405       = M_xxxz*S_xxyz
    v1543       = M_xxxy*S_xxyz
    v1604       = M_xyyy*S_xxyz
    v1733       = M_xxxx*S_xxyz
    v1773       = M_xxyy*S_xxyz
    v1799       = M_xxzz*S_xxyz
    v1846       = M_yyyy*S_xxyz
    v1874       = M_yyzz*S_xxyz
    Ms_xxyz     = 0.142857142857143d0*(12.0d0*(v96 + v97) + 2.0d0*(-v100 + v103 - v98 + &
      v99) + 9.0d0*(v101 + v102 + v94 + v95)) + M_0*S_xxyz + M_xxyz + &
      M_xxz*y + M_xyz*v87 + M_y*S_xxz + S_xyz*v85
    S_xxzz      = -(S_xxxx + S_xxyy)
    v112        = M_x*S_xxzz
    v142        = M_y*S_xxzz
    v180        = M_z*S_xxzz
    v267        = M_xx*S_xxzz
    v304        = M_yy*S_xxzz
    v331        = M_xy*S_xxzz
    v421        = M_xz*S_xxzz
    v464        = M_yz*S_xxzz
    v556        = M_xxx*S_xxzz
    v606        = M_xyy*S_xxzz
    v711        = M_xxy*S_xxzz
    v760        = M_yyy*S_xxzz
    v851        = M_xxz*S_xxzz
    v908        = M_yyz*S_xxzz
    v969        = M_xyz*S_xxzz
    v1099       = M_xxyy*S_xxzz
    v1103       = M_xxzz*S_xxzz
    v1115       = M_yyzz*S_xxzz
    v1146       = M_xxxx*S_xxzz
    v1267       = M_yyyy*S_xxzz
    v1391       = M_xxxy*S_xxzz
    v1441       = M_xyyy*S_xxzz
    v1559       = M_xxxz*S_xxzz
    v1620       = M_xyyz*S_xxzz
    v1787       = M_xxyz*S_xxzz
    v1862       = M_yyyz*S_xxzz
    S_xyyy      = v0*v104
    v213        = M_y*S_xyyy
    v234        = M_z*S_xyyy
    v236        = M_x*S_xyyy
    v345        = M_xx*S_xyyy
    v373        = M_yy*S_xyyy
    v435        = M_yz*S_xyyy
    v447        = M_xy*S_xyyy
    v494        = M_xz*S_xyyy
    v584        = M_xxy*S_xyyy
    v638        = M_yyy*S_xyyy
    v689        = M_xxx*S_xyyy
    v735        = M_xyy*S_xyyy
    v869        = M_xyz*S_xyyy
    v1009       = M_xxz*S_xyyy
    v1095       = M_xxxy*S_xyyy
    v1227       = M_xyyy*S_xyyy
    v1369       = M_xxxx*S_xyyy
    v1414       = M_xxyy*S_xyyy
    v1427       = M_xxzz*S_xyyy
    v1482       = M_yyyy*S_xyyy
    v1497       = M_yyzz*S_xyyy
    v1580       = M_xxyz*S_xyyy
    v1665       = M_yyyz*S_xyyy
    v1765       = M_xxxz*S_xyyy
    v1910       = M_xyyz*S_xyyy
    Ms_xyyy     = M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v62 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 - 2.0d0*v66 + 5.0d0*v67 &
      + 5.0d0*v68 + 5.0d0*v69 + 5.0d0*v70))
    S_xyyz      = v1*(v5 + v93)
    v216        = M_z*S_xyyz
    v229        = M_y*S_xyyz
    v240        = M_x*S_xyyz
    v379        = M_yz*S_xyyz
    v387        = M_xx*S_xyyz
    v426        = M_yy*S_xyyz
    v451        = M_xz*S_xyyz
    v489        = M_xy*S_xyyz
    v594        = M_xxz*S_xyyz
    v647        = M_yyz*S_xyyz
    v744        = M_xyz*S_xyyz
    v813        = M_xxx*S_xyyz
    v860        = M_xyy*S_xyyz
    v1005       = M_xxy*S_xyyz
    v1179       = M_xxxz*S_xyyz
    v1234       = M_xyyz*S_xyyz
    v1321       = M_xxyz*S_xyyz
    v1491       = M_yyyz*S_xyyz
    v1523       = M_xxxx*S_xyyz
    v1570       = M_xxyy*S_xyyz
    v1589       = M_xxzz*S_xyyz
    v1655       = M_yyyy*S_xyyz
    v1674       = M_yyzz*S_xyyz
    v1755       = M_xxxy*S_xyyz
    v1909       = M_xyyy*S_xyyz
    Ms_xyyz     = 0.142857142857143d0*(12.0d0*(v75 + v80) + 2.0d0*(-v71 + v73 - v74 + v81 &
      ) + 9.0d0*(v76 + v78 + v79 + v82)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v49 + M_yyz*x + S_xyz*v53
    S_xyzz      = -(S_xxxy + S_xyyy)
    S_xzzz      = -(S_xxxz + S_xyyz)
    S_yyyy      = 0.142857142857143d0*(-6.0d0*v106) + v105 + v40
    v113        = M_x*S_yyyy
    v164        = M_y*S_yyyy
    v206        = M_z*S_yyyy
    v268        = M_xx*S_yyyy
    v305        = M_yy*S_yyyy
    v360        = M_xy*S_yyyy
    v422        = M_xz*S_yyyy
    v509        = M_yz*S_yyyy
    v557        = M_xxx*S_yyyy
    v607        = M_xyy*S_yyyy
    v712        = M_xxy*S_yyyy
    v761        = M_yyy*S_yyyy
    v852        = M_xxz*S_yyyy
    v909        = M_yyz*S_yyyy
    v1021       = M_xyz*S_yyyy
    v1093       = M_xxxx*S_yyyy
    v1190       = M_xxyy*S_yyyy
    v1215       = M_xxzz*S_yyyy
    v1268       = M_yyyy*S_yyyy
    v1294       = M_yyzz*S_yyyy
    v1392       = M_xxxy*S_yyyy
    v1442       = M_xyyy*S_yyyy
    v1560       = M_xxxz*S_yyyy
    v1621       = M_xyyz*S_yyyy
    v1788       = M_xxyz*S_yyyy
    v1863       = M_yyyz*S_yyyy
    Ms_yyyy     = M_0*S_yyyy + v45 - v86 - v88 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v55 - 96.0d0*v56 + 24.0d0*(v47 + v52) + &
      80.0d0*(v89 + v90) - 60.0d0*(v91 + v92))
    S_yyyz      = v104*v2
    v239        = M_z*S_yyyz
    v242        = M_y*S_yyyz
    v454        = M_yz*S_yyyz
    v455        = 0.242424242424242d0*v454
    v471        = M_xx*S_yyyz
    v499        = M_yy*S_yyyz
    v516        = M_xz*S_yyyz
    v521        = M_xy*S_yyyz
    v726        = M_xxz*S_yyyz
    v777        = M_yyz*S_yyyz
    v835        = M_xxy*S_yyyz
    v889        = M_yyy*S_yyyz
    v941        = M_xyz*S_yyyz
    v942        = 0.839160839160839d0*v941
    v990        = M_xxx*S_yyyz
    v1013       = M_xyy*S_yyyz
    v1204       = M_xxyz*S_yyyz
    v1283       = M_yyyz*S_yyyz
    v1316       = M_xxxz*S_yyyz
    v1456       = M_xyyz*S_yyyz
    v1544       = M_xxxy*S_yyyz
    v1605       = M_xyyy*S_yyyz
    v1734       = M_xxxx*S_yyyz
    v1774       = M_xxyy*S_yyyz
    v1800       = M_xxzz*S_yyyz
    v1847       = M_yyyy*S_yyyz
    v1875       = M_yyzz*S_yyyz
    Ms_yyyz     = 0.142857142857143d0*(15.0d0*(v100 + v98) + 13.0d0*(v103 + v99) + 6.0d0*( &
      v101 + v102 + v94 + v95 - v96 - v97)) + M_0*S_yyyz - M_x*v61 + &
      M_yy*v107 + M_yyyz + S_yy*v108 - v60*x
    S_yyzz      = -(S_xxyy + S_yyyy)
    v114        = M_x*S_yyzz
    v143        = M_y*S_yyzz
    v145        = -0.0476190476190476d0*(M_yyyyy + v141 + v142 + v143 + v144 + v1913)
    v181        = M_z*S_yyzz
    v182        = 0.0476190476190476d0*(18.0d0*(v174 + v179) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v175 + 48.0d0*v176 + 48.0d0*v177 + 5.0d0*v178 + &
      5.0d0*v180 + 5.0d0*v181))
    v208        = -0.0476190476190476d0*(M_xxxxx + v112 + v114 + v125 + v135 + v1912)
    v269        = M_xx*S_yyzz
    v306        = M_yy*S_yyzz
    v332        = M_xy*S_yyzz
    v423        = M_xz*S_yyzz
    v465        = M_yz*S_yyzz
    v558        = M_xxx*S_yyzz
    v608        = M_xyy*S_yyzz
    v713        = M_xxy*S_yyzz
    v762        = M_yyy*S_yyzz
    v853        = M_xxz*S_yyzz
    v910        = M_yyz*S_yyzz
    v970        = M_xyz*S_yyzz
    v1100       = M_xxyy*S_yyzz
    v1104       = M_xxzz*S_yyzz
    v1116       = M_yyzz*S_yyzz
    v1147       = M_xxxx*S_yyzz
    v1269       = M_yyyy*S_yyzz
    v1393       = M_xxxy*S_yyzz
    v1443       = M_xyyy*S_yyzz
    v1561       = M_xxxz*S_yyzz
    v1622       = M_xyyz*S_yyzz
    v1789       = M_xxyz*S_yyzz
    v1864       = M_yyyz*S_yyzz
    S_yzzz      = -(S_xxyz + S_yyyz)
    S_zzzz      = -(S_xxzz + S_yyzz)
    S_xxxxx     = x*(0.111111111111111d0*(-10.0d0*v41) + v109 + v38)
    v260        = M_x*S_xxxxx
    v369        = M_y*S_xxxxx
    v436        = M_z*S_xxxxx
    v549        = M_xx*S_xxxxx
    v632        = M_yy*S_xxxxx
    v729        = M_xy*S_xxxxx
    v870        = M_xz*S_xxxxx
    v1037       = M_yz*S_xxxxx
    v1139       = M_xxx*S_xxxxx
    v1222       = M_xyy*S_xxxxx
    v1408       = M_xxy*S_xxxxx
    v1476       = M_yyy*S_xxxxx
    v1583       = M_xxz*S_xxxxx
    v1668       = M_yyz*S_xxxxx
    v1821       = M_xyz*S_xxxxx
    Ms_xxxxx    = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v110 + v119) + 330.0d0*(v115 + v117) - 30.0d0*(M_xxxyy + v111 + &
      v123) + 60.0d0*(v116 + v118 + v127 + v132) - 140.0d0*(v120 + v121 &
      + v131 + v137) - 300.0d0*(v122 + v124 + v126 + v130) + 120.0d0*( &
      v128 + v129 + v133 + v136) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v112 + v113 + v114 + v125 + v134 + v135))
    S_xxxxy     = v140*y
    v297        = M_y*S_xxxxy
    v341        = M_x*S_xxxxy
    v510        = M_z*S_xxxxy
    v599        = M_xy*S_xxxxy
    v683        = M_xx*S_xxxxy
    v753        = M_yy*S_xxxxy
    v915        = M_yz*S_xxxxy
    v1022       = M_xz*S_xxxxy
    v1184       = M_xxy*S_xxxxy
    v1261       = M_yyy*S_xxxxy
    v1363       = M_xxx*S_xxxxy
    v1434       = M_xyy*S_xxxxy
    v1628       = M_xyz*S_xxxxy
    v1794       = M_xxz*S_xxxxy
    v1869       = M_yyz*S_xxxxy
    Ms_xxxxy    = M_0*S_xxxxy + v145 + 0.0476190476190476d0*(78.0d0*(v147 + v152) + 4.0d0* &
      (v148 + v167) + 20.0d0*(M_xxxxy + v150 + v162) + 56.0d0*(v146 + &
      v149 + v151 + v157) + 8.0d0*(v166 + v168 + v170 + v172) - (2.0d0* &
      M_xxyyy + 24.0d0*v153 + 30.0d0*v154 + 28.0d0*v155 + 28.0d0*v156 + &
      48.0d0*v158 + 48.0d0*v159 + 48.0d0*v160 + 48.0d0*v161 + 30.0d0* &
      v163 + v164 + 24.0d0*v165 + v169 + 28.0d0*v171 + 28.0d0*v173))
    S_xxxxz     = v140*z
    v318        = M_z*S_xxxxz
    v381        = M_x*S_xxxxz
    v495        = M_y*S_xxxxz
    v622        = M_xz*S_xxxxz
    v780        = M_yz*S_xxxxz
    v807        = M_xx*S_xxxxz
    v882        = M_yy*S_xxxxz
    v1010       = M_xy*S_xxxxz
    v1056       = -0.20979020979021d0*(v807 + v823)
    v1209       = M_xxz*S_xxxxz
    v1288       = M_yyz*S_xxxxz
    v1459       = M_xyz*S_xxxxz
    v1517       = M_xxx*S_xxxxz
    v1599       = M_xyy*S_xxxxz
    v1768       = M_xxy*S_xxxxz
    v1841       = M_yyy*S_xxxxz
    Ms_xxxxz    = M_0*S_xxxxz + v182 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v183 &
      + v188) + 106.0d0*(v184 + v191) + 4.0d0*(v185 + v201) + 104.0d0*( &
      v186 + v194) + 44.0d0*(v187 + v205) + 32.0d0*(v192 + v197) + &
      48.0d0*(v193 + v195) + 8.0d0*(v198 + v202) - (M_yyyyz + 36.0d0* &
      v189 + 28.0d0*v190 + 28.0d0*v196 + 8.0d0*v199 + 5.0d0*v200 + &
      36.0d0*v203 + 8.0d0*v204 + 5.0d0*v206))
    S_xxxyy     = x*(-v5*v6 + v138 + v207 + v84)
    v261        = M_x*S_xxxyy
    v370        = M_y*S_xxxyy
    v437        = M_z*S_xxxyy
    v550        = M_xx*S_xxxyy
    v633        = M_yy*S_xxxyy
    v730        = M_xy*S_xxxyy
    v871        = M_xz*S_xxxyy
    v1038       = M_yz*S_xxxyy
    v1140       = M_xxx*S_xxxyy
    v1223       = M_xyy*S_xxxyy
    v1409       = M_xxy*S_xxxyy
    v1477       = M_yyy*S_xxxyy
    v1584       = M_xxz*S_xxxyy
    v1669       = M_yyz*S_xxxyy
    v1822       = M_xyz*S_xxxyy
    Ms_xxxyy    = M_0*S_xxxyy + v208 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v110 &
      + v119) + 141.0d0*(v111 + v123) + 159.0d0*(v116 + v127) + 75.0d0* &
      (v118 + v132) + 112.0d0*(v120 + v131) - 14.0d0*(v121 + v137) + &
      276.0d0*(v122 + v126) - 3.0d0*(M_xyyyy + v113 + v134) - 18.0d0*( &
      v115 + v117 + v124 + v130) - 60.0d0*(v128 + v129 + v133 + v136) - &
      42.0d0*(v209 + v210 + v211 + v212 + v213 + v214 + v215 + v216))
    S_xxxyz     = v3*v8
    v380        = 1.81818181818182d0*S_xxxyz
    v424        = M_y*v380
    v469        = M_x*S_xxxyz
    v652        = M_yz*S_xxxyz
    v745        = M_xz*S_xxxyz
    v858        = M_xy*S_xxxyz
    v975        = M_yy*S_xxxyz
    v989        = M_xx*S_xxxyz
    v1053       = 0.839160839160839d0*v745
    v1239       = M_xyz*S_xxxyz
    v1424       = M_xxz*S_xxxyz
    v1494       = M_yyz*S_xxxyz
    v1567       = M_xxy*S_xxxyz
    v1652       = M_yyy*S_xxxyz
    v1731       = M_xxx*S_xxxyz
    v1808       = M_xyy*S_xxxyz
    v1902       = 3.35664335664336d0*v1239
    Ms_xxxyz    = 0.333333333333333d0*(7.0d0*(v217 + v221 + v222 + v223) + 5.0d0*(v218 + &
      v219 + v232 + v233) + 2.0d0*(-v224 + v225 - v226 + v228 - v229 + &
      v230 - v231 + v234)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy* &
      v220 + M_y*S_xxxz + S_xx*v227 + S_xxy*v77 + S_xyz*v72
    S_xxxzz     = -(S_xxxxx + S_xxxyy)
    v262        = M_x*S_xxxzz
    v335        = M_y*S_xxxzz
    v438        = M_z*S_xxxzz
    v551        = M_xx*S_xxxzz
    v634        = M_yy*S_xxxzz
    v731        = M_xy*S_xxxzz
    v872        = M_xz*S_xxxzz
    v980        = M_yz*S_xxxzz
    v1074       = 0.34965034965035d0*v872
    v1141       = M_xxx*S_xxxzz
    v1224       = M_xyy*S_xxxzz
    v1410       = M_xxy*S_xxxzz
    v1478       = M_yyy*S_xxxzz
    v1585       = M_xxz*S_xxxzz
    v1670       = M_yyz*S_xxxzz
    v1823       = M_xyz*S_xxxzz
    S_xxyyy     = y*(-v4*v6 + v138 + v235)
    v298        = M_y*S_xxyyy
    v342        = M_x*S_xxyyy
    v511        = M_z*S_xxyyy
    v600        = M_xy*S_xxyyy
    v684        = M_xx*S_xxyyy
    v754        = M_yy*S_xxyyy
    v916        = M_yz*S_xxyyy
    v1023       = M_xz*S_xxyyy
    v1185       = M_xxy*S_xxyyy
    v1262       = M_yyy*S_xxyyy
    v1364       = M_xxx*S_xxyyy
    v1435       = M_xyy*S_xxyyy
    v1629       = M_xyz*S_xxyyy
    v1795       = M_xxz*S_xxyyy
    v1870       = M_yyz*S_xxyyy
    Ms_xxyyy    = M_0*S_xxyyy + v145 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v148 &
      + v167) + 159.0d0*(v153 + v165) + 141.0d0*(v154 + v163) + 276.0d0 &
      *(v158 + v159) - 17.0d0*(v164 + v169) + 112.0d0*(v236 + v237) - &
      14.0d0*(v238 + v239) - 3.0d0*(M_xxxxy + v150 + v162) - 60.0d0*( &
      v147 + v152 + v160 + v161) - 18.0d0*(v166 + v168 + v170 + v172) - &
      42.0d0*(v146 + v149 + v151 + v155 + v156 + v157 + v171 + v173))
    S_xxyyz     = z*(0.0158730158730159d0*v39 + v207 + v235)
    v256        = M_z*S_xxyyz
    v382        = M_x*S_xxyyz
    v496        = M_y*S_xxyyz
    v623        = M_xz*S_xxyyz
    v781        = M_yz*S_xxyyz
    v808        = M_xx*S_xxyyz
    v883        = M_yy*S_xxyyz
    v961        = M_xy*S_xxyyz
    v1210       = M_xxz*S_xxyyz
    v1289       = M_yyz*S_xxyyz
    v1333       = M_xyz*S_xxyyz
    v1518       = M_xxx*S_xxyyz
    v1600       = M_xyy*S_xxyyz
    v1769       = M_xxy*S_xxyyz
    v1842       = M_yyy*S_xxyyz
    Ms_xxyyz    = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v176 + v177) + 6.0d0*(v186 + v194 + v199 + v204) + 9.0d0*(v187 + &
      v200 + v205 + v206) + 132.0d0*(v189 + v193 + v195 + v203) + &
      112.0d0*(v190 + v196 + v240 + v241) + 81.0d0*(v174 + v179 + v185 &
      + v192 + v197 + v201) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v175 + 5.0d0*v178 + 5.0d0*v180 + 5.0d0*v181 + 14.0d0*v183 + &
      6.0d0*v184 + 14.0d0*v188 + 6.0d0*v191 + 6.0d0*v198 + 6.0d0*v202 + &
      14.0d0*v242 + 14.0d0*v243))
    S_xxyzz     = -(S_xxxxy + S_xxyyy)
    v299        = M_y*S_xxyzz
    v322        = M_x*S_xxyzz
    v466        = M_z*S_xxyzz
    v601        = M_xy*S_xxyzz
    v685        = M_xx*S_xxyzz
    v755        = M_yy*S_xxyzz
    v917        = M_yz*S_xxyzz
    v918        = 0.34965034965035d0*v917
    v971        = M_xz*S_xxyzz
    v1186       = M_xxy*S_xxyzz
    v1263       = M_yyy*S_xxyzz
    v1365       = M_xxx*S_xxyzz
    v1436       = M_xyy*S_xxyzz
    v1630       = M_xyz*S_xxyzz
    v1796       = M_xxz*S_xxyzz
    v1871       = M_yyz*S_xxyzz
    S_xxzzz     = -(S_xxxxz + S_xxyyz)
    v257        = M_z*S_xxzzz
    v383        = M_x*S_xxzzz
    v459        = M_y*S_xxzzz
    v624        = M_xz*S_xxzzz
    v670        = M_yz*S_xxzzz
    v809        = M_xx*S_xxzzz
    v884        = M_yy*S_xxzzz
    v962        = M_xy*S_xxzzz
    v1211       = M_xxz*S_xxzzz
    v1290       = M_yyz*S_xxzzz
    v1334       = M_xyz*S_xxzzz
    v1519       = M_xxx*S_xxzzz
    v1601       = M_xyy*S_xxzzz
    v1770       = M_xxy*S_xxzzz
    v1843       = M_yyy*S_xxzzz
    S_xyyyy     = v244*x
    v263        = M_x*S_xyyyy
    v371        = M_y*S_xyyyy
    v439        = M_z*S_xyyyy
    v552        = M_xx*S_xyyyy
    v635        = M_yy*S_xyyyy
    v732        = M_xy*S_xyyyy
    v873        = M_xz*S_xyyyy
    v1039       = M_yz*S_xyyyy
    v1142       = M_xxx*S_xyyyy
    v1225       = M_xyy*S_xyyyy
    v1411       = M_xxy*S_xyyyy
    v1479       = M_yyy*S_xyyyy
    v1586       = M_xxz*S_xyyyy
    v1671       = M_yyz*S_xyyyy
    v1905       = M_xyz*S_xyyyy
    Ms_xyyyy    = M_0*S_xyyyy + v208 + 0.0476190476190476d0*(4.0d0*(v118 + v132) + 78.0d0* &
      (v128 + v133) + 20.0d0*(M_xyyyy + v113 + v134) + 8.0d0*(v115 + &
      v117 + v124 + v130) + 56.0d0*(v209 + v210 + v213 + v214) - (2.0d0 &
      *M_xxxyy + v110 + 30.0d0*v111 + 24.0d0*v116 + v119 + 48.0d0*v122 &
      + 30.0d0*v123 + 48.0d0*v126 + 24.0d0*v127 + 48.0d0*v129 + 48.0d0* &
      v136 + 28.0d0*v211 + 28.0d0*v212 + 28.0d0*v215 + 28.0d0*v216))
    S_xyyyz     = v12*v3
    v523        = M_y*S_xyyyz
    v528        = 1.81818181818182d0*S_xyyyz
    v529        = M_x*v528
    v945        = M_yz*S_xyyyz
    v946        = 0.839160839160839d0*v945
    v949        = M_xx*S_xyyyz
    v1028       = M_yy*S_xyyyz
    v1054       = M_xz*S_xyyyz
    v1070       = M_xy*S_xyyyz
    v1425       = M_xxz*S_xyyyz
    v1495       = M_yyz*S_xyyyz
    v1568       = M_xxy*S_xyyyz
    v1653       = M_yyy*S_xyyyz
    v1700       = M_xyz*S_xyyyz
    v1701       = 3.35664335664336d0*v1700
    v1732       = M_xxx*S_xyyyz
    v1809       = M_xyy*S_xyyyz
    Ms_xyyyz    = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v224 + v226 + v229 + v231 &
      ) + 5.0d0*(v225 + v228 + v230 + v234) + 2.0d0*(-v217 + v218 + &
      v219 - v221 - v222 - v223 + v232 + v233)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v107 + M_xyyyz + M_yyyz*x + S_xyy*v108 + S_yy*v227
    S_xyyzz     = -(S_xxxyy + S_xyyyy)
    v264        = M_x*S_xyyzz
    v336        = M_y*S_xyyzz
    v440        = M_z*S_xyyzz
    v553        = M_xx*S_xyyzz
    v636        = M_yy*S_xyyzz
    v733        = M_xy*S_xyyzz
    v874        = M_xz*S_xyyzz
    v981        = M_yz*S_xyyzz
    v1075       = 0.34965034965035d0*v874
    v1143       = M_xxx*S_xyyzz
    v1226       = M_xyy*S_xyyzz
    v1412       = M_xxy*S_xyyzz
    v1480       = M_yyy*S_xyyzz
    v1587       = M_xxz*S_xyyzz
    v1672       = M_yyz*S_xyyzz
    v1824       = M_xyz*S_xyyzz
    S_xyzzz     = -(S_xxxyz + S_xyyyz)
    S_xzzzz     = -(S_xxxzz + S_xyyzz)
    S_yyyyy     = y*(0.111111111111111d0*(-10.0d0*v106) + v105 + v109)
    v300        = M_y*S_yyyyy
    v343        = M_x*S_yyyyy
    v512        = M_z*S_yyyyy
    v602        = M_xy*S_yyyyy
    v686        = M_xx*S_yyyyy
    v756        = M_yy*S_yyyyy
    v919        = M_yz*S_yyyyy
    v1024       = M_xz*S_yyyyy
    v1187       = M_xxy*S_yyyyy
    v1264       = M_yyy*S_yyyyy
    v1366       = M_xxx*S_yyyyy
    v1437       = M_xyy*S_yyyyy
    v1631       = M_xyz*S_yyyyy
    v1797       = M_xxz*S_yyyyy
    v1872       = M_yyz*S_yyyyy
    Ms_yyyyy    = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v164 + v169) + 330.0d0*(v166 + v168) - 30.0d0*(M_xxyyy + v154 + &
      v163) + 120.0d0*(v147 + v152 + v160 + v161) + 60.0d0*(v148 + v153 &
      + v165 + v167) - 300.0d0*(v158 + v159 + v170 + v172) - 140.0d0*( &
      v236 + v237 + v238 + v239) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v141 + v142 + v143 + v144 + v150 + v162))
    S_yyyyz     = v244*z
    v319        = M_z*S_yyyyz
    v384        = M_x*S_yyyyz
    v497        = M_y*S_yyyyz
    v625        = M_xz*S_yyyyz
    v782        = M_yz*S_yyyyz
    v810        = M_xx*S_yyyyz
    v885        = M_yy*S_yyyyz
    v886        = -0.20979020979021d0*v885
    v1932       = v886 + v897
    v1011       = M_xy*S_yyyyz
    v1212       = M_xxz*S_yyyyz
    v1291       = M_yyz*S_yyyyz
    v1460       = M_xyz*S_yyyyz
    v1520       = M_xxx*S_yyyyz
    v1602       = M_xyy*S_yyyyz
    v1771       = M_xxy*S_yyyyz
    v1844       = M_yyy*S_yyyyz
    Ms_yyyyz    = M_0*S_yyyyz + v182 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v184 &
      + v191) + 32.0d0*(v185 + v201) + 48.0d0*(v189 + v203) + 4.0d0*( &
      v192 + v197) + 106.0d0*(v198 + v202) + 104.0d0*(v199 + v204) + &
      44.0d0*(v200 + v206) + 56.0d0*(v242 + v243) - (M_xxxxz + 8.0d0* &
      v186 + 5.0d0*v187 + 36.0d0*v193 + 8.0d0*v194 + 36.0d0*v195 + &
      5.0d0*v205 + 28.0d0*v240 + 28.0d0*v241))
    S_yyyzz     = -(S_xxyyy + S_yyyyy)
    v301        = M_y*S_yyyzz
    v323        = M_x*S_yyyzz
    v340        = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz - &
      v322 - v323 + 4.0d0*v324 - v325 - 24.0d0*v326 - 30.0d0*v327 - &
      v328 - v329 - 30.0d0*v330 - v331 - v332 - 24.0d0*v333 - v334 - &
      v335 - v336 + 4.0d0*v337 - v338 - v339))
    v467        = M_z*S_yyyzz
    v603        = M_xy*S_yyyzz
    v687        = M_xx*S_yyyzz
    v757        = M_yy*S_yyyzz
    v920        = M_yz*S_yyyzz
    v921        = 0.34965034965035d0*v920
    v972        = M_xz*S_yyyzz
    v1188       = M_xxy*S_yyyzz
    v1265       = M_yyy*S_yyyzz
    v1367       = M_xxx*S_yyyzz
    v1438       = M_xyy*S_yyyzz
    v1632       = M_xyz*S_yyyzz
    v1798       = M_xxz*S_yyyzz
    v1873       = M_yyz*S_yyyzz
    S_yyzzz     = -(S_xxyyz + S_yyyyz)
    v258        = M_z*S_yyzzz
    v1923       = v1931 - 15.0d0*M_xxyyzz + 3.0d0*(2.0d0*v252 + 2.0d0*v255 + 2.0d0*v257 + &
      2.0d0*v258)
    v259        = 0.00432900432900433d0*(1440.0d0*v253 + 5.0d0*(v1923 + 12.0d0*v250 - &
      8.0d0*v251 - 8.0d0*v254 + 12.0d0*v256))
    v385        = M_x*S_yyzzz
    v445        = 0.00432900432900433d0*(v1923 - 720.0d0*v253 - 240.0d0*(v250 + v256) - &
      260.0d0*(v251 + v254))
    v460        = M_y*S_yyzzz
    v468        = -0.0303030303030303d0*(M_yyyyyz + v1915 + v458 + v459 + v460 + v463 + &
      5.0d0*(v456 + v457 + v461 + v462 + v464 + v465 + v466 + v467))
    v520        = -0.0303030303030303d0*(M_xxxxxz + v1914 + v383 + v385 + v407 + v433 + &
      5.0d0*(v398 + v406 + v415 + v421 + v423 + v432 + v438 + v440))
    v626        = M_xz*S_yyzzz
    v671        = M_yz*S_yyzzz
    v811        = M_xx*S_yyzzz
    v887        = M_yy*S_yyzzz
    v963        = M_xy*S_yyzzz
    v1213       = M_xxz*S_yyzzz
    v1292       = M_yyz*S_yyzzz
    v1335       = M_xyz*S_yyzzz
    v1521       = M_xxx*S_yyzzz
    v1603       = M_xyy*S_yyzzz
    v1772       = M_xxy*S_yyzzz
    v1845       = M_yyy*S_yyzzz
    S_yzzzz     = -(S_xxyzz + S_yyyzz)
    S_zzzzz     = -(S_xxzzz + S_yyzzz)
    S_xxxxxx    = v245 + v247 + 0.0909090909090909d0*(-15.0d0*v248 + 5.0d0*v249)
    v540        = M_x*S_xxxxxx
    v746        = M_y*S_xxxxxx
    v922        = M_z*S_xxxxxx
    v1130       = M_xx*S_xxxxxx
    v1253       = M_yy*S_xxxxxx
    v1428       = M_xy*S_xxxxxx
    v1633       = M_xz*S_xxxxxx
    v1878       = M_yz*S_xxxxxx
    Ms_xxxxxx   = M_0*S_xxxxxx + v259 + 0.00432900432900433d0*(136.0d0*M_xxxxxx - 75.0d0* &
      M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + 2360.0d0*v270 - &
      2340.0d0*v281 - 2260.0d0*v288 + 1440.0d0*v293 + 576.0d0*(v260 + &
      v274) + 1620.0d0*(v265 + v272) - 120.0d0*(v282 + v307) + 840.0d0* &
      (v286 + v317) - 160.0d0*(v308 + v314) + 90.0d0*(-M_xxxxzz + v266 &
      + v283) + 360.0d0*(-v261 + v273 - v278 + v302) + 720.0d0*(v271 + &
      v284 + v292 + v303) - 600.0d0*(v275 + v276 + v297 + v318) - &
      1680.0d0*(v277 + v279 + v291 + v296) - 165.0d0*(v267 + v268 + &
      v269 + v289 + v309 + v315) - 180.0d0*(M_xxxxyy + v262 + v263 + &
      v264 + v280 + v294 + v295) + 60.0d0*(v285 - v290 + v298 - v304 - &
      v305 - v306 - v310 - v316) + 30.0d0*(v287 + v299 + v300 + v301 + &
      v311 + v312 + v313 + v319))
    S_xxxxxy    = v0*v321
    v627        = M_y*S_xxxxxy
    v678        = M_x*S_xxxxxy
    v1040       = M_z*S_xxxxxy
    v1220       = M_xy*S_xxxxxy
    v1358       = M_xx*S_xxxxxy
    v1471       = M_yy*S_xxxxxy
    v1679       = M_yz*S_xxxxxy
    v1825       = M_xz*S_xxxxxy
    Ms_xxxxxy   = M_0*S_xxxxxy - M_z*v380 + v340 - v353*z + 0.0303030303030303d0*(-10.0d0* &
      (v342 + v356) + 20.0d0*(v345 + v362) - 70.0d0*(v352 + v370) - &
      60.0d0*(v354 + v378) + 28.0d0*(M_xxxxxy + v348 + v369) + 100.0d0* &
      (v341 + v347 + v349 + v359) + 190.0d0*(v344 + v346 + v350 + v355 &
      ) - 140.0d0*(v357 + v358 + v366 + v368) - 5.0d0*(M_xyyyyy + v343 &
      + v360 + v364 + v371 + v375 + v376) + 40.0d0*(-v351 + v361 + v363 &
      + v365 + v367 - v372 + v373 + v374 + v377 + v379))
    S_xxxxxz    = v1*v321
    v653        = M_z*S_xxxxxz
    v802        = M_x*S_xxxxxz
    v1025       = M_y*S_xxxxxz
    v1240       = M_xz*S_xxxxxz
    v1498       = M_yz*S_xxxxxz
    v1512       = M_xx*S_xxxxxz
    v1647       = M_yy*S_xxxxxz
    v1803       = M_xy*S_xxxxxz
    Ms_xxxxxz   = M_0*S_xxxxxz + M_xxz*v404 + S_xxz*v388 - v395 - v400 - v417 - v424 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 250.0d0*(v386 + v396) + &
      220.0d0*(v390 + v419) + 68.0d0*(v391 + v436) + 80.0d0*(v397 + &
      v425) + 90.0d0*(v401 + v420) - 140.0d0*(v403 + v408) + 160.0d0*( &
      v405 + v409) + 100.0d0*(v381 + v392 - v393 - v434) + 20.0d0*(v387 &
      + v389 + v413 + v430) + 10890.0d0*(-M_xxxyyz - v382 + v394 - v402 &
      + v437) + 40.0d0*(v410 - v411 + v414 - v418 + v426 - v427 + v431 &
      - v435) - 5.0d0*(M_xxxzzz + M_xyyyyz + M_xyyzzz + v383 + v384 + &
      v385 + v407 + v429 + v433) - 25.0d0*(v398 + v406 + v412 + v415 + &
      v421 + v422 + v423 + v428 + v432 + v438 + v439 + v440))
    S_xxxxyy    = 0.0303030303030303d0*(-3.0d0*v248 + 2.0d0*v249) + v442 + v443 + v444*v5
    v541        = M_x*S_xxxxyy
    v747        = M_y*S_xxxxyy
    v923        = M_z*S_xxxxyy
    v924        = 0.559440559440559d0*v923
    v1131       = M_xx*S_xxxxyy
    v1254       = M_yy*S_xxxxyy
    v1429       = M_xy*S_xxxxyy
    v1634       = M_xz*S_xxxxyy
    v1879       = M_yz*S_xxxxyy
    Ms_xxxxyy   = M_0*S_xxxxyy + v445 - v446 - v450 + v453 + v455 + 0.00432900432900433d0* &
      (-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - 11.0d0*M_xxxxzz - 5.0d0* &
      M_yyyyyy - 4.0d0*M_yyyyzz + 1800.0d0*v281 - 720.0d0*v293 - 64.0d0 &
      *(v260 + v274) + 628.0d0*(v261 + v278) - 82.0d0*(v265 + v272) + &
      942.0d0*(v266 + v283) + 2.0d0*(v268 + v309) - 60.0d0*(v270 + v288 &
      ) + 760.0d0*(v271 + v292) + 412.0d0*(v275 + v297) - 36.0d0*(v276 &
      + v318) + 1288.0d0*(v277 + v291) - 220.0d0*(v282 + v307) - &
      402.0d0*(v284 + v303) - 392.0d0*(v286 + v317) + 37.0d0*(v305 + &
      v310) + 80.0d0*(v308 + v314) + 6.0d0*(v312 + v319) - 26.0d0*(v267 &
      + v269 + v289 + v315) + 268.0d0*(v273 - v285 - v298 + v302) - &
      19.0d0*(v290 + v304 + v306 + v316) - 448.0d0*(v447 + v448 + v449 &
      + v451) - 8.0d0*(v287 + v299 + v300 + v301 + v311 + v313) - &
      22.0d0*(M_xxyyyy + v262 + v263 + v264 + v280 + v294 + v295))
    S_xxxxyz    = v2*(-v441 + v38 + v444)
    v783        = M_z*S_xxxxyz
    v875        = M_y*S_xxxxyz
    v986        = M_x*S_xxxxyz
    v1299       = M_yz*S_xxxxyz
    v1461       = M_xz*S_xxxxyz
    v1594       = M_xy*S_xxxxyz
    v1726       = M_xx*S_xxxxyz
    v1836       = M_yy*S_xxxxyz
    Ms_xxxxyz   = M_0*S_xxxxyz + v468 + 0.0303030303030303d0*(26.0d0*(v482 + v511) + &
      40.0d0*(v487 + v500) + 8.0d0*(v499 + v505) + 32.0d0*(M_xxxxyz + &
      v475 + v495) + 96.0d0*(v469 + v477 + v478 + v488) + 170.0d0*(v470 &
      + v479 + v484 + v486) + 4.0d0*(v471 + v485 + v498 + v504) + &
      160.0d0*(v472 + v476 + v492 + v493) + 64.0d0*(v473 + v474 + v490 &
      + v494 + v507 + v510) - (2.0d0*M_xxyyyz + 40.0d0*v480 + 18.0d0* &
      v481 + 38.0d0*v483 + 64.0d0*v489 + 64.0d0*v491 + 38.0d0*v496 + &
      v497 + 13.0d0*v501 + 5.0d0*v502 + v503 + 40.0d0*v506 + 18.0d0* &
      v508 + 13.0d0*v509 + 5.0d0*v512))
    S_xxxxzz    = -(S_xxxxxx + S_xxxxyy)
    v542        = M_x*S_xxxxzz
    v748        = M_y*S_xxxxzz
    v925        = M_z*S_xxxxzz
    v937        = 0.104895104895105d0*v542
    v1077       = 0.174825174825175d0*v925
    v1132       = M_xx*S_xxxxzz
    v1255       = M_yy*S_xxxxzz
    v1430       = M_xy*S_xxxxzz
    v1635       = M_xz*S_xxxxzz
    v1880       = M_yz*S_xxxxzz
    S_xxxyyy    = v0*(0.0909090909090909d0*v39 + v513 + v514 + v84)
    v628        = M_y*S_xxxyyy
    v679        = M_x*S_xxxyyy
    v982        = M_z*S_xxxyyy
    v1106       = M_xy*S_xxxyyy
    v1359       = M_xx*S_xxxyyy
    v1472       = M_yy*S_xxxyyy
    v1680       = M_yz*S_xxxyyy
    v1826       = M_xz*S_xxxyyy
    Ms_xxxyyy   = 0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v324 + v337) + 75.0d0*(v326 + v333) + 69.0d0*(v327 + v330) + &
      25.0d0*(v342 + v352 + v356 + v370) + 31.0d0*(v345 + v351 + v362 + &
      v372) - (M_xxxxxy + 11.0d0*M_xxxyz*v515 + M_xxxyzz + M_xyyyyy + &
      11.0d0*M_xyyyz*v515 + M_xyyyzz + 11.0d0*S_xxxyz*v518 + 11.0d0* &
      S_xyyyz*v518 + v322 + v323 + v325 + v328 + v329 + v331 + v332 + &
      v334 + v335 + v336 + v338 + v339 + 7.0d0*v341 + v343 + 10.0d0* &
      v344 + 10.0d0*v346 + 7.0d0*v347 + v348 + 7.0d0*v349 + 10.0d0*v350 &
      + 6.0d0*v354 + 10.0d0*v355 + 10.0d0*v357 + 10.0d0*v358 + 7.0d0* &
      v359 + 7.0d0*v360 + 10.0d0*v361 + 10.0d0*v363 + 7.0d0*v364 + &
      10.0d0*v365 + 10.0d0*v366 + 10.0d0*v367 + 10.0d0*v368 + v369 + &
      7.0d0*v371 + 10.0d0*v373 + 10.0d0*v374 + 7.0d0*v375 + v376 + &
      10.0d0*v377 + 6.0d0*v378 + 10.0d0*v379 + 6.0d0*v516 + 6.0d0*v517 &
      ))
    S_xxxyyz    = v1*(0.0909090909090909d0*(-v41) + v514 + v519)
    v654        = M_z*S_xxxyyz
    v803        = M_x*S_xxxyyz
    v1026       = M_y*S_xxxyyz
    v1241       = M_xz*S_xxxyyz
    v1499       = M_yz*S_xxxyyz
    v1513       = M_xx*S_xxxyyz
    v1648       = M_yy*S_xxxyyz
    v1804       = M_xy*S_xxxyyz
    Ms_xxxyyz   = M_0*S_xxxyyz + M_xxyy*v220 + S_xxyy*v77 + v395 + v400 + v417 + v424 + &
      v520 + 0.0303030303030303d0*(31.0d0*M_xxxyyz + v391 + v436 + &
      79.0d0*(v382 + v402) + 103.0d0*(v387 + v413) + 55.0d0*(v389 + &
      v430) + 88.0d0*(v393 + v434) + 47.0d0*(v394 + v437) + 43.0d0*( &
      v397 + v425) + 152.0d0*(v403 + v408) + 95.0d0*(v405 + v409) + &
      10.0d0*(v411 + v418 + v427 + v435) + 13.0d0*(v412 + v422 + v428 + &
      v439) - (M_xyyyyz + 7.0d0*v381 + v384 + 4.0d0*v386 + v390 + 7.0d0 &
      *v392 + 4.0d0*v396 + 10.0d0*v410 + 10.0d0*v414 + v419 + 10.0d0* &
      v426 + v429 + 10.0d0*v431 + 18.0d0*v521 + 18.0d0*v522 + 18.0d0* &
      v523 + 18.0d0*v524))
    S_xxxyzz    = -(S_xxxxxy + S_xxxyyy)
    v629        = M_y*S_xxxyzz
    v680        = M_x*S_xxxyzz
    v983        = M_z*S_xxxyzz
    v1107       = M_xy*S_xxxyzz
    v1360       = M_xx*S_xxxyzz
    v1473       = M_yy*S_xxxyzz
    v1681       = M_yz*S_xxxyzz
    v1827       = M_xz*S_xxxyzz
    S_xxxzzz    = -(S_xxxxxz + S_xxxyyz)
    v655        = M_z*S_xxxzzz
    v804        = M_x*S_xxxzzz
    v973        = M_y*S_xxxzzz
    v1062       = 0.0699300699300699d0*v804
    v1242       = M_xz*S_xxxzzz
    v1345       = M_yz*S_xxxzzz
    v1514       = M_xx*S_xxxzzz
    v1649       = M_yy*S_xxxzzz
    v1805       = M_xy*S_xxxzzz
    S_xxyyyy    = 0.0303030303030303d0*(-3.0d0*v525 + 2.0d0*v527) + v4*v444 + v442 + v526
    v543        = M_x*S_xxyyyy
    v749        = M_y*S_xxyyyy
    v926        = M_z*S_xxyyyy
    v1078       = 0.559440559440559d0*v926
    v1133       = M_xx*S_xxyyyy
    v1256       = M_yy*S_xxyyyy
    v1431       = M_xy*S_xxyyyy
    v1636       = M_xz*S_xxyyyy
    v1881       = M_yz*S_xxyyyy
    Ms_xxyyyy   = M_0*S_xxyyyy + v445 + v446 + v450 - v453 - v455 + 0.00432900432900433d0* &
      (-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0*M_xxyyyy - 12.0d0* &
      M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v281 + 1800.0d0*v293 + &
      412.0d0*(v263 + v294) + 37.0d0*(v265 + v272) - 402.0d0*(v266 + &
      v283) + 80.0d0*(v270 + v288) - 220.0d0*(v271 + v292) + 2.0d0*( &
      v273 + v302) + 6.0d0*(v276 + v318) + 760.0d0*(v282 + v307) + &
      942.0d0*(v284 + v303) + 628.0d0*(v285 + v298) - 64.0d0*(v300 + &
      v311) - 82.0d0*(v305 + v310) - 60.0d0*(v308 + v314) - 36.0d0*( &
      v312 + v319) + 1288.0d0*(v447 + v448) - 392.0d0*(v449 + v451) + &
      268.0d0*(-v261 + v268 - v278 + v309) - 19.0d0*(v267 + v269 + v289 &
      + v315) - 448.0d0*(v277 + v286 + v291 + v317) - 26.0d0*(v290 + &
      v304 + v306 + v316) - 8.0d0*(v260 + v262 + v264 + v274 + v280 + &
      v295) - 22.0d0*(M_xxxxyy + v275 + v287 + v297 + v299 + v301 + &
      v313))
    S_xxyyyz    = v2*(0.0909090909090909d0*(-v106) + v513 + v519)
    v784        = M_z*S_xxyyyz
    v876        = M_y*S_xxyyyz
    v987        = M_x*S_xxyyyz
    v1300       = M_yz*S_xxyyyz
    v1462       = M_xz*S_xxyyyz
    v1595       = M_xy*S_xxyyyz
    v1727       = M_xx*S_xxyyyz
    v1837       = M_yy*S_xxyyyz
    Ms_xxyyyz   = M_0*S_xxyyyz + v468 + v529 + v530 + v532 + v533 + 0.0303030303030303d0*( &
      31.0d0*M_xxyyyz + v502 + v512 + 43.0d0*(v471 + v504) + 95.0d0*( &
      v480 + v506) + 99.0d0*(v481 + v508) + 47.0d0*(v482 + v511) + &
      79.0d0*(v483 + v496) + 103.0d0*(v485 + v498) + 55.0d0*(v487 + &
      v500) + 152.0d0*(v489 + v491) + 88.0d0*(v490 + v494) + 10.0d0*( &
      v472 + v476 + v492 + v493) + 13.0d0*(v473 + v474 + v507 + v510) - &
      (M_xxxxyz + 18.0d0*v469 + 10.0d0*v470 + v475 + 18.0d0*v477 + &
      18.0d0*v478 + 10.0d0*v479 + 10.0d0*v484 + 10.0d0*v486 + 18.0d0* &
      v488 + v495 + 7.0d0*v497 + 4.0d0*v499 + v501 + 7.0d0*v503 + 4.0d0 &
      *v505 + v509))
    S_xxyyzz    = -(S_xxxxyy + S_xxyyyy)
    v544        = M_x*S_xxyyzz
    v664        = M_y*S_xxyyzz
    v795        = M_z*S_xxyyzz
    v796        = -1.22377622377622d0*v795
    v1079       = -0.244755244755245d0*v795
    v1134       = M_xx*S_xxyyzz
    v1257       = M_yy*S_xxyyzz
    v1326       = M_xy*S_xxyyzz
    v1637       = M_xz*S_xxyyzz
    v1715       = M_yz*S_xxyyzz
    S_xxyzzz    = -(S_xxxxyz + S_xxyyyz)
    v672        = M_z*S_xxyzzz
    v877        = M_y*S_xxyzzz
    v878        = 0.0699300699300699d0*v877
    v947        = M_x*S_xxyzzz
    v1301       = M_yz*S_xxyzzz
    v1336       = M_xz*S_xxyzzz
    v1596       = M_xy*S_xxyzzz
    v1728       = M_xx*S_xxyzzz
    v1838       = M_yy*S_xxyzzz
    S_xxzzzz    = -(S_xxxxzz + S_xxyyzz)
    v545        = M_x*S_xxzzzz
    v665        = M_y*S_xxzzzz
    v797        = M_z*S_xxzzzz
    v798        = 0.0815850815850816d0*v797
    v1080       = 0.0163170163170163d0*v797
    v1135       = M_xx*S_xxzzzz
    v1258       = M_yy*S_xxzzzz
    v1327       = M_xy*S_xxzzzz
    v1638       = M_xz*S_xxzzzz
    v1716       = M_yz*S_xxzzzz
    S_xyyyyy    = v0*v534
    v630        = M_y*S_xyyyyy
    v681        = M_x*S_xyyyyy
    v1041       = M_z*S_xyyyyy
    v1221       = M_xy*S_xyyyyy
    v1361       = M_xx*S_xyyyyy
    v1474       = M_yy*S_xyyyyy
    v1682       = M_yz*S_xyyyyy
    v1828       = M_xz*S_xyyyyy
    Ms_xyyyyy   = M_0*S_xyyyyy - M_z*v528 + v340 - v531*z + 0.0303030303030303d0*(-70.0d0* &
      (v342 + v356) + 20.0d0*(v351 + v372) - 10.0d0*(v352 + v370) - &
      60.0d0*(v516 + v517) + 28.0d0*(M_xyyyyy + v343 + v376) + 100.0d0* &
      (v360 + v364 + v371 + v375) + 190.0d0*(v361 + v363 + v373 + v374 &
      ) - 140.0d0*(v365 + v367 + v377 + v379) - 5.0d0*(M_xxxxxy + v341 &
      + v347 + v348 + v349 + v359 + v369) + 40.0d0*(v344 - v345 + v346 &
      + v350 + v355 + v357 + v358 - v362 + v366 + v368))
    S_xyyyyz    = v1*(0.0909090909090909d0*(-6.0d0*v106) + v105 + v444)
    v656        = M_z*S_xyyyyz
    v805        = M_x*S_xyyyyz
    v1027       = M_y*S_xyyyyz
    v1243       = M_xz*S_xyyyyz
    v1500       = M_yz*S_xyyyyz
    v1515       = M_xx*S_xyyyyz
    v1650       = M_yy*S_xyyyyz
    v1806       = M_xy*S_xyyyyz
    Ms_xyyyyz   = M_0*S_xyyyyz + v520 + 0.0303030303030303d0*(8.0d0*(v386 + v396) + 40.0d0 &
      *(v389 + v430) + 26.0d0*(v394 + v437) + 32.0d0*(M_xyyyyz + v384 + &
      v429) + 4.0d0*(v387 + v397 + v413 + v425) + 170.0d0*(v410 + v414 &
      + v426 + v431) + 160.0d0*(v411 + v418 + v427 + v435) + 96.0d0*( &
      v521 + v522 + v523 + v524) + 64.0d0*(v393 + v412 + v422 + v428 + &
      v434 + v439) - (2.0d0*M_xxxyyz + v381 + 38.0d0*v382 + 13.0d0*v390 &
      + 5.0d0*v391 + v392 + 18.0d0*v401 + 38.0d0*v402 + 64.0d0*v403 + &
      40.0d0*v405 + 64.0d0*v408 + 40.0d0*v409 + 13.0d0*v419 + 18.0d0* &
      v420 + 5.0d0*v436))
    S_xyyyzz    = -(S_xxxyyy + S_xyyyyy)
    v631        = M_y*S_xyyyzz
    v682        = M_x*S_xyyyzz
    v984        = M_z*S_xyyyzz
    v1108       = M_xy*S_xyyyzz
    v1362       = M_xx*S_xyyyzz
    v1475       = M_yy*S_xyyyzz
    v1683       = M_yz*S_xyyyzz
    v1829       = M_xz*S_xyyyzz
    S_xyyzzz    = -(S_xxxyyz + S_xyyyyz)
    v657        = M_z*S_xyyzzz
    v806        = M_x*S_xyyzzz
    v974        = M_y*S_xyyzzz
    v1063       = 0.0699300699300699d0*v806
    v1244       = M_xz*S_xyyzzz
    v1346       = M_yz*S_xyyzzz
    v1516       = M_xx*S_xyyzzz
    v1651       = M_yy*S_xyyzzz
    v1807       = M_xy*S_xyyzzz
    S_xyzzzz    = -(S_xxxyzz + S_xyyyzz)
    S_xzzzzz    = -(S_xxxzzz + S_xyyzzz)
    S_yyyyyy    = v247 + v535 + 0.0909090909090909d0*(-15.0d0*v525 + 5.0d0*v527)
    v546        = M_x*S_yyyyyy
    v750        = M_y*S_yyyyyy
    v927        = M_z*S_yyyyyy
    v1136       = M_xx*S_yyyyyy
    v1432       = M_xy*S_yyyyyy
    v1639       = M_xz*S_yyyyyy
    v1702       = M_yy*S_yyyyyy
    v1882       = M_yz*S_yyyyyy
    Ms_yyyyyy   = M_0*S_yyyyyy + v259 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v281 - &
      2340.0d0*v293 + 2360.0d0*v308 - 2260.0d0*v314 - 160.0d0*(v270 + &
      v288) - 120.0d0*(v271 + v292) + 576.0d0*(v300 + v311) + 1620.0d0* &
      (v305 + v310) + 840.0d0*(v449 + v451) + 90.0d0*(-M_yyyyzz + v284 &
      + v303) - 600.0d0*(v263 + v294 + v312 + v319) + 720.0d0*(v266 + &
      v282 + v283 + v307) + 360.0d0*(v268 - v285 - v298 + v309) - &
      1680.0d0*(v447 + v448 + v452 + v454) - 165.0d0*(v273 + v290 + &
      v302 + v304 + v306 + v316) - 180.0d0*(M_xxyyyy + v275 + v287 + &
      v297 + v299 + v301 + v313) + 30.0d0*(v260 + v262 + v264 + v274 + &
      v276 + v280 + v295 + v318) + 60.0d0*(v261 - v265 - v267 - v269 - &
      v272 + v278 - v289 - v315))
    S_yyyyyz    = v2*v534
    v785        = M_z*S_yyyyyz
    v879        = M_y*S_yyyyyz
    v988        = M_x*S_yyyyyz
    v1302       = M_yz*S_yyyyyz
    v1463       = M_xz*S_yyyyyz
    v1597       = M_xy*S_yyyyyz
    v1729       = M_xx*S_yyyyyz
    v1839       = M_yy*S_yyyyyz
    Ms_yyyyyz   = M_0*S_yyyyyz + M_yyy*v536 + M_yyz*v537 - v529 - v530 - v532 - v533 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 80.0d0*(v471 + v504) + &
      160.0d0*(v480 + v506) + 90.0d0*(v481 + v508) - 140.0d0*(v489 + &
      v491) + 250.0d0*(v499 + v505) + 220.0d0*(v501 + v509) + 68.0d0*( &
      v502 + v512) + 20.0d0*(v485 + v487 + v498 + v500) + 100.0d0*( &
      -v490 - v494 + v497 + v503) + 10890.0d0*(-M_xxyyyz + v482 - v483 &
      - v496 + v511) + 40.0d0*(v470 - v472 - v476 + v479 + v484 + v486 &
      - v492 - v493) - 5.0d0*(M_xxxxyz + M_xxyzzz + M_yyyzzz + v458 + &
      v459 + v460 + v463 + v475 + v495) - 25.0d0*(v456 + v457 + v461 + &
      v462 + v464 + v465 + v466 + v467 + v473 + v474 + v507 + v510))
    S_yyyyzz    = -(S_xxyyyy + S_yyyyyy)
    v547        = M_x*S_yyyyzz
    v751        = M_y*S_yyyyzz
    v752        = 0.104895104895105d0*v751
    v928        = M_z*S_yyyyzz
    v929        = 0.174825174825175d0*v928
    v1137       = M_xx*S_yyyyzz
    v1259       = M_yy*S_yyyyzz
    v1433       = M_xy*S_yyyyzz
    v1640       = M_xz*S_yyyyzz
    v1883       = M_yz*S_yyyyzz
    S_yyyzzz    = -(S_xxyyyz + S_yyyyyz)
    v673        = M_z*S_yyyzzz
    v880        = M_y*S_yyyzzz
    v881        = 0.0699300699300699d0*v880
    v948        = M_x*S_yyyzzz
    v985        = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 5.0d0*(-3.0d0*M_xxxyzzz - &
      3.0d0*M_xyyyzzz - 3.0d0*v947 - 3.0d0*v948 + 12.0d0*v949 + 14.0d0* &
      v950 + 12.0d0*v951 - 15.0d0*v952 - 15.0d0*v953 - 3.0d0*v954 - &
      54.0d0*v955 - 114.0d0*v956 - 15.0d0*v957 - 3.0d0*v958 - 15.0d0* &
      v959 - 3.0d0*v960 - 114.0d0*v961 - 3.0d0*v962 - 3.0d0*v963 + &
      12.0d0*v964 - 15.0d0*v965 - 15.0d0*v966 - 3.0d0*v967 - 54.0d0* &
      v968 - 15.0d0*v969 - 15.0d0*v970 - 15.0d0*v971 - 15.0d0*v972 - &
      3.0d0*v973 - 3.0d0*v974 + 12.0d0*v975 - 15.0d0*v976 - 3.0d0*v977 &
      - 15.0d0*v978 - 3.0d0*v979 - 15.0d0*v980 - 15.0d0*v981 + 14.0d0* &
      v982 - 15.0d0*v983 - 15.0d0*v984))
    v1303       = M_yz*S_yyyzzz
    v1337       = M_xz*S_yyyzzz
    v1598       = M_xy*S_yyyzzz
    v1730       = M_xx*S_yyyzzz
    v1840       = M_yy*S_yyyzzz
    S_yyzzzz    = -(S_xxyyzz + S_yyyyzz)
    v548        = M_x*S_yyzzzz
    v666        = M_y*S_yyzzzz
    v674        = 0.00233100233100233d0*(5.0d0*(v1917 - 15.0d0*v660 + 6.0d0*v661 + 6.0d0* &
      v662 + v663 - 15.0d0*v664 + v665 + v666 + 6.0d0*v667 + 6.0d0*v668 &
      + v669 + 6.0d0*v670 + 6.0d0*v671 + 6.0d0*v672 + 6.0d0*v673))
    v799        = M_z*S_yyzzzz
    v800        = 0.0815850815850816d0*v799
    v934        = 0.00233100233100233d0*(5.0d0*(v1916 - 15.0d0*v544 + v545 + v548 + 6.0d0* &
      v582 - 15.0d0*v590 + 6.0d0*v597 + v598 + 6.0d0*v620 + 6.0d0*v624 &
      + 6.0d0*v626 + 6.0d0*v650 + v651 + 6.0d0*v655 + 6.0d0*v657))
    v1081       = 0.0163170163170163d0*v799
    v1926       = v1059 + v1060 + v1061 + v1068 + v1069 + v1076 + v1079 + v1080 + v1081
    v1138       = M_xx*S_yyzzzz
    v1260       = M_yy*S_yyzzzz
    v1328       = M_xy*S_yyzzzz
    v1641       = M_xz*S_yyzzzz
    v1717       = M_yz*S_yyzzzz
    S_yzzzzz    = -(S_xxyzzz + S_yyyzzz)
    S_zzzzzz    = -(S_xxzzzz + S_yyzzzz)
    S_xxxxxxx   = x*(v245 + v538 + 0.00699300699300699d0*(-231.0d0*v248 + 105.0d0*v249))
    v1122       = M_x*S_xxxxxxx
    v1464       = M_y*S_xxxxxxx
    v1684       = M_z*S_xxxxxxx
    Ms_xxxxxxx  = M_0*S_xxxxxxx + v539 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*(v540 + v563) - 1260.0d0*(v541 + v567) - 630.0d0*(v542 + &
      v569) + 3444.0d0*(v549 + v561) - 1050.0d0*(v550 + v572) + &
      6860.0d0*(v554 + v559) + 1470.0d0*(v555 + v585) - 7980.0d0*(v570 &
      + v583) + 1680.0d0*(v573 + v633) - 7420.0d0*(v578 + v593) + &
      5040.0d0*(v586 + v605) + 5880.0d0*(v591 + v621) + 70.0d0*( &
      M_xyyyyyy + v546 + v642) + 105.0d0*(-M_xxxyyyy + M_xyyyyzz + v547 &
      + v644) - 525.0d0*(v543 + v544 + v588 + v590) + 2520.0d0*(v560 + &
      v576 + v604 + v652) - 1176.0d0*(v564 + v565 + v627 + v653) - &
      4200.0d0*(v566 + v568 + v599 + v622) - 280.0d0*(v579 + v594 + &
      v616 + v646) - 1120.0d0*(v610 + v617 + v638 + v647) + 35.0d0*( &
      M_xxxzzzz + M_xyyzzzz + v545 + v548 + v598 + v651) - 1155.0d0*( &
      v551 + v552 + v553 + v580 + v611 + v618) - 735.0d0*(v556 + v557 + &
      v558 + v595 + v639 + v648) + 840.0d0*(v562 - v571 - v584 - v609 + &
      v632 - v637) + 420.0d0*(-M_xxxxxyy + v574 + v575 - v581 + v587 + &
      v589 - v596 + v600 - v606 - v607 - v608 - v612 - v619 + v623 + &
      v628 - v634 - v635 - v636 - v640 - v649 + v654) + 210.0d0*( &
      -M_xxxxxzz + v577 + v582 + v592 + v597 + v601 + v602 + v603 + &
      v613 + v614 + v615 + v620 + v624 + v625 + v626 + v629 + v630 + &
      v631 + v641 + v643 + v645 + v650 + v655 + v656 + v657))
    S_xxxxxxy   = v659*y
    v1245       = M_y*S_xxxxxxy
    v1351       = M_x*S_xxxxxxy
    v1884       = M_z*S_xxxxxxy
    Ms_xxxxxxy  = M_0*S_xxxxxxy + v674 - v675 + v676 + v677 + v752 + v771 + &
      0.00233100233100233d0*(-105.0d0*M_xxyyyyy + 10.0d0*M_yyyyyyy + &
      150.0d0*(v684 + v716) + 4640.0d0*(v688 + v701) - 1200.0d0*(v697 + &
      v747) - 120.0d0*(v700 + v748) - 3870.0d0*(v710 + v714) - 315.0d0* &
      (v712 + v763) + 840.0d0*(v715 + v759) + 1020.0d0*(v717 + v754) - &
      45.0d0*(v718 + v749) + 1140.0d0*(v720 + v781) - 3940.0d0*(v721 + &
      v725) + 1040.0d0*(v722 + v776) - 220.0d0*(v761 + v764) - 160.0d0* &
      (v773 + v777) + 304.0d0*(M_xxxxxxy + v693 + v746) + 1344.0d0*( &
      v678 + v692 + v694 + v729) - 2880.0d0*(v705 + v707 + v743 + v745 &
      ) + 40.0d0*(-v726 + v750 + v767 - v772) + 480.0d0*(-v679 + v691 - &
      v696 - v704 - v753 + v758) + 3360.0d0*(v683 + v690 + v695 - v703 &
      + v709 - v730) + 960.0d0*(v689 - v698 - v699 + v736 - v780 - v783 &
      ) + 1920.0d0*(-v702 - v734 + v735 + v737 + v741 + v744) + 60.0d0* &
      (v719 - v728 - v760 - v762 - v779 + v784) - 195.0d0*(v685 + v686 &
      + v687 + v711 + v713 + v723 + v727 + v765 + v774 + v778) + 30.0d0 &
      *(-v724 - v755 - v756 - v757 - v766 + v768 + v769 - v775 + v782 + &
      v785) - 240.0d0*(M_xxxxyyy + v680 + v681 + v682 + v706 + v708 + &
      v731 + v732 + v733 + v738 + v739 + v740 + v742))
    S_xxxxxxz   = v659*z
    v1304       = M_z*S_xxxxxxz
    v1503       = M_x*S_xxxxxxz
    v1830       = M_y*S_xxxxxxz
    Ms_xxxxxxz  = M_0*S_xxxxxxz + v1932 + v786 + v787 + v788 + v790 + v792 + v794 + v796 + &
      v798 + v800 + v801 - v821 + v846 + v848 + v878 + v881 + v899 + &
      v903 + v905 + v918 + v921 - v924 + v929 + 0.00233100233100233d0*( &
      304.0d0*M_xxxxxxz - 105.0d0*M_xxyyyyz + 10.0d0*M_yyyyyyz + &
      1344.0d0*(v802 + v818) + 4320.0d0*(v807 + v823) + 7520.0d0*(v812 &
      + v830) + 6720.0d0*(v814 + v849) + 3264.0d0*(v816 + v870) + &
      784.0d0*(v817 + v922) + 1440.0d0*(v824 + v882) - 600.0d0*(v825 + &
      v925) - 4800.0d0*(v826 + v868) - 2880.0d0*(v829 + v858) + &
      3840.0d0*(v831 + v859) - 5100.0d0*(v834 + v843) + 2970.0d0*(v836 &
      + v850) + 1080.0d0*(v837 + v907) - 780.0d0*(v838 + v916) - &
      555.0d0*(v839 + v926) + 900.0d0*(v842 + v883) - 735.0d0*(v852 + &
      v890) + 30.0d0*(v879 + v894) - 160.0d0*(v889 + v901) + 150.0d0*( &
      v892 + v919) + 40.0d0*(v893 + v927) - 120.0d0*(M_xxxxzzz + v835 + &
      v900) + 960.0d0*(v813 - v822 + v864 - v875) + 60.0d0*(v840 + v876 &
      + v891 + v909) - 775.0d0*(v851 + v853 + v854 + v911) - 100.0d0*( &
      v855 + v908 + v910 + v912) + 480.0d0*(-v803 + v815 + v827 - v828 &
      + v871 + v906) + 90.0d0*(v808 + v841 - v857 - v884 - v887 - v914 &
      ) - 225.0d0*(v809 + v810 + v811 + v856 + v895 + v913) + 1920.0d0* &
      (-v819 + v860 - v861 + v865 - v869 - v915) - 240.0d0*(M_xxxxyyz + &
      v804 + v805 + v806 + v833 + v863 + v867) - 1200.0d0*(v832 + v844 &
      + v862 + v866 + v872 + v873 + v874 + v888))
    S_xxxxxyy   = x*(0.00699300699300699d0*(10.0d0*v249) + v1924 + v443 + v5*v931 + v930)
    v1123       = M_x*S_xxxxxyy
    v1465       = M_y*S_xxxxxyy
    v1685       = M_z*S_xxxxxyy
    Ms_xxxxxyy  = M_0*S_xxxxxyy + v934 - v935 + v936 - v937 - v938 + v940 + v942 + v944 + &
      v946 + 0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0* &
      M_xxxxxyy - 116.0d0*(v540 + v563) + 1350.0d0*(v541 + v567) - &
      210.0d0*(v549 + v561) + 2550.0d0*(v550 + v572) - 190.0d0*(v554 + &
      v559) + 2730.0d0*(v555 + v585) + 1620.0d0*(v560 + v604) + 444.0d0 &
      *(v562 + v632) + 732.0d0*(v564 + v627) - 36.0d0*(v565 + v653) + &
      2820.0d0*(v566 + v599) + 5160.0d0*(v570 + v583) - 420.0d0*(v571 + &
      v637) - 1110.0d0*(v573 + v633) - 780.0d0*(v574 + v628) - 600.0d0* &
      (v575 + v654) - 1080.0d0*(v576 + v652) - 100.0d0*(v578 + v593) - &
      700.0d0*(v579 + v646) - 1380.0d0*(v584 + v609) - 2790.0d0*(v586 + &
      v605) - 1740.0d0*(v587 + v600) - 1560.0d0*(v589 + v623) - &
      2760.0d0*(v591 + v621) - 1660.0d0*(v594 + v616) - 35.0d0*( &
      M_xyyyyyy + v546 + v642) + 255.0d0*(v607 + v612 + v635 + v640) + &
      560.0d0*(v610 + v617 + v638 + v647) - 120.0d0*(v543 + v551 + v553 &
      + v580 + v588 + v618) + 90.0d0*(-M_xxxyyyy - v556 + v557 - v558 - &
      v595 + v639 - v648) + 30.0d0*(-M_xyyyyzz - v547 + v614 + v625 + &
      v643 - v644 + v656) - 105.0d0*(v581 + v596 + v606 + v608 + v619 + &
      v634 + v636 + v649) + 60.0d0*(v552 - v568 - v577 - v592 - v601 - &
      v602 - v603 + v611 - v613 - v615 - v622 - v629 - v630 - v631 - &
      v641 - v645))
    S_xxxxxyz   = v3*(-v932 + v38 + v931)
    v1501       = M_z*S_xxxxxyz
    v1642       = M_y*S_xxxxxyz
    v1721       = M_x*S_xxxxxyz
    Ms_xxxxxyz  = M_0*S_xxxxxyz + M_xxyz*v404 + S_xxyz*v388 + v985 + 0.00699300699300699d0 &
      *(-250.0d0*(v1000 + v1026) + 390.0d0*(v1006 + v1023) - 30.0d0*( &
      v1007 + v987) - 270.0d0*(v1038 + v999) + 1430.0d0*(M_xxxy*S_xxz + &
      M_xxz*S_xxxy) + 128.0d0*(M_xxxxxyz + v1025 + v994) + 1110.0d0*( &
      v1001 + v1002 + v1004 + v989) + 280.0d0*(v1003 + v1029 - v1036 - &
      v998) + 600.0d0*(-v1005 + v1009 + v1014 - v1019) + 60.0d0*(v1008 &
      + v1012 + v1034 + v990) + 480.0d0*(v1010 + v986 + v996 + v997) + &
      120.0d0*(v1013 + v1018 + v1028 + v1035) - 195.0d0*(v1015 + v1021 &
      + v1030 + v1039) - 75.0d0*(v1016 + v1024 + v1031 + v1041) + &
      960.0d0*(v1020 + v1022 + v991 + v995) + 288.0d0*(v1037 + v1040 + &
      v992 + v993) - 15.0d0*(M_xyyyyyz + v1011 + v1017 + v1027 + v1032 &
      + v1033 + v988))
    S_xxxxxzz   = -(S_xxxxxxx + S_xxxxxyy)
    v1124       = M_x*S_xxxxxzz
    v1466       = M_y*S_xxxxxzz
    v1686       = M_z*S_xxxxxzz
    S_xxxxyyy   = y*(v1046 + v1925 + 0.00699300699300699d0*(-33.0d0*v248 + 18.0d0*v249))
    v1246       = M_y*S_xxxxyyy
    v1352       = M_x*S_xxxxyyy
    v1885       = M_z*S_xxxxyyy
    Ms_xxxxyyy  = M_0*S_xxxxyyy + v1048 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v663 + v665 + v666 + v669 + 380.0d0*(v679 &
      + v704) + 630.0d0*(v684 + v716) + 560.0d0*(v689 + v736) + 200.0d0 &
      *(v691 + v758) + 420.0d0*(v696 + v753) + 330.0d0*(v697 + v747) + &
      1320.0d0*(v702 + v734) + 1140.0d0*(v703 + v730) + 1710.0d0*(v710 &
      + v714) + 9.0d0*(v756 + v766) + 25.0d0*(v761 + v764) + 30.0d0*( &
      v769 + v782) + 40.0d0*(v773 + v777) + 6.0d0*(v661 + v662 + v667 + &
      v668 + v670 + v671 + v672 + v673 + v768 + v785) - (16.0d0* &
      M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + M_yyyyyyy + &
      143.0d0*v1049 + 143.0d0*v1050 + 240.0d0*v1051 + 143.0d0*v1052 + &
      143.0d0*v1053 + 240.0d0*v1054 + 15.0d0*v660 + 15.0d0*v664 + &
      96.0d0*v678 + 30.0d0*v680 + 30.0d0*v681 + 30.0d0*v682 + 150.0d0* &
      v683 + 30.0d0*v685 + 18.0d0*v686 + 30.0d0*v687 + 140.0d0*v688 + &
      150.0d0*v690 + 96.0d0*v692 + 16.0d0*v693 + 96.0d0*v694 + 150.0d0* &
      v695 + 60.0d0*v698 + 60.0d0*v699 + 15.0d0*v700 + 140.0d0*v701 + &
      30.0d0*v706 + 30.0d0*v708 + 150.0d0*v709 + 30.0d0*v711 + 150.0d0* &
      v712 + 30.0d0*v713 + 270.0d0*v715 + 270.0d0*v717 + 150.0d0*v718 + &
      120.0d0*v719 + 240.0d0*v720 + 140.0d0*v721 + 260.0d0*v722 + &
      30.0d0*v723 + 15.0d0*v724 + 140.0d0*v725 + 140.0d0*v726 + 30.0d0* &
      v727 + 15.0d0*v728 + 96.0d0*v729 + 30.0d0*v731 + 270.0d0*v732 + &
      30.0d0*v733 + 480.0d0*v735 + 480.0d0*v737 + 270.0d0*v738 + 30.0d0 &
      *v739 + 30.0d0*v740 + 480.0d0*v741 + 30.0d0*v742 + 480.0d0*v744 + &
      16.0d0*v746 + 15.0d0*v748 + 150.0d0*v749 + v750 + 270.0d0*v754 + &
      15.0d0*v755 + 15.0d0*v757 + 270.0d0*v759 + 15.0d0*v760 + 15.0d0* &
      v762 + 150.0d0*v763 + 18.0d0*v765 + v767 + 140.0d0*v772 + 30.0d0* &
      v774 + 15.0d0*v775 + 260.0d0*v776 + 30.0d0*v778 + 15.0d0*v779 + &
      60.0d0*v780 + 240.0d0*v781 + 60.0d0*v783 + 120.0d0*v784))
    S_xxxxyyz   = z*(0.00699300699300699d0*(6.0d0*v249) + v1055 + v1925 + v930)
    v1305       = M_z*S_xxxxyyz
    v1504       = M_x*S_xxxxyyz
    v1831       = M_y*S_xxxxyyz
    Ms_xxxxyyz  = M_0*S_xxxxyyz + v1056 + v1057 - v1058 - v1062 - v1063 - v1064 - v1065 - &
      v1066 + v1067 - v1072 - v1073 - v1074 - v1075 - v1077 + v1078 + &
      v1926 + 0.00233100233100233d0*(-7.0d0*M_yyyyyyz - 6.0d0*M_yyyyzzz &
      - 720.0d0*(v1070 + v1071) + 1260.0d0*(v803 + v828) - 20.0d0*(v812 &
      + v830) + 2160.0d0*(v813 + v864) - 90.0d0*(v814 + v849) + 840.0d0 &
      *(v815 + v906) + 1380.0d0*(v819 + v915) + 690.0d0*(v820 + v923) + &
      780.0d0*(v822 + v875) + 540.0d0*(v824 + v882) + 3720.0d0*(v826 + &
      v868) + 1860.0d0*(v827 + v871) + 2520.0d0*(v829 + v858) + &
      1560.0d0*(v831 + v859) + 4200.0d0*(v834 + v843) - 450.0d0*(v837 + &
      v907) - 270.0d0*(v842 + v883) + 300.0d0*(v844 + v888) + 330.0d0*( &
      v852 + v890) + 570.0d0*(v862 + v873) + 45.0d0*(v885 + v896) + &
      40.0d0*(v889 + v901) - 105.0d0*(v891 + v909) - 132.0d0*(v892 + &
      v919) - 37.0d0*(v893 + v927) - 16.0d0*(M_xxxxxxz + v817 + v922) - &
      96.0d0*(v802 + v816 + v818 + v870) + 2250.0d0*(v808 + v836 + v841 &
      + v850) - 36.0d0*(v809 + v811 + v856 + v913) - 420.0d0*(v835 + &
      v840 + v876 + v900) - 110.0d0*(v851 + v853 + v854 + v911) - &
      65.0d0*(v855 + v908 + v910 + v912) - 27.0d0*(v857 + v884 + v887 + &
      v914) + 480.0d0*(-v860 + v861 - v865 + v869) - 30.0d0*(M_xxyyyyz &
      + v805 + v863 + v898 + v928) + 60.0d0*(v838 - v845 - v902 + v916 &
      - v917 - v920) - 12.0d0*(v847 + v877 + v879 + v880 + v894 + v904 &
      ))
    S_xxxxyzz   = -(S_xxxxxxy + S_xxxxyyy)
    v1112       = M_y*S_xxxxyzz
    v1353       = M_x*S_xxxxyzz
    v1886       = M_z*S_xxxxyzz
    S_xxxxzzz   = -(S_xxxxxxz + S_xxxxyyz)
    v1306       = M_z*S_xxxxzzz
    v1505       = M_x*S_xxxxzzz
    v1832       = M_y*S_xxxxzzz
    S_xxxyyyy   = x*(v1046 + v1927 + 0.00699300699300699d0*(-33.0d0*v525 + 18.0d0*v527))
    v1125       = M_x*S_xxxyyyy
    v1467       = M_y*S_xxxyyyy
    v1687       = M_z*S_xxxyyyy
    Ms_xxxyyyy  = M_0*S_xxxyyyy + v936 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + v545 + v548 + v598 + v651 + 330.0d0*(v543 &
      + v588) + 9.0d0*(v549 + v561) + 420.0d0*(v552 + v611) + 25.0d0*( &
      v554 + v559) + 200.0d0*(v557 + v639) + 30.0d0*(v568 + v622) + &
      560.0d0*(v571 + v637) + 630.0d0*(v573 + v633) + 380.0d0*(v574 + &
      v628) + 40.0d0*(v578 + v593) + 1320.0d0*(v584 + v609) + 1710.0d0* &
      (v586 + v605) + 1140.0d0*(v587 + v600) + 6.0d0*(v565 + v582 + &
      v597 + v620 + v624 + v626 + v650 + v653 + v655 + v657) - ( &
      M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + v540 + 150.0d0*v541 + 15.0d0*v544 + 16.0d0*v546 + &
      15.0d0*v547 + 270.0d0*v550 + 15.0d0*v551 + 15.0d0*v553 + 270.0d0* &
      v555 + 15.0d0*v556 + 15.0d0*v558 + 150.0d0*v560 + 18.0d0*v562 + &
      v563 + 30.0d0*v564 + 270.0d0*v566 + 150.0d0*v567 + 480.0d0*v570 + &
      270.0d0*v572 + 120.0d0*v575 + 240.0d0*v576 + 30.0d0*v577 + &
      140.0d0*v579 + 15.0d0*v580 + 30.0d0*v581 + 480.0d0*v583 + 270.0d0 &
      *v585 + 240.0d0*v589 + 15.0d0*v590 + 480.0d0*v591 + 30.0d0*v592 + &
      260.0d0*v594 + 15.0d0*v595 + 30.0d0*v596 + 270.0d0*v599 + 30.0d0* &
      v601 + 96.0d0*v602 + 30.0d0*v603 + 150.0d0*v604 + 30.0d0*v606 + &
      150.0d0*v607 + 30.0d0*v608 + 140.0d0*v610 + 150.0d0*v612 + 96.0d0 &
      *v613 + 60.0d0*v614 + 30.0d0*v615 + 260.0d0*v616 + 140.0d0*v617 + &
      15.0d0*v618 + 30.0d0*v619 + 480.0d0*v621 + 240.0d0*v623 + 60.0d0* &
      v625 + 30.0d0*v627 + 30.0d0*v629 + 96.0d0*v630 + 30.0d0*v631 + &
      18.0d0*v632 + 30.0d0*v634 + 150.0d0*v635 + 30.0d0*v636 + 140.0d0* &
      v638 + 150.0d0*v640 + 96.0d0*v641 + 16.0d0*v642 + 60.0d0*v643 + &
      15.0d0*v644 + 30.0d0*v645 + 140.0d0*v646 + 140.0d0*v647 + 15.0d0* &
      v648 + 30.0d0*v649 + 240.0d0*v652 + 120.0d0*v654 + 60.0d0*v656 + &
      143.0d0*v940 + 143.0d0*v942 + 143.0d0*v944 + 143.0d0*v946))
    S_xxxyyyz   = -v3*0.00699300699300699d0*(-9.0d0*v39 - 143.0d0*v84 + 33.0d0*(v106 + v41 &
      ))
    v1347       = M_z*S_xxxyyyz
    v1643       = M_y*S_xxxyyyz
    v1722       = M_x*S_xxxyyyz
    Ms_xxxyyyz  = 0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*(v950 + v982) + 945.0d0*(v956 + v961) + 345.0d0*(v1000 + &
      v1007 + v1026 + v987) + 245.0d0*(v1003 + v1029 + v1034 + v990) + &
      525.0d0*(v1009 + v1014 + v1036 + v998) + 1125.0d0*(v1005 + v1008 &
      + v1012 + v1019 + v955 + v968) - 60.0d0*(v1001 + v1002 + v1004 + &
      v1013 + v1018 + v1028 + v1035 + v989) + 465.0d0*(v1006 + v1023 + &
      v1038 + v949 + v951 + v964 + v975 + v999) - 75.0d0*(v1010 + v1011 &
      + v1017 + v1027 + v1033 + v986 + v996 + v997) + 15.0d0*(v1015 + &
      v1020 + v1021 + v1022 + v1030 + v1039 + v991 + v995) + 21.0d0*( &
      v1016 + v1024 + v1031 + v1037 + v1040 + v1041 + v992 + v993) - &
      45.0d0*(v952 + v953 + v957 + v959 + v965 + v966 + v969 + v970 + &
      v971 + v972 + v976 + v978 + v980 + v981 + v983 + v984) - 9.0d0*( &
      M_xxxxxyz + M_xxxyzzz + M_xyyyyyz + M_xyyyzzz + v1025 + v1032 + &
      v947 + v948 + v954 + v958 + v960 + v962 + v963 + v967 + v973 + &
      v974 + v977 + v979 + v988 + v994))
    S_xxxyyzz   = -(S_xxxxxyy + S_xxxyyyy)
    v1126       = M_x*S_xxxyyzz
    v1468       = M_y*S_xxxyyzz
    v1688       = M_z*S_xxxyyzz
    S_xxxyzzz   = -(S_xxxxxyz + S_xxxyyyz)
    v1348       = M_z*S_xxxyzzz
    v1644       = M_y*S_xxxyzzz
    v1723       = M_x*S_xxxyzzz
    S_xxxzzzz   = -(S_xxxxxzz + S_xxxyyzz)
    v1127       = M_x*S_xxxzzzz
    v1338       = M_y*S_xxxzzzz
    v1689       = M_z*S_xxxzzzz
    S_xxyyyyy   = y*(0.00699300699300699d0*(10.0d0*v527) + v1083 + v1924 + v4*v931 + v526)
    v1247       = M_y*S_xxyyyyy
    v1354       = M_x*S_xxyyyyy
    v1887       = M_z*S_xxyyyyy
    Ms_xxyyyyy  = M_0*S_xxyyyyy + v1048 + v1049 + v1050 + v1052 + v1053 + v674 - v677 - &
      v752 - v771 + 0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0* &
      M_yyyyyyy - 1080.0d0*(v1051 + v1054) - 780.0d0*(v679 + v704) + &
      732.0d0*(v681 + v739) - 1110.0d0*(v684 + v716) + 444.0d0*(v686 + &
      v765) - 420.0d0*(v689 + v736) - 1380.0d0*(v702 + v734) - 1740.0d0 &
      *(v703 + v730) - 2790.0d0*(v710 + v714) + 1620.0d0*(v712 + v763) &
      + 2730.0d0*(v715 + v759) + 2550.0d0*(v717 + v754) + 1350.0d0*( &
      v718 + v749) - 600.0d0*(v719 + v784) - 1560.0d0*(v720 + v781) - &
      1660.0d0*(v722 + v776) - 700.0d0*(v726 + v772) + 2820.0d0*(v732 + &
      v738) + 5160.0d0*(v735 + v737) - 2760.0d0*(v741 + v744) - 116.0d0 &
      *(v750 + v767) - 210.0d0*(v756 + v766) - 190.0d0*(v761 + v764) - &
      36.0d0*(v768 + v785) - 100.0d0*(v773 + v777) - 35.0d0*(M_xxxxxxy &
      + v693 + v746) + 255.0d0*(v683 + v690 + v695 + v709) + 560.0d0*( &
      v688 + v701 + v721 + v725) - 120.0d0*(v697 + v724 + v747 + v755 + &
      v757 + v775) + 90.0d0*(-M_xxxxyyy + v691 - v728 + v758 - v760 - &
      v762 - v779) + 30.0d0*(-M_xxxxyzz + v698 + v699 - v700 - v748 + &
      v780 + v783) - 105.0d0*(v685 + v687 + v711 + v713 + v723 + v727 + &
      v774 + v778) + 60.0d0*(-v678 - v680 - v682 - v692 - v694 + v696 - &
      v706 - v708 - v729 - v731 - v733 - v740 - v742 + v753 - v769 - &
      v782))
    S_xxyyyyz   = z*(0.00699300699300699d0*(6.0d0*v527) + v1055 + v1083 + v1927)
    v1307       = M_z*S_xxyyyyz
    v1506       = M_x*S_xxyyyyz
    v1833       = M_y*S_xxyyyyz
    Ms_xxyyyyz  = M_0*S_xxyyyyz + v1084 + v1926 + v1932 - v801 + v821 - v846 - v848 - v878 &
      - v881 - v899 - v903 - v905 - v918 - v921 + v924 - v929 + &
      0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0*M_xxxxzzz + &
      2520.0d0*(v1070 + v1071) + 780.0d0*(v805 + v863) + 45.0d0*(v807 + &
      v823) - 270.0d0*(v808 + v841) + 540.0d0*(v810 + v895) + 40.0d0*( &
      v812 + v830) + 300.0d0*(v813 + v864) - 105.0d0*(v814 + v849) + &
      330.0d0*(v815 + v906) - 132.0d0*(v816 + v870) - 37.0d0*(v817 + &
      v922) + 570.0d0*(v819 + v915) - 720.0d0*(v829 + v858) + 1560.0d0* &
      (v835 + v900) - 450.0d0*(v836 + v850) + 1860.0d0*(v838 + v916) + &
      690.0d0*(v839 + v926) + 1260.0d0*(v840 + v876) + 2160.0d0*(v844 + &
      v888) + 840.0d0*(v852 + v890) + 4200.0d0*(v860 + v865) + 3720.0d0 &
      *(v861 + v869) + 1380.0d0*(v862 + v873) - 20.0d0*(v889 + v901) - &
      90.0d0*(v891 + v909) - 16.0d0*(M_yyyyyyz + v893 + v927) - 420.0d0 &
      *(v803 + v828 + v831 + v859) - 27.0d0*(v809 + v811 + v856 + v913 &
      ) + 480.0d0*(v826 - v834 - v843 + v868) + 2250.0d0*(v837 + v842 + &
      v883 + v907) - 65.0d0*(v851 + v853 + v854 + v911) - 110.0d0*(v855 &
      + v908 + v910 + v912) - 36.0d0*(v857 + v884 + v887 + v914) - &
      96.0d0*(v879 + v892 + v894 + v919) - 30.0d0*(M_xxxxyyz + v822 + &
      v825 + v875 + v925) - 12.0d0*(v802 + v804 + v806 + v818 + v833 + &
      v867) + 60.0d0*(v827 - v832 - v866 + v871 - v872 - v874))
    S_xxyyyzz   = -(S_xxxxyyy + S_xxyyyyy)
    v1248       = M_y*S_xxyyyzz
    v1355       = M_x*S_xxyyyzz
    v1888       = M_z*S_xxyyyzz
    S_xxyyzzz   = -(S_xxxxyyz + S_xxyyyyz)
    v1118       = M_z*S_xxyyzzz
    v1507       = M_x*S_xxyyzzz
    v1709       = M_y*S_xxyyzzz
    S_xxyzzzz   = -(S_xxxxyzz + S_xxyyyzz)
    v1249       = M_y*S_xxyzzzz
    v1312       = M_x*S_xxyzzzz
    v1718       = M_z*S_xxyzzzz
    S_xxzzzzz   = -(S_xxxxzzz + S_xxyyzzz)
    v1119       = M_z*S_xxzzzzz
    v1508       = M_x*S_xxzzzzz
    v1710       = M_y*S_xxzzzzz
    S_xyyyyyy   = v1085*x
    v1128       = M_x*S_xyyyyyy
    v1469       = M_y*S_xyyyyyy
    v1690       = M_z*S_xyyyyyy
    Ms_xyyyyyy  = M_0*S_xyyyyyy - v1086 + v539 + v934 + v935 + v937 + v938 + &
      0.00233100233100233d0*(10.0d0*M_xxxxxxx - 105.0d0*M_xxxxxyy - &
      45.0d0*(v541 + v567) - 1200.0d0*(v543 + v588) - 120.0d0*(v547 + &
      v644) + 1020.0d0*(v550 + v572) - 220.0d0*(v554 + v559) + 840.0d0* &
      (v555 + v585) - 315.0d0*(v560 + v604) + 150.0d0*(v573 + v633) - &
      160.0d0*(v578 + v593) - 3870.0d0*(v586 + v605) + 1140.0d0*(v589 + &
      v623) + 1040.0d0*(v594 + v616) + 4640.0d0*(v610 + v638) - &
      3940.0d0*(v617 + v647) + 304.0d0*(M_xyyyyyy + v546 + v642) + &
      40.0d0*(v540 + v563 - v579 - v646) + 1344.0d0*(v602 + v613 + v630 &
      + v641) - 2880.0d0*(v939 + v941 + v943 + v945) + 480.0d0*(-v552 + &
      v557 - v574 - v611 - v628 + v639) + 60.0d0*(-v556 - v558 + v575 - &
      v595 - v648 + v654) + 1920.0d0*(v570 + v583 - v584 + v591 - v609 &
      + v621) + 960.0d0*(v571 - v614 - v625 + v637 - v643 - v656) + &
      3360.0d0*(-v587 - v600 + v607 + v612 + v635 + v640) + 30.0d0*( &
      -v549 - v551 - v553 - v561 + v565 + v568 - v580 - v618 + v622 + &
      v653) - 195.0d0*(v562 + v581 + v596 + v606 + v608 + v619 + v632 + &
      v634 + v636 + v649) - 240.0d0*(M_xxxyyyy + v564 + v566 + v577 + &
      v592 + v599 + v601 + v603 + v615 + v627 + v629 + v631 + v645))
    S_xyyyyyz   = v3*(0.0769230769230769d0*(-10.0d0*v106) + v105 + v931)
    v1502       = M_z*S_xyyyyyz
    v1645       = M_y*S_xyyyyyz
    v1724       = M_x*S_xyyyyyz
    Ms_xyyyyyz  = M_0*S_xyyyyyz + M_xyyy*v536 + M_xyyz*v537 + v985 + 0.00699300699300699d0 &
      *(-30.0d0*(v1000 + v1026) - 270.0d0*(v1006 + v1023) - 250.0d0*( &
      v1007 + v987) + 390.0d0*(v1038 + v999) + 1430.0d0*(M_yyy*S_xyyz + &
      M_yyz*S_xyyy) + 128.0d0*(M_xyyyyyz + v1032 + v988) + 120.0d0*( &
      v1001 + v1002 + v1004 + v989) + 60.0d0*(v1003 + v1005 + v1019 + &
      v1029) + 600.0d0*(-v1008 - v1012 + v1036 + v998) + 280.0d0*( &
      -v1009 - v1014 + v1034 + v990) + 480.0d0*(v1011 + v1017 + v1027 + &
      v1033) + 1110.0d0*(v1013 + v1018 + v1028 + v1035) + 960.0d0*( &
      v1015 + v1021 + v1030 + v1039) + 288.0d0*(v1016 + v1024 + v1031 + &
      v1041) - 195.0d0*(v1020 + v1022 + v991 + v995) - 75.0d0*(v1037 + &
      v1040 + v992 + v993) - 15.0d0*(M_xxxxxyz + v1010 + v1025 + v986 + &
      v994 + v996 + v997))
    S_xyyyyzz   = -(S_xxxyyyy + S_xyyyyyy)
    v1092       = M_x*S_xyyyyzz
    v1470       = M_y*S_xyyyyzz
    v1691       = M_z*S_xyyyyzz
    S_xyyyzzz   = -(S_xxxyyyz + S_xyyyyyz)
    v1349       = M_z*S_xyyyzzz
    v1646       = M_y*S_xyyyzzz
    v1725       = M_x*S_xyyyzzz
    S_xyyzzzz   = -(S_xxxyyzz + S_xyyyyzz)
    v1129       = M_x*S_xyyzzzz
    v1339       = M_y*S_xyyzzzz
    v1692       = M_z*S_xyyzzzz
    S_xyzzzzz   = -(S_xxxyzzz + S_xyyyzzz)
    S_xzzzzzz   = -(S_xxxzzzz + S_xyyzzzz)
    S_yyyyyyy   = y*(0.00699300699300699d0*(-231.0d0*v525 + 105.0d0*v527) + v535 + v538)
    v1250       = M_y*S_yyyyyyy
    v1356       = M_x*S_yyyyyyy
    v1889       = M_z*S_yyyyyyy
    Ms_yyyyyyy  = M_0*S_yyyyyyy + v676 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      1680.0d0*(v684 + v716) + 5040.0d0*(v710 + v714) + 1470.0d0*(v715 &
      + v759) - 1050.0d0*(v717 + v754) - 1260.0d0*(v718 + v749) - &
      7980.0d0*(v735 + v737) + 5880.0d0*(v741 + v744) + 952.0d0*(v750 + &
      v767) - 630.0d0*(v751 + v770) + 3444.0d0*(v756 + v766) + 6860.0d0 &
      *(v761 + v764) - 7420.0d0*(v773 + v777) + 70.0d0*(M_xxxxxxy + &
      v693 + v746) + 105.0d0*(-M_xxxxyyy + M_xxxxyzz + v700 + v748) + &
      2520.0d0*(v1051 + v1054 + v712 + v763) - 525.0d0*(v660 + v664 + &
      v697 + v747) - 1176.0d0*(v681 + v739 + v768 + v785) - 1120.0d0*( &
      v688 + v701 + v721 + v725) - 280.0d0*(v722 + v726 + v772 + v776) &
      - 4200.0d0*(v732 + v738 + v769 + v782) + 35.0d0*(M_xxyzzzz + &
      M_yyyzzzz + v663 + v665 + v666 + v669) + 840.0d0*(v686 - v689 - &
      v702 - v734 - v736 + v765) - 735.0d0*(v691 + v728 + v758 + v760 + &
      v762 + v779) - 1155.0d0*(v696 + v724 + v753 + v755 + v757 + v775 &
      ) + 420.0d0*(-M_xxyyyyy + v679 - v683 - v685 - v687 - v690 - v695 &
      + v703 + v704 - v709 - v711 - v713 + v719 + v720 - v723 - v727 + &
      v730 - v774 - v778 + v781 + v784) + 210.0d0*(-M_yyyyyzz + v661 + &
      v662 + v667 + v668 + v670 + v671 + v672 + v673 + v678 + v680 + &
      v682 + v692 + v694 + v698 + v699 + v706 + v708 + v729 + v731 + &
      v733 + v740 + v742 + v780 + v783))
    S_yyyyyyz   = v1085*z
    v1308       = M_z*S_yyyyyyz
    v1509       = M_x*S_yyyyyyz
    v1834       = M_y*S_yyyyyyz
    Ms_yyyyyyz  = M_0*S_yyyyyyz + v1056 + v1058 + v1062 + v1063 + v1064 + v1065 + v1066 - &
      v1067 + v1072 + v1073 + v1074 + v1075 + v1077 - v1078 + v786 + &
      v787 + v788 + v790 + v792 + v794 + v796 + v798 + v800 + &
      0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0*M_xxxxyyz + &
      304.0d0*M_yyyyyyz - 2880.0d0*(v1070 + v1071) + 30.0d0*(v802 + &
      v818) + 900.0d0*(v808 + v841) + 1440.0d0*(v810 + v895) - 160.0d0* &
      (v812 + v830) - 735.0d0*(v815 + v906) + 150.0d0*(v816 + v870) + &
      40.0d0*(v817 + v922) - 555.0d0*(v820 + v923) - 780.0d0*(v827 + &
      v871) + 3840.0d0*(v835 + v900) + 1080.0d0*(v836 + v850) + &
      2970.0d0*(v837 + v907) - 5100.0d0*(v860 + v865) - 4800.0d0*(v861 &
      + v869) + 1344.0d0*(v879 + v894) + 4320.0d0*(v885 + v896) + &
      7520.0d0*(v889 + v901) + 6720.0d0*(v891 + v909) + 3264.0d0*(v892 &
      + v919) + 784.0d0*(v893 + v927) - 600.0d0*(v898 + v928) - 120.0d0 &
      *(M_yyyyzzz + v831 + v859) + 60.0d0*(v803 + v814 + v828 + v849) + &
      960.0d0*(-v805 + v844 - v863 + v888) - 100.0d0*(v851 + v853 + &
      v854 + v911) - 775.0d0*(v855 + v908 + v910 + v912) + 90.0d0*( &
      -v809 - v811 + v842 - v856 + v883 - v913) - 225.0d0*(v824 + v857 &
      + v882 + v884 + v887 + v914) + 1920.0d0*(-v826 + v834 + v843 - &
      v862 - v868 - v873) + 480.0d0*(v838 - v840 + v852 - v876 + v890 + &
      v916) - 240.0d0*(M_xxyyyyz + v822 + v847 + v875 + v877 + v880 + &
      v904) - 1200.0d0*(v813 + v819 + v845 + v864 + v902 + v915 + v917 &
      + v920))
    S_yyyyyzz   = -(S_xxyyyyy + S_yyyyyyy)
    v1251       = M_y*S_yyyyyzz
    v1357       = M_x*S_yyyyyzz
    v1890       = M_z*S_yyyyyzz
    S_yyyyzzz   = -(S_xxyyyyz + S_yyyyyyz)
    v1309       = M_z*S_yyyyzzz
    v1510       = M_x*S_yyyyzzz
    v1835       = M_y*S_yyyyzzz
    S_yyyzzzz   = -(S_xxyyyzz + S_yyyyyzz)
    v1252       = M_y*S_yyyzzzz
    v1313       = M_x*S_yyyzzzz
    v1350       = 0.00699300699300699d0*(-35.0d0*M_xxxyyyzz + 7.0d0*(v1312 + v1313 + &
      12.0d0*v1314 + 6.0d0*v1315 - 8.0d0*v1316 + 6.0d0*v1317 + v1318 + &
      228.0d0*v1319 - 15.0d0*v1320 + 208.0d0*v1321 + 6.0d0*v1322 + &
      v1323 + 6.0d0*v1324 + v1325 - 15.0d0*v1326 + v1327 + v1328 + &
      6.0d0*v1329 + 208.0d0*v1330 + 6.0d0*v1331 + v1332 + 228.0d0*v1333 &
      + 6.0d0*v1334 + 6.0d0*v1335 + 6.0d0*v1336 + 6.0d0*v1337 + v1338 + &
      v1339 - 8.0d0*v1340 + 6.0d0*v1341 + v1342 + 6.0d0*v1343 + v1344 + &
      6.0d0*v1345 + 6.0d0*v1346 + 12.0d0*v1347 + 6.0d0*v1348 + 6.0d0* &
      v1349 + v1918))
    v1719       = M_z*S_yyyzzzz
    v1895       = 0.00233100233100233d0*(-45.0d0*M_xxxyyyzz - 464.0d0*(v1314 + v1347) - &
      644.0d0*(v1316 + v1340) - 3096.0d0*(v1319 + v1333) - 135.0d0*( &
      v1320 + v1326) - 3276.0d0*(v1321 + v1330) + 9.0d0*(M_xxxyzzzz + &
      M_xyyyzzzz + v1312 + v1313 + v1318 + v1323 + v1325 + v1327 + &
      v1328 + v1332 + v1338 + v1339 + v1342 + v1344) + 54.0d0*(v1315 + &
      v1317 + v1322 + v1324 + v1329 + v1331 + v1334 + v1335 + v1336 + &
      v1337 + v1341 + v1343 + v1345 + v1346 + v1348 + v1349))
    S_yyzzzzz   = -(S_xxyyzzz + S_yyyyzzz)
    v1120       = M_z*S_yyzzzzz
    v1928       = 28.0d0*M_xxyyzzzz + 168.0d0*(v1101 + v1118) + 70.0d0*(v1103 + v1104 + &
      v1115 + v1116) - (M_xxzzzzzz + M_yyzzzzzz + 8.0d0*v1105 + 8.0d0* &
      v1117 + 8.0d0*v1119 + 8.0d0*v1120)
    v1121       = 0.000777000777000777d0*(33768.0d0*v1098 + 7.0d0*(192.0d0*v1092 - 576.0d0 &
      *v1093 + 192.0d0*v1094 - 1536.0d0*v1095 + 768.0d0*v1096 + 384.0d0 &
      *v1097 - 324.0d0*v1099 - 324.0d0*v1100 - 324.0d0*v1102 + 768.0d0* &
      v1106 + 384.0d0*v1107 + 384.0d0*v1108 - 1536.0d0*v1109 + 192.0d0* &
      v1110 + 384.0d0*v1111 + 192.0d0*v1112 - 576.0d0*v1113 - 324.0d0* &
      v1114 + v1928))
    v1511       = M_x*S_yyzzzzz
    v1697       = 0.000777000777000777d0*(-495.0d0*M_xxxxyyyy - 20124.0d0*v1098 + v1928 + &
      711.0d0*(v1093 + v1113) - 4704.0d0*(v1095 + v1109) - 9528.0d0*( &
      v1096 + v1106) - 402.0d0*(v1092 + v1094 + v1110 + v1112) - &
      804.0d0*(v1097 + v1107 + v1108 + v1111) - 621.0d0*(v1099 + v1100 &
      + v1102 + v1114))
    v1711       = M_y*S_yyzzzzz
    v1720       = 0.00699300699300699d0*(v1708 + v1710 + v1711 + v1714 + v1920 - 105.0d0*( &
      v1704 + v1715) - 21.0d0*(v1705 + v1709) + 7.0d0*(v1706 + v1707 + &
      v1712 + v1713 + v1716 + v1717 + v1718 + v1719))
    v1897       = 0.00699300699300699d0*(v1508 + v1511 + v1593 + v1678 + v1919 - 21.0d0*( &
      v1507 + v1578) - 105.0d0*(v1577 + v1637) + 7.0d0*(v1566 + v1592 + &
      v1627 + v1638 + v1641 + v1677 + v1689 + v1692))
    S_yzzzzzz   = -(S_xxyzzzz + S_yyyzzzz)
    S_zzzzzzz   = -(S_xxzzzzz + S_yyzzzzz)
    S_xxxxxxxx  = a8 + v1088 + 0.000466200466200466d0*(-4004.0d0*v1089 + 2310.0d0*v1090 - &
      420.0d0*v1091)
    Ms_xxxxxxxx = M_0*S_xxxxxxxx + v1121 + 0.000155400155400155d0*(1920.0d0*M_xxxxxxxx + &
      3150.0d0*M_xxyyyyzz - 105.0d0*M_yyyyyyyy - 210.0d0*M_yyyyyyzz - &
      140.0d0*M_yyyyzzzz + 183680.0d0*v1144 - 259840.0d0*v1171 - &
      224000.0d0*v1178 + 220640.0d0*v1203 + 5810.0d0*v1268 + 11776.0d0* &
      (v1122 + v1152) + 52416.0d0*(v1130 + v1150) - 36960.0d0*(v1132 + &
      v1168) - 32340.0d0*(v1133 + v1193) - 31500.0d0*(v1134 + v1201) + &
      5460.0d0*(v1137 + v1279) + 134400.0d0*(v1139 + v1148) - &
      188160.0d0*(v1159 + v1184) - 170240.0d0*(v1166 + v1209) - &
      8960.0d0*(v1167 + v1288) + 107520.0d0*(v1173 + v1223) + &
      161280.0d0*(v1177 + v1239) - 17920.0d0*(v1179 + v1233) - 8400.0d0 &
      *(v1185 + v1191) - 7980.0d0*(v1190 + v1266) - 33600.0d0*(v1192 + &
      v1262) - 14280.0d0*(v1194 + v1256) + 7280.0d0*(v1199 + v1210) - &
      38080.0d0*(v1200 + v1289) - 12600.0d0*(v1202 + v1257) - 71680.0d0 &
      *(v1227 + v1234) + 4480.0d0*(v1128 + v1231 + v1283) - 20160.0d0*( &
      v1146 + v1147 + v1214 + v1293) - 17024.0d0*(v1153 + v1154 + v1245 &
      + v1304) - 75264.0d0*(v1155 + v1157 + v1220 + v1240) - 280.0d0*( &
      v1208 + v1249 + v1252 + v1287) + 1890.0d0*(v1215 + v1267 + v1269 &
      + v1294) - 560.0d0*(v1250 + v1273 + v1274 + v1308) + 2100.0d0*( &
      M_xxyyyyyy + v1135 + v1138 + v1218 + v1297) + 2240.0d0*(v1127 + &
      v1129 + v1183 + v1204 + v1238 + v1282) + 53760.0d0*(v1145 + v1149 &
      + v1165 + v1189 + v1222 + v1299) + 10920.0d0*(v1186 + v1187 + &
      v1188 + v1205 + v1270 + v1284) + 5880.0d0*(v1195 + v1196 + v1198 &
      + v1247 + v1248 + v1307) - 1680.0d0*(v1207 + v1275 + v1286 + &
      v1301 + v1302 + v1303) + 8680.0d0*(v1211 + v1212 + v1213 + v1216 &
      + v1277 + v1295) + 6720.0d0*(-M_xxxxxxyy - v1125 - v1126 + v1170 &
      - v1174 - v1176 + v1306) + 1120.0d0*(M_xxxxzzzz + v1217 + v1278 + &
      v1290 + v1291 + v1292 + v1296) - 47040.0d0*(v1131 + v1141 + v1142 &
      + v1143 + v1161 + v1180 + v1228 + v1235) + 840.0d0*(v1219 - v1251 &
      + v1258 + v1259 + v1260 - v1276 + v1280 - v1281 + v1298 - v1309) &
      + 3360.0d0*(-M_xxxxxxzz + v1136 - v1197 + v1206 + v1263 + v1264 + &
      v1265 + v1271 + v1272 + v1285 - v1300) + 26880.0d0*(-v1123 - &
      v1156 - v1160 + v1162 + v1175 - v1181 - v1224 - v1225 - v1226 - &
      v1229 - v1236 + v1241 + v1254 - v1261) + 13440.0d0*(-v1124 - &
      v1140 + v1151 - v1158 + v1163 + v1164 - v1169 - v1172 + v1182 + &
      v1221 + v1230 + v1232 + v1237 + v1242 + v1243 + v1244 + v1246 + &
      v1253 - v1255 + v1305))
    S_xxxxxxxy  = v0*v1311
    Ms_xxxxxxxy = M_0*S_xxxxxxxy + v1350 + 0.0013986013986014d0*(-560.0d0*M_xxxxxyyy - &
      175.0d0*M_xxxyyyyy - 1680.0d0*(v1352 + v1384) - 1190.0d0*(v1359 + &
      v1396) + 2170.0d0*(v1364 + v1415) - 672.0d0*(v1376 + v1471) - &
      2352.0d0*(v1377 + v1465) - 8400.0d0*(v1383 + v1429) - 10290.0d0*( &
      v1390 + v1413) - 1645.0d0*(v1392 + v1481) - 13650.0d0*(v1394 + &
      v1409) + 1400.0d0*(v1395 + v1477) + 2660.0d0*(v1397 + v1472) + &
      245.0d0*(v1398 + v1467) + 3500.0d0*(v1399 + v1499) + 35.0d0*( &
      v1400 + v1468) + 2800.0d0*(v1402 + v1494) - 2205.0d0*(v1411 + &
      v1444) + 5880.0d0*(v1414 + v1440) + 7140.0d0*(v1416 + v1435) + &
      400.0d0*(M_xxxxxxxy + v1373 + v1464) + 70.0d0*(M_xyyyyyyy + v1356 &
      + v1486) + 105.0d0*(M_xyyyyyzz + v1357 + v1488) + 2128.0d0*(v1351 &
      + v1372 + v1374 + v1428) - 840.0d0*(v1353 + v1386 + v1388 + v1430 &
      ) - 735.0d0*(v1354 + v1355 + v1418 + v1420) + 12320.0d0*(v1363 + &
      v1368 + v1381 + v1389) + 3360.0d0*(v1369 - v1382 - v1434 + v1439 &
      ) - 1792.0d0*(v1378 + v1379 + v1498 + v1501) - 11900.0d0*(v1401 + &
      v1405 + v1421 + v1424) - 1540.0d0*(v1442 + v1445 + v1479 + v1482 &
      ) + 1120.0d0*(v1371 - v1453 - v1456 + v1476 - v1491 - v1495) + &
      315.0d0*(-v1417 - v1431 + v1433 + v1451 + v1470 + v1490) + &
      6720.0d0*(v1358 + v1370 + v1375 - v1385 - v1387 + v1408 - v1459 - &
      v1461) + 280.0d0*(-M_xxxxxyzz - v1380 - v1425 + v1432 + v1448 - &
      v1452 - v1466 + v1469 + v1485) - 1365.0d0*(v1360 + v1361 + v1362 &
      + v1403 + v1406 + v1410 + v1412 + v1446 + v1454 + v1457) - &
      805.0d0*(v1365 + v1366 + v1367 + v1391 + v1393 + v1422 + v1426 + &
      v1483 + v1492 + v1496) + 420.0d0*(-v1407 + v1419 - v1427 - v1441 &
      - v1443 - v1458 + v1462 - v1478 - v1480 - v1497) + 210.0d0*( &
      -v1404 - v1423 - v1436 - v1437 - v1438 - v1447 + v1449 + v1450 - &
      v1455 + v1460 + v1463 - v1473 - v1474 - v1475 - v1484 + v1487 + &
      v1489 - v1493 + v1500 + v1502))
    S_xxxxxxxz  = v1*v1311
    Ms_xxxxxxxz = 0.0013986013986014d0*(715.0d0*M_0*S_xxxxxxxz + 400.0d0*M_xxxxxxxz - &
      560.0d0*M_xxxxxyyz - 175.0d0*(M_xxxyyyyz + M_xxxyyzzz) + 2128.0d0 &
      *(v1503 + v1528) + 8512.0d0*(v1512 + v1532) - 1610.0d0*(v1513 + &
      v1550) + 19040.0d0*(v1517 + v1539) + 1750.0d0*(v1518 + v1575) + &
      22400.0d0*(v1522 + v1557) + 3360.0d0*(v1523 + v1618) + 14560.0d0* &
      (v1524 + v1583) + 5488.0d0*(v1526 + v1633) + 1072.0d0*(v1527 + &
      v1684) - 4032.0d0*(v1529 + v1679) - 1008.0d0*(v1530 + v1685) - &
      1792.0d0*(v1531 + v1642) + 2912.0d0*(v1533 + v1647) - 1400.0d0*( &
      v1534 + v1686) - 13440.0d0*(v1535 + v1628) - 6720.0d0*(v1538 + &
      v1594) + 10080.0d0*(v1540 + v1599) - 4200.0d0*(v1541 + v1635) - &
      20020.0d0*(v1543 + v1579) + 2870.0d0*(v1545 + v1584) + 3080.0d0*( &
      v1546 + v1669) - 980.0d0*(v1547 + v1680) - 1085.0d0*(v1548 + &
      v1687) + 1820.0d0*(v1551 + v1648) - 875.0d0*(v1552 + v1688) - &
      15540.0d0*(v1553 + v1567) - 3920.0d0*(v1554 + v1652) + 10710.0d0* &
      (v1558 + v1569) - 2345.0d0*(v1560 + v1654) + 7560.0d0*(v1570 + &
      v1619) - 5460.0d0*(v1571 + v1629) - 3885.0d0*(v1572 + v1636) + &
      6300.0d0*(v1576 + v1600) - 3675.0d0*(v1577 + v1637) - 8400.0d0*( &
      v1580 + v1604) - 5145.0d0*(v1586 + v1606) + 70.0d0*(M_xyyyyyyz + &
      v1509 + v1658) + 105.0d0*(M_xyyyyzzz + v1510 + v1663) - 1680.0d0* &
      (v1504 + v1536 + v1537 + v1634) - 735.0d0*(v1506 + v1507 + v1573 &
      + v1578) - 2625.0d0*(v1559 + v1561 + v1588 + v1673) - 5425.0d0*( &
      v1562 + v1585 + v1587 + v1623) + 525.0d0*(v1613 + v1640 + v1662 + &
      v1691) + 280.0d0*(-M_xxxxxzzz + v1609 + v1639 + v1657 + v1690) + &
      35.0d0*(M_xxxzzzzz + M_xyyzzzzz + v1508 + v1511 + v1593 + v1678) &
      - 840.0d0*(v1505 + v1542 + v1544 + v1568 + v1614 + v1664) - &
      1575.0d0*(v1514 + v1515 + v1516 + v1564 + v1611 + v1625) - &
      1015.0d0*(v1519 + v1520 + v1521 + v1590 + v1660 + v1675) + &
      1120.0d0*(v1525 - v1605 - v1615 - v1653 - v1665 + v1668) + &
      420.0d0*(v1549 + v1574 + v1595 + v1607 + v1621 + v1643 + v1655 + &
      v1671) - 700.0d0*(v1563 + v1589 + v1620 + v1622 + v1624 + v1670 + &
      v1672 + v1674) + 245.0d0*(v1566 + v1592 + v1627 + v1638 + v1641 + &
      v1677 + v1689 + v1692) + 1050.0d0*(v1555 + v1581 + v1608 + v1616 &
      + v1630 + v1631 + v1632 + v1656 + v1666 + v1681 + v1682 + v1683) &
      + 210.0d0*(v1556 + v1582 + v1596 + v1597 + v1598 + v1610 + v1617 &
      + v1644 + v1645 + v1646 + v1659 + v1667) - 630.0d0*(v1565 + v1591 &
      + v1601 + v1602 + v1603 + v1612 + v1626 + v1649 + v1650 + v1651 + &
      v1661 + v1676))
    S_xxxxxxyy  = 0.00512820512820513d0*(-13.0d0*v1089 + 15.0d0*v1090) - v1042*v5 + v1694 &
      - v1695*v4 - v1696 + v245*v5
    Ms_xxxxxxyy = M_0*S_xxxxxxyy + v1697 + v1699 + v1701 + 0.000155400155400155d0*( &
      -240.0d0*M_xxxxxxxx + 4800.0d0*M_xxxxxxyy - 120.0d0*M_xxxxxxzz - &
      1125.0d0*M_xxxxyyzz + 115.0d0*M_xxxxzzzz - 1005.0d0*M_xxyyyyyy - &
      900.0d0*M_xxyyyyzz + 75.0d0*M_yyyyyyyy + 105.0d0*M_yyyyyyzz + &
      25.0d0*M_yyyyzzzz - 5440.0d0*v1144 + 142520.0d0*v1171 - 1400.0d0* &
      v1178 - 97720.0d0*v1203 - 3130.0d0*v1268 - 1568.0d0*(v1122 + &
      v1152) + 22080.0d0*(v1123 + v1156) - 480.0d0*(v1124 + v1158) - &
      5190.0d0*(v1125 + v1174) - 2490.0d0*(v1126 + v1176) - 3888.0d0*( &
      v1130 + v1150) + 51870.0d0*(v1131 + v1161) - 2445.0d0*(v1132 + &
      v1168) - 30.0d0*(v1133 + v1193) - 3825.0d0*(v1134 + v1201) - &
      1635.0d0*(v1136 + v1272) - 5280.0d0*(v1139 + v1148) + 70620.0d0*( &
      v1140 + v1172) + 6870.0d0*(v1142 + v1228) + 55470.0d0*(v1145 + &
      v1189) + 24960.0d0*(v1149 + v1222) + 5520.0d0*(v1151 + v1253) + &
      9952.0d0*(v1153 + v1245) - 128.0d0*(v1154 + v1304) + 46272.0d0*( &
      v1155 + v1220) + 192.0d0*(v1157 + v1240) + 107580.0d0*(v1159 + &
      v1184) - 4560.0d0*(v1160 + v1261) - 21540.0d0*(v1162 + v1254) - &
      16620.0d0*(v1163 + v1246) - 11220.0d0*(v1164 + v1305) - 21480.0d0 &
      *(v1165 + v1299) - 380.0d0*(v1166 + v1209) - 13520.0d0*(v1167 + &
      v1288) - 2730.0d0*(v1169 + v1255) + 690.0d0*(v1170 + v1306) - &
      69960.0d0*(v1173 + v1223) - 36840.0d0*(v1175 + v1241) - 69840.0d0 &
      *(v1177 + v1239) - 41440.0d0*(v1179 + v1233) - 52500.0d0*(v1185 + &
      v1191) - 3840.0d0*(v1187 + v1270) + 6015.0d0*(v1190 + v1266) + &
      17700.0d0*(v1192 + v1262) + 9165.0d0*(v1194 + v1256) - 1320.0d0*( &
      v1195 + v1247) + 1110.0d0*(v1196 + v1307) + 12480.0d0*(v1197 + &
      v1300) - 1590.0d0*(v1198 + v1248) - 54040.0d0*(v1199 + v1210) + &
      19940.0d0*(v1200 + v1289) - 2475.0d0*(v1202 + v1257) + 11480.0d0* &
      (v1204 + v1282) + 610.0d0*(v1212 + v1277) - 4020.0d0*(v1221 + &
      v1230) + 16140.0d0*(v1225 + v1229) + 35840.0d0*(v1227 + v1234) + &
      370.0d0*(v1250 + v1273) + 420.0d0*(v1251 + v1276) - 1770.0d0*( &
      v1264 + v1271) + 190.0d0*(v1274 + v1308) - 1010.0d0*(v1278 + &
      v1291) + 150.0d0*(v1281 + v1309) + 90.0d0*(v1702 + v1703) - &
      2240.0d0*(v1128 + v1231 + v1283) + 230.0d0*(v1127 + v1129 + v1183 &
      + v1238) - 3930.0d0*(v1141 + v1143 + v1180 + v1235) - 1845.0d0*( &
      v1146 + v1147 + v1214 + v1293) - 5460.0d0*(v1181 + v1224 + v1226 &
      + v1236) - 2760.0d0*(v1186 + v1188 + v1205 + v1284) - 330.0d0*( &
      v1206 + v1263 + v1265 + v1285) + 50.0d0*(v1208 + v1249 + v1252 + &
      v1287) + 970.0d0*(v1211 + v1213 + v1216 + v1295) - 270.0d0*(v1215 &
      + v1267 + v1269 + v1294) + 430.0d0*(v1217 + v1290 + v1292 + v1296 &
      ) + 165.0d0*(v1219 + v1258 + v1260 + v1298) + 255.0d0*(v1135 + &
      v1138 + v1218 + v1259 + v1280 + v1297) + 300.0d0*(v1207 + v1275 + &
      v1286 + v1301 + v1302 + v1303) + 1380.0d0*(-v1137 + v1182 + v1232 &
      + v1237 + v1242 + v1243 + v1244 - v1279))
    S_xxxxxxyz  = v2*(0.0769230769230769d0*(3.0d0*v249) + v1043 + v245 - v248)
    Ms_xxxxxxyz = M_0*S_xxxxxxyz - M_xyyyy*v399 - S_xyyyy*v416 + v1720 + &
      0.00699300699300699d0*(2.0d0*M_yyyyyyyz + 3.0d0*M_yyyyyzzz - &
      27.0d0*(M_xxyyyyyz + M_xxyyyzzz) - 540.0d0*(v1744 + v1879) - &
      340.0d0*(v1746 + v1831) - 1080.0d0*(v1756 + v1822) + 280.0d0*( &
      v1757 + v1826) - 1000.0d0*(v1759 + v1804) - 1470.0d0*(v1769 + &
      v1783) - 75.0d0*(v1771 + v1856) - 510.0d0*(v1773 + v1786) + &
      990.0d0*(v1775 + v1795) - 345.0d0*(v1777 + v1881) - 141.0d0*( &
      v1778 + v1887) - 135.0d0*(v1782 + v1888) - 465.0d0*(v1788 + v1846 &
      ) - 177.0d0*(v1797 + v1848) + 480.0d0*(v1809 + v1815) + 9.0d0*( &
      v1835 + v1859) - 50.0d0*(v1844 + v1857) + 42.0d0*(v1849 + v1872) &
      + 38.0d0*(v1850 + v1882) + 45.0d0*(v1858 + v1883) + 112.0d0*( &
      M_xxxxxxyz + v1738 + v1830) + 512.0d0*(v1721 + v1740 + v1741 + &
      v1803) + 1500.0d0*(v1726 + v1747 + v1750 + v1768) + 2520.0d0*( &
      v1731 + v1754 + v1760 + v1764) + 2300.0d0*(v1733 + v1742 + v1785 &
      + v1794) + 1152.0d0*(v1735 + v1739 + v1821 + v1825) + 272.0d0*( &
      v1736 + v1737 + v1878 + v1884) + 400.0d0*(-v1743 + v1751 + v1841 &
      - v1869) - 150.0d0*(v1749 + v1752 + v1880 + v1886) + 1120.0d0*( &
      -v1755 + v1765 + v1810 - v1818) + 15.0d0*(-v1779 - v1833 + v1855 &
      + v1890) + 10.0d0*(v1791 + v1866 + v1871 + v1873) - 18.0d0*(v1802 &
      + v1843 + v1845 + v1877) + 8.0d0*(v1834 + v1851 + v1852 + v1889) &
      + 30.0d0*(-M_xxxxyzzz + v1727 - v1753 + v1780 - v1832) + 120.0d0* &
      (-v1722 + v1734 + v1748 - v1758 + v1836 + v1860) - 12.0d0*(v1793 &
      + v1838 + v1839 + v1840 + v1854 + v1868) + 240.0d0*(v1732 + v1761 &
      + v1774 + v1781 + v1808 + v1814 + v1837 + v1861) - 20.0d0*(v1745 &
      + v1800 + v1847 + v1862 + v1863 + v1864 + v1875 + v1885) - &
      185.0d0*(v1787 + v1789 + v1790 + v1796 + v1798 + v1799 + v1865 + &
      v1874) - 51.0d0*(v1728 + v1729 + v1730 + v1770 + v1772 + v1792 + &
      v1801 + v1853 + v1867 + v1876) - 300.0d0*(v1762 + v1766 + v1811 + &
      v1816 + v1819 + v1823 + v1824 + v1827 + v1828 + v1829) + 60.0d0*( &
      -M_xxxxyyyz - v1723 - v1724 - v1725 - v1763 - v1767 + v1776 - &
      v1784 - v1805 - v1806 - v1807 - v1812 - v1813 - v1817 - v1820 - &
      v1842 + v1870))
    S_xxxxxyyy  = v0*(0.0769230769230769d0*(2.0d0*v249) + v1893 + v1929 + v1933)
    Ms_xxxxxyyy = M_0*S_xxxxxyyy + v1895 + 0.000466200466200466d0*(-390.0d0*M_xxxyyyyy + &
      6530.0d0*(v1352 + v1384) - 780.0d0*(v1354 + v1418) - 615.0d0*( &
      v1355 + v1420) + 12990.0d0*(v1359 + v1396) - 600.0d0*(v1361 + &
      v1446) + 15330.0d0*(v1364 + v1415) - 210.0d0*(v1366 + v1483) + &
      10040.0d0*(v1369 + v1439) + 2760.0d0*(v1371 + v1476) + 6132.0d0*( &
      v1376 + v1471) + 4962.0d0*(v1377 + v1465) + 24060.0d0*(v1382 + &
      v1434) + 20550.0d0*(v1383 + v1429) + 40890.0d0*(v1390 + v1413) - &
      2830.0d0*(v1392 + v1481) + 38550.0d0*(v1394 + v1409) - 6450.0d0*( &
      v1395 + v1477) - 6810.0d0*(v1397 + v1472) - 3370.0d0*(v1398 + &
      v1467) - 5400.0d0*(v1399 + v1499) - 285.0d0*(v1400 + v1468) - &
      6300.0d0*(v1402 + v1494) - 16530.0d0*(v1414 + v1440) - 16890.0d0* &
      (v1416 + v1435) - 8160.0d0*(v1417 + v1431) - 6720.0d0*(v1419 + &
      v1462) - 240.0d0*(M_xxxxxxxy + v1373 + v1464) - 195.0d0*( &
      M_xxxxxyzz + v1380 + v1466) - 75.0d0*(M_xyyyyyyy + v1356 + v1486 &
      ) - 30.0d0*(M_xyyyyyzz + v1357 + v1488) - 1488.0d0*(v1351 + v1372 &
      + v1374 + v1428) - 585.0d0*(v1353 + v1386 + v1388 + v1430) - &
      2910.0d0*(v1358 + v1370 + v1375 + v1408) - 2970.0d0*(v1363 + &
      v1368 + v1381 + v1389) - 588.0d0*(v1378 + v1379 + v1498 + v1501) &
      - 1380.0d0*(v1385 + v1387 + v1459 + v1461) - 2100.0d0*(v1401 + &
      v1405 + v1421 + v1424) - 7620.0d0*(v1411 + v1425 + v1444 + v1452 &
      ) - 135.0d0*(v1432 + v1448 + v1469 + v1485) - 90.0d0*(v1433 + &
      v1451 + v1470 + v1490) + 555.0d0*(v1437 + v1447 + v1474 + v1484) &
      + 1815.0d0*(v1442 + v1445 + v1479 + v1482) + 270.0d0*(v1449 + &
      v1463 + v1487 + v1502) + 2520.0d0*(v1453 + v1456 + v1491 + v1495 &
      ) + 1590.0d0*(M_xxxxxyyy + v1450 + v1460 + v1489 + v1500) - &
      1260.0d0*(v1360 + v1362 + v1403 + v1406 + v1410 + v1412 + v1454 + &
      v1457) - 870.0d0*(v1365 + v1367 + v1391 + v1393 + v1422 + v1426 + &
      v1492 + v1496) - 765.0d0*(v1404 + v1423 + v1436 + v1438 + v1455 + &
      v1473 + v1475 + v1493) - 705.0d0*(v1407 + v1427 + v1441 + v1443 + &
      v1458 + v1478 + v1480 + v1497))
    S_xxxxxyyz  = v1*(v1896 + v1929 + 0.00512820512820513d0*(-13.0d0*v248 + 10.0d0*v249))
    Ms_xxxxxyyz = M_0*S_xxxxxyyz - v1086*z + v1897 + 0.000466200466200466d0*(-80.0d0* &
      M_xxxxxxxz + 1850.0d0*M_xxxxxyyz - 65.0d0*M_xxxxxzzz - 350.0d0* &
      M_xxxyyyyz - 185.0d0*M_xxxyyzzz - 496.0d0*(v1503 + v1528) + &
      7310.0d0*(v1504 + v1537) - 195.0d0*(v1505 + v1542) - 480.0d0*( &
      v1506 + v1573) - 774.0d0*(v1512 + v1532) + 16470.0d0*(v1513 + &
      v1550) + 150.0d0*(v1515 + v1611) - 530.0d0*(v1517 + v1539) + &
      21650.0d0*(v1518 + v1575) + 280.0d0*(v1520 + v1660) + 15080.0d0*( &
      v1523 + v1618) - 1350.0d0*(v1524 + v1583) + 4440.0d0*(v1525 + &
      v1668) - 816.0d0*(v1526 + v1633) - 144.0d0*(v1527 + v1684) + &
      7644.0d0*(v1529 + v1679) + 3726.0d0*(v1530 + v1685) + 3764.0d0*( &
      v1531 + v1642) + 2436.0d0*(v1533 + v1647) - 325.0d0*(v1534 + &
      v1686) + 26580.0d0*(v1535 + v1628) + 12810.0d0*(v1536 + v1634) + &
      14940.0d0*(v1538 + v1594) + 8940.0d0*(v1540 + v1599) - 975.0d0*( &
      v1541 + v1635) + 40040.0d0*(v1543 + v1579) - 3220.0d0*(v1544 + &
      v1664) + 19710.0d0*(v1545 + v1584) - 5610.0d0*(v1546 + v1669) - &
      1740.0d0*(v1547 + v1680) + 1020.0d0*(v1548 + v1687) - 3340.0d0*( &
      v1549 + v1643) - 2190.0d0*(v1551 + v1648) - 925.0d0*(v1552 + &
      v1688) + 32280.0d0*(v1553 + v1567) + 2940.0d0*(v1554 + v1652) + &
      17130.0d0*(v1558 + v1569) + 2790.0d0*(v1560 + v1654) - 7620.0d0*( &
      v1568 + v1614) - 8970.0d0*(v1570 + v1619) + 1620.0d0*(v1571 + &
      v1629) + 4770.0d0*(v1572 + v1636) - 7740.0d0*(v1574 + v1595) - &
      5550.0d0*(v1576 + v1600) + 6300.0d0*(v1580 + v1604) + 6540.0d0*( &
      v1586 + v1606) - 135.0d0*(M_xyyyyyyz + v1509 + v1658) - 120.0d0*( &
      M_xyyyyzzz + v1510 + v1663) - 600.0d0*(v1640 + v1662 + v1691) - &
      510.0d0*(v1514 + v1516 + v1564 + v1625) - 380.0d0*(v1519 + v1521 &
      + v1590 + v1675) - 1500.0d0*(v1562 + v1585 + v1587 + v1623) + &
      885.0d0*(v1602 + v1612 + v1650 + v1661) + 840.0d0*(v1605 + v1615 &
      + v1653 + v1665) - 1965.0d0*(v1607 + v1621 + v1655 + v1671) - &
      2520.0d0*(v1608 + v1631 + v1656 + v1682) - 705.0d0*(v1609 + v1639 &
      + v1657 + v1690) - 850.0d0*(v1522 + v1557 + v1559 + v1561 + v1588 &
      + v1673) - 1200.0d0*(v1555 + v1581 + v1616 + v1630 + v1632 + &
      v1666 + v1681 + v1683) - 1125.0d0*(v1563 + v1589 + v1620 + v1622 &
      + v1624 + v1670 + v1672 + v1674) - 435.0d0*(v1565 + v1591 + v1601 &
      + v1603 + v1626 + v1649 + v1651 + v1676) - 240.0d0*(v1556 + v1582 &
      + v1596 + v1597 + v1598 + v1610 + v1617 + v1644 + v1645 + v1646 + &
      v1659 + v1667))
    S_xxxxyyyy  = 0.000466200466200466d0*(2145.0d0*v105*v38 + v1087 + 396.0d0*v1693 + &
      33.0d0*(v1090 + v1898) - 18.0d0*(v1091 + v1899) - 858.0d0*(v1696 &
      + v1900))
    Ms_xxxxyyyy = 0.000466200466200466d0*(2145.0d0*M_0*S_xxxxyyyy + 1485.0d0*M_xxxxyyyy + &
      48780.0d0*v1098 + 15.0d0*(M_xxxxxxzz + M_yyyyyyzz) + 14.0d0*( &
      M_xxxxzzzz + M_yyyyzzzz) + 3285.0d0*(v1093 + v1113) + 28560.0d0*( &
      v1095 + v1109) + 21360.0d0*(v1096 + v1106) + 100.0d0*(v1144 + &
      v1268) + 560.0d0*(v1178 + v1283) + 70.0d0*(v1103 + v1104 + v1115 &
      + v1116) + 32.0d0*(v1122 + v1152 + v1250 + v1273) + 60.0d0*(v1124 &
      + v1158 + v1251 + v1276) + 5640.0d0*(v1125 + v1163 + v1174 + &
      v1246) + 102.0d0*(v1130 + v1150 + v1702 + v1703) + 10020.0d0*( &
      v1133 + v1162 + v1193 + v1254) + 120.0d0*(v1139 + v1148 + v1264 + &
      v1271) + 9240.0d0*(v1142 + v1160 + v1228 + v1261) + 92.0d0*(v1154 &
      + v1274 + v1304 + v1308) + 432.0d0*(v1157 + v1240 + v1275 + v1302 &
      ) + 620.0d0*(v1166 + v1209 + v1278 + v1291) + 84.0d0*(v1170 + &
      v1281 + v1306 + v1309) + 34680.0d0*(v1173 + v1185 + v1191 + v1223 &
      ) + 42.0d0*(v1135 + v1138 + v1218 + v1219 + v1258 + v1260 + v1297 &
      + v1298) + 140.0d0*(v1211 + v1213 + v1216 + v1217 + v1290 + v1292 &
      + v1295 + v1296) + 28.0d0*(M_xxyyzzzz + v1127 + v1129 + v1183 + &
      v1208 + v1238 + v1249 + v1252 + v1287) + 168.0d0*(v1101 + v1118 + &
      v1182 + v1207 + v1237 + v1242 + v1244 + v1286 + v1301 + v1303) - &
      (330.0d0*M_xxxxxxyy + 285.0d0*M_xxxxyyzz + 330.0d0*M_xxyyyyyy + &
      285.0d0*M_xxyyyyzz + M_xxzzzzzz + M_yyzzzzzz + 2145.0d0*v1086*x + &
      600.0d0*v1092 + 1200.0d0*v1097 + 720.0d0*v1099 + 720.0d0*v1100 + &
      720.0d0*v1102 + 8.0d0*v1105 + 1200.0d0*v1107 + 1200.0d0*v1108 + &
      1200.0d0*v1111 + 600.0d0*v1112 + 720.0d0*v1114 + 8.0d0*v1117 + &
      8.0d0*v1119 + 8.0d0*v1120 + 2280.0d0*v1123 + 540.0d0*v1126 + &
      628.0d0*v1128 + 4440.0d0*v1131 + 120.0d0*v1132 + 630.0d0*v1134 + &
      420.0d0*v1136 + 510.0d0*v1137 + 5160.0d0*v1140 + 360.0d0*v1141 + &
      360.0d0*v1143 + 4890.0d0*v1145 + 195.0d0*v1146 + 195.0d0*v1147 + &
      2640.0d0*v1149 + 420.0d0*v1151 + 628.0d0*v1153 + 4368.0d0*v1155 + &
      2280.0d0*v1156 + 8220.0d0*v1159 + 4440.0d0*v1161 + 1440.0d0*v1164 &
      + 3000.0d0*v1165 + 1720.0d0*v1167 + 120.0d0*v1168 + 510.0d0*v1169 &
      + 8960.0d0*v1171 + 5160.0d0*v1172 + 3360.0d0*v1175 + 540.0d0* &
      v1176 + 3920.0d0*v1179 + 360.0d0*v1180 + 1020.0d0*v1181 + &
      8220.0d0*v1184 + 1020.0d0*v1186 + 2640.0d0*v1187 + 1020.0d0*v1188 &
      + 4890.0d0*v1189 + 4890.0d0*v1190 + 5160.0d0*v1192 + 4440.0d0* &
      v1194 + 2280.0d0*v1195 + 1440.0d0*v1196 + 3360.0d0*v1197 + &
      540.0d0*v1198 + 4400.0d0*v1199 + 4400.0d0*v1200 + 630.0d0*v1201 + &
      630.0d0*v1202 + 8960.0d0*v1203 + 3920.0d0*v1204 + 1020.0d0*v1205 &
      + 360.0d0*v1206 + 4400.0d0*v1210 + 1720.0d0*v1212 + 195.0d0*v1214 &
      + 195.0d0*v1215 + 4368.0d0*v1220 + 4368.0d0*v1221 + 2640.0d0* &
      v1222 + 1020.0d0*v1224 + 8220.0d0*v1225 + 1020.0d0*v1226 + &
      8960.0d0*v1227 + 8220.0d0*v1229 + 4368.0d0*v1230 + 628.0d0*v1231 &
      + 3000.0d0*v1232 + 3920.0d0*v1233 + 8960.0d0*v1234 + 360.0d0* &
      v1235 + 1020.0d0*v1236 + 3360.0d0*v1241 + 3000.0d0*v1243 + &
      628.0d0*v1245 + 2280.0d0*v1247 + 540.0d0*v1248 + 420.0d0*v1253 + &
      510.0d0*v1255 + 4440.0d0*v1256 + 630.0d0*v1257 + 120.0d0*v1259 + &
      5160.0d0*v1262 + 360.0d0*v1263 + 360.0d0*v1265 + 4890.0d0*v1266 + &
      195.0d0*v1267 + 195.0d0*v1269 + 2640.0d0*v1270 + 420.0d0*v1272 + &
      1720.0d0*v1277 + 510.0d0*v1279 + 120.0d0*v1280 + 3920.0d0*v1282 + &
      1020.0d0*v1284 + 360.0d0*v1285 + 1720.0d0*v1288 + 4400.0d0*v1289 &
      + 195.0d0*v1293 + 195.0d0*v1294 + 3000.0d0*v1299 + 3360.0d0*v1300 &
      + 1440.0d0*v1305 + 1440.0d0*v1307 + 2145.0d0*v1699 + 2145.0d0* &
      v1701 + 2145.0d0*v1901 + 2145.0d0*v1902 + 2145.0d0*v675*y))
    S_xxxxyyyz  = v2*(0.0153846153846154d0*(6.0d0*v249 + v527) + v1893 + v1903 + v443)
    Ms_xxxxyyyz = M_0*S_xxxxyyyz - v1084*y + 0.0013986013986014d0*(590.0d0*M_xxxxyyyz - &
      59.0d0*M_xxyyyzzz - 5.0d0*M_yyyyyyyz - 2.0d0*M_yyyyyzzz - 650.0d0 &
      *v1833 - 315.0d0*(v1704 + v1715) - 63.0d0*(v1705 + v1709) + &
      2060.0d0*(v1722 + v1758) + 3830.0d0*(v1727 + v1780) - 76.0d0*( &
      v1729 + v1853) + 3800.0d0*(v1732 + v1814) + 1460.0d0*(v1734 + &
      v1860) + 3200.0d0*(v1743 + v1869) + 2670.0d0*(v1744 + v1879) + &
      1730.0d0*(v1746 + v1831) + 2340.0d0*(v1748 + v1836) + 8960.0d0*( &
      v1755 + v1818) + 7980.0d0*(v1756 + v1822) + 2820.0d0*(v1757 + &
      v1826) + 6020.0d0*(v1759 + v1804) + 7320.0d0*(v1761 + v1808) + &
      3360.0d0*(v1765 + v1810) + 10110.0d0*(v1769 + v1783) - 720.0d0*( &
      v1771 + v1856) + 10350.0d0*(v1773 + v1786) + 4070.0d0*(v1775 + &
      v1795) - 370.0d0*(v1776 + v1870) + 204.0d0*(v1778 + v1887) - &
      710.0d0*(v1781 + v1837) - 295.0d0*(v1782 + v1888) + 310.0d0*( &
      v1788 + v1846) - 1170.0d0*(v1806 + v1813) + 486.0d0*(v1811 + &
      v1828) - 9.0d0*(v1834 + v1852) - 6.0d0*(v1835 + v1859) + 19.0d0*( &
      v1839 + v1854) + 15.0d0*(v1844 + v1857) - 215.0d0*(v1849 + v1872 &
      ) - 139.0d0*(v1850 + v1882) - 31.0d0*(v1851 + v1889) - 10.0d0*( &
      v1855 + v1890) - 30.0d0*(v1858 + v1883) + 630.0d0*(v1904 + v1905 &
      ) - 60.0d0*(M_xxxxxxyz + v1738 + v1830) - 57.0d0*(M_xxxxyzzz + &
      v1753 + v1832) - 70.0d0*(M_xxyyyyyz + v1784 + v1842) - 400.0d0*( &
      v1721 + v1740 + v1741 + v1803) - 450.0d0*(v1726 + v1747 + v1750 + &
      v1768) - 140.0d0*(v1731 + v1754 + v1760 + v1764) - 240.0d0*(v1735 &
      + v1739 + v1821 + v1825) - 20.0d0*(v1736 + v1737 + v1878 + v1884 &
      ) + 930.0d0*(v1745 - v1774 - v1861 + v1885) - 285.0d0*(v1749 + &
      v1752 + v1880 + v1886) + 1200.0d0*(v1751 - v1809 - v1815 + v1841 &
      ) - 135.0d0*(v1791 + v1866 + v1871 + v1873) - 69.0d0*(v1793 + &
      v1838 + v1840 + v1868) - 65.0d0*(v1802 + v1843 + v1845 + v1877) + &
      3.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1708 + v1710 + v1711 + v1714) + &
      250.0d0*(-v1733 - v1742 - v1785 - v1794 + v1797 + v1848) - &
      115.0d0*(v1800 + v1847 + v1862 + v1863 + v1864 + v1875) + 21.0d0* &
      (v1706 + v1707 + v1712 + v1713 + v1716 + v1717 + v1718 + v1719) - &
      570.0d0*(v1762 + v1766 + v1816 + v1819 + v1823 + v1824 + v1827 + &
      v1829) - 390.0d0*(v1787 + v1789 + v1790 + v1796 + v1798 + v1799 + &
      v1865 + v1874) - 114.0d0*(v1723 + v1724 + v1725 + v1763 + v1767 + &
      v1805 + v1807 + v1812 + v1817 + v1820) + 120.0d0*(-v1728 - v1730 &
      - v1770 - v1772 + v1777 - v1792 - v1801 - v1867 - v1876 + v1881))
    S_xxxyyyyy  = v0*(0.0769230769230769d0*(2.0d0*v527) + v1907 + v1930 + v1933)
    Ms_xxxyyyyy = M_0*S_xxxyyyyy + v1895 + 0.000466200466200466d0*(-390.0d0*M_xxxxxyyy - &
      3370.0d0*(v1352 + v1384) + 4962.0d0*(v1354 + v1418) - 285.0d0*( &
      v1355 + v1420) - 6810.0d0*(v1359 + v1396) + 6132.0d0*(v1361 + &
      v1446) - 6450.0d0*(v1364 + v1415) + 2760.0d0*(v1366 + v1483) - &
      2830.0d0*(v1369 + v1439) - 210.0d0*(v1371 + v1476) - 600.0d0*( &
      v1376 + v1471) - 780.0d0*(v1377 + v1465) - 8160.0d0*(v1383 + &
      v1429) - 16530.0d0*(v1390 + v1413) + 10040.0d0*(v1392 + v1481) - &
      16890.0d0*(v1394 + v1409) + 15330.0d0*(v1395 + v1477) + 12990.0d0 &
      *(v1397 + v1472) + 6530.0d0*(v1398 + v1467) - 6720.0d0*(v1399 + &
      v1499) - 615.0d0*(v1400 + v1468) + 24060.0d0*(v1411 + v1444) + &
      40890.0d0*(v1414 + v1440) + 38550.0d0*(v1416 + v1435) + 20550.0d0 &
      *(v1417 + v1431) - 5400.0d0*(v1419 + v1462) - 6300.0d0*(v1425 + &
      v1452) - 75.0d0*(M_xxxxxxxy + v1373 + v1464) - 30.0d0*(M_xxxxxyzz &
      + v1380 + v1466) - 240.0d0*(M_xyyyyyyy + v1356 + v1486) - 195.0d0 &
      *(M_xyyyyyzz + v1357 + v1488) - 135.0d0*(v1351 + v1372 + v1374 + &
      v1428) - 90.0d0*(v1353 + v1386 + v1388 + v1430) + 555.0d0*(v1358 &
      + v1370 + v1375 + v1408) + 1815.0d0*(v1363 + v1368 + v1381 + &
      v1389) + 270.0d0*(v1378 + v1379 + v1498 + v1501) - 7620.0d0*( &
      v1382 + v1402 + v1434 + v1494) + 2520.0d0*(v1401 + v1405 + v1421 &
      + v1424) - 1488.0d0*(v1432 + v1448 + v1469 + v1485) - 585.0d0*( &
      v1433 + v1451 + v1470 + v1490) - 2910.0d0*(v1437 + v1447 + v1474 &
      + v1484) - 2970.0d0*(v1442 + v1445 + v1479 + v1482) - 588.0d0*( &
      v1449 + v1463 + v1487 + v1502) - 1380.0d0*(v1450 + v1460 + v1489 &
      + v1500) - 2100.0d0*(v1453 + v1456 + v1491 + v1495) + 1590.0d0*( &
      M_xxxyyyyy + v1385 + v1387 + v1459 + v1461) - 765.0d0*(v1360 + &
      v1362 + v1403 + v1406 + v1410 + v1412 + v1454 + v1457) - 705.0d0* &
      (v1365 + v1367 + v1391 + v1393 + v1422 + v1426 + v1492 + v1496) - &
      1260.0d0*(v1404 + v1423 + v1436 + v1438 + v1455 + v1473 + v1475 + &
      v1493) - 870.0d0*(v1407 + v1427 + v1441 + v1443 + v1458 + v1478 + &
      v1480 + v1497))
    S_xxxyyyyz  = v1*(0.0153846153846154d0*(v249 + 6.0d0*v527) + v1903 + v1907 + v526)
    Ms_xxxyyyyz = M_0*S_xxxyyyyz - v1057*x + 0.0013986013986014d0*(-5.0d0*M_xxxxxxxz - &
      2.0d0*M_xxxxxzzz + 590.0d0*M_xxxyyyyz - 59.0d0*M_xxxyyzzz - &
      650.0d0*v1504 - 9.0d0*(v1503 + v1528) - 6.0d0*(v1505 + v1542) + &
      1730.0d0*(v1506 + v1573) - 63.0d0*(v1507 + v1578) + 19.0d0*(v1512 &
      + v1532) - 710.0d0*(v1513 + v1550) + 2340.0d0*(v1515 + v1611) + &
      15.0d0*(v1517 + v1539) + 310.0d0*(v1523 + v1618) - 215.0d0*(v1524 &
      + v1583) - 139.0d0*(v1526 + v1633) - 31.0d0*(v1527 + v1684) + &
      486.0d0*(v1529 + v1679) + 204.0d0*(v1530 + v1685) - 76.0d0*(v1533 &
      + v1647) - 10.0d0*(v1534 + v1686) + 630.0d0*(v1535 + v1628) - &
      1170.0d0*(v1538 + v1594) - 720.0d0*(v1540 + v1599) - 30.0d0*( &
      v1541 + v1635) + 3360.0d0*(v1544 + v1664) - 370.0d0*(v1545 + &
      v1584) + 4070.0d0*(v1546 + v1669) + 2820.0d0*(v1547 + v1680) + &
      2060.0d0*(v1549 + v1643) + 3830.0d0*(v1551 + v1648) - 295.0d0*( &
      v1552 + v1688) + 3800.0d0*(v1554 + v1652) + 1460.0d0*(v1560 + &
      v1654) + 7320.0d0*(v1568 + v1614) + 10350.0d0*(v1570 + v1619) + &
      7980.0d0*(v1571 + v1629) + 2670.0d0*(v1572 + v1636) + 6020.0d0*( &
      v1574 + v1595) + 10110.0d0*(v1576 + v1600) - 315.0d0*(v1577 + &
      v1637) + 8960.0d0*(v1580 + v1604) + 3200.0d0*(v1586 + v1606) - &
      70.0d0*(M_xxxxxyyz + v1518 + v1575) - 60.0d0*(M_xyyyyyyz + v1509 &
      + v1658) - 57.0d0*(M_xyyyyzzz + v1510 + v1663) - 69.0d0*(v1514 + &
      v1516 + v1564 + v1625) - 65.0d0*(v1519 + v1521 + v1590 + v1675) + &
      1200.0d0*(v1520 - v1553 - v1567 + v1660) + 930.0d0*(v1548 - v1558 &
      - v1569 + v1687) - 135.0d0*(v1562 + v1585 + v1587 + v1623) - &
      400.0d0*(v1597 + v1610 + v1645 + v1659) - 450.0d0*(v1602 + v1612 &
      + v1650 + v1661) - 140.0d0*(v1605 + v1615 + v1653 + v1665) - &
      240.0d0*(v1608 + v1631 + v1656 + v1682) - 20.0d0*(v1609 + v1639 + &
      v1657 + v1690) - 285.0d0*(v1613 + v1640 + v1662 + v1691) + 3.0d0* &
      (M_xxxzzzzz + M_xyyzzzzz + v1508 + v1511 + v1593 + v1678) - &
      115.0d0*(v1522 + v1557 + v1559 + v1561 + v1588 + v1673) + 250.0d0 &
      *(v1525 - v1607 - v1621 - v1655 + v1668 - v1671) - 570.0d0*(v1555 &
      + v1581 + v1616 + v1630 + v1632 + v1666 + v1681 + v1683) - &
      390.0d0*(v1563 + v1589 + v1620 + v1622 + v1624 + v1670 + v1672 + &
      v1674) + 21.0d0*(v1566 + v1592 + v1627 + v1638 + v1641 + v1677 + &
      v1689 + v1692) - 114.0d0*(v1531 + v1556 + v1582 + v1596 + v1598 + &
      v1617 + v1642 + v1644 + v1646 + v1667) + 120.0d0*(v1536 - v1565 - &
      v1591 - v1601 - v1603 - v1626 + v1634 - v1649 - v1651 - v1676))
    S_xxyyyyyy  = 0.00512820512820513d0*(15.0d0*v1898 - 13.0d0*v1908) - v1042*v4 + v1694 - &
      v1695*v5 - v1900 + v4*v535
    Ms_xxyyyyyy = M_0*S_xxyyyyyy + v1697 + v1901 + v1902 + 0.000155400155400155d0*(75.0d0* &
      M_xxxxxxxx - 1005.0d0*M_xxxxxxyy + 105.0d0*M_xxxxxxzz - 900.0d0* &
      M_xxxxyyzz + 25.0d0*M_xxxxzzzz + 4800.0d0*M_xxyyyyyy - 1125.0d0* &
      M_xxyyyyzz - 240.0d0*M_yyyyyyyy - 120.0d0*M_yyyyyyzz + 115.0d0* &
      M_yyyyzzzz - 3130.0d0*v1144 + 142520.0d0*v1227 - 97720.0d0*v1234 &
      - 5440.0d0*v1268 - 1400.0d0*v1283 + 370.0d0*(v1122 + v1152) - &
      1320.0d0*(v1123 + v1156) + 420.0d0*(v1124 + v1158) - 16620.0d0*( &
      v1125 + v1174) - 1590.0d0*(v1126 + v1176) + 9952.0d0*(v1128 + &
      v1231) + 90.0d0*(v1130 + v1150) + 9165.0d0*(v1131 + v1161) - &
      21540.0d0*(v1133 + v1193) - 2475.0d0*(v1134 + v1201) + 5520.0d0*( &
      v1136 + v1272) - 2730.0d0*(v1137 + v1279) - 1770.0d0*(v1139 + &
      v1148) + 17700.0d0*(v1140 + v1172) - 4560.0d0*(v1142 + v1228) + &
      6015.0d0*(v1145 + v1189) - 3840.0d0*(v1149 + v1222) - 1635.0d0*( &
      v1151 + v1253) + 190.0d0*(v1154 + v1304) - 4020.0d0*(v1155 + &
      v1220) + 16140.0d0*(v1159 + v1184) + 6870.0d0*(v1160 + v1261) - &
      30.0d0*(v1162 + v1254) - 5190.0d0*(v1163 + v1246) + 1110.0d0*( &
      v1164 + v1305) - 1010.0d0*(v1166 + v1209) + 610.0d0*(v1167 + &
      v1288) + 150.0d0*(v1170 + v1306) + 35840.0d0*(v1171 + v1203) - &
      52500.0d0*(v1173 + v1223) + 12480.0d0*(v1175 + v1241) + 11480.0d0 &
      *(v1179 + v1233) - 69960.0d0*(v1185 + v1191) + 24960.0d0*(v1187 + &
      v1270) + 55470.0d0*(v1190 + v1266) + 70620.0d0*(v1192 + v1262) + &
      51870.0d0*(v1194 + v1256) + 22080.0d0*(v1195 + v1247) - 11220.0d0 &
      *(v1196 + v1307) - 36840.0d0*(v1197 + v1300) - 2490.0d0*(v1198 + &
      v1248) + 19940.0d0*(v1199 + v1210) - 54040.0d0*(v1200 + v1289) - &
      3825.0d0*(v1202 + v1257) - 41440.0d0*(v1204 + v1282) - 13520.0d0* &
      (v1212 + v1277) + 46272.0d0*(v1221 + v1230) + 107580.0d0*(v1225 + &
      v1229) - 21480.0d0*(v1232 + v1243) - 1568.0d0*(v1250 + v1273) - &
      480.0d0*(v1251 + v1276) - 2445.0d0*(v1259 + v1280) - 5280.0d0*( &
      v1264 + v1271) - 128.0d0*(v1274 + v1308) + 192.0d0*(v1275 + v1302 &
      ) - 380.0d0*(v1278 + v1291) + 690.0d0*(v1281 + v1309) - 69840.0d0 &
      *(v1698 + v1700) - 3888.0d0*(v1702 + v1703) - 2240.0d0*(v1153 + &
      v1178 + v1245) + 50.0d0*(v1127 + v1129 + v1183 + v1238) + 165.0d0 &
      *(v1135 + v1138 + v1218 + v1297) - 330.0d0*(v1141 + v1143 + v1180 &
      + v1235) - 270.0d0*(v1146 + v1147 + v1214 + v1293) - 2760.0d0*( &
      v1181 + v1224 + v1226 + v1236) - 5460.0d0*(v1186 + v1188 + v1205 &
      + v1284) - 3930.0d0*(v1206 + v1263 + v1265 + v1285) + 230.0d0*( &
      v1208 + v1249 + v1252 + v1287) + 430.0d0*(v1211 + v1213 + v1216 + &
      v1295) - 1845.0d0*(v1215 + v1267 + v1269 + v1294) + 970.0d0*( &
      v1217 + v1290 + v1292 + v1296) + 255.0d0*(v1132 + v1168 + v1219 + &
      v1258 + v1260 + v1298) + 300.0d0*(v1157 + v1182 + v1237 + v1240 + &
      v1242 + v1244) + 1380.0d0*(v1165 - v1169 + v1207 - v1255 + v1286 &
      + v1299 + v1301 + v1303))
    S_xxyyyyyz  = v2*(v1896 + v1930 + 0.00512820512820513d0*(-13.0d0*v525 + 10.0d0*v527))
    Ms_xxyyyyyz = M_0*S_xxyyyyyz + v1720 - v675*z + 0.000466200466200466d0*(-350.0d0* &
      M_xxxxyyyz + 1850.0d0*M_xxyyyyyz - 185.0d0*M_xxyyyzzz - 80.0d0* &
      M_yyyyyyyz - 65.0d0*M_yyyyyzzz - 3340.0d0*(v1722 + v1758) + &
      3764.0d0*(v1724 + v1812) - 2190.0d0*(v1727 + v1780) + 2436.0d0*( &
      v1729 + v1853) + 2940.0d0*(v1732 + v1814) + 2790.0d0*(v1734 + &
      v1860) + 6540.0d0*(v1743 + v1869) + 4770.0d0*(v1744 + v1879) + &
      1020.0d0*(v1745 + v1885) - 480.0d0*(v1746 + v1831) + 150.0d0*( &
      v1748 + v1836) + 280.0d0*(v1751 + v1841) + 6300.0d0*(v1755 + &
      v1818) + 1620.0d0*(v1756 + v1822) - 1740.0d0*(v1757 + v1826) - &
      7740.0d0*(v1759 + v1804) - 7620.0d0*(v1761 + v1808) - 3220.0d0*( &
      v1765 + v1810) - 5550.0d0*(v1769 + v1783) + 8940.0d0*(v1771 + &
      v1856) - 8970.0d0*(v1773 + v1786) + 17130.0d0*(v1774 + v1861) - &
      5610.0d0*(v1775 + v1795) + 19710.0d0*(v1776 + v1870) + 12810.0d0* &
      (v1777 + v1881) + 3726.0d0*(v1778 + v1887) + 7310.0d0*(v1779 + &
      v1833) + 16470.0d0*(v1781 + v1837) - 925.0d0*(v1782 + v1888) + &
      21650.0d0*(v1784 + v1842) + 15080.0d0*(v1788 + v1846) + 4440.0d0* &
      (v1797 + v1848) + 14940.0d0*(v1806 + v1813) + 32280.0d0*(v1809 + &
      v1815) + 7644.0d0*(v1811 + v1828) - 496.0d0*(v1834 + v1852) - &
      195.0d0*(v1835 + v1859) - 774.0d0*(v1839 + v1854) - 530.0d0*( &
      v1844 + v1857) - 1350.0d0*(v1849 + v1872) - 816.0d0*(v1850 + &
      v1882) - 144.0d0*(v1851 + v1889) - 325.0d0*(v1855 + v1890) - &
      975.0d0*(v1858 + v1883) + 26580.0d0*(v1904 + v1905) + 40040.0d0*( &
      v1909 + v1910) - 135.0d0*(M_xxxxxxyz + v1738 + v1830) - 120.0d0*( &
      M_xxxxyzzz + v1753 + v1832) - 600.0d0*(v1752 + v1880 + v1886) + &
      885.0d0*(v1726 + v1747 + v1750 + v1768) + 840.0d0*(v1731 + v1754 &
      + v1760 + v1764) - 1965.0d0*(v1733 + v1742 + v1785 + v1794) - &
      2520.0d0*(v1735 + v1739 + v1821 + v1825) - 705.0d0*(v1736 + v1737 &
      + v1878 + v1884) - 1500.0d0*(v1791 + v1866 + v1871 + v1873) - &
      510.0d0*(v1793 + v1838 + v1840 + v1868) - 380.0d0*(v1802 + v1843 &
      + v1845 + v1877) - 850.0d0*(v1800 + v1847 + v1862 + v1863 + v1864 &
      + v1875) - 435.0d0*(v1728 + v1730 + v1770 + v1772 + v1792 + v1801 &
      + v1867 + v1876) - 1200.0d0*(v1762 + v1766 + v1816 + v1819 + &
      v1823 + v1824 + v1827 + v1829) - 1125.0d0*(v1787 + v1789 + v1790 &
      + v1796 + v1798 + v1799 + v1865 + v1874) - 240.0d0*(v1721 + v1723 &
      + v1725 + v1740 + v1741 + v1763 + v1767 + v1803 + v1805 + v1807 + &
      v1817 + v1820))
    S_xyyyyyyy  = v0*v1911
    Ms_xyyyyyyy = M_0*S_xyyyyyyy + v1350 + 0.0013986013986014d0*(-175.0d0*M_xxxxxyyy - &
      560.0d0*M_xxxyyyyy + 245.0d0*(v1352 + v1384) - 2352.0d0*(v1354 + &
      v1418) + 35.0d0*(v1355 + v1420) + 2660.0d0*(v1359 + v1396) - &
      672.0d0*(v1361 + v1446) + 1400.0d0*(v1364 + v1415) - 1645.0d0*( &
      v1369 + v1439) - 2205.0d0*(v1382 + v1434) + 5880.0d0*(v1390 + &
      v1413) + 7140.0d0*(v1394 + v1409) + 2170.0d0*(v1395 + v1477) - &
      1190.0d0*(v1397 + v1472) - 1680.0d0*(v1398 + v1467) - 10290.0d0*( &
      v1414 + v1440) - 13650.0d0*(v1416 + v1435) - 8400.0d0*(v1417 + &
      v1431) + 3500.0d0*(v1419 + v1462) + 2800.0d0*(v1425 + v1452) + &
      70.0d0*(M_xxxxxxxy + v1373 + v1464) + 105.0d0*(M_xxxxxyzz + v1380 &
      + v1466) + 400.0d0*(M_xyyyyyyy + v1356 + v1486) - 1540.0d0*(v1363 &
      + v1368 + v1381 + v1389) - 735.0d0*(v1377 + v1400 + v1465 + v1468 &
      ) + 3360.0d0*(v1392 - v1411 - v1444 + v1481) + 2128.0d0*(v1432 + &
      v1448 + v1469 + v1485) - 840.0d0*(v1433 + v1451 + v1470 + v1490) &
      + 12320.0d0*(v1442 + v1445 + v1479 + v1482) - 1792.0d0*(v1449 + &
      v1463 + v1487 + v1502) - 11900.0d0*(v1453 + v1456 + v1491 + v1495 &
      ) + 315.0d0*(v1353 - v1383 + v1386 + v1388 - v1429 + v1430) + &
      1120.0d0*(v1366 - v1401 - v1405 - v1421 - v1424 + v1483) + &
      6720.0d0*(v1437 + v1447 - v1450 - v1460 + v1474 + v1484 - v1489 - &
      v1500) + 280.0d0*(-M_xyyyyyzz + v1351 - v1357 + v1372 + v1374 - &
      v1402 + v1428 - v1488 - v1494) + 420.0d0*(-v1365 - v1367 - v1391 &
      - v1393 + v1399 - v1422 - v1426 - v1492 - v1496 + v1499) - &
      805.0d0*(v1371 + v1407 + v1427 + v1441 + v1443 + v1458 + v1476 + &
      v1478 + v1480 + v1497) - 1365.0d0*(v1376 + v1404 + v1423 + v1436 &
      + v1438 + v1455 + v1471 + v1473 + v1475 + v1493) + 210.0d0*( &
      -v1358 - v1360 - v1362 - v1370 - v1375 + v1378 + v1379 + v1385 + &
      v1387 - v1403 - v1406 - v1408 - v1410 - v1412 - v1454 - v1457 + &
      v1459 + v1461 + v1498 + v1501))
    S_xyyyyyyz  = v1*(0.0769230769230769d0*(3.0d0*v527) + v1043 - v525 + v535)
    Ms_xyyyyyyz = M_0*S_xyyyyyyz + v1897 + 0.00699300699300699d0*(2.0d0*M_xxxxxxxz + 3.0d0 &
      *M_xxxxxzzz - 27.0d0*(M_xxxxxyyz + M_xxxyyzzz) + 9.0d0*(v1505 + &
      v1542) - 340.0d0*(v1506 + v1573) - 50.0d0*(v1517 + v1539) - &
      465.0d0*(v1523 + v1618) + 42.0d0*(v1524 + v1583) - 177.0d0*(v1525 &
      + v1668) + 38.0d0*(v1526 + v1633) - 141.0d0*(v1530 + v1685) - &
      780.0d0*(v1535 + v1628) - 345.0d0*(v1536 + v1634) - 75.0d0*(v1540 &
      + v1599) + 45.0d0*(v1541 + v1635) + 990.0d0*(v1546 + v1669) + &
      280.0d0*(v1547 + v1680) - 135.0d0*(v1552 + v1688) + 480.0d0*( &
      v1553 + v1567) - 510.0d0*(v1570 + v1619) - 1080.0d0*(v1571 + &
      v1629) - 540.0d0*(v1572 + v1636) - 1000.0d0*(v1574 + v1595) - &
      1470.0d0*(v1576 + v1600) + 112.0d0*(M_xyyyyyyz + v1509 + v1658) + &
      8.0d0*(v1503 + v1527 + v1528 + v1684) + 15.0d0*(-v1504 + v1534 - &
      v1537 + v1686) - 18.0d0*(v1519 + v1521 + v1590 + v1675) + 400.0d0 &
      *(v1520 - v1586 - v1606 + v1660) + 1120.0d0*(v1544 - v1580 - &
      v1604 + v1664) + 10.0d0*(v1562 + v1585 + v1587 + v1623) + 512.0d0 &
      *(v1597 + v1610 + v1645 + v1659) + 1500.0d0*(v1602 + v1612 + &
      v1650 + v1661) + 2520.0d0*(v1605 + v1615 + v1653 + v1665) + &
      2300.0d0*(v1607 + v1621 + v1655 + v1671) + 1152.0d0*(v1608 + &
      v1631 + v1656 + v1682) + 272.0d0*(v1609 + v1639 + v1657 + v1690) &
      - 150.0d0*(v1613 + v1640 + v1662 + v1691) + 30.0d0*(-M_xyyyyzzz - &
      v1510 + v1551 + v1648 - v1663) - 12.0d0*(v1512 + v1514 + v1516 + &
      v1532 + v1564 + v1625) + 120.0d0*(v1515 - v1549 + v1560 + v1611 - &
      v1643 + v1654) + 240.0d0*(v1513 + v1550 + v1554 + v1558 + v1568 + &
      v1569 + v1614 + v1652) - 20.0d0*(v1522 + v1548 + v1557 + v1559 + &
      v1561 + v1588 + v1673 + v1687) - 185.0d0*(v1563 + v1589 + v1620 + &
      v1622 + v1624 + v1670 + v1672 + v1674) - 300.0d0*(v1529 + v1555 + &
      v1581 + v1616 + v1630 + v1632 + v1666 + v1679 + v1681 + v1683) - &
      51.0d0*(v1533 + v1565 + v1591 + v1601 + v1603 + v1626 + v1647 + &
      v1649 + v1651 + v1676) + 60.0d0*(-M_xxxyyyyz - v1518 - v1531 - &
      v1538 + v1545 - v1556 - v1575 - v1582 + v1584 - v1594 - v1596 - &
      v1598 - v1617 - v1642 - v1644 - v1646 - v1667))
    S_yyyyyyyy  = b8 + v1088 + 0.000466200466200466d0*(2310.0d0*v1898 - 420.0d0*v1899 - &
      4004.0d0*v1908)
    Ms_yyyyyyyy = M_0*S_yyyyyyyy + v1121 + 0.000155400155400155d0*(-105.0d0*M_xxxxxxxx - &
      210.0d0*M_xxxxxxzz + 3150.0d0*M_xxxxyyzz - 140.0d0*M_xxxxzzzz + &
      1920.0d0*M_yyyyyyyy + 5810.0d0*v1144 - 259840.0d0*v1227 + &
      220640.0d0*v1234 + 183680.0d0*v1268 - 224000.0d0*v1283 - &
      14280.0d0*(v1131 + v1161) - 12600.0d0*(v1134 + v1201) - 33600.0d0 &
      *(v1140 + v1172) - 7980.0d0*(v1145 + v1189) - 32340.0d0*(v1162 + &
      v1254) + 5460.0d0*(v1169 + v1255) - 71680.0d0*(v1171 + v1203) - &
      8400.0d0*(v1173 + v1223) + 107520.0d0*(v1185 + v1191) - 38080.0d0 &
      *(v1199 + v1210) + 7280.0d0*(v1200 + v1289) - 31500.0d0*(v1202 + &
      v1257) - 17920.0d0*(v1204 + v1282) - 8960.0d0*(v1212 + v1277) - &
      188160.0d0*(v1225 + v1229) + 11776.0d0*(v1250 + v1273) - &
      36960.0d0*(v1259 + v1280) + 134400.0d0*(v1264 + v1271) - &
      170240.0d0*(v1278 + v1291) + 161280.0d0*(v1698 + v1700) + &
      52416.0d0*(v1702 + v1703) + 4480.0d0*(v1153 + v1178 + v1245) - &
      560.0d0*(v1122 + v1152 + v1154 + v1304) - 280.0d0*(v1127 + v1129 &
      + v1183 + v1238) - 17024.0d0*(v1128 + v1231 + v1274 + v1308) + &
      1890.0d0*(v1146 + v1147 + v1214 + v1293) - 20160.0d0*(v1215 + &
      v1267 + v1269 + v1294) - 75264.0d0*(v1221 + v1230 + v1275 + v1302 &
      ) + 2100.0d0*(M_xxxxxxyy + v1219 + v1258 + v1260 + v1298) + &
      5880.0d0*(v1123 + v1126 + v1156 + v1164 + v1176 + v1305) + &
      10920.0d0*(v1149 + v1181 + v1222 + v1224 + v1226 + v1236) - &
      1680.0d0*(v1157 + v1182 + v1237 + v1240 + v1242 + v1244) + &
      8680.0d0*(v1167 + v1217 + v1288 + v1290 + v1292 + v1296) + &
      2240.0d0*(v1179 + v1208 + v1233 + v1249 + v1252 + v1287) + &
      53760.0d0*(v1187 + v1190 + v1232 + v1243 + v1266 + v1270) + &
      6720.0d0*(-M_xxyyyyyy - v1163 - v1198 - v1246 - v1248 + v1281 + &
      v1309) + 1120.0d0*(M_yyyyzzzz + v1166 + v1209 + v1211 + v1213 + &
      v1216 + v1295) - 47040.0d0*(v1160 + v1194 + v1206 + v1256 + v1261 &
      + v1263 + v1265 + v1285) + 840.0d0*(-v1124 + v1132 + v1135 + &
      v1138 - v1158 + v1168 - v1170 + v1218 + v1297 - v1306) + 3360.0d0 &
      *(-M_yyyyyyzz + v1139 + v1141 + v1143 + v1148 + v1151 - v1175 + &
      v1180 + v1235 - v1241 + v1253) + 26880.0d0*(v1133 - v1142 - v1159 &
      - v1184 - v1186 - v1188 + v1193 - v1195 + v1197 - v1205 - v1228 - &
      v1247 - v1284 + v1300) + 13440.0d0*(v1125 + v1136 - v1137 + v1155 &
      + v1165 + v1174 - v1192 + v1196 + v1207 + v1220 - v1251 - v1262 + &
      v1272 - v1276 - v1279 + v1286 + v1299 + v1301 + v1303 + v1307))
    S_yyyyyyyz  = v1911*v2
    Ms_yyyyyyyz = 0.0013986013986014d0*(715.0d0*M_0*S_yyyyyyyz - 560.0d0*M_xxyyyyyz + &
      400.0d0*M_yyyyyyyz - 175.0d0*(M_xxxxyyyz + M_xxyyyzzz) - 3675.0d0 &
      *(v1704 + v1715) - 1792.0d0*(v1724 + v1812) + 1820.0d0*(v1727 + &
      v1780) + 2912.0d0*(v1729 + v1853) - 3920.0d0*(v1732 + v1814) - &
      2345.0d0*(v1734 + v1860) - 5145.0d0*(v1743 + v1869) - 3885.0d0*( &
      v1744 + v1879) - 1085.0d0*(v1745 + v1885) - 8400.0d0*(v1755 + &
      v1818) - 5460.0d0*(v1756 + v1822) - 980.0d0*(v1757 + v1826) + &
      6300.0d0*(v1769 + v1783) + 10080.0d0*(v1771 + v1856) + 7560.0d0*( &
      v1773 + v1786) + 10710.0d0*(v1774 + v1861) + 3080.0d0*(v1775 + &
      v1795) + 2870.0d0*(v1776 + v1870) - 1008.0d0*(v1778 + v1887) - &
      1610.0d0*(v1781 + v1837) - 875.0d0*(v1782 + v1888) + 1750.0d0*( &
      v1784 + v1842) + 3360.0d0*(v1788 + v1846) - 6720.0d0*(v1806 + &
      v1813) - 15540.0d0*(v1809 + v1815) - 4032.0d0*(v1811 + v1828) + &
      2128.0d0*(v1834 + v1852) + 8512.0d0*(v1839 + v1854) + 19040.0d0*( &
      v1844 + v1857) + 22400.0d0*(v1847 + v1863) + 14560.0d0*(v1849 + &
      v1872) + 5488.0d0*(v1850 + v1882) + 1072.0d0*(v1851 + v1889) - &
      1400.0d0*(v1855 + v1890) - 4200.0d0*(v1858 + v1883) - 13440.0d0*( &
      v1904 + v1905) - 20020.0d0*(v1909 + v1910) + 70.0d0*(M_xxxxxxyz + &
      v1738 + v1830) + 105.0d0*(M_xxxxyzzz + v1753 + v1832) - 735.0d0*( &
      v1705 + v1709 + v1746 + v1831) + 525.0d0*(v1749 + v1752 + v1880 + &
      v1886) - 1680.0d0*(v1777 + v1779 + v1833 + v1881) - 5425.0d0*( &
      v1791 + v1866 + v1871 + v1873) - 2625.0d0*(v1800 + v1862 + v1864 &
      + v1875) + 280.0d0*(-M_yyyyyzzz + v1736 + v1737 + v1878 + v1884) &
      + 35.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1708 + v1710 + v1711 + v1714 &
      ) + 1120.0d0*(-v1731 - v1754 - v1760 - v1764 + v1797 + v1848) - &
      1575.0d0*(v1748 + v1793 + v1836 + v1838 + v1840 + v1868) - &
      1015.0d0*(v1751 + v1802 + v1841 + v1843 + v1845 + v1877) - &
      840.0d0*(v1761 + v1765 + v1808 + v1810 + v1835 + v1859) + 245.0d0 &
      *(v1706 + v1707 + v1712 + v1713 + v1716 + v1717 + v1718 + v1719) &
      + 420.0d0*(v1722 + v1733 + v1742 + v1758 + v1759 + v1785 + v1794 &
      + v1804) - 700.0d0*(v1787 + v1789 + v1790 + v1796 + v1798 + v1799 &
      + v1865 + v1874) + 210.0d0*(v1721 + v1723 + v1725 + v1740 + v1741 &
      + v1763 + v1767 + v1803 + v1805 + v1807 + v1817 + v1820) - &
      630.0d0*(v1726 + v1728 + v1730 + v1747 + v1750 + v1768 + v1770 + &
      v1772 + v1792 + v1801 + v1867 + v1876) + 1050.0d0*(v1735 + v1739 &
      + v1762 + v1766 + v1816 + v1819 + v1821 + v1823 + v1824 + v1825 + &
      v1827 + v1829))
#undef  M_0                 
#undef  z                   
#undef  Ms_0                
#undef  y                   
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
#undef  Ms_xxx              
#undef  M_xxx               
#undef  M_xxy               
#undef  Ms_xxy              
#undef  Ms_xxz              
#undef  M_xxz               
#undef  M_xyy               
#undef  Ms_xyy              
#undef  Ms_xyz              
#undef  M_xyz               
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
    
! OPS  2123*ADD + 2*DIV + 2804*MUL + 203*NEG + POW + 52*SUB = 5185  (6588 before optimization)
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
                v428, v429, v43, v430, v431, v432, v433, v434, v435, v436,&
                v437, v438, v439, v44, v440, v441, v442, v443, v444, v445,&
                v446, v447, v448, v449, v45, v450, v451, v452, v453, v454,&
                v455, v456, v457, v458, v459, v46, v460, v461, v462, v463,&
                v464, v465, v466, v467, v468, v469, v47, v470, v471, v472,&
                v473, v474, v475, v476, v477, v478, v479, v48, v480, v481,&
                v482, v483, v484, v485, v486, v487, v488, v489, v49, v490,&
                v491, v492, v493, v494, v495, v496, v497, v498, v499, v5, v50,&
                v500, v501, v502, v503, v504, v505, v506, v507, v508, v509,&
                v51, v510, v511, v512, v513, v514, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_0,&
                D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
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
                D_yyyyzzzz, D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
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
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define M_y                  M(2)
#define L_y                  L(2)
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
#define M_xxy                M(10)
#define L_xxy                L(10)
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
#define M_xxxxx              M(25)
#define L_xxxxx              L(25)
#define L_xxxxy              L(26)
#define M_xxxxy              M(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define M_xxxyy              M(28)
#define L_xxxyy              L(28)
#define L_xxxyz              L(29)
#define M_xxxyz              M(29)
#define L_xxyyy              L(30)
#define M_xxyyy              M(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define M_xyyyy              M(32)
#define L_xyyyy              L(32)
#define L_xyyyz              L(33)
#define M_xyyyz              M(33)
#define L_yyyyy              L(34)
#define M_yyyyy              M(34)
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
#define L_xxyyyy             L(43)
#define M_xxyyyy             M(43)
#define M_xxyyyz             M(44)
#define L_xxyyyz             L(44)
#define M_xyyyyy             M(45)
#define L_xyyyyy             L(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define M_yyyyyy             M(47)
#define L_yyyyyy             L(47)
#define L_yyyyyz             L(48)
#define M_yyyyyz             M(48)
#define L_xxxxxxx            L(49)
#define M_xxxxxxx            M(49)
#define M_xxxxxxy            M(50)
#define L_xxxxxxy            L(50)
#define L_xxxxxxz            L(51)
#define M_xxxxxxz            M(51)
#define L_xxxxxyy            L(52)
#define M_xxxxxyy            M(52)
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
#define L_xxyyyyz            L(59)
#define M_xxyyyyz            M(59)
#define M_xyyyyyy            M(60)
#define L_xyyyyyy            L(60)
#define L_xyyyyyz            L(61)
#define M_xyyyyyz            M(61)
#define M_yyyyyyy            M(62)
#define L_yyyyyyy            L(62)
#define L_yyyyyyz            L(63)
#define M_yyyyyyz            M(63)
#define M_xxxxxxxx           M(64)
#define L_xxxxxxxx           L(64)
#define M_xxxxxxxy           M(65)
#define L_xxxxxxxy           L(65)
#define M_xxxxxxxz           M(66)
#define L_xxxxxxxz           L(66)
#define L_xxxxxxyy           L(67)
#define M_xxxxxxyy           M(67)
#define M_xxxxxxyz           M(68)
#define L_xxxxxxyz           L(68)
#define M_xxxxxyyy           M(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define M_xxxxxyyz           M(70)
#define M_xxxxyyyy           M(71)
#define L_xxxxyyyy           L(71)
#define M_xxxxyyyz           M(72)
#define L_xxxxyyyz           L(72)
#define M_xxxyyyyy           M(73)
#define L_xxxyyyyy           L(73)
#define L_xxxyyyyz           L(74)
#define M_xxxyyyyz           M(74)
#define M_xxyyyyyy           M(75)
#define L_xxyyyyyy           L(75)
#define M_xxyyyyyz           M(76)
#define L_xxyyyyyz           L(76)
#define L_xyyyyyyy           L(77)
#define M_xyyyyyyy           M(77)
#define M_xyyyyyyz           M(78)
#define L_xyyyyyyz           L(78)
#define L_yyyyyyyy           L(79)
#define M_yyyyyyyy           M(79)
#define M_yyyyyyyz           M(80)
#define L_yyyyyyyz           L(80)
    v510       = y*z
    v511       = x*y
    v496       = 15.0d0*v510
    v498       = v511
    v500       = v510
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
    v357       = 0.000198412698412698d0*M_xxxxxxx
    v358       = 0.00138888888888889d0*M_xxxxxxy
    v359       = 0.00138888888888889d0*M_xxxxxxz
    v360       = 0.00416666666666667d0*M_xxxxxyy
    v361       = 0.00833333333333333d0*M_xxxxxyz
    v363       = 0.00694444444444444d0*M_xxxxyyy
    v364       = 0.0208333333333333d0*M_xxxxyyz
    v367       = 0.00694444444444444d0*M_xxxyyyy
    v368       = 0.0277777777777778d0*M_xxxyyyz
    v372       = 0.00416666666666667d0*M_xxyyyyy
    v373       = 0.0208333333333333d0*M_xxyyyyz
    v418       = 0.5d0*M_yy
    v420       = 0.166666666666667d0*M_yyy
    v421       = 0.5d0*M_yyz
    v425       = 0.0416666666666667d0*M_yyyy
    v426       = 0.166666666666667d0*M_yyyz
    v433       = 0.00833333333333333d0*M_yyyyy
    v434       = 0.0416666666666667d0*M_yyyyz
    v444       = 0.00138888888888889d0*M_yyyyyy
    v445       = 0.00833333333333333d0*M_yyyyyz
    v458       = 0.000198412698412698d0*M_yyyyyyy
    v459       = 0.00138888888888889d0*M_yyyyyyz
    M_zz       = -(M_xx + M_yy)
    v475       = 0.5d0*M_zz
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    v476       = 0.166666666666667d0*M_zzz
    M_xxzz     = -(M_xxxx + M_xxyy)
    v148       = 0.25d0*M_xxzz
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v427       = 0.25d0*M_yyzz
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    v477       = 0.0416666666666667d0*M_zzzz
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
    v435       = 0.0833333333333333d0*M_yyyzz
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v436       = 0.0833333333333333d0*M_yyzzz
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    v478       = 0.00833333333333333d0*M_zzzzz
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
    v446       = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v447       = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v448       = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    v479       = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v362       = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    v365       = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v366       = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v369       = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    v370       = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    v371       = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v374       = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v375       = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    v376       = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v377       = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v460       = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v461       = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v462       = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v463       = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    v480       = 0.000198412698412698d0*M_zzzzzzz
    M_xxxxxxzz = -(M_xxxxxxxx + M_xxxxxxyy)
    M_xxxxxyzz = -(M_xxxxxxxy + M_xxxxxyyy)
    M_xxxxxzzz = -(M_xxxxxxxz + M_xxxxxyyz)
    M_xxxxyyzz = -(M_xxxxxxyy + M_xxxxyyyy)
    M_xxxxyzzz = -(M_xxxxxxyz + M_xxxxyyyz)
    M_xxxxzzzz = -(M_xxxxxxzz + M_xxxxyyzz)
    M_xxxyyyzz = -(M_xxxxxyyy + M_xxxyyyyy)
    M_xxxyyzzz = -(M_xxxxxyyz + M_xxxyyyyz)
    M_xxxyzzzz = -(M_xxxxxyzz + M_xxxyyyzz)
    M_xxxzzzzz = -(M_xxxxxzzz + M_xxxyyzzz)
    M_xxyyyyzz = -(M_xxxxyyyy + M_xxyyyyyy)
    M_xxyyyzzz = -(M_xxxxyyyz + M_xxyyyyyz)
    M_xxyyzzzz = -(M_xxxxyyzz + M_xxyyyyzz)
    M_xxyzzzzz = -(M_xxxxyzzz + M_xxyyyzzz)
    M_xxzzzzzz = -(M_xxxxzzzz + M_xxyyzzzz)
    M_xyyyyyzz = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz = -(M_xxxyyyzz + M_xyyyyyzz)
    M_xyyzzzzz = -(M_xxxyyzzz + M_xyyyyzzz)
    M_xyzzzzzz = -(M_xxxyzzzz + M_xyyyzzzz)
    M_xzzzzzzz = -(M_xxxzzzzz + M_xyyzzzzz)
    M_yyyyyyzz = -(M_xxyyyyyy + M_yyyyyyyy)
    M_yyyyyzzz = -(M_xxyyyyyz + M_yyyyyyyz)
    M_yyyyzzzz = -(M_xxyyyyzz + M_yyyyyyzz)
    M_yyyzzzzz = -(M_xxyyyzzz + M_yyyyyzzz)
    M_yyzzzzzz = -(M_xxyyzzzz + M_yyyyzzzz)
    M_yzzzzzzz = -(M_xxyzzzzz + M_yyyzzzzz)
    M_zzzzzzzz = -(M_xxzzzzzz + M_yyzzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v481       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v481
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
    v482       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v483       = v1*v19
    v27        = v482
    v29        = 7.0d0*v1
    v59        = v483
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v484       = v0*v31
    v65        = v484
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
    v485       = 3.0d0*h
    v486       = h*v0
    v487       = h*v1
    v488       = h*v19
    v490       = v1*v486
    v492       = h*v31
    v4         = -h
    v12        = v485
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v489       = v0*v17
    v491       = v1*v17
    v18        = 3.0d0*v17
    v20        = v486
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v487
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 - 945.0d0*v19 + 630.0d0*v486
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 - 945.0d0*v31 + 630.0d0*v487
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v488
    v51        = v489
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v490
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v491
    v67        = v33 + v53 + v66
    v69        = v492
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v506       = -v85
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
    v106       = v17*v482
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v507       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v116       = -v108
    v117       = -1430.0d0*v57
    v508       = v116 + v117
    v119       = -1351350.0d0*v490
    v509       = v111 + v119
    v131       = v1*v46
    v132       = v31*v486
    v134       = -(3.0d0*v46 + 286.0d0*v57)
    v208       = v17*v31
    v290       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
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
    v493       = 3.0d0*v3
    v6         = v493*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v493*v500
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v494       = 3.0d0*v8
    v9         = v8*x
    v11        = v494*(h - v10)
    D_xxx      = -3.0d0*v9*(v481 - v485)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    v378       = 0.5d0*D_xyy
    D_xyz      = -v496*v9
    D_xzz      = -(D_xxx + D_xyy)
    v399       = 0.5d0*D_xzz
    D_yyy      = v494*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    v464       = 0.5d0*D_yzz
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v495       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v495*y
    v26        = v495*z
    v28        = v15*v496
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v262       = 0.5d0*D_xxyy
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    v277       = 0.5d0*D_xxzz
    D_xyyy     = v22*v30
    v329       = 0.5d0*D_xyyy
    v379       = 0.166666666666667d0*D_xyyy
    D_xyyz     = v26*(v29 + v4)
    v394       = 0.5d0*D_xyyz
    D_xyzz     = -(D_xxxy + D_xyyy)
    v344       = 0.5d0*D_xyzz
    D_xzzz     = -(D_xxxz + D_xyyz)
    v400       = 0.166666666666667d0*D_xzzz
    v413       = 0.5d0*D_xzzz
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    v449       = 0.5d0*D_yyzz
    D_yzzz     = -(D_xxyz + D_yyyz)
    v465       = 0.166666666666667d0*D_yzzz
    v470       = 0.5d0*D_yzzz
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v512       = v34*z
    v497       = 15.0d0*v34
    v35        = v497*x
    v39        = v512
    v41        = 315.0d0*v498*v512
    v42        = v497*y
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
    D_xxyyz    = v39*(v36 - 945.0d0*v482 + 105.0d0*(v486 + v487))
    v273       = 0.5d0*D_xxyyz
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    v238       = 0.5d0*D_xxyzz
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    v278       = 0.166666666666667d0*D_xxzzz
    v286       = 0.5d0*D_xxzzz
    D_xyyyy    = v34*v43*x
    v310       = 0.5d0*D_xyyyy
    v330       = 0.166666666666667d0*D_xyyyy
    v380       = 0.0416666666666667d0*D_xyyyy
    D_xyyyz    = v41*(h - v7)
    v340       = 0.5d0*D_xyyyz
    v390       = 0.166666666666667d0*D_xyyyz
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    v320       = 0.5d0*D_xyyzz
    v395       = 0.25d0*D_xyyzz
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    v345       = 0.166666666666667d0*D_xyzzz
    v353       = 0.5d0*D_xyzzz
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    v401       = 0.0416666666666667d0*D_xzzzz
    v414       = 0.166666666666667d0*D_xzzzz
    D_yyyyy    = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz    = v39*v43
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    v437       = 0.5d0*D_yyyzz
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    v450       = 0.166666666666667d0*D_yyzzz
    v454       = 0.5d0*D_yyzzz
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    v466       = 0.0416666666666667d0*D_yzzzz
    v471       = 0.166666666666667d0*D_yzzzz
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    u12        = u6*u6
    u13        = u6*u7
    v44        = u13
    v513       = 315.0d0*v44
    v499       = v513*x
    v45        = 45.0d0*v44
    v52        = v499*y
    v56        = v499*z
    v60        = v500*v513
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 + v17*v29 - 21.0d0*v488 + 14.0d0*v51 + 231.0d0*v59)
    v149       = 0.5d0*D_xxxxyy
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    v155       = 0.5d0*D_xxxxzz
    D_xxxyyy   = 945.0d0*v44*v498*(11.0d0*v27 + v17 + v61 + v62)
    v168       = 0.5d0*D_xxxyyy
    v190       = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    v196       = 0.5d0*D_xxxyyz
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    v174       = 0.5d0*D_xxxyzz
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    v200       = 0.166666666666667d0*D_xxxzzz
    v205       = 0.5d0*D_xxxzzz
    D_xxyyyy   = v45*(v58 + v17*v24 - 21.0d0*v492 + 14.0d0*v64 + 231.0d0*v65)
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
    v299       = 0.5d0*D_xyyyyy
    v311       = 0.166666666666667d0*D_xyyyyy
    v331       = 0.0416666666666667d0*D_xyyyyy
    v381       = 0.00833333333333333d0*D_xyyyyy
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    v317       = 0.5d0*D_xyyyyz
    v337       = 0.166666666666667d0*D_xyyyyz
    v387       = 0.0416666666666667d0*D_xyyyyz
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    v305       = 0.5d0*D_xyyyzz
    v341       = 0.25d0*D_xyyyzz
    v391       = 0.0833333333333333d0*D_xyyyzz
    v408       = 0.166666666666667d0*D_xyyyzz
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    v321       = 0.166666666666667d0*D_xyyzzz
    v326       = 0.5d0*D_xyyzzz
    v396       = 0.0833333333333333d0*D_xyyzzz
    v410       = 0.25d0*D_xyyzzz
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    v346       = 0.0416666666666667d0*D_xyzzzz
    v354       = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    v402       = 0.00833333333333333d0*D_xzzzzz
    v415       = 0.0416666666666667d0*D_xzzzzz
    D_yyyyyy   = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz   = v60*v67
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    v428       = 0.5d0*D_yyyyzz
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    v438       = 0.166666666666667d0*D_yyyzzz
    v441       = 0.5d0*D_yyyzzz
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    v451       = 0.0416666666666667d0*D_yyzzzz
    v455       = 0.166666666666667d0*D_yyzzzz
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    v467       = 0.00833333333333333d0*D_yzzzzz
    v472       = 0.0416666666666667d0*D_yzzzzz
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    u14        = u7*u7
    u15        = u7*u8
    v70        = u15
    v514       = 945.0d0*v70
    v501       = 315.0d0*v70
    v71        = v501*x
    v75        = v501*y
    v77        = v501*z
    v81        = v500*v514*x
    v83        = v514
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy  = v75*v76
    D_xxxxxxz  = v76*v77
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v125       = 0.5d0*D_xxxxxyy
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    v128       = 0.5d0*D_xxxxxzz
    D_xxxxyyy  = -v83*y*(v506 + v1*v18 + v1*v82 - v84)
    v137       = 0.5d0*D_xxxxyyy
    v150       = 0.166666666666667d0*D_xxxxyyy
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    v153       = 0.5d0*D_xxxxyyz
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    v140       = 0.5d0*D_xxxxyzz
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    v156       = 0.166666666666667d0*D_xxxxzzz
    v158       = 0.5d0*D_xxxxzzz
    D_xxxyyyy  = -v83*x*(v506 + v0*v18 + v0*v90 - v89)
    v162       = 0.5d0*D_xxxyyyy
    v169       = 0.166666666666667d0*D_xxxyyyy
    v191       = 0.0416666666666667d0*D_xxxyyyy
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v172       = 0.5d0*D_xxxyyyz
    v194       = 0.166666666666667d0*D_xxxyyyz
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
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    v221       = 0.5d0*D_xxyyyyz
    v233       = 0.166666666666667d0*D_xxyyyyz
    v268       = 0.0416666666666667d0*D_xxyyyyz
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
    v293       = 0.5d0*D_xyyyyyy
    v300       = 0.166666666666667d0*D_xyyyyyy
    v312       = 0.0416666666666667d0*D_xyyyyyy
    v332       = 0.00833333333333333d0*D_xyyyyyy
    v382       = 0.00138888888888889d0*D_xyyyyyy
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    v303       = 0.5d0*D_xyyyyyz
    v315       = 0.166666666666667d0*D_xyyyyyz
    v335       = 0.0416666666666667d0*D_xyyyyyz
    v385       = 0.00833333333333333d0*D_xyyyyyz
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    v296       = 0.5d0*D_xyyyyzz
    v318       = 0.25d0*D_xyyyyzz
    v338       = 0.0833333333333333d0*D_xyyyyzz
    v350       = 0.166666666666667d0*D_xyyyyzz
    v388       = 0.0208333333333333d0*D_xyyyyzz
    v406       = 0.0416666666666667d0*D_xyyyyzz
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    v306       = 0.166666666666667d0*D_xyyyzzz
    v308       = 0.5d0*D_xyyyzzz
    v342       = 0.0833333333333333d0*D_xyyyzzz
    v351       = 0.25d0*D_xyyyzzz
    v392       = 0.0277777777777778d0*D_xyyyzzz
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    v322       = 0.0416666666666667d0*D_xyyzzzz
    v327       = 0.166666666666667d0*D_xyyzzzz
    v397       = 0.0208333333333333d0*D_xyyzzzz
    v411       = 0.0833333333333333d0*D_xyyzzzz
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    v347       = 0.00833333333333333d0*D_xyzzzzz
    v355       = 0.0416666666666667d0*D_xyzzzzz
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    v403       = 0.00138888888888889d0*D_xzzzzzz
    v416       = 0.00833333333333333d0*D_xzzzzzz
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz  = v77*v94
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    v422       = 0.5d0*D_yyyyyzz
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    v429       = 0.166666666666667d0*D_yyyyzzz
    v431       = 0.5d0*D_yyyyzzz
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    v439       = 0.0416666666666667d0*D_yyyzzzz
    v442       = 0.166666666666667d0*D_yyyzzzz
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    v452       = 0.00833333333333333d0*D_yyzzzzz
    v456       = 0.0416666666666667d0*D_yyzzzzz
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    v468       = 0.00138888888888889d0*D_yzzzzzz
    v473       = 0.00833333333333333d0*D_yzzzzzz
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v502       = v511*v95
    v503       = v95*z
    v504       = v503*x
    v505       = v503*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v502
    v105       = 2835.0d0*v504
    v110       = v505
    v115       = 945.0d0*v502
    v118       = v504
    v133       = 2835.0d0*v505
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = v104*v105
    L_xxxxxxx  = D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxy*M_y + D_xxxxxxxz*M_z
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = -v96*(v507 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    v113       = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v489 + 155925.0d0*(-13.0d0*v488 + 13.0d0*v49))
    L_xxxxxxy  = D_xxxxxxxy*M_x + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyz*M_z
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    v114       = 0.5d0*D_xxxxxxzz
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*v112 + D_xxxxxxxy*M_xy + &
      D_xxxxxxxz*M_xz + D_xxxxxxy*M_y + D_xxxxxxyz*M_yz + D_xxxxxxz*M_z &
      + M_yy*v113 + M_zz*v114
    L_xxxxxxz  = D_xxxxxxxz*M_x + D_xxxxxxyz*M_y + D_xxxxxxz*M_0 + D_xxxxxxzz*M_z
    D_xxxxxyyy = v115*(v508 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v120       = 0.5d0*D_xxxxxyyy
    v126       = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = v118*(v509 + 2027025.0d0*v483 - 135135.0d0*v488 + 103950.0d0*v489 + &
      155925.0d0*v491)
    v127       = 0.5d0*D_xxxxxyyz
    L_xxxxxyy  = D_xxxxxxyy*M_x + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyz*M_z
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    v121       = 0.5d0*D_xxxxxyzz
    L_xxxxxy   = D_xxxxxxxy*v112 + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyz*M_yz + D_xxxxxyz*M_z + &
      M_yy*v120 + M_zz*v121
    L_xxxxxyz  = D_xxxxxxyz*M_x + D_xxxxxyyz*M_y + D_xxxxxyz*M_0 + D_xxxxxyzz*M_z
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    v129       = 0.166666666666667d0*D_xxxxxzzz
    v130       = 0.5d0*D_xxxxxzzz
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*v112 + D_xxxxxxxx*v122 + &
      D_xxxxxxxy*v123 + D_xxxxxxxz*v124 + D_xxxxxxy*M_xy + D_xxxxxxyz* &
      M_xyz + D_xxxxxxz*M_xz + D_xxxxxy*M_y + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + M_xyy*v113 + M_xzz*v114 + M_yy*v125 + M_yyy*v126 + M_yyz* &
      v127 + M_yzz*v121 + M_zz*v128 + M_zzz*v129
    L_xxxxxz   = D_xxxxxxxz*v112 + D_xxxxxxyz*M_xy + D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + &
      D_xxxxxyz*M_y + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + D_xxxxxzz*M_z + &
      M_yy*v127 + M_zz*v130
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v131) - 858.0d0*(v1*v50 + v132))
    v135       = 0.5d0*D_xxxxyyyy
    v138       = 0.166666666666667d0*D_xxxxyyyy
    v151       = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = v133*(v134 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v139       = 0.5d0*D_xxxxyyyz
    v152       = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyy  = D_xxxxxyyy*M_x + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyz*M_z
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    v136       = 0.5d0*D_xxxxyyzz
    v154       = 0.25d0*D_xxxxyyzz
    L_xxxxyy   = D_xxxxxxyy*v112 + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyz*M_yz + D_xxxxyyz*M_z + &
      M_yy*v135 + M_zz*v136
    L_xxxxyyz  = D_xxxxxyyz*M_x + D_xxxxyyyz*M_y + D_xxxxyyz*M_0 + D_xxxxyyzz*M_z
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    v141       = 0.166666666666667d0*D_xxxxyzzz
    v142       = 0.5d0*D_xxxxyzzz
    L_xxxxy    = D_xxxxxxxy*v122 + D_xxxxxxy*v112 + D_xxxxxxyy*v123 + D_xxxxxxyz*v124 + &
      D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz &
      + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyz*M_yz + D_xxxxyz*M_z + &
      M_xyy*v120 + M_xzz*v121 + M_yy*v137 + M_yyy*v138 + M_yyz*v139 + &
      M_yzz*v136 + M_zz*v140 + M_zzz*v141
    L_xxxxyz   = D_xxxxxxyz*v112 + D_xxxxxyyz*M_xy + D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + &
      D_xxxxyyz*M_y + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + D_xxxxyzz*M_z + &
      M_yy*v139 + M_zz*v142
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    v157       = 0.0416666666666667d0*D_xxxxzzzz
    v159       = 0.166666666666667d0*D_xxxxzzzz
    L_xxxx     = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v112 + D_xxxxxxx*v122 + D_xxxxxxxx* &
      v143 + D_xxxxxxxy*v144 + D_xxxxxxxz*v145 + D_xxxxxxy*v123 + &
      D_xxxxxxyy*v146 + D_xxxxxxyz*v147 + D_xxxxxxz*v124 + D_xxxxxxzz* &
      v148 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxy* &
      M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_xyy*v125 + M_xyyy*v126 + &
      M_xyyz*v127 + M_xyzz*v121 + M_xzz*v128 + M_xzzz*v129 + M_yy*v149 &
      + M_yyy*v150 + M_yyyy*v151 + M_yyyz*v152 + M_yyz*v153 + M_yyzz* &
      v154 + M_yzz*v140 + M_yzzz*v141 + M_zz*v155 + M_zzz*v156 + M_zzzz &
      *v157
    L_xxxxz    = D_xxxxxxxz*v122 + D_xxxxxxyz*v123 + D_xxxxxxz*v112 + D_xxxxxxzz*v124 + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxz*M_x + D_xxxxxzz*M_xz &
      + D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + D_xxxxzz*M_z + &
      M_xyy*v127 + M_xzz*v130 + M_yy*v153 + M_yyy*v152 + M_yyz*v136 + &
      M_yzz*v142 + M_zz*v158 + M_zzz*v159
    D_xxxyyyyy = v115*(v508 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v160       = 0.5d0*D_xxxyyyyy
    v163       = 0.166666666666667d0*D_xxxyyyyy
    v170       = 0.0416666666666667d0*D_xxxyyyyy
    v192       = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = v105*(v134 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v164       = 0.5d0*D_xxxyyyyz
    v171       = 0.166666666666667d0*D_xxxyyyyz
    v193       = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyy  = D_xxxxyyyy*M_x + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyz*M_z
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    v161       = 0.5d0*D_xxxyyyzz
    v173       = 0.25d0*D_xxxyyyzz
    v195       = 0.0833333333333333d0*D_xxxyyyzz
    v203       = 0.166666666666667d0*D_xxxyyyzz
    L_xxxyyy   = D_xxxxxyyy*v112 + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyz*M_yz + D_xxxyyyz*M_z + &
      M_yy*v160 + M_zz*v161
    L_xxxyyyz  = D_xxxxyyyz*M_x + D_xxxyyyyz*M_y + D_xxxyyyz*M_0 + D_xxxyyyzz*M_z
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    v166       = 0.166666666666667d0*D_xxxyyzzz
    v167       = 0.5d0*D_xxxyyzzz
    v198       = 0.0833333333333333d0*D_xxxyyzzz
    v204       = 0.25d0*D_xxxyyzzz
    L_xxxyy    = D_xxxxxxyy*v122 + D_xxxxxyy*v112 + D_xxxxxyyy*v123 + D_xxxxxyyz*v124 + &
      D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz &
      + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyz*M_yz + D_xxxyyz*M_z + &
      M_xyy*v135 + M_xzz*v136 + M_yy*v162 + M_yyy*v163 + M_yyz*v164 + &
      M_yzz*v161 + M_zz*v165 + M_zzz*v166
    L_xxxyyz   = D_xxxxxyyz*v112 + D_xxxxyyyz*M_xy + D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + &
      D_xxxyyyz*M_y + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + D_xxxyyzz*M_z + &
      M_yy*v164 + M_zz*v167
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    v176       = 0.0416666666666667d0*D_xxxyzzzz
    v178       = 0.166666666666667d0*D_xxxyzzzz
    L_xxxy     = D_xxxxxxxy*v143 + D_xxxxxxy*v122 + D_xxxxxxyy*v144 + D_xxxxxxyz*v145 + &
      D_xxxxxy*v112 + D_xxxxxyy*v123 + D_xxxxxyyy*v146 + D_xxxxxyyz* &
      v147 + D_xxxxxyz*v124 + D_xxxxxyzz*v148 + D_xxxxy*M_x + D_xxxxyy* &
      M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyy*M_y &
      + D_xxxyyz*M_yz + D_xxxyz*M_z + M_xyy*v137 + M_xyyy*v138 + M_xyyz &
      *v139 + M_xyzz*v136 + M_xzz*v140 + M_xzzz*v141 + M_yy*v168 + &
      M_yyy*v169 + M_yyyy*v170 + M_yyyz*v171 + M_yyz*v172 + M_yyzz*v173 &
      + M_yzz*v165 + M_yzzz*v166 + M_zz*v174 + M_zzz*v175 + M_zzzz*v176
    L_xxxyz    = D_xxxxxxyz*v122 + D_xxxxxyyz*v123 + D_xxxxxyz*v112 + D_xxxxxyzz*v124 + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyz*M_x + D_xxxxyzz*M_xz &
      + D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + D_xxxyzz*M_z + &
      M_xyy*v139 + M_xzz*v142 + M_yy*v172 + M_yyy*v171 + M_yyz*v161 + &
      M_yzz*v167 + M_zz*v177 + M_zzz*v178
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    v202       = 0.00833333333333333d0*D_xxxzzzzz
    v207       = 0.0416666666666667d0*D_xxxzzzzz
    L_xxx      = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v112 + D_xxxxxx*v122 + D_xxxxxxx*v143 + &
      D_xxxxxxxx*v179 + D_xxxxxxxy*v180 + D_xxxxxxxz*v181 + D_xxxxxxy* &
      v144 + D_xxxxxxyy*v182 + D_xxxxxxyz*v183 + D_xxxxxxz*v145 + &
      D_xxxxxxzz*v184 + D_xxxxxy*v123 + D_xxxxxyy*v146 + D_xxxxxyyy* &
      v185 + D_xxxxxyyz*v186 + D_xxxxxyz*v147 + D_xxxxxyzz*v187 + &
      D_xxxxxz*v124 + D_xxxxxzz*v148 + D_xxxxxzzz*v188 + D_xxxxy*M_xy + &
      D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxy*M_y + D_xxxyz*M_yz + &
      D_xxxz*M_z + M_xyy*v149 + M_xyyy*v150 + M_xyyyy*v151 + M_xyyyz* &
      v152 + M_xyyz*v153 + M_xyyzz*v154 + M_xyzz*v140 + M_xyzzz*v141 + &
      M_xzz*v155 + M_xzzz*v156 + M_xzzzz*v157 + M_yy*v189 + M_yyy*v190 &
      + M_yyyy*v191 + M_yyyyy*v192 + M_yyyyz*v193 + M_yyyz*v194 + &
      M_yyyzz*v195 + M_yyz*v196 + M_yyzz*v197 + M_yyzzz*v198 + M_yzz* &
      v174 + M_yzzz*v175 + M_yzzzz*v176 + M_zz*v199 + M_zzz*v200 + &
      M_zzzz*v201 + M_zzzzz*v202
    L_xxxz     = D_xxxxxxxz*v143 + D_xxxxxxyz*v144 + D_xxxxxxz*v122 + D_xxxxxxzz*v145 + &
      D_xxxxxyyz*v146 + D_xxxxxyz*v123 + D_xxxxxyzz*v147 + D_xxxxxz* &
      v112 + D_xxxxxzz*v124 + D_xxxxxzzz*v148 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y + &
      D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_xyy*v153 + M_xyyy* &
      v152 + M_xyyz*v136 + M_xyzz*v142 + M_xzz*v158 + M_xzzz*v159 + &
      M_yy*v196 + M_yyy*v194 + M_yyyy*v193 + M_yyyz*v203 + M_yyz*v165 + &
      M_yyzz*v204 + M_yzz*v177 + M_yzzz*v178 + M_zz*v205 + M_zzz*v206 + &
      M_zzzz*v207
    D_xxyyyyyy = -v96*(v507 + h*v92 + v0*v108 + 135.0d0*v131 - 495.0d0*v208 + 6435.0d0*( &
      -v0*v68 + v132))
    v209       = 0.5d0*D_xxyyyyyy
    v212       = 0.166666666666667d0*D_xxyyyyyy
    v219       = 0.0416666666666667d0*D_xxyyyyyy
    v231       = 0.00833333333333333d0*D_xxyyyyyy
    v266       = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = v110*(v509 + 2027025.0d0*v484 + 155925.0d0*v489 + 103950.0d0*v491 - &
      135135.0d0*v492)
    v213       = 0.5d0*D_xxyyyyyz
    v220       = 0.166666666666667d0*D_xxyyyyyz
    v232       = 0.0416666666666667d0*D_xxyyyyyz
    v267       = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyy  = D_xxxyyyyy*M_x + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyz*M_z
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    v210       = 0.5d0*D_xxyyyyzz
    v222       = 0.25d0*D_xxyyyyzz
    v234       = 0.0833333333333333d0*D_xxyyyyzz
    v242       = 0.166666666666667d0*D_xxyyyyzz
    v269       = 0.0208333333333333d0*D_xxyyyyzz
    v282       = 0.0416666666666667d0*D_xxyyyyzz
    L_xxyyyy   = D_xxxxyyyy*v112 + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyz*M_yz + D_xxyyyyz*M_z + &
      M_yy*v209 + M_zz*v210
    L_xxyyyyz  = D_xxxyyyyz*M_x + D_xxyyyyyz*M_y + D_xxyyyyz*M_0 + D_xxyyyyzz*M_z
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    v215       = 0.166666666666667d0*D_xxyyyzzz
    v216       = 0.5d0*D_xxyyyzzz
    v237       = 0.0833333333333333d0*D_xxyyyzzz
    v243       = 0.25d0*D_xxyyyzzz
    v272       = 0.0277777777777778d0*D_xxyyyzzz
    L_xxyyy    = D_xxxxxyyy*v122 + D_xxxxyyy*v112 + D_xxxxyyyy*v123 + D_xxxxyyyz*v124 + &
      D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz &
      + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyz*M_yz + D_xxyyyz*M_z + &
      M_xyy*v160 + M_xzz*v161 + M_yy*v211 + M_yyy*v212 + M_yyz*v213 + &
      M_yzz*v210 + M_zz*v214 + M_zzz*v215
    L_xxyyyz   = D_xxxxyyyz*v112 + D_xxxyyyyz*M_xy + D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + &
      D_xxyyyyz*M_y + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + D_xxyyyzz*M_z + &
      M_yy*v213 + M_zz*v216
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    v225       = 0.0416666666666667d0*D_xxyyzzzz
    v227       = 0.166666666666667d0*D_xxyyzzzz
    v276       = 0.0208333333333333d0*D_xxyyzzzz
    v285       = 0.0833333333333333d0*D_xxyyzzzz
    L_xxyy     = D_xxxxxxyy*v143 + D_xxxxxyy*v122 + D_xxxxxyyy*v144 + D_xxxxxyyz*v145 + &
      D_xxxxyy*v112 + D_xxxxyyy*v123 + D_xxxxyyyy*v146 + D_xxxxyyyz* &
      v147 + D_xxxxyyz*v124 + D_xxxxyyzz*v148 + D_xxxyy*M_x + D_xxxyyy* &
      M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyy*M_y &
      + D_xxyyyz*M_yz + D_xxyyz*M_z + M_xyy*v162 + M_xyyy*v163 + M_xyyz &
      *v164 + M_xyzz*v161 + M_xzz*v165 + M_xzzz*v166 + M_yy*v217 + &
      M_yyy*v218 + M_yyyy*v219 + M_yyyz*v220 + M_yyz*v221 + M_yyzz*v222 &
      + M_yzz*v214 + M_yzzz*v215 + M_zz*v223 + M_zzz*v224 + M_zzzz*v225
    L_xxyyz    = D_xxxxxyyz*v122 + D_xxxxyyyz*v123 + D_xxxxyyz*v112 + D_xxxxyyzz*v124 + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyz*M_x + D_xxxyyzz*M_xz &
      + D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + D_xxyyzz*M_z + &
      M_xyy*v164 + M_xzz*v167 + M_yy*v221 + M_yyy*v220 + M_yyz*v210 + &
      M_yzz*v216 + M_zz*v226 + M_zzz*v227
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    v241       = 0.00833333333333333d0*D_xxyzzzzz
    v246       = 0.0416666666666667d0*D_xxyzzzzz
    L_xxy      = D_xxxxxxxy*v179 + D_xxxxxxy*v143 + D_xxxxxxyy*v180 + D_xxxxxxyz*v181 + &
      D_xxxxxy*v122 + D_xxxxxyy*v144 + D_xxxxxyyy*v182 + D_xxxxxyyz* &
      v183 + D_xxxxxyz*v145 + D_xxxxxyzz*v184 + D_xxxxy*v112 + D_xxxxyy &
      *v123 + D_xxxxyyy*v146 + D_xxxxyyyy*v185 + D_xxxxyyyz*v186 + &
      D_xxxxyyz*v147 + D_xxxxyyzz*v187 + D_xxxxyz*v124 + D_xxxxyzz*v148 &
      + D_xxxxyzzz*v188 + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyz*M_xyz + &
      D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z &
      + M_xyy*v168 + M_xyyy*v169 + M_xyyyy*v170 + M_xyyyz*v171 + M_xyyz &
      *v172 + M_xyyzz*v173 + M_xyzz*v165 + M_xyzzz*v166 + M_xzz*v174 + &
      M_xzzz*v175 + M_xzzzz*v176 + M_yy*v228 + M_yyy*v229 + M_yyyy*v230 &
      + M_yyyyy*v231 + M_yyyyz*v232 + M_yyyz*v233 + M_yyyzz*v234 + &
      M_yyz*v235 + M_yyzz*v236 + M_yyzzz*v237 + M_yzz*v223 + M_yzzz* &
      v224 + M_yzzzz*v225 + M_zz*v238 + M_zzz*v239 + M_zzzz*v240 + &
      M_zzzzz*v241
    L_xxyz     = D_xxxxxxyz*v143 + D_xxxxxyyz*v144 + D_xxxxxyz*v122 + D_xxxxxyzz*v145 + &
      D_xxxxyyyz*v146 + D_xxxxyyz*v123 + D_xxxxyyzz*v147 + D_xxxxyz* &
      v112 + D_xxxxyzz*v124 + D_xxxxyzzz*v148 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y + &
      D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_xyy*v172 + M_xyyy* &
      v171 + M_xyyz*v161 + M_xyzz*v167 + M_xzz*v177 + M_xzzz*v178 + &
      M_yy*v235 + M_yyy*v233 + M_yyyy*v232 + M_yyyz*v242 + M_yyz*v214 + &
      M_yyzz*v243 + M_yzz*v226 + M_yzzz*v227 + M_zz*v244 + M_zzz*v245 + &
      M_zzzz*v246
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    v281       = 0.00138888888888889d0*D_xxzzzzzz
    v289       = 0.00833333333333333d0*D_xxzzzzzz
    L_xx       = D_xx*M_0 + D_xxx*M_x + D_xxxx*v112 + D_xxxxx*v122 + D_xxxxxx*v143 + &
      D_xxxxxxx*v179 + D_xxxxxxxx*v247 + D_xxxxxxxy*v248 + D_xxxxxxxz* &
      v249 + D_xxxxxxy*v180 + D_xxxxxxyy*v250 + D_xxxxxxyz*v251 + &
      D_xxxxxxz*v181 + D_xxxxxxzz*v252 + D_xxxxxy*v144 + D_xxxxxyy*v182 &
      + D_xxxxxyyy*v253 + D_xxxxxyyz*v254 + D_xxxxxyz*v183 + D_xxxxxyzz &
      *v255 + D_xxxxxz*v145 + D_xxxxxzz*v184 + D_xxxxxzzz*v256 + &
      D_xxxxy*v123 + D_xxxxyy*v146 + D_xxxxyyy*v185 + D_xxxxyyyy*v257 + &
      D_xxxxyyyz*v258 + D_xxxxyyz*v186 + D_xxxxyyzz*v259 + D_xxxxyz* &
      v147 + D_xxxxyzz*v187 + D_xxxxyzzz*v260 + D_xxxxz*v124 + D_xxxxzz &
      *v148 + D_xxxxzzz*v188 + D_xxxxzzzz*v261 + D_xxxy*M_xy + D_xxxyz* &
      M_xyz + D_xxxz*M_xz + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + M_xyy &
      *v189 + M_xyyy*v190 + M_xyyyy*v191 + M_xyyyyy*v192 + M_xyyyyz* &
      v193 + M_xyyyz*v194 + M_xyyyzz*v195 + M_xyyz*v196 + M_xyyzz*v197 &
      + M_xyyzzz*v198 + M_xyzz*v174 + M_xyzzz*v175 + M_xyzzzz*v176 + &
      M_xzz*v199 + M_xzzz*v200 + M_xzzzz*v201 + M_xzzzzz*v202 + M_yy* &
      v262 + M_yyy*v263 + M_yyyy*v264 + M_yyyyy*v265 + M_yyyyyy*v266 + &
      M_yyyyyz*v267 + M_yyyyz*v268 + M_yyyyzz*v269 + M_yyyz*v270 + &
      M_yyyzz*v271 + M_yyyzzz*v272 + M_yyz*v273 + M_yyzz*v274 + M_yyzzz &
      *v275 + M_yyzzzz*v276 + M_yzz*v238 + M_yzzz*v239 + M_yzzzz*v240 + &
      M_yzzzzz*v241 + M_zz*v277 + M_zzz*v278 + M_zzzz*v279 + M_zzzzz* &
      v280 + M_zzzzzz*v281
    L_xxz      = D_xxxxxxxz*v179 + D_xxxxxxyz*v180 + D_xxxxxxz*v143 + D_xxxxxxzz*v181 + &
      D_xxxxxyyz*v182 + D_xxxxxyz*v144 + D_xxxxxyzz*v183 + D_xxxxxz* &
      v122 + D_xxxxxzz*v145 + D_xxxxxzzz*v184 + D_xxxxyyyz*v185 + &
      D_xxxxyyz*v146 + D_xxxxyyzz*v186 + D_xxxxyz*v123 + D_xxxxyzz*v147 &
      + D_xxxxyzzz*v187 + D_xxxxz*v112 + D_xxxxzz*v124 + D_xxxxzzz*v148 &
      + D_xxxxzzzz*v188 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + &
      D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z &
      + M_xyy*v196 + M_xyyy*v194 + M_xyyyy*v193 + M_xyyyz*v203 + M_xyyz &
      *v165 + M_xyyzz*v204 + M_xyzz*v177 + M_xyzzz*v178 + M_xzz*v205 + &
      M_xzzz*v206 + M_xzzzz*v207 + M_yy*v273 + M_yyy*v270 + M_yyyy*v268 &
      + M_yyyyy*v267 + M_yyyyz*v282 + M_yyyz*v283 + M_yyyzz*v237 + &
      M_yyz*v223 + M_yyzz*v284 + M_yyzzz*v285 + M_yzz*v244 + M_yzzz* &
      v245 + M_yzzzz*v246 + M_zz*v286 + M_zzz*v287 + M_zzzz*v288 + &
      M_zzzzz*v289
    D_xyyyyyyy = v102*v290
    v291       = 0.5d0*D_xyyyyyyy
    v294       = 0.166666666666667d0*D_xyyyyyyy
    v301       = 0.0416666666666667d0*D_xyyyyyyy
    v313       = 0.00833333333333333d0*D_xyyyyyyy
    v333       = 0.00138888888888889d0*D_xyyyyyyy
    v383       = 0.000198412698412698d0*D_xyyyyyyy
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = v118*(v111 + 467775.0d0*v491 + 155925.0d0*(-13.0d0*v492 + 13.0d0*v68))
    v295       = 0.5d0*D_xyyyyyyz
    v302       = 0.166666666666667d0*D_xyyyyyyz
    v314       = 0.0416666666666667d0*D_xyyyyyyz
    v334       = 0.00833333333333333d0*D_xyyyyyyz
    v384       = 0.00138888888888889d0*D_xyyyyyyz
    L_xyyyyyy  = D_xxyyyyyy*M_x + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyz*M_z
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    v292       = 0.5d0*D_xyyyyyzz
    v304       = 0.25d0*D_xyyyyyzz
    v316       = 0.0833333333333333d0*D_xyyyyyzz
    v324       = 0.166666666666667d0*D_xyyyyyzz
    v336       = 0.0208333333333333d0*D_xyyyyyzz
    v349       = 0.0416666666666667d0*D_xyyyyyzz
    v386       = 0.00416666666666667d0*D_xyyyyyzz
    v405       = 0.00833333333333333d0*D_xyyyyyzz
    L_xyyyyy   = D_xxxyyyyy*v112 + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyz*M_yz + D_xyyyyyz*M_z + &
      M_yy*v291 + M_zz*v292
    L_xyyyyyz  = D_xxyyyyyz*M_x + D_xyyyyyyz*M_y + D_xyyyyyz*M_0 + D_xyyyyyzz*M_z
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    v297       = 0.166666666666667d0*D_xyyyyzzz
    v298       = 0.5d0*D_xyyyyzzz
    v319       = 0.0833333333333333d0*D_xyyyyzzz
    v325       = 0.25d0*D_xyyyyzzz
    v339       = 0.0277777777777778d0*D_xyyyyzzz
    v389       = 0.00694444444444444d0*D_xyyyyzzz
    v407       = 0.0208333333333333d0*D_xyyyyzzz
    L_xyyyy    = D_xxxxyyyy*v122 + D_xxxyyyy*v112 + D_xxxyyyyy*v123 + D_xxxyyyyz*v124 + &
      D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz &
      + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyz*M_yz + D_xyyyyz*M_z + &
      M_xyy*v209 + M_xzz*v210 + M_yy*v293 + M_yyy*v294 + M_yyz*v295 + &
      M_yzz*v292 + M_zz*v296 + M_zzz*v297
    L_xyyyyz   = D_xxxyyyyz*v112 + D_xxyyyyyz*M_xy + D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + &
      D_xyyyyyz*M_y + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + D_xyyyyzz*M_z + &
      M_yy*v295 + M_zz*v298
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    v307       = 0.0416666666666667d0*D_xyyyzzzz
    v309       = 0.166666666666667d0*D_xyyyzzzz
    v343       = 0.0208333333333333d0*D_xyyyzzzz
    v352       = 0.0833333333333333d0*D_xyyyzzzz
    v393       = 0.00694444444444444d0*D_xyyyzzzz
    v409       = 0.0277777777777778d0*D_xyyyzzzz
    L_xyyy     = D_xxxxxyyy*v143 + D_xxxxyyy*v122 + D_xxxxyyyy*v144 + D_xxxxyyyz*v145 + &
      D_xxxyyy*v112 + D_xxxyyyy*v123 + D_xxxyyyyy*v146 + D_xxxyyyyz* &
      v147 + D_xxxyyyz*v124 + D_xxxyyyzz*v148 + D_xxyyy*M_x + D_xxyyyy* &
      M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyy*M_y &
      + D_xyyyyz*M_yz + D_xyyyz*M_z + M_xyy*v211 + M_xyyy*v212 + M_xyyz &
      *v213 + M_xyzz*v210 + M_xzz*v214 + M_xzzz*v215 + M_yy*v299 + &
      M_yyy*v300 + M_yyyy*v301 + M_yyyz*v302 + M_yyz*v303 + M_yyzz*v304 &
      + M_yzz*v296 + M_yzzz*v297 + M_zz*v305 + M_zzz*v306 + M_zzzz*v307
    L_xyyyz    = D_xxxxyyyz*v122 + D_xxxyyyyz*v123 + D_xxxyyyz*v112 + D_xxxyyyzz*v124 + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyz*M_x + D_xxyyyzz*M_xz &
      + D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + D_xyyyzz*M_z + &
      M_xyy*v213 + M_xzz*v216 + M_yy*v303 + M_yyy*v302 + M_yyz*v292 + &
      M_yzz*v298 + M_zz*v308 + M_zzz*v309
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    v323       = 0.00833333333333333d0*D_xyyzzzzz
    v328       = 0.0416666666666667d0*D_xyyzzzzz
    v398       = 0.00416666666666667d0*D_xyyzzzzz
    v412       = 0.0208333333333333d0*D_xyyzzzzz
    L_xyy      = D_xxxxxxyy*v179 + D_xxxxxyy*v143 + D_xxxxxyyy*v180 + D_xxxxxyyz*v181 + &
      D_xxxxyy*v122 + D_xxxxyyy*v144 + D_xxxxyyyy*v182 + D_xxxxyyyz* &
      v183 + D_xxxxyyz*v145 + D_xxxxyyzz*v184 + D_xxxyy*v112 + D_xxxyyy &
      *v123 + D_xxxyyyy*v146 + D_xxxyyyyy*v185 + D_xxxyyyyz*v186 + &
      D_xxxyyyz*v147 + D_xxxyyyzz*v187 + D_xxxyyz*v124 + D_xxxyyzz*v148 &
      + D_xxxyyzzz*v188 + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyz*M_xyz + &
      D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z &
      + M_xyy*v217 + M_xyyy*v218 + M_xyyyy*v219 + M_xyyyz*v220 + M_xyyz &
      *v221 + M_xyyzz*v222 + M_xyzz*v214 + M_xyzzz*v215 + M_xzz*v223 + &
      M_xzzz*v224 + M_xzzzz*v225 + M_yy*v310 + M_yyy*v311 + M_yyyy*v312 &
      + M_yyyyy*v313 + M_yyyyz*v314 + M_yyyz*v315 + M_yyyzz*v316 + &
      M_yyz*v317 + M_yyzz*v318 + M_yyzzz*v319 + M_yzz*v305 + M_yzzz* &
      v306 + M_yzzzz*v307 + M_zz*v320 + M_zzz*v321 + M_zzzz*v322 + &
      M_zzzzz*v323
    L_xyyz     = D_xxxxxyyz*v143 + D_xxxxyyyz*v144 + D_xxxxyyz*v122 + D_xxxxyyzz*v145 + &
      D_xxxyyyyz*v146 + D_xxxyyyz*v123 + D_xxxyyyzz*v147 + D_xxxyyz* &
      v112 + D_xxxyyzz*v124 + D_xxxyyzzz*v148 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y + &
      D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_xyy*v221 + M_xyyy* &
      v220 + M_xyyz*v210 + M_xyzz*v216 + M_xzz*v226 + M_xzzz*v227 + &
      M_yy*v317 + M_yyy*v315 + M_yyyy*v314 + M_yyyz*v324 + M_yyz*v296 + &
      M_yyzz*v325 + M_yzz*v308 + M_yzzz*v309 + M_zz*v326 + M_zzz*v327 + &
      M_zzzz*v328
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    v348       = 0.00138888888888889d0*D_xyzzzzzz
    v356       = 0.00833333333333333d0*D_xyzzzzzz
    L_xy       = D_xxxxxxxy*v247 + D_xxxxxxy*v179 + D_xxxxxxyy*v248 + D_xxxxxxyz*v249 + &
      D_xxxxxy*v143 + D_xxxxxyy*v180 + D_xxxxxyyy*v250 + D_xxxxxyyz* &
      v251 + D_xxxxxyz*v181 + D_xxxxxyzz*v252 + D_xxxxy*v122 + D_xxxxyy &
      *v144 + D_xxxxyyy*v182 + D_xxxxyyyy*v253 + D_xxxxyyyz*v254 + &
      D_xxxxyyz*v183 + D_xxxxyyzz*v255 + D_xxxxyz*v145 + D_xxxxyzz*v184 &
      + D_xxxxyzzz*v256 + D_xxxy*v112 + D_xxxyy*v123 + D_xxxyyy*v146 + &
      D_xxxyyyy*v185 + D_xxxyyyyy*v257 + D_xxxyyyyz*v258 + D_xxxyyyz* &
      v186 + D_xxxyyyzz*v259 + D_xxxyyz*v147 + D_xxxyyzz*v187 + &
      D_xxxyyzzz*v260 + D_xxxyz*v124 + D_xxxyzz*v148 + D_xxxyzzz*v188 + &
      D_xxxyzzzz*v261 + D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + &
      D_xxyz*M_xz + D_xy*M_0 + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + &
      M_xyy*v228 + M_xyyy*v229 + M_xyyyy*v230 + M_xyyyyy*v231 + &
      M_xyyyyz*v232 + M_xyyyz*v233 + M_xyyyzz*v234 + M_xyyz*v235 + &
      M_xyyzz*v236 + M_xyyzzz*v237 + M_xyzz*v223 + M_xyzzz*v224 + &
      M_xyzzzz*v225 + M_xzz*v238 + M_xzzz*v239 + M_xzzzz*v240 + &
      M_xzzzzz*v241 + M_yy*v329 + M_yyy*v330 + M_yyyy*v331 + M_yyyyy* &
      v332 + M_yyyyyy*v333 + M_yyyyyz*v334 + M_yyyyz*v335 + M_yyyyzz* &
      v336 + M_yyyz*v337 + M_yyyzz*v338 + M_yyyzzz*v339 + M_yyz*v340 + &
      M_yyzz*v341 + M_yyzzz*v342 + M_yyzzzz*v343 + M_yzz*v320 + M_yzzz* &
      v321 + M_yzzzz*v322 + M_yzzzzz*v323 + M_zz*v344 + M_zzz*v345 + &
      M_zzzz*v346 + M_zzzzz*v347 + M_zzzzzz*v348
    L_xyz      = D_xxxxxxyz*v179 + D_xxxxxyyz*v180 + D_xxxxxyz*v143 + D_xxxxxyzz*v181 + &
      D_xxxxyyyz*v182 + D_xxxxyyz*v144 + D_xxxxyyzz*v183 + D_xxxxyz* &
      v122 + D_xxxxyzz*v145 + D_xxxxyzzz*v184 + D_xxxyyyyz*v185 + &
      D_xxxyyyz*v146 + D_xxxyyyzz*v186 + D_xxxyyz*v123 + D_xxxyyzz*v147 &
      + D_xxxyyzzz*v187 + D_xxxyz*v112 + D_xxxyzz*v124 + D_xxxyzzz*v148 &
      + D_xxxyzzzz*v188 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + &
      D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z &
      + M_xyy*v235 + M_xyyy*v233 + M_xyyyy*v232 + M_xyyyz*v242 + M_xyyz &
      *v214 + M_xyyzz*v243 + M_xyzz*v226 + M_xyzzz*v227 + M_xzz*v244 + &
      M_xzzz*v245 + M_xzzzz*v246 + M_yy*v340 + M_yyy*v337 + M_yyyy*v335 &
      + M_yyyyy*v334 + M_yyyyz*v349 + M_yyyz*v350 + M_yyyzz*v319 + &
      M_yyz*v305 + M_yyzz*v351 + M_yyzzz*v352 + M_yzz*v326 + M_yzzz* &
      v327 + M_yzzzz*v328 + M_zz*v353 + M_zzz*v354 + M_zzzz*v355 + &
      M_zzzzz*v356
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    v404       = 0.000198412698412698d0*D_xzzzzzzz
    v417       = 0.00138888888888889d0*D_xzzzzzzz
    L_x        = D_x*M_0 + D_xx*M_x + D_xxx*v112 + D_xxxx*v122 + D_xxxxx*v143 + D_xxxxxx* &
      v179 + D_xxxxxxx*v247 + D_xxxxxxxx*v357 + D_xxxxxxxy*v358 + &
      D_xxxxxxxz*v359 + D_xxxxxxy*v248 + D_xxxxxxyy*v360 + D_xxxxxxyz* &
      v361 + D_xxxxxxz*v249 + D_xxxxxxzz*v362 + D_xxxxxy*v180 + &
      D_xxxxxyy*v250 + D_xxxxxyyy*v363 + D_xxxxxyyz*v364 + D_xxxxxyz* &
      v251 + D_xxxxxyzz*v365 + D_xxxxxz*v181 + D_xxxxxzz*v252 + &
      D_xxxxxzzz*v366 + D_xxxxy*v144 + D_xxxxyy*v182 + D_xxxxyyy*v253 + &
      D_xxxxyyyy*v367 + D_xxxxyyyz*v368 + D_xxxxyyz*v254 + D_xxxxyyzz* &
      v369 + D_xxxxyz*v183 + D_xxxxyzz*v255 + D_xxxxyzzz*v370 + D_xxxxz &
      *v145 + D_xxxxzz*v184 + D_xxxxzzz*v256 + D_xxxxzzzz*v371 + D_xxxy &
      *v123 + D_xxxyy*v146 + D_xxxyyy*v185 + D_xxxyyyy*v257 + &
      D_xxxyyyyy*v372 + D_xxxyyyyz*v373 + D_xxxyyyz*v258 + D_xxxyyyzz* &
      v374 + D_xxxyyz*v186 + D_xxxyyzz*v259 + D_xxxyyzzz*v375 + D_xxxyz &
      *v147 + D_xxxyzz*v187 + D_xxxyzzz*v260 + D_xxxyzzzz*v376 + D_xxxz &
      *v124 + D_xxxzz*v148 + D_xxxzzz*v188 + D_xxxzzzz*v261 + &
      D_xxxzzzzz*v377 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy* &
      M_y + D_xyz*M_yz + D_xz*M_z + M_xyy*v262 + M_xyyy*v263 + M_xyyyy* &
      v264 + M_xyyyyy*v265 + M_xyyyyyy*v266 + M_xyyyyyz*v267 + M_xyyyyz &
      *v268 + M_xyyyyzz*v269 + M_xyyyz*v270 + M_xyyyzz*v271 + M_xyyyzzz &
      *v272 + M_xyyz*v273 + M_xyyzz*v274 + M_xyyzzz*v275 + M_xyyzzzz* &
      v276 + M_xyzz*v238 + M_xyzzz*v239 + M_xyzzzz*v240 + M_xyzzzzz* &
      v241 + M_xzz*v277 + M_xzzz*v278 + M_xzzzz*v279 + M_xzzzzz*v280 + &
      M_xzzzzzz*v281 + M_yy*v378 + M_yyy*v379 + M_yyyy*v380 + M_yyyyy* &
      v381 + M_yyyyyy*v382 + M_yyyyyyy*v383 + M_yyyyyyz*v384 + M_yyyyyz &
      *v385 + M_yyyyyzz*v386 + M_yyyyz*v387 + M_yyyyzz*v388 + M_yyyyzzz &
      *v389 + M_yyyz*v390 + M_yyyzz*v391 + M_yyyzzz*v392 + M_yyyzzzz* &
      v393 + M_yyz*v394 + M_yyzz*v395 + M_yyzzz*v396 + M_yyzzzz*v397 + &
      M_yyzzzzz*v398 + M_yzz*v344 + M_yzzz*v345 + M_yzzzz*v346 + &
      M_yzzzzz*v347 + M_yzzzzzz*v348 + M_zz*v399 + M_zzz*v400 + M_zzzz* &
      v401 + M_zzzzz*v402 + M_zzzzzz*v403 + M_zzzzzzz*v404
    L_xz       = D_xxxxxxxz*v247 + D_xxxxxxyz*v248 + D_xxxxxxz*v179 + D_xxxxxxzz*v249 + &
      D_xxxxxyyz*v250 + D_xxxxxyz*v180 + D_xxxxxyzz*v251 + D_xxxxxz* &
      v143 + D_xxxxxzz*v181 + D_xxxxxzzz*v252 + D_xxxxyyyz*v253 + &
      D_xxxxyyz*v182 + D_xxxxyyzz*v254 + D_xxxxyz*v144 + D_xxxxyzz*v183 &
      + D_xxxxyzzz*v255 + D_xxxxz*v122 + D_xxxxzz*v145 + D_xxxxzzz*v184 &
      + D_xxxxzzzz*v256 + D_xxxyyyyz*v257 + D_xxxyyyz*v185 + D_xxxyyyzz &
      *v258 + D_xxxyyz*v146 + D_xxxyyzz*v186 + D_xxxyyzzz*v259 + &
      D_xxxyz*v123 + D_xxxyzz*v147 + D_xxxyzzz*v187 + D_xxxyzzzz*v260 + &
      D_xxxz*v112 + D_xxxzz*v124 + D_xxxzzz*v148 + D_xxxzzzz*v188 + &
      D_xxxzzzzz*v261 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + &
      D_xxzz*M_xz + D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + &
      M_xyy*v273 + M_xyyy*v270 + M_xyyyy*v268 + M_xyyyyy*v267 + &
      M_xyyyyz*v282 + M_xyyyz*v283 + M_xyyyzz*v237 + M_xyyz*v223 + &
      M_xyyzz*v284 + M_xyyzzz*v285 + M_xyzz*v244 + M_xyzzz*v245 + &
      M_xyzzzz*v246 + M_xzz*v286 + M_xzzz*v287 + M_xzzzz*v288 + &
      M_xzzzzz*v289 + M_yy*v394 + M_yyy*v390 + M_yyyy*v387 + M_yyyyy* &
      v385 + M_yyyyyy*v384 + M_yyyyyz*v405 + M_yyyyz*v406 + M_yyyyzz* &
      v407 + M_yyyz*v408 + M_yyyzz*v342 + M_yyyzzz*v409 + M_yyz*v320 + &
      M_yyzz*v410 + M_yyzzz*v411 + M_yyzzzz*v412 + M_yzz*v353 + M_yzzz* &
      v354 + M_yzzzz*v355 + M_yzzzzz*v356 + M_zz*v413 + M_zzz*v414 + &
      M_zzzz*v415 + M_zzzzz*v416 + M_zzzzzz*v417
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v208 - (1260.0d0*v131 + v68*v99))
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = v133*v290
    L_yyyyyyy  = D_xyyyyyyy*M_x + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyz*M_z
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    v419       = 0.5d0*D_yyyyyyzz
    L_yyyyyy   = D_xxyyyyyy*v112 + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*v418 + D_yyyyyyyz*M_yz &
      + D_yyyyyyz*M_z + M_zz*v419
    L_yyyyyyz  = D_xyyyyyyz*M_x + D_yyyyyyyz*M_y + D_yyyyyyz*M_0 + D_yyyyyyzz*M_z
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    v423       = 0.166666666666667d0*D_yyyyyzzz
    v424       = 0.5d0*D_yyyyyzzz
    L_yyyyy    = D_xxxyyyyy*v122 + D_xxyyyyy*v112 + D_xxyyyyyy*v123 + D_xxyyyyyz*v124 + &
      D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyz*M_xyz + D_xyyyyyz*M_xz &
      + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*v418 + D_yyyyyyyy*v420 + &
      D_yyyyyyyz*v421 + D_yyyyyyz*M_yz + D_yyyyyz*M_z + M_xyy*v291 + &
      M_xzz*v292 + M_yzz*v419 + M_zz*v422 + M_zzz*v423
    L_yyyyyz   = D_xxyyyyyz*v112 + D_xyyyyyyz*M_xy + D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + &
      D_yyyyyyyz*v418 + D_yyyyyyz*M_y + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 &
      + D_yyyyyzz*M_z + M_zz*v424
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    v430       = 0.0416666666666667d0*D_yyyyzzzz
    v432       = 0.166666666666667d0*D_yyyyzzzz
    L_yyyy     = D_xxxxyyyy*v143 + D_xxxyyyy*v122 + D_xxxyyyyy*v144 + D_xxxyyyyz*v145 + &
      D_xxyyyy*v112 + D_xxyyyyy*v123 + D_xxyyyyyy*v146 + D_xxyyyyyz* &
      v147 + D_xxyyyyz*v124 + D_xxyyyyzz*v148 + D_xyyyy*M_x + D_xyyyyy* &
      M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyy*M_y &
      + D_yyyyyy*v418 + D_yyyyyyy*v420 + D_yyyyyyyy*v425 + D_yyyyyyyz* &
      v426 + D_yyyyyyz*v421 + D_yyyyyyzz*v427 + D_yyyyyz*M_yz + D_yyyyz &
      *M_z + M_xyy*v293 + M_xyyy*v294 + M_xyyz*v295 + M_xyzz*v292 + &
      M_xzz*v296 + M_xzzz*v297 + M_yzz*v422 + M_yzzz*v423 + M_zz*v428 + &
      M_zzz*v429 + M_zzzz*v430
    L_yyyyz    = D_xxxyyyyz*v122 + D_xxyyyyyz*v123 + D_xxyyyyz*v112 + D_xxyyyyzz*v124 + &
      D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyz*M_x + D_xyyyyzz*M_xz &
      + D_yyyyyyyz*v420 + D_yyyyyyz*v418 + D_yyyyyyzz*v421 + D_yyyyyz* &
      M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + D_yyyyzz*M_z + M_xyy*v295 + &
      M_xzz*v298 + M_yzz*v424 + M_zz*v431 + M_zzz*v432
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    v440       = 0.00833333333333333d0*D_yyyzzzzz
    v443       = 0.0416666666666667d0*D_yyyzzzzz
    L_yyy      = D_xxxxxyyy*v179 + D_xxxxyyy*v143 + D_xxxxyyyy*v180 + D_xxxxyyyz*v181 + &
      D_xxxyyy*v122 + D_xxxyyyy*v144 + D_xxxyyyyy*v182 + D_xxxyyyyz* &
      v183 + D_xxxyyyz*v145 + D_xxxyyyzz*v184 + D_xxyyy*v112 + D_xxyyyy &
      *v123 + D_xxyyyyy*v146 + D_xxyyyyyy*v185 + D_xxyyyyyz*v186 + &
      D_xxyyyyz*v147 + D_xxyyyyzz*v187 + D_xxyyyz*v124 + D_xxyyyzz*v148 &
      + D_xxyyyzzz*v188 + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyz*M_xyz + &
      D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*v418 + D_yyyyyy* &
      v420 + D_yyyyyyy*v425 + D_yyyyyyyy*v433 + D_yyyyyyyz*v434 + &
      D_yyyyyyz*v426 + D_yyyyyyzz*v435 + D_yyyyyz*v421 + D_yyyyyzz*v427 &
      + D_yyyyyzzz*v436 + D_yyyyz*M_yz + D_yyyz*M_z + M_xyy*v299 + &
      M_xyyy*v300 + M_xyyyy*v301 + M_xyyyz*v302 + M_xyyz*v303 + M_xyyzz &
      *v304 + M_xyzz*v296 + M_xyzzz*v297 + M_xzz*v305 + M_xzzz*v306 + &
      M_xzzzz*v307 + M_yzz*v428 + M_yzzz*v429 + M_yzzzz*v430 + M_zz* &
      v437 + M_zzz*v438 + M_zzzz*v439 + M_zzzzz*v440
    L_yyyz     = D_xxxxyyyz*v143 + D_xxxyyyyz*v144 + D_xxxyyyz*v122 + D_xxxyyyzz*v145 + &
      D_xxyyyyyz*v146 + D_xxyyyyz*v123 + D_xxyyyyzz*v147 + D_xxyyyz* &
      v112 + D_xxyyyzz*v124 + D_xxyyyzzz*v148 + D_xyyyyz*M_xy + &
      D_xyyyyzz*M_xyz + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyyyz*v425 + &
      D_yyyyyyz*v420 + D_yyyyyyzz*v426 + D_yyyyyz*v418 + D_yyyyyzz*v421 &
      + D_yyyyyzzz*v427 + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + &
      D_yyyzz*M_z + M_xyy*v303 + M_xyyy*v302 + M_xyyz*v292 + M_xyzz* &
      v298 + M_xzz*v308 + M_xzzz*v309 + M_yzz*v431 + M_yzzz*v432 + M_zz &
      *v441 + M_zzz*v442 + M_zzzz*v443
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    v453       = 0.00138888888888889d0*D_yyzzzzzz
    v457       = 0.00833333333333333d0*D_yyzzzzzz
    L_yy       = D_xxxxxxyy*v247 + D_xxxxxyy*v179 + D_xxxxxyyy*v248 + D_xxxxxyyz*v249 + &
      D_xxxxyy*v143 + D_xxxxyyy*v180 + D_xxxxyyyy*v250 + D_xxxxyyyz* &
      v251 + D_xxxxyyz*v181 + D_xxxxyyzz*v252 + D_xxxyy*v122 + D_xxxyyy &
      *v144 + D_xxxyyyy*v182 + D_xxxyyyyy*v253 + D_xxxyyyyz*v254 + &
      D_xxxyyyz*v183 + D_xxxyyyzz*v255 + D_xxxyyz*v145 + D_xxxyyzz*v184 &
      + D_xxxyyzzz*v256 + D_xxyy*v112 + D_xxyyy*v123 + D_xxyyyy*v146 + &
      D_xxyyyyy*v185 + D_xxyyyyyy*v257 + D_xxyyyyyz*v258 + D_xxyyyyz* &
      v186 + D_xxyyyyzz*v259 + D_xxyyyz*v147 + D_xxyyyzz*v187 + &
      D_xxyyyzzz*v260 + D_xxyyz*v124 + D_xxyyzz*v148 + D_xxyyzzz*v188 + &
      D_xxyyzzzz*v261 + D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + &
      D_xyyz*M_xz + D_yy*M_0 + D_yyy*M_y + D_yyyy*v418 + D_yyyyy*v420 + &
      D_yyyyyy*v425 + D_yyyyyyy*v433 + D_yyyyyyyy*v444 + D_yyyyyyyz* &
      v445 + D_yyyyyyz*v434 + D_yyyyyyzz*v446 + D_yyyyyz*v426 + &
      D_yyyyyzz*v435 + D_yyyyyzzz*v447 + D_yyyyz*v421 + D_yyyyzz*v427 + &
      D_yyyyzzz*v436 + D_yyyyzzzz*v448 + D_yyyz*M_yz + D_yyz*M_z + &
      M_xyy*v310 + M_xyyy*v311 + M_xyyyy*v312 + M_xyyyyy*v313 + &
      M_xyyyyz*v314 + M_xyyyz*v315 + M_xyyyzz*v316 + M_xyyz*v317 + &
      M_xyyzz*v318 + M_xyyzzz*v319 + M_xyzz*v305 + M_xyzzz*v306 + &
      M_xyzzzz*v307 + M_xzz*v320 + M_xzzz*v321 + M_xzzzz*v322 + &
      M_xzzzzz*v323 + M_yzz*v437 + M_yzzz*v438 + M_yzzzz*v439 + &
      M_yzzzzz*v440 + M_zz*v449 + M_zzz*v450 + M_zzzz*v451 + M_zzzzz* &
      v452 + M_zzzzzz*v453
    L_yyz      = D_xxxxxyyz*v179 + D_xxxxyyyz*v180 + D_xxxxyyz*v143 + D_xxxxyyzz*v181 + &
      D_xxxyyyyz*v182 + D_xxxyyyz*v144 + D_xxxyyyzz*v183 + D_xxxyyz* &
      v122 + D_xxxyyzz*v145 + D_xxxyyzzz*v184 + D_xxyyyyyz*v185 + &
      D_xxyyyyz*v146 + D_xxyyyyzz*v186 + D_xxyyyz*v123 + D_xxyyyzz*v147 &
      + D_xxyyyzzz*v187 + D_xxyyz*v112 + D_xxyyzz*v124 + D_xxyyzzz*v148 &
      + D_xxyyzzzz*v188 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + &
      D_xyyzz*M_xz + D_yyyyyyyz*v433 + D_yyyyyyz*v425 + D_yyyyyyzz*v434 &
      + D_yyyyyz*v420 + D_yyyyyzz*v426 + D_yyyyyzzz*v435 + D_yyyyz*v418 &
      + D_yyyyzz*v421 + D_yyyyzzz*v427 + D_yyyyzzzz*v436 + D_yyyz*M_y + &
      D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_xyy*v317 + M_xyyy*v315 &
      + M_xyyyy*v314 + M_xyyyz*v324 + M_xyyz*v296 + M_xyyzz*v325 + &
      M_xyzz*v308 + M_xyzzz*v309 + M_xzz*v326 + M_xzzz*v327 + M_xzzzz* &
      v328 + M_yzz*v441 + M_yzzz*v442 + M_yzzzz*v443 + M_zz*v454 + &
      M_zzz*v455 + M_zzzz*v456 + M_zzzzz*v457
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    v469       = 0.000198412698412698d0*D_yzzzzzzz
    v474       = 0.00138888888888889d0*D_yzzzzzzz
    L_y        = D_xxxxxxxy*v357 + D_xxxxxxy*v247 + D_xxxxxxyy*v358 + D_xxxxxxyz*v359 + &
      D_xxxxxy*v179 + D_xxxxxyy*v248 + D_xxxxxyyy*v360 + D_xxxxxyyz* &
      v361 + D_xxxxxyz*v249 + D_xxxxxyzz*v362 + D_xxxxy*v143 + D_xxxxyy &
      *v180 + D_xxxxyyy*v250 + D_xxxxyyyy*v363 + D_xxxxyyyz*v364 + &
      D_xxxxyyz*v251 + D_xxxxyyzz*v365 + D_xxxxyz*v181 + D_xxxxyzz*v252 &
      + D_xxxxyzzz*v366 + D_xxxy*v122 + D_xxxyy*v144 + D_xxxyyy*v182 + &
      D_xxxyyyy*v253 + D_xxxyyyyy*v367 + D_xxxyyyyz*v368 + D_xxxyyyz* &
      v254 + D_xxxyyyzz*v369 + D_xxxyyz*v183 + D_xxxyyzz*v255 + &
      D_xxxyyzzz*v370 + D_xxxyz*v145 + D_xxxyzz*v184 + D_xxxyzzz*v256 + &
      D_xxxyzzzz*v371 + D_xxy*v112 + D_xxyy*v123 + D_xxyyy*v146 + &
      D_xxyyyy*v185 + D_xxyyyyy*v257 + D_xxyyyyyy*v372 + D_xxyyyyyz* &
      v373 + D_xxyyyyz*v258 + D_xxyyyyzz*v374 + D_xxyyyz*v186 + &
      D_xxyyyzz*v259 + D_xxyyyzzz*v375 + D_xxyyz*v147 + D_xxyyzz*v187 + &
      D_xxyyzzz*v260 + D_xxyyzzzz*v376 + D_xxyz*v124 + D_xxyzz*v148 + &
      D_xxyzzz*v188 + D_xxyzzzz*v261 + D_xxyzzzzz*v377 + D_xy*M_x + &
      D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyy*v418 + D_yyyy*v420 + D_yyyyy*v425 + D_yyyyyy*v433 + &
      D_yyyyyyy*v444 + D_yyyyyyyy*v458 + D_yyyyyyyz*v459 + D_yyyyyyz* &
      v445 + D_yyyyyyzz*v460 + D_yyyyyz*v434 + D_yyyyyzz*v446 + &
      D_yyyyyzzz*v461 + D_yyyyz*v426 + D_yyyyzz*v435 + D_yyyyzzz*v447 + &
      D_yyyyzzzz*v462 + D_yyyz*v421 + D_yyyzz*v427 + D_yyyzzz*v436 + &
      D_yyyzzzz*v448 + D_yyyzzzzz*v463 + D_yyz*M_yz + D_yz*M_z + M_xyy* &
      v329 + M_xyyy*v330 + M_xyyyy*v331 + M_xyyyyy*v332 + M_xyyyyyy* &
      v333 + M_xyyyyyz*v334 + M_xyyyyz*v335 + M_xyyyyzz*v336 + M_xyyyz* &
      v337 + M_xyyyzz*v338 + M_xyyyzzz*v339 + M_xyyz*v340 + M_xyyzz* &
      v341 + M_xyyzzz*v342 + M_xyyzzzz*v343 + M_xyzz*v320 + M_xyzzz* &
      v321 + M_xyzzzz*v322 + M_xyzzzzz*v323 + M_xzz*v344 + M_xzzz*v345 &
      + M_xzzzz*v346 + M_xzzzzz*v347 + M_xzzzzzz*v348 + M_yzz*v449 + &
      M_yzzz*v450 + M_yzzzz*v451 + M_yzzzzz*v452 + M_yzzzzzz*v453 + &
      M_zz*v464 + M_zzz*v465 + M_zzzz*v466 + M_zzzzz*v467 + M_zzzzzz* &
      v468 + M_zzzzzzz*v469
    L_yz       = D_xxxxxxyz*v247 + D_xxxxxyyz*v248 + D_xxxxxyz*v179 + D_xxxxxyzz*v249 + &
      D_xxxxyyyz*v250 + D_xxxxyyz*v180 + D_xxxxyyzz*v251 + D_xxxxyz* &
      v143 + D_xxxxyzz*v181 + D_xxxxyzzz*v252 + D_xxxyyyyz*v253 + &
      D_xxxyyyz*v182 + D_xxxyyyzz*v254 + D_xxxyyz*v144 + D_xxxyyzz*v183 &
      + D_xxxyyzzz*v255 + D_xxxyz*v122 + D_xxxyzz*v145 + D_xxxyzzz*v184 &
      + D_xxxyzzzz*v256 + D_xxyyyyyz*v257 + D_xxyyyyz*v185 + D_xxyyyyzz &
      *v258 + D_xxyyyz*v146 + D_xxyyyzz*v186 + D_xxyyyzzz*v259 + &
      D_xxyyz*v123 + D_xxyyzz*v147 + D_xxyyzzz*v187 + D_xxyyzzzz*v260 + &
      D_xxyz*v112 + D_xxyzz*v124 + D_xxyzzz*v148 + D_xxyzzzz*v188 + &
      D_xxyzzzzz*v261 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + &
      D_xyzz*M_xz + D_yyyyyyyz*v444 + D_yyyyyyz*v433 + D_yyyyyyzz*v445 &
      + D_yyyyyz*v425 + D_yyyyyzz*v434 + D_yyyyyzzz*v446 + D_yyyyz*v420 &
      + D_yyyyzz*v426 + D_yyyyzzz*v435 + D_yyyyzzzz*v447 + D_yyyz*v418 &
      + D_yyyzz*v421 + D_yyyzzz*v427 + D_yyyzzzz*v436 + D_yyyzzzzz*v448 &
      + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + M_xyy*v340 + &
      M_xyyy*v337 + M_xyyyy*v335 + M_xyyyyy*v334 + M_xyyyyz*v349 + &
      M_xyyyz*v350 + M_xyyyzz*v319 + M_xyyz*v305 + M_xyyzz*v351 + &
      M_xyyzzz*v352 + M_xyzz*v326 + M_xyzzz*v327 + M_xyzzzz*v328 + &
      M_xzz*v353 + M_xzzz*v354 + M_xzzzz*v355 + M_xzzzzz*v356 + M_yzz* &
      v454 + M_yzzz*v455 + M_yzzzz*v456 + M_yzzzzz*v457 + M_zz*v470 + &
      M_zzz*v471 + M_zzzz*v472 + M_zzzzz*v473 + M_zzzzzz*v474
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_0        = 2.48015873015873d-5*(D_xxxxxxxx*M_xxxxxxxx + D_yyyyyyyy*M_yyyyyyyy + &
      D_zzzzzzzz*M_zzzzzzzz + 8.0d0*(D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxz &
      *M_xxxxxxxz + D_yyyyyyyz*M_yyyyyyyz) + 70.0d0*(D_xxxxyyyy* &
      M_xxxxyyyy + D_xxxxzzzz*M_xxxxzzzz + D_yyyyzzzz*M_yyyyzzzz) + &
      420.0d0*(D_xxxxyyzz*M_xxxxyyzz + D_xxyyyyzz*M_xxyyyyzz + &
      D_xxyyzzzz*M_xxyyzzzz) + 560.0d0*(D_xxxyyyzz*M_xxxyyyzz + &
      D_xxxyyzzz*M_xxxyyzzz + D_xxyyyzzz*M_xxyyyzzz) + 168.0d0*( &
      D_xxxxxyyz*M_xxxxxyyz + D_xxxxxyzz*M_xxxxxyzz + D_xxyyyyyz* &
      M_xxyyyyyz + D_xxyzzzzz*M_xxyzzzzz) + 280.0d0*(D_xxxxyyyz* &
      M_xxxxyyyz + D_xxxxyzzz*M_xxxxyzzz + D_xxxyyyyz*M_xxxyyyyz + &
      D_xxxyzzzz*M_xxxyzzzz) + 28.0d0*(D_xxxxxxyy*M_xxxxxxyy + &
      D_xxxxxxzz*M_xxxxxxzz + D_xxyyyyyy*M_xxyyyyyy + D_xxzzzzzz* &
      M_xxzzzzzz + D_yyyyyyzz*M_yyyyyyzz + D_yyzzzzzz*M_yyzzzzzz) + &
      56.0d0*(D_xxxxxxyz*M_xxxxxxyz + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxzzz*M_xxxxxzzz + D_xxxyyyyy*M_xxxyyyyy + D_xxxzzzzz* &
      M_xxxzzzzz + D_yyyyyzzz*M_yyyyyzzz + D_yyyzzzzz*M_yyyzzzzz)) + &
      D_0*M_0 + D_x*M_x + D_xx*v112 + D_xxx*v122 + D_xxxx*v143 + &
      D_xxxxx*v179 + D_xxxxxx*v247 + D_xxxxxxx*v357 + D_xxxxxxy*v358 + &
      D_xxxxxxz*v359 + D_xxxxxy*v248 + D_xxxxxyy*v360 + D_xxxxxyz*v361 &
      + D_xxxxxz*v249 + D_xxxxxzz*v362 + D_xxxxy*v180 + D_xxxxyy*v250 + &
      D_xxxxyyy*v363 + D_xxxxyyz*v364 + D_xxxxyz*v251 + D_xxxxyzz*v365 &
      + D_xxxxz*v181 + D_xxxxzz*v252 + D_xxxxzzz*v366 + D_xxxy*v144 + &
      D_xxxyy*v182 + D_xxxyyy*v253 + D_xxxyyyy*v367 + D_xxxyyyz*v368 + &
      D_xxxyyz*v254 + D_xxxyyzz*v369 + D_xxxyz*v183 + D_xxxyzz*v255 + &
      D_xxxyzzz*v370 + D_xxxz*v145 + D_xxxzz*v184 + D_xxxzzz*v256 + &
      D_xxxzzzz*v371 + D_xxy*v123 + D_xxyy*v146 + D_xxyyy*v185 + &
      D_xxyyyy*v257 + D_xxyyyyy*v372 + D_xxyyyyz*v373 + D_xxyyyz*v258 + &
      D_xxyyyzz*v374 + D_xxyyz*v186 + D_xxyyzz*v259 + D_xxyyzzz*v375 + &
      D_xxyz*v147 + D_xxyzz*v187 + D_xxyzzz*v260 + D_xxyzzzz*v376 + &
      D_xxz*v124 + D_xxzz*v148 + D_xxzzz*v188 + D_xxzzzz*v261 + &
      D_xxzzzzz*v377 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + &
      D_yy*v418 + D_yyy*v420 + D_yyyy*v425 + D_yyyyy*v433 + D_yyyyyy* &
      v444 + D_yyyyyyy*v458 + D_yyyyyyz*v459 + D_yyyyyz*v445 + &
      D_yyyyyzz*v460 + D_yyyyz*v434 + D_yyyyzz*v446 + D_yyyyzzz*v461 + &
      D_yyyz*v426 + D_yyyzz*v435 + D_yyyzzz*v447 + D_yyyzzzz*v462 + &
      D_yyz*v421 + D_yyzz*v427 + D_yyzzz*v436 + D_yyzzzz*v448 + &
      D_yyzzzzz*v463 + D_yz*M_yz + D_z*M_z + D_zz*v475 + D_zzz*v476 + &
      D_zzzz*v477 + D_zzzzz*v478 + D_zzzzzz*v479 + D_zzzzzzz*v480 + &
      M_xyy*v378 + M_xyyy*v379 + M_xyyyy*v380 + M_xyyyyy*v381 + &
      M_xyyyyyy*v382 + M_xyyyyyyy*v383 + M_xyyyyyyz*v384 + M_xyyyyyz* &
      v385 + M_xyyyyyzz*v386 + M_xyyyyz*v387 + M_xyyyyzz*v388 + &
      M_xyyyyzzz*v389 + M_xyyyz*v390 + M_xyyyzz*v391 + M_xyyyzzz*v392 + &
      M_xyyyzzzz*v393 + M_xyyz*v394 + M_xyyzz*v395 + M_xyyzzz*v396 + &
      M_xyyzzzz*v397 + M_xyyzzzzz*v398 + M_xyzz*v344 + M_xyzzz*v345 + &
      M_xyzzzz*v346 + M_xyzzzzz*v347 + M_xyzzzzzz*v348 + M_xzz*v399 + &
      M_xzzz*v400 + M_xzzzz*v401 + M_xzzzzz*v402 + M_xzzzzzz*v403 + &
      M_xzzzzzzz*v404 + M_yzz*v464 + M_yzzz*v465 + M_yzzzz*v466 + &
      M_yzzzzz*v467 + M_yzzzzzz*v468 + M_yzzzzzzz*v469
    L_z        = D_xxxxxxxz*v357 + D_xxxxxxyz*v358 + D_xxxxxxz*v247 + D_xxxxxxzz*v359 + &
      D_xxxxxyyz*v360 + D_xxxxxyz*v248 + D_xxxxxyzz*v361 + D_xxxxxz* &
      v179 + D_xxxxxzz*v249 + D_xxxxxzzz*v362 + D_xxxxyyyz*v363 + &
      D_xxxxyyz*v250 + D_xxxxyyzz*v364 + D_xxxxyz*v180 + D_xxxxyzz*v251 &
      + D_xxxxyzzz*v365 + D_xxxxz*v143 + D_xxxxzz*v181 + D_xxxxzzz*v252 &
      + D_xxxxzzzz*v366 + D_xxxyyyyz*v367 + D_xxxyyyz*v253 + D_xxxyyyzz &
      *v368 + D_xxxyyz*v182 + D_xxxyyzz*v254 + D_xxxyyzzz*v369 + &
      D_xxxyz*v144 + D_xxxyzz*v183 + D_xxxyzzz*v255 + D_xxxyzzzz*v370 + &
      D_xxxz*v122 + D_xxxzz*v145 + D_xxxzzz*v184 + D_xxxzzzz*v256 + &
      D_xxxzzzzz*v371 + D_xxyyyyyz*v372 + D_xxyyyyz*v257 + D_xxyyyyzz* &
      v373 + D_xxyyyz*v185 + D_xxyyyzz*v258 + D_xxyyyzzz*v374 + D_xxyyz &
      *v146 + D_xxyyzz*v186 + D_xxyyzzz*v259 + D_xxyyzzzz*v375 + D_xxyz &
      *v123 + D_xxyzz*v147 + D_xxyzzz*v187 + D_xxyzzzz*v260 + &
      D_xxyzzzzz*v376 + D_xxz*v112 + D_xxzz*v124 + D_xxzzz*v148 + &
      D_xxzzzz*v188 + D_xxzzzzz*v261 + D_xxzzzzzz*v377 + D_xyz*M_xy + &
      D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyyyyz*v458 + &
      D_yyyyyyz*v444 + D_yyyyyyzz*v459 + D_yyyyyz*v433 + D_yyyyyzz*v445 &
      + D_yyyyyzzz*v460 + D_yyyyz*v425 + D_yyyyzz*v434 + D_yyyyzzz*v446 &
      + D_yyyyzzzz*v461 + D_yyyz*v420 + D_yyyzz*v426 + D_yyyzzz*v435 + &
      D_yyyzzzz*v447 + D_yyyzzzzz*v462 + D_yyz*v418 + D_yyzz*v421 + &
      D_yyzzz*v427 + D_yyzzzz*v436 + D_yyzzzzz*v448 + D_yyzzzzzz*v463 + &
      D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v475 + D_zzzz* &
      v476 + D_zzzzz*v477 + D_zzzzzz*v478 + D_zzzzzzz*v479 + D_zzzzzzzz &
      *v480 + M_xyy*v394 + M_xyyy*v390 + M_xyyyy*v387 + M_xyyyyy*v385 + &
      M_xyyyyyy*v384 + M_xyyyyyz*v405 + M_xyyyyz*v406 + M_xyyyyzz*v407 &
      + M_xyyyz*v408 + M_xyyyzz*v342 + M_xyyyzzz*v409 + M_xyyz*v320 + &
      M_xyyzz*v410 + M_xyyzzz*v411 + M_xyyzzzz*v412 + M_xyzz*v353 + &
      M_xyzzz*v354 + M_xyzzzz*v355 + M_xyzzzzz*v356 + M_xzz*v413 + &
      M_xzzz*v414 + M_xzzzz*v415 + M_xzzzzz*v416 + M_xzzzzzz*v417 + &
      M_yzz*v470 + M_yzzz*v471 + M_yzzzz*v472 + M_yzzzzz*v473 + &
      M_yzzzzzz*v474
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  M_y                 
#undef  L_y                 
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
#undef  M_xxy               
#undef  L_xxy               
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
#undef  M_xxxxx             
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  L_xxyyy             
#undef  M_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  M_xyyyy             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  L_yyyyy             
#undef  M_yyyyy             
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
#undef  L_xxyyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  M_xyyyyy            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  M_yyyyyy            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  M_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  M_xxxxxxz           
#undef  L_xxxxxyy           
#undef  M_xxxxxyy           
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
#undef  L_xxyyyyz           
#undef  M_xxyyyyz           
#undef  M_xyyyyyy           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  M_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_yyyyyyz           
#undef  M_xxxxxxxx          
#undef  L_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  L_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  L_xxxxxxyz          
#undef  M_xxxxxyyy          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  L_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  L_xxxxyyyz          
#undef  M_xxxyyyyy          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  M_xxxyyyyz          
#undef  M_xxyyyyyy          
#undef  L_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
#undef  L_yyyyyyyz          
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
    
! OPS  5217*ADD + 4679*MUL + 196*NEG + 1480*SUB = 11572  (23236 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v1000, v1001, v1002, v1003, v1004, v1005, v1006, v1007,&
                v1008, v1009, v101, v1010, v1011, v1012, v1013, v1014, v1015,&
                v1016, v1017, v1018, v1019, v102, v1020, v1021, v1022, v1023,&
                v1024, v1025, v1026, v1027, v1028, v1029, v103, v1030, v1031,&
                v1032, v1033, v1034, v1035, v1036, v1037, v1038, v1039, v104,&
                v1040, v1041, v1042, v1043, v1044, v1045, v1046, v1047, v1048,&
                v1049, v105, v1050, v1051, v1052, v1053, v1054, v1055, v1056,&
                v1057, v1058, v1059, v106, v1060, v1061, v1062, v1063, v1064,&
                v1065, v1066, v1067, v1068, v1069, v107, v1070, v1071, v1072,&
                v1073, v1074, v1075, v1076, v1077, v1078, v1079, v108, v1080,&
                v1081, v1082, v1083, v1084, v1085, v1086, v1087, v1088, v1089,&
                v109, v1090, v1091, v1092, v1093, v1094, v1095, v1096, v1097,&
                v1098, v1099, v11, v110, v1100, v1101, v1102, v1103, v1104,&
                v1105, v1106, v1107, v1108, v1109, v111, v1110, v1111, v1112,&
                v1113, v1114, v1115, v1116, v1117, v1118, v1119, v112, v1120,&
                v1121, v1122, v1123, v1124, v1125, v1126, v1127, v1128, v1129,&
                v113, v1130, v1131, v1132, v1133, v1134, v1135, v1136, v1137,&
                v1138, v1139, v114, v1140, v1141, v1142, v1143, v1144, v1145,&
                v1146, v1147, v1148, v1149, v115, v1150, v1151, v1152, v1153,&
                v1154, v1155, v1156, v1157, v1158, v1159, v116, v1160, v1161,&
                v1162, v1163, v1164, v1165, v1166, v1167, v1168, v1169, v117,&
                v1170, v1171, v1172, v1173, v1174, v1175, v1176, v1177, v1178,&
                v1179, v118, v1180, v1181, v1182, v1183, v1184, v1185, v1186,&
                v1187, v1188, v1189, v119, v1190, v1191, v1192, v1193, v1194,&
                v1195, v1196, v1197, v1198, v1199, v12, v120, v1200, v1201,&
                v1202, v1203, v1204, v1205, v1206, v1207, v1208, v1209, v121,&
                v1210, v1211, v1212, v1213, v1214, v1215, v1216, v1217, v1218,&
                v1219, v122, v1220, v1221, v1222, v1223, v1224, v1225, v1226,&
                v1227, v1228, v1229, v123, v1230, v1231, v1232, v1233, v1234,&
                v1235, v1236, v1237, v1238, v1239, v124, v1240, v1241, v1242,&
                v1243, v1244, v1245, v1246, v1247, v1248, v1249, v125, v1250,&
                v1251, v1252, v1253, v1254, v1255, v1256, v1257, v1258, v1259,&
                v126, v1260, v1261, v1262, v1263, v1264, v1265, v1266, v1267,&
                v1268, v1269, v127, v1270, v1271, v1272, v1273, v1274, v1275,&
                v1276, v1277, v1278, v1279, v128, v1280, v1281, v1282, v1283,&
                v1284, v1285, v1286, v1287, v1288, v1289, v129, v1290, v1291,&
                v1292, v1293, v1294, v1295, v1296, v1297, v1298, v1299, v13,&
                v130, v1300, v1301, v1302, v1303, v1304, v1305, v1306, v1307,&
                v1308, v1309, v131, v1310, v1311, v1312, v1313, v1314, v1315,&
                v1316, v1317, v1318, v1319, v132, v1320, v1321, v1322, v1323,&
                v1324, v1325, v1326, v1327, v1328, v1329, v133, v1330, v1331,&
                v1332, v1333, v1334, v1335, v1336, v1337, v1338, v1339, v134,&
                v1340, v1341, v1342, v1343, v1344, v1345, v1346, v1347, v1348,&
                v1349, v135, v1350, v1351, v1352, v1353, v1354, v1355, v1356,&
                v1357, v1358, v1359, v136, v1360, v1361, v1362, v1363, v1364,&
                v1365, v1366, v1367, v1368, v1369, v137, v1370, v1371, v1372,&
                v1373, v1374, v1375, v1376, v1377, v1378, v1379, v138, v1380,&
                v1381, v1382, v1383, v1384, v1385, v1386, v1387, v1388, v1389,&
                v139, v1390, v1391, v1392, v1393, v1394, v1395, v1396, v1397,&
                v1398, v1399, v14, v140, v1400, v1401, v1402, v1403, v1404,&
                v1405, v1406, v1407, v1408, v1409, v141, v1410, v1411, v1412,&
                v1413, v1414, v1415, v1416, v1417, v1418, v1419, v142, v1420,&
                v1421, v1422, v1423, v1424, v1425, v1426, v1427, v1428, v1429,&
                v143, v1430, v1431, v1432, v1433, v1434, v1435, v1436, v1437,&
                v1438, v1439, v144, v1440, v1441, v1442, v1443, v1444, v1445,&
                v1446, v1447, v1448, v1449, v145, v1450, v1451, v1452, v1453,&
                v1454, v1455, v1456, v1457, v1458, v1459, v146, v1460, v1461,&
                v1462, v1463, v1464, v1465, v1466, v1467, v1468, v1469, v147,&
                v1470, v1471, v1472, v1473, v1474, v1475, v1476, v1477, v1478,&
                v1479, v148, v1480, v1481, v1482, v1483, v1484, v1485, v1486,&
                v1487, v1488, v1489, v149, v1490, v1491, v1492, v1493, v1494,&
                v1495, v1496, v1497, v1498, v1499, v15, v150, v1500, v1501,&
                v1502, v1503, v1504, v1505, v1506, v1507, v1508, v1509, v151,&
                v1510, v1511, v1512, v1513, v1514, v1515, v1516, v1517, v1518,&
                v1519, v152, v1520, v1521, v1522, v1523, v1524, v1525, v1526,&
                v1527, v1528, v1529, v153, v1530, v1531, v1532, v1533, v1534,&
                v1535, v1536, v1537, v1538, v1539, v154, v1540, v1541, v1542,&
                v1543, v1544, v1545, v1546, v1547, v1548, v1549, v155, v1550,&
                v1551, v1552, v1553, v1554, v1555, v1556, v1557, v1558, v1559,&
                v156, v1560, v1561, v1562, v1563, v1564, v1565, v1566, v1567,&
                v1568, v1569, v157, v1570, v1571, v1572, v1573, v1574, v1575,&
                v1576, v1577, v1578, v1579, v158, v1580, v1581, v1582, v1583,&
                v1584, v1585, v1586, v1587, v1588, v1589, v159, v1590, v1591,&
                v1592, v1593, v1594, v1595, v1596, v1597, v1598, v1599, v16,&
                v160, v1600, v1601, v1602, v1603, v1604, v1605, v1606, v1607,&
                v1608, v1609, v161, v1610, v1611, v1612, v1613, v1614, v1615,&
                v1616, v1617, v1618, v1619, v162, v1620, v1621, v1622, v1623,&
                v1624, v1625, v1626, v1627, v1628, v1629, v163, v1630, v1631,&
                v1632, v1633, v1634, v1635, v1636, v1637, v1638, v1639, v164,&
                v1640, v1641, v1642, v1643, v1644, v1645, v1646, v1647, v1648,&
                v1649, v165, v1650, v1651, v1652, v1653, v1654, v1655, v1656,&
                v1657, v1658, v1659, v166, v1660, v1661, v1662, v1663, v1664,&
                v1665, v1666, v1667, v1668, v1669, v167, v1670, v1671, v1672,&
                v1673, v1674, v1675, v1676, v1677, v1678, v1679, v168, v1680,&
                v1681, v1682, v1683, v1684, v1685, v1686, v1687, v1688, v1689,&
                v169, v1690, v1691, v1692, v1693, v1694, v1695, v1696, v1697,&
                v1698, v1699, v17, v170, v1700, v1701, v1702, v1703, v1704,&
                v1705, v1706, v1707, v1708, v1709, v171, v1710, v1711, v1712,&
                v1713, v1714, v1715, v1716, v1717, v1718, v1719, v172, v1720,&
                v1721, v1722, v1723, v1724, v1725, v1726, v1727, v1728, v1729,&
                v173, v1730, v1731, v1732, v1733, v1734, v1735, v1736, v1737,&
                v1738, v1739, v174, v1740, v1741, v1742, v1743, v1744, v1745,&
                v1746, v1747, v1748, v1749, v175, v1750, v1751, v1752, v1753,&
                v1754, v1755, v1756, v1757, v1758, v1759, v176, v1760, v1761,&
                v1762, v1763, v1764, v1765, v1766, v1767, v1768, v1769, v177,&
                v1770, v1771, v1772, v1773, v1774, v1775, v1776, v1777, v1778,&
                v1779, v178, v1780, v1781, v1782, v1783, v1784, v1785, v1786,&
                v1787, v1788, v1789, v179, v1790, v1791, v1792, v1793, v1794,&
                v1795, v1796, v1797, v1798, v1799, v18, v180, v1800, v1801,&
                v1802, v1803, v1804, v1805, v1806, v1807, v1808, v1809, v181,&
                v1810, v1811, v1812, v1813, v1814, v1815, v1816, v1817, v1818,&
                v1819, v182, v1820, v1821, v1822, v1823, v1824, v1825, v1826,&
                v1827, v1828, v1829, v183, v1830, v1831, v1832, v1833, v1834,&
                v1835, v1836, v1837, v1838, v1839, v184, v1840, v1841, v1842,&
                v1843, v1844, v1845, v1846, v1847, v1848, v1849, v185, v1850,&
                v1851, v1852, v1853, v1854, v1855, v1856, v1857, v1858, v1859,&
                v186, v1860, v1861, v1862, v1863, v1864, v1865, v1866, v1867,&
                v1868, v1869, v187, v1870, v1871, v1872, v1873, v1874, v1875,&
                v1876, v1877, v1878, v1879, v188, v1880, v1881, v1882, v1883,&
                v1884, v1885, v1886, v1887, v1888, v1889, v189, v1890, v1891,&
                v1892, v1893, v1894, v1895, v1896, v1897, v1898, v1899, v19,&
                v190, v1900, v1901, v1902, v1903, v1904, v1905, v1906, v1907,&
                v1908, v1909, v191, v1910, v1911, v1912, v1913, v1914, v1915,&
                v1916, v1917, v1918, v1919, v192, v1920, v1921, v1922, v1923,&
                v1924, v1925, v1926, v1927, v1928, v1929, v193, v1930, v1931,&
                v1932, v1933, v194, v195, v196, v197, v198, v199, v2, v20,&
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
                v882, v883, v884, v885, v886, v887, v888, v889, v89, v890,&
                v891, v892, v893, v894, v895, v896, v897, v898, v899, v9, v90,&
                v900, v901, v902, v903, v904, v905, v906, v907, v908, v909,&
                v91, v910, v911, v912, v913, v914, v915, v916, v917, v918,&
                v919, v92, v920, v921, v922, v923, v924, v925, v926, v927,&
                v928, v929, v93, v930, v931, v932, v933, v934, v935, v936,&
                v937, v938, v939, v94, v940, v941, v942, v943, v944, v945,&
                v946, v947, v948, v949, v95, v950, v951, v952, v953, v954,&
                v955, v956, v957, v958, v959, v96, v960, v961, v962, v963,&
                v964, v965, v966, v967, v968, v969, v97, v970, v971, v972,&
                v973, v974, v975, v976, v977, v978, v979, v98, v980, v981,&
                v982, v983, v984, v985, v986, v987, v988, v989, v99, v990,&
                v991, v992, v993, v994, v995, v996, v997, v998, v999, h, u,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
                M_xxxyyzz, M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz,&
                M_xxyzzzz, M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz,&
                M_xyzzzzz, M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz,&
                M_yyzzzzz, M_yzzzzzz, M_zzzzzzz, M_xxxxxxzz, M_xxxxxyzz,&
                M_xxxxxzzz, M_xxxxyyzz, M_xxxxyzzz, M_xxxxzzzz, M_xxxyyyzz,&
                M_xxxyyzzz, M_xxxyzzzz, M_xxxzzzzz, M_xxyyyyzz, M_xxyyyzzz,&
                M_xxyyzzzz, M_xxyzzzzz, M_xxzzzzzz, M_xyyyyyzz, M_xyyyyzzz,&
                M_xyyyzzzz, M_xyyzzzzz, M_xyzzzzzz, M_xzzzzzzz, M_yyyyyyzz,&
                M_yyyyyzzz, M_yyyyzzzz, M_yyyzzzzz, M_yyzzzzzz, M_yzzzzzzz,&
                M_zzzzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz,&
                S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz, S_yyy, S_yyz,&
                S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz, S_xxzz,&
                S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy, S_yyyz, S_yyzz,&
                S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz,&
                S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz, S_xxzzz, S_xyyyy, S_xyyyz,&
                S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy, S_yyyyz, S_yyyzz, S_yyzzz,&
                S_yzzzz, S_zzzzz, S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy,&
                S_xxxxyz, S_xxxxzz, S_xxxyyy, S_xxxyyz, S_xxxyzz, S_xxxzzz,&
                S_xxyyyy, S_xxyyyz, S_xxyyzz, S_xxyzzz, S_xxzzzz, S_xyyyyy,&
                S_xyyyyz, S_xyyyzz, S_xyyzzz, S_xyzzzz, S_xzzzzz, S_yyyyyy,&
                S_yyyyyz, S_yyyyzz, S_yyyzzz, S_yyzzzz, S_yzzzzz, S_zzzzzz,&
                S_xxxxxxx, S_xxxxxxy, S_xxxxxxz, S_xxxxxyy, S_xxxxxyz,&
                S_xxxxxzz, S_xxxxyyy, S_xxxxyyz, S_xxxxyzz, S_xxxxzzz,&
                S_xxxyyyy, S_xxxyyyz, S_xxxyyzz, S_xxxyzzz, S_xxxzzzz,&
                S_xxyyyyy, S_xxyyyyz, S_xxyyyzz, S_xxyyzzz, S_xxyzzzz,&
                S_xxzzzzz, S_xyyyyyy, S_xyyyyyz, S_xyyyyzz, S_xyyyzzz,&
                S_xyyzzzz, S_xyzzzzz, S_xzzzzzz, S_yyyyyyy, S_yyyyyyz,&
                S_yyyyyzz, S_yyyyzzz, S_yyyzzzz, S_yyzzzzz, S_yzzzzzz,&
                S_zzzzzzz, S_xxxxxxxx, S_xxxxxxxy, S_xxxxxxxz, S_xxxxxxyy,&
                S_xxxxxxyz, S_xxxxxyyy, S_xxxxxyyz, S_xxxxyyyy, S_xxxxyyyz,&
                S_xxxyyyyy, S_xxxyyyyz, S_xxyyyyyy, S_xxyyyyyz, S_xyyyyyyy,&
                S_xyyyyyyz, S_yyyyyyyy, S_yyyyyyyz
#define M_0                  M(0)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define y                    r(2)
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
#define Ms_xxx               Ms(9)
#define M_xxx                M(9)
#define M_xxy                M(10)
#define Ms_xxy               Ms(10)
#define Ms_xxz               Ms(11)
#define M_xxz                M(11)
#define M_xyy                M(12)
#define Ms_xyy               Ms(12)
#define Ms_xyz               Ms(13)
#define M_xyz                M(13)
#define Ms_yyy               Ms(14)
#define M_yyy                M(14)
#define M_yyz                M(15)
#define Ms_yyz               Ms(15)
#define Ms_xxxx              Ms(16)
#define M_xxxx               M(16)
#define Ms_xxxy              Ms(17)
#define M_xxxy               M(17)
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
#define Ms_yyyy              Ms(23)
#define M_yyyy               M(23)
#define Ms_yyyz              Ms(24)
#define M_yyyz               M(24)
#define Ms_xxxxx             Ms(25)
#define M_xxxxx              M(25)
#define Ms_xxxxy             Ms(26)
#define M_xxxxy              M(26)
#define Ms_xxxxz             Ms(27)
#define M_xxxxz              M(27)
#define M_xxxyy              M(28)
#define Ms_xxxyy             Ms(28)
#define Ms_xxxyz             Ms(29)
#define M_xxxyz              M(29)
#define M_xxyyy              M(30)
#define Ms_xxyyy             Ms(30)
#define M_xxyyz              M(31)
#define Ms_xxyyz             Ms(31)
#define Ms_xyyyy             Ms(32)
#define M_xyyyy              M(32)
#define M_xyyyz              M(33)
#define Ms_xyyyz             Ms(33)
#define Ms_yyyyy             Ms(34)
#define M_yyyyy              M(34)
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
#define Ms_xxyyyz            Ms(44)
#define M_xxyyyz             M(44)
#define M_xyyyyy             M(45)
#define Ms_xyyyyy            Ms(45)
#define Ms_xyyyyz            Ms(46)
#define M_xyyyyz             M(46)
#define Ms_yyyyyy            Ms(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define Ms_yyyyyz            Ms(48)
#define M_xxxxxxx            M(49)
#define Ms_xxxxxxx           Ms(49)
#define Ms_xxxxxxy           Ms(50)
#define M_xxxxxxy            M(50)
#define M_xxxxxxz            M(51)
#define Ms_xxxxxxz           Ms(51)
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
#define M_xxyyyyz            M(59)
#define Ms_xxyyyyz           Ms(59)
#define M_xyyyyyy            M(60)
#define Ms_xyyyyyy           Ms(60)
#define M_xyyyyyz            M(61)
#define Ms_xyyyyyz           Ms(61)
#define M_yyyyyyy            M(62)
#define Ms_yyyyyyy           Ms(62)
#define Ms_yyyyyyz           Ms(63)
#define M_yyyyyyz            M(63)
#define M_xxxxxxxx           M(64)
#define Ms_xxxxxxxx          Ms(64)
#define M_xxxxxxxy           M(65)
#define Ms_xxxxxxxy          Ms(65)
#define Ms_xxxxxxxz          Ms(66)
#define M_xxxxxxxz           M(66)
#define Ms_xxxxxxyy          Ms(67)
#define M_xxxxxxyy           M(67)
#define M_xxxxxxyz           M(68)
#define Ms_xxxxxxyz          Ms(68)
#define M_xxxxxyyy           M(69)
#define Ms_xxxxxyyy          Ms(69)
#define Ms_xxxxxyyz          Ms(70)
#define M_xxxxxyyz           M(70)
#define M_xxxxyyyy           M(71)
#define Ms_xxxxyyyy          Ms(71)
#define Ms_xxxxyyyz          Ms(72)
#define M_xxxxyyyz           M(72)
#define M_xxxyyyyy           M(73)
#define Ms_xxxyyyyy          Ms(73)
#define M_xxxyyyyz           M(74)
#define Ms_xxxyyyyz          Ms(74)
#define M_xxyyyyyy           M(75)
#define Ms_xxyyyyyy          Ms(75)
#define M_xxyyyyyz           M(76)
#define Ms_xxyyyyyz          Ms(76)
#define M_xyyyyyyy           M(77)
#define Ms_xyyyyyyy          Ms(77)
#define M_xyyyyyyz           M(78)
#define Ms_xyyyyyyz          Ms(78)
#define Ms_yyyyyyyy          Ms(79)
#define M_yyyyyyyy           M(79)
#define Ms_yyyyyyyz          Ms(80)
#define M_yyyyyyyz           M(80)
    v0          = x*y
    v1          = x*z
    v2          = y*z
    v3          = v0*z
    v9          = M_x*x
    v10         = M_y*y
    v11         = -0.666666666666667d0*M_z*z
    v15         = M_xx*x
    v16         = M_xy*y
    v17         = M_xz*z
    v24         = M_xy*x
    v26         = M_yy*y
    v27         = M_yz*z
    v30         = M_xx*z
    v31         = M_xz*x
    v33         = M_yy*z
    v34         = M_yz*y
    v48         = M_xxx*x
    v49         = 1.71428571428571d0*y
    v50         = M_xxy*v49
    v51         = M_xxz*z
    v53         = 1.71428571428571d0*M_y
    v60         = 0.857142857142857d0*M_xyz
    v65         = M_xxy*x
    v68         = M_xyy*y
    v72         = 3.0d0*M_xx
    v73         = M_xxx*z
    v74         = M_xxz*x
    v76         = M_xyy*z
    v77         = 3.0d0*M_xz
    v85         = 1.71428571428571d0*M_x
    v87         = 1.71428571428571d0*x
    v88         = M_xyy*v87
    v90         = M_yyy*y
    v91         = M_yyz*z
    v95         = M_xxy*z
    v99         = M_yyy*z
    v100        = M_yyz*y
    v108        = 3.0d0*M_yz
    v119        = M_xxxx*x
    v120        = M_xxxy*y
    v121        = M_xxxz*z
    v123        = M_xxyy*x
    v134        = M_yyyy*x
    v150        = M_xxxx*y
    v151        = M_xxxy*x
    v154        = M_xxyy*y
    v155        = M_xxyz*z
    v169        = M_yyyy*y
    v174        = M_xxyy*z
    v187        = M_xxxx*z
    v188        = M_xxxz*x
    v190        = M_xxyz*y
    v200        = M_yyyy*z
    v210        = M_xyyy*y
    v211        = M_xyyz*z
    v219        = M_xxxy*z
    v221        = M_xxyz*x
    v225        = M_xyyy*z
    v226        = M_xyyz*y
    v227        = 3.0d0*M_xyz
    v237        = M_xyyy*x
    v238        = M_yyyz*z
    v241        = M_xyyz*x
    v243        = M_yyyz*y
    v250        = M_xxyyz*z
    v274        = M_xxxxx*x
    v275        = M_xxxxy*y
    v276        = M_xxxxz*z
    v278        = M_xxxyy*x
    v285        = M_xxyyy*y
    v294        = M_xyyyy*x
    v311        = M_yyyyy*y
    v312        = M_yyyyz*z
    v348        = M_xxxxx*y
    v349        = M_xxxxy*x
    v352        = M_xxxyy*y
    v353        = 1.81818181818182d0*M_xxxyz
    v356        = M_xxyyy*x
    v364        = M_xyyyy*y
    v376        = M_yyyyy*x
    v388        = 10.0d0*M_xxx
    v391        = M_xxxxx*z
    v392        = M_xxxxz*x
    v394        = M_xxxyy*z
    v395        = v353*y
    v402        = M_xxyyz*x
    v412        = M_xyyyy*z
    v416        = 5.45454545454545d0*M_xyz
    v429        = M_yyyyz*x
    v474        = M_xxxxy*z
    v475        = M_xxxxz*y
    v477        = M_xxxyz*x
    v482        = M_xxyyy*z
    v483        = M_xxyyz*y
    v502        = M_yyyyy*z
    v503        = M_yyyyz*y
    v515        = 0.545454545454545d0*z
    v518        = 0.545454545454545d0*M_z
    v522        = M_xyyyz*y
    v531        = 1.81818181818182d0*M_xyyyz
    v532        = v531*x
    v563        = M_xxxxxx*x
    v564        = M_xxxxxy*y
    v565        = M_xxxxxz*z
    v567        = M_xxxxyy*x
    v574        = M_xxxyyy*y
    v575        = M_xxxyyz*z
    v588        = M_xxyyyy*x
    v613        = M_xyyyyy*y
    v614        = M_xyyyyz*z
    v642        = M_yyyyyy*x
    v693        = M_xxxxxx*y
    v694        = M_xxxxxy*x
    v697        = M_xxxxyy*y
    v698        = M_xxxxyz*z
    v704        = M_xxxyyy*x
    v718        = M_xxyyyy*y
    v719        = M_xxyyyz*z
    v739        = M_xyyyyy*x
    v767        = M_yyyyyy*y
    v768        = M_yyyyyz*z
    v817        = M_xxxxxx*z
    v818        = M_xxxxxz*x
    v820        = M_xxxxyy*z
    v821        = 0.559440559440559d0*v820
    v822        = M_xxxxyz*y
    v828        = M_xxxyyz*x
    v839        = M_xxyyyy*z
    v840        = M_xxyyyz*y
    v863        = M_xyyyyz*x
    v893        = M_yyyyyy*z
    v894        = M_yyyyyz*y
    v950        = M_xxxyyy*z
    v993        = M_xxxxxy*z
    v994        = M_xxxxxz*y
    v996        = M_xxxxyz*x
    v1000       = M_xxxyyz*y
    v1007       = M_xxyyyz*x
    v1016       = M_xyyyyy*z
    v1017       = M_xyyyyz*y
    v1032       = M_yyyyyz*x
    v1057       = 0.909090909090909d0*M_xxxxyyz
    v1067       = 0.559440559440559d0*v839
    v1084       = 0.909090909090909d0*M_xxyyyyz
    v1152       = M_xxxxxxx*x
    v1153       = M_xxxxxxy*y
    v1154       = M_xxxxxxz*z
    v1156       = M_xxxxxyy*x
    v1163       = M_xxxxyyy*y
    v1164       = M_xxxxyyz*z
    v1174       = M_xxxyyyy*x
    v1195       = M_xxyyyyy*y
    v1196       = M_xxyyyyz*z
    v1231       = M_xyyyyyy*x
    v1273       = M_yyyyyyy*y
    v1274       = M_yyyyyyz*z
    v1314       = M_xxxyyyz*z
    v1373       = M_xxxxxxx*y
    v1374       = M_xxxxxxy*x
    v1377       = M_xxxxxyy*y
    v1378       = M_xxxxxyz*z
    v1384       = M_xxxxyyy*x
    v1398       = M_xxxyyyy*y
    v1418       = M_xxyyyyy*x
    v1448       = M_xyyyyyy*y
    v1449       = M_xyyyyyz*z
    v1486       = M_yyyyyyy*x
    v1527       = M_xxxxxxx*z
    v1528       = M_xxxxxxz*x
    v1530       = M_xxxxxyy*z
    v1531       = M_xxxxxyz*y
    v1537       = M_xxxxyyz*x
    v1548       = M_xxxyyyy*z
    v1549       = M_xxxyyyz*y
    v1573       = M_xxyyyyz*x
    v1609       = M_xyyyyyy*z
    v1610       = M_xyyyyyz*y
    v1658       = M_yyyyyyz*x
    v1737       = M_xxxxxxy*z
    v1738       = M_xxxxxxz*y
    v1740       = M_xxxxxyz*x
    v1745       = M_xxxxyyy*z
    v1746       = M_xxxxyyz*y
    v1758       = M_xxxyyyz*x
    v1778       = M_xxyyyyy*z
    v1779       = M_xxyyyyz*y
    v1812       = M_xyyyyyz*x
    v1851       = M_yyyyyyy*z
    v1852       = M_yyyyyyz*y
    Ms_0        = Ms_0 + (M_0)
    Ms_x        = Ms_x + (M_0*x + M_x)
    Ms_y        = Ms_y + (M_0*y + M_y)
    Ms_z        = Ms_z + (M_0*z + M_z)
    M_zz        = -(M_xx + M_yy)
    M_xzz       = -(M_xxx + M_xyy)
    M_yzz       = -(M_xxy + M_yyy)
    M_zzz       = -(M_xxz + M_yyz)
    M_xxzz      = -(M_xxxx + M_xxyy)
    v125        = M_xxzz*x
    v141        = M_xxzz*y
    v175        = M_xxzz*z
    M_xyzz      = -(M_xxxy + M_xyyy)
    M_xzzz      = -(M_xxxz + M_xyyz)
    M_yyzz      = -(M_xxyy + M_yyyy)
    v135        = M_yyzz*x
    v144        = M_yyzz*y
    v178        = M_yyzz*z
    M_yzzz      = -(M_xxyz + M_yyyz)
    M_zzzz      = -(M_xxzz + M_yyzz)
    M_xxxzz     = -(M_xxxxx + M_xxxyy)
    v280        = M_xxxzz*x
    v325        = M_xxxzz*y
    v398        = M_xxxzz*z
    M_xxyzz     = -(M_xxxxy + M_xxyyy)
    v287        = M_xxyzz*y
    v328        = M_xxyzz*x
    v456        = M_xxyzz*z
    M_xxzzz     = -(M_xxxxz + M_xxyyz)
    v252        = M_xxzzz*z
    v407        = M_xxzzz*x
    v458        = M_xxzzz*y
    M_xyyzz     = -(M_xxxyy + M_xyyyy)
    v1912       = M_xxxzz + M_xyyzz
    v295        = M_xyyzz*x
    v334        = M_xyyzz*y
    v415        = M_xyyzz*z
    M_xyzzz     = -(M_xxxyz + M_xyyyz)
    M_xzzzz     = -v1912
    M_yyyzz     = -(M_xxyyy + M_yyyyy)
    v1913       = M_xxyzz + M_yyyzz
    v313        = M_yyyzz*y
    v338        = M_yyyzz*x
    v461        = M_yyyzz*z
    M_yyzzz     = -(M_xxyyz + M_yyyyz)
    v255        = M_yyzzz*z
    v433        = M_yyzzz*x
    v463        = M_yyzzz*y
    M_yzzzz     = -v1913
    M_zzzzz     = -(M_xxzzz + M_yyzzz)
    M_xxxxzz    = -(M_xxxxxx + M_xxxxyy)
    v569        = M_xxxxzz*x
    v700        = M_xxxxzz*y
    v825        = M_xxxxzz*z
    v938        = 0.104895104895105d0*v569
    v1064       = 0.174825174825175d0*v825
    M_xxxyzz    = -(M_xxxxxy + M_xxxyyy)
    v577        = M_xxxyzz*y
    v706        = M_xxxyzz*x
    v952        = M_xxxyzz*z
    M_xxxzzz    = -(M_xxxxxz + M_xxxyyz)
    v582        = M_xxxzzz*z
    v833        = M_xxxzzz*x
    v954        = M_xxxzzz*y
    v1066       = 0.0699300699300699d0*v833
    M_xxyyzz    = -(M_xxxxyy + M_xxyyyy)
    v590        = M_xxyyzz*x
    v660        = M_xxyyzz*y
    v789        = M_xxyyzz*z
    v790        = -1.22377622377622d0*v789
    v1068       = -0.244755244755245d0*v789
    M_xxyzzz    = -(M_xxxxyz + M_xxyyyz)
    v661        = M_xxyzzz*z
    v847        = M_xxyzzz*y
    v848        = 0.0699300699300699d0*v847
    v958        = M_xxyzzz*x
    M_xxzzzz    = -(M_xxxxzz + M_xxyyzz)
    v598        = M_xxzzzz*x
    v663        = M_xxzzzz*y
    v791        = M_xxzzzz*z
    v792        = 0.0815850815850816d0*v791
    v1069       = 0.0163170163170163d0*v791
    M_xyyyzz    = -(M_xxxyyy + M_xyyyyy)
    v615        = M_xyyyzz*y
    v740        = M_xyyyzz*x
    v965        = M_xyyyzz*z
    M_xyyzzz    = -(M_xxxyyz + M_xyyyyz)
    v1914       = M_xxxzzz + M_xyyzzz
    v620        = M_xyyzzz*z
    v867        = M_xyyzzz*x
    v967        = M_xyyzzz*y
    v1073       = 0.0699300699300699d0*v867
    M_xyzzzz    = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz    = -v1914
    M_yyyyzz    = -(M_xxyyyy + M_yyyyyy)
    v644        = M_yyyyzz*x
    v770        = M_yyyyzz*y
    v771        = 0.104895104895105d0*v770
    v898        = M_yyyyzz*z
    v899        = 0.174825174825175d0*v898
    M_yyyzzz    = -(M_xxyyyz + M_yyyyyz)
    v1915       = M_xxyzzz + M_yyyzzz
    v667        = M_yyyzzz*z
    v904        = M_yyyzzz*y
    v905        = 0.0699300699300699d0*v904
    v977        = M_yyyzzz*x
    M_yyzzzz    = -(M_xxyyzz + M_yyyyzz)
    v1931       = M_xxzzzz + M_yyzzzz
    v651        = M_yyzzzz*x
    v669        = M_yyzzzz*y
    v793        = M_yyzzzz*z
    v794        = 0.0815850815850816d0*v793
    v1076       = 0.0163170163170163d0*v793
    M_yzzzzz    = -v1915
    M_zzzzzz    = -v1931
    M_xxxxxzz   = -(M_xxxxxxx + M_xxxxxyy)
    v935        = 0.034965034965035d0*M_xxxxxzz
    v1158       = M_xxxxxzz*x
    v1380       = M_xxxxxzz*y
    v1534       = M_xxxxxzz*z
    M_xxxxyzz   = -(M_xxxxxxy + M_xxxxyyy)
    v675        = 0.27972027972028d0*M_xxxxyzz
    v1094       = M_xxxxyzz*y
    v1386       = M_xxxxyzz*x
    v1749       = M_xxxxyzz*z
    M_xxxxzzz   = -(M_xxxxxxz + M_xxxxyyz)
    v1058       = 0.034965034965035d0*M_xxxxzzz
    v1170       = M_xxxxzzz*z
    v1542       = M_xxxxzzz*x
    v1753       = M_xxxxzzz*y
    M_xxxyyzz   = -(M_xxxxxyy + M_xxxyyyy)
    v539        = -0.244755244755245d0*M_xxxyyzz
    v936        = -0.104895104895105d0*M_xxxyyzz
    v1176       = M_xxxyyzz*x
    v1400       = M_xxxyyzz*y
    v1552       = M_xxxyyzz*z
    M_xxxyzzz   = -(M_xxxxxyz + M_xxxyyyz)
    v1315       = M_xxxyzzz*z
    v1556       = M_xxxyzzz*y
    v1763       = M_xxxyzzz*x
    M_xxxzzzz   = -(M_xxxxxzz + M_xxxyyzz)
    v1183       = M_xxxzzzz*x
    v1318       = M_xxxzzzz*y
    v1566       = M_xxxzzzz*z
    M_xxyyyzz   = -(M_xxxxyyy + M_xxyyyyy)
    v676        = -0.244755244755245d0*M_xxyyyzz
    v1048       = -0.104895104895105d0*M_xxyyyzz
    v1198       = M_xxyyyzz*y
    v1420       = M_xxyyyzz*x
    v1782       = M_xxyyyzz*z
    M_xxyyzzz   = -(M_xxxxyyz + M_xxyyyyz)
    v786        = -0.244755244755245d0*M_xxyyzzz
    v1059       = -0.048951048951049d0*M_xxyyzzz
    v1101       = M_xxyyzzz*z
    v1578       = M_xxyyzzz*x
    v1705       = M_xxyyzzz*y
    M_xxyzzzz   = -(M_xxxxyzz + M_xxyyyzz)
    v1208       = M_xxyzzzz*y
    v1323       = M_xxyzzzz*x
    v1706       = M_xxyzzzz*z
    M_xxzzzzz   = -(M_xxxxzzz + M_xxyyzzz)
    v787        = 0.0116550116550117d0*M_xxzzzzz
    v1060       = 0.00233100233100233d0*M_xxzzzzz
    v1105       = M_xxzzzzz*z
    v1593       = M_xxzzzzz*x
    v1708       = M_xxzzzzz*y
    M_xyyyyzz   = -(M_xxxyyyy + M_xyyyyyy)
    v1086       = 0.27972027972028d0*M_xyyyyzz
    v1110       = M_xyyyyzz*x
    v1451       = M_xyyyyzz*y
    v1613       = M_xyyyyzz*z
    M_xyyyzzz   = -(M_xxxyyyz + M_xyyyyyz)
    v1329       = M_xyyyzzz*z
    v1617       = M_xyyyzzz*y
    v1817       = M_xyyyzzz*x
    M_xyyzzzz   = -(M_xxxyyzz + M_xyyyyzz)
    v1916       = M_xxxzzzz + M_xyyzzzz
    v1238       = M_xyyzzzz*x
    v1332       = M_xyyzzzz*y
    v1627       = M_xyyzzzz*z
    M_xyzzzzz   = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz   = -v1916
    M_yyyyyzz   = -(M_xxyyyyy + M_yyyyyyy)
    v677        = 0.034965034965035d0*M_yyyyyzz
    v1276       = M_yyyyyzz*y
    v1488       = M_yyyyyzz*x
    v1855       = M_yyyyyzz*z
    M_yyyyzzz   = -(M_xxyyyyz + M_yyyyyyz)
    v801        = 0.034965034965035d0*M_yyyyzzz
    v1281       = M_yyyyzzz*z
    v1663       = M_yyyyzzz*x
    v1859       = M_yyyyzzz*y
    M_yyyzzzz   = -(M_xxyyyzz + M_yyyyyzz)
    v1917       = M_xxyzzzz + M_yyyzzzz
    v1287       = M_yyyzzzz*y
    v1342       = M_yyyzzzz*x
    v1712       = M_yyyzzzz*z
    M_yyzzzzz   = -(M_xxyyzzz + M_yyyyzzz)
    v788        = 0.0116550116550117d0*M_yyzzzzz
    v1061       = 0.00233100233100233d0*M_yyzzzzz
    v1117       = M_yyzzzzz*z
    v1678       = M_yyzzzzz*x
    v1714       = M_yyzzzzz*y
    M_yzzzzzz   = -v1917
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
    v1918       = M_xxxyzzzz + M_xyyyzzzz
    M_xyyzzzzz  = -(M_xxxyyzzz + M_xyyyyzzz)
    v1919       = M_xxxzzzzz + M_xyyzzzzz
    M_xyzzzzzz  = -v1918
    M_xzzzzzzz  = -v1919
    M_yyyyyyzz  = -(M_xxyyyyyy + M_yyyyyyyy)
    M_yyyyyzzz  = -(M_xxyyyyyz + M_yyyyyyyz)
    M_yyyyzzzz  = -(M_xxyyyyzz + M_yyyyyyzz)
    M_yyyzzzzz  = -(M_xxyyyzzz + M_yyyyyzzz)
    v1920       = M_xxyzzzzz + M_yyyzzzzz
    M_yyzzzzzz  = -(M_xxyyzzzz + M_yyyyzzzz)
    M_yzzzzzzz  = -v1920
    M_zzzzzzzz  = -(M_xxzzzzzz + M_yyzzzzzz)
    S_0         = 1
    S_x         = x
    S_y         = y
    S_z         = z
    S_xy        = v0
    v18         = M_y*S_xy
    v23         = M_x*S_xy
    v43         = M_xy*S_xy
    v64         = M_xx*S_xy
    v70         = M_yy*S_xy
    v80         = M_yz*S_xy
    v97         = M_xz*S_xy
    v122        = M_xxy*S_xy
    v149        = M_xxx*S_xy
    v159        = M_xyy*S_xy
    v177        = M_xyz*S_xy
    v214        = M_yyy*S_xy
    v222        = M_xxz*S_xy
    v231        = M_yyz*S_xy
    v277        = M_xxxy*S_xy
    v327        = M_xxyy*S_xy
    v329        = M_xxzz*S_xy
    v339        = M_yyzz*S_xy
    v347        = M_xxxx*S_xy
    v375        = M_yyyy*S_xy
    v403        = M_xxyz*S_xy
    v448        = M_xyyy*S_xy
    v478        = M_xxxz*S_xy
    v491        = M_xyyz*S_xy
    v524        = M_yyyz*S_xy
    v566        = M_xxxxy*S_xy
    v587        = M_xxyyy*S_xy
    v592        = M_xxyzz*S_xy
    v641        = M_yyyyy*S_xy
    v645        = M_yyyzz*S_xy
    v692        = M_xxxxx*S_xy
    v703        = M_xxxyy*S_xy
    v708        = M_xxxzz*S_xy
    v738        = M_xyyyy*S_xy
    v742        = M_xyyzz*S_xy
    v829        = M_xxxyz*S_xy
    v956        = M_xxyyz*S_xy
    v960        = M_xxzzz*S_xy
    v979        = M_yyzzz*S_xy
    v997        = M_xxxxz*S_xy
    v1033       = M_yyyyz*S_xy
    v1071       = M_xyyyz*S_xy
    v1096       = M_xxxyyy*S_xy
    v1097       = M_xxxyzz*S_xy
    v1111       = M_xyyyzz*S_xy
    v1155       = M_xxxxxy*S_xy
    v1230       = M_xyyyyy*S_xy
    v1320       = M_xxyyzz*S_xy
    v1325       = M_xxzzzz*S_xy
    v1344       = M_yyzzzz*S_xy
    v1372       = M_xxxxxx*S_xy
    v1383       = M_xxxxyy*S_xy
    v1388       = M_xxxxzz*S_xy
    v1417       = M_xxyyyy*S_xy
    v1485       = M_yyyyyy*S_xy
    v1490       = M_yyyyzz*S_xy
    v1538       = M_xxxxyz*S_xy
    v1574       = M_xxyyyz*S_xy
    v1582       = M_xxyzzz*S_xy
    v1659       = M_yyyyyz*S_xy
    v1667       = M_yyyzzz*S_xy
    v1741       = M_xxxxxz*S_xy
    v1759       = M_xxxyyz*S_xy
    v1767       = M_xxxzzz*S_xy
    v1813       = M_xyyyyz*S_xy
    v1820       = M_xyyzzz*S_xy
    Ms_xy       = Ms_xy + (M_xy + M_0*S_xy + M_x*y + M_y*x)
    S_xz        = v1
    v19         = M_z*S_xz
    v29         = M_x*S_xz
    v52         = M_xz*S_xz
    v79         = M_yy*S_xz
    v96         = M_xy*S_xz
    v124        = M_xxz*S_xz
    v160        = M_xyz*S_xz
    v186        = M_xxx*S_xz
    v193        = M_xyy*S_xz
    v215        = M_yyz*S_xz
    v220        = 3.0d0*S_xz
    v230        = M_yyy*S_xz
    v279        = M_xxxz*S_xz
    v357        = M_xxyz*S_xz
    v390        = M_xxxx*S_xz
    v401        = M_xxyy*S_xz
    v406        = M_xxzz*S_xz
    v428        = M_yyyy*S_xz
    v432        = M_yyzz*S_xz
    v446        = 0.242424242424242d0*v279
    v449        = M_xyyz*S_xz
    v476        = M_xxxy*S_xz
    v490        = M_xyyy*S_xz
    v517        = M_yyyz*S_xz
    v568        = M_xxxxz*S_xz
    v589        = M_xxyyz*S_xz
    v597        = M_xxzzz*S_xz
    v643        = M_yyyyz*S_xz
    v650        = M_yyzzz*S_xz
    v705        = M_xxxyz*S_xz
    v816        = M_xxxxx*S_xz
    v827        = M_xxxyy*S_xz
    v832        = M_xxxzz*S_xz
    v862        = M_xyyyy*S_xz
    v866        = M_xyyzz*S_xz
    v957        = M_xxyzz*S_xz
    v976        = M_yyyzz*S_xz
    v995        = M_xxxxy*S_xz
    v1006       = M_xxyyy*S_xz
    v1031       = M_yyyyy*S_xz
    v1049       = 0.839160839160839d0*v705
    v1051       = M_xyyyz*S_xz
    v1065       = 0.34965034965035d0*v832
    v1072       = 0.34965034965035d0*v866
    v1157       = M_xxxxxz*S_xz
    v1175       = M_xxxyyz*S_xz
    v1182       = M_xxxzzz*S_xz
    v1232       = M_xyyyyz*S_xz
    v1237       = M_xyyzzz*S_xz
    v1322       = M_xxyzzz*S_xz
    v1341       = M_yyyzzz*S_xz
    v1385       = M_xxxxyz*S_xz
    v1419       = M_xxyyyz*S_xz
    v1487       = M_yyyyyz*S_xz
    v1526       = M_xxxxxx*S_xz
    v1536       = M_xxxxyy*S_xz
    v1541       = M_xxxxzz*S_xz
    v1572       = M_xxyyyy*S_xz
    v1577       = M_xxyyzz*S_xz
    v1592       = M_xxzzzz*S_xz
    v1657       = M_yyyyyy*S_xz
    v1662       = M_yyyyzz*S_xz
    v1677       = M_yyzzzz*S_xz
    v1739       = M_xxxxxy*S_xz
    v1757       = M_xxxyyy*S_xz
    v1762       = M_xxxyzz*S_xz
    v1811       = M_xyyyyy*S_xz
    v1816       = M_xyyyzz*S_xz
    Ms_xz       = Ms_xz + (M_xz + M_0*S_xz + M_x*z + M_z*x)
    S_yz        = v2
    v28         = M_z*S_yz
    v32         = M_y*S_yz
    v56         = M_yz*S_yz
    v75         = M_xy*S_yz
    v94         = M_xx*S_yz
    v107        = 3.0d0*S_yz
    v129        = M_xyz*S_yz
    v156        = M_xxz*S_yz
    v170        = M_yyz*S_yz
    v189        = M_xxy*S_yz
    v199        = M_yyy*S_yz
    v218        = M_xxx*S_yz
    v286        = M_xxyz*S_yz
    v354        = M_xxxz*S_yz
    v365        = M_xyyz*S_yz
    v393        = M_xxxy*S_yz
    v411        = M_xyyy*S_yz
    v452        = M_yyyz*S_yz
    v453        = 0.242424242424242d0*v452
    v457        = M_xxzz*S_yz
    v462        = M_yyzz*S_yz
    v473        = M_xxxx*S_yz
    v481        = M_xxyy*S_yz
    v501        = M_yyyy*S_yz
    v576        = M_xxxyz*S_yz
    v662        = M_xxzzz*S_yz
    v668        = M_yyzzz*S_yz
    v699        = M_xxxxz*S_yz
    v720        = M_xxyyz*S_yz
    v769        = M_yyyyz*S_yz
    v819        = M_xxxxy*S_yz
    v838        = M_xxyyy*S_yz
    v845        = M_xxyzz*S_yz
    v846        = 0.34965034965035d0*v845
    v892        = M_yyyyy*S_yz
    v902        = M_yyyzz*S_yz
    v903        = 0.34965034965035d0*v902
    v939        = M_xyyyz*S_yz
    v940        = 0.839160839160839d0*v939
    v953        = M_xxxzz*S_yz
    v966        = M_xyyzz*S_yz
    v992        = M_xxxxx*S_yz
    v999        = M_xxxyy*S_yz
    v1015       = M_xyyyy*S_yz
    v1165       = M_xxxxyz*S_yz
    v1197       = M_xxyyyz*S_yz
    v1207       = M_xxyzzz*S_yz
    v1275       = M_yyyyyz*S_yz
    v1286       = M_yyyzzz*S_yz
    v1317       = M_xxxzzz*S_yz
    v1331       = M_xyyzzz*S_yz
    v1379       = M_xxxxxz*S_yz
    v1399       = M_xxxyyz*S_yz
    v1450       = M_xyyyyz*S_yz
    v1529       = M_xxxxxy*S_yz
    v1547       = M_xxxyyy*S_yz
    v1555       = M_xxxyzz*S_yz
    v1608       = M_xyyyyy*S_yz
    v1616       = M_xyyyzz*S_yz
    v1704       = M_xxyyzz*S_yz
    v1707       = M_xxzzzz*S_yz
    v1713       = M_yyzzzz*S_yz
    v1736       = M_xxxxxx*S_yz
    v1744       = M_xxxxyy*S_yz
    v1752       = M_xxxxzz*S_yz
    v1777       = M_xxyyyy*S_yz
    v1850       = M_yyyyyy*S_yz
    v1858       = M_yyyyzz*S_yz
    Ms_yz       = Ms_yz + (M_yz + M_0*S_yz + M_y*z + M_z*y)
    S_xyz       = v3
    v61         = 0.857142857142857d0*S_xyz
    v62         = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v61 + v60*z)
    v136        = M_yz*S_xyz
    v161        = M_xz*S_xyz
    v176        = M_xy*S_xyz
    v253        = M_xyz*S_xyz
    v358        = M_xxz*S_xyz
    v377        = M_yyz*S_xyz
    v399        = 5.45454545454545d0*S_xyz
    v400        = M_xxy*v399
    v427        = M_yyy*S_xyz
    v472        = M_xxx*S_xyz
    v530        = M_xyy*v399
    v591        = M_xxyz*S_xyz
    v707        = M_xxxz*S_xyz
    v741        = M_xyyz*S_xyz
    v826        = M_xxxy*S_xyz
    v861        = M_xyyy*S_xyz
    v943        = M_yyyz*S_xyz
    v944        = 0.839160839160839d0*v943
    v955        = M_xxyy*S_xyz
    v959        = M_xxzz*S_xyz
    v978        = M_yyzz*S_xyz
    v991        = M_xxxx*S_xyz
    v1030       = M_yyyy*S_xyz
    v1050       = 0.839160839160839d0*v707
    v1177       = M_xxxyz*S_xyz
    v1319       = M_xxyyz*S_xyz
    v1324       = M_xxzzz*S_xyz
    v1343       = M_yyzzz*S_xyz
    v1387       = M_xxxxz*S_xyz
    v1489       = M_yyyyz*S_xyz
    v1535       = M_xxxxy*S_xyz
    v1571       = M_xxyyy*S_xyz
    v1581       = M_xxyzz*S_xyz
    v1656       = M_yyyyy*S_xyz
    v1666       = M_yyyzz*S_xyz
    v1698       = M_xyyyz*S_xyz
    v1699       = 3.35664335664336d0*v1698
    v1735       = M_xxxxx*S_xyz
    v1756       = M_xxxyy*S_xyz
    v1766       = M_xxxzz*S_xyz
    v1819       = M_xyyzz*S_xyz
    v1901       = 3.35664335664336d0*v1177
    v1904       = M_xyyyy*S_xyz
    Ms_xyz      = Ms_xyz + (M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v4          = a2
    a3          = a1*a2
    a4          = a2*a2
    v38         = a4
    a5          = a2*a3
    a6          = a3*a3
    v245        = a6
    a7          = a3*a4
    a8          = a4*a4
    b2          = b1*b1
    v5          = b2
    v84         = v4*v5
    v443        = v38*v5
    b3          = b1*b2
    b4          = b2*b2
    v105        = b4
    v526        = v105*v4
    b5          = b2*b3
    b6          = b3*b3
    v535        = b6
    b7          = b3*b4
    b8          = b4*b4
    c2          = c1*c1
    h           = c2 + v4 + v5
    v1921       = h*v4
    v6          = 0.333333333333333d0*h
    v7          = -v6
    v8          = v4 + v7
    v12         = v5 + v7
    v13         = -0.6d0*h
    v20         = 0.2d0*h
    v21         = -v20
    v22         = v21 + v4
    v37         = v21 + v5
    v39         = h*h
    v1922       = v39*v4
    v40         = 0.0857142857142857d0*v39
    v41         = v1921
    v58         = -0.428571428571429d0*h
    v59         = v4 + v58
    v83         = 0.142857142857143d0*h
    v93         = -v83
    v104        = v5 + v58
    v106        = h*v5
    v109        = 0.238095238095238d0*v39
    v138        = 0.0476190476190476d0*v39
    v139        = 0.666666666666667d0*v41
    v140        = -v139 + v138 + v38
    v207        = -0.111111111111111d0*v41
    v235        = 0.111111111111111d0*(-v106) + v84
    v244        = 0.333333333333333d0*(-2.0d0*v106) + v105 + v138
    v246        = h*h*h
    v247        = -0.0216450216450216d0*v246
    v248        = h*v38
    v249        = v1922
    v320        = 0.151515151515152d0*v39
    v321        = 0.0909090909090909d0*(-10.0d0*v41) + v320 + v38
    v441        = 0.545454545454545d0*v41
    v442        = -0.00432900432900433d0*(v246 + 231.0d0*v441*v5)
    v444        = 0.0303030303030303d0*v39
    v513        = -0.272727272727273d0*v41
    v514        = -0.272727272727273d0*v106
    v519        = v444 + v84
    v525        = h*v105
    v527        = v39*v5
    v534        = 0.0909090909090909d0*(-10.0d0*v106) + v105 + v320
    v538        = -0.0815850815850816d0*v246
    v658        = -0.0116550116550117d0*v246
    v659        = v245 + v658 + 0.00699300699300699d0*(-165.0d0*v248 + 45.0d0*v249)
    v930        = -0.0769230769230769d0*v248
    v931        = 0.104895104895105d0*v39
    v932        = 0.769230769230769d0*v41
    v933        = -v5*v932
    v1924       = v658 + v933
    v1042       = 0.00699300699300699d0*v246
    v1043       = -v1042
    v1044       = v1921*v5
    v1045       = -0.461538461538462d0*v1044
    v1046       = v1043 + v1045
    v1047       = 0.020979020979021d0*v527
    v1925       = v1047 + v443
    v1055       = v1045 + 0.00233100233100233d0*(-v246)
    v1082       = 0.020979020979021d0*v249
    v1927       = v1082 + v526
    v1083       = -0.0769230769230769d0*v525
    v1085       = 0.00699300699300699d0*(-165.0d0*v525 + 45.0d0*v527) + v535 + v658
    v1087       = h*h*h*h
    v1088       = 0.00543900543900544d0*v1087
    v1089       = h*v245
    v1090       = v38*v39
    v1091       = v246*v4
    v1310       = -0.048951048951049d0*v246
    v1311       = v1310 + v245 + 0.0153846153846154d0*(-91.0d0*v248 + 35.0d0*v249)
    v1693       = v1922*v5
    v1694       = 0.000777000777000777d0*(v1087 + 297.0d0*v1693)
    v1695       = 0.020979020979021d0*v246
    v1696       = v248*v5
    v1891       = 0.0769230769230769d0*v527
    v1929       = v1891 + v443
    v1892       = -v1695
    v1893       = -v20*v38
    v1894       = -v139*v5
    v1933       = v1892 + v1894
    v1896       = v1043 + v1894
    v1898       = v105*v39
    v1899       = v246*v5
    v1900       = v4*v525
    v1903       = -0.0013986013986014d0*(286.0d0*v1044 + 3.0d0*v246)
    v1906       = 0.0769230769230769d0*v249
    v1930       = v1906 + v526
    v1907       = -v105*v20
    v1908       = h*v535
    v1911       = v1310 + v535 + 0.0153846153846154d0*(-91.0d0*v525 + 35.0d0*v527)
    S_xx        = v8
    v14         = M_x*S_xx
    v35         = M_z*S_xx
    v44         = M_yy*S_xx
    v47         = M_xx*S_xx
    v66         = M_xy*S_xx
    v101        = M_yz*S_xx
    v117        = M_xxx*S_xx
    v127        = M_xyy*S_xx
    v152        = M_xxy*S_xx
    v167        = M_yyy*S_xx
    v191        = M_xxz*S_xx
    v201        = M_yyz*S_xx
    v272        = M_xxxx*S_xx
    v283        = M_xxyy*S_xx
    v289        = M_xxzz*S_xx
    v309        = M_yyyy*S_xx
    v315        = M_yyzz*S_xx
    v350        = M_xxxy*S_xx
    v362        = M_xyyy*S_xx
    v396        = M_xxxz*S_xx
    v413        = M_xyyz*S_xx
    v484        = M_xxyz*S_xx
    v504        = M_yyyz*S_xx
    v561        = M_xxxxx*S_xx
    v572        = M_xxxyy*S_xx
    v580        = M_xxxzz*S_xx
    v611        = M_xyyyy*S_xx
    v618        = M_xyyzz*S_xx
    v695        = M_xxxxy*S_xx
    v716        = M_xxyyy*S_xx
    v723        = M_xxyzz*S_xx
    v765        = M_yyyyy*S_xx
    v774        = M_yyyzz*S_xx
    v823        = M_xxxxz*S_xx
    v841        = M_xxyyz*S_xx
    v856        = M_xxzzz*S_xx
    v895        = M_yyyyz*S_xx
    v913        = M_yyzzz*S_xx
    v964        = M_xyyyz*S_xx
    v1001       = M_xxxyz*S_xx
    v1150       = M_xxxxxx*S_xx
    v1161       = M_xxxxyy*S_xx
    v1168       = M_xxxxzz*S_xx
    v1193       = M_xxyyyy*S_xx
    v1201       = M_xxyyzz*S_xx
    v1218       = M_xxzzzz*S_xx
    v1272       = M_yyyyyy*S_xx
    v1279       = M_yyyyzz*S_xx
    v1297       = M_yyzzzz*S_xx
    v1375       = M_xxxxxy*S_xx
    v1396       = M_xxxyyy*S_xx
    v1403       = M_xxxyzz*S_xx
    v1446       = M_xyyyyy*S_xx
    v1454       = M_xyyyzz*S_xx
    v1532       = M_xxxxxz*S_xx
    v1550       = M_xxxyyz*S_xx
    v1564       = M_xxxzzz*S_xx
    v1611       = M_xyyyyz*S_xx
    v1625       = M_xyyzzz*S_xx
    v1747       = M_xxxxyz*S_xx
    v1780       = M_xxyyyz*S_xx
    v1792       = M_xxyzzz*S_xx
    v1853       = M_yyyyyz*S_xx
    v1867       = M_yyyzzz*S_xx
    Ms_xx       = Ms_xx + (0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11)
    S_yy        = v12
    v25         = M_y*S_yy
    v36         = M_z*S_yy
    v42         = M_xx*S_yy
    v45         = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v43 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v42 + 4.0d0*v44))
    v55         = M_yy*S_yy
    v67         = M_xy*S_yy
    v78         = M_xz*S_yy
    v118        = M_xxx*S_yy
    v128        = M_xyy*S_yy
    v153        = M_xxy*S_yy
    v168        = M_yyy*S_yy
    v192        = M_xxz*S_yy
    v202        = M_yyz*S_yy
    v273        = M_xxxx*S_yy
    v284        = M_xxyy*S_yy
    v290        = M_xxzz*S_yy
    v310        = M_yyyy*S_yy
    v316        = M_yyzz*S_yy
    v351        = M_xxxy*S_yy
    v363        = M_xyyy*S_yy
    v397        = M_xxxz*S_yy
    v414        = M_xyyz*S_yy
    v485        = M_xxyz*S_yy
    v505        = M_yyyz*S_yy
    v562        = M_xxxxx*S_yy
    v573        = M_xxxyy*S_yy
    v581        = M_xxxzz*S_yy
    v612        = M_xyyyy*S_yy
    v619        = M_xyyzz*S_yy
    v696        = M_xxxxy*S_yy
    v717        = M_xxyyy*S_yy
    v724        = M_xxyzz*S_yy
    v766        = M_yyyyy*S_yy
    v775        = M_yyyzz*S_yy
    v824        = M_xxxxz*S_yy
    v842        = M_xxyyz*S_yy
    v857        = M_xxzzz*S_yy
    v896        = M_yyyyz*S_yy
    v897        = -0.20979020979021d0*v896
    v914        = M_yyzzz*S_yy
    v951        = M_xxxyz*S_yy
    v1018       = M_xyyyz*S_yy
    v1151       = M_xxxxxx*S_yy
    v1162       = M_xxxxyy*S_yy
    v1169       = M_xxxxzz*S_yy
    v1194       = M_xxyyyy*S_yy
    v1202       = M_xxyyzz*S_yy
    v1219       = M_xxzzzz*S_yy
    v1280       = M_yyyyzz*S_yy
    v1298       = M_yyzzzz*S_yy
    v1376       = M_xxxxxy*S_yy
    v1397       = M_xxxyyy*S_yy
    v1404       = M_xxxyzz*S_yy
    v1447       = M_xyyyyy*S_yy
    v1455       = M_xyyyzz*S_yy
    v1533       = M_xxxxxz*S_yy
    v1551       = M_xxxyyz*S_yy
    v1565       = M_xxxzzz*S_yy
    v1612       = M_xyyyyz*S_yy
    v1626       = M_xyyzzz*S_yy
    v1703       = M_yyyyyy*S_yy
    v1748       = M_xxxxyz*S_yy
    v1781       = M_xxyyyz*S_yy
    v1793       = M_xxyzzz*S_yy
    v1854       = M_yyyyyz*S_yy
    v1868       = M_yyyzzz*S_yy
    Ms_yy       = Ms_yy + (0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11)
    S_zz        = -(S_xx + S_yy)
    S_xxx       = x*(v13 + v4)
    v46         = M_x*S_xxx
    v81         = M_z*S_xxx
    v115        = M_xx*S_xxx
    v132        = M_yy*S_xxx
    v157        = M_xy*S_xxx
    v194        = M_xz*S_xxx
    v232        = M_yz*S_xxx
    v270        = M_xxx*S_xxx
    v292        = M_xyy*S_xxx
    v337        = M_yyy*S_xxx
    v355        = M_xxy*S_xxx
    v404        = 10.0d0*S_xxx
    v430        = M_yyz*S_xxx
    v492        = M_xyz*S_xxx
    v559        = M_xxxx*S_xxx
    v585        = M_xxyy*S_xxx
    v595        = M_xxzz*S_xxx
    v639        = M_yyyy*S_xxx
    v648        = M_yyzz*S_xxx
    v701        = M_xxxy*S_xxx
    v736        = M_xyyy*S_xxx
    v830        = M_xxxz*S_xxx
    v864        = M_xyyz*S_xxx
    v1034       = M_yyyz*S_xxx
    v1148       = M_xxxxx*S_xxx
    v1172       = M_xxxyy*S_xxx
    v1180       = M_xxxzz*S_xxx
    v1228       = M_xyyyy*S_xxx
    v1235       = M_xyyzz*S_xxx
    v1381       = M_xxxxy*S_xxx
    v1415       = M_xxyyy*S_xxx
    v1422       = M_xxyzz*S_xxx
    v1483       = M_yyyyy*S_xxx
    v1492       = M_yyyzz*S_xxx
    v1539       = M_xxxxz*S_xxx
    v1575       = M_xxyyz*S_xxx
    v1590       = M_xxzzz*S_xxx
    v1660       = M_yyyyz*S_xxx
    v1675       = M_yyzzz*S_xxx
    v1760       = M_xxxyz*S_xxx
    v1814       = M_xyyyz*S_xxx
    Ms_xxx      = Ms_xxx + (M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19)))
    S_xxy       = v22*y
    v54         = S_xxy*v53
    v63         = M_x*S_xxy
    v102        = M_z*S_xxy
    v126        = M_xy*S_xxy
    v147        = M_xx*S_xxy
    v165        = M_yy*S_xxy
    v203        = M_yz*S_xxy
    v281        = M_xxy*S_xxy
    v307        = M_yyy*S_xxy
    v333        = M_xyy*S_xxy
    v346        = M_xxx*S_xxy
    v417        = S_xxy*v416
    v486        = M_xxz*S_xxy
    v506        = M_yyz*S_xxy
    v570        = M_xxxy*S_xxy
    v609        = M_xyyy*S_xxy
    v690        = M_xxxx*S_xxy
    v714        = M_xxyy*S_xxy
    v727        = M_xxzz*S_xxy
    v763        = M_yyyy*S_xxy
    v778        = M_yyzz*S_xxy
    v843        = M_xxyz*S_xxy
    v900        = M_yyyz*S_xxy
    v1002       = M_xxxz*S_xxy
    v1019       = M_xyyz*S_xxy
    v1159       = M_xxxxy*S_xxy
    v1191       = M_xxyyy*S_xxy
    v1205       = M_xxyzz*S_xxy
    v1270       = M_yyyyy*S_xxy
    v1284       = M_yyyzz*S_xxy
    v1370       = M_xxxxx*S_xxy
    v1394       = M_xxxyy*S_xxy
    v1406       = M_xxxzz*S_xxy
    v1444       = M_xyyyy*S_xxy
    v1457       = M_xyyzz*S_xxy
    v1553       = M_xxxyz*S_xxy
    v1614       = M_xyyyz*S_xxy
    v1750       = M_xxxxz*S_xxy
    v1783       = M_xxyyz*S_xxy
    v1801       = M_xxzzz*S_xxy
    v1856       = M_yyyyz*S_xxy
    v1876       = M_yyzzz*S_xxy
    Ms_xxy      = Ms_xxy + (M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v23 + 4.0d0* &
      v24 - v25 - v26 - v27 - v28)))
    S_xxz       = v22*z
    v57         = M_z*S_xxz
    v71         = M_x*S_xxz
    v130        = M_xz*S_xxz
    v171        = M_yz*S_xxz
    v184        = M_xx*S_xxz
    v197        = M_yy*S_xxz
    v223        = M_xy*S_xxz
    v254        = M_yyz*S_xxz
    v288        = M_xxz*S_xxz
    v366        = M_xyz*S_xxz
    v409        = M_xyy*S_xxz
    v479        = M_xxy*S_xxz
    v500        = M_yyy*S_xxz
    v578        = M_xxxz*S_xxz
    v616        = M_xyyz*S_xxz
    v721        = M_xxyz*S_xxz
    v772        = M_yyyz*S_xxz
    v814        = M_xxxx*S_xxz
    v836        = M_xxyy*S_xxz
    v854        = M_xxzz*S_xxz
    v890        = M_yyyy*S_xxz
    v911        = M_yyzz*S_xxz
    v1014       = M_xyyy*S_xxz
    v1166       = M_xxxxz*S_xxz
    v1199       = M_xxyyz*S_xxz
    v1216       = M_xxzzz*S_xxz
    v1277       = M_yyyyz*S_xxz
    v1295       = M_yyzzz*S_xxz
    v1401       = M_xxxyz*S_xxz
    v1452       = M_xyyyz*S_xxz
    v1524       = M_xxxxx*S_xxz
    v1545       = M_xxxyy*S_xxz
    v1562       = M_xxxzz*S_xxz
    v1606       = M_xyyyy*S_xxz
    v1623       = M_xyyzz*S_xxz
    v1742       = M_xxxxy*S_xxz
    v1775       = M_xxyyy*S_xxz
    v1790       = M_xxyzz*S_xxz
    v1848       = M_yyyyy*S_xxz
    v1865       = M_yyyzz*S_xxz
    Ms_xxz      = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v29 + v31) + 7.0d0*(v30 + v35) + 2.0d0 &
      *(-v32 + v33 - v34 + v36)))
    S_xyy       = v37*x
    v69         = M_y*S_xyy
    v82         = M_z*S_xyy
    v86         = S_xyy*v85
    v116        = M_xx*S_xyy
    v133        = M_yy*S_xyy
    v158        = M_xy*S_xyy
    v195        = M_xz*S_xyy
    v271        = M_xxx*S_xyy
    v293        = M_xyy*S_xyy
    v326        = M_xxy*S_xyy
    v374        = M_yyy*S_xyy
    v405        = M_xxz*S_xyy
    v431        = M_yyz*S_xyy
    v533        = S_xyy*v416
    v560        = M_xxxx*S_xyy
    v586        = M_xxyy*S_xyy
    v596        = M_xxzz*S_xyy
    v640        = M_yyyy*S_xyy
    v649        = M_yyzz*S_xyy
    v702        = M_xxxy*S_xyy
    v737        = M_xyyy*S_xyy
    v831        = M_xxxz*S_xyy
    v865        = M_xyyz*S_xyy
    v1008       = M_xxyz*S_xyy
    v1035       = M_yyyz*S_xyy
    v1149       = M_xxxxx*S_xyy
    v1173       = M_xxxyy*S_xyy
    v1181       = M_xxxzz*S_xyy
    v1229       = M_xyyyy*S_xyy
    v1236       = M_xyyzz*S_xyy
    v1382       = M_xxxxy*S_xyy
    v1416       = M_xxyyy*S_xyy
    v1423       = M_xxyzz*S_xyy
    v1484       = M_yyyyy*S_xyy
    v1493       = M_yyyzz*S_xyy
    v1540       = M_xxxxz*S_xyy
    v1576       = M_xxyyz*S_xyy
    v1591       = M_xxzzz*S_xyy
    v1661       = M_yyyyz*S_xyy
    v1676       = M_yyzzz*S_xyy
    v1761       = M_xxxyz*S_xyy
    v1815       = M_xyyyz*S_xyy
    Ms_xyy      = Ms_xyy + (M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19)))
    S_xzz       = -(S_xxx + S_xyy)
    S_yyy       = y*(v13 + v5)
    v89         = M_y*S_yyy
    v103        = M_z*S_yyy
    v148        = M_xx*S_yyy
    v166        = M_yy*S_yyy
    v204        = M_yz*S_yyy
    v209        = M_xy*S_yyy
    v228        = M_xz*S_yyy
    v282        = M_xxy*S_yyy
    v308        = M_yyy*S_yyy
    v324        = M_xxx*S_yyy
    v361        = M_xyy*S_yyy
    v418        = M_xyz*S_yyy
    v487        = M_xxz*S_yyy
    v537        = 10.0d0*S_yyy
    v571        = M_xxxy*S_yyy
    v610        = M_xyyy*S_yyy
    v691        = M_xxxx*S_yyy
    v715        = M_xxyy*S_yyy
    v728        = M_xxzz*S_yyy
    v764        = M_yyyy*S_yyy
    v779        = M_yyzz*S_yyy
    v844        = M_xxyz*S_yyy
    v901        = M_yyyz*S_yyy
    v1003       = M_xxxz*S_yyy
    v1160       = M_xxxxy*S_yyy
    v1192       = M_xxyyy*S_yyy
    v1206       = M_xxyzz*S_yyy
    v1271       = M_yyyyy*S_yyy
    v1285       = M_yyyzz*S_yyy
    v1371       = M_xxxxx*S_yyy
    v1395       = M_xxxyy*S_yyy
    v1407       = M_xxxzz*S_yyy
    v1445       = M_xyyyy*S_yyy
    v1458       = M_xyyzz*S_yyy
    v1554       = M_xxxyz*S_yyy
    v1615       = M_xyyyz*S_yyy
    v1751       = M_xxxxz*S_yyy
    v1784       = M_xxyyz*S_yyy
    v1802       = M_xxzzz*S_yyy
    v1857       = M_yyyyz*S_yyy
    v1877       = M_yyzzz*S_yyy
    Ms_yyy      = Ms_yyy + (M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v23 - 2.0d0*v24 + 3.0d0*v25 + &
      3.0d0*v26 - 2.0d0*v27 - 2.0d0*v28)))
    S_yyz       = v37*z
    v92         = M_z*S_yyz
    v98         = M_y*S_yyz
    v172        = M_yz*S_yyz
    v185        = M_xx*S_yyz
    v198        = M_yy*S_yyz
    v212        = M_xz*S_yyz
    v224        = M_xy*S_yyz
    v251        = M_xxz*S_yyz
    v314        = M_yyz*S_yyz
    v367        = M_xyz*S_yyz
    v389        = M_xxx*S_yyz
    v410        = M_xyy*S_yyz
    v480        = M_xxy*S_yyz
    v536        = 10.0d0*S_yyz
    v579        = M_xxxz*S_yyz
    v617        = M_xyyz*S_yyz
    v722        = M_xxyz*S_yyz
    v773        = M_yyyz*S_yyz
    v815        = M_xxxx*S_yyz
    v837        = M_xxyy*S_yyz
    v855        = M_xxzz*S_yyz
    v891        = M_yyyy*S_yyz
    v912        = M_yyzz*S_yyz
    v998        = M_xxxy*S_yyz
    v1167       = M_xxxxz*S_yyz
    v1200       = M_xxyyz*S_yyz
    v1217       = M_xxzzz*S_yyz
    v1278       = M_yyyyz*S_yyz
    v1296       = M_yyzzz*S_yyz
    v1402       = M_xxxyz*S_yyz
    v1453       = M_xyyyz*S_yyz
    v1525       = M_xxxxx*S_yyz
    v1546       = M_xxxyy*S_yyz
    v1563       = M_xxxzz*S_yyz
    v1607       = M_xyyyy*S_yyz
    v1624       = M_xyyzz*S_yyz
    v1743       = M_xxxxy*S_yyz
    v1776       = M_xxyyy*S_yyz
    v1791       = M_xxyzz*S_yyz
    v1849       = M_yyyyy*S_yyz
    v1866       = M_yyyzz*S_yyz
    Ms_yyz      = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v32 + v34) + 7.0d0*(v33 + v36) + 2.0d0 &
      *(-v29 + v30 - v31 + v35)))
    S_yzz       = -(S_xxy + S_yyy)
    S_zzz       = -(S_xxz + S_yyz)
    S_xxxx      = 0.142857142857143d0*(-6.0d0*v41) + v38 + v40
    v110        = M_x*S_xxxx
    v162        = M_y*S_xxxx
    v205        = M_z*S_xxxx
    v265        = M_xx*S_xxxx
    v302        = M_yy*S_xxxx
    v359        = M_xy*S_xxxx
    v419        = M_xz*S_xxxx
    v507        = M_yz*S_xxxx
    v554        = M_xxx*S_xxxx
    v604        = M_xyy*S_xxxx
    v709        = M_xxy*S_xxxx
    v758        = M_yyy*S_xxxx
    v849        = M_xxz*S_xxxx
    v906        = M_yyz*S_xxxx
    v1020       = M_xyz*S_xxxx
    v1113       = M_yyyy*S_xxxx
    v1144       = M_xxxx*S_xxxx
    v1189       = M_xxyy*S_xxxx
    v1214       = M_xxzz*S_xxxx
    v1293       = M_yyzz*S_xxxx
    v1389       = M_xxxy*S_xxxx
    v1439       = M_xyyy*S_xxxx
    v1557       = M_xxxz*S_xxxx
    v1618       = M_xyyz*S_xxxx
    v1785       = M_xxyz*S_xxxx
    v1860       = M_yyyz*S_xxxx
    Ms_xxxx     = Ms_xxxx + (M_0*S_xxxx + v45 - v50 - v54 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v47 - 96.0d0*v52 + 80.0d0*(v46 + v48) - &
      60.0d0*(v51 + v57) + 24.0d0*(v55 + v56)))
    S_xxxy      = v0*v59
    v131        = M_y*S_xxxy
    v146        = M_x*S_xxxy
    v233        = M_z*S_xxxy
    v291        = M_xy*S_xxxy
    v344        = M_xx*S_xxxy
    v372        = M_yy*S_xxxy
    v434        = M_yz*S_xxxy
    v493        = M_xz*S_xxxy
    v583        = M_xxy*S_xxxy
    v637        = M_yyy*S_xxxy
    v688        = M_xxx*S_xxxy
    v734        = M_xyy*S_xxxy
    v868        = M_xyz*S_xxxy
    v1036       = M_yyz*S_xxxy
    v1109       = M_xyyy*S_xxxy
    v1171       = M_xxxy*S_xxxy
    v1368       = M_xxxx*S_xxxy
    v1413       = M_xxyy*S_xxxy
    v1426       = M_xxzz*S_xxxy
    v1481       = M_yyyy*S_xxxy
    v1496       = M_yyzz*S_xxxy
    v1579       = M_xxyz*S_xxxy
    v1664       = M_yyyz*S_xxxy
    v1764       = M_xxxz*S_xxxy
    v1818       = M_xyyz*S_xxxy
    Ms_xxxy     = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v62 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 + 5.0d0*v66 - 2.0d0*v67 &
      - 2.0d0*v68 - 2.0d0*v69 - 2.0d0*v70)))
    S_xxxz      = v1*v59
    v137        = M_z*S_xxxz
    v183        = M_x*S_xxxz
    v296        = M_xz*S_xxxz
    v378        = M_yz*S_xxxz
    v386        = M_xx*S_xxxz
    v425        = M_yy*S_xxxz
    v450        = 0.242424242424242d0*v296
    v488        = M_xy*S_xxxz
    v593        = M_xxz*S_xxxz
    v646        = M_yyz*S_xxxz
    v743        = M_xyz*S_xxxz
    v812        = M_xxx*S_xxxz
    v859        = M_xyy*S_xxxz
    v1004       = M_xxy*S_xxxz
    v1029       = M_yyy*S_xxxz
    v1052       = 0.839160839160839d0*v743
    v1178       = M_xxxz*S_xxxz
    v1233       = M_xyyz*S_xxxz
    v1340       = M_yyyz*S_xxxz
    v1421       = M_xxyz*S_xxxz
    v1522       = M_xxxx*S_xxxz
    v1569       = M_xxyy*S_xxxz
    v1588       = M_xxzz*S_xxxz
    v1654       = M_yyyy*S_xxxz
    v1673       = M_yyzz*S_xxxz
    v1754       = M_xxxy*S_xxxz
    v1810       = M_xyyy*S_xxxz
    Ms_xxxz     = Ms_xxxz + (0.142857142857143d0*(15.0d0*(v71 + v74) + 13.0d0*(v73 + v81) + 6.0d0*( &
      -v75 + v76 + v78 + v79 - v80 + v82)) + M_0*S_xxxz + M_xxxz - M_y* &
      v61 + S_xx*v77 + S_xz*v72 - v60*y)
    S_xxyy      = 0.0285714285714286d0*v39 - v4*v83 - v5*v83 + v84
    v111        = M_x*S_xxyy
    v163        = M_y*S_xxyy
    v179        = M_z*S_xxyy
    v266        = M_xx*S_xxyy
    v303        = M_yy*S_xxyy
    v330        = M_xy*S_xxyy
    v420        = M_xz*S_xxyy
    v508        = M_yz*S_xxyy
    v555        = M_xxx*S_xxyy
    v605        = M_xyy*S_xxyy
    v710        = M_xxy*S_xxyy
    v759        = M_yyy*S_xxyy
    v850        = M_xxz*S_xxyy
    v907        = M_yyz*S_xxyy
    v968        = M_xyz*S_xxyy
    v1098       = M_xxyy*S_xxyy
    v1102       = M_xxzz*S_xxyy
    v1114       = M_yyzz*S_xxyy
    v1145       = M_xxxx*S_xxyy
    v1266       = M_yyyy*S_xxyy
    v1390       = M_xxxy*S_xxyy
    v1440       = M_xyyy*S_xxyy
    v1558       = M_xxxz*S_xxyy
    v1619       = M_xyyz*S_xxyy
    v1786       = M_xxyz*S_xxyy
    v1861       = M_yyyz*S_xxyy
    Ms_xxyy     = Ms_xxyy + (0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v43 + 39.0d0*(v42 + v44) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v46 + 12.0d0*v47 + &
      10.0d0*v48 + 10.0d0*v51 + 12.0d0*v52 + 12.0d0*v55 + 12.0d0*v56 + &
      10.0d0*v57 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91 + 10.0d0*v92)) &
      + M_0*S_xxyy + v50 + v54 + v86 + v88)
    S_xxyz      = v2*(v4 + v93)
    v173        = M_z*S_xxyz
    v196        = M_y*S_xxyz
    v217        = M_x*S_xxyz
    v317        = M_yz*S_xxyz
    v368        = M_xz*S_xxyz
    v408        = M_xy*S_xxyz
    v470        = M_xx*S_xxyz
    v498        = M_yy*S_xxyz
    v621        = M_xyz*S_xxyz
    v725        = M_xxz*S_xxyz
    v776        = M_yyz*S_xxyz
    v834        = M_xxy*S_xxyz
    v888        = M_yyy*S_xxyz
    v1012       = M_xyy*S_xxyz
    v1203       = M_xxyz*S_xxyz
    v1282       = M_yyyz*S_xxyz
    v1330       = M_xyyz*S_xxyz
    v1405       = M_xxxz*S_xxyz
    v1543       = M_xxxy*S_xxyz
    v1604       = M_xyyy*S_xxyz
    v1733       = M_xxxx*S_xxyz
    v1773       = M_xxyy*S_xxyz
    v1799       = M_xxzz*S_xxyz
    v1846       = M_yyyy*S_xxyz
    v1874       = M_yyzz*S_xxyz
    Ms_xxyz     = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v96 + v97) + 2.0d0*(-v100 + v103 - v98 + &
      v99) + 9.0d0*(v101 + v102 + v94 + v95)) + M_0*S_xxyz + M_xxyz + &
      M_xxz*y + M_xyz*v87 + M_y*S_xxz + S_xyz*v85)
    S_xxzz      = -(S_xxxx + S_xxyy)
    v112        = M_x*S_xxzz
    v142        = M_y*S_xxzz
    v180        = M_z*S_xxzz
    v267        = M_xx*S_xxzz
    v304        = M_yy*S_xxzz
    v331        = M_xy*S_xxzz
    v421        = M_xz*S_xxzz
    v464        = M_yz*S_xxzz
    v556        = M_xxx*S_xxzz
    v606        = M_xyy*S_xxzz
    v711        = M_xxy*S_xxzz
    v760        = M_yyy*S_xxzz
    v851        = M_xxz*S_xxzz
    v908        = M_yyz*S_xxzz
    v969        = M_xyz*S_xxzz
    v1099       = M_xxyy*S_xxzz
    v1103       = M_xxzz*S_xxzz
    v1115       = M_yyzz*S_xxzz
    v1146       = M_xxxx*S_xxzz
    v1267       = M_yyyy*S_xxzz
    v1391       = M_xxxy*S_xxzz
    v1441       = M_xyyy*S_xxzz
    v1559       = M_xxxz*S_xxzz
    v1620       = M_xyyz*S_xxzz
    v1787       = M_xxyz*S_xxzz
    v1862       = M_yyyz*S_xxzz
    S_xyyy      = v0*v104
    v213        = M_y*S_xyyy
    v234        = M_z*S_xyyy
    v236        = M_x*S_xyyy
    v345        = M_xx*S_xyyy
    v373        = M_yy*S_xyyy
    v435        = M_yz*S_xyyy
    v447        = M_xy*S_xyyy
    v494        = M_xz*S_xyyy
    v584        = M_xxy*S_xyyy
    v638        = M_yyy*S_xyyy
    v689        = M_xxx*S_xyyy
    v735        = M_xyy*S_xyyy
    v869        = M_xyz*S_xyyy
    v1009       = M_xxz*S_xyyy
    v1095       = M_xxxy*S_xyyy
    v1227       = M_xyyy*S_xyyy
    v1369       = M_xxxx*S_xyyy
    v1414       = M_xxyy*S_xyyy
    v1427       = M_xxzz*S_xyyy
    v1482       = M_yyyy*S_xyyy
    v1497       = M_yyzz*S_xyyy
    v1580       = M_xxyz*S_xyyy
    v1665       = M_yyyz*S_xyyy
    v1765       = M_xxxz*S_xyyy
    v1910       = M_xyyz*S_xyyy
    Ms_xyyy     = Ms_xyyy + (M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v62 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 - 2.0d0*v66 + 5.0d0*v67 &
      + 5.0d0*v68 + 5.0d0*v69 + 5.0d0*v70)))
    S_xyyz      = v1*(v5 + v93)
    v216        = M_z*S_xyyz
    v229        = M_y*S_xyyz
    v240        = M_x*S_xyyz
    v379        = M_yz*S_xyyz
    v387        = M_xx*S_xyyz
    v426        = M_yy*S_xyyz
    v451        = M_xz*S_xyyz
    v489        = M_xy*S_xyyz
    v594        = M_xxz*S_xyyz
    v647        = M_yyz*S_xyyz
    v744        = M_xyz*S_xyyz
    v813        = M_xxx*S_xyyz
    v860        = M_xyy*S_xyyz
    v1005       = M_xxy*S_xyyz
    v1179       = M_xxxz*S_xyyz
    v1234       = M_xyyz*S_xyyz
    v1321       = M_xxyz*S_xyyz
    v1491       = M_yyyz*S_xyyz
    v1523       = M_xxxx*S_xyyz
    v1570       = M_xxyy*S_xyyz
    v1589       = M_xxzz*S_xyyz
    v1655       = M_yyyy*S_xyyz
    v1674       = M_yyzz*S_xyyz
    v1755       = M_xxxy*S_xyyz
    v1909       = M_xyyy*S_xyyz
    Ms_xyyz     = Ms_xyyz + (0.142857142857143d0*(12.0d0*(v75 + v80) + 2.0d0*(-v71 + v73 - v74 + v81 &
      ) + 9.0d0*(v76 + v78 + v79 + v82)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v49 + M_yyz*x + S_xyz*v53)
    S_xyzz      = -(S_xxxy + S_xyyy)
    S_xzzz      = -(S_xxxz + S_xyyz)
    S_yyyy      = 0.142857142857143d0*(-6.0d0*v106) + v105 + v40
    v113        = M_x*S_yyyy
    v164        = M_y*S_yyyy
    v206        = M_z*S_yyyy
    v268        = M_xx*S_yyyy
    v305        = M_yy*S_yyyy
    v360        = M_xy*S_yyyy
    v422        = M_xz*S_yyyy
    v509        = M_yz*S_yyyy
    v557        = M_xxx*S_yyyy
    v607        = M_xyy*S_yyyy
    v712        = M_xxy*S_yyyy
    v761        = M_yyy*S_yyyy
    v852        = M_xxz*S_yyyy
    v909        = M_yyz*S_yyyy
    v1021       = M_xyz*S_yyyy
    v1093       = M_xxxx*S_yyyy
    v1190       = M_xxyy*S_yyyy
    v1215       = M_xxzz*S_yyyy
    v1268       = M_yyyy*S_yyyy
    v1294       = M_yyzz*S_yyyy
    v1392       = M_xxxy*S_yyyy
    v1442       = M_xyyy*S_yyyy
    v1560       = M_xxxz*S_yyyy
    v1621       = M_xyyz*S_yyyy
    v1788       = M_xxyz*S_yyyy
    v1863       = M_yyyz*S_yyyy
    Ms_yyyy     = Ms_yyyy + (M_0*S_yyyy + v45 - v86 - v88 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v55 - 96.0d0*v56 + 24.0d0*(v47 + v52) + &
      80.0d0*(v89 + v90) - 60.0d0*(v91 + v92)))
    S_yyyz      = v104*v2
    v239        = M_z*S_yyyz
    v242        = M_y*S_yyyz
    v454        = M_yz*S_yyyz
    v455        = 0.242424242424242d0*v454
    v471        = M_xx*S_yyyz
    v499        = M_yy*S_yyyz
    v516        = M_xz*S_yyyz
    v521        = M_xy*S_yyyz
    v726        = M_xxz*S_yyyz
    v777        = M_yyz*S_yyyz
    v835        = M_xxy*S_yyyz
    v889        = M_yyy*S_yyyz
    v941        = M_xyz*S_yyyz
    v942        = 0.839160839160839d0*v941
    v990        = M_xxx*S_yyyz
    v1013       = M_xyy*S_yyyz
    v1204       = M_xxyz*S_yyyz
    v1283       = M_yyyz*S_yyyz
    v1316       = M_xxxz*S_yyyz
    v1456       = M_xyyz*S_yyyz
    v1544       = M_xxxy*S_yyyz
    v1605       = M_xyyy*S_yyyz
    v1734       = M_xxxx*S_yyyz
    v1774       = M_xxyy*S_yyyz
    v1800       = M_xxzz*S_yyyz
    v1847       = M_yyyy*S_yyyz
    v1875       = M_yyzz*S_yyyz
    Ms_yyyz     = Ms_yyyz + (0.142857142857143d0*(15.0d0*(v100 + v98) + 13.0d0*(v103 + v99) + 6.0d0*( &
      v101 + v102 + v94 + v95 - v96 - v97)) + M_0*S_yyyz - M_x*v61 + &
      M_yy*v107 + M_yyyz + S_yy*v108 - v60*x)
    S_yyzz      = -(S_xxyy + S_yyyy)
    v114        = M_x*S_yyzz
    v143        = M_y*S_yyzz
    v145        = -0.0476190476190476d0*(M_yyyyy + v141 + v142 + v143 + v144 + v1913)
    v181        = M_z*S_yyzz
    v182        = 0.0476190476190476d0*(18.0d0*(v174 + v179) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v175 + 48.0d0*v176 + 48.0d0*v177 + 5.0d0*v178 + &
      5.0d0*v180 + 5.0d0*v181))
    v208        = -0.0476190476190476d0*(M_xxxxx + v112 + v114 + v125 + v135 + v1912)
    v269        = M_xx*S_yyzz
    v306        = M_yy*S_yyzz
    v332        = M_xy*S_yyzz
    v423        = M_xz*S_yyzz
    v465        = M_yz*S_yyzz
    v558        = M_xxx*S_yyzz
    v608        = M_xyy*S_yyzz
    v713        = M_xxy*S_yyzz
    v762        = M_yyy*S_yyzz
    v853        = M_xxz*S_yyzz
    v910        = M_yyz*S_yyzz
    v970        = M_xyz*S_yyzz
    v1100       = M_xxyy*S_yyzz
    v1104       = M_xxzz*S_yyzz
    v1116       = M_yyzz*S_yyzz
    v1147       = M_xxxx*S_yyzz
    v1269       = M_yyyy*S_yyzz
    v1393       = M_xxxy*S_yyzz
    v1443       = M_xyyy*S_yyzz
    v1561       = M_xxxz*S_yyzz
    v1622       = M_xyyz*S_yyzz
    v1789       = M_xxyz*S_yyzz
    v1864       = M_yyyz*S_yyzz
    S_yzzz      = -(S_xxyz + S_yyyz)
    S_zzzz      = -(S_xxzz + S_yyzz)
    S_xxxxx     = x*(0.111111111111111d0*(-10.0d0*v41) + v109 + v38)
    v260        = M_x*S_xxxxx
    v369        = M_y*S_xxxxx
    v436        = M_z*S_xxxxx
    v549        = M_xx*S_xxxxx
    v632        = M_yy*S_xxxxx
    v729        = M_xy*S_xxxxx
    v870        = M_xz*S_xxxxx
    v1037       = M_yz*S_xxxxx
    v1139       = M_xxx*S_xxxxx
    v1222       = M_xyy*S_xxxxx
    v1408       = M_xxy*S_xxxxx
    v1476       = M_yyy*S_xxxxx
    v1583       = M_xxz*S_xxxxx
    v1668       = M_yyz*S_xxxxx
    v1821       = M_xyz*S_xxxxx
    Ms_xxxxx    = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v110 + v119) + 330.0d0*(v115 + v117) - 30.0d0*(M_xxxyy + v111 + &
      v123) + 60.0d0*(v116 + v118 + v127 + v132) - 140.0d0*(v120 + v121 &
      + v131 + v137) - 300.0d0*(v122 + v124 + v126 + v130) + 120.0d0*( &
      v128 + v129 + v133 + v136) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v112 + v113 + v114 + v125 + v134 + v135)))
    S_xxxxy     = v140*y
    v297        = M_y*S_xxxxy
    v341        = M_x*S_xxxxy
    v510        = M_z*S_xxxxy
    v599        = M_xy*S_xxxxy
    v683        = M_xx*S_xxxxy
    v753        = M_yy*S_xxxxy
    v915        = M_yz*S_xxxxy
    v1022       = M_xz*S_xxxxy
    v1184       = M_xxy*S_xxxxy
    v1261       = M_yyy*S_xxxxy
    v1363       = M_xxx*S_xxxxy
    v1434       = M_xyy*S_xxxxy
    v1628       = M_xyz*S_xxxxy
    v1794       = M_xxz*S_xxxxy
    v1869       = M_yyz*S_xxxxy
    Ms_xxxxy    = Ms_xxxxy + (M_0*S_xxxxy + v145 + 0.0476190476190476d0*(78.0d0*(v147 + v152) + 4.0d0* &
      (v148 + v167) + 20.0d0*(M_xxxxy + v150 + v162) + 56.0d0*(v146 + &
      v149 + v151 + v157) + 8.0d0*(v166 + v168 + v170 + v172) - (2.0d0* &
      M_xxyyy + 24.0d0*v153 + 30.0d0*v154 + 28.0d0*v155 + 28.0d0*v156 + &
      48.0d0*v158 + 48.0d0*v159 + 48.0d0*v160 + 48.0d0*v161 + 30.0d0* &
      v163 + v164 + 24.0d0*v165 + v169 + 28.0d0*v171 + 28.0d0*v173)))
    S_xxxxz     = v140*z
    v318        = M_z*S_xxxxz
    v381        = M_x*S_xxxxz
    v495        = M_y*S_xxxxz
    v622        = M_xz*S_xxxxz
    v780        = M_yz*S_xxxxz
    v807        = M_xx*S_xxxxz
    v882        = M_yy*S_xxxxz
    v1010       = M_xy*S_xxxxz
    v1056       = -0.20979020979021d0*(v807 + v823)
    v1209       = M_xxz*S_xxxxz
    v1288       = M_yyz*S_xxxxz
    v1459       = M_xyz*S_xxxxz
    v1517       = M_xxx*S_xxxxz
    v1599       = M_xyy*S_xxxxz
    v1768       = M_xxy*S_xxxxz
    v1841       = M_yyy*S_xxxxz
    Ms_xxxxz    = Ms_xxxxz + (M_0*S_xxxxz + v182 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v183 &
      + v188) + 106.0d0*(v184 + v191) + 4.0d0*(v185 + v201) + 104.0d0*( &
      v186 + v194) + 44.0d0*(v187 + v205) + 32.0d0*(v192 + v197) + &
      48.0d0*(v193 + v195) + 8.0d0*(v198 + v202) - (M_yyyyz + 36.0d0* &
      v189 + 28.0d0*v190 + 28.0d0*v196 + 8.0d0*v199 + 5.0d0*v200 + &
      36.0d0*v203 + 8.0d0*v204 + 5.0d0*v206)))
    S_xxxyy     = x*(-v5*v6 + v138 + v207 + v84)
    v261        = M_x*S_xxxyy
    v370        = M_y*S_xxxyy
    v437        = M_z*S_xxxyy
    v550        = M_xx*S_xxxyy
    v633        = M_yy*S_xxxyy
    v730        = M_xy*S_xxxyy
    v871        = M_xz*S_xxxyy
    v1038       = M_yz*S_xxxyy
    v1140       = M_xxx*S_xxxyy
    v1223       = M_xyy*S_xxxyy
    v1409       = M_xxy*S_xxxyy
    v1477       = M_yyy*S_xxxyy
    v1584       = M_xxz*S_xxxyy
    v1669       = M_yyz*S_xxxyy
    v1822       = M_xyz*S_xxxyy
    Ms_xxxyy    = Ms_xxxyy + (M_0*S_xxxyy + v208 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v110 &
      + v119) + 141.0d0*(v111 + v123) + 159.0d0*(v116 + v127) + 75.0d0* &
      (v118 + v132) + 112.0d0*(v120 + v131) - 14.0d0*(v121 + v137) + &
      276.0d0*(v122 + v126) - 3.0d0*(M_xyyyy + v113 + v134) - 18.0d0*( &
      v115 + v117 + v124 + v130) - 60.0d0*(v128 + v129 + v133 + v136) - &
      42.0d0*(v209 + v210 + v211 + v212 + v213 + v214 + v215 + v216)))
    S_xxxyz     = v3*v8
    v380        = 1.81818181818182d0*S_xxxyz
    v424        = M_y*v380
    v469        = M_x*S_xxxyz
    v652        = M_yz*S_xxxyz
    v745        = M_xz*S_xxxyz
    v858        = M_xy*S_xxxyz
    v975        = M_yy*S_xxxyz
    v989        = M_xx*S_xxxyz
    v1053       = 0.839160839160839d0*v745
    v1239       = M_xyz*S_xxxyz
    v1424       = M_xxz*S_xxxyz
    v1494       = M_yyz*S_xxxyz
    v1567       = M_xxy*S_xxxyz
    v1652       = M_yyy*S_xxxyz
    v1731       = M_xxx*S_xxxyz
    v1808       = M_xyy*S_xxxyz
    v1902       = 3.35664335664336d0*v1239
    Ms_xxxyz    = Ms_xxxyz + (0.333333333333333d0*(7.0d0*(v217 + v221 + v222 + v223) + 5.0d0*(v218 + &
      v219 + v232 + v233) + 2.0d0*(-v224 + v225 - v226 + v228 - v229 + &
      v230 - v231 + v234)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy* &
      v220 + M_y*S_xxxz + S_xx*v227 + S_xxy*v77 + S_xyz*v72)
    S_xxxzz     = -(S_xxxxx + S_xxxyy)
    v262        = M_x*S_xxxzz
    v335        = M_y*S_xxxzz
    v438        = M_z*S_xxxzz
    v551        = M_xx*S_xxxzz
    v634        = M_yy*S_xxxzz
    v731        = M_xy*S_xxxzz
    v872        = M_xz*S_xxxzz
    v980        = M_yz*S_xxxzz
    v1074       = 0.34965034965035d0*v872
    v1141       = M_xxx*S_xxxzz
    v1224       = M_xyy*S_xxxzz
    v1410       = M_xxy*S_xxxzz
    v1478       = M_yyy*S_xxxzz
    v1585       = M_xxz*S_xxxzz
    v1670       = M_yyz*S_xxxzz
    v1823       = M_xyz*S_xxxzz
    S_xxyyy     = y*(-v4*v6 + v138 + v235)
    v298        = M_y*S_xxyyy
    v342        = M_x*S_xxyyy
    v511        = M_z*S_xxyyy
    v600        = M_xy*S_xxyyy
    v684        = M_xx*S_xxyyy
    v754        = M_yy*S_xxyyy
    v916        = M_yz*S_xxyyy
    v1023       = M_xz*S_xxyyy
    v1185       = M_xxy*S_xxyyy
    v1262       = M_yyy*S_xxyyy
    v1364       = M_xxx*S_xxyyy
    v1435       = M_xyy*S_xxyyy
    v1629       = M_xyz*S_xxyyy
    v1795       = M_xxz*S_xxyyy
    v1870       = M_yyz*S_xxyyy
    Ms_xxyyy    = Ms_xxyyy + (M_0*S_xxyyy + v145 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v148 &
      + v167) + 159.0d0*(v153 + v165) + 141.0d0*(v154 + v163) + 276.0d0 &
      *(v158 + v159) - 17.0d0*(v164 + v169) + 112.0d0*(v236 + v237) - &
      14.0d0*(v238 + v239) - 3.0d0*(M_xxxxy + v150 + v162) - 60.0d0*( &
      v147 + v152 + v160 + v161) - 18.0d0*(v166 + v168 + v170 + v172) - &
      42.0d0*(v146 + v149 + v151 + v155 + v156 + v157 + v171 + v173)))
    S_xxyyz     = z*(0.0158730158730159d0*v39 + v207 + v235)
    v256        = M_z*S_xxyyz
    v382        = M_x*S_xxyyz
    v496        = M_y*S_xxyyz
    v623        = M_xz*S_xxyyz
    v781        = M_yz*S_xxyyz
    v808        = M_xx*S_xxyyz
    v883        = M_yy*S_xxyyz
    v961        = M_xy*S_xxyyz
    v1210       = M_xxz*S_xxyyz
    v1289       = M_yyz*S_xxyyz
    v1333       = M_xyz*S_xxyyz
    v1518       = M_xxx*S_xxyyz
    v1600       = M_xyy*S_xxyyz
    v1769       = M_xxy*S_xxyyz
    v1842       = M_yyy*S_xxyyz
    Ms_xxyyz    = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v176 + v177) + 6.0d0*(v186 + v194 + v199 + v204) + 9.0d0*(v187 + &
      v200 + v205 + v206) + 132.0d0*(v189 + v193 + v195 + v203) + &
      112.0d0*(v190 + v196 + v240 + v241) + 81.0d0*(v174 + v179 + v185 &
      + v192 + v197 + v201) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v175 + 5.0d0*v178 + 5.0d0*v180 + 5.0d0*v181 + 14.0d0*v183 + &
      6.0d0*v184 + 14.0d0*v188 + 6.0d0*v191 + 6.0d0*v198 + 6.0d0*v202 + &
      14.0d0*v242 + 14.0d0*v243)))
    S_xxyzz     = -(S_xxxxy + S_xxyyy)
    v299        = M_y*S_xxyzz
    v322        = M_x*S_xxyzz
    v466        = M_z*S_xxyzz
    v601        = M_xy*S_xxyzz
    v685        = M_xx*S_xxyzz
    v755        = M_yy*S_xxyzz
    v917        = M_yz*S_xxyzz
    v918        = 0.34965034965035d0*v917
    v971        = M_xz*S_xxyzz
    v1186       = M_xxy*S_xxyzz
    v1263       = M_yyy*S_xxyzz
    v1365       = M_xxx*S_xxyzz
    v1436       = M_xyy*S_xxyzz
    v1630       = M_xyz*S_xxyzz
    v1796       = M_xxz*S_xxyzz
    v1871       = M_yyz*S_xxyzz
    S_xxzzz     = -(S_xxxxz + S_xxyyz)
    v257        = M_z*S_xxzzz
    v383        = M_x*S_xxzzz
    v459        = M_y*S_xxzzz
    v624        = M_xz*S_xxzzz
    v670        = M_yz*S_xxzzz
    v809        = M_xx*S_xxzzz
    v884        = M_yy*S_xxzzz
    v962        = M_xy*S_xxzzz
    v1211       = M_xxz*S_xxzzz
    v1290       = M_yyz*S_xxzzz
    v1334       = M_xyz*S_xxzzz
    v1519       = M_xxx*S_xxzzz
    v1601       = M_xyy*S_xxzzz
    v1770       = M_xxy*S_xxzzz
    v1843       = M_yyy*S_xxzzz
    S_xyyyy     = v244*x
    v263        = M_x*S_xyyyy
    v371        = M_y*S_xyyyy
    v439        = M_z*S_xyyyy
    v552        = M_xx*S_xyyyy
    v635        = M_yy*S_xyyyy
    v732        = M_xy*S_xyyyy
    v873        = M_xz*S_xyyyy
    v1039       = M_yz*S_xyyyy
    v1142       = M_xxx*S_xyyyy
    v1225       = M_xyy*S_xyyyy
    v1411       = M_xxy*S_xyyyy
    v1479       = M_yyy*S_xyyyy
    v1586       = M_xxz*S_xyyyy
    v1671       = M_yyz*S_xyyyy
    v1905       = M_xyz*S_xyyyy
    Ms_xyyyy    = Ms_xyyyy + (M_0*S_xyyyy + v208 + 0.0476190476190476d0*(4.0d0*(v118 + v132) + 78.0d0* &
      (v128 + v133) + 20.0d0*(M_xyyyy + v113 + v134) + 8.0d0*(v115 + &
      v117 + v124 + v130) + 56.0d0*(v209 + v210 + v213 + v214) - (2.0d0 &
      *M_xxxyy + v110 + 30.0d0*v111 + 24.0d0*v116 + v119 + 48.0d0*v122 &
      + 30.0d0*v123 + 48.0d0*v126 + 24.0d0*v127 + 48.0d0*v129 + 48.0d0* &
      v136 + 28.0d0*v211 + 28.0d0*v212 + 28.0d0*v215 + 28.0d0*v216)))
    S_xyyyz     = v12*v3
    v523        = M_y*S_xyyyz
    v528        = 1.81818181818182d0*S_xyyyz
    v529        = M_x*v528
    v945        = M_yz*S_xyyyz
    v946        = 0.839160839160839d0*v945
    v949        = M_xx*S_xyyyz
    v1028       = M_yy*S_xyyyz
    v1054       = M_xz*S_xyyyz
    v1070       = M_xy*S_xyyyz
    v1425       = M_xxz*S_xyyyz
    v1495       = M_yyz*S_xyyyz
    v1568       = M_xxy*S_xyyyz
    v1653       = M_yyy*S_xyyyz
    v1700       = M_xyz*S_xyyyz
    v1701       = 3.35664335664336d0*v1700
    v1732       = M_xxx*S_xyyyz
    v1809       = M_xyy*S_xyyyz
    Ms_xyyyz    = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v224 + v226 + v229 + v231 &
      ) + 5.0d0*(v225 + v228 + v230 + v234) + 2.0d0*(-v217 + v218 + &
      v219 - v221 - v222 - v223 + v232 + v233)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v107 + M_xyyyz + M_yyyz*x + S_xyy*v108 + S_yy*v227)
    S_xyyzz     = -(S_xxxyy + S_xyyyy)
    v264        = M_x*S_xyyzz
    v336        = M_y*S_xyyzz
    v440        = M_z*S_xyyzz
    v553        = M_xx*S_xyyzz
    v636        = M_yy*S_xyyzz
    v733        = M_xy*S_xyyzz
    v874        = M_xz*S_xyyzz
    v981        = M_yz*S_xyyzz
    v1075       = 0.34965034965035d0*v874
    v1143       = M_xxx*S_xyyzz
    v1226       = M_xyy*S_xyyzz
    v1412       = M_xxy*S_xyyzz
    v1480       = M_yyy*S_xyyzz
    v1587       = M_xxz*S_xyyzz
    v1672       = M_yyz*S_xyyzz
    v1824       = M_xyz*S_xyyzz
    S_xyzzz     = -(S_xxxyz + S_xyyyz)
    S_xzzzz     = -(S_xxxzz + S_xyyzz)
    S_yyyyy     = y*(0.111111111111111d0*(-10.0d0*v106) + v105 + v109)
    v300        = M_y*S_yyyyy
    v343        = M_x*S_yyyyy
    v512        = M_z*S_yyyyy
    v602        = M_xy*S_yyyyy
    v686        = M_xx*S_yyyyy
    v756        = M_yy*S_yyyyy
    v919        = M_yz*S_yyyyy
    v1024       = M_xz*S_yyyyy
    v1187       = M_xxy*S_yyyyy
    v1264       = M_yyy*S_yyyyy
    v1366       = M_xxx*S_yyyyy
    v1437       = M_xyy*S_yyyyy
    v1631       = M_xyz*S_yyyyy
    v1797       = M_xxz*S_yyyyy
    v1872       = M_yyz*S_yyyyy
    Ms_yyyyy    = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v164 + v169) + 330.0d0*(v166 + v168) - 30.0d0*(M_xxyyy + v154 + &
      v163) + 120.0d0*(v147 + v152 + v160 + v161) + 60.0d0*(v148 + v153 &
      + v165 + v167) - 300.0d0*(v158 + v159 + v170 + v172) - 140.0d0*( &
      v236 + v237 + v238 + v239) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v141 + v142 + v143 + v144 + v150 + v162)))
    S_yyyyz     = v244*z
    v319        = M_z*S_yyyyz
    v384        = M_x*S_yyyyz
    v497        = M_y*S_yyyyz
    v625        = M_xz*S_yyyyz
    v782        = M_yz*S_yyyyz
    v810        = M_xx*S_yyyyz
    v885        = M_yy*S_yyyyz
    v886        = -0.20979020979021d0*v885
    v1932       = v886 + v897
    v1011       = M_xy*S_yyyyz
    v1212       = M_xxz*S_yyyyz
    v1291       = M_yyz*S_yyyyz
    v1460       = M_xyz*S_yyyyz
    v1520       = M_xxx*S_yyyyz
    v1602       = M_xyy*S_yyyyz
    v1771       = M_xxy*S_yyyyz
    v1844       = M_yyy*S_yyyyz
    Ms_yyyyz    = Ms_yyyyz + (M_0*S_yyyyz + v182 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v184 &
      + v191) + 32.0d0*(v185 + v201) + 48.0d0*(v189 + v203) + 4.0d0*( &
      v192 + v197) + 106.0d0*(v198 + v202) + 104.0d0*(v199 + v204) + &
      44.0d0*(v200 + v206) + 56.0d0*(v242 + v243) - (M_xxxxz + 8.0d0* &
      v186 + 5.0d0*v187 + 36.0d0*v193 + 8.0d0*v194 + 36.0d0*v195 + &
      5.0d0*v205 + 28.0d0*v240 + 28.0d0*v241)))
    S_yyyzz     = -(S_xxyyy + S_yyyyy)
    v301        = M_y*S_yyyzz
    v323        = M_x*S_yyyzz
    v340        = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz - &
      v322 - v323 + 4.0d0*v324 - v325 - 24.0d0*v326 - 30.0d0*v327 - &
      v328 - v329 - 30.0d0*v330 - v331 - v332 - 24.0d0*v333 - v334 - &
      v335 - v336 + 4.0d0*v337 - v338 - v339))
    v467        = M_z*S_yyyzz
    v603        = M_xy*S_yyyzz
    v687        = M_xx*S_yyyzz
    v757        = M_yy*S_yyyzz
    v920        = M_yz*S_yyyzz
    v921        = 0.34965034965035d0*v920
    v972        = M_xz*S_yyyzz
    v1188       = M_xxy*S_yyyzz
    v1265       = M_yyy*S_yyyzz
    v1367       = M_xxx*S_yyyzz
    v1438       = M_xyy*S_yyyzz
    v1632       = M_xyz*S_yyyzz
    v1798       = M_xxz*S_yyyzz
    v1873       = M_yyz*S_yyyzz
    S_yyzzz     = -(S_xxyyz + S_yyyyz)
    v258        = M_z*S_yyzzz
    v1923       = v1931 - 15.0d0*M_xxyyzz + 3.0d0*(2.0d0*v252 + 2.0d0*v255 + 2.0d0*v257 + &
      2.0d0*v258)
    v259        = 0.00432900432900433d0*(1440.0d0*v253 + 5.0d0*(v1923 + 12.0d0*v250 - &
      8.0d0*v251 - 8.0d0*v254 + 12.0d0*v256))
    v385        = M_x*S_yyzzz
    v445        = 0.00432900432900433d0*(v1923 - 720.0d0*v253 - 240.0d0*(v250 + v256) - &
      260.0d0*(v251 + v254))
    v460        = M_y*S_yyzzz
    v468        = -0.0303030303030303d0*(M_yyyyyz + v1915 + v458 + v459 + v460 + v463 + &
      5.0d0*(v456 + v457 + v461 + v462 + v464 + v465 + v466 + v467))
    v520        = -0.0303030303030303d0*(M_xxxxxz + v1914 + v383 + v385 + v407 + v433 + &
      5.0d0*(v398 + v406 + v415 + v421 + v423 + v432 + v438 + v440))
    v626        = M_xz*S_yyzzz
    v671        = M_yz*S_yyzzz
    v811        = M_xx*S_yyzzz
    v887        = M_yy*S_yyzzz
    v963        = M_xy*S_yyzzz
    v1213       = M_xxz*S_yyzzz
    v1292       = M_yyz*S_yyzzz
    v1335       = M_xyz*S_yyzzz
    v1521       = M_xxx*S_yyzzz
    v1603       = M_xyy*S_yyzzz
    v1772       = M_xxy*S_yyzzz
    v1845       = M_yyy*S_yyzzz
    S_yzzzz     = -(S_xxyzz + S_yyyzz)
    S_zzzzz     = -(S_xxzzz + S_yyzzz)
    S_xxxxxx    = v245 + v247 + 0.0909090909090909d0*(-15.0d0*v248 + 5.0d0*v249)
    v540        = M_x*S_xxxxxx
    v746        = M_y*S_xxxxxx
    v922        = M_z*S_xxxxxx
    v1130       = M_xx*S_xxxxxx
    v1253       = M_yy*S_xxxxxx
    v1428       = M_xy*S_xxxxxx
    v1633       = M_xz*S_xxxxxx
    v1878       = M_yz*S_xxxxxx
    Ms_xxxxxx   = Ms_xxxxxx + (M_0*S_xxxxxx + v259 + 0.00432900432900433d0*(136.0d0*M_xxxxxx - 75.0d0* &
      M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + 2360.0d0*v270 - &
      2340.0d0*v281 - 2260.0d0*v288 + 1440.0d0*v293 + 576.0d0*(v260 + &
      v274) + 1620.0d0*(v265 + v272) - 120.0d0*(v282 + v307) + 840.0d0* &
      (v286 + v317) - 160.0d0*(v308 + v314) + 90.0d0*(-M_xxxxzz + v266 &
      + v283) + 360.0d0*(-v261 + v273 - v278 + v302) + 720.0d0*(v271 + &
      v284 + v292 + v303) - 600.0d0*(v275 + v276 + v297 + v318) - &
      1680.0d0*(v277 + v279 + v291 + v296) - 165.0d0*(v267 + v268 + &
      v269 + v289 + v309 + v315) - 180.0d0*(M_xxxxyy + v262 + v263 + &
      v264 + v280 + v294 + v295) + 60.0d0*(v285 - v290 + v298 - v304 - &
      v305 - v306 - v310 - v316) + 30.0d0*(v287 + v299 + v300 + v301 + &
      v311 + v312 + v313 + v319)))
    S_xxxxxy    = v0*v321
    v627        = M_y*S_xxxxxy
    v678        = M_x*S_xxxxxy
    v1040       = M_z*S_xxxxxy
    v1220       = M_xy*S_xxxxxy
    v1358       = M_xx*S_xxxxxy
    v1471       = M_yy*S_xxxxxy
    v1679       = M_yz*S_xxxxxy
    v1825       = M_xz*S_xxxxxy
    Ms_xxxxxy   = Ms_xxxxxy + (M_0*S_xxxxxy - M_z*v380 + v340 - v353*z + 0.0303030303030303d0*(-10.0d0* &
      (v342 + v356) + 20.0d0*(v345 + v362) - 70.0d0*(v352 + v370) - &
      60.0d0*(v354 + v378) + 28.0d0*(M_xxxxxy + v348 + v369) + 100.0d0* &
      (v341 + v347 + v349 + v359) + 190.0d0*(v344 + v346 + v350 + v355 &
      ) - 140.0d0*(v357 + v358 + v366 + v368) - 5.0d0*(M_xyyyyy + v343 &
      + v360 + v364 + v371 + v375 + v376) + 40.0d0*(-v351 + v361 + v363 &
      + v365 + v367 - v372 + v373 + v374 + v377 + v379)))
    S_xxxxxz    = v1*v321
    v653        = M_z*S_xxxxxz
    v802        = M_x*S_xxxxxz
    v1025       = M_y*S_xxxxxz
    v1240       = M_xz*S_xxxxxz
    v1498       = M_yz*S_xxxxxz
    v1512       = M_xx*S_xxxxxz
    v1647       = M_yy*S_xxxxxz
    v1803       = M_xy*S_xxxxxz
    Ms_xxxxxz   = Ms_xxxxxz + (M_0*S_xxxxxz + M_xxz*v404 + S_xxz*v388 - v395 - v400 - v417 - v424 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 250.0d0*(v386 + v396) + &
      220.0d0*(v390 + v419) + 68.0d0*(v391 + v436) + 80.0d0*(v397 + &
      v425) + 90.0d0*(v401 + v420) - 140.0d0*(v403 + v408) + 160.0d0*( &
      v405 + v409) + 100.0d0*(v381 + v392 - v393 - v434) + 20.0d0*(v387 &
      + v389 + v413 + v430) + 10890.0d0*(-M_xxxyyz - v382 + v394 - v402 &
      + v437) + 40.0d0*(v410 - v411 + v414 - v418 + v426 - v427 + v431 &
      - v435) - 5.0d0*(M_xxxzzz + M_xyyyyz + M_xyyzzz + v383 + v384 + &
      v385 + v407 + v429 + v433) - 25.0d0*(v398 + v406 + v412 + v415 + &
      v421 + v422 + v423 + v428 + v432 + v438 + v439 + v440)))
    S_xxxxyy    = 0.0303030303030303d0*(-3.0d0*v248 + 2.0d0*v249) + v442 + v443 + v444*v5
    v541        = M_x*S_xxxxyy
    v747        = M_y*S_xxxxyy
    v923        = M_z*S_xxxxyy
    v924        = 0.559440559440559d0*v923
    v1131       = M_xx*S_xxxxyy
    v1254       = M_yy*S_xxxxyy
    v1429       = M_xy*S_xxxxyy
    v1634       = M_xz*S_xxxxyy
    v1879       = M_yz*S_xxxxyy
    Ms_xxxxyy   = Ms_xxxxyy + (M_0*S_xxxxyy + v445 - v446 - v450 + v453 + v455 + 0.00432900432900433d0* &
      (-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - 11.0d0*M_xxxxzz - 5.0d0* &
      M_yyyyyy - 4.0d0*M_yyyyzz + 1800.0d0*v281 - 720.0d0*v293 - 64.0d0 &
      *(v260 + v274) + 628.0d0*(v261 + v278) - 82.0d0*(v265 + v272) + &
      942.0d0*(v266 + v283) + 2.0d0*(v268 + v309) - 60.0d0*(v270 + v288 &
      ) + 760.0d0*(v271 + v292) + 412.0d0*(v275 + v297) - 36.0d0*(v276 &
      + v318) + 1288.0d0*(v277 + v291) - 220.0d0*(v282 + v307) - &
      402.0d0*(v284 + v303) - 392.0d0*(v286 + v317) + 37.0d0*(v305 + &
      v310) + 80.0d0*(v308 + v314) + 6.0d0*(v312 + v319) - 26.0d0*(v267 &
      + v269 + v289 + v315) + 268.0d0*(v273 - v285 - v298 + v302) - &
      19.0d0*(v290 + v304 + v306 + v316) - 448.0d0*(v447 + v448 + v449 &
      + v451) - 8.0d0*(v287 + v299 + v300 + v301 + v311 + v313) - &
      22.0d0*(M_xxyyyy + v262 + v263 + v264 + v280 + v294 + v295)))
    S_xxxxyz    = v2*(-v441 + v38 + v444)
    v783        = M_z*S_xxxxyz
    v875        = M_y*S_xxxxyz
    v986        = M_x*S_xxxxyz
    v1299       = M_yz*S_xxxxyz
    v1461       = M_xz*S_xxxxyz
    v1594       = M_xy*S_xxxxyz
    v1726       = M_xx*S_xxxxyz
    v1836       = M_yy*S_xxxxyz
    Ms_xxxxyz   = Ms_xxxxyz + (M_0*S_xxxxyz + v468 + 0.0303030303030303d0*(26.0d0*(v482 + v511) + &
      40.0d0*(v487 + v500) + 8.0d0*(v499 + v505) + 32.0d0*(M_xxxxyz + &
      v475 + v495) + 96.0d0*(v469 + v477 + v478 + v488) + 170.0d0*(v470 &
      + v479 + v484 + v486) + 4.0d0*(v471 + v485 + v498 + v504) + &
      160.0d0*(v472 + v476 + v492 + v493) + 64.0d0*(v473 + v474 + v490 &
      + v494 + v507 + v510) - (2.0d0*M_xxyyyz + 40.0d0*v480 + 18.0d0* &
      v481 + 38.0d0*v483 + 64.0d0*v489 + 64.0d0*v491 + 38.0d0*v496 + &
      v497 + 13.0d0*v501 + 5.0d0*v502 + v503 + 40.0d0*v506 + 18.0d0* &
      v508 + 13.0d0*v509 + 5.0d0*v512)))
    S_xxxxzz    = -(S_xxxxxx + S_xxxxyy)
    v542        = M_x*S_xxxxzz
    v748        = M_y*S_xxxxzz
    v925        = M_z*S_xxxxzz
    v937        = 0.104895104895105d0*v542
    v1077       = 0.174825174825175d0*v925
    v1132       = M_xx*S_xxxxzz
    v1255       = M_yy*S_xxxxzz
    v1430       = M_xy*S_xxxxzz
    v1635       = M_xz*S_xxxxzz
    v1880       = M_yz*S_xxxxzz
    S_xxxyyy    = v0*(0.0909090909090909d0*v39 + v513 + v514 + v84)
    v628        = M_y*S_xxxyyy
    v679        = M_x*S_xxxyyy
    v982        = M_z*S_xxxyyy
    v1106       = M_xy*S_xxxyyy
    v1359       = M_xx*S_xxxyyy
    v1472       = M_yy*S_xxxyyy
    v1680       = M_yz*S_xxxyyy
    v1826       = M_xz*S_xxxyyy
    Ms_xxxyyy   = Ms_xxxyyy + (0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v324 + v337) + 75.0d0*(v326 + v333) + 69.0d0*(v327 + v330) + &
      25.0d0*(v342 + v352 + v356 + v370) + 31.0d0*(v345 + v351 + v362 + &
      v372) - (M_xxxxxy + 11.0d0*M_xxxyz*v515 + M_xxxyzz + M_xyyyyy + &
      11.0d0*M_xyyyz*v515 + M_xyyyzz + 11.0d0*S_xxxyz*v518 + 11.0d0* &
      S_xyyyz*v518 + v322 + v323 + v325 + v328 + v329 + v331 + v332 + &
      v334 + v335 + v336 + v338 + v339 + 7.0d0*v341 + v343 + 10.0d0* &
      v344 + 10.0d0*v346 + 7.0d0*v347 + v348 + 7.0d0*v349 + 10.0d0*v350 &
      + 6.0d0*v354 + 10.0d0*v355 + 10.0d0*v357 + 10.0d0*v358 + 7.0d0* &
      v359 + 7.0d0*v360 + 10.0d0*v361 + 10.0d0*v363 + 7.0d0*v364 + &
      10.0d0*v365 + 10.0d0*v366 + 10.0d0*v367 + 10.0d0*v368 + v369 + &
      7.0d0*v371 + 10.0d0*v373 + 10.0d0*v374 + 7.0d0*v375 + v376 + &
      10.0d0*v377 + 6.0d0*v378 + 10.0d0*v379 + 6.0d0*v516 + 6.0d0*v517 &
      )))
    S_xxxyyz    = v1*(0.0909090909090909d0*(-v41) + v514 + v519)
    v654        = M_z*S_xxxyyz
    v803        = M_x*S_xxxyyz
    v1026       = M_y*S_xxxyyz
    v1241       = M_xz*S_xxxyyz
    v1499       = M_yz*S_xxxyyz
    v1513       = M_xx*S_xxxyyz
    v1648       = M_yy*S_xxxyyz
    v1804       = M_xy*S_xxxyyz
    Ms_xxxyyz   = Ms_xxxyyz + (M_0*S_xxxyyz + M_xxyy*v220 + S_xxyy*v77 + v395 + v400 + v417 + v424 + &
      v520 + 0.0303030303030303d0*(31.0d0*M_xxxyyz + v391 + v436 + &
      79.0d0*(v382 + v402) + 103.0d0*(v387 + v413) + 55.0d0*(v389 + &
      v430) + 88.0d0*(v393 + v434) + 47.0d0*(v394 + v437) + 43.0d0*( &
      v397 + v425) + 152.0d0*(v403 + v408) + 95.0d0*(v405 + v409) + &
      10.0d0*(v411 + v418 + v427 + v435) + 13.0d0*(v412 + v422 + v428 + &
      v439) - (M_xyyyyz + 7.0d0*v381 + v384 + 4.0d0*v386 + v390 + 7.0d0 &
      *v392 + 4.0d0*v396 + 10.0d0*v410 + 10.0d0*v414 + v419 + 10.0d0* &
      v426 + v429 + 10.0d0*v431 + 18.0d0*v521 + 18.0d0*v522 + 18.0d0* &
      v523 + 18.0d0*v524)))
    S_xxxyzz    = -(S_xxxxxy + S_xxxyyy)
    v629        = M_y*S_xxxyzz
    v680        = M_x*S_xxxyzz
    v983        = M_z*S_xxxyzz
    v1107       = M_xy*S_xxxyzz
    v1360       = M_xx*S_xxxyzz
    v1473       = M_yy*S_xxxyzz
    v1681       = M_yz*S_xxxyzz
    v1827       = M_xz*S_xxxyzz
    S_xxxzzz    = -(S_xxxxxz + S_xxxyyz)
    v655        = M_z*S_xxxzzz
    v804        = M_x*S_xxxzzz
    v973        = M_y*S_xxxzzz
    v1062       = 0.0699300699300699d0*v804
    v1242       = M_xz*S_xxxzzz
    v1345       = M_yz*S_xxxzzz
    v1514       = M_xx*S_xxxzzz
    v1649       = M_yy*S_xxxzzz
    v1805       = M_xy*S_xxxzzz
    S_xxyyyy    = 0.0303030303030303d0*(-3.0d0*v525 + 2.0d0*v527) + v4*v444 + v442 + v526
    v543        = M_x*S_xxyyyy
    v749        = M_y*S_xxyyyy
    v926        = M_z*S_xxyyyy
    v1078       = 0.559440559440559d0*v926
    v1133       = M_xx*S_xxyyyy
    v1256       = M_yy*S_xxyyyy
    v1431       = M_xy*S_xxyyyy
    v1636       = M_xz*S_xxyyyy
    v1881       = M_yz*S_xxyyyy
    Ms_xxyyyy   = Ms_xxyyyy + (M_0*S_xxyyyy + v445 + v446 + v450 - v453 - v455 + 0.00432900432900433d0* &
      (-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0*M_xxyyyy - 12.0d0* &
      M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v281 + 1800.0d0*v293 + &
      412.0d0*(v263 + v294) + 37.0d0*(v265 + v272) - 402.0d0*(v266 + &
      v283) + 80.0d0*(v270 + v288) - 220.0d0*(v271 + v292) + 2.0d0*( &
      v273 + v302) + 6.0d0*(v276 + v318) + 760.0d0*(v282 + v307) + &
      942.0d0*(v284 + v303) + 628.0d0*(v285 + v298) - 64.0d0*(v300 + &
      v311) - 82.0d0*(v305 + v310) - 60.0d0*(v308 + v314) - 36.0d0*( &
      v312 + v319) + 1288.0d0*(v447 + v448) - 392.0d0*(v449 + v451) + &
      268.0d0*(-v261 + v268 - v278 + v309) - 19.0d0*(v267 + v269 + v289 &
      + v315) - 448.0d0*(v277 + v286 + v291 + v317) - 26.0d0*(v290 + &
      v304 + v306 + v316) - 8.0d0*(v260 + v262 + v264 + v274 + v280 + &
      v295) - 22.0d0*(M_xxxxyy + v275 + v287 + v297 + v299 + v301 + &
      v313)))
    S_xxyyyz    = v2*(0.0909090909090909d0*(-v106) + v513 + v519)
    v784        = M_z*S_xxyyyz
    v876        = M_y*S_xxyyyz
    v987        = M_x*S_xxyyyz
    v1300       = M_yz*S_xxyyyz
    v1462       = M_xz*S_xxyyyz
    v1595       = M_xy*S_xxyyyz
    v1727       = M_xx*S_xxyyyz
    v1837       = M_yy*S_xxyyyz
    Ms_xxyyyz   = Ms_xxyyyz + (M_0*S_xxyyyz + v468 + v529 + v530 + v532 + v533 + 0.0303030303030303d0*( &
      31.0d0*M_xxyyyz + v502 + v512 + 43.0d0*(v471 + v504) + 95.0d0*( &
      v480 + v506) + 99.0d0*(v481 + v508) + 47.0d0*(v482 + v511) + &
      79.0d0*(v483 + v496) + 103.0d0*(v485 + v498) + 55.0d0*(v487 + &
      v500) + 152.0d0*(v489 + v491) + 88.0d0*(v490 + v494) + 10.0d0*( &
      v472 + v476 + v492 + v493) + 13.0d0*(v473 + v474 + v507 + v510) - &
      (M_xxxxyz + 18.0d0*v469 + 10.0d0*v470 + v475 + 18.0d0*v477 + &
      18.0d0*v478 + 10.0d0*v479 + 10.0d0*v484 + 10.0d0*v486 + 18.0d0* &
      v488 + v495 + 7.0d0*v497 + 4.0d0*v499 + v501 + 7.0d0*v503 + 4.0d0 &
      *v505 + v509)))
    S_xxyyzz    = -(S_xxxxyy + S_xxyyyy)
    v544        = M_x*S_xxyyzz
    v664        = M_y*S_xxyyzz
    v795        = M_z*S_xxyyzz
    v796        = -1.22377622377622d0*v795
    v1079       = -0.244755244755245d0*v795
    v1134       = M_xx*S_xxyyzz
    v1257       = M_yy*S_xxyyzz
    v1326       = M_xy*S_xxyyzz
    v1637       = M_xz*S_xxyyzz
    v1715       = M_yz*S_xxyyzz
    S_xxyzzz    = -(S_xxxxyz + S_xxyyyz)
    v672        = M_z*S_xxyzzz
    v877        = M_y*S_xxyzzz
    v878        = 0.0699300699300699d0*v877
    v947        = M_x*S_xxyzzz
    v1301       = M_yz*S_xxyzzz
    v1336       = M_xz*S_xxyzzz
    v1596       = M_xy*S_xxyzzz
    v1728       = M_xx*S_xxyzzz
    v1838       = M_yy*S_xxyzzz
    S_xxzzzz    = -(S_xxxxzz + S_xxyyzz)
    v545        = M_x*S_xxzzzz
    v665        = M_y*S_xxzzzz
    v797        = M_z*S_xxzzzz
    v798        = 0.0815850815850816d0*v797
    v1080       = 0.0163170163170163d0*v797
    v1135       = M_xx*S_xxzzzz
    v1258       = M_yy*S_xxzzzz
    v1327       = M_xy*S_xxzzzz
    v1638       = M_xz*S_xxzzzz
    v1716       = M_yz*S_xxzzzz
    S_xyyyyy    = v0*v534
    v630        = M_y*S_xyyyyy
    v681        = M_x*S_xyyyyy
    v1041       = M_z*S_xyyyyy
    v1221       = M_xy*S_xyyyyy
    v1361       = M_xx*S_xyyyyy
    v1474       = M_yy*S_xyyyyy
    v1682       = M_yz*S_xyyyyy
    v1828       = M_xz*S_xyyyyy
    Ms_xyyyyy   = Ms_xyyyyy + (M_0*S_xyyyyy - M_z*v528 + v340 - v531*z + 0.0303030303030303d0*(-70.0d0* &
      (v342 + v356) + 20.0d0*(v351 + v372) - 10.0d0*(v352 + v370) - &
      60.0d0*(v516 + v517) + 28.0d0*(M_xyyyyy + v343 + v376) + 100.0d0* &
      (v360 + v364 + v371 + v375) + 190.0d0*(v361 + v363 + v373 + v374 &
      ) - 140.0d0*(v365 + v367 + v377 + v379) - 5.0d0*(M_xxxxxy + v341 &
      + v347 + v348 + v349 + v359 + v369) + 40.0d0*(v344 - v345 + v346 &
      + v350 + v355 + v357 + v358 - v362 + v366 + v368)))
    S_xyyyyz    = v1*(0.0909090909090909d0*(-6.0d0*v106) + v105 + v444)
    v656        = M_z*S_xyyyyz
    v805        = M_x*S_xyyyyz
    v1027       = M_y*S_xyyyyz
    v1243       = M_xz*S_xyyyyz
    v1500       = M_yz*S_xyyyyz
    v1515       = M_xx*S_xyyyyz
    v1650       = M_yy*S_xyyyyz
    v1806       = M_xy*S_xyyyyz
    Ms_xyyyyz   = Ms_xyyyyz + (M_0*S_xyyyyz + v520 + 0.0303030303030303d0*(8.0d0*(v386 + v396) + 40.0d0 &
      *(v389 + v430) + 26.0d0*(v394 + v437) + 32.0d0*(M_xyyyyz + v384 + &
      v429) + 4.0d0*(v387 + v397 + v413 + v425) + 170.0d0*(v410 + v414 &
      + v426 + v431) + 160.0d0*(v411 + v418 + v427 + v435) + 96.0d0*( &
      v521 + v522 + v523 + v524) + 64.0d0*(v393 + v412 + v422 + v428 + &
      v434 + v439) - (2.0d0*M_xxxyyz + v381 + 38.0d0*v382 + 13.0d0*v390 &
      + 5.0d0*v391 + v392 + 18.0d0*v401 + 38.0d0*v402 + 64.0d0*v403 + &
      40.0d0*v405 + 64.0d0*v408 + 40.0d0*v409 + 13.0d0*v419 + 18.0d0* &
      v420 + 5.0d0*v436)))
    S_xyyyzz    = -(S_xxxyyy + S_xyyyyy)
    v631        = M_y*S_xyyyzz
    v682        = M_x*S_xyyyzz
    v984        = M_z*S_xyyyzz
    v1108       = M_xy*S_xyyyzz
    v1362       = M_xx*S_xyyyzz
    v1475       = M_yy*S_xyyyzz
    v1683       = M_yz*S_xyyyzz
    v1829       = M_xz*S_xyyyzz
    S_xyyzzz    = -(S_xxxyyz + S_xyyyyz)
    v657        = M_z*S_xyyzzz
    v806        = M_x*S_xyyzzz
    v974        = M_y*S_xyyzzz
    v1063       = 0.0699300699300699d0*v806
    v1244       = M_xz*S_xyyzzz
    v1346       = M_yz*S_xyyzzz
    v1516       = M_xx*S_xyyzzz
    v1651       = M_yy*S_xyyzzz
    v1807       = M_xy*S_xyyzzz
    S_xyzzzz    = -(S_xxxyzz + S_xyyyzz)
    S_xzzzzz    = -(S_xxxzzz + S_xyyzzz)
    S_yyyyyy    = v247 + v535 + 0.0909090909090909d0*(-15.0d0*v525 + 5.0d0*v527)
    v546        = M_x*S_yyyyyy
    v750        = M_y*S_yyyyyy
    v927        = M_z*S_yyyyyy
    v1136       = M_xx*S_yyyyyy
    v1432       = M_xy*S_yyyyyy
    v1639       = M_xz*S_yyyyyy
    v1702       = M_yy*S_yyyyyy
    v1882       = M_yz*S_yyyyyy
    Ms_yyyyyy   = Ms_yyyyyy + (M_0*S_yyyyyy + v259 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v281 - &
      2340.0d0*v293 + 2360.0d0*v308 - 2260.0d0*v314 - 160.0d0*(v270 + &
      v288) - 120.0d0*(v271 + v292) + 576.0d0*(v300 + v311) + 1620.0d0* &
      (v305 + v310) + 840.0d0*(v449 + v451) + 90.0d0*(-M_yyyyzz + v284 &
      + v303) - 600.0d0*(v263 + v294 + v312 + v319) + 720.0d0*(v266 + &
      v282 + v283 + v307) + 360.0d0*(v268 - v285 - v298 + v309) - &
      1680.0d0*(v447 + v448 + v452 + v454) - 165.0d0*(v273 + v290 + &
      v302 + v304 + v306 + v316) - 180.0d0*(M_xxyyyy + v275 + v287 + &
      v297 + v299 + v301 + v313) + 30.0d0*(v260 + v262 + v264 + v274 + &
      v276 + v280 + v295 + v318) + 60.0d0*(v261 - v265 - v267 - v269 - &
      v272 + v278 - v289 - v315)))
    S_yyyyyz    = v2*v534
    v785        = M_z*S_yyyyyz
    v879        = M_y*S_yyyyyz
    v988        = M_x*S_yyyyyz
    v1302       = M_yz*S_yyyyyz
    v1463       = M_xz*S_yyyyyz
    v1597       = M_xy*S_yyyyyz
    v1729       = M_xx*S_yyyyyz
    v1839       = M_yy*S_yyyyyz
    Ms_yyyyyz   = Ms_yyyyyz + (M_0*S_yyyyyz + M_yyy*v536 + M_yyz*v537 - v529 - v530 - v532 - v533 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 80.0d0*(v471 + v504) + &
      160.0d0*(v480 + v506) + 90.0d0*(v481 + v508) - 140.0d0*(v489 + &
      v491) + 250.0d0*(v499 + v505) + 220.0d0*(v501 + v509) + 68.0d0*( &
      v502 + v512) + 20.0d0*(v485 + v487 + v498 + v500) + 100.0d0*( &
      -v490 - v494 + v497 + v503) + 10890.0d0*(-M_xxyyyz + v482 - v483 &
      - v496 + v511) + 40.0d0*(v470 - v472 - v476 + v479 + v484 + v486 &
      - v492 - v493) - 5.0d0*(M_xxxxyz + M_xxyzzz + M_yyyzzz + v458 + &
      v459 + v460 + v463 + v475 + v495) - 25.0d0*(v456 + v457 + v461 + &
      v462 + v464 + v465 + v466 + v467 + v473 + v474 + v507 + v510)))
    S_yyyyzz    = -(S_xxyyyy + S_yyyyyy)
    v547        = M_x*S_yyyyzz
    v751        = M_y*S_yyyyzz
    v752        = 0.104895104895105d0*v751
    v928        = M_z*S_yyyyzz
    v929        = 0.174825174825175d0*v928
    v1137       = M_xx*S_yyyyzz
    v1259       = M_yy*S_yyyyzz
    v1433       = M_xy*S_yyyyzz
    v1640       = M_xz*S_yyyyzz
    v1883       = M_yz*S_yyyyzz
    S_yyyzzz    = -(S_xxyyyz + S_yyyyyz)
    v673        = M_z*S_yyyzzz
    v880        = M_y*S_yyyzzz
    v881        = 0.0699300699300699d0*v880
    v948        = M_x*S_yyyzzz
    v985        = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 5.0d0*(-3.0d0*M_xxxyzzz - &
      3.0d0*M_xyyyzzz - 3.0d0*v947 - 3.0d0*v948 + 12.0d0*v949 + 14.0d0* &
      v950 + 12.0d0*v951 - 15.0d0*v952 - 15.0d0*v953 - 3.0d0*v954 - &
      54.0d0*v955 - 114.0d0*v956 - 15.0d0*v957 - 3.0d0*v958 - 15.0d0* &
      v959 - 3.0d0*v960 - 114.0d0*v961 - 3.0d0*v962 - 3.0d0*v963 + &
      12.0d0*v964 - 15.0d0*v965 - 15.0d0*v966 - 3.0d0*v967 - 54.0d0* &
      v968 - 15.0d0*v969 - 15.0d0*v970 - 15.0d0*v971 - 15.0d0*v972 - &
      3.0d0*v973 - 3.0d0*v974 + 12.0d0*v975 - 15.0d0*v976 - 3.0d0*v977 &
      - 15.0d0*v978 - 3.0d0*v979 - 15.0d0*v980 - 15.0d0*v981 + 14.0d0* &
      v982 - 15.0d0*v983 - 15.0d0*v984))
    v1303       = M_yz*S_yyyzzz
    v1337       = M_xz*S_yyyzzz
    v1598       = M_xy*S_yyyzzz
    v1730       = M_xx*S_yyyzzz
    v1840       = M_yy*S_yyyzzz
    S_yyzzzz    = -(S_xxyyzz + S_yyyyzz)
    v548        = M_x*S_yyzzzz
    v666        = M_y*S_yyzzzz
    v674        = 0.00233100233100233d0*(5.0d0*(v1917 - 15.0d0*v660 + 6.0d0*v661 + 6.0d0* &
      v662 + v663 - 15.0d0*v664 + v665 + v666 + 6.0d0*v667 + 6.0d0*v668 &
      + v669 + 6.0d0*v670 + 6.0d0*v671 + 6.0d0*v672 + 6.0d0*v673))
    v799        = M_z*S_yyzzzz
    v800        = 0.0815850815850816d0*v799
    v934        = 0.00233100233100233d0*(5.0d0*(v1916 - 15.0d0*v544 + v545 + v548 + 6.0d0* &
      v582 - 15.0d0*v590 + 6.0d0*v597 + v598 + 6.0d0*v620 + 6.0d0*v624 &
      + 6.0d0*v626 + 6.0d0*v650 + v651 + 6.0d0*v655 + 6.0d0*v657))
    v1081       = 0.0163170163170163d0*v799
    v1926       = v1059 + v1060 + v1061 + v1068 + v1069 + v1076 + v1079 + v1080 + v1081
    v1138       = M_xx*S_yyzzzz
    v1260       = M_yy*S_yyzzzz
    v1328       = M_xy*S_yyzzzz
    v1641       = M_xz*S_yyzzzz
    v1717       = M_yz*S_yyzzzz
    S_yzzzzz    = -(S_xxyzzz + S_yyyzzz)
    S_zzzzzz    = -(S_xxzzzz + S_yyzzzz)
    S_xxxxxxx   = x*(v245 + v538 + 0.00699300699300699d0*(-231.0d0*v248 + 105.0d0*v249))
    v1122       = M_x*S_xxxxxxx
    v1464       = M_y*S_xxxxxxx
    v1684       = M_z*S_xxxxxxx
    Ms_xxxxxxx  = Ms_xxxxxxx + (M_0*S_xxxxxxx + v539 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*(v540 + v563) - 1260.0d0*(v541 + v567) - 630.0d0*(v542 + &
      v569) + 3444.0d0*(v549 + v561) - 1050.0d0*(v550 + v572) + &
      6860.0d0*(v554 + v559) + 1470.0d0*(v555 + v585) - 7980.0d0*(v570 &
      + v583) + 1680.0d0*(v573 + v633) - 7420.0d0*(v578 + v593) + &
      5040.0d0*(v586 + v605) + 5880.0d0*(v591 + v621) + 70.0d0*( &
      M_xyyyyyy + v546 + v642) + 105.0d0*(-M_xxxyyyy + M_xyyyyzz + v547 &
      + v644) - 525.0d0*(v543 + v544 + v588 + v590) + 2520.0d0*(v560 + &
      v576 + v604 + v652) - 1176.0d0*(v564 + v565 + v627 + v653) - &
      4200.0d0*(v566 + v568 + v599 + v622) - 280.0d0*(v579 + v594 + &
      v616 + v646) - 1120.0d0*(v610 + v617 + v638 + v647) + 35.0d0*( &
      M_xxxzzzz + M_xyyzzzz + v545 + v548 + v598 + v651) - 1155.0d0*( &
      v551 + v552 + v553 + v580 + v611 + v618) - 735.0d0*(v556 + v557 + &
      v558 + v595 + v639 + v648) + 840.0d0*(v562 - v571 - v584 - v609 + &
      v632 - v637) + 420.0d0*(-M_xxxxxyy + v574 + v575 - v581 + v587 + &
      v589 - v596 + v600 - v606 - v607 - v608 - v612 - v619 + v623 + &
      v628 - v634 - v635 - v636 - v640 - v649 + v654) + 210.0d0*( &
      -M_xxxxxzz + v577 + v582 + v592 + v597 + v601 + v602 + v603 + &
      v613 + v614 + v615 + v620 + v624 + v625 + v626 + v629 + v630 + &
      v631 + v641 + v643 + v645 + v650 + v655 + v656 + v657)))
    S_xxxxxxy   = v659*y
    v1245       = M_y*S_xxxxxxy
    v1351       = M_x*S_xxxxxxy
    v1884       = M_z*S_xxxxxxy
    Ms_xxxxxxy  = Ms_xxxxxxy + (M_0*S_xxxxxxy + v674 - v675 + v676 + v677 + v752 + v771 + &
      0.00233100233100233d0*(-105.0d0*M_xxyyyyy + 10.0d0*M_yyyyyyy + &
      150.0d0*(v684 + v716) + 4640.0d0*(v688 + v701) - 1200.0d0*(v697 + &
      v747) - 120.0d0*(v700 + v748) - 3870.0d0*(v710 + v714) - 315.0d0* &
      (v712 + v763) + 840.0d0*(v715 + v759) + 1020.0d0*(v717 + v754) - &
      45.0d0*(v718 + v749) + 1140.0d0*(v720 + v781) - 3940.0d0*(v721 + &
      v725) + 1040.0d0*(v722 + v776) - 220.0d0*(v761 + v764) - 160.0d0* &
      (v773 + v777) + 304.0d0*(M_xxxxxxy + v693 + v746) + 1344.0d0*( &
      v678 + v692 + v694 + v729) - 2880.0d0*(v705 + v707 + v743 + v745 &
      ) + 40.0d0*(-v726 + v750 + v767 - v772) + 480.0d0*(-v679 + v691 - &
      v696 - v704 - v753 + v758) + 3360.0d0*(v683 + v690 + v695 - v703 &
      + v709 - v730) + 960.0d0*(v689 - v698 - v699 + v736 - v780 - v783 &
      ) + 1920.0d0*(-v702 - v734 + v735 + v737 + v741 + v744) + 60.0d0* &
      (v719 - v728 - v760 - v762 - v779 + v784) - 195.0d0*(v685 + v686 &
      + v687 + v711 + v713 + v723 + v727 + v765 + v774 + v778) + 30.0d0 &
      *(-v724 - v755 - v756 - v757 - v766 + v768 + v769 - v775 + v782 + &
      v785) - 240.0d0*(M_xxxxyyy + v680 + v681 + v682 + v706 + v708 + &
      v731 + v732 + v733 + v738 + v739 + v740 + v742)))
    S_xxxxxxz   = v659*z
    v1304       = M_z*S_xxxxxxz
    v1503       = M_x*S_xxxxxxz
    v1830       = M_y*S_xxxxxxz
    Ms_xxxxxxz  = Ms_xxxxxxz + (M_0*S_xxxxxxz + v1932 + v786 + v787 + v788 + v790 + v792 + v794 + v796 + &
      v798 + v800 + v801 - v821 + v846 + v848 + v878 + v881 + v899 + &
      v903 + v905 + v918 + v921 - v924 + v929 + 0.00233100233100233d0*( &
      304.0d0*M_xxxxxxz - 105.0d0*M_xxyyyyz + 10.0d0*M_yyyyyyz + &
      1344.0d0*(v802 + v818) + 4320.0d0*(v807 + v823) + 7520.0d0*(v812 &
      + v830) + 6720.0d0*(v814 + v849) + 3264.0d0*(v816 + v870) + &
      784.0d0*(v817 + v922) + 1440.0d0*(v824 + v882) - 600.0d0*(v825 + &
      v925) - 4800.0d0*(v826 + v868) - 2880.0d0*(v829 + v858) + &
      3840.0d0*(v831 + v859) - 5100.0d0*(v834 + v843) + 2970.0d0*(v836 &
      + v850) + 1080.0d0*(v837 + v907) - 780.0d0*(v838 + v916) - &
      555.0d0*(v839 + v926) + 900.0d0*(v842 + v883) - 735.0d0*(v852 + &
      v890) + 30.0d0*(v879 + v894) - 160.0d0*(v889 + v901) + 150.0d0*( &
      v892 + v919) + 40.0d0*(v893 + v927) - 120.0d0*(M_xxxxzzz + v835 + &
      v900) + 960.0d0*(v813 - v822 + v864 - v875) + 60.0d0*(v840 + v876 &
      + v891 + v909) - 775.0d0*(v851 + v853 + v854 + v911) - 100.0d0*( &
      v855 + v908 + v910 + v912) + 480.0d0*(-v803 + v815 + v827 - v828 &
      + v871 + v906) + 90.0d0*(v808 + v841 - v857 - v884 - v887 - v914 &
      ) - 225.0d0*(v809 + v810 + v811 + v856 + v895 + v913) + 1920.0d0* &
      (-v819 + v860 - v861 + v865 - v869 - v915) - 240.0d0*(M_xxxxyyz + &
      v804 + v805 + v806 + v833 + v863 + v867) - 1200.0d0*(v832 + v844 &
      + v862 + v866 + v872 + v873 + v874 + v888)))
    S_xxxxxyy   = x*(0.00699300699300699d0*(10.0d0*v249) + v1924 + v443 + v5*v931 + v930)
    v1123       = M_x*S_xxxxxyy
    v1465       = M_y*S_xxxxxyy
    v1685       = M_z*S_xxxxxyy
    Ms_xxxxxyy  = Ms_xxxxxyy + (M_0*S_xxxxxyy + v934 - v935 + v936 - v937 - v938 + v940 + v942 + v944 + &
      v946 + 0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0* &
      M_xxxxxyy - 116.0d0*(v540 + v563) + 1350.0d0*(v541 + v567) - &
      210.0d0*(v549 + v561) + 2550.0d0*(v550 + v572) - 190.0d0*(v554 + &
      v559) + 2730.0d0*(v555 + v585) + 1620.0d0*(v560 + v604) + 444.0d0 &
      *(v562 + v632) + 732.0d0*(v564 + v627) - 36.0d0*(v565 + v653) + &
      2820.0d0*(v566 + v599) + 5160.0d0*(v570 + v583) - 420.0d0*(v571 + &
      v637) - 1110.0d0*(v573 + v633) - 780.0d0*(v574 + v628) - 600.0d0* &
      (v575 + v654) - 1080.0d0*(v576 + v652) - 100.0d0*(v578 + v593) - &
      700.0d0*(v579 + v646) - 1380.0d0*(v584 + v609) - 2790.0d0*(v586 + &
      v605) - 1740.0d0*(v587 + v600) - 1560.0d0*(v589 + v623) - &
      2760.0d0*(v591 + v621) - 1660.0d0*(v594 + v616) - 35.0d0*( &
      M_xyyyyyy + v546 + v642) + 255.0d0*(v607 + v612 + v635 + v640) + &
      560.0d0*(v610 + v617 + v638 + v647) - 120.0d0*(v543 + v551 + v553 &
      + v580 + v588 + v618) + 90.0d0*(-M_xxxyyyy - v556 + v557 - v558 - &
      v595 + v639 - v648) + 30.0d0*(-M_xyyyyzz - v547 + v614 + v625 + &
      v643 - v644 + v656) - 105.0d0*(v581 + v596 + v606 + v608 + v619 + &
      v634 + v636 + v649) + 60.0d0*(v552 - v568 - v577 - v592 - v601 - &
      v602 - v603 + v611 - v613 - v615 - v622 - v629 - v630 - v631 - &
      v641 - v645)))
    S_xxxxxyz   = v3*(-v932 + v38 + v931)
    v1501       = M_z*S_xxxxxyz
    v1642       = M_y*S_xxxxxyz
    v1721       = M_x*S_xxxxxyz
    Ms_xxxxxyz  = Ms_xxxxxyz + (M_0*S_xxxxxyz + M_xxyz*v404 + S_xxyz*v388 + v985 + 0.00699300699300699d0 &
      *(-250.0d0*(v1000 + v1026) + 390.0d0*(v1006 + v1023) - 30.0d0*( &
      v1007 + v987) - 270.0d0*(v1038 + v999) + 1430.0d0*(M_xxxy*S_xxz + &
      M_xxz*S_xxxy) + 128.0d0*(M_xxxxxyz + v1025 + v994) + 1110.0d0*( &
      v1001 + v1002 + v1004 + v989) + 280.0d0*(v1003 + v1029 - v1036 - &
      v998) + 600.0d0*(-v1005 + v1009 + v1014 - v1019) + 60.0d0*(v1008 &
      + v1012 + v1034 + v990) + 480.0d0*(v1010 + v986 + v996 + v997) + &
      120.0d0*(v1013 + v1018 + v1028 + v1035) - 195.0d0*(v1015 + v1021 &
      + v1030 + v1039) - 75.0d0*(v1016 + v1024 + v1031 + v1041) + &
      960.0d0*(v1020 + v1022 + v991 + v995) + 288.0d0*(v1037 + v1040 + &
      v992 + v993) - 15.0d0*(M_xyyyyyz + v1011 + v1017 + v1027 + v1032 &
      + v1033 + v988)))
    S_xxxxxzz   = -(S_xxxxxxx + S_xxxxxyy)
    v1124       = M_x*S_xxxxxzz
    v1466       = M_y*S_xxxxxzz
    v1686       = M_z*S_xxxxxzz
    S_xxxxyyy   = y*(v1046 + v1925 + 0.00699300699300699d0*(-33.0d0*v248 + 18.0d0*v249))
    v1246       = M_y*S_xxxxyyy
    v1352       = M_x*S_xxxxyyy
    v1885       = M_z*S_xxxxyyy
    Ms_xxxxyyy  = Ms_xxxxyyy + (M_0*S_xxxxyyy + v1048 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v663 + v665 + v666 + v669 + 380.0d0*(v679 &
      + v704) + 630.0d0*(v684 + v716) + 560.0d0*(v689 + v736) + 200.0d0 &
      *(v691 + v758) + 420.0d0*(v696 + v753) + 330.0d0*(v697 + v747) + &
      1320.0d0*(v702 + v734) + 1140.0d0*(v703 + v730) + 1710.0d0*(v710 &
      + v714) + 9.0d0*(v756 + v766) + 25.0d0*(v761 + v764) + 30.0d0*( &
      v769 + v782) + 40.0d0*(v773 + v777) + 6.0d0*(v661 + v662 + v667 + &
      v668 + v670 + v671 + v672 + v673 + v768 + v785) - (16.0d0* &
      M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + M_yyyyyyy + &
      143.0d0*v1049 + 143.0d0*v1050 + 240.0d0*v1051 + 143.0d0*v1052 + &
      143.0d0*v1053 + 240.0d0*v1054 + 15.0d0*v660 + 15.0d0*v664 + &
      96.0d0*v678 + 30.0d0*v680 + 30.0d0*v681 + 30.0d0*v682 + 150.0d0* &
      v683 + 30.0d0*v685 + 18.0d0*v686 + 30.0d0*v687 + 140.0d0*v688 + &
      150.0d0*v690 + 96.0d0*v692 + 16.0d0*v693 + 96.0d0*v694 + 150.0d0* &
      v695 + 60.0d0*v698 + 60.0d0*v699 + 15.0d0*v700 + 140.0d0*v701 + &
      30.0d0*v706 + 30.0d0*v708 + 150.0d0*v709 + 30.0d0*v711 + 150.0d0* &
      v712 + 30.0d0*v713 + 270.0d0*v715 + 270.0d0*v717 + 150.0d0*v718 + &
      120.0d0*v719 + 240.0d0*v720 + 140.0d0*v721 + 260.0d0*v722 + &
      30.0d0*v723 + 15.0d0*v724 + 140.0d0*v725 + 140.0d0*v726 + 30.0d0* &
      v727 + 15.0d0*v728 + 96.0d0*v729 + 30.0d0*v731 + 270.0d0*v732 + &
      30.0d0*v733 + 480.0d0*v735 + 480.0d0*v737 + 270.0d0*v738 + 30.0d0 &
      *v739 + 30.0d0*v740 + 480.0d0*v741 + 30.0d0*v742 + 480.0d0*v744 + &
      16.0d0*v746 + 15.0d0*v748 + 150.0d0*v749 + v750 + 270.0d0*v754 + &
      15.0d0*v755 + 15.0d0*v757 + 270.0d0*v759 + 15.0d0*v760 + 15.0d0* &
      v762 + 150.0d0*v763 + 18.0d0*v765 + v767 + 140.0d0*v772 + 30.0d0* &
      v774 + 15.0d0*v775 + 260.0d0*v776 + 30.0d0*v778 + 15.0d0*v779 + &
      60.0d0*v780 + 240.0d0*v781 + 60.0d0*v783 + 120.0d0*v784)))
    S_xxxxyyz   = z*(0.00699300699300699d0*(6.0d0*v249) + v1055 + v1925 + v930)
    v1305       = M_z*S_xxxxyyz
    v1504       = M_x*S_xxxxyyz
    v1831       = M_y*S_xxxxyyz
    Ms_xxxxyyz  = Ms_xxxxyyz + (M_0*S_xxxxyyz + v1056 + v1057 - v1058 - v1062 - v1063 - v1064 - v1065 - &
      v1066 + v1067 - v1072 - v1073 - v1074 - v1075 - v1077 + v1078 + &
      v1926 + 0.00233100233100233d0*(-7.0d0*M_yyyyyyz - 6.0d0*M_yyyyzzz &
      - 720.0d0*(v1070 + v1071) + 1260.0d0*(v803 + v828) - 20.0d0*(v812 &
      + v830) + 2160.0d0*(v813 + v864) - 90.0d0*(v814 + v849) + 840.0d0 &
      *(v815 + v906) + 1380.0d0*(v819 + v915) + 690.0d0*(v820 + v923) + &
      780.0d0*(v822 + v875) + 540.0d0*(v824 + v882) + 3720.0d0*(v826 + &
      v868) + 1860.0d0*(v827 + v871) + 2520.0d0*(v829 + v858) + &
      1560.0d0*(v831 + v859) + 4200.0d0*(v834 + v843) - 450.0d0*(v837 + &
      v907) - 270.0d0*(v842 + v883) + 300.0d0*(v844 + v888) + 330.0d0*( &
      v852 + v890) + 570.0d0*(v862 + v873) + 45.0d0*(v885 + v896) + &
      40.0d0*(v889 + v901) - 105.0d0*(v891 + v909) - 132.0d0*(v892 + &
      v919) - 37.0d0*(v893 + v927) - 16.0d0*(M_xxxxxxz + v817 + v922) - &
      96.0d0*(v802 + v816 + v818 + v870) + 2250.0d0*(v808 + v836 + v841 &
      + v850) - 36.0d0*(v809 + v811 + v856 + v913) - 420.0d0*(v835 + &
      v840 + v876 + v900) - 110.0d0*(v851 + v853 + v854 + v911) - &
      65.0d0*(v855 + v908 + v910 + v912) - 27.0d0*(v857 + v884 + v887 + &
      v914) + 480.0d0*(-v860 + v861 - v865 + v869) - 30.0d0*(M_xxyyyyz &
      + v805 + v863 + v898 + v928) + 60.0d0*(v838 - v845 - v902 + v916 &
      - v917 - v920) - 12.0d0*(v847 + v877 + v879 + v880 + v894 + v904 &
      )))
    S_xxxxyzz   = -(S_xxxxxxy + S_xxxxyyy)
    v1112       = M_y*S_xxxxyzz
    v1353       = M_x*S_xxxxyzz
    v1886       = M_z*S_xxxxyzz
    S_xxxxzzz   = -(S_xxxxxxz + S_xxxxyyz)
    v1306       = M_z*S_xxxxzzz
    v1505       = M_x*S_xxxxzzz
    v1832       = M_y*S_xxxxzzz
    S_xxxyyyy   = x*(v1046 + v1927 + 0.00699300699300699d0*(-33.0d0*v525 + 18.0d0*v527))
    v1125       = M_x*S_xxxyyyy
    v1467       = M_y*S_xxxyyyy
    v1687       = M_z*S_xxxyyyy
    Ms_xxxyyyy  = Ms_xxxyyyy + (M_0*S_xxxyyyy + v936 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + v545 + v548 + v598 + v651 + 330.0d0*(v543 &
      + v588) + 9.0d0*(v549 + v561) + 420.0d0*(v552 + v611) + 25.0d0*( &
      v554 + v559) + 200.0d0*(v557 + v639) + 30.0d0*(v568 + v622) + &
      560.0d0*(v571 + v637) + 630.0d0*(v573 + v633) + 380.0d0*(v574 + &
      v628) + 40.0d0*(v578 + v593) + 1320.0d0*(v584 + v609) + 1710.0d0* &
      (v586 + v605) + 1140.0d0*(v587 + v600) + 6.0d0*(v565 + v582 + &
      v597 + v620 + v624 + v626 + v650 + v653 + v655 + v657) - ( &
      M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + v540 + 150.0d0*v541 + 15.0d0*v544 + 16.0d0*v546 + &
      15.0d0*v547 + 270.0d0*v550 + 15.0d0*v551 + 15.0d0*v553 + 270.0d0* &
      v555 + 15.0d0*v556 + 15.0d0*v558 + 150.0d0*v560 + 18.0d0*v562 + &
      v563 + 30.0d0*v564 + 270.0d0*v566 + 150.0d0*v567 + 480.0d0*v570 + &
      270.0d0*v572 + 120.0d0*v575 + 240.0d0*v576 + 30.0d0*v577 + &
      140.0d0*v579 + 15.0d0*v580 + 30.0d0*v581 + 480.0d0*v583 + 270.0d0 &
      *v585 + 240.0d0*v589 + 15.0d0*v590 + 480.0d0*v591 + 30.0d0*v592 + &
      260.0d0*v594 + 15.0d0*v595 + 30.0d0*v596 + 270.0d0*v599 + 30.0d0* &
      v601 + 96.0d0*v602 + 30.0d0*v603 + 150.0d0*v604 + 30.0d0*v606 + &
      150.0d0*v607 + 30.0d0*v608 + 140.0d0*v610 + 150.0d0*v612 + 96.0d0 &
      *v613 + 60.0d0*v614 + 30.0d0*v615 + 260.0d0*v616 + 140.0d0*v617 + &
      15.0d0*v618 + 30.0d0*v619 + 480.0d0*v621 + 240.0d0*v623 + 60.0d0* &
      v625 + 30.0d0*v627 + 30.0d0*v629 + 96.0d0*v630 + 30.0d0*v631 + &
      18.0d0*v632 + 30.0d0*v634 + 150.0d0*v635 + 30.0d0*v636 + 140.0d0* &
      v638 + 150.0d0*v640 + 96.0d0*v641 + 16.0d0*v642 + 60.0d0*v643 + &
      15.0d0*v644 + 30.0d0*v645 + 140.0d0*v646 + 140.0d0*v647 + 15.0d0* &
      v648 + 30.0d0*v649 + 240.0d0*v652 + 120.0d0*v654 + 60.0d0*v656 + &
      143.0d0*v940 + 143.0d0*v942 + 143.0d0*v944 + 143.0d0*v946)))
    S_xxxyyyz   = -v3*0.00699300699300699d0*(-9.0d0*v39 - 143.0d0*v84 + 33.0d0*(v106 + v41 &
      ))
    v1347       = M_z*S_xxxyyyz
    v1643       = M_y*S_xxxyyyz
    v1722       = M_x*S_xxxyyyz
    Ms_xxxyyyz  = Ms_xxxyyyz + (0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*(v950 + v982) + 945.0d0*(v956 + v961) + 345.0d0*(v1000 + &
      v1007 + v1026 + v987) + 245.0d0*(v1003 + v1029 + v1034 + v990) + &
      525.0d0*(v1009 + v1014 + v1036 + v998) + 1125.0d0*(v1005 + v1008 &
      + v1012 + v1019 + v955 + v968) - 60.0d0*(v1001 + v1002 + v1004 + &
      v1013 + v1018 + v1028 + v1035 + v989) + 465.0d0*(v1006 + v1023 + &
      v1038 + v949 + v951 + v964 + v975 + v999) - 75.0d0*(v1010 + v1011 &
      + v1017 + v1027 + v1033 + v986 + v996 + v997) + 15.0d0*(v1015 + &
      v1020 + v1021 + v1022 + v1030 + v1039 + v991 + v995) + 21.0d0*( &
      v1016 + v1024 + v1031 + v1037 + v1040 + v1041 + v992 + v993) - &
      45.0d0*(v952 + v953 + v957 + v959 + v965 + v966 + v969 + v970 + &
      v971 + v972 + v976 + v978 + v980 + v981 + v983 + v984) - 9.0d0*( &
      M_xxxxxyz + M_xxxyzzz + M_xyyyyyz + M_xyyyzzz + v1025 + v1032 + &
      v947 + v948 + v954 + v958 + v960 + v962 + v963 + v967 + v973 + &
      v974 + v977 + v979 + v988 + v994)))
    S_xxxyyzz   = -(S_xxxxxyy + S_xxxyyyy)
    v1126       = M_x*S_xxxyyzz
    v1468       = M_y*S_xxxyyzz
    v1688       = M_z*S_xxxyyzz
    S_xxxyzzz   = -(S_xxxxxyz + S_xxxyyyz)
    v1348       = M_z*S_xxxyzzz
    v1644       = M_y*S_xxxyzzz
    v1723       = M_x*S_xxxyzzz
    S_xxxzzzz   = -(S_xxxxxzz + S_xxxyyzz)
    v1127       = M_x*S_xxxzzzz
    v1338       = M_y*S_xxxzzzz
    v1689       = M_z*S_xxxzzzz
    S_xxyyyyy   = y*(0.00699300699300699d0*(10.0d0*v527) + v1083 + v1924 + v4*v931 + v526)
    v1247       = M_y*S_xxyyyyy
    v1354       = M_x*S_xxyyyyy
    v1887       = M_z*S_xxyyyyy
    Ms_xxyyyyy  = Ms_xxyyyyy + (M_0*S_xxyyyyy + v1048 + v1049 + v1050 + v1052 + v1053 + v674 - v677 - &
      v752 - v771 + 0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0* &
      M_yyyyyyy - 1080.0d0*(v1051 + v1054) - 780.0d0*(v679 + v704) + &
      732.0d0*(v681 + v739) - 1110.0d0*(v684 + v716) + 444.0d0*(v686 + &
      v765) - 420.0d0*(v689 + v736) - 1380.0d0*(v702 + v734) - 1740.0d0 &
      *(v703 + v730) - 2790.0d0*(v710 + v714) + 1620.0d0*(v712 + v763) &
      + 2730.0d0*(v715 + v759) + 2550.0d0*(v717 + v754) + 1350.0d0*( &
      v718 + v749) - 600.0d0*(v719 + v784) - 1560.0d0*(v720 + v781) - &
      1660.0d0*(v722 + v776) - 700.0d0*(v726 + v772) + 2820.0d0*(v732 + &
      v738) + 5160.0d0*(v735 + v737) - 2760.0d0*(v741 + v744) - 116.0d0 &
      *(v750 + v767) - 210.0d0*(v756 + v766) - 190.0d0*(v761 + v764) - &
      36.0d0*(v768 + v785) - 100.0d0*(v773 + v777) - 35.0d0*(M_xxxxxxy &
      + v693 + v746) + 255.0d0*(v683 + v690 + v695 + v709) + 560.0d0*( &
      v688 + v701 + v721 + v725) - 120.0d0*(v697 + v724 + v747 + v755 + &
      v757 + v775) + 90.0d0*(-M_xxxxyyy + v691 - v728 + v758 - v760 - &
      v762 - v779) + 30.0d0*(-M_xxxxyzz + v698 + v699 - v700 - v748 + &
      v780 + v783) - 105.0d0*(v685 + v687 + v711 + v713 + v723 + v727 + &
      v774 + v778) + 60.0d0*(-v678 - v680 - v682 - v692 - v694 + v696 - &
      v706 - v708 - v729 - v731 - v733 - v740 - v742 + v753 - v769 - &
      v782)))
    S_xxyyyyz   = z*(0.00699300699300699d0*(6.0d0*v527) + v1055 + v1083 + v1927)
    v1307       = M_z*S_xxyyyyz
    v1506       = M_x*S_xxyyyyz
    v1833       = M_y*S_xxyyyyz
    Ms_xxyyyyz  = Ms_xxyyyyz + (M_0*S_xxyyyyz + v1084 + v1926 + v1932 - v801 + v821 - v846 - v848 - v878 &
      - v881 - v899 - v903 - v905 - v918 - v921 + v924 - v929 + &
      0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0*M_xxxxzzz + &
      2520.0d0*(v1070 + v1071) + 780.0d0*(v805 + v863) + 45.0d0*(v807 + &
      v823) - 270.0d0*(v808 + v841) + 540.0d0*(v810 + v895) + 40.0d0*( &
      v812 + v830) + 300.0d0*(v813 + v864) - 105.0d0*(v814 + v849) + &
      330.0d0*(v815 + v906) - 132.0d0*(v816 + v870) - 37.0d0*(v817 + &
      v922) + 570.0d0*(v819 + v915) - 720.0d0*(v829 + v858) + 1560.0d0* &
      (v835 + v900) - 450.0d0*(v836 + v850) + 1860.0d0*(v838 + v916) + &
      690.0d0*(v839 + v926) + 1260.0d0*(v840 + v876) + 2160.0d0*(v844 + &
      v888) + 840.0d0*(v852 + v890) + 4200.0d0*(v860 + v865) + 3720.0d0 &
      *(v861 + v869) + 1380.0d0*(v862 + v873) - 20.0d0*(v889 + v901) - &
      90.0d0*(v891 + v909) - 16.0d0*(M_yyyyyyz + v893 + v927) - 420.0d0 &
      *(v803 + v828 + v831 + v859) - 27.0d0*(v809 + v811 + v856 + v913 &
      ) + 480.0d0*(v826 - v834 - v843 + v868) + 2250.0d0*(v837 + v842 + &
      v883 + v907) - 65.0d0*(v851 + v853 + v854 + v911) - 110.0d0*(v855 &
      + v908 + v910 + v912) - 36.0d0*(v857 + v884 + v887 + v914) - &
      96.0d0*(v879 + v892 + v894 + v919) - 30.0d0*(M_xxxxyyz + v822 + &
      v825 + v875 + v925) - 12.0d0*(v802 + v804 + v806 + v818 + v833 + &
      v867) + 60.0d0*(v827 - v832 - v866 + v871 - v872 - v874)))
    S_xxyyyzz   = -(S_xxxxyyy + S_xxyyyyy)
    v1248       = M_y*S_xxyyyzz
    v1355       = M_x*S_xxyyyzz
    v1888       = M_z*S_xxyyyzz
    S_xxyyzzz   = -(S_xxxxyyz + S_xxyyyyz)
    v1118       = M_z*S_xxyyzzz
    v1507       = M_x*S_xxyyzzz
    v1709       = M_y*S_xxyyzzz
    S_xxyzzzz   = -(S_xxxxyzz + S_xxyyyzz)
    v1249       = M_y*S_xxyzzzz
    v1312       = M_x*S_xxyzzzz
    v1718       = M_z*S_xxyzzzz
    S_xxzzzzz   = -(S_xxxxzzz + S_xxyyzzz)
    v1119       = M_z*S_xxzzzzz
    v1508       = M_x*S_xxzzzzz
    v1710       = M_y*S_xxzzzzz
    S_xyyyyyy   = v1085*x
    v1128       = M_x*S_xyyyyyy
    v1469       = M_y*S_xyyyyyy
    v1690       = M_z*S_xyyyyyy
    Ms_xyyyyyy  = Ms_xyyyyyy + (M_0*S_xyyyyyy - v1086 + v539 + v934 + v935 + v937 + v938 + &
      0.00233100233100233d0*(10.0d0*M_xxxxxxx - 105.0d0*M_xxxxxyy - &
      45.0d0*(v541 + v567) - 1200.0d0*(v543 + v588) - 120.0d0*(v547 + &
      v644) + 1020.0d0*(v550 + v572) - 220.0d0*(v554 + v559) + 840.0d0* &
      (v555 + v585) - 315.0d0*(v560 + v604) + 150.0d0*(v573 + v633) - &
      160.0d0*(v578 + v593) - 3870.0d0*(v586 + v605) + 1140.0d0*(v589 + &
      v623) + 1040.0d0*(v594 + v616) + 4640.0d0*(v610 + v638) - &
      3940.0d0*(v617 + v647) + 304.0d0*(M_xyyyyyy + v546 + v642) + &
      40.0d0*(v540 + v563 - v579 - v646) + 1344.0d0*(v602 + v613 + v630 &
      + v641) - 2880.0d0*(v939 + v941 + v943 + v945) + 480.0d0*(-v552 + &
      v557 - v574 - v611 - v628 + v639) + 60.0d0*(-v556 - v558 + v575 - &
      v595 - v648 + v654) + 1920.0d0*(v570 + v583 - v584 + v591 - v609 &
      + v621) + 960.0d0*(v571 - v614 - v625 + v637 - v643 - v656) + &
      3360.0d0*(-v587 - v600 + v607 + v612 + v635 + v640) + 30.0d0*( &
      -v549 - v551 - v553 - v561 + v565 + v568 - v580 - v618 + v622 + &
      v653) - 195.0d0*(v562 + v581 + v596 + v606 + v608 + v619 + v632 + &
      v634 + v636 + v649) - 240.0d0*(M_xxxyyyy + v564 + v566 + v577 + &
      v592 + v599 + v601 + v603 + v615 + v627 + v629 + v631 + v645)))
    S_xyyyyyz   = v3*(0.0769230769230769d0*(-10.0d0*v106) + v105 + v931)
    v1502       = M_z*S_xyyyyyz
    v1645       = M_y*S_xyyyyyz
    v1724       = M_x*S_xyyyyyz
    Ms_xyyyyyz  = Ms_xyyyyyz + (M_0*S_xyyyyyz + M_xyyy*v536 + M_xyyz*v537 + v985 + 0.00699300699300699d0 &
      *(-30.0d0*(v1000 + v1026) - 270.0d0*(v1006 + v1023) - 250.0d0*( &
      v1007 + v987) + 390.0d0*(v1038 + v999) + 1430.0d0*(M_yyy*S_xyyz + &
      M_yyz*S_xyyy) + 128.0d0*(M_xyyyyyz + v1032 + v988) + 120.0d0*( &
      v1001 + v1002 + v1004 + v989) + 60.0d0*(v1003 + v1005 + v1019 + &
      v1029) + 600.0d0*(-v1008 - v1012 + v1036 + v998) + 280.0d0*( &
      -v1009 - v1014 + v1034 + v990) + 480.0d0*(v1011 + v1017 + v1027 + &
      v1033) + 1110.0d0*(v1013 + v1018 + v1028 + v1035) + 960.0d0*( &
      v1015 + v1021 + v1030 + v1039) + 288.0d0*(v1016 + v1024 + v1031 + &
      v1041) - 195.0d0*(v1020 + v1022 + v991 + v995) - 75.0d0*(v1037 + &
      v1040 + v992 + v993) - 15.0d0*(M_xxxxxyz + v1010 + v1025 + v986 + &
      v994 + v996 + v997)))
    S_xyyyyzz   = -(S_xxxyyyy + S_xyyyyyy)
    v1092       = M_x*S_xyyyyzz
    v1470       = M_y*S_xyyyyzz
    v1691       = M_z*S_xyyyyzz
    S_xyyyzzz   = -(S_xxxyyyz + S_xyyyyyz)
    v1349       = M_z*S_xyyyzzz
    v1646       = M_y*S_xyyyzzz
    v1725       = M_x*S_xyyyzzz
    S_xyyzzzz   = -(S_xxxyyzz + S_xyyyyzz)
    v1129       = M_x*S_xyyzzzz
    v1339       = M_y*S_xyyzzzz
    v1692       = M_z*S_xyyzzzz
    S_xyzzzzz   = -(S_xxxyzzz + S_xyyyzzz)
    S_xzzzzzz   = -(S_xxxzzzz + S_xyyzzzz)
    S_yyyyyyy   = y*(0.00699300699300699d0*(-231.0d0*v525 + 105.0d0*v527) + v535 + v538)
    v1250       = M_y*S_yyyyyyy
    v1356       = M_x*S_yyyyyyy
    v1889       = M_z*S_yyyyyyy
    Ms_yyyyyyy  = Ms_yyyyyyy + (M_0*S_yyyyyyy + v676 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      1680.0d0*(v684 + v716) + 5040.0d0*(v710 + v714) + 1470.0d0*(v715 &
      + v759) - 1050.0d0*(v717 + v754) - 1260.0d0*(v718 + v749) - &
      7980.0d0*(v735 + v737) + 5880.0d0*(v741 + v744) + 952.0d0*(v750 + &
      v767) - 630.0d0*(v751 + v770) + 3444.0d0*(v756 + v766) + 6860.0d0 &
      *(v761 + v764) - 7420.0d0*(v773 + v777) + 70.0d0*(M_xxxxxxy + &
      v693 + v746) + 105.0d0*(-M_xxxxyyy + M_xxxxyzz + v700 + v748) + &
      2520.0d0*(v1051 + v1054 + v712 + v763) - 525.0d0*(v660 + v664 + &
      v697 + v747) - 1176.0d0*(v681 + v739 + v768 + v785) - 1120.0d0*( &
      v688 + v701 + v721 + v725) - 280.0d0*(v722 + v726 + v772 + v776) &
      - 4200.0d0*(v732 + v738 + v769 + v782) + 35.0d0*(M_xxyzzzz + &
      M_yyyzzzz + v663 + v665 + v666 + v669) + 840.0d0*(v686 - v689 - &
      v702 - v734 - v736 + v765) - 735.0d0*(v691 + v728 + v758 + v760 + &
      v762 + v779) - 1155.0d0*(v696 + v724 + v753 + v755 + v757 + v775 &
      ) + 420.0d0*(-M_xxyyyyy + v679 - v683 - v685 - v687 - v690 - v695 &
      + v703 + v704 - v709 - v711 - v713 + v719 + v720 - v723 - v727 + &
      v730 - v774 - v778 + v781 + v784) + 210.0d0*(-M_yyyyyzz + v661 + &
      v662 + v667 + v668 + v670 + v671 + v672 + v673 + v678 + v680 + &
      v682 + v692 + v694 + v698 + v699 + v706 + v708 + v729 + v731 + &
      v733 + v740 + v742 + v780 + v783)))
    S_yyyyyyz   = v1085*z
    v1308       = M_z*S_yyyyyyz
    v1509       = M_x*S_yyyyyyz
    v1834       = M_y*S_yyyyyyz
    Ms_yyyyyyz  = Ms_yyyyyyz + (M_0*S_yyyyyyz + v1056 + v1058 + v1062 + v1063 + v1064 + v1065 + v1066 - &
      v1067 + v1072 + v1073 + v1074 + v1075 + v1077 - v1078 + v786 + &
      v787 + v788 + v790 + v792 + v794 + v796 + v798 + v800 + &
      0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0*M_xxxxyyz + &
      304.0d0*M_yyyyyyz - 2880.0d0*(v1070 + v1071) + 30.0d0*(v802 + &
      v818) + 900.0d0*(v808 + v841) + 1440.0d0*(v810 + v895) - 160.0d0* &
      (v812 + v830) - 735.0d0*(v815 + v906) + 150.0d0*(v816 + v870) + &
      40.0d0*(v817 + v922) - 555.0d0*(v820 + v923) - 780.0d0*(v827 + &
      v871) + 3840.0d0*(v835 + v900) + 1080.0d0*(v836 + v850) + &
      2970.0d0*(v837 + v907) - 5100.0d0*(v860 + v865) - 4800.0d0*(v861 &
      + v869) + 1344.0d0*(v879 + v894) + 4320.0d0*(v885 + v896) + &
      7520.0d0*(v889 + v901) + 6720.0d0*(v891 + v909) + 3264.0d0*(v892 &
      + v919) + 784.0d0*(v893 + v927) - 600.0d0*(v898 + v928) - 120.0d0 &
      *(M_yyyyzzz + v831 + v859) + 60.0d0*(v803 + v814 + v828 + v849) + &
      960.0d0*(-v805 + v844 - v863 + v888) - 100.0d0*(v851 + v853 + &
      v854 + v911) - 775.0d0*(v855 + v908 + v910 + v912) + 90.0d0*( &
      -v809 - v811 + v842 - v856 + v883 - v913) - 225.0d0*(v824 + v857 &
      + v882 + v884 + v887 + v914) + 1920.0d0*(-v826 + v834 + v843 - &
      v862 - v868 - v873) + 480.0d0*(v838 - v840 + v852 - v876 + v890 + &
      v916) - 240.0d0*(M_xxyyyyz + v822 + v847 + v875 + v877 + v880 + &
      v904) - 1200.0d0*(v813 + v819 + v845 + v864 + v902 + v915 + v917 &
      + v920)))
    S_yyyyyzz   = -(S_xxyyyyy + S_yyyyyyy)
    v1251       = M_y*S_yyyyyzz
    v1357       = M_x*S_yyyyyzz
    v1890       = M_z*S_yyyyyzz
    S_yyyyzzz   = -(S_xxyyyyz + S_yyyyyyz)
    v1309       = M_z*S_yyyyzzz
    v1510       = M_x*S_yyyyzzz
    v1835       = M_y*S_yyyyzzz
    S_yyyzzzz   = -(S_xxyyyzz + S_yyyyyzz)
    v1252       = M_y*S_yyyzzzz
    v1313       = M_x*S_yyyzzzz
    v1350       = 0.00699300699300699d0*(-35.0d0*M_xxxyyyzz + 7.0d0*(v1312 + v1313 + &
      12.0d0*v1314 + 6.0d0*v1315 - 8.0d0*v1316 + 6.0d0*v1317 + v1318 + &
      228.0d0*v1319 - 15.0d0*v1320 + 208.0d0*v1321 + 6.0d0*v1322 + &
      v1323 + 6.0d0*v1324 + v1325 - 15.0d0*v1326 + v1327 + v1328 + &
      6.0d0*v1329 + 208.0d0*v1330 + 6.0d0*v1331 + v1332 + 228.0d0*v1333 &
      + 6.0d0*v1334 + 6.0d0*v1335 + 6.0d0*v1336 + 6.0d0*v1337 + v1338 + &
      v1339 - 8.0d0*v1340 + 6.0d0*v1341 + v1342 + 6.0d0*v1343 + v1344 + &
      6.0d0*v1345 + 6.0d0*v1346 + 12.0d0*v1347 + 6.0d0*v1348 + 6.0d0* &
      v1349 + v1918))
    v1719       = M_z*S_yyyzzzz
    v1895       = 0.00233100233100233d0*(-45.0d0*M_xxxyyyzz - 464.0d0*(v1314 + v1347) - &
      644.0d0*(v1316 + v1340) - 3096.0d0*(v1319 + v1333) - 135.0d0*( &
      v1320 + v1326) - 3276.0d0*(v1321 + v1330) + 9.0d0*(M_xxxyzzzz + &
      M_xyyyzzzz + v1312 + v1313 + v1318 + v1323 + v1325 + v1327 + &
      v1328 + v1332 + v1338 + v1339 + v1342 + v1344) + 54.0d0*(v1315 + &
      v1317 + v1322 + v1324 + v1329 + v1331 + v1334 + v1335 + v1336 + &
      v1337 + v1341 + v1343 + v1345 + v1346 + v1348 + v1349))
    S_yyzzzzz   = -(S_xxyyzzz + S_yyyyzzz)
    v1120       = M_z*S_yyzzzzz
    v1928       = 28.0d0*M_xxyyzzzz + 168.0d0*(v1101 + v1118) + 70.0d0*(v1103 + v1104 + &
      v1115 + v1116) - (M_xxzzzzzz + M_yyzzzzzz + 8.0d0*v1105 + 8.0d0* &
      v1117 + 8.0d0*v1119 + 8.0d0*v1120)
    v1121       = 0.000777000777000777d0*(33768.0d0*v1098 + 7.0d0*(192.0d0*v1092 - 576.0d0 &
      *v1093 + 192.0d0*v1094 - 1536.0d0*v1095 + 768.0d0*v1096 + 384.0d0 &
      *v1097 - 324.0d0*v1099 - 324.0d0*v1100 - 324.0d0*v1102 + 768.0d0* &
      v1106 + 384.0d0*v1107 + 384.0d0*v1108 - 1536.0d0*v1109 + 192.0d0* &
      v1110 + 384.0d0*v1111 + 192.0d0*v1112 - 576.0d0*v1113 - 324.0d0* &
      v1114 + v1928))
    v1511       = M_x*S_yyzzzzz
    v1697       = 0.000777000777000777d0*(-495.0d0*M_xxxxyyyy - 20124.0d0*v1098 + v1928 + &
      711.0d0*(v1093 + v1113) - 4704.0d0*(v1095 + v1109) - 9528.0d0*( &
      v1096 + v1106) - 402.0d0*(v1092 + v1094 + v1110 + v1112) - &
      804.0d0*(v1097 + v1107 + v1108 + v1111) - 621.0d0*(v1099 + v1100 &
      + v1102 + v1114))
    v1711       = M_y*S_yyzzzzz
    v1720       = 0.00699300699300699d0*(v1708 + v1710 + v1711 + v1714 + v1920 - 105.0d0*( &
      v1704 + v1715) - 21.0d0*(v1705 + v1709) + 7.0d0*(v1706 + v1707 + &
      v1712 + v1713 + v1716 + v1717 + v1718 + v1719))
    v1897       = 0.00699300699300699d0*(v1508 + v1511 + v1593 + v1678 + v1919 - 21.0d0*( &
      v1507 + v1578) - 105.0d0*(v1577 + v1637) + 7.0d0*(v1566 + v1592 + &
      v1627 + v1638 + v1641 + v1677 + v1689 + v1692))
    S_yzzzzzz   = -(S_xxyzzzz + S_yyyzzzz)
    S_zzzzzzz   = -(S_xxzzzzz + S_yyzzzzz)
    S_xxxxxxxx  = a8 + v1088 + 0.000466200466200466d0*(-4004.0d0*v1089 + 2310.0d0*v1090 - &
      420.0d0*v1091)
    Ms_xxxxxxxx = Ms_xxxxxxxx + (M_0*S_xxxxxxxx + v1121 + 0.000155400155400155d0*(1920.0d0*M_xxxxxxxx + &
      3150.0d0*M_xxyyyyzz - 105.0d0*M_yyyyyyyy - 210.0d0*M_yyyyyyzz - &
      140.0d0*M_yyyyzzzz + 183680.0d0*v1144 - 259840.0d0*v1171 - &
      224000.0d0*v1178 + 220640.0d0*v1203 + 5810.0d0*v1268 + 11776.0d0* &
      (v1122 + v1152) + 52416.0d0*(v1130 + v1150) - 36960.0d0*(v1132 + &
      v1168) - 32340.0d0*(v1133 + v1193) - 31500.0d0*(v1134 + v1201) + &
      5460.0d0*(v1137 + v1279) + 134400.0d0*(v1139 + v1148) - &
      188160.0d0*(v1159 + v1184) - 170240.0d0*(v1166 + v1209) - &
      8960.0d0*(v1167 + v1288) + 107520.0d0*(v1173 + v1223) + &
      161280.0d0*(v1177 + v1239) - 17920.0d0*(v1179 + v1233) - 8400.0d0 &
      *(v1185 + v1191) - 7980.0d0*(v1190 + v1266) - 33600.0d0*(v1192 + &
      v1262) - 14280.0d0*(v1194 + v1256) + 7280.0d0*(v1199 + v1210) - &
      38080.0d0*(v1200 + v1289) - 12600.0d0*(v1202 + v1257) - 71680.0d0 &
      *(v1227 + v1234) + 4480.0d0*(v1128 + v1231 + v1283) - 20160.0d0*( &
      v1146 + v1147 + v1214 + v1293) - 17024.0d0*(v1153 + v1154 + v1245 &
      + v1304) - 75264.0d0*(v1155 + v1157 + v1220 + v1240) - 280.0d0*( &
      v1208 + v1249 + v1252 + v1287) + 1890.0d0*(v1215 + v1267 + v1269 &
      + v1294) - 560.0d0*(v1250 + v1273 + v1274 + v1308) + 2100.0d0*( &
      M_xxyyyyyy + v1135 + v1138 + v1218 + v1297) + 2240.0d0*(v1127 + &
      v1129 + v1183 + v1204 + v1238 + v1282) + 53760.0d0*(v1145 + v1149 &
      + v1165 + v1189 + v1222 + v1299) + 10920.0d0*(v1186 + v1187 + &
      v1188 + v1205 + v1270 + v1284) + 5880.0d0*(v1195 + v1196 + v1198 &
      + v1247 + v1248 + v1307) - 1680.0d0*(v1207 + v1275 + v1286 + &
      v1301 + v1302 + v1303) + 8680.0d0*(v1211 + v1212 + v1213 + v1216 &
      + v1277 + v1295) + 6720.0d0*(-M_xxxxxxyy - v1125 - v1126 + v1170 &
      - v1174 - v1176 + v1306) + 1120.0d0*(M_xxxxzzzz + v1217 + v1278 + &
      v1290 + v1291 + v1292 + v1296) - 47040.0d0*(v1131 + v1141 + v1142 &
      + v1143 + v1161 + v1180 + v1228 + v1235) + 840.0d0*(v1219 - v1251 &
      + v1258 + v1259 + v1260 - v1276 + v1280 - v1281 + v1298 - v1309) &
      + 3360.0d0*(-M_xxxxxxzz + v1136 - v1197 + v1206 + v1263 + v1264 + &
      v1265 + v1271 + v1272 + v1285 - v1300) + 26880.0d0*(-v1123 - &
      v1156 - v1160 + v1162 + v1175 - v1181 - v1224 - v1225 - v1226 - &
      v1229 - v1236 + v1241 + v1254 - v1261) + 13440.0d0*(-v1124 - &
      v1140 + v1151 - v1158 + v1163 + v1164 - v1169 - v1172 + v1182 + &
      v1221 + v1230 + v1232 + v1237 + v1242 + v1243 + v1244 + v1246 + &
      v1253 - v1255 + v1305)))
    S_xxxxxxxy  = v0*v1311
    Ms_xxxxxxxy = Ms_xxxxxxxy + (M_0*S_xxxxxxxy + v1350 + 0.0013986013986014d0*(-560.0d0*M_xxxxxyyy - &
      175.0d0*M_xxxyyyyy - 1680.0d0*(v1352 + v1384) - 1190.0d0*(v1359 + &
      v1396) + 2170.0d0*(v1364 + v1415) - 672.0d0*(v1376 + v1471) - &
      2352.0d0*(v1377 + v1465) - 8400.0d0*(v1383 + v1429) - 10290.0d0*( &
      v1390 + v1413) - 1645.0d0*(v1392 + v1481) - 13650.0d0*(v1394 + &
      v1409) + 1400.0d0*(v1395 + v1477) + 2660.0d0*(v1397 + v1472) + &
      245.0d0*(v1398 + v1467) + 3500.0d0*(v1399 + v1499) + 35.0d0*( &
      v1400 + v1468) + 2800.0d0*(v1402 + v1494) - 2205.0d0*(v1411 + &
      v1444) + 5880.0d0*(v1414 + v1440) + 7140.0d0*(v1416 + v1435) + &
      400.0d0*(M_xxxxxxxy + v1373 + v1464) + 70.0d0*(M_xyyyyyyy + v1356 &
      + v1486) + 105.0d0*(M_xyyyyyzz + v1357 + v1488) + 2128.0d0*(v1351 &
      + v1372 + v1374 + v1428) - 840.0d0*(v1353 + v1386 + v1388 + v1430 &
      ) - 735.0d0*(v1354 + v1355 + v1418 + v1420) + 12320.0d0*(v1363 + &
      v1368 + v1381 + v1389) + 3360.0d0*(v1369 - v1382 - v1434 + v1439 &
      ) - 1792.0d0*(v1378 + v1379 + v1498 + v1501) - 11900.0d0*(v1401 + &
      v1405 + v1421 + v1424) - 1540.0d0*(v1442 + v1445 + v1479 + v1482 &
      ) + 1120.0d0*(v1371 - v1453 - v1456 + v1476 - v1491 - v1495) + &
      315.0d0*(-v1417 - v1431 + v1433 + v1451 + v1470 + v1490) + &
      6720.0d0*(v1358 + v1370 + v1375 - v1385 - v1387 + v1408 - v1459 - &
      v1461) + 280.0d0*(-M_xxxxxyzz - v1380 - v1425 + v1432 + v1448 - &
      v1452 - v1466 + v1469 + v1485) - 1365.0d0*(v1360 + v1361 + v1362 &
      + v1403 + v1406 + v1410 + v1412 + v1446 + v1454 + v1457) - &
      805.0d0*(v1365 + v1366 + v1367 + v1391 + v1393 + v1422 + v1426 + &
      v1483 + v1492 + v1496) + 420.0d0*(-v1407 + v1419 - v1427 - v1441 &
      - v1443 - v1458 + v1462 - v1478 - v1480 - v1497) + 210.0d0*( &
      -v1404 - v1423 - v1436 - v1437 - v1438 - v1447 + v1449 + v1450 - &
      v1455 + v1460 + v1463 - v1473 - v1474 - v1475 - v1484 + v1487 + &
      v1489 - v1493 + v1500 + v1502)))
    S_xxxxxxxz  = v1*v1311
    Ms_xxxxxxxz = Ms_xxxxxxxz + (0.0013986013986014d0*(715.0d0*M_0*S_xxxxxxxz + 400.0d0*M_xxxxxxxz - &
      560.0d0*M_xxxxxyyz - 175.0d0*(M_xxxyyyyz + M_xxxyyzzz) + 2128.0d0 &
      *(v1503 + v1528) + 8512.0d0*(v1512 + v1532) - 1610.0d0*(v1513 + &
      v1550) + 19040.0d0*(v1517 + v1539) + 1750.0d0*(v1518 + v1575) + &
      22400.0d0*(v1522 + v1557) + 3360.0d0*(v1523 + v1618) + 14560.0d0* &
      (v1524 + v1583) + 5488.0d0*(v1526 + v1633) + 1072.0d0*(v1527 + &
      v1684) - 4032.0d0*(v1529 + v1679) - 1008.0d0*(v1530 + v1685) - &
      1792.0d0*(v1531 + v1642) + 2912.0d0*(v1533 + v1647) - 1400.0d0*( &
      v1534 + v1686) - 13440.0d0*(v1535 + v1628) - 6720.0d0*(v1538 + &
      v1594) + 10080.0d0*(v1540 + v1599) - 4200.0d0*(v1541 + v1635) - &
      20020.0d0*(v1543 + v1579) + 2870.0d0*(v1545 + v1584) + 3080.0d0*( &
      v1546 + v1669) - 980.0d0*(v1547 + v1680) - 1085.0d0*(v1548 + &
      v1687) + 1820.0d0*(v1551 + v1648) - 875.0d0*(v1552 + v1688) - &
      15540.0d0*(v1553 + v1567) - 3920.0d0*(v1554 + v1652) + 10710.0d0* &
      (v1558 + v1569) - 2345.0d0*(v1560 + v1654) + 7560.0d0*(v1570 + &
      v1619) - 5460.0d0*(v1571 + v1629) - 3885.0d0*(v1572 + v1636) + &
      6300.0d0*(v1576 + v1600) - 3675.0d0*(v1577 + v1637) - 8400.0d0*( &
      v1580 + v1604) - 5145.0d0*(v1586 + v1606) + 70.0d0*(M_xyyyyyyz + &
      v1509 + v1658) + 105.0d0*(M_xyyyyzzz + v1510 + v1663) - 1680.0d0* &
      (v1504 + v1536 + v1537 + v1634) - 735.0d0*(v1506 + v1507 + v1573 &
      + v1578) - 2625.0d0*(v1559 + v1561 + v1588 + v1673) - 5425.0d0*( &
      v1562 + v1585 + v1587 + v1623) + 525.0d0*(v1613 + v1640 + v1662 + &
      v1691) + 280.0d0*(-M_xxxxxzzz + v1609 + v1639 + v1657 + v1690) + &
      35.0d0*(M_xxxzzzzz + M_xyyzzzzz + v1508 + v1511 + v1593 + v1678) &
      - 840.0d0*(v1505 + v1542 + v1544 + v1568 + v1614 + v1664) - &
      1575.0d0*(v1514 + v1515 + v1516 + v1564 + v1611 + v1625) - &
      1015.0d0*(v1519 + v1520 + v1521 + v1590 + v1660 + v1675) + &
      1120.0d0*(v1525 - v1605 - v1615 - v1653 - v1665 + v1668) + &
      420.0d0*(v1549 + v1574 + v1595 + v1607 + v1621 + v1643 + v1655 + &
      v1671) - 700.0d0*(v1563 + v1589 + v1620 + v1622 + v1624 + v1670 + &
      v1672 + v1674) + 245.0d0*(v1566 + v1592 + v1627 + v1638 + v1641 + &
      v1677 + v1689 + v1692) + 1050.0d0*(v1555 + v1581 + v1608 + v1616 &
      + v1630 + v1631 + v1632 + v1656 + v1666 + v1681 + v1682 + v1683) &
      + 210.0d0*(v1556 + v1582 + v1596 + v1597 + v1598 + v1610 + v1617 &
      + v1644 + v1645 + v1646 + v1659 + v1667) - 630.0d0*(v1565 + v1591 &
      + v1601 + v1602 + v1603 + v1612 + v1626 + v1649 + v1650 + v1651 + &
      v1661 + v1676)))
    S_xxxxxxyy  = 0.00512820512820513d0*(-13.0d0*v1089 + 15.0d0*v1090) - v1042*v5 + v1694 &
      - v1695*v4 - v1696 + v245*v5
    Ms_xxxxxxyy = Ms_xxxxxxyy + (M_0*S_xxxxxxyy + v1697 + v1699 + v1701 + 0.000155400155400155d0*( &
      -240.0d0*M_xxxxxxxx + 4800.0d0*M_xxxxxxyy - 120.0d0*M_xxxxxxzz - &
      1125.0d0*M_xxxxyyzz + 115.0d0*M_xxxxzzzz - 1005.0d0*M_xxyyyyyy - &
      900.0d0*M_xxyyyyzz + 75.0d0*M_yyyyyyyy + 105.0d0*M_yyyyyyzz + &
      25.0d0*M_yyyyzzzz - 5440.0d0*v1144 + 142520.0d0*v1171 - 1400.0d0* &
      v1178 - 97720.0d0*v1203 - 3130.0d0*v1268 - 1568.0d0*(v1122 + &
      v1152) + 22080.0d0*(v1123 + v1156) - 480.0d0*(v1124 + v1158) - &
      5190.0d0*(v1125 + v1174) - 2490.0d0*(v1126 + v1176) - 3888.0d0*( &
      v1130 + v1150) + 51870.0d0*(v1131 + v1161) - 2445.0d0*(v1132 + &
      v1168) - 30.0d0*(v1133 + v1193) - 3825.0d0*(v1134 + v1201) - &
      1635.0d0*(v1136 + v1272) - 5280.0d0*(v1139 + v1148) + 70620.0d0*( &
      v1140 + v1172) + 6870.0d0*(v1142 + v1228) + 55470.0d0*(v1145 + &
      v1189) + 24960.0d0*(v1149 + v1222) + 5520.0d0*(v1151 + v1253) + &
      9952.0d0*(v1153 + v1245) - 128.0d0*(v1154 + v1304) + 46272.0d0*( &
      v1155 + v1220) + 192.0d0*(v1157 + v1240) + 107580.0d0*(v1159 + &
      v1184) - 4560.0d0*(v1160 + v1261) - 21540.0d0*(v1162 + v1254) - &
      16620.0d0*(v1163 + v1246) - 11220.0d0*(v1164 + v1305) - 21480.0d0 &
      *(v1165 + v1299) - 380.0d0*(v1166 + v1209) - 13520.0d0*(v1167 + &
      v1288) - 2730.0d0*(v1169 + v1255) + 690.0d0*(v1170 + v1306) - &
      69960.0d0*(v1173 + v1223) - 36840.0d0*(v1175 + v1241) - 69840.0d0 &
      *(v1177 + v1239) - 41440.0d0*(v1179 + v1233) - 52500.0d0*(v1185 + &
      v1191) - 3840.0d0*(v1187 + v1270) + 6015.0d0*(v1190 + v1266) + &
      17700.0d0*(v1192 + v1262) + 9165.0d0*(v1194 + v1256) - 1320.0d0*( &
      v1195 + v1247) + 1110.0d0*(v1196 + v1307) + 12480.0d0*(v1197 + &
      v1300) - 1590.0d0*(v1198 + v1248) - 54040.0d0*(v1199 + v1210) + &
      19940.0d0*(v1200 + v1289) - 2475.0d0*(v1202 + v1257) + 11480.0d0* &
      (v1204 + v1282) + 610.0d0*(v1212 + v1277) - 4020.0d0*(v1221 + &
      v1230) + 16140.0d0*(v1225 + v1229) + 35840.0d0*(v1227 + v1234) + &
      370.0d0*(v1250 + v1273) + 420.0d0*(v1251 + v1276) - 1770.0d0*( &
      v1264 + v1271) + 190.0d0*(v1274 + v1308) - 1010.0d0*(v1278 + &
      v1291) + 150.0d0*(v1281 + v1309) + 90.0d0*(v1702 + v1703) - &
      2240.0d0*(v1128 + v1231 + v1283) + 230.0d0*(v1127 + v1129 + v1183 &
      + v1238) - 3930.0d0*(v1141 + v1143 + v1180 + v1235) - 1845.0d0*( &
      v1146 + v1147 + v1214 + v1293) - 5460.0d0*(v1181 + v1224 + v1226 &
      + v1236) - 2760.0d0*(v1186 + v1188 + v1205 + v1284) - 330.0d0*( &
      v1206 + v1263 + v1265 + v1285) + 50.0d0*(v1208 + v1249 + v1252 + &
      v1287) + 970.0d0*(v1211 + v1213 + v1216 + v1295) - 270.0d0*(v1215 &
      + v1267 + v1269 + v1294) + 430.0d0*(v1217 + v1290 + v1292 + v1296 &
      ) + 165.0d0*(v1219 + v1258 + v1260 + v1298) + 255.0d0*(v1135 + &
      v1138 + v1218 + v1259 + v1280 + v1297) + 300.0d0*(v1207 + v1275 + &
      v1286 + v1301 + v1302 + v1303) + 1380.0d0*(-v1137 + v1182 + v1232 &
      + v1237 + v1242 + v1243 + v1244 - v1279)))
    S_xxxxxxyz  = v2*(0.0769230769230769d0*(3.0d0*v249) + v1043 + v245 - v248)
    Ms_xxxxxxyz = Ms_xxxxxxyz + (M_0*S_xxxxxxyz - M_xyyyy*v399 - S_xyyyy*v416 + v1720 + &
      0.00699300699300699d0*(2.0d0*M_yyyyyyyz + 3.0d0*M_yyyyyzzz - &
      27.0d0*(M_xxyyyyyz + M_xxyyyzzz) - 540.0d0*(v1744 + v1879) - &
      340.0d0*(v1746 + v1831) - 1080.0d0*(v1756 + v1822) + 280.0d0*( &
      v1757 + v1826) - 1000.0d0*(v1759 + v1804) - 1470.0d0*(v1769 + &
      v1783) - 75.0d0*(v1771 + v1856) - 510.0d0*(v1773 + v1786) + &
      990.0d0*(v1775 + v1795) - 345.0d0*(v1777 + v1881) - 141.0d0*( &
      v1778 + v1887) - 135.0d0*(v1782 + v1888) - 465.0d0*(v1788 + v1846 &
      ) - 177.0d0*(v1797 + v1848) + 480.0d0*(v1809 + v1815) + 9.0d0*( &
      v1835 + v1859) - 50.0d0*(v1844 + v1857) + 42.0d0*(v1849 + v1872) &
      + 38.0d0*(v1850 + v1882) + 45.0d0*(v1858 + v1883) + 112.0d0*( &
      M_xxxxxxyz + v1738 + v1830) + 512.0d0*(v1721 + v1740 + v1741 + &
      v1803) + 1500.0d0*(v1726 + v1747 + v1750 + v1768) + 2520.0d0*( &
      v1731 + v1754 + v1760 + v1764) + 2300.0d0*(v1733 + v1742 + v1785 &
      + v1794) + 1152.0d0*(v1735 + v1739 + v1821 + v1825) + 272.0d0*( &
      v1736 + v1737 + v1878 + v1884) + 400.0d0*(-v1743 + v1751 + v1841 &
      - v1869) - 150.0d0*(v1749 + v1752 + v1880 + v1886) + 1120.0d0*( &
      -v1755 + v1765 + v1810 - v1818) + 15.0d0*(-v1779 - v1833 + v1855 &
      + v1890) + 10.0d0*(v1791 + v1866 + v1871 + v1873) - 18.0d0*(v1802 &
      + v1843 + v1845 + v1877) + 8.0d0*(v1834 + v1851 + v1852 + v1889) &
      + 30.0d0*(-M_xxxxyzzz + v1727 - v1753 + v1780 - v1832) + 120.0d0* &
      (-v1722 + v1734 + v1748 - v1758 + v1836 + v1860) - 12.0d0*(v1793 &
      + v1838 + v1839 + v1840 + v1854 + v1868) + 240.0d0*(v1732 + v1761 &
      + v1774 + v1781 + v1808 + v1814 + v1837 + v1861) - 20.0d0*(v1745 &
      + v1800 + v1847 + v1862 + v1863 + v1864 + v1875 + v1885) - &
      185.0d0*(v1787 + v1789 + v1790 + v1796 + v1798 + v1799 + v1865 + &
      v1874) - 51.0d0*(v1728 + v1729 + v1730 + v1770 + v1772 + v1792 + &
      v1801 + v1853 + v1867 + v1876) - 300.0d0*(v1762 + v1766 + v1811 + &
      v1816 + v1819 + v1823 + v1824 + v1827 + v1828 + v1829) + 60.0d0*( &
      -M_xxxxyyyz - v1723 - v1724 - v1725 - v1763 - v1767 + v1776 - &
      v1784 - v1805 - v1806 - v1807 - v1812 - v1813 - v1817 - v1820 - &
      v1842 + v1870)))
    S_xxxxxyyy  = v0*(0.0769230769230769d0*(2.0d0*v249) + v1893 + v1929 + v1933)
    Ms_xxxxxyyy = Ms_xxxxxyyy + (M_0*S_xxxxxyyy + v1895 + 0.000466200466200466d0*(-390.0d0*M_xxxyyyyy + &
      6530.0d0*(v1352 + v1384) - 780.0d0*(v1354 + v1418) - 615.0d0*( &
      v1355 + v1420) + 12990.0d0*(v1359 + v1396) - 600.0d0*(v1361 + &
      v1446) + 15330.0d0*(v1364 + v1415) - 210.0d0*(v1366 + v1483) + &
      10040.0d0*(v1369 + v1439) + 2760.0d0*(v1371 + v1476) + 6132.0d0*( &
      v1376 + v1471) + 4962.0d0*(v1377 + v1465) + 24060.0d0*(v1382 + &
      v1434) + 20550.0d0*(v1383 + v1429) + 40890.0d0*(v1390 + v1413) - &
      2830.0d0*(v1392 + v1481) + 38550.0d0*(v1394 + v1409) - 6450.0d0*( &
      v1395 + v1477) - 6810.0d0*(v1397 + v1472) - 3370.0d0*(v1398 + &
      v1467) - 5400.0d0*(v1399 + v1499) - 285.0d0*(v1400 + v1468) - &
      6300.0d0*(v1402 + v1494) - 16530.0d0*(v1414 + v1440) - 16890.0d0* &
      (v1416 + v1435) - 8160.0d0*(v1417 + v1431) - 6720.0d0*(v1419 + &
      v1462) - 240.0d0*(M_xxxxxxxy + v1373 + v1464) - 195.0d0*( &
      M_xxxxxyzz + v1380 + v1466) - 75.0d0*(M_xyyyyyyy + v1356 + v1486 &
      ) - 30.0d0*(M_xyyyyyzz + v1357 + v1488) - 1488.0d0*(v1351 + v1372 &
      + v1374 + v1428) - 585.0d0*(v1353 + v1386 + v1388 + v1430) - &
      2910.0d0*(v1358 + v1370 + v1375 + v1408) - 2970.0d0*(v1363 + &
      v1368 + v1381 + v1389) - 588.0d0*(v1378 + v1379 + v1498 + v1501) &
      - 1380.0d0*(v1385 + v1387 + v1459 + v1461) - 2100.0d0*(v1401 + &
      v1405 + v1421 + v1424) - 7620.0d0*(v1411 + v1425 + v1444 + v1452 &
      ) - 135.0d0*(v1432 + v1448 + v1469 + v1485) - 90.0d0*(v1433 + &
      v1451 + v1470 + v1490) + 555.0d0*(v1437 + v1447 + v1474 + v1484) &
      + 1815.0d0*(v1442 + v1445 + v1479 + v1482) + 270.0d0*(v1449 + &
      v1463 + v1487 + v1502) + 2520.0d0*(v1453 + v1456 + v1491 + v1495 &
      ) + 1590.0d0*(M_xxxxxyyy + v1450 + v1460 + v1489 + v1500) - &
      1260.0d0*(v1360 + v1362 + v1403 + v1406 + v1410 + v1412 + v1454 + &
      v1457) - 870.0d0*(v1365 + v1367 + v1391 + v1393 + v1422 + v1426 + &
      v1492 + v1496) - 765.0d0*(v1404 + v1423 + v1436 + v1438 + v1455 + &
      v1473 + v1475 + v1493) - 705.0d0*(v1407 + v1427 + v1441 + v1443 + &
      v1458 + v1478 + v1480 + v1497)))
    S_xxxxxyyz  = v1*(v1896 + v1929 + 0.00512820512820513d0*(-13.0d0*v248 + 10.0d0*v249))
    Ms_xxxxxyyz = Ms_xxxxxyyz + (M_0*S_xxxxxyyz - v1086*z + v1897 + 0.000466200466200466d0*(-80.0d0* &
      M_xxxxxxxz + 1850.0d0*M_xxxxxyyz - 65.0d0*M_xxxxxzzz - 350.0d0* &
      M_xxxyyyyz - 185.0d0*M_xxxyyzzz - 496.0d0*(v1503 + v1528) + &
      7310.0d0*(v1504 + v1537) - 195.0d0*(v1505 + v1542) - 480.0d0*( &
      v1506 + v1573) - 774.0d0*(v1512 + v1532) + 16470.0d0*(v1513 + &
      v1550) + 150.0d0*(v1515 + v1611) - 530.0d0*(v1517 + v1539) + &
      21650.0d0*(v1518 + v1575) + 280.0d0*(v1520 + v1660) + 15080.0d0*( &
      v1523 + v1618) - 1350.0d0*(v1524 + v1583) + 4440.0d0*(v1525 + &
      v1668) - 816.0d0*(v1526 + v1633) - 144.0d0*(v1527 + v1684) + &
      7644.0d0*(v1529 + v1679) + 3726.0d0*(v1530 + v1685) + 3764.0d0*( &
      v1531 + v1642) + 2436.0d0*(v1533 + v1647) - 325.0d0*(v1534 + &
      v1686) + 26580.0d0*(v1535 + v1628) + 12810.0d0*(v1536 + v1634) + &
      14940.0d0*(v1538 + v1594) + 8940.0d0*(v1540 + v1599) - 975.0d0*( &
      v1541 + v1635) + 40040.0d0*(v1543 + v1579) - 3220.0d0*(v1544 + &
      v1664) + 19710.0d0*(v1545 + v1584) - 5610.0d0*(v1546 + v1669) - &
      1740.0d0*(v1547 + v1680) + 1020.0d0*(v1548 + v1687) - 3340.0d0*( &
      v1549 + v1643) - 2190.0d0*(v1551 + v1648) - 925.0d0*(v1552 + &
      v1688) + 32280.0d0*(v1553 + v1567) + 2940.0d0*(v1554 + v1652) + &
      17130.0d0*(v1558 + v1569) + 2790.0d0*(v1560 + v1654) - 7620.0d0*( &
      v1568 + v1614) - 8970.0d0*(v1570 + v1619) + 1620.0d0*(v1571 + &
      v1629) + 4770.0d0*(v1572 + v1636) - 7740.0d0*(v1574 + v1595) - &
      5550.0d0*(v1576 + v1600) + 6300.0d0*(v1580 + v1604) + 6540.0d0*( &
      v1586 + v1606) - 135.0d0*(M_xyyyyyyz + v1509 + v1658) - 120.0d0*( &
      M_xyyyyzzz + v1510 + v1663) - 600.0d0*(v1640 + v1662 + v1691) - &
      510.0d0*(v1514 + v1516 + v1564 + v1625) - 380.0d0*(v1519 + v1521 &
      + v1590 + v1675) - 1500.0d0*(v1562 + v1585 + v1587 + v1623) + &
      885.0d0*(v1602 + v1612 + v1650 + v1661) + 840.0d0*(v1605 + v1615 &
      + v1653 + v1665) - 1965.0d0*(v1607 + v1621 + v1655 + v1671) - &
      2520.0d0*(v1608 + v1631 + v1656 + v1682) - 705.0d0*(v1609 + v1639 &
      + v1657 + v1690) - 850.0d0*(v1522 + v1557 + v1559 + v1561 + v1588 &
      + v1673) - 1200.0d0*(v1555 + v1581 + v1616 + v1630 + v1632 + &
      v1666 + v1681 + v1683) - 1125.0d0*(v1563 + v1589 + v1620 + v1622 &
      + v1624 + v1670 + v1672 + v1674) - 435.0d0*(v1565 + v1591 + v1601 &
      + v1603 + v1626 + v1649 + v1651 + v1676) - 240.0d0*(v1556 + v1582 &
      + v1596 + v1597 + v1598 + v1610 + v1617 + v1644 + v1645 + v1646 + &
      v1659 + v1667)))
    S_xxxxyyyy  = 0.000466200466200466d0*(2145.0d0*v105*v38 + v1087 + 396.0d0*v1693 + &
      33.0d0*(v1090 + v1898) - 18.0d0*(v1091 + v1899) - 858.0d0*(v1696 &
      + v1900))
    Ms_xxxxyyyy = Ms_xxxxyyyy + (0.000466200466200466d0*(2145.0d0*M_0*S_xxxxyyyy + 1485.0d0*M_xxxxyyyy + &
      48780.0d0*v1098 + 15.0d0*(M_xxxxxxzz + M_yyyyyyzz) + 14.0d0*( &
      M_xxxxzzzz + M_yyyyzzzz) + 3285.0d0*(v1093 + v1113) + 28560.0d0*( &
      v1095 + v1109) + 21360.0d0*(v1096 + v1106) + 100.0d0*(v1144 + &
      v1268) + 560.0d0*(v1178 + v1283) + 70.0d0*(v1103 + v1104 + v1115 &
      + v1116) + 32.0d0*(v1122 + v1152 + v1250 + v1273) + 60.0d0*(v1124 &
      + v1158 + v1251 + v1276) + 5640.0d0*(v1125 + v1163 + v1174 + &
      v1246) + 102.0d0*(v1130 + v1150 + v1702 + v1703) + 10020.0d0*( &
      v1133 + v1162 + v1193 + v1254) + 120.0d0*(v1139 + v1148 + v1264 + &
      v1271) + 9240.0d0*(v1142 + v1160 + v1228 + v1261) + 92.0d0*(v1154 &
      + v1274 + v1304 + v1308) + 432.0d0*(v1157 + v1240 + v1275 + v1302 &
      ) + 620.0d0*(v1166 + v1209 + v1278 + v1291) + 84.0d0*(v1170 + &
      v1281 + v1306 + v1309) + 34680.0d0*(v1173 + v1185 + v1191 + v1223 &
      ) + 42.0d0*(v1135 + v1138 + v1218 + v1219 + v1258 + v1260 + v1297 &
      + v1298) + 140.0d0*(v1211 + v1213 + v1216 + v1217 + v1290 + v1292 &
      + v1295 + v1296) + 28.0d0*(M_xxyyzzzz + v1127 + v1129 + v1183 + &
      v1208 + v1238 + v1249 + v1252 + v1287) + 168.0d0*(v1101 + v1118 + &
      v1182 + v1207 + v1237 + v1242 + v1244 + v1286 + v1301 + v1303) - &
      (330.0d0*M_xxxxxxyy + 285.0d0*M_xxxxyyzz + 330.0d0*M_xxyyyyyy + &
      285.0d0*M_xxyyyyzz + M_xxzzzzzz + M_yyzzzzzz + 2145.0d0*v1086*x + &
      600.0d0*v1092 + 1200.0d0*v1097 + 720.0d0*v1099 + 720.0d0*v1100 + &
      720.0d0*v1102 + 8.0d0*v1105 + 1200.0d0*v1107 + 1200.0d0*v1108 + &
      1200.0d0*v1111 + 600.0d0*v1112 + 720.0d0*v1114 + 8.0d0*v1117 + &
      8.0d0*v1119 + 8.0d0*v1120 + 2280.0d0*v1123 + 540.0d0*v1126 + &
      628.0d0*v1128 + 4440.0d0*v1131 + 120.0d0*v1132 + 630.0d0*v1134 + &
      420.0d0*v1136 + 510.0d0*v1137 + 5160.0d0*v1140 + 360.0d0*v1141 + &
      360.0d0*v1143 + 4890.0d0*v1145 + 195.0d0*v1146 + 195.0d0*v1147 + &
      2640.0d0*v1149 + 420.0d0*v1151 + 628.0d0*v1153 + 4368.0d0*v1155 + &
      2280.0d0*v1156 + 8220.0d0*v1159 + 4440.0d0*v1161 + 1440.0d0*v1164 &
      + 3000.0d0*v1165 + 1720.0d0*v1167 + 120.0d0*v1168 + 510.0d0*v1169 &
      + 8960.0d0*v1171 + 5160.0d0*v1172 + 3360.0d0*v1175 + 540.0d0* &
      v1176 + 3920.0d0*v1179 + 360.0d0*v1180 + 1020.0d0*v1181 + &
      8220.0d0*v1184 + 1020.0d0*v1186 + 2640.0d0*v1187 + 1020.0d0*v1188 &
      + 4890.0d0*v1189 + 4890.0d0*v1190 + 5160.0d0*v1192 + 4440.0d0* &
      v1194 + 2280.0d0*v1195 + 1440.0d0*v1196 + 3360.0d0*v1197 + &
      540.0d0*v1198 + 4400.0d0*v1199 + 4400.0d0*v1200 + 630.0d0*v1201 + &
      630.0d0*v1202 + 8960.0d0*v1203 + 3920.0d0*v1204 + 1020.0d0*v1205 &
      + 360.0d0*v1206 + 4400.0d0*v1210 + 1720.0d0*v1212 + 195.0d0*v1214 &
      + 195.0d0*v1215 + 4368.0d0*v1220 + 4368.0d0*v1221 + 2640.0d0* &
      v1222 + 1020.0d0*v1224 + 8220.0d0*v1225 + 1020.0d0*v1226 + &
      8960.0d0*v1227 + 8220.0d0*v1229 + 4368.0d0*v1230 + 628.0d0*v1231 &
      + 3000.0d0*v1232 + 3920.0d0*v1233 + 8960.0d0*v1234 + 360.0d0* &
      v1235 + 1020.0d0*v1236 + 3360.0d0*v1241 + 3000.0d0*v1243 + &
      628.0d0*v1245 + 2280.0d0*v1247 + 540.0d0*v1248 + 420.0d0*v1253 + &
      510.0d0*v1255 + 4440.0d0*v1256 + 630.0d0*v1257 + 120.0d0*v1259 + &
      5160.0d0*v1262 + 360.0d0*v1263 + 360.0d0*v1265 + 4890.0d0*v1266 + &
      195.0d0*v1267 + 195.0d0*v1269 + 2640.0d0*v1270 + 420.0d0*v1272 + &
      1720.0d0*v1277 + 510.0d0*v1279 + 120.0d0*v1280 + 3920.0d0*v1282 + &
      1020.0d0*v1284 + 360.0d0*v1285 + 1720.0d0*v1288 + 4400.0d0*v1289 &
      + 195.0d0*v1293 + 195.0d0*v1294 + 3000.0d0*v1299 + 3360.0d0*v1300 &
      + 1440.0d0*v1305 + 1440.0d0*v1307 + 2145.0d0*v1699 + 2145.0d0* &
      v1701 + 2145.0d0*v1901 + 2145.0d0*v1902 + 2145.0d0*v675*y)))
    S_xxxxyyyz  = v2*(0.0153846153846154d0*(6.0d0*v249 + v527) + v1893 + v1903 + v443)
    Ms_xxxxyyyz = Ms_xxxxyyyz + (M_0*S_xxxxyyyz - v1084*y + 0.0013986013986014d0*(590.0d0*M_xxxxyyyz - &
      59.0d0*M_xxyyyzzz - 5.0d0*M_yyyyyyyz - 2.0d0*M_yyyyyzzz - 650.0d0 &
      *v1833 - 315.0d0*(v1704 + v1715) - 63.0d0*(v1705 + v1709) + &
      2060.0d0*(v1722 + v1758) + 3830.0d0*(v1727 + v1780) - 76.0d0*( &
      v1729 + v1853) + 3800.0d0*(v1732 + v1814) + 1460.0d0*(v1734 + &
      v1860) + 3200.0d0*(v1743 + v1869) + 2670.0d0*(v1744 + v1879) + &
      1730.0d0*(v1746 + v1831) + 2340.0d0*(v1748 + v1836) + 8960.0d0*( &
      v1755 + v1818) + 7980.0d0*(v1756 + v1822) + 2820.0d0*(v1757 + &
      v1826) + 6020.0d0*(v1759 + v1804) + 7320.0d0*(v1761 + v1808) + &
      3360.0d0*(v1765 + v1810) + 10110.0d0*(v1769 + v1783) - 720.0d0*( &
      v1771 + v1856) + 10350.0d0*(v1773 + v1786) + 4070.0d0*(v1775 + &
      v1795) - 370.0d0*(v1776 + v1870) + 204.0d0*(v1778 + v1887) - &
      710.0d0*(v1781 + v1837) - 295.0d0*(v1782 + v1888) + 310.0d0*( &
      v1788 + v1846) - 1170.0d0*(v1806 + v1813) + 486.0d0*(v1811 + &
      v1828) - 9.0d0*(v1834 + v1852) - 6.0d0*(v1835 + v1859) + 19.0d0*( &
      v1839 + v1854) + 15.0d0*(v1844 + v1857) - 215.0d0*(v1849 + v1872 &
      ) - 139.0d0*(v1850 + v1882) - 31.0d0*(v1851 + v1889) - 10.0d0*( &
      v1855 + v1890) - 30.0d0*(v1858 + v1883) + 630.0d0*(v1904 + v1905 &
      ) - 60.0d0*(M_xxxxxxyz + v1738 + v1830) - 57.0d0*(M_xxxxyzzz + &
      v1753 + v1832) - 70.0d0*(M_xxyyyyyz + v1784 + v1842) - 400.0d0*( &
      v1721 + v1740 + v1741 + v1803) - 450.0d0*(v1726 + v1747 + v1750 + &
      v1768) - 140.0d0*(v1731 + v1754 + v1760 + v1764) - 240.0d0*(v1735 &
      + v1739 + v1821 + v1825) - 20.0d0*(v1736 + v1737 + v1878 + v1884 &
      ) + 930.0d0*(v1745 - v1774 - v1861 + v1885) - 285.0d0*(v1749 + &
      v1752 + v1880 + v1886) + 1200.0d0*(v1751 - v1809 - v1815 + v1841 &
      ) - 135.0d0*(v1791 + v1866 + v1871 + v1873) - 69.0d0*(v1793 + &
      v1838 + v1840 + v1868) - 65.0d0*(v1802 + v1843 + v1845 + v1877) + &
      3.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1708 + v1710 + v1711 + v1714) + &
      250.0d0*(-v1733 - v1742 - v1785 - v1794 + v1797 + v1848) - &
      115.0d0*(v1800 + v1847 + v1862 + v1863 + v1864 + v1875) + 21.0d0* &
      (v1706 + v1707 + v1712 + v1713 + v1716 + v1717 + v1718 + v1719) - &
      570.0d0*(v1762 + v1766 + v1816 + v1819 + v1823 + v1824 + v1827 + &
      v1829) - 390.0d0*(v1787 + v1789 + v1790 + v1796 + v1798 + v1799 + &
      v1865 + v1874) - 114.0d0*(v1723 + v1724 + v1725 + v1763 + v1767 + &
      v1805 + v1807 + v1812 + v1817 + v1820) + 120.0d0*(-v1728 - v1730 &
      - v1770 - v1772 + v1777 - v1792 - v1801 - v1867 - v1876 + v1881)))
    S_xxxyyyyy  = v0*(0.0769230769230769d0*(2.0d0*v527) + v1907 + v1930 + v1933)
    Ms_xxxyyyyy = Ms_xxxyyyyy + (M_0*S_xxxyyyyy + v1895 + 0.000466200466200466d0*(-390.0d0*M_xxxxxyyy - &
      3370.0d0*(v1352 + v1384) + 4962.0d0*(v1354 + v1418) - 285.0d0*( &
      v1355 + v1420) - 6810.0d0*(v1359 + v1396) + 6132.0d0*(v1361 + &
      v1446) - 6450.0d0*(v1364 + v1415) + 2760.0d0*(v1366 + v1483) - &
      2830.0d0*(v1369 + v1439) - 210.0d0*(v1371 + v1476) - 600.0d0*( &
      v1376 + v1471) - 780.0d0*(v1377 + v1465) - 8160.0d0*(v1383 + &
      v1429) - 16530.0d0*(v1390 + v1413) + 10040.0d0*(v1392 + v1481) - &
      16890.0d0*(v1394 + v1409) + 15330.0d0*(v1395 + v1477) + 12990.0d0 &
      *(v1397 + v1472) + 6530.0d0*(v1398 + v1467) - 6720.0d0*(v1399 + &
      v1499) - 615.0d0*(v1400 + v1468) + 24060.0d0*(v1411 + v1444) + &
      40890.0d0*(v1414 + v1440) + 38550.0d0*(v1416 + v1435) + 20550.0d0 &
      *(v1417 + v1431) - 5400.0d0*(v1419 + v1462) - 6300.0d0*(v1425 + &
      v1452) - 75.0d0*(M_xxxxxxxy + v1373 + v1464) - 30.0d0*(M_xxxxxyzz &
      + v1380 + v1466) - 240.0d0*(M_xyyyyyyy + v1356 + v1486) - 195.0d0 &
      *(M_xyyyyyzz + v1357 + v1488) - 135.0d0*(v1351 + v1372 + v1374 + &
      v1428) - 90.0d0*(v1353 + v1386 + v1388 + v1430) + 555.0d0*(v1358 &
      + v1370 + v1375 + v1408) + 1815.0d0*(v1363 + v1368 + v1381 + &
      v1389) + 270.0d0*(v1378 + v1379 + v1498 + v1501) - 7620.0d0*( &
      v1382 + v1402 + v1434 + v1494) + 2520.0d0*(v1401 + v1405 + v1421 &
      + v1424) - 1488.0d0*(v1432 + v1448 + v1469 + v1485) - 585.0d0*( &
      v1433 + v1451 + v1470 + v1490) - 2910.0d0*(v1437 + v1447 + v1474 &
      + v1484) - 2970.0d0*(v1442 + v1445 + v1479 + v1482) - 588.0d0*( &
      v1449 + v1463 + v1487 + v1502) - 1380.0d0*(v1450 + v1460 + v1489 &
      + v1500) - 2100.0d0*(v1453 + v1456 + v1491 + v1495) + 1590.0d0*( &
      M_xxxyyyyy + v1385 + v1387 + v1459 + v1461) - 765.0d0*(v1360 + &
      v1362 + v1403 + v1406 + v1410 + v1412 + v1454 + v1457) - 705.0d0* &
      (v1365 + v1367 + v1391 + v1393 + v1422 + v1426 + v1492 + v1496) - &
      1260.0d0*(v1404 + v1423 + v1436 + v1438 + v1455 + v1473 + v1475 + &
      v1493) - 870.0d0*(v1407 + v1427 + v1441 + v1443 + v1458 + v1478 + &
      v1480 + v1497)))
    S_xxxyyyyz  = v1*(0.0153846153846154d0*(v249 + 6.0d0*v527) + v1903 + v1907 + v526)
    Ms_xxxyyyyz = Ms_xxxyyyyz + (M_0*S_xxxyyyyz - v1057*x + 0.0013986013986014d0*(-5.0d0*M_xxxxxxxz - &
      2.0d0*M_xxxxxzzz + 590.0d0*M_xxxyyyyz - 59.0d0*M_xxxyyzzz - &
      650.0d0*v1504 - 9.0d0*(v1503 + v1528) - 6.0d0*(v1505 + v1542) + &
      1730.0d0*(v1506 + v1573) - 63.0d0*(v1507 + v1578) + 19.0d0*(v1512 &
      + v1532) - 710.0d0*(v1513 + v1550) + 2340.0d0*(v1515 + v1611) + &
      15.0d0*(v1517 + v1539) + 310.0d0*(v1523 + v1618) - 215.0d0*(v1524 &
      + v1583) - 139.0d0*(v1526 + v1633) - 31.0d0*(v1527 + v1684) + &
      486.0d0*(v1529 + v1679) + 204.0d0*(v1530 + v1685) - 76.0d0*(v1533 &
      + v1647) - 10.0d0*(v1534 + v1686) + 630.0d0*(v1535 + v1628) - &
      1170.0d0*(v1538 + v1594) - 720.0d0*(v1540 + v1599) - 30.0d0*( &
      v1541 + v1635) + 3360.0d0*(v1544 + v1664) - 370.0d0*(v1545 + &
      v1584) + 4070.0d0*(v1546 + v1669) + 2820.0d0*(v1547 + v1680) + &
      2060.0d0*(v1549 + v1643) + 3830.0d0*(v1551 + v1648) - 295.0d0*( &
      v1552 + v1688) + 3800.0d0*(v1554 + v1652) + 1460.0d0*(v1560 + &
      v1654) + 7320.0d0*(v1568 + v1614) + 10350.0d0*(v1570 + v1619) + &
      7980.0d0*(v1571 + v1629) + 2670.0d0*(v1572 + v1636) + 6020.0d0*( &
      v1574 + v1595) + 10110.0d0*(v1576 + v1600) - 315.0d0*(v1577 + &
      v1637) + 8960.0d0*(v1580 + v1604) + 3200.0d0*(v1586 + v1606) - &
      70.0d0*(M_xxxxxyyz + v1518 + v1575) - 60.0d0*(M_xyyyyyyz + v1509 &
      + v1658) - 57.0d0*(M_xyyyyzzz + v1510 + v1663) - 69.0d0*(v1514 + &
      v1516 + v1564 + v1625) - 65.0d0*(v1519 + v1521 + v1590 + v1675) + &
      1200.0d0*(v1520 - v1553 - v1567 + v1660) + 930.0d0*(v1548 - v1558 &
      - v1569 + v1687) - 135.0d0*(v1562 + v1585 + v1587 + v1623) - &
      400.0d0*(v1597 + v1610 + v1645 + v1659) - 450.0d0*(v1602 + v1612 &
      + v1650 + v1661) - 140.0d0*(v1605 + v1615 + v1653 + v1665) - &
      240.0d0*(v1608 + v1631 + v1656 + v1682) - 20.0d0*(v1609 + v1639 + &
      v1657 + v1690) - 285.0d0*(v1613 + v1640 + v1662 + v1691) + 3.0d0* &
      (M_xxxzzzzz + M_xyyzzzzz + v1508 + v1511 + v1593 + v1678) - &
      115.0d0*(v1522 + v1557 + v1559 + v1561 + v1588 + v1673) + 250.0d0 &
      *(v1525 - v1607 - v1621 - v1655 + v1668 - v1671) - 570.0d0*(v1555 &
      + v1581 + v1616 + v1630 + v1632 + v1666 + v1681 + v1683) - &
      390.0d0*(v1563 + v1589 + v1620 + v1622 + v1624 + v1670 + v1672 + &
      v1674) + 21.0d0*(v1566 + v1592 + v1627 + v1638 + v1641 + v1677 + &
      v1689 + v1692) - 114.0d0*(v1531 + v1556 + v1582 + v1596 + v1598 + &
      v1617 + v1642 + v1644 + v1646 + v1667) + 120.0d0*(v1536 - v1565 - &
      v1591 - v1601 - v1603 - v1626 + v1634 - v1649 - v1651 - v1676)))
    S_xxyyyyyy  = 0.00512820512820513d0*(15.0d0*v1898 - 13.0d0*v1908) - v1042*v4 + v1694 - &
      v1695*v5 - v1900 + v4*v535
    Ms_xxyyyyyy = Ms_xxyyyyyy + (M_0*S_xxyyyyyy + v1697 + v1901 + v1902 + 0.000155400155400155d0*(75.0d0* &
      M_xxxxxxxx - 1005.0d0*M_xxxxxxyy + 105.0d0*M_xxxxxxzz - 900.0d0* &
      M_xxxxyyzz + 25.0d0*M_xxxxzzzz + 4800.0d0*M_xxyyyyyy - 1125.0d0* &
      M_xxyyyyzz - 240.0d0*M_yyyyyyyy - 120.0d0*M_yyyyyyzz + 115.0d0* &
      M_yyyyzzzz - 3130.0d0*v1144 + 142520.0d0*v1227 - 97720.0d0*v1234 &
      - 5440.0d0*v1268 - 1400.0d0*v1283 + 370.0d0*(v1122 + v1152) - &
      1320.0d0*(v1123 + v1156) + 420.0d0*(v1124 + v1158) - 16620.0d0*( &
      v1125 + v1174) - 1590.0d0*(v1126 + v1176) + 9952.0d0*(v1128 + &
      v1231) + 90.0d0*(v1130 + v1150) + 9165.0d0*(v1131 + v1161) - &
      21540.0d0*(v1133 + v1193) - 2475.0d0*(v1134 + v1201) + 5520.0d0*( &
      v1136 + v1272) - 2730.0d0*(v1137 + v1279) - 1770.0d0*(v1139 + &
      v1148) + 17700.0d0*(v1140 + v1172) - 4560.0d0*(v1142 + v1228) + &
      6015.0d0*(v1145 + v1189) - 3840.0d0*(v1149 + v1222) - 1635.0d0*( &
      v1151 + v1253) + 190.0d0*(v1154 + v1304) - 4020.0d0*(v1155 + &
      v1220) + 16140.0d0*(v1159 + v1184) + 6870.0d0*(v1160 + v1261) - &
      30.0d0*(v1162 + v1254) - 5190.0d0*(v1163 + v1246) + 1110.0d0*( &
      v1164 + v1305) - 1010.0d0*(v1166 + v1209) + 610.0d0*(v1167 + &
      v1288) + 150.0d0*(v1170 + v1306) + 35840.0d0*(v1171 + v1203) - &
      52500.0d0*(v1173 + v1223) + 12480.0d0*(v1175 + v1241) + 11480.0d0 &
      *(v1179 + v1233) - 69960.0d0*(v1185 + v1191) + 24960.0d0*(v1187 + &
      v1270) + 55470.0d0*(v1190 + v1266) + 70620.0d0*(v1192 + v1262) + &
      51870.0d0*(v1194 + v1256) + 22080.0d0*(v1195 + v1247) - 11220.0d0 &
      *(v1196 + v1307) - 36840.0d0*(v1197 + v1300) - 2490.0d0*(v1198 + &
      v1248) + 19940.0d0*(v1199 + v1210) - 54040.0d0*(v1200 + v1289) - &
      3825.0d0*(v1202 + v1257) - 41440.0d0*(v1204 + v1282) - 13520.0d0* &
      (v1212 + v1277) + 46272.0d0*(v1221 + v1230) + 107580.0d0*(v1225 + &
      v1229) - 21480.0d0*(v1232 + v1243) - 1568.0d0*(v1250 + v1273) - &
      480.0d0*(v1251 + v1276) - 2445.0d0*(v1259 + v1280) - 5280.0d0*( &
      v1264 + v1271) - 128.0d0*(v1274 + v1308) + 192.0d0*(v1275 + v1302 &
      ) - 380.0d0*(v1278 + v1291) + 690.0d0*(v1281 + v1309) - 69840.0d0 &
      *(v1698 + v1700) - 3888.0d0*(v1702 + v1703) - 2240.0d0*(v1153 + &
      v1178 + v1245) + 50.0d0*(v1127 + v1129 + v1183 + v1238) + 165.0d0 &
      *(v1135 + v1138 + v1218 + v1297) - 330.0d0*(v1141 + v1143 + v1180 &
      + v1235) - 270.0d0*(v1146 + v1147 + v1214 + v1293) - 2760.0d0*( &
      v1181 + v1224 + v1226 + v1236) - 5460.0d0*(v1186 + v1188 + v1205 &
      + v1284) - 3930.0d0*(v1206 + v1263 + v1265 + v1285) + 230.0d0*( &
      v1208 + v1249 + v1252 + v1287) + 430.0d0*(v1211 + v1213 + v1216 + &
      v1295) - 1845.0d0*(v1215 + v1267 + v1269 + v1294) + 970.0d0*( &
      v1217 + v1290 + v1292 + v1296) + 255.0d0*(v1132 + v1168 + v1219 + &
      v1258 + v1260 + v1298) + 300.0d0*(v1157 + v1182 + v1237 + v1240 + &
      v1242 + v1244) + 1380.0d0*(v1165 - v1169 + v1207 - v1255 + v1286 &
      + v1299 + v1301 + v1303)))
    S_xxyyyyyz  = v2*(v1896 + v1930 + 0.00512820512820513d0*(-13.0d0*v525 + 10.0d0*v527))
    Ms_xxyyyyyz = Ms_xxyyyyyz + (M_0*S_xxyyyyyz + v1720 - v675*z + 0.000466200466200466d0*(-350.0d0* &
      M_xxxxyyyz + 1850.0d0*M_xxyyyyyz - 185.0d0*M_xxyyyzzz - 80.0d0* &
      M_yyyyyyyz - 65.0d0*M_yyyyyzzz - 3340.0d0*(v1722 + v1758) + &
      3764.0d0*(v1724 + v1812) - 2190.0d0*(v1727 + v1780) + 2436.0d0*( &
      v1729 + v1853) + 2940.0d0*(v1732 + v1814) + 2790.0d0*(v1734 + &
      v1860) + 6540.0d0*(v1743 + v1869) + 4770.0d0*(v1744 + v1879) + &
      1020.0d0*(v1745 + v1885) - 480.0d0*(v1746 + v1831) + 150.0d0*( &
      v1748 + v1836) + 280.0d0*(v1751 + v1841) + 6300.0d0*(v1755 + &
      v1818) + 1620.0d0*(v1756 + v1822) - 1740.0d0*(v1757 + v1826) - &
      7740.0d0*(v1759 + v1804) - 7620.0d0*(v1761 + v1808) - 3220.0d0*( &
      v1765 + v1810) - 5550.0d0*(v1769 + v1783) + 8940.0d0*(v1771 + &
      v1856) - 8970.0d0*(v1773 + v1786) + 17130.0d0*(v1774 + v1861) - &
      5610.0d0*(v1775 + v1795) + 19710.0d0*(v1776 + v1870) + 12810.0d0* &
      (v1777 + v1881) + 3726.0d0*(v1778 + v1887) + 7310.0d0*(v1779 + &
      v1833) + 16470.0d0*(v1781 + v1837) - 925.0d0*(v1782 + v1888) + &
      21650.0d0*(v1784 + v1842) + 15080.0d0*(v1788 + v1846) + 4440.0d0* &
      (v1797 + v1848) + 14940.0d0*(v1806 + v1813) + 32280.0d0*(v1809 + &
      v1815) + 7644.0d0*(v1811 + v1828) - 496.0d0*(v1834 + v1852) - &
      195.0d0*(v1835 + v1859) - 774.0d0*(v1839 + v1854) - 530.0d0*( &
      v1844 + v1857) - 1350.0d0*(v1849 + v1872) - 816.0d0*(v1850 + &
      v1882) - 144.0d0*(v1851 + v1889) - 325.0d0*(v1855 + v1890) - &
      975.0d0*(v1858 + v1883) + 26580.0d0*(v1904 + v1905) + 40040.0d0*( &
      v1909 + v1910) - 135.0d0*(M_xxxxxxyz + v1738 + v1830) - 120.0d0*( &
      M_xxxxyzzz + v1753 + v1832) - 600.0d0*(v1752 + v1880 + v1886) + &
      885.0d0*(v1726 + v1747 + v1750 + v1768) + 840.0d0*(v1731 + v1754 &
      + v1760 + v1764) - 1965.0d0*(v1733 + v1742 + v1785 + v1794) - &
      2520.0d0*(v1735 + v1739 + v1821 + v1825) - 705.0d0*(v1736 + v1737 &
      + v1878 + v1884) - 1500.0d0*(v1791 + v1866 + v1871 + v1873) - &
      510.0d0*(v1793 + v1838 + v1840 + v1868) - 380.0d0*(v1802 + v1843 &
      + v1845 + v1877) - 850.0d0*(v1800 + v1847 + v1862 + v1863 + v1864 &
      + v1875) - 435.0d0*(v1728 + v1730 + v1770 + v1772 + v1792 + v1801 &
      + v1867 + v1876) - 1200.0d0*(v1762 + v1766 + v1816 + v1819 + &
      v1823 + v1824 + v1827 + v1829) - 1125.0d0*(v1787 + v1789 + v1790 &
      + v1796 + v1798 + v1799 + v1865 + v1874) - 240.0d0*(v1721 + v1723 &
      + v1725 + v1740 + v1741 + v1763 + v1767 + v1803 + v1805 + v1807 + &
      v1817 + v1820)))
    S_xyyyyyyy  = v0*v1911
    Ms_xyyyyyyy = Ms_xyyyyyyy + (M_0*S_xyyyyyyy + v1350 + 0.0013986013986014d0*(-175.0d0*M_xxxxxyyy - &
      560.0d0*M_xxxyyyyy + 245.0d0*(v1352 + v1384) - 2352.0d0*(v1354 + &
      v1418) + 35.0d0*(v1355 + v1420) + 2660.0d0*(v1359 + v1396) - &
      672.0d0*(v1361 + v1446) + 1400.0d0*(v1364 + v1415) - 1645.0d0*( &
      v1369 + v1439) - 2205.0d0*(v1382 + v1434) + 5880.0d0*(v1390 + &
      v1413) + 7140.0d0*(v1394 + v1409) + 2170.0d0*(v1395 + v1477) - &
      1190.0d0*(v1397 + v1472) - 1680.0d0*(v1398 + v1467) - 10290.0d0*( &
      v1414 + v1440) - 13650.0d0*(v1416 + v1435) - 8400.0d0*(v1417 + &
      v1431) + 3500.0d0*(v1419 + v1462) + 2800.0d0*(v1425 + v1452) + &
      70.0d0*(M_xxxxxxxy + v1373 + v1464) + 105.0d0*(M_xxxxxyzz + v1380 &
      + v1466) + 400.0d0*(M_xyyyyyyy + v1356 + v1486) - 1540.0d0*(v1363 &
      + v1368 + v1381 + v1389) - 735.0d0*(v1377 + v1400 + v1465 + v1468 &
      ) + 3360.0d0*(v1392 - v1411 - v1444 + v1481) + 2128.0d0*(v1432 + &
      v1448 + v1469 + v1485) - 840.0d0*(v1433 + v1451 + v1470 + v1490) &
      + 12320.0d0*(v1442 + v1445 + v1479 + v1482) - 1792.0d0*(v1449 + &
      v1463 + v1487 + v1502) - 11900.0d0*(v1453 + v1456 + v1491 + v1495 &
      ) + 315.0d0*(v1353 - v1383 + v1386 + v1388 - v1429 + v1430) + &
      1120.0d0*(v1366 - v1401 - v1405 - v1421 - v1424 + v1483) + &
      6720.0d0*(v1437 + v1447 - v1450 - v1460 + v1474 + v1484 - v1489 - &
      v1500) + 280.0d0*(-M_xyyyyyzz + v1351 - v1357 + v1372 + v1374 - &
      v1402 + v1428 - v1488 - v1494) + 420.0d0*(-v1365 - v1367 - v1391 &
      - v1393 + v1399 - v1422 - v1426 - v1492 - v1496 + v1499) - &
      805.0d0*(v1371 + v1407 + v1427 + v1441 + v1443 + v1458 + v1476 + &
      v1478 + v1480 + v1497) - 1365.0d0*(v1376 + v1404 + v1423 + v1436 &
      + v1438 + v1455 + v1471 + v1473 + v1475 + v1493) + 210.0d0*( &
      -v1358 - v1360 - v1362 - v1370 - v1375 + v1378 + v1379 + v1385 + &
      v1387 - v1403 - v1406 - v1408 - v1410 - v1412 - v1454 - v1457 + &
      v1459 + v1461 + v1498 + v1501)))
    S_xyyyyyyz  = v1*(0.0769230769230769d0*(3.0d0*v527) + v1043 - v525 + v535)
    Ms_xyyyyyyz = Ms_xyyyyyyz + (M_0*S_xyyyyyyz + v1897 + 0.00699300699300699d0*(2.0d0*M_xxxxxxxz + 3.0d0 &
      *M_xxxxxzzz - 27.0d0*(M_xxxxxyyz + M_xxxyyzzz) + 9.0d0*(v1505 + &
      v1542) - 340.0d0*(v1506 + v1573) - 50.0d0*(v1517 + v1539) - &
      465.0d0*(v1523 + v1618) + 42.0d0*(v1524 + v1583) - 177.0d0*(v1525 &
      + v1668) + 38.0d0*(v1526 + v1633) - 141.0d0*(v1530 + v1685) - &
      780.0d0*(v1535 + v1628) - 345.0d0*(v1536 + v1634) - 75.0d0*(v1540 &
      + v1599) + 45.0d0*(v1541 + v1635) + 990.0d0*(v1546 + v1669) + &
      280.0d0*(v1547 + v1680) - 135.0d0*(v1552 + v1688) + 480.0d0*( &
      v1553 + v1567) - 510.0d0*(v1570 + v1619) - 1080.0d0*(v1571 + &
      v1629) - 540.0d0*(v1572 + v1636) - 1000.0d0*(v1574 + v1595) - &
      1470.0d0*(v1576 + v1600) + 112.0d0*(M_xyyyyyyz + v1509 + v1658) + &
      8.0d0*(v1503 + v1527 + v1528 + v1684) + 15.0d0*(-v1504 + v1534 - &
      v1537 + v1686) - 18.0d0*(v1519 + v1521 + v1590 + v1675) + 400.0d0 &
      *(v1520 - v1586 - v1606 + v1660) + 1120.0d0*(v1544 - v1580 - &
      v1604 + v1664) + 10.0d0*(v1562 + v1585 + v1587 + v1623) + 512.0d0 &
      *(v1597 + v1610 + v1645 + v1659) + 1500.0d0*(v1602 + v1612 + &
      v1650 + v1661) + 2520.0d0*(v1605 + v1615 + v1653 + v1665) + &
      2300.0d0*(v1607 + v1621 + v1655 + v1671) + 1152.0d0*(v1608 + &
      v1631 + v1656 + v1682) + 272.0d0*(v1609 + v1639 + v1657 + v1690) &
      - 150.0d0*(v1613 + v1640 + v1662 + v1691) + 30.0d0*(-M_xyyyyzzz - &
      v1510 + v1551 + v1648 - v1663) - 12.0d0*(v1512 + v1514 + v1516 + &
      v1532 + v1564 + v1625) + 120.0d0*(v1515 - v1549 + v1560 + v1611 - &
      v1643 + v1654) + 240.0d0*(v1513 + v1550 + v1554 + v1558 + v1568 + &
      v1569 + v1614 + v1652) - 20.0d0*(v1522 + v1548 + v1557 + v1559 + &
      v1561 + v1588 + v1673 + v1687) - 185.0d0*(v1563 + v1589 + v1620 + &
      v1622 + v1624 + v1670 + v1672 + v1674) - 300.0d0*(v1529 + v1555 + &
      v1581 + v1616 + v1630 + v1632 + v1666 + v1679 + v1681 + v1683) - &
      51.0d0*(v1533 + v1565 + v1591 + v1601 + v1603 + v1626 + v1647 + &
      v1649 + v1651 + v1676) + 60.0d0*(-M_xxxyyyyz - v1518 - v1531 - &
      v1538 + v1545 - v1556 - v1575 - v1582 + v1584 - v1594 - v1596 - &
      v1598 - v1617 - v1642 - v1644 - v1646 - v1667)))
    S_yyyyyyyy  = b8 + v1088 + 0.000466200466200466d0*(2310.0d0*v1898 - 420.0d0*v1899 - &
      4004.0d0*v1908)
    Ms_yyyyyyyy = Ms_yyyyyyyy + (M_0*S_yyyyyyyy + v1121 + 0.000155400155400155d0*(-105.0d0*M_xxxxxxxx - &
      210.0d0*M_xxxxxxzz + 3150.0d0*M_xxxxyyzz - 140.0d0*M_xxxxzzzz + &
      1920.0d0*M_yyyyyyyy + 5810.0d0*v1144 - 259840.0d0*v1227 + &
      220640.0d0*v1234 + 183680.0d0*v1268 - 224000.0d0*v1283 - &
      14280.0d0*(v1131 + v1161) - 12600.0d0*(v1134 + v1201) - 33600.0d0 &
      *(v1140 + v1172) - 7980.0d0*(v1145 + v1189) - 32340.0d0*(v1162 + &
      v1254) + 5460.0d0*(v1169 + v1255) - 71680.0d0*(v1171 + v1203) - &
      8400.0d0*(v1173 + v1223) + 107520.0d0*(v1185 + v1191) - 38080.0d0 &
      *(v1199 + v1210) + 7280.0d0*(v1200 + v1289) - 31500.0d0*(v1202 + &
      v1257) - 17920.0d0*(v1204 + v1282) - 8960.0d0*(v1212 + v1277) - &
      188160.0d0*(v1225 + v1229) + 11776.0d0*(v1250 + v1273) - &
      36960.0d0*(v1259 + v1280) + 134400.0d0*(v1264 + v1271) - &
      170240.0d0*(v1278 + v1291) + 161280.0d0*(v1698 + v1700) + &
      52416.0d0*(v1702 + v1703) + 4480.0d0*(v1153 + v1178 + v1245) - &
      560.0d0*(v1122 + v1152 + v1154 + v1304) - 280.0d0*(v1127 + v1129 &
      + v1183 + v1238) - 17024.0d0*(v1128 + v1231 + v1274 + v1308) + &
      1890.0d0*(v1146 + v1147 + v1214 + v1293) - 20160.0d0*(v1215 + &
      v1267 + v1269 + v1294) - 75264.0d0*(v1221 + v1230 + v1275 + v1302 &
      ) + 2100.0d0*(M_xxxxxxyy + v1219 + v1258 + v1260 + v1298) + &
      5880.0d0*(v1123 + v1126 + v1156 + v1164 + v1176 + v1305) + &
      10920.0d0*(v1149 + v1181 + v1222 + v1224 + v1226 + v1236) - &
      1680.0d0*(v1157 + v1182 + v1237 + v1240 + v1242 + v1244) + &
      8680.0d0*(v1167 + v1217 + v1288 + v1290 + v1292 + v1296) + &
      2240.0d0*(v1179 + v1208 + v1233 + v1249 + v1252 + v1287) + &
      53760.0d0*(v1187 + v1190 + v1232 + v1243 + v1266 + v1270) + &
      6720.0d0*(-M_xxyyyyyy - v1163 - v1198 - v1246 - v1248 + v1281 + &
      v1309) + 1120.0d0*(M_yyyyzzzz + v1166 + v1209 + v1211 + v1213 + &
      v1216 + v1295) - 47040.0d0*(v1160 + v1194 + v1206 + v1256 + v1261 &
      + v1263 + v1265 + v1285) + 840.0d0*(-v1124 + v1132 + v1135 + &
      v1138 - v1158 + v1168 - v1170 + v1218 + v1297 - v1306) + 3360.0d0 &
      *(-M_yyyyyyzz + v1139 + v1141 + v1143 + v1148 + v1151 - v1175 + &
      v1180 + v1235 - v1241 + v1253) + 26880.0d0*(v1133 - v1142 - v1159 &
      - v1184 - v1186 - v1188 + v1193 - v1195 + v1197 - v1205 - v1228 - &
      v1247 - v1284 + v1300) + 13440.0d0*(v1125 + v1136 - v1137 + v1155 &
      + v1165 + v1174 - v1192 + v1196 + v1207 + v1220 - v1251 - v1262 + &
      v1272 - v1276 - v1279 + v1286 + v1299 + v1301 + v1303 + v1307)))
    S_yyyyyyyz  = v1911*v2
    Ms_yyyyyyyz = Ms_yyyyyyyz + (0.0013986013986014d0*(715.0d0*M_0*S_yyyyyyyz - 560.0d0*M_xxyyyyyz + &
      400.0d0*M_yyyyyyyz - 175.0d0*(M_xxxxyyyz + M_xxyyyzzz) - 3675.0d0 &
      *(v1704 + v1715) - 1792.0d0*(v1724 + v1812) + 1820.0d0*(v1727 + &
      v1780) + 2912.0d0*(v1729 + v1853) - 3920.0d0*(v1732 + v1814) - &
      2345.0d0*(v1734 + v1860) - 5145.0d0*(v1743 + v1869) - 3885.0d0*( &
      v1744 + v1879) - 1085.0d0*(v1745 + v1885) - 8400.0d0*(v1755 + &
      v1818) - 5460.0d0*(v1756 + v1822) - 980.0d0*(v1757 + v1826) + &
      6300.0d0*(v1769 + v1783) + 10080.0d0*(v1771 + v1856) + 7560.0d0*( &
      v1773 + v1786) + 10710.0d0*(v1774 + v1861) + 3080.0d0*(v1775 + &
      v1795) + 2870.0d0*(v1776 + v1870) - 1008.0d0*(v1778 + v1887) - &
      1610.0d0*(v1781 + v1837) - 875.0d0*(v1782 + v1888) + 1750.0d0*( &
      v1784 + v1842) + 3360.0d0*(v1788 + v1846) - 6720.0d0*(v1806 + &
      v1813) - 15540.0d0*(v1809 + v1815) - 4032.0d0*(v1811 + v1828) + &
      2128.0d0*(v1834 + v1852) + 8512.0d0*(v1839 + v1854) + 19040.0d0*( &
      v1844 + v1857) + 22400.0d0*(v1847 + v1863) + 14560.0d0*(v1849 + &
      v1872) + 5488.0d0*(v1850 + v1882) + 1072.0d0*(v1851 + v1889) - &
      1400.0d0*(v1855 + v1890) - 4200.0d0*(v1858 + v1883) - 13440.0d0*( &
      v1904 + v1905) - 20020.0d0*(v1909 + v1910) + 70.0d0*(M_xxxxxxyz + &
      v1738 + v1830) + 105.0d0*(M_xxxxyzzz + v1753 + v1832) - 735.0d0*( &
      v1705 + v1709 + v1746 + v1831) + 525.0d0*(v1749 + v1752 + v1880 + &
      v1886) - 1680.0d0*(v1777 + v1779 + v1833 + v1881) - 5425.0d0*( &
      v1791 + v1866 + v1871 + v1873) - 2625.0d0*(v1800 + v1862 + v1864 &
      + v1875) + 280.0d0*(-M_yyyyyzzz + v1736 + v1737 + v1878 + v1884) &
      + 35.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1708 + v1710 + v1711 + v1714 &
      ) + 1120.0d0*(-v1731 - v1754 - v1760 - v1764 + v1797 + v1848) - &
      1575.0d0*(v1748 + v1793 + v1836 + v1838 + v1840 + v1868) - &
      1015.0d0*(v1751 + v1802 + v1841 + v1843 + v1845 + v1877) - &
      840.0d0*(v1761 + v1765 + v1808 + v1810 + v1835 + v1859) + 245.0d0 &
      *(v1706 + v1707 + v1712 + v1713 + v1716 + v1717 + v1718 + v1719) &
      + 420.0d0*(v1722 + v1733 + v1742 + v1758 + v1759 + v1785 + v1794 &
      + v1804) - 700.0d0*(v1787 + v1789 + v1790 + v1796 + v1798 + v1799 &
      + v1865 + v1874) + 210.0d0*(v1721 + v1723 + v1725 + v1740 + v1741 &
      + v1763 + v1767 + v1803 + v1805 + v1807 + v1817 + v1820) - &
      630.0d0*(v1726 + v1728 + v1730 + v1747 + v1750 + v1768 + v1770 + &
      v1772 + v1792 + v1801 + v1867 + v1876) + 1050.0d0*(v1735 + v1739 &
      + v1762 + v1766 + v1816 + v1819 + v1821 + v1823 + v1824 + v1825 + &
      v1827 + v1829)))
#undef  M_0                 
#undef  z                   
#undef  Ms_0                
#undef  y                   
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
#undef  Ms_xxx              
#undef  M_xxx               
#undef  M_xxy               
#undef  Ms_xxy              
#undef  Ms_xxz              
#undef  M_xxz               
#undef  M_xyy               
#undef  Ms_xyy              
#undef  Ms_xyz              
#undef  M_xyz               
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
    
! OPS  2123*ADD + 2*DIV + 2804*MUL + 203*NEG + POW + 52*SUB = 5185  (6588 before optimization)
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
                v428, v429, v43, v430, v431, v432, v433, v434, v435, v436,&
                v437, v438, v439, v44, v440, v441, v442, v443, v444, v445,&
                v446, v447, v448, v449, v45, v450, v451, v452, v453, v454,&
                v455, v456, v457, v458, v459, v46, v460, v461, v462, v463,&
                v464, v465, v466, v467, v468, v469, v47, v470, v471, v472,&
                v473, v474, v475, v476, v477, v478, v479, v48, v480, v481,&
                v482, v483, v484, v485, v486, v487, v488, v489, v49, v490,&
                v491, v492, v493, v494, v495, v496, v497, v498, v499, v5, v50,&
                v500, v501, v502, v503, v504, v505, v506, v507, v508, v509,&
                v51, v510, v511, v512, v513, v514, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_0,&
                D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
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
                D_yyyyzzzz, D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
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
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define M_y                  M(2)
#define L_y                  L(2)
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
#define M_xxy                M(10)
#define L_xxy                L(10)
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
#define M_xxxxx              M(25)
#define L_xxxxx              L(25)
#define L_xxxxy              L(26)
#define M_xxxxy              M(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define M_xxxyy              M(28)
#define L_xxxyy              L(28)
#define L_xxxyz              L(29)
#define M_xxxyz              M(29)
#define L_xxyyy              L(30)
#define M_xxyyy              M(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define M_xyyyy              M(32)
#define L_xyyyy              L(32)
#define L_xyyyz              L(33)
#define M_xyyyz              M(33)
#define L_yyyyy              L(34)
#define M_yyyyy              M(34)
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
#define L_xxyyyy             L(43)
#define M_xxyyyy             M(43)
#define M_xxyyyz             M(44)
#define L_xxyyyz             L(44)
#define M_xyyyyy             M(45)
#define L_xyyyyy             L(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define M_yyyyyy             M(47)
#define L_yyyyyy             L(47)
#define L_yyyyyz             L(48)
#define M_yyyyyz             M(48)
#define L_xxxxxxx            L(49)
#define M_xxxxxxx            M(49)
#define M_xxxxxxy            M(50)
#define L_xxxxxxy            L(50)
#define L_xxxxxxz            L(51)
#define M_xxxxxxz            M(51)
#define L_xxxxxyy            L(52)
#define M_xxxxxyy            M(52)
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
#define L_xxyyyyz            L(59)
#define M_xxyyyyz            M(59)
#define M_xyyyyyy            M(60)
#define L_xyyyyyy            L(60)
#define L_xyyyyyz            L(61)
#define M_xyyyyyz            M(61)
#define M_yyyyyyy            M(62)
#define L_yyyyyyy            L(62)
#define L_yyyyyyz            L(63)
#define M_yyyyyyz            M(63)
#define M_xxxxxxxx           M(64)
#define L_xxxxxxxx           L(64)
#define M_xxxxxxxy           M(65)
#define L_xxxxxxxy           L(65)
#define M_xxxxxxxz           M(66)
#define L_xxxxxxxz           L(66)
#define L_xxxxxxyy           L(67)
#define M_xxxxxxyy           M(67)
#define M_xxxxxxyz           M(68)
#define L_xxxxxxyz           L(68)
#define M_xxxxxyyy           M(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define M_xxxxxyyz           M(70)
#define M_xxxxyyyy           M(71)
#define L_xxxxyyyy           L(71)
#define M_xxxxyyyz           M(72)
#define L_xxxxyyyz           L(72)
#define M_xxxyyyyy           M(73)
#define L_xxxyyyyy           L(73)
#define L_xxxyyyyz           L(74)
#define M_xxxyyyyz           M(74)
#define M_xxyyyyyy           M(75)
#define L_xxyyyyyy           L(75)
#define M_xxyyyyyz           M(76)
#define L_xxyyyyyz           L(76)
#define L_xyyyyyyy           L(77)
#define M_xyyyyyyy           M(77)
#define M_xyyyyyyz           M(78)
#define L_xyyyyyyz           L(78)
#define L_yyyyyyyy           L(79)
#define M_yyyyyyyy           M(79)
#define M_yyyyyyyz           M(80)
#define L_yyyyyyyz           L(80)
    v510       = y*z
    v511       = x*y
    v496       = 15.0d0*v510
    v498       = v511
    v500       = v510
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
    v357       = 0.000198412698412698d0*M_xxxxxxx
    v358       = 0.00138888888888889d0*M_xxxxxxy
    v359       = 0.00138888888888889d0*M_xxxxxxz
    v360       = 0.00416666666666667d0*M_xxxxxyy
    v361       = 0.00833333333333333d0*M_xxxxxyz
    v363       = 0.00694444444444444d0*M_xxxxyyy
    v364       = 0.0208333333333333d0*M_xxxxyyz
    v367       = 0.00694444444444444d0*M_xxxyyyy
    v368       = 0.0277777777777778d0*M_xxxyyyz
    v372       = 0.00416666666666667d0*M_xxyyyyy
    v373       = 0.0208333333333333d0*M_xxyyyyz
    v418       = 0.5d0*M_yy
    v420       = 0.166666666666667d0*M_yyy
    v421       = 0.5d0*M_yyz
    v425       = 0.0416666666666667d0*M_yyyy
    v426       = 0.166666666666667d0*M_yyyz
    v433       = 0.00833333333333333d0*M_yyyyy
    v434       = 0.0416666666666667d0*M_yyyyz
    v444       = 0.00138888888888889d0*M_yyyyyy
    v445       = 0.00833333333333333d0*M_yyyyyz
    v458       = 0.000198412698412698d0*M_yyyyyyy
    v459       = 0.00138888888888889d0*M_yyyyyyz
    M_zz       = -(M_xx + M_yy)
    v475       = 0.5d0*M_zz
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    v476       = 0.166666666666667d0*M_zzz
    M_xxzz     = -(M_xxxx + M_xxyy)
    v148       = 0.25d0*M_xxzz
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v427       = 0.25d0*M_yyzz
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    v477       = 0.0416666666666667d0*M_zzzz
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
    v435       = 0.0833333333333333d0*M_yyyzz
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v436       = 0.0833333333333333d0*M_yyzzz
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    v478       = 0.00833333333333333d0*M_zzzzz
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
    v446       = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v447       = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v448       = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    v479       = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v362       = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    v365       = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v366       = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v369       = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    v370       = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    v371       = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v374       = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v375       = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    v376       = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v377       = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v460       = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v461       = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v462       = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v463       = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    v480       = 0.000198412698412698d0*M_zzzzzzz
    M_xxxxxxzz = -(M_xxxxxxxx + M_xxxxxxyy)
    M_xxxxxyzz = -(M_xxxxxxxy + M_xxxxxyyy)
    M_xxxxxzzz = -(M_xxxxxxxz + M_xxxxxyyz)
    M_xxxxyyzz = -(M_xxxxxxyy + M_xxxxyyyy)
    M_xxxxyzzz = -(M_xxxxxxyz + M_xxxxyyyz)
    M_xxxxzzzz = -(M_xxxxxxzz + M_xxxxyyzz)
    M_xxxyyyzz = -(M_xxxxxyyy + M_xxxyyyyy)
    M_xxxyyzzz = -(M_xxxxxyyz + M_xxxyyyyz)
    M_xxxyzzzz = -(M_xxxxxyzz + M_xxxyyyzz)
    M_xxxzzzzz = -(M_xxxxxzzz + M_xxxyyzzz)
    M_xxyyyyzz = -(M_xxxxyyyy + M_xxyyyyyy)
    M_xxyyyzzz = -(M_xxxxyyyz + M_xxyyyyyz)
    M_xxyyzzzz = -(M_xxxxyyzz + M_xxyyyyzz)
    M_xxyzzzzz = -(M_xxxxyzzz + M_xxyyyzzz)
    M_xxzzzzzz = -(M_xxxxzzzz + M_xxyyzzzz)
    M_xyyyyyzz = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz = -(M_xxxyyyzz + M_xyyyyyzz)
    M_xyyzzzzz = -(M_xxxyyzzz + M_xyyyyzzz)
    M_xyzzzzzz = -(M_xxxyzzzz + M_xyyyzzzz)
    M_xzzzzzzz = -(M_xxxzzzzz + M_xyyzzzzz)
    M_yyyyyyzz = -(M_xxyyyyyy + M_yyyyyyyy)
    M_yyyyyzzz = -(M_xxyyyyyz + M_yyyyyyyz)
    M_yyyyzzzz = -(M_xxyyyyzz + M_yyyyyyzz)
    M_yyyzzzzz = -(M_xxyyyzzz + M_yyyyyzzz)
    M_yyzzzzzz = -(M_xxyyzzzz + M_yyyyzzzz)
    M_yzzzzzzz = -(M_xxyzzzzz + M_yyyzzzzz)
    M_zzzzzzzz = -(M_xxzzzzzz + M_yyzzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v481       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v481
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
    v482       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v483       = v1*v19
    v27        = v482
    v29        = 7.0d0*v1
    v59        = v483
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v484       = v0*v31
    v65        = v484
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
    v485       = 3.0d0*h
    v486       = h*v0
    v487       = h*v1
    v488       = h*v19
    v490       = v1*v486
    v492       = h*v31
    v4         = -h
    v12        = v485
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v489       = v0*v17
    v491       = v1*v17
    v18        = 3.0d0*v17
    v20        = v486
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v487
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 - 945.0d0*v19 + 630.0d0*v486
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 - 945.0d0*v31 + 630.0d0*v487
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v488
    v51        = v489
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v490
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v491
    v67        = v33 + v53 + v66
    v69        = v492
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v506       = -v85
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
    v106       = v17*v482
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v507       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v116       = -v108
    v117       = -1430.0d0*v57
    v508       = v116 + v117
    v119       = -1351350.0d0*v490
    v509       = v111 + v119
    v131       = v1*v46
    v132       = v31*v486
    v134       = -(3.0d0*v46 + 286.0d0*v57)
    v208       = v17*v31
    v290       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
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
    v493       = 3.0d0*v3
    v6         = v493*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v493*v500
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v494       = 3.0d0*v8
    v9         = v8*x
    v11        = v494*(h - v10)
    D_xxx      = -3.0d0*v9*(v481 - v485)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    v378       = 0.5d0*D_xyy
    D_xyz      = -v496*v9
    D_xzz      = -(D_xxx + D_xyy)
    v399       = 0.5d0*D_xzz
    D_yyy      = v494*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    v464       = 0.5d0*D_yzz
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v495       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v495*y
    v26        = v495*z
    v28        = v15*v496
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v262       = 0.5d0*D_xxyy
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    v277       = 0.5d0*D_xxzz
    D_xyyy     = v22*v30
    v329       = 0.5d0*D_xyyy
    v379       = 0.166666666666667d0*D_xyyy
    D_xyyz     = v26*(v29 + v4)
    v394       = 0.5d0*D_xyyz
    D_xyzz     = -(D_xxxy + D_xyyy)
    v344       = 0.5d0*D_xyzz
    D_xzzz     = -(D_xxxz + D_xyyz)
    v400       = 0.166666666666667d0*D_xzzz
    v413       = 0.5d0*D_xzzz
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    v449       = 0.5d0*D_yyzz
    D_yzzz     = -(D_xxyz + D_yyyz)
    v465       = 0.166666666666667d0*D_yzzz
    v470       = 0.5d0*D_yzzz
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v512       = v34*z
    v497       = 15.0d0*v34
    v35        = v497*x
    v39        = v512
    v41        = 315.0d0*v498*v512
    v42        = v497*y
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
    D_xxyyz    = v39*(v36 - 945.0d0*v482 + 105.0d0*(v486 + v487))
    v273       = 0.5d0*D_xxyyz
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    v238       = 0.5d0*D_xxyzz
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    v278       = 0.166666666666667d0*D_xxzzz
    v286       = 0.5d0*D_xxzzz
    D_xyyyy    = v34*v43*x
    v310       = 0.5d0*D_xyyyy
    v330       = 0.166666666666667d0*D_xyyyy
    v380       = 0.0416666666666667d0*D_xyyyy
    D_xyyyz    = v41*(h - v7)
    v340       = 0.5d0*D_xyyyz
    v390       = 0.166666666666667d0*D_xyyyz
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    v320       = 0.5d0*D_xyyzz
    v395       = 0.25d0*D_xyyzz
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    v345       = 0.166666666666667d0*D_xyzzz
    v353       = 0.5d0*D_xyzzz
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    v401       = 0.0416666666666667d0*D_xzzzz
    v414       = 0.166666666666667d0*D_xzzzz
    D_yyyyy    = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz    = v39*v43
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    v437       = 0.5d0*D_yyyzz
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    v450       = 0.166666666666667d0*D_yyzzz
    v454       = 0.5d0*D_yyzzz
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    v466       = 0.0416666666666667d0*D_yzzzz
    v471       = 0.166666666666667d0*D_yzzzz
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    u12        = u6*u6
    u13        = u6*u7
    v44        = u13
    v513       = 315.0d0*v44
    v499       = v513*x
    v45        = 45.0d0*v44
    v52        = v499*y
    v56        = v499*z
    v60        = v500*v513
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 + v17*v29 - 21.0d0*v488 + 14.0d0*v51 + 231.0d0*v59)
    v149       = 0.5d0*D_xxxxyy
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    v155       = 0.5d0*D_xxxxzz
    D_xxxyyy   = 945.0d0*v44*v498*(11.0d0*v27 + v17 + v61 + v62)
    v168       = 0.5d0*D_xxxyyy
    v190       = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    v196       = 0.5d0*D_xxxyyz
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    v174       = 0.5d0*D_xxxyzz
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    v200       = 0.166666666666667d0*D_xxxzzz
    v205       = 0.5d0*D_xxxzzz
    D_xxyyyy   = v45*(v58 + v17*v24 - 21.0d0*v492 + 14.0d0*v64 + 231.0d0*v65)
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
    v299       = 0.5d0*D_xyyyyy
    v311       = 0.166666666666667d0*D_xyyyyy
    v331       = 0.0416666666666667d0*D_xyyyyy
    v381       = 0.00833333333333333d0*D_xyyyyy
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    v317       = 0.5d0*D_xyyyyz
    v337       = 0.166666666666667d0*D_xyyyyz
    v387       = 0.0416666666666667d0*D_xyyyyz
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    v305       = 0.5d0*D_xyyyzz
    v341       = 0.25d0*D_xyyyzz
    v391       = 0.0833333333333333d0*D_xyyyzz
    v408       = 0.166666666666667d0*D_xyyyzz
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    v321       = 0.166666666666667d0*D_xyyzzz
    v326       = 0.5d0*D_xyyzzz
    v396       = 0.0833333333333333d0*D_xyyzzz
    v410       = 0.25d0*D_xyyzzz
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    v346       = 0.0416666666666667d0*D_xyzzzz
    v354       = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    v402       = 0.00833333333333333d0*D_xzzzzz
    v415       = 0.0416666666666667d0*D_xzzzzz
    D_yyyyyy   = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz   = v60*v67
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    v428       = 0.5d0*D_yyyyzz
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    v438       = 0.166666666666667d0*D_yyyzzz
    v441       = 0.5d0*D_yyyzzz
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    v451       = 0.0416666666666667d0*D_yyzzzz
    v455       = 0.166666666666667d0*D_yyzzzz
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    v467       = 0.00833333333333333d0*D_yzzzzz
    v472       = 0.0416666666666667d0*D_yzzzzz
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    u14        = u7*u7
    u15        = u7*u8
    v70        = u15
    v514       = 945.0d0*v70
    v501       = 315.0d0*v70
    v71        = v501*x
    v75        = v501*y
    v77        = v501*z
    v81        = v500*v514*x
    v83        = v514
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy  = v75*v76
    D_xxxxxxz  = v76*v77
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v125       = 0.5d0*D_xxxxxyy
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    v128       = 0.5d0*D_xxxxxzz
    D_xxxxyyy  = -v83*y*(v506 + v1*v18 + v1*v82 - v84)
    v137       = 0.5d0*D_xxxxyyy
    v150       = 0.166666666666667d0*D_xxxxyyy
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    v153       = 0.5d0*D_xxxxyyz
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    v140       = 0.5d0*D_xxxxyzz
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    v156       = 0.166666666666667d0*D_xxxxzzz
    v158       = 0.5d0*D_xxxxzzz
    D_xxxyyyy  = -v83*x*(v506 + v0*v18 + v0*v90 - v89)
    v162       = 0.5d0*D_xxxyyyy
    v169       = 0.166666666666667d0*D_xxxyyyy
    v191       = 0.0416666666666667d0*D_xxxyyyy
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v172       = 0.5d0*D_xxxyyyz
    v194       = 0.166666666666667d0*D_xxxyyyz
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
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    v221       = 0.5d0*D_xxyyyyz
    v233       = 0.166666666666667d0*D_xxyyyyz
    v268       = 0.0416666666666667d0*D_xxyyyyz
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
    v293       = 0.5d0*D_xyyyyyy
    v300       = 0.166666666666667d0*D_xyyyyyy
    v312       = 0.0416666666666667d0*D_xyyyyyy
    v332       = 0.00833333333333333d0*D_xyyyyyy
    v382       = 0.00138888888888889d0*D_xyyyyyy
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    v303       = 0.5d0*D_xyyyyyz
    v315       = 0.166666666666667d0*D_xyyyyyz
    v335       = 0.0416666666666667d0*D_xyyyyyz
    v385       = 0.00833333333333333d0*D_xyyyyyz
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    v296       = 0.5d0*D_xyyyyzz
    v318       = 0.25d0*D_xyyyyzz
    v338       = 0.0833333333333333d0*D_xyyyyzz
    v350       = 0.166666666666667d0*D_xyyyyzz
    v388       = 0.0208333333333333d0*D_xyyyyzz
    v406       = 0.0416666666666667d0*D_xyyyyzz
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    v306       = 0.166666666666667d0*D_xyyyzzz
    v308       = 0.5d0*D_xyyyzzz
    v342       = 0.0833333333333333d0*D_xyyyzzz
    v351       = 0.25d0*D_xyyyzzz
    v392       = 0.0277777777777778d0*D_xyyyzzz
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    v322       = 0.0416666666666667d0*D_xyyzzzz
    v327       = 0.166666666666667d0*D_xyyzzzz
    v397       = 0.0208333333333333d0*D_xyyzzzz
    v411       = 0.0833333333333333d0*D_xyyzzzz
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    v347       = 0.00833333333333333d0*D_xyzzzzz
    v355       = 0.0416666666666667d0*D_xyzzzzz
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    v403       = 0.00138888888888889d0*D_xzzzzzz
    v416       = 0.00833333333333333d0*D_xzzzzzz
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz  = v77*v94
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    v422       = 0.5d0*D_yyyyyzz
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    v429       = 0.166666666666667d0*D_yyyyzzz
    v431       = 0.5d0*D_yyyyzzz
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    v439       = 0.0416666666666667d0*D_yyyzzzz
    v442       = 0.166666666666667d0*D_yyyzzzz
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    v452       = 0.00833333333333333d0*D_yyzzzzz
    v456       = 0.0416666666666667d0*D_yyzzzzz
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    v468       = 0.00138888888888889d0*D_yzzzzzz
    v473       = 0.00833333333333333d0*D_yzzzzzz
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v502       = v511*v95
    v503       = v95*z
    v504       = v503*x
    v505       = v503*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v502
    v105       = 2835.0d0*v504
    v110       = v505
    v115       = 945.0d0*v502
    v118       = v504
    v133       = 2835.0d0*v505
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = L_xxxxxxxx + (D_xxxxxxxx*M_0)
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = L_xxxxxxxy + (D_xxxxxxxy*M_0)
    D_xxxxxxxz = v104*v105
    L_xxxxxxx  = L_xxxxxxx + (D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxy*M_y + D_xxxxxxxz*M_z)
    L_xxxxxxxz = L_xxxxxxxz + (D_xxxxxxxz*M_0)
    D_xxxxxxyy = -v96*(v507 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    v113       = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy = L_xxxxxxyy + (D_xxxxxxyy*M_0)
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v489 + 155925.0d0*(-13.0d0*v488 + 13.0d0*v49))
    L_xxxxxxy  = L_xxxxxxy + (D_xxxxxxxy*M_x + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyz*M_z)
    L_xxxxxxyz = L_xxxxxxyz + (D_xxxxxxyz*M_0)
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    v114       = 0.5d0*D_xxxxxxzz
    L_xxxxxx   = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*v112 + D_xxxxxxxy*M_xy + &
      D_xxxxxxxz*M_xz + D_xxxxxxy*M_y + D_xxxxxxyz*M_yz + D_xxxxxxz*M_z &
      + M_yy*v113 + M_zz*v114)
    L_xxxxxxz  = L_xxxxxxz + (D_xxxxxxxz*M_x + D_xxxxxxyz*M_y + D_xxxxxxz*M_0 + D_xxxxxxzz*M_z)
    D_xxxxxyyy = v115*(v508 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v120       = 0.5d0*D_xxxxxyyy
    v126       = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy = L_xxxxxyyy + (D_xxxxxyyy*M_0)
    D_xxxxxyyz = v118*(v509 + 2027025.0d0*v483 - 135135.0d0*v488 + 103950.0d0*v489 + &
      155925.0d0*v491)
    v127       = 0.5d0*D_xxxxxyyz
    L_xxxxxyy  = L_xxxxxyy + (D_xxxxxxyy*M_x + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyz*M_z)
    L_xxxxxyyz = L_xxxxxyyz + (D_xxxxxyyz*M_0)
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    v121       = 0.5d0*D_xxxxxyzz
    L_xxxxxy   = L_xxxxxy + (D_xxxxxxxy*v112 + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyz*M_yz + D_xxxxxyz*M_z + &
      M_yy*v120 + M_zz*v121)
    L_xxxxxyz  = L_xxxxxyz + (D_xxxxxxyz*M_x + D_xxxxxyyz*M_y + D_xxxxxyz*M_0 + D_xxxxxyzz*M_z)
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    v129       = 0.166666666666667d0*D_xxxxxzzz
    v130       = 0.5d0*D_xxxxxzzz
    L_xxxxx    = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*v112 + D_xxxxxxxx*v122 + &
      D_xxxxxxxy*v123 + D_xxxxxxxz*v124 + D_xxxxxxy*M_xy + D_xxxxxxyz* &
      M_xyz + D_xxxxxxz*M_xz + D_xxxxxy*M_y + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + M_xyy*v113 + M_xzz*v114 + M_yy*v125 + M_yyy*v126 + M_yyz* &
      v127 + M_yzz*v121 + M_zz*v128 + M_zzz*v129)
    L_xxxxxz   = L_xxxxxz + (D_xxxxxxxz*v112 + D_xxxxxxyz*M_xy + D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + &
      D_xxxxxyz*M_y + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + D_xxxxxzz*M_z + &
      M_yy*v127 + M_zz*v130)
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v131) - 858.0d0*(v1*v50 + v132))
    v135       = 0.5d0*D_xxxxyyyy
    v138       = 0.166666666666667d0*D_xxxxyyyy
    v151       = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy = L_xxxxyyyy + (D_xxxxyyyy*M_0)
    D_xxxxyyyz = v133*(v134 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v139       = 0.5d0*D_xxxxyyyz
    v152       = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyy  = L_xxxxyyy + (D_xxxxxyyy*M_x + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyz*M_z)
    L_xxxxyyyz = L_xxxxyyyz + (D_xxxxyyyz*M_0)
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    v136       = 0.5d0*D_xxxxyyzz
    v154       = 0.25d0*D_xxxxyyzz
    L_xxxxyy   = L_xxxxyy + (D_xxxxxxyy*v112 + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyz*M_yz + D_xxxxyyz*M_z + &
      M_yy*v135 + M_zz*v136)
    L_xxxxyyz  = L_xxxxyyz + (D_xxxxxyyz*M_x + D_xxxxyyyz*M_y + D_xxxxyyz*M_0 + D_xxxxyyzz*M_z)
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    v141       = 0.166666666666667d0*D_xxxxyzzz
    v142       = 0.5d0*D_xxxxyzzz
    L_xxxxy    = L_xxxxy + (D_xxxxxxxy*v122 + D_xxxxxxy*v112 + D_xxxxxxyy*v123 + D_xxxxxxyz*v124 + &
      D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz &
      + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyz*M_yz + D_xxxxyz*M_z + &
      M_xyy*v120 + M_xzz*v121 + M_yy*v137 + M_yyy*v138 + M_yyz*v139 + &
      M_yzz*v136 + M_zz*v140 + M_zzz*v141)
    L_xxxxyz   = L_xxxxyz + (D_xxxxxxyz*v112 + D_xxxxxyyz*M_xy + D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + &
      D_xxxxyyz*M_y + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + D_xxxxyzz*M_z + &
      M_yy*v139 + M_zz*v142)
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    v157       = 0.0416666666666667d0*D_xxxxzzzz
    v159       = 0.166666666666667d0*D_xxxxzzzz
    L_xxxx     = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v112 + D_xxxxxxx*v122 + D_xxxxxxxx* &
      v143 + D_xxxxxxxy*v144 + D_xxxxxxxz*v145 + D_xxxxxxy*v123 + &
      D_xxxxxxyy*v146 + D_xxxxxxyz*v147 + D_xxxxxxz*v124 + D_xxxxxxzz* &
      v148 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxy* &
      M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_xyy*v125 + M_xyyy*v126 + &
      M_xyyz*v127 + M_xyzz*v121 + M_xzz*v128 + M_xzzz*v129 + M_yy*v149 &
      + M_yyy*v150 + M_yyyy*v151 + M_yyyz*v152 + M_yyz*v153 + M_yyzz* &
      v154 + M_yzz*v140 + M_yzzz*v141 + M_zz*v155 + M_zzz*v156 + M_zzzz &
      *v157)
    L_xxxxz    = L_xxxxz + (D_xxxxxxxz*v122 + D_xxxxxxyz*v123 + D_xxxxxxz*v112 + D_xxxxxxzz*v124 + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxz*M_x + D_xxxxxzz*M_xz &
      + D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + D_xxxxzz*M_z + &
      M_xyy*v127 + M_xzz*v130 + M_yy*v153 + M_yyy*v152 + M_yyz*v136 + &
      M_yzz*v142 + M_zz*v158 + M_zzz*v159)
    D_xxxyyyyy = v115*(v508 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v160       = 0.5d0*D_xxxyyyyy
    v163       = 0.166666666666667d0*D_xxxyyyyy
    v170       = 0.0416666666666667d0*D_xxxyyyyy
    v192       = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy = L_xxxyyyyy + (D_xxxyyyyy*M_0)
    D_xxxyyyyz = v105*(v134 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v164       = 0.5d0*D_xxxyyyyz
    v171       = 0.166666666666667d0*D_xxxyyyyz
    v193       = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyy  = L_xxxyyyy + (D_xxxxyyyy*M_x + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyz*M_z)
    L_xxxyyyyz = L_xxxyyyyz + (D_xxxyyyyz*M_0)
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    v161       = 0.5d0*D_xxxyyyzz
    v173       = 0.25d0*D_xxxyyyzz
    v195       = 0.0833333333333333d0*D_xxxyyyzz
    v203       = 0.166666666666667d0*D_xxxyyyzz
    L_xxxyyy   = L_xxxyyy + (D_xxxxxyyy*v112 + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyz*M_yz + D_xxxyyyz*M_z + &
      M_yy*v160 + M_zz*v161)
    L_xxxyyyz  = L_xxxyyyz + (D_xxxxyyyz*M_x + D_xxxyyyyz*M_y + D_xxxyyyz*M_0 + D_xxxyyyzz*M_z)
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    v166       = 0.166666666666667d0*D_xxxyyzzz
    v167       = 0.5d0*D_xxxyyzzz
    v198       = 0.0833333333333333d0*D_xxxyyzzz
    v204       = 0.25d0*D_xxxyyzzz
    L_xxxyy    = L_xxxyy + (D_xxxxxxyy*v122 + D_xxxxxyy*v112 + D_xxxxxyyy*v123 + D_xxxxxyyz*v124 + &
      D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz &
      + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyz*M_yz + D_xxxyyz*M_z + &
      M_xyy*v135 + M_xzz*v136 + M_yy*v162 + M_yyy*v163 + M_yyz*v164 + &
      M_yzz*v161 + M_zz*v165 + M_zzz*v166)
    L_xxxyyz   = L_xxxyyz + (D_xxxxxyyz*v112 + D_xxxxyyyz*M_xy + D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + &
      D_xxxyyyz*M_y + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + D_xxxyyzz*M_z + &
      M_yy*v164 + M_zz*v167)
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    v176       = 0.0416666666666667d0*D_xxxyzzzz
    v178       = 0.166666666666667d0*D_xxxyzzzz
    L_xxxy     = L_xxxy + (D_xxxxxxxy*v143 + D_xxxxxxy*v122 + D_xxxxxxyy*v144 + D_xxxxxxyz*v145 + &
      D_xxxxxy*v112 + D_xxxxxyy*v123 + D_xxxxxyyy*v146 + D_xxxxxyyz* &
      v147 + D_xxxxxyz*v124 + D_xxxxxyzz*v148 + D_xxxxy*M_x + D_xxxxyy* &
      M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyy*M_y &
      + D_xxxyyz*M_yz + D_xxxyz*M_z + M_xyy*v137 + M_xyyy*v138 + M_xyyz &
      *v139 + M_xyzz*v136 + M_xzz*v140 + M_xzzz*v141 + M_yy*v168 + &
      M_yyy*v169 + M_yyyy*v170 + M_yyyz*v171 + M_yyz*v172 + M_yyzz*v173 &
      + M_yzz*v165 + M_yzzz*v166 + M_zz*v174 + M_zzz*v175 + M_zzzz*v176)
    L_xxxyz    = L_xxxyz + (D_xxxxxxyz*v122 + D_xxxxxyyz*v123 + D_xxxxxyz*v112 + D_xxxxxyzz*v124 + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyz*M_x + D_xxxxyzz*M_xz &
      + D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + D_xxxyzz*M_z + &
      M_xyy*v139 + M_xzz*v142 + M_yy*v172 + M_yyy*v171 + M_yyz*v161 + &
      M_yzz*v167 + M_zz*v177 + M_zzz*v178)
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    v202       = 0.00833333333333333d0*D_xxxzzzzz
    v207       = 0.0416666666666667d0*D_xxxzzzzz
    L_xxx      = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v112 + D_xxxxxx*v122 + D_xxxxxxx*v143 + &
      D_xxxxxxxx*v179 + D_xxxxxxxy*v180 + D_xxxxxxxz*v181 + D_xxxxxxy* &
      v144 + D_xxxxxxyy*v182 + D_xxxxxxyz*v183 + D_xxxxxxz*v145 + &
      D_xxxxxxzz*v184 + D_xxxxxy*v123 + D_xxxxxyy*v146 + D_xxxxxyyy* &
      v185 + D_xxxxxyyz*v186 + D_xxxxxyz*v147 + D_xxxxxyzz*v187 + &
      D_xxxxxz*v124 + D_xxxxxzz*v148 + D_xxxxxzzz*v188 + D_xxxxy*M_xy + &
      D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxy*M_y + D_xxxyz*M_yz + &
      D_xxxz*M_z + M_xyy*v149 + M_xyyy*v150 + M_xyyyy*v151 + M_xyyyz* &
      v152 + M_xyyz*v153 + M_xyyzz*v154 + M_xyzz*v140 + M_xyzzz*v141 + &
      M_xzz*v155 + M_xzzz*v156 + M_xzzzz*v157 + M_yy*v189 + M_yyy*v190 &
      + M_yyyy*v191 + M_yyyyy*v192 + M_yyyyz*v193 + M_yyyz*v194 + &
      M_yyyzz*v195 + M_yyz*v196 + M_yyzz*v197 + M_yyzzz*v198 + M_yzz* &
      v174 + M_yzzz*v175 + M_yzzzz*v176 + M_zz*v199 + M_zzz*v200 + &
      M_zzzz*v201 + M_zzzzz*v202)
    L_xxxz     = L_xxxz + (D_xxxxxxxz*v143 + D_xxxxxxyz*v144 + D_xxxxxxz*v122 + D_xxxxxxzz*v145 + &
      D_xxxxxyyz*v146 + D_xxxxxyz*v123 + D_xxxxxyzz*v147 + D_xxxxxz* &
      v112 + D_xxxxxzz*v124 + D_xxxxxzzz*v148 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y + &
      D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_xyy*v153 + M_xyyy* &
      v152 + M_xyyz*v136 + M_xyzz*v142 + M_xzz*v158 + M_xzzz*v159 + &
      M_yy*v196 + M_yyy*v194 + M_yyyy*v193 + M_yyyz*v203 + M_yyz*v165 + &
      M_yyzz*v204 + M_yzz*v177 + M_yzzz*v178 + M_zz*v205 + M_zzz*v206 + &
      M_zzzz*v207)
    D_xxyyyyyy = -v96*(v507 + h*v92 + v0*v108 + 135.0d0*v131 - 495.0d0*v208 + 6435.0d0*( &
      -v0*v68 + v132))
    v209       = 0.5d0*D_xxyyyyyy
    v212       = 0.166666666666667d0*D_xxyyyyyy
    v219       = 0.0416666666666667d0*D_xxyyyyyy
    v231       = 0.00833333333333333d0*D_xxyyyyyy
    v266       = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy = L_xxyyyyyy + (D_xxyyyyyy*M_0)
    D_xxyyyyyz = v110*(v509 + 2027025.0d0*v484 + 155925.0d0*v489 + 103950.0d0*v491 - &
      135135.0d0*v492)
    v213       = 0.5d0*D_xxyyyyyz
    v220       = 0.166666666666667d0*D_xxyyyyyz
    v232       = 0.0416666666666667d0*D_xxyyyyyz
    v267       = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyy  = L_xxyyyyy + (D_xxxyyyyy*M_x + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyz*M_z)
    L_xxyyyyyz = L_xxyyyyyz + (D_xxyyyyyz*M_0)
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    v210       = 0.5d0*D_xxyyyyzz
    v222       = 0.25d0*D_xxyyyyzz
    v234       = 0.0833333333333333d0*D_xxyyyyzz
    v242       = 0.166666666666667d0*D_xxyyyyzz
    v269       = 0.0208333333333333d0*D_xxyyyyzz
    v282       = 0.0416666666666667d0*D_xxyyyyzz
    L_xxyyyy   = L_xxyyyy + (D_xxxxyyyy*v112 + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyz*M_yz + D_xxyyyyz*M_z + &
      M_yy*v209 + M_zz*v210)
    L_xxyyyyz  = L_xxyyyyz + (D_xxxyyyyz*M_x + D_xxyyyyyz*M_y + D_xxyyyyz*M_0 + D_xxyyyyzz*M_z)
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    v215       = 0.166666666666667d0*D_xxyyyzzz
    v216       = 0.5d0*D_xxyyyzzz
    v237       = 0.0833333333333333d0*D_xxyyyzzz
    v243       = 0.25d0*D_xxyyyzzz
    v272       = 0.0277777777777778d0*D_xxyyyzzz
    L_xxyyy    = L_xxyyy + (D_xxxxxyyy*v122 + D_xxxxyyy*v112 + D_xxxxyyyy*v123 + D_xxxxyyyz*v124 + &
      D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz &
      + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyz*M_yz + D_xxyyyz*M_z + &
      M_xyy*v160 + M_xzz*v161 + M_yy*v211 + M_yyy*v212 + M_yyz*v213 + &
      M_yzz*v210 + M_zz*v214 + M_zzz*v215)
    L_xxyyyz   = L_xxyyyz + (D_xxxxyyyz*v112 + D_xxxyyyyz*M_xy + D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + &
      D_xxyyyyz*M_y + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + D_xxyyyzz*M_z + &
      M_yy*v213 + M_zz*v216)
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    v225       = 0.0416666666666667d0*D_xxyyzzzz
    v227       = 0.166666666666667d0*D_xxyyzzzz
    v276       = 0.0208333333333333d0*D_xxyyzzzz
    v285       = 0.0833333333333333d0*D_xxyyzzzz
    L_xxyy     = L_xxyy + (D_xxxxxxyy*v143 + D_xxxxxyy*v122 + D_xxxxxyyy*v144 + D_xxxxxyyz*v145 + &
      D_xxxxyy*v112 + D_xxxxyyy*v123 + D_xxxxyyyy*v146 + D_xxxxyyyz* &
      v147 + D_xxxxyyz*v124 + D_xxxxyyzz*v148 + D_xxxyy*M_x + D_xxxyyy* &
      M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyy*M_y &
      + D_xxyyyz*M_yz + D_xxyyz*M_z + M_xyy*v162 + M_xyyy*v163 + M_xyyz &
      *v164 + M_xyzz*v161 + M_xzz*v165 + M_xzzz*v166 + M_yy*v217 + &
      M_yyy*v218 + M_yyyy*v219 + M_yyyz*v220 + M_yyz*v221 + M_yyzz*v222 &
      + M_yzz*v214 + M_yzzz*v215 + M_zz*v223 + M_zzz*v224 + M_zzzz*v225)
    L_xxyyz    = L_xxyyz + (D_xxxxxyyz*v122 + D_xxxxyyyz*v123 + D_xxxxyyz*v112 + D_xxxxyyzz*v124 + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyz*M_x + D_xxxyyzz*M_xz &
      + D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + D_xxyyzz*M_z + &
      M_xyy*v164 + M_xzz*v167 + M_yy*v221 + M_yyy*v220 + M_yyz*v210 + &
      M_yzz*v216 + M_zz*v226 + M_zzz*v227)
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    v241       = 0.00833333333333333d0*D_xxyzzzzz
    v246       = 0.0416666666666667d0*D_xxyzzzzz
    L_xxy      = L_xxy + (D_xxxxxxxy*v179 + D_xxxxxxy*v143 + D_xxxxxxyy*v180 + D_xxxxxxyz*v181 + &
      D_xxxxxy*v122 + D_xxxxxyy*v144 + D_xxxxxyyy*v182 + D_xxxxxyyz* &
      v183 + D_xxxxxyz*v145 + D_xxxxxyzz*v184 + D_xxxxy*v112 + D_xxxxyy &
      *v123 + D_xxxxyyy*v146 + D_xxxxyyyy*v185 + D_xxxxyyyz*v186 + &
      D_xxxxyyz*v147 + D_xxxxyyzz*v187 + D_xxxxyz*v124 + D_xxxxyzz*v148 &
      + D_xxxxyzzz*v188 + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyz*M_xyz + &
      D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z &
      + M_xyy*v168 + M_xyyy*v169 + M_xyyyy*v170 + M_xyyyz*v171 + M_xyyz &
      *v172 + M_xyyzz*v173 + M_xyzz*v165 + M_xyzzz*v166 + M_xzz*v174 + &
      M_xzzz*v175 + M_xzzzz*v176 + M_yy*v228 + M_yyy*v229 + M_yyyy*v230 &
      + M_yyyyy*v231 + M_yyyyz*v232 + M_yyyz*v233 + M_yyyzz*v234 + &
      M_yyz*v235 + M_yyzz*v236 + M_yyzzz*v237 + M_yzz*v223 + M_yzzz* &
      v224 + M_yzzzz*v225 + M_zz*v238 + M_zzz*v239 + M_zzzz*v240 + &
      M_zzzzz*v241)
    L_xxyz     = L_xxyz + (D_xxxxxxyz*v143 + D_xxxxxyyz*v144 + D_xxxxxyz*v122 + D_xxxxxyzz*v145 + &
      D_xxxxyyyz*v146 + D_xxxxyyz*v123 + D_xxxxyyzz*v147 + D_xxxxyz* &
      v112 + D_xxxxyzz*v124 + D_xxxxyzzz*v148 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y + &
      D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_xyy*v172 + M_xyyy* &
      v171 + M_xyyz*v161 + M_xyzz*v167 + M_xzz*v177 + M_xzzz*v178 + &
      M_yy*v235 + M_yyy*v233 + M_yyyy*v232 + M_yyyz*v242 + M_yyz*v214 + &
      M_yyzz*v243 + M_yzz*v226 + M_yzzz*v227 + M_zz*v244 + M_zzz*v245 + &
      M_zzzz*v246)
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    v281       = 0.00138888888888889d0*D_xxzzzzzz
    v289       = 0.00833333333333333d0*D_xxzzzzzz
    L_xx       = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*v112 + D_xxxxx*v122 + D_xxxxxx*v143 + &
      D_xxxxxxx*v179 + D_xxxxxxxx*v247 + D_xxxxxxxy*v248 + D_xxxxxxxz* &
      v249 + D_xxxxxxy*v180 + D_xxxxxxyy*v250 + D_xxxxxxyz*v251 + &
      D_xxxxxxz*v181 + D_xxxxxxzz*v252 + D_xxxxxy*v144 + D_xxxxxyy*v182 &
      + D_xxxxxyyy*v253 + D_xxxxxyyz*v254 + D_xxxxxyz*v183 + D_xxxxxyzz &
      *v255 + D_xxxxxz*v145 + D_xxxxxzz*v184 + D_xxxxxzzz*v256 + &
      D_xxxxy*v123 + D_xxxxyy*v146 + D_xxxxyyy*v185 + D_xxxxyyyy*v257 + &
      D_xxxxyyyz*v258 + D_xxxxyyz*v186 + D_xxxxyyzz*v259 + D_xxxxyz* &
      v147 + D_xxxxyzz*v187 + D_xxxxyzzz*v260 + D_xxxxz*v124 + D_xxxxzz &
      *v148 + D_xxxxzzz*v188 + D_xxxxzzzz*v261 + D_xxxy*M_xy + D_xxxyz* &
      M_xyz + D_xxxz*M_xz + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + M_xyy &
      *v189 + M_xyyy*v190 + M_xyyyy*v191 + M_xyyyyy*v192 + M_xyyyyz* &
      v193 + M_xyyyz*v194 + M_xyyyzz*v195 + M_xyyz*v196 + M_xyyzz*v197 &
      + M_xyyzzz*v198 + M_xyzz*v174 + M_xyzzz*v175 + M_xyzzzz*v176 + &
      M_xzz*v199 + M_xzzz*v200 + M_xzzzz*v201 + M_xzzzzz*v202 + M_yy* &
      v262 + M_yyy*v263 + M_yyyy*v264 + M_yyyyy*v265 + M_yyyyyy*v266 + &
      M_yyyyyz*v267 + M_yyyyz*v268 + M_yyyyzz*v269 + M_yyyz*v270 + &
      M_yyyzz*v271 + M_yyyzzz*v272 + M_yyz*v273 + M_yyzz*v274 + M_yyzzz &
      *v275 + M_yyzzzz*v276 + M_yzz*v238 + M_yzzz*v239 + M_yzzzz*v240 + &
      M_yzzzzz*v241 + M_zz*v277 + M_zzz*v278 + M_zzzz*v279 + M_zzzzz* &
      v280 + M_zzzzzz*v281)
    L_xxz      = L_xxz + (D_xxxxxxxz*v179 + D_xxxxxxyz*v180 + D_xxxxxxz*v143 + D_xxxxxxzz*v181 + &
      D_xxxxxyyz*v182 + D_xxxxxyz*v144 + D_xxxxxyzz*v183 + D_xxxxxz* &
      v122 + D_xxxxxzz*v145 + D_xxxxxzzz*v184 + D_xxxxyyyz*v185 + &
      D_xxxxyyz*v146 + D_xxxxyyzz*v186 + D_xxxxyz*v123 + D_xxxxyzz*v147 &
      + D_xxxxyzzz*v187 + D_xxxxz*v112 + D_xxxxzz*v124 + D_xxxxzzz*v148 &
      + D_xxxxzzzz*v188 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + &
      D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z &
      + M_xyy*v196 + M_xyyy*v194 + M_xyyyy*v193 + M_xyyyz*v203 + M_xyyz &
      *v165 + M_xyyzz*v204 + M_xyzz*v177 + M_xyzzz*v178 + M_xzz*v205 + &
      M_xzzz*v206 + M_xzzzz*v207 + M_yy*v273 + M_yyy*v270 + M_yyyy*v268 &
      + M_yyyyy*v267 + M_yyyyz*v282 + M_yyyz*v283 + M_yyyzz*v237 + &
      M_yyz*v223 + M_yyzz*v284 + M_yyzzz*v285 + M_yzz*v244 + M_yzzz* &
      v245 + M_yzzzz*v246 + M_zz*v286 + M_zzz*v287 + M_zzzz*v288 + &
      M_zzzzz*v289)
    D_xyyyyyyy = v102*v290
    v291       = 0.5d0*D_xyyyyyyy
    v294       = 0.166666666666667d0*D_xyyyyyyy
    v301       = 0.0416666666666667d0*D_xyyyyyyy
    v313       = 0.00833333333333333d0*D_xyyyyyyy
    v333       = 0.00138888888888889d0*D_xyyyyyyy
    v383       = 0.000198412698412698d0*D_xyyyyyyy
    L_xyyyyyyy = L_xyyyyyyy + (D_xyyyyyyy*M_0)
    D_xyyyyyyz = v118*(v111 + 467775.0d0*v491 + 155925.0d0*(-13.0d0*v492 + 13.0d0*v68))
    v295       = 0.5d0*D_xyyyyyyz
    v302       = 0.166666666666667d0*D_xyyyyyyz
    v314       = 0.0416666666666667d0*D_xyyyyyyz
    v334       = 0.00833333333333333d0*D_xyyyyyyz
    v384       = 0.00138888888888889d0*D_xyyyyyyz
    L_xyyyyyy  = L_xyyyyyy + (D_xxyyyyyy*M_x + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyz*M_z)
    L_xyyyyyyz = L_xyyyyyyz + (D_xyyyyyyz*M_0)
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    v292       = 0.5d0*D_xyyyyyzz
    v304       = 0.25d0*D_xyyyyyzz
    v316       = 0.0833333333333333d0*D_xyyyyyzz
    v324       = 0.166666666666667d0*D_xyyyyyzz
    v336       = 0.0208333333333333d0*D_xyyyyyzz
    v349       = 0.0416666666666667d0*D_xyyyyyzz
    v386       = 0.00416666666666667d0*D_xyyyyyzz
    v405       = 0.00833333333333333d0*D_xyyyyyzz
    L_xyyyyy   = L_xyyyyy + (D_xxxyyyyy*v112 + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyz*M_yz + D_xyyyyyz*M_z + &
      M_yy*v291 + M_zz*v292)
    L_xyyyyyz  = L_xyyyyyz + (D_xxyyyyyz*M_x + D_xyyyyyyz*M_y + D_xyyyyyz*M_0 + D_xyyyyyzz*M_z)
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    v297       = 0.166666666666667d0*D_xyyyyzzz
    v298       = 0.5d0*D_xyyyyzzz
    v319       = 0.0833333333333333d0*D_xyyyyzzz
    v325       = 0.25d0*D_xyyyyzzz
    v339       = 0.0277777777777778d0*D_xyyyyzzz
    v389       = 0.00694444444444444d0*D_xyyyyzzz
    v407       = 0.0208333333333333d0*D_xyyyyzzz
    L_xyyyy    = L_xyyyy + (D_xxxxyyyy*v122 + D_xxxyyyy*v112 + D_xxxyyyyy*v123 + D_xxxyyyyz*v124 + &
      D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz &
      + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyz*M_yz + D_xyyyyz*M_z + &
      M_xyy*v209 + M_xzz*v210 + M_yy*v293 + M_yyy*v294 + M_yyz*v295 + &
      M_yzz*v292 + M_zz*v296 + M_zzz*v297)
    L_xyyyyz   = L_xyyyyz + (D_xxxyyyyz*v112 + D_xxyyyyyz*M_xy + D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + &
      D_xyyyyyz*M_y + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + D_xyyyyzz*M_z + &
      M_yy*v295 + M_zz*v298)
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    v307       = 0.0416666666666667d0*D_xyyyzzzz
    v309       = 0.166666666666667d0*D_xyyyzzzz
    v343       = 0.0208333333333333d0*D_xyyyzzzz
    v352       = 0.0833333333333333d0*D_xyyyzzzz
    v393       = 0.00694444444444444d0*D_xyyyzzzz
    v409       = 0.0277777777777778d0*D_xyyyzzzz
    L_xyyy     = L_xyyy + (D_xxxxxyyy*v143 + D_xxxxyyy*v122 + D_xxxxyyyy*v144 + D_xxxxyyyz*v145 + &
      D_xxxyyy*v112 + D_xxxyyyy*v123 + D_xxxyyyyy*v146 + D_xxxyyyyz* &
      v147 + D_xxxyyyz*v124 + D_xxxyyyzz*v148 + D_xxyyy*M_x + D_xxyyyy* &
      M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyy*M_y &
      + D_xyyyyz*M_yz + D_xyyyz*M_z + M_xyy*v211 + M_xyyy*v212 + M_xyyz &
      *v213 + M_xyzz*v210 + M_xzz*v214 + M_xzzz*v215 + M_yy*v299 + &
      M_yyy*v300 + M_yyyy*v301 + M_yyyz*v302 + M_yyz*v303 + M_yyzz*v304 &
      + M_yzz*v296 + M_yzzz*v297 + M_zz*v305 + M_zzz*v306 + M_zzzz*v307)
    L_xyyyz    = L_xyyyz + (D_xxxxyyyz*v122 + D_xxxyyyyz*v123 + D_xxxyyyz*v112 + D_xxxyyyzz*v124 + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyz*M_x + D_xxyyyzz*M_xz &
      + D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + D_xyyyzz*M_z + &
      M_xyy*v213 + M_xzz*v216 + M_yy*v303 + M_yyy*v302 + M_yyz*v292 + &
      M_yzz*v298 + M_zz*v308 + M_zzz*v309)
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    v323       = 0.00833333333333333d0*D_xyyzzzzz
    v328       = 0.0416666666666667d0*D_xyyzzzzz
    v398       = 0.00416666666666667d0*D_xyyzzzzz
    v412       = 0.0208333333333333d0*D_xyyzzzzz
    L_xyy      = L_xyy + (D_xxxxxxyy*v179 + D_xxxxxyy*v143 + D_xxxxxyyy*v180 + D_xxxxxyyz*v181 + &
      D_xxxxyy*v122 + D_xxxxyyy*v144 + D_xxxxyyyy*v182 + D_xxxxyyyz* &
      v183 + D_xxxxyyz*v145 + D_xxxxyyzz*v184 + D_xxxyy*v112 + D_xxxyyy &
      *v123 + D_xxxyyyy*v146 + D_xxxyyyyy*v185 + D_xxxyyyyz*v186 + &
      D_xxxyyyz*v147 + D_xxxyyyzz*v187 + D_xxxyyz*v124 + D_xxxyyzz*v148 &
      + D_xxxyyzzz*v188 + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyz*M_xyz + &
      D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z &
      + M_xyy*v217 + M_xyyy*v218 + M_xyyyy*v219 + M_xyyyz*v220 + M_xyyz &
      *v221 + M_xyyzz*v222 + M_xyzz*v214 + M_xyzzz*v215 + M_xzz*v223 + &
      M_xzzz*v224 + M_xzzzz*v225 + M_yy*v310 + M_yyy*v311 + M_yyyy*v312 &
      + M_yyyyy*v313 + M_yyyyz*v314 + M_yyyz*v315 + M_yyyzz*v316 + &
      M_yyz*v317 + M_yyzz*v318 + M_yyzzz*v319 + M_yzz*v305 + M_yzzz* &
      v306 + M_yzzzz*v307 + M_zz*v320 + M_zzz*v321 + M_zzzz*v322 + &
      M_zzzzz*v323)
    L_xyyz     = L_xyyz + (D_xxxxxyyz*v143 + D_xxxxyyyz*v144 + D_xxxxyyz*v122 + D_xxxxyyzz*v145 + &
      D_xxxyyyyz*v146 + D_xxxyyyz*v123 + D_xxxyyyzz*v147 + D_xxxyyz* &
      v112 + D_xxxyyzz*v124 + D_xxxyyzzz*v148 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y + &
      D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_xyy*v221 + M_xyyy* &
      v220 + M_xyyz*v210 + M_xyzz*v216 + M_xzz*v226 + M_xzzz*v227 + &
      M_yy*v317 + M_yyy*v315 + M_yyyy*v314 + M_yyyz*v324 + M_yyz*v296 + &
      M_yyzz*v325 + M_yzz*v308 + M_yzzz*v309 + M_zz*v326 + M_zzz*v327 + &
      M_zzzz*v328)
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    v348       = 0.00138888888888889d0*D_xyzzzzzz
    v356       = 0.00833333333333333d0*D_xyzzzzzz
    L_xy       = L_xy + (D_xxxxxxxy*v247 + D_xxxxxxy*v179 + D_xxxxxxyy*v248 + D_xxxxxxyz*v249 + &
      D_xxxxxy*v143 + D_xxxxxyy*v180 + D_xxxxxyyy*v250 + D_xxxxxyyz* &
      v251 + D_xxxxxyz*v181 + D_xxxxxyzz*v252 + D_xxxxy*v122 + D_xxxxyy &
      *v144 + D_xxxxyyy*v182 + D_xxxxyyyy*v253 + D_xxxxyyyz*v254 + &
      D_xxxxyyz*v183 + D_xxxxyyzz*v255 + D_xxxxyz*v145 + D_xxxxyzz*v184 &
      + D_xxxxyzzz*v256 + D_xxxy*v112 + D_xxxyy*v123 + D_xxxyyy*v146 + &
      D_xxxyyyy*v185 + D_xxxyyyyy*v257 + D_xxxyyyyz*v258 + D_xxxyyyz* &
      v186 + D_xxxyyyzz*v259 + D_xxxyyz*v147 + D_xxxyyzz*v187 + &
      D_xxxyyzzz*v260 + D_xxxyz*v124 + D_xxxyzz*v148 + D_xxxyzzz*v188 + &
      D_xxxyzzzz*v261 + D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + &
      D_xxyz*M_xz + D_xy*M_0 + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + &
      M_xyy*v228 + M_xyyy*v229 + M_xyyyy*v230 + M_xyyyyy*v231 + &
      M_xyyyyz*v232 + M_xyyyz*v233 + M_xyyyzz*v234 + M_xyyz*v235 + &
      M_xyyzz*v236 + M_xyyzzz*v237 + M_xyzz*v223 + M_xyzzz*v224 + &
      M_xyzzzz*v225 + M_xzz*v238 + M_xzzz*v239 + M_xzzzz*v240 + &
      M_xzzzzz*v241 + M_yy*v329 + M_yyy*v330 + M_yyyy*v331 + M_yyyyy* &
      v332 + M_yyyyyy*v333 + M_yyyyyz*v334 + M_yyyyz*v335 + M_yyyyzz* &
      v336 + M_yyyz*v337 + M_yyyzz*v338 + M_yyyzzz*v339 + M_yyz*v340 + &
      M_yyzz*v341 + M_yyzzz*v342 + M_yyzzzz*v343 + M_yzz*v320 + M_yzzz* &
      v321 + M_yzzzz*v322 + M_yzzzzz*v323 + M_zz*v344 + M_zzz*v345 + &
      M_zzzz*v346 + M_zzzzz*v347 + M_zzzzzz*v348)
    L_xyz      = L_xyz + (D_xxxxxxyz*v179 + D_xxxxxyyz*v180 + D_xxxxxyz*v143 + D_xxxxxyzz*v181 + &
      D_xxxxyyyz*v182 + D_xxxxyyz*v144 + D_xxxxyyzz*v183 + D_xxxxyz* &
      v122 + D_xxxxyzz*v145 + D_xxxxyzzz*v184 + D_xxxyyyyz*v185 + &
      D_xxxyyyz*v146 + D_xxxyyyzz*v186 + D_xxxyyz*v123 + D_xxxyyzz*v147 &
      + D_xxxyyzzz*v187 + D_xxxyz*v112 + D_xxxyzz*v124 + D_xxxyzzz*v148 &
      + D_xxxyzzzz*v188 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + &
      D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z &
      + M_xyy*v235 + M_xyyy*v233 + M_xyyyy*v232 + M_xyyyz*v242 + M_xyyz &
      *v214 + M_xyyzz*v243 + M_xyzz*v226 + M_xyzzz*v227 + M_xzz*v244 + &
      M_xzzz*v245 + M_xzzzz*v246 + M_yy*v340 + M_yyy*v337 + M_yyyy*v335 &
      + M_yyyyy*v334 + M_yyyyz*v349 + M_yyyz*v350 + M_yyyzz*v319 + &
      M_yyz*v305 + M_yyzz*v351 + M_yyzzz*v352 + M_yzz*v326 + M_yzzz* &
      v327 + M_yzzzz*v328 + M_zz*v353 + M_zzz*v354 + M_zzzz*v355 + &
      M_zzzzz*v356)
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    v404       = 0.000198412698412698d0*D_xzzzzzzz
    v417       = 0.00138888888888889d0*D_xzzzzzzz
    L_x        = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*v112 + D_xxxx*v122 + D_xxxxx*v143 + D_xxxxxx* &
      v179 + D_xxxxxxx*v247 + D_xxxxxxxx*v357 + D_xxxxxxxy*v358 + &
      D_xxxxxxxz*v359 + D_xxxxxxy*v248 + D_xxxxxxyy*v360 + D_xxxxxxyz* &
      v361 + D_xxxxxxz*v249 + D_xxxxxxzz*v362 + D_xxxxxy*v180 + &
      D_xxxxxyy*v250 + D_xxxxxyyy*v363 + D_xxxxxyyz*v364 + D_xxxxxyz* &
      v251 + D_xxxxxyzz*v365 + D_xxxxxz*v181 + D_xxxxxzz*v252 + &
      D_xxxxxzzz*v366 + D_xxxxy*v144 + D_xxxxyy*v182 + D_xxxxyyy*v253 + &
      D_xxxxyyyy*v367 + D_xxxxyyyz*v368 + D_xxxxyyz*v254 + D_xxxxyyzz* &
      v369 + D_xxxxyz*v183 + D_xxxxyzz*v255 + D_xxxxyzzz*v370 + D_xxxxz &
      *v145 + D_xxxxzz*v184 + D_xxxxzzz*v256 + D_xxxxzzzz*v371 + D_xxxy &
      *v123 + D_xxxyy*v146 + D_xxxyyy*v185 + D_xxxyyyy*v257 + &
      D_xxxyyyyy*v372 + D_xxxyyyyz*v373 + D_xxxyyyz*v258 + D_xxxyyyzz* &
      v374 + D_xxxyyz*v186 + D_xxxyyzz*v259 + D_xxxyyzzz*v375 + D_xxxyz &
      *v147 + D_xxxyzz*v187 + D_xxxyzzz*v260 + D_xxxyzzzz*v376 + D_xxxz &
      *v124 + D_xxxzz*v148 + D_xxxzzz*v188 + D_xxxzzzz*v261 + &
      D_xxxzzzzz*v377 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy* &
      M_y + D_xyz*M_yz + D_xz*M_z + M_xyy*v262 + M_xyyy*v263 + M_xyyyy* &
      v264 + M_xyyyyy*v265 + M_xyyyyyy*v266 + M_xyyyyyz*v267 + M_xyyyyz &
      *v268 + M_xyyyyzz*v269 + M_xyyyz*v270 + M_xyyyzz*v271 + M_xyyyzzz &
      *v272 + M_xyyz*v273 + M_xyyzz*v274 + M_xyyzzz*v275 + M_xyyzzzz* &
      v276 + M_xyzz*v238 + M_xyzzz*v239 + M_xyzzzz*v240 + M_xyzzzzz* &
      v241 + M_xzz*v277 + M_xzzz*v278 + M_xzzzz*v279 + M_xzzzzz*v280 + &
      M_xzzzzzz*v281 + M_yy*v378 + M_yyy*v379 + M_yyyy*v380 + M_yyyyy* &
      v381 + M_yyyyyy*v382 + M_yyyyyyy*v383 + M_yyyyyyz*v384 + M_yyyyyz &
      *v385 + M_yyyyyzz*v386 + M_yyyyz*v387 + M_yyyyzz*v388 + M_yyyyzzz &
      *v389 + M_yyyz*v390 + M_yyyzz*v391 + M_yyyzzz*v392 + M_yyyzzzz* &
      v393 + M_yyz*v394 + M_yyzz*v395 + M_yyzzz*v396 + M_yyzzzz*v397 + &
      M_yyzzzzz*v398 + M_yzz*v344 + M_yzzz*v345 + M_yzzzz*v346 + &
      M_yzzzzz*v347 + M_yzzzzzz*v348 + M_zz*v399 + M_zzz*v400 + M_zzzz* &
      v401 + M_zzzzz*v402 + M_zzzzzz*v403 + M_zzzzzzz*v404)
    L_xz       = L_xz + (D_xxxxxxxz*v247 + D_xxxxxxyz*v248 + D_xxxxxxz*v179 + D_xxxxxxzz*v249 + &
      D_xxxxxyyz*v250 + D_xxxxxyz*v180 + D_xxxxxyzz*v251 + D_xxxxxz* &
      v143 + D_xxxxxzz*v181 + D_xxxxxzzz*v252 + D_xxxxyyyz*v253 + &
      D_xxxxyyz*v182 + D_xxxxyyzz*v254 + D_xxxxyz*v144 + D_xxxxyzz*v183 &
      + D_xxxxyzzz*v255 + D_xxxxz*v122 + D_xxxxzz*v145 + D_xxxxzzz*v184 &
      + D_xxxxzzzz*v256 + D_xxxyyyyz*v257 + D_xxxyyyz*v185 + D_xxxyyyzz &
      *v258 + D_xxxyyz*v146 + D_xxxyyzz*v186 + D_xxxyyzzz*v259 + &
      D_xxxyz*v123 + D_xxxyzz*v147 + D_xxxyzzz*v187 + D_xxxyzzzz*v260 + &
      D_xxxz*v112 + D_xxxzz*v124 + D_xxxzzz*v148 + D_xxxzzzz*v188 + &
      D_xxxzzzzz*v261 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + &
      D_xxzz*M_xz + D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + &
      M_xyy*v273 + M_xyyy*v270 + M_xyyyy*v268 + M_xyyyyy*v267 + &
      M_xyyyyz*v282 + M_xyyyz*v283 + M_xyyyzz*v237 + M_xyyz*v223 + &
      M_xyyzz*v284 + M_xyyzzz*v285 + M_xyzz*v244 + M_xyzzz*v245 + &
      M_xyzzzz*v246 + M_xzz*v286 + M_xzzz*v287 + M_xzzzz*v288 + &
      M_xzzzzz*v289 + M_yy*v394 + M_yyy*v390 + M_yyyy*v387 + M_yyyyy* &
      v385 + M_yyyyyy*v384 + M_yyyyyz*v405 + M_yyyyz*v406 + M_yyyyzz* &
      v407 + M_yyyz*v408 + M_yyyzz*v342 + M_yyyzzz*v409 + M_yyz*v320 + &
      M_yyzz*v410 + M_yyzzz*v411 + M_yyzzzz*v412 + M_yzz*v353 + M_yzzz* &
      v354 + M_yzzzz*v355 + M_yzzzzz*v356 + M_zz*v413 + M_zzz*v414 + &
      M_zzzz*v415 + M_zzzzz*v416 + M_zzzzzz*v417)
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v208 - (1260.0d0*v131 + v68*v99))
    L_yyyyyyyy = L_yyyyyyyy + (D_yyyyyyyy*M_0)
    D_yyyyyyyz = v133*v290
    L_yyyyyyy  = L_yyyyyyy + (D_xyyyyyyy*M_x + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyz*M_z)
    L_yyyyyyyz = L_yyyyyyyz + (D_yyyyyyyz*M_0)
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    v419       = 0.5d0*D_yyyyyyzz
    L_yyyyyy   = L_yyyyyy + (D_xxyyyyyy*v112 + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*v418 + D_yyyyyyyz*M_yz &
      + D_yyyyyyz*M_z + M_zz*v419)
    L_yyyyyyz  = L_yyyyyyz + (D_xyyyyyyz*M_x + D_yyyyyyyz*M_y + D_yyyyyyz*M_0 + D_yyyyyyzz*M_z)
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    v423       = 0.166666666666667d0*D_yyyyyzzz
    v424       = 0.5d0*D_yyyyyzzz
    L_yyyyy    = L_yyyyy + (D_xxxyyyyy*v122 + D_xxyyyyy*v112 + D_xxyyyyyy*v123 + D_xxyyyyyz*v124 + &
      D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyz*M_xyz + D_xyyyyyz*M_xz &
      + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*v418 + D_yyyyyyyy*v420 + &
      D_yyyyyyyz*v421 + D_yyyyyyz*M_yz + D_yyyyyz*M_z + M_xyy*v291 + &
      M_xzz*v292 + M_yzz*v419 + M_zz*v422 + M_zzz*v423)
    L_yyyyyz   = L_yyyyyz + (D_xxyyyyyz*v112 + D_xyyyyyyz*M_xy + D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + &
      D_yyyyyyyz*v418 + D_yyyyyyz*M_y + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 &
      + D_yyyyyzz*M_z + M_zz*v424)
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    v430       = 0.0416666666666667d0*D_yyyyzzzz
    v432       = 0.166666666666667d0*D_yyyyzzzz
    L_yyyy     = L_yyyy + (D_xxxxyyyy*v143 + D_xxxyyyy*v122 + D_xxxyyyyy*v144 + D_xxxyyyyz*v145 + &
      D_xxyyyy*v112 + D_xxyyyyy*v123 + D_xxyyyyyy*v146 + D_xxyyyyyz* &
      v147 + D_xxyyyyz*v124 + D_xxyyyyzz*v148 + D_xyyyy*M_x + D_xyyyyy* &
      M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyy*M_y &
      + D_yyyyyy*v418 + D_yyyyyyy*v420 + D_yyyyyyyy*v425 + D_yyyyyyyz* &
      v426 + D_yyyyyyz*v421 + D_yyyyyyzz*v427 + D_yyyyyz*M_yz + D_yyyyz &
      *M_z + M_xyy*v293 + M_xyyy*v294 + M_xyyz*v295 + M_xyzz*v292 + &
      M_xzz*v296 + M_xzzz*v297 + M_yzz*v422 + M_yzzz*v423 + M_zz*v428 + &
      M_zzz*v429 + M_zzzz*v430)
    L_yyyyz    = L_yyyyz + (D_xxxyyyyz*v122 + D_xxyyyyyz*v123 + D_xxyyyyz*v112 + D_xxyyyyzz*v124 + &
      D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyz*M_x + D_xyyyyzz*M_xz &
      + D_yyyyyyyz*v420 + D_yyyyyyz*v418 + D_yyyyyyzz*v421 + D_yyyyyz* &
      M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + D_yyyyzz*M_z + M_xyy*v295 + &
      M_xzz*v298 + M_yzz*v424 + M_zz*v431 + M_zzz*v432)
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    v440       = 0.00833333333333333d0*D_yyyzzzzz
    v443       = 0.0416666666666667d0*D_yyyzzzzz
    L_yyy      = L_yyy + (D_xxxxxyyy*v179 + D_xxxxyyy*v143 + D_xxxxyyyy*v180 + D_xxxxyyyz*v181 + &
      D_xxxyyy*v122 + D_xxxyyyy*v144 + D_xxxyyyyy*v182 + D_xxxyyyyz* &
      v183 + D_xxxyyyz*v145 + D_xxxyyyzz*v184 + D_xxyyy*v112 + D_xxyyyy &
      *v123 + D_xxyyyyy*v146 + D_xxyyyyyy*v185 + D_xxyyyyyz*v186 + &
      D_xxyyyyz*v147 + D_xxyyyyzz*v187 + D_xxyyyz*v124 + D_xxyyyzz*v148 &
      + D_xxyyyzzz*v188 + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyz*M_xyz + &
      D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*v418 + D_yyyyyy* &
      v420 + D_yyyyyyy*v425 + D_yyyyyyyy*v433 + D_yyyyyyyz*v434 + &
      D_yyyyyyz*v426 + D_yyyyyyzz*v435 + D_yyyyyz*v421 + D_yyyyyzz*v427 &
      + D_yyyyyzzz*v436 + D_yyyyz*M_yz + D_yyyz*M_z + M_xyy*v299 + &
      M_xyyy*v300 + M_xyyyy*v301 + M_xyyyz*v302 + M_xyyz*v303 + M_xyyzz &
      *v304 + M_xyzz*v296 + M_xyzzz*v297 + M_xzz*v305 + M_xzzz*v306 + &
      M_xzzzz*v307 + M_yzz*v428 + M_yzzz*v429 + M_yzzzz*v430 + M_zz* &
      v437 + M_zzz*v438 + M_zzzz*v439 + M_zzzzz*v440)
    L_yyyz     = L_yyyz + (D_xxxxyyyz*v143 + D_xxxyyyyz*v144 + D_xxxyyyz*v122 + D_xxxyyyzz*v145 + &
      D_xxyyyyyz*v146 + D_xxyyyyz*v123 + D_xxyyyyzz*v147 + D_xxyyyz* &
      v112 + D_xxyyyzz*v124 + D_xxyyyzzz*v148 + D_xyyyyz*M_xy + &
      D_xyyyyzz*M_xyz + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyyyz*v425 + &
      D_yyyyyyz*v420 + D_yyyyyyzz*v426 + D_yyyyyz*v418 + D_yyyyyzz*v421 &
      + D_yyyyyzzz*v427 + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + &
      D_yyyzz*M_z + M_xyy*v303 + M_xyyy*v302 + M_xyyz*v292 + M_xyzz* &
      v298 + M_xzz*v308 + M_xzzz*v309 + M_yzz*v431 + M_yzzz*v432 + M_zz &
      *v441 + M_zzz*v442 + M_zzzz*v443)
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    v453       = 0.00138888888888889d0*D_yyzzzzzz
    v457       = 0.00833333333333333d0*D_yyzzzzzz
    L_yy       = L_yy + (D_xxxxxxyy*v247 + D_xxxxxyy*v179 + D_xxxxxyyy*v248 + D_xxxxxyyz*v249 + &
      D_xxxxyy*v143 + D_xxxxyyy*v180 + D_xxxxyyyy*v250 + D_xxxxyyyz* &
      v251 + D_xxxxyyz*v181 + D_xxxxyyzz*v252 + D_xxxyy*v122 + D_xxxyyy &
      *v144 + D_xxxyyyy*v182 + D_xxxyyyyy*v253 + D_xxxyyyyz*v254 + &
      D_xxxyyyz*v183 + D_xxxyyyzz*v255 + D_xxxyyz*v145 + D_xxxyyzz*v184 &
      + D_xxxyyzzz*v256 + D_xxyy*v112 + D_xxyyy*v123 + D_xxyyyy*v146 + &
      D_xxyyyyy*v185 + D_xxyyyyyy*v257 + D_xxyyyyyz*v258 + D_xxyyyyz* &
      v186 + D_xxyyyyzz*v259 + D_xxyyyz*v147 + D_xxyyyzz*v187 + &
      D_xxyyyzzz*v260 + D_xxyyz*v124 + D_xxyyzz*v148 + D_xxyyzzz*v188 + &
      D_xxyyzzzz*v261 + D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + &
      D_xyyz*M_xz + D_yy*M_0 + D_yyy*M_y + D_yyyy*v418 + D_yyyyy*v420 + &
      D_yyyyyy*v425 + D_yyyyyyy*v433 + D_yyyyyyyy*v444 + D_yyyyyyyz* &
      v445 + D_yyyyyyz*v434 + D_yyyyyyzz*v446 + D_yyyyyz*v426 + &
      D_yyyyyzz*v435 + D_yyyyyzzz*v447 + D_yyyyz*v421 + D_yyyyzz*v427 + &
      D_yyyyzzz*v436 + D_yyyyzzzz*v448 + D_yyyz*M_yz + D_yyz*M_z + &
      M_xyy*v310 + M_xyyy*v311 + M_xyyyy*v312 + M_xyyyyy*v313 + &
      M_xyyyyz*v314 + M_xyyyz*v315 + M_xyyyzz*v316 + M_xyyz*v317 + &
      M_xyyzz*v318 + M_xyyzzz*v319 + M_xyzz*v305 + M_xyzzz*v306 + &
      M_xyzzzz*v307 + M_xzz*v320 + M_xzzz*v321 + M_xzzzz*v322 + &
      M_xzzzzz*v323 + M_yzz*v437 + M_yzzz*v438 + M_yzzzz*v439 + &
      M_yzzzzz*v440 + M_zz*v449 + M_zzz*v450 + M_zzzz*v451 + M_zzzzz* &
      v452 + M_zzzzzz*v453)
    L_yyz      = L_yyz + (D_xxxxxyyz*v179 + D_xxxxyyyz*v180 + D_xxxxyyz*v143 + D_xxxxyyzz*v181 + &
      D_xxxyyyyz*v182 + D_xxxyyyz*v144 + D_xxxyyyzz*v183 + D_xxxyyz* &
      v122 + D_xxxyyzz*v145 + D_xxxyyzzz*v184 + D_xxyyyyyz*v185 + &
      D_xxyyyyz*v146 + D_xxyyyyzz*v186 + D_xxyyyz*v123 + D_xxyyyzz*v147 &
      + D_xxyyyzzz*v187 + D_xxyyz*v112 + D_xxyyzz*v124 + D_xxyyzzz*v148 &
      + D_xxyyzzzz*v188 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + &
      D_xyyzz*M_xz + D_yyyyyyyz*v433 + D_yyyyyyz*v425 + D_yyyyyyzz*v434 &
      + D_yyyyyz*v420 + D_yyyyyzz*v426 + D_yyyyyzzz*v435 + D_yyyyz*v418 &
      + D_yyyyzz*v421 + D_yyyyzzz*v427 + D_yyyyzzzz*v436 + D_yyyz*M_y + &
      D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_xyy*v317 + M_xyyy*v315 &
      + M_xyyyy*v314 + M_xyyyz*v324 + M_xyyz*v296 + M_xyyzz*v325 + &
      M_xyzz*v308 + M_xyzzz*v309 + M_xzz*v326 + M_xzzz*v327 + M_xzzzz* &
      v328 + M_yzz*v441 + M_yzzz*v442 + M_yzzzz*v443 + M_zz*v454 + &
      M_zzz*v455 + M_zzzz*v456 + M_zzzzz*v457)
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    v469       = 0.000198412698412698d0*D_yzzzzzzz
    v474       = 0.00138888888888889d0*D_yzzzzzzz
    L_y        = L_y + (D_xxxxxxxy*v357 + D_xxxxxxy*v247 + D_xxxxxxyy*v358 + D_xxxxxxyz*v359 + &
      D_xxxxxy*v179 + D_xxxxxyy*v248 + D_xxxxxyyy*v360 + D_xxxxxyyz* &
      v361 + D_xxxxxyz*v249 + D_xxxxxyzz*v362 + D_xxxxy*v143 + D_xxxxyy &
      *v180 + D_xxxxyyy*v250 + D_xxxxyyyy*v363 + D_xxxxyyyz*v364 + &
      D_xxxxyyz*v251 + D_xxxxyyzz*v365 + D_xxxxyz*v181 + D_xxxxyzz*v252 &
      + D_xxxxyzzz*v366 + D_xxxy*v122 + D_xxxyy*v144 + D_xxxyyy*v182 + &
      D_xxxyyyy*v253 + D_xxxyyyyy*v367 + D_xxxyyyyz*v368 + D_xxxyyyz* &
      v254 + D_xxxyyyzz*v369 + D_xxxyyz*v183 + D_xxxyyzz*v255 + &
      D_xxxyyzzz*v370 + D_xxxyz*v145 + D_xxxyzz*v184 + D_xxxyzzz*v256 + &
      D_xxxyzzzz*v371 + D_xxy*v112 + D_xxyy*v123 + D_xxyyy*v146 + &
      D_xxyyyy*v185 + D_xxyyyyy*v257 + D_xxyyyyyy*v372 + D_xxyyyyyz* &
      v373 + D_xxyyyyz*v258 + D_xxyyyyzz*v374 + D_xxyyyz*v186 + &
      D_xxyyyzz*v259 + D_xxyyyzzz*v375 + D_xxyyz*v147 + D_xxyyzz*v187 + &
      D_xxyyzzz*v260 + D_xxyyzzzz*v376 + D_xxyz*v124 + D_xxyzz*v148 + &
      D_xxyzzz*v188 + D_xxyzzzz*v261 + D_xxyzzzzz*v377 + D_xy*M_x + &
      D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyy*v418 + D_yyyy*v420 + D_yyyyy*v425 + D_yyyyyy*v433 + &
      D_yyyyyyy*v444 + D_yyyyyyyy*v458 + D_yyyyyyyz*v459 + D_yyyyyyz* &
      v445 + D_yyyyyyzz*v460 + D_yyyyyz*v434 + D_yyyyyzz*v446 + &
      D_yyyyyzzz*v461 + D_yyyyz*v426 + D_yyyyzz*v435 + D_yyyyzzz*v447 + &
      D_yyyyzzzz*v462 + D_yyyz*v421 + D_yyyzz*v427 + D_yyyzzz*v436 + &
      D_yyyzzzz*v448 + D_yyyzzzzz*v463 + D_yyz*M_yz + D_yz*M_z + M_xyy* &
      v329 + M_xyyy*v330 + M_xyyyy*v331 + M_xyyyyy*v332 + M_xyyyyyy* &
      v333 + M_xyyyyyz*v334 + M_xyyyyz*v335 + M_xyyyyzz*v336 + M_xyyyz* &
      v337 + M_xyyyzz*v338 + M_xyyyzzz*v339 + M_xyyz*v340 + M_xyyzz* &
      v341 + M_xyyzzz*v342 + M_xyyzzzz*v343 + M_xyzz*v320 + M_xyzzz* &
      v321 + M_xyzzzz*v322 + M_xyzzzzz*v323 + M_xzz*v344 + M_xzzz*v345 &
      + M_xzzzz*v346 + M_xzzzzz*v347 + M_xzzzzzz*v348 + M_yzz*v449 + &
      M_yzzz*v450 + M_yzzzz*v451 + M_yzzzzz*v452 + M_yzzzzzz*v453 + &
      M_zz*v464 + M_zzz*v465 + M_zzzz*v466 + M_zzzzz*v467 + M_zzzzzz* &
      v468 + M_zzzzzzz*v469)
    L_yz       = L_yz + (D_xxxxxxyz*v247 + D_xxxxxyyz*v248 + D_xxxxxyz*v179 + D_xxxxxyzz*v249 + &
      D_xxxxyyyz*v250 + D_xxxxyyz*v180 + D_xxxxyyzz*v251 + D_xxxxyz* &
      v143 + D_xxxxyzz*v181 + D_xxxxyzzz*v252 + D_xxxyyyyz*v253 + &
      D_xxxyyyz*v182 + D_xxxyyyzz*v254 + D_xxxyyz*v144 + D_xxxyyzz*v183 &
      + D_xxxyyzzz*v255 + D_xxxyz*v122 + D_xxxyzz*v145 + D_xxxyzzz*v184 &
      + D_xxxyzzzz*v256 + D_xxyyyyyz*v257 + D_xxyyyyz*v185 + D_xxyyyyzz &
      *v258 + D_xxyyyz*v146 + D_xxyyyzz*v186 + D_xxyyyzzz*v259 + &
      D_xxyyz*v123 + D_xxyyzz*v147 + D_xxyyzzz*v187 + D_xxyyzzzz*v260 + &
      D_xxyz*v112 + D_xxyzz*v124 + D_xxyzzz*v148 + D_xxyzzzz*v188 + &
      D_xxyzzzzz*v261 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + &
      D_xyzz*M_xz + D_yyyyyyyz*v444 + D_yyyyyyz*v433 + D_yyyyyyzz*v445 &
      + D_yyyyyz*v425 + D_yyyyyzz*v434 + D_yyyyyzzz*v446 + D_yyyyz*v420 &
      + D_yyyyzz*v426 + D_yyyyzzz*v435 + D_yyyyzzzz*v447 + D_yyyz*v418 &
      + D_yyyzz*v421 + D_yyyzzz*v427 + D_yyyzzzz*v436 + D_yyyzzzzz*v448 &
      + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + M_xyy*v340 + &
      M_xyyy*v337 + M_xyyyy*v335 + M_xyyyyy*v334 + M_xyyyyz*v349 + &
      M_xyyyz*v350 + M_xyyyzz*v319 + M_xyyz*v305 + M_xyyzz*v351 + &
      M_xyyzzz*v352 + M_xyzz*v326 + M_xyzzz*v327 + M_xyzzzz*v328 + &
      M_xzz*v353 + M_xzzz*v354 + M_xzzzz*v355 + M_xzzzzz*v356 + M_yzz* &
      v454 + M_yzzz*v455 + M_yzzzz*v456 + M_yzzzzz*v457 + M_zz*v470 + &
      M_zzz*v471 + M_zzzz*v472 + M_zzzzz*v473 + M_zzzzzz*v474)
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_0        = L_0 + (2.48015873015873d-5*(D_xxxxxxxx*M_xxxxxxxx + D_yyyyyyyy*M_yyyyyyyy + &
      D_zzzzzzzz*M_zzzzzzzz + 8.0d0*(D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxz &
      *M_xxxxxxxz + D_yyyyyyyz*M_yyyyyyyz) + 70.0d0*(D_xxxxyyyy* &
      M_xxxxyyyy + D_xxxxzzzz*M_xxxxzzzz + D_yyyyzzzz*M_yyyyzzzz) + &
      420.0d0*(D_xxxxyyzz*M_xxxxyyzz + D_xxyyyyzz*M_xxyyyyzz + &
      D_xxyyzzzz*M_xxyyzzzz) + 560.0d0*(D_xxxyyyzz*M_xxxyyyzz + &
      D_xxxyyzzz*M_xxxyyzzz + D_xxyyyzzz*M_xxyyyzzz) + 168.0d0*( &
      D_xxxxxyyz*M_xxxxxyyz + D_xxxxxyzz*M_xxxxxyzz + D_xxyyyyyz* &
      M_xxyyyyyz + D_xxyzzzzz*M_xxyzzzzz) + 280.0d0*(D_xxxxyyyz* &
      M_xxxxyyyz + D_xxxxyzzz*M_xxxxyzzz + D_xxxyyyyz*M_xxxyyyyz + &
      D_xxxyzzzz*M_xxxyzzzz) + 28.0d0*(D_xxxxxxyy*M_xxxxxxyy + &
      D_xxxxxxzz*M_xxxxxxzz + D_xxyyyyyy*M_xxyyyyyy + D_xxzzzzzz* &
      M_xxzzzzzz + D_yyyyyyzz*M_yyyyyyzz + D_yyzzzzzz*M_yyzzzzzz) + &
      56.0d0*(D_xxxxxxyz*M_xxxxxxyz + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxzzz*M_xxxxxzzz + D_xxxyyyyy*M_xxxyyyyy + D_xxxzzzzz* &
      M_xxxzzzzz + D_yyyyyzzz*M_yyyyyzzz + D_yyyzzzzz*M_yyyzzzzz)) + &
      D_0*M_0 + D_x*M_x + D_xx*v112 + D_xxx*v122 + D_xxxx*v143 + &
      D_xxxxx*v179 + D_xxxxxx*v247 + D_xxxxxxx*v357 + D_xxxxxxy*v358 + &
      D_xxxxxxz*v359 + D_xxxxxy*v248 + D_xxxxxyy*v360 + D_xxxxxyz*v361 &
      + D_xxxxxz*v249 + D_xxxxxzz*v362 + D_xxxxy*v180 + D_xxxxyy*v250 + &
      D_xxxxyyy*v363 + D_xxxxyyz*v364 + D_xxxxyz*v251 + D_xxxxyzz*v365 &
      + D_xxxxz*v181 + D_xxxxzz*v252 + D_xxxxzzz*v366 + D_xxxy*v144 + &
      D_xxxyy*v182 + D_xxxyyy*v253 + D_xxxyyyy*v367 + D_xxxyyyz*v368 + &
      D_xxxyyz*v254 + D_xxxyyzz*v369 + D_xxxyz*v183 + D_xxxyzz*v255 + &
      D_xxxyzzz*v370 + D_xxxz*v145 + D_xxxzz*v184 + D_xxxzzz*v256 + &
      D_xxxzzzz*v371 + D_xxy*v123 + D_xxyy*v146 + D_xxyyy*v185 + &
      D_xxyyyy*v257 + D_xxyyyyy*v372 + D_xxyyyyz*v373 + D_xxyyyz*v258 + &
      D_xxyyyzz*v374 + D_xxyyz*v186 + D_xxyyzz*v259 + D_xxyyzzz*v375 + &
      D_xxyz*v147 + D_xxyzz*v187 + D_xxyzzz*v260 + D_xxyzzzz*v376 + &
      D_xxz*v124 + D_xxzz*v148 + D_xxzzz*v188 + D_xxzzzz*v261 + &
      D_xxzzzzz*v377 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + &
      D_yy*v418 + D_yyy*v420 + D_yyyy*v425 + D_yyyyy*v433 + D_yyyyyy* &
      v444 + D_yyyyyyy*v458 + D_yyyyyyz*v459 + D_yyyyyz*v445 + &
      D_yyyyyzz*v460 + D_yyyyz*v434 + D_yyyyzz*v446 + D_yyyyzzz*v461 + &
      D_yyyz*v426 + D_yyyzz*v435 + D_yyyzzz*v447 + D_yyyzzzz*v462 + &
      D_yyz*v421 + D_yyzz*v427 + D_yyzzz*v436 + D_yyzzzz*v448 + &
      D_yyzzzzz*v463 + D_yz*M_yz + D_z*M_z + D_zz*v475 + D_zzz*v476 + &
      D_zzzz*v477 + D_zzzzz*v478 + D_zzzzzz*v479 + D_zzzzzzz*v480 + &
      M_xyy*v378 + M_xyyy*v379 + M_xyyyy*v380 + M_xyyyyy*v381 + &
      M_xyyyyyy*v382 + M_xyyyyyyy*v383 + M_xyyyyyyz*v384 + M_xyyyyyz* &
      v385 + M_xyyyyyzz*v386 + M_xyyyyz*v387 + M_xyyyyzz*v388 + &
      M_xyyyyzzz*v389 + M_xyyyz*v390 + M_xyyyzz*v391 + M_xyyyzzz*v392 + &
      M_xyyyzzzz*v393 + M_xyyz*v394 + M_xyyzz*v395 + M_xyyzzz*v396 + &
      M_xyyzzzz*v397 + M_xyyzzzzz*v398 + M_xyzz*v344 + M_xyzzz*v345 + &
      M_xyzzzz*v346 + M_xyzzzzz*v347 + M_xyzzzzzz*v348 + M_xzz*v399 + &
      M_xzzz*v400 + M_xzzzz*v401 + M_xzzzzz*v402 + M_xzzzzzz*v403 + &
      M_xzzzzzzz*v404 + M_yzz*v464 + M_yzzz*v465 + M_yzzzz*v466 + &
      M_yzzzzz*v467 + M_yzzzzzz*v468 + M_yzzzzzzz*v469)
    L_z        = L_z + (D_xxxxxxxz*v357 + D_xxxxxxyz*v358 + D_xxxxxxz*v247 + D_xxxxxxzz*v359 + &
      D_xxxxxyyz*v360 + D_xxxxxyz*v248 + D_xxxxxyzz*v361 + D_xxxxxz* &
      v179 + D_xxxxxzz*v249 + D_xxxxxzzz*v362 + D_xxxxyyyz*v363 + &
      D_xxxxyyz*v250 + D_xxxxyyzz*v364 + D_xxxxyz*v180 + D_xxxxyzz*v251 &
      + D_xxxxyzzz*v365 + D_xxxxz*v143 + D_xxxxzz*v181 + D_xxxxzzz*v252 &
      + D_xxxxzzzz*v366 + D_xxxyyyyz*v367 + D_xxxyyyz*v253 + D_xxxyyyzz &
      *v368 + D_xxxyyz*v182 + D_xxxyyzz*v254 + D_xxxyyzzz*v369 + &
      D_xxxyz*v144 + D_xxxyzz*v183 + D_xxxyzzz*v255 + D_xxxyzzzz*v370 + &
      D_xxxz*v122 + D_xxxzz*v145 + D_xxxzzz*v184 + D_xxxzzzz*v256 + &
      D_xxxzzzzz*v371 + D_xxyyyyyz*v372 + D_xxyyyyz*v257 + D_xxyyyyzz* &
      v373 + D_xxyyyz*v185 + D_xxyyyzz*v258 + D_xxyyyzzz*v374 + D_xxyyz &
      *v146 + D_xxyyzz*v186 + D_xxyyzzz*v259 + D_xxyyzzzz*v375 + D_xxyz &
      *v123 + D_xxyzz*v147 + D_xxyzzz*v187 + D_xxyzzzz*v260 + &
      D_xxyzzzzz*v376 + D_xxz*v112 + D_xxzz*v124 + D_xxzzz*v148 + &
      D_xxzzzz*v188 + D_xxzzzzz*v261 + D_xxzzzzzz*v377 + D_xyz*M_xy + &
      D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyyyyz*v458 + &
      D_yyyyyyz*v444 + D_yyyyyyzz*v459 + D_yyyyyz*v433 + D_yyyyyzz*v445 &
      + D_yyyyyzzz*v460 + D_yyyyz*v425 + D_yyyyzz*v434 + D_yyyyzzz*v446 &
      + D_yyyyzzzz*v461 + D_yyyz*v420 + D_yyyzz*v426 + D_yyyzzz*v435 + &
      D_yyyzzzz*v447 + D_yyyzzzzz*v462 + D_yyz*v418 + D_yyzz*v421 + &
      D_yyzzz*v427 + D_yyzzzz*v436 + D_yyzzzzz*v448 + D_yyzzzzzz*v463 + &
      D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v475 + D_zzzz* &
      v476 + D_zzzzz*v477 + D_zzzzzz*v478 + D_zzzzzzz*v479 + D_zzzzzzzz &
      *v480 + M_xyy*v394 + M_xyyy*v390 + M_xyyyy*v387 + M_xyyyyy*v385 + &
      M_xyyyyyy*v384 + M_xyyyyyz*v405 + M_xyyyyz*v406 + M_xyyyyzz*v407 &
      + M_xyyyz*v408 + M_xyyyzz*v342 + M_xyyyzzz*v409 + M_xyyz*v320 + &
      M_xyyzz*v410 + M_xyyzzz*v411 + M_xyyzzzz*v412 + M_xyzz*v353 + &
      M_xyzzz*v354 + M_xyzzzz*v355 + M_xyzzzzz*v356 + M_xzz*v413 + &
      M_xzzz*v414 + M_xzzzz*v415 + M_xzzzzz*v416 + M_xzzzzzz*v417 + &
      M_yzz*v470 + M_yzzz*v471 + M_yzzzz*v472 + M_yzzzzz*v473 + &
      M_yzzzzzz*v474)
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  M_y                 
#undef  L_y                 
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
#undef  M_xxy               
#undef  L_xxy               
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
#undef  M_xxxxx             
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  L_xxyyy             
#undef  M_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  M_xyyyy             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  L_yyyyy             
#undef  M_yyyyy             
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
#undef  L_xxyyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  M_xyyyyy            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  M_yyyyyy            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  M_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  M_xxxxxxz           
#undef  L_xxxxxyy           
#undef  M_xxxxxyy           
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
#undef  L_xxyyyyz           
#undef  M_xxyyyyz           
#undef  M_xyyyyyy           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  M_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_yyyyyyz           
#undef  M_xxxxxxxx          
#undef  L_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  L_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  L_xxxxxxyz          
#undef  M_xxxxxyyy          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  L_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  L_xxxxyyyz          
#undef  M_xxxyyyyy          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  M_xxxyyyyz          
#undef  M_xxyyyyyy          
#undef  L_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
#undef  L_yyyyyyyz          
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
    
! OPS  2123*ADD + 2*DIV + 2804*MUL + 203*NEG + POW + 52*SUB = 5185  (6588 before optimization)
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
                v428, v429, v43, v430, v431, v432, v433, v434, v435, v436,&
                v437, v438, v439, v44, v440, v441, v442, v443, v444, v445,&
                v446, v447, v448, v449, v45, v450, v451, v452, v453, v454,&
                v455, v456, v457, v458, v459, v46, v460, v461, v462, v463,&
                v464, v465, v466, v467, v468, v469, v47, v470, v471, v472,&
                v473, v474, v475, v476, v477, v478, v479, v48, v480, v481,&
                v482, v483, v484, v485, v486, v487, v488, v489, v49, v490,&
                v491, v492, v493, v494, v495, v496, v497, v498, v499, v5, v50,&
                v500, v501, v502, v503, v504, v505, v506, v507, v508, v509,&
                v51, v510, v511, v512, v513, v514, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_0,&
                D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
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
                D_yyyyzzzz, D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
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
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
#define M_y                  M(1:2,2)
#define L_y                  L(1:2,2)
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
#define M_xxy                M(1:2,10)
#define L_xxy                L(1:2,10)
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
#define M_xxxxx              M(1:2,25)
#define L_xxxxx              L(1:2,25)
#define L_xxxxy              L(1:2,26)
#define M_xxxxy              M(1:2,26)
#define L_xxxxz              L(1:2,27)
#define M_xxxxz              M(1:2,27)
#define M_xxxyy              M(1:2,28)
#define L_xxxyy              L(1:2,28)
#define L_xxxyz              L(1:2,29)
#define M_xxxyz              M(1:2,29)
#define L_xxyyy              L(1:2,30)
#define M_xxyyy              M(1:2,30)
#define L_xxyyz              L(1:2,31)
#define M_xxyyz              M(1:2,31)
#define M_xyyyy              M(1:2,32)
#define L_xyyyy              L(1:2,32)
#define L_xyyyz              L(1:2,33)
#define M_xyyyz              M(1:2,33)
#define L_yyyyy              L(1:2,34)
#define M_yyyyy              M(1:2,34)
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
#define L_xxyyyy             L(1:2,43)
#define M_xxyyyy             M(1:2,43)
#define M_xxyyyz             M(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define M_xyyyyy             M(1:2,45)
#define L_xyyyyy             L(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define M_xyyyyz             M(1:2,46)
#define M_yyyyyy             M(1:2,47)
#define L_yyyyyy             L(1:2,47)
#define L_yyyyyz             L(1:2,48)
#define M_yyyyyz             M(1:2,48)
#define L_xxxxxxx            L(1:2,49)
#define M_xxxxxxx            M(1:2,49)
#define M_xxxxxxy            M(1:2,50)
#define L_xxxxxxy            L(1:2,50)
#define L_xxxxxxz            L(1:2,51)
#define M_xxxxxxz            M(1:2,51)
#define L_xxxxxyy            L(1:2,52)
#define M_xxxxxyy            M(1:2,52)
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
#define L_xxyyyyz            L(1:2,59)
#define M_xxyyyyz            M(1:2,59)
#define M_xyyyyyy            M(1:2,60)
#define L_xyyyyyy            L(1:2,60)
#define L_xyyyyyz            L(1:2,61)
#define M_xyyyyyz            M(1:2,61)
#define M_yyyyyyy            M(1:2,62)
#define L_yyyyyyy            L(1:2,62)
#define L_yyyyyyz            L(1:2,63)
#define M_yyyyyyz            M(1:2,63)
#define M_xxxxxxxx           M(1:2,64)
#define L_xxxxxxxx           L(1:2,64)
#define M_xxxxxxxy           M(1:2,65)
#define L_xxxxxxxy           L(1:2,65)
#define M_xxxxxxxz           M(1:2,66)
#define L_xxxxxxxz           L(1:2,66)
#define L_xxxxxxyy           L(1:2,67)
#define M_xxxxxxyy           M(1:2,67)
#define M_xxxxxxyz           M(1:2,68)
#define L_xxxxxxyz           L(1:2,68)
#define M_xxxxxyyy           M(1:2,69)
#define L_xxxxxyyy           L(1:2,69)
#define L_xxxxxyyz           L(1:2,70)
#define M_xxxxxyyz           M(1:2,70)
#define M_xxxxyyyy           M(1:2,71)
#define L_xxxxyyyy           L(1:2,71)
#define M_xxxxyyyz           M(1:2,72)
#define L_xxxxyyyz           L(1:2,72)
#define M_xxxyyyyy           M(1:2,73)
#define L_xxxyyyyy           L(1:2,73)
#define L_xxxyyyyz           L(1:2,74)
#define M_xxxyyyyz           M(1:2,74)
#define M_xxyyyyyy           M(1:2,75)
#define L_xxyyyyyy           L(1:2,75)
#define M_xxyyyyyz           M(1:2,76)
#define L_xxyyyyyz           L(1:2,76)
#define L_xyyyyyyy           L(1:2,77)
#define M_xyyyyyyy           M(1:2,77)
#define M_xyyyyyyz           M(1:2,78)
#define L_xyyyyyyz           L(1:2,78)
#define L_yyyyyyyy           L(1:2,79)
#define M_yyyyyyyy           M(1:2,79)
#define M_yyyyyyyz           M(1:2,80)
#define L_yyyyyyyz           L(1:2,80)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v510       = y*z
    v511       = x*y
    v496       = 15.0d0*v510
    v498       = v511
    v500       = v510
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
    v357       = 0.000198412698412698d0*M_xxxxxxx
    v358       = 0.00138888888888889d0*M_xxxxxxy
    v359       = 0.00138888888888889d0*M_xxxxxxz
    v360       = 0.00416666666666667d0*M_xxxxxyy
    v361       = 0.00833333333333333d0*M_xxxxxyz
    v363       = 0.00694444444444444d0*M_xxxxyyy
    v364       = 0.0208333333333333d0*M_xxxxyyz
    v367       = 0.00694444444444444d0*M_xxxyyyy
    v368       = 0.0277777777777778d0*M_xxxyyyz
    v372       = 0.00416666666666667d0*M_xxyyyyy
    v373       = 0.0208333333333333d0*M_xxyyyyz
    v418       = 0.5d0*M_yy
    v420       = 0.166666666666667d0*M_yyy
    v421       = 0.5d0*M_yyz
    v425       = 0.0416666666666667d0*M_yyyy
    v426       = 0.166666666666667d0*M_yyyz
    v433       = 0.00833333333333333d0*M_yyyyy
    v434       = 0.0416666666666667d0*M_yyyyz
    v444       = 0.00138888888888889d0*M_yyyyyy
    v445       = 0.00833333333333333d0*M_yyyyyz
    v458       = 0.000198412698412698d0*M_yyyyyyy
    v459       = 0.00138888888888889d0*M_yyyyyyz
    M_zz       = -(M_xx + M_yy)
    v475       = 0.5d0*M_zz
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    v476       = 0.166666666666667d0*M_zzz
    M_xxzz     = -(M_xxxx + M_xxyy)
    v148       = 0.25d0*M_xxzz
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v427       = 0.25d0*M_yyzz
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    v477       = 0.0416666666666667d0*M_zzzz
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
    v435       = 0.0833333333333333d0*M_yyyzz
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v436       = 0.0833333333333333d0*M_yyzzz
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    v478       = 0.00833333333333333d0*M_zzzzz
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
    v446       = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v447       = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v448       = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    v479       = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v362       = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    v365       = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v366       = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v369       = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    v370       = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    v371       = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v374       = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v375       = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    v376       = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v377       = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v460       = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v461       = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v462       = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v463       = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    v480       = 0.000198412698412698d0*M_zzzzzzz
    M_xxxxxxzz = -(M_xxxxxxxx + M_xxxxxxyy)
    M_xxxxxyzz = -(M_xxxxxxxy + M_xxxxxyyy)
    M_xxxxxzzz = -(M_xxxxxxxz + M_xxxxxyyz)
    M_xxxxyyzz = -(M_xxxxxxyy + M_xxxxyyyy)
    M_xxxxyzzz = -(M_xxxxxxyz + M_xxxxyyyz)
    M_xxxxzzzz = -(M_xxxxxxzz + M_xxxxyyzz)
    M_xxxyyyzz = -(M_xxxxxyyy + M_xxxyyyyy)
    M_xxxyyzzz = -(M_xxxxxyyz + M_xxxyyyyz)
    M_xxxyzzzz = -(M_xxxxxyzz + M_xxxyyyzz)
    M_xxxzzzzz = -(M_xxxxxzzz + M_xxxyyzzz)
    M_xxyyyyzz = -(M_xxxxyyyy + M_xxyyyyyy)
    M_xxyyyzzz = -(M_xxxxyyyz + M_xxyyyyyz)
    M_xxyyzzzz = -(M_xxxxyyzz + M_xxyyyyzz)
    M_xxyzzzzz = -(M_xxxxyzzz + M_xxyyyzzz)
    M_xxzzzzzz = -(M_xxxxzzzz + M_xxyyzzzz)
    M_xyyyyyzz = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz = -(M_xxxyyyzz + M_xyyyyyzz)
    M_xyyzzzzz = -(M_xxxyyzzz + M_xyyyyzzz)
    M_xyzzzzzz = -(M_xxxyzzzz + M_xyyyzzzz)
    M_xzzzzzzz = -(M_xxxzzzzz + M_xyyzzzzz)
    M_yyyyyyzz = -(M_xxyyyyyy + M_yyyyyyyy)
    M_yyyyyzzz = -(M_xxyyyyyz + M_yyyyyyyz)
    M_yyyyzzzz = -(M_xxyyyyzz + M_yyyyyyzz)
    M_yyyzzzzz = -(M_xxyyyzzz + M_yyyyyzzz)
    M_yyzzzzzz = -(M_xxyyzzzz + M_yyyyzzzz)
    M_yzzzzzzz = -(M_xxyzzzzz + M_yyyzzzzz)
    M_zzzzzzzz = -(M_xxzzzzzz + M_yyzzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v481       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v481
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
    v482       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v483       = v1*v19
    v27        = v482
    v29        = 7.0d0*v1
    v59        = v483
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v484       = v0*v31
    v65        = v484
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
    v485       = 3.0d0*h
    v486       = h*v0
    v487       = h*v1
    v488       = h*v19
    v490       = v1*v486
    v492       = h*v31
    v4         = -h
    v12        = v485
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v489       = v0*v17
    v491       = v1*v17
    v18        = 3.0d0*v17
    v20        = v486
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v487
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 - 945.0d0*v19 + 630.0d0*v486
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 - 945.0d0*v31 + 630.0d0*v487
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v488
    v51        = v489
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v490
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v491
    v67        = v33 + v53 + v66
    v69        = v492
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v506       = -v85
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
    v106       = v17*v482
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v507       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v116       = -v108
    v117       = -1430.0d0*v57
    v508       = v116 + v117
    v119       = -1351350.0d0*v490
    v509       = v111 + v119
    v131       = v1*v46
    v132       = v31*v486
    v134       = -(3.0d0*v46 + 286.0d0*v57)
    v208       = v17*v31
    v290       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
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
    v493       = 3.0d0*v3
    v6         = v493*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v493*v500
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v494       = 3.0d0*v8
    v9         = v8*x
    v11        = v494*(h - v10)
    D_xxx      = -3.0d0*v9*(v481 - v485)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    v378       = 0.5d0*D_xyy
    D_xyz      = -v496*v9
    D_xzz      = -(D_xxx + D_xyy)
    v399       = 0.5d0*D_xzz
    D_yyy      = v494*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    v464       = 0.5d0*D_yzz
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v495       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v495*y
    v26        = v495*z
    v28        = v15*v496
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v262       = 0.5d0*D_xxyy
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    v277       = 0.5d0*D_xxzz
    D_xyyy     = v22*v30
    v329       = 0.5d0*D_xyyy
    v379       = 0.166666666666667d0*D_xyyy
    D_xyyz     = v26*(v29 + v4)
    v394       = 0.5d0*D_xyyz
    D_xyzz     = -(D_xxxy + D_xyyy)
    v344       = 0.5d0*D_xyzz
    D_xzzz     = -(D_xxxz + D_xyyz)
    v400       = 0.166666666666667d0*D_xzzz
    v413       = 0.5d0*D_xzzz
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    v449       = 0.5d0*D_yyzz
    D_yzzz     = -(D_xxyz + D_yyyz)
    v465       = 0.166666666666667d0*D_yzzz
    v470       = 0.5d0*D_yzzz
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v512       = v34*z
    v497       = 15.0d0*v34
    v35        = v497*x
    v39        = v512
    v41        = 315.0d0*v498*v512
    v42        = v497*y
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
    D_xxyyz    = v39*(v36 - 945.0d0*v482 + 105.0d0*(v486 + v487))
    v273       = 0.5d0*D_xxyyz
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    v238       = 0.5d0*D_xxyzz
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    v278       = 0.166666666666667d0*D_xxzzz
    v286       = 0.5d0*D_xxzzz
    D_xyyyy    = v34*v43*x
    v310       = 0.5d0*D_xyyyy
    v330       = 0.166666666666667d0*D_xyyyy
    v380       = 0.0416666666666667d0*D_xyyyy
    D_xyyyz    = v41*(h - v7)
    v340       = 0.5d0*D_xyyyz
    v390       = 0.166666666666667d0*D_xyyyz
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    v320       = 0.5d0*D_xyyzz
    v395       = 0.25d0*D_xyyzz
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    v345       = 0.166666666666667d0*D_xyzzz
    v353       = 0.5d0*D_xyzzz
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    v401       = 0.0416666666666667d0*D_xzzzz
    v414       = 0.166666666666667d0*D_xzzzz
    D_yyyyy    = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz    = v39*v43
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    v437       = 0.5d0*D_yyyzz
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    v450       = 0.166666666666667d0*D_yyzzz
    v454       = 0.5d0*D_yyzzz
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    v466       = 0.0416666666666667d0*D_yzzzz
    v471       = 0.166666666666667d0*D_yzzzz
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    u12        = u6*u6
    u13        = u6*u7
    v44        = u13
    v513       = 315.0d0*v44
    v499       = v513*x
    v45        = 45.0d0*v44
    v52        = v499*y
    v56        = v499*z
    v60        = v500*v513
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 + v17*v29 - 21.0d0*v488 + 14.0d0*v51 + 231.0d0*v59)
    v149       = 0.5d0*D_xxxxyy
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    v155       = 0.5d0*D_xxxxzz
    D_xxxyyy   = 945.0d0*v44*v498*(11.0d0*v27 + v17 + v61 + v62)
    v168       = 0.5d0*D_xxxyyy
    v190       = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    v196       = 0.5d0*D_xxxyyz
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    v174       = 0.5d0*D_xxxyzz
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    v200       = 0.166666666666667d0*D_xxxzzz
    v205       = 0.5d0*D_xxxzzz
    D_xxyyyy   = v45*(v58 + v17*v24 - 21.0d0*v492 + 14.0d0*v64 + 231.0d0*v65)
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
    v299       = 0.5d0*D_xyyyyy
    v311       = 0.166666666666667d0*D_xyyyyy
    v331       = 0.0416666666666667d0*D_xyyyyy
    v381       = 0.00833333333333333d0*D_xyyyyy
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    v317       = 0.5d0*D_xyyyyz
    v337       = 0.166666666666667d0*D_xyyyyz
    v387       = 0.0416666666666667d0*D_xyyyyz
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    v305       = 0.5d0*D_xyyyzz
    v341       = 0.25d0*D_xyyyzz
    v391       = 0.0833333333333333d0*D_xyyyzz
    v408       = 0.166666666666667d0*D_xyyyzz
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    v321       = 0.166666666666667d0*D_xyyzzz
    v326       = 0.5d0*D_xyyzzz
    v396       = 0.0833333333333333d0*D_xyyzzz
    v410       = 0.25d0*D_xyyzzz
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    v346       = 0.0416666666666667d0*D_xyzzzz
    v354       = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    v402       = 0.00833333333333333d0*D_xzzzzz
    v415       = 0.0416666666666667d0*D_xzzzzz
    D_yyyyyy   = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz   = v60*v67
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    v428       = 0.5d0*D_yyyyzz
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    v438       = 0.166666666666667d0*D_yyyzzz
    v441       = 0.5d0*D_yyyzzz
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    v451       = 0.0416666666666667d0*D_yyzzzz
    v455       = 0.166666666666667d0*D_yyzzzz
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    v467       = 0.00833333333333333d0*D_yzzzzz
    v472       = 0.0416666666666667d0*D_yzzzzz
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    u14        = u7*u7
    u15        = u7*u8
    v70        = u15
    v514       = 945.0d0*v70
    v501       = 315.0d0*v70
    v71        = v501*x
    v75        = v501*y
    v77        = v501*z
    v81        = v500*v514*x
    v83        = v514
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy  = v75*v76
    D_xxxxxxz  = v76*v77
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v125       = 0.5d0*D_xxxxxyy
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    v128       = 0.5d0*D_xxxxxzz
    D_xxxxyyy  = -v83*y*(v506 + v1*v18 + v1*v82 - v84)
    v137       = 0.5d0*D_xxxxyyy
    v150       = 0.166666666666667d0*D_xxxxyyy
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    v153       = 0.5d0*D_xxxxyyz
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    v140       = 0.5d0*D_xxxxyzz
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    v156       = 0.166666666666667d0*D_xxxxzzz
    v158       = 0.5d0*D_xxxxzzz
    D_xxxyyyy  = -v83*x*(v506 + v0*v18 + v0*v90 - v89)
    v162       = 0.5d0*D_xxxyyyy
    v169       = 0.166666666666667d0*D_xxxyyyy
    v191       = 0.0416666666666667d0*D_xxxyyyy
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v172       = 0.5d0*D_xxxyyyz
    v194       = 0.166666666666667d0*D_xxxyyyz
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
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    v221       = 0.5d0*D_xxyyyyz
    v233       = 0.166666666666667d0*D_xxyyyyz
    v268       = 0.0416666666666667d0*D_xxyyyyz
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
    v293       = 0.5d0*D_xyyyyyy
    v300       = 0.166666666666667d0*D_xyyyyyy
    v312       = 0.0416666666666667d0*D_xyyyyyy
    v332       = 0.00833333333333333d0*D_xyyyyyy
    v382       = 0.00138888888888889d0*D_xyyyyyy
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    v303       = 0.5d0*D_xyyyyyz
    v315       = 0.166666666666667d0*D_xyyyyyz
    v335       = 0.0416666666666667d0*D_xyyyyyz
    v385       = 0.00833333333333333d0*D_xyyyyyz
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    v296       = 0.5d0*D_xyyyyzz
    v318       = 0.25d0*D_xyyyyzz
    v338       = 0.0833333333333333d0*D_xyyyyzz
    v350       = 0.166666666666667d0*D_xyyyyzz
    v388       = 0.0208333333333333d0*D_xyyyyzz
    v406       = 0.0416666666666667d0*D_xyyyyzz
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    v306       = 0.166666666666667d0*D_xyyyzzz
    v308       = 0.5d0*D_xyyyzzz
    v342       = 0.0833333333333333d0*D_xyyyzzz
    v351       = 0.25d0*D_xyyyzzz
    v392       = 0.0277777777777778d0*D_xyyyzzz
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    v322       = 0.0416666666666667d0*D_xyyzzzz
    v327       = 0.166666666666667d0*D_xyyzzzz
    v397       = 0.0208333333333333d0*D_xyyzzzz
    v411       = 0.0833333333333333d0*D_xyyzzzz
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    v347       = 0.00833333333333333d0*D_xyzzzzz
    v355       = 0.0416666666666667d0*D_xyzzzzz
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    v403       = 0.00138888888888889d0*D_xzzzzzz
    v416       = 0.00833333333333333d0*D_xzzzzzz
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz  = v77*v94
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    v422       = 0.5d0*D_yyyyyzz
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    v429       = 0.166666666666667d0*D_yyyyzzz
    v431       = 0.5d0*D_yyyyzzz
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    v439       = 0.0416666666666667d0*D_yyyzzzz
    v442       = 0.166666666666667d0*D_yyyzzzz
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    v452       = 0.00833333333333333d0*D_yyzzzzz
    v456       = 0.0416666666666667d0*D_yyzzzzz
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    v468       = 0.00138888888888889d0*D_yzzzzzz
    v473       = 0.00833333333333333d0*D_yzzzzzz
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v502       = v511*v95
    v503       = v95*z
    v504       = v503*x
    v505       = v503*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v502
    v105       = 2835.0d0*v504
    v110       = v505
    v115       = 945.0d0*v502
    v118       = v504
    v133       = 2835.0d0*v505
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = v104*v105
    L_xxxxxxx  = D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxy*M_y + D_xxxxxxxz*M_z
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = -v96*(v507 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    v113       = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v489 + 155925.0d0*(-13.0d0*v488 + 13.0d0*v49))
    L_xxxxxxy  = D_xxxxxxxy*M_x + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyz*M_z
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    v114       = 0.5d0*D_xxxxxxzz
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*v112 + D_xxxxxxxy*M_xy + &
      D_xxxxxxxz*M_xz + D_xxxxxxy*M_y + D_xxxxxxyz*M_yz + D_xxxxxxz*M_z &
      + M_yy*v113 + M_zz*v114
    L_xxxxxxz  = D_xxxxxxxz*M_x + D_xxxxxxyz*M_y + D_xxxxxxz*M_0 + D_xxxxxxzz*M_z
    D_xxxxxyyy = v115*(v508 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v120       = 0.5d0*D_xxxxxyyy
    v126       = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = v118*(v509 + 2027025.0d0*v483 - 135135.0d0*v488 + 103950.0d0*v489 + &
      155925.0d0*v491)
    v127       = 0.5d0*D_xxxxxyyz
    L_xxxxxyy  = D_xxxxxxyy*M_x + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyz*M_z
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    v121       = 0.5d0*D_xxxxxyzz
    L_xxxxxy   = D_xxxxxxxy*v112 + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyz*M_yz + D_xxxxxyz*M_z + &
      M_yy*v120 + M_zz*v121
    L_xxxxxyz  = D_xxxxxxyz*M_x + D_xxxxxyyz*M_y + D_xxxxxyz*M_0 + D_xxxxxyzz*M_z
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    v129       = 0.166666666666667d0*D_xxxxxzzz
    v130       = 0.5d0*D_xxxxxzzz
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*v112 + D_xxxxxxxx*v122 + &
      D_xxxxxxxy*v123 + D_xxxxxxxz*v124 + D_xxxxxxy*M_xy + D_xxxxxxyz* &
      M_xyz + D_xxxxxxz*M_xz + D_xxxxxy*M_y + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + M_xyy*v113 + M_xzz*v114 + M_yy*v125 + M_yyy*v126 + M_yyz* &
      v127 + M_yzz*v121 + M_zz*v128 + M_zzz*v129
    L_xxxxxz   = D_xxxxxxxz*v112 + D_xxxxxxyz*M_xy + D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + &
      D_xxxxxyz*M_y + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + D_xxxxxzz*M_z + &
      M_yy*v127 + M_zz*v130
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v131) - 858.0d0*(v1*v50 + v132))
    v135       = 0.5d0*D_xxxxyyyy
    v138       = 0.166666666666667d0*D_xxxxyyyy
    v151       = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = v133*(v134 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v139       = 0.5d0*D_xxxxyyyz
    v152       = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyy  = D_xxxxxyyy*M_x + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyz*M_z
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    v136       = 0.5d0*D_xxxxyyzz
    v154       = 0.25d0*D_xxxxyyzz
    L_xxxxyy   = D_xxxxxxyy*v112 + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyz*M_yz + D_xxxxyyz*M_z + &
      M_yy*v135 + M_zz*v136
    L_xxxxyyz  = D_xxxxxyyz*M_x + D_xxxxyyyz*M_y + D_xxxxyyz*M_0 + D_xxxxyyzz*M_z
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    v141       = 0.166666666666667d0*D_xxxxyzzz
    v142       = 0.5d0*D_xxxxyzzz
    L_xxxxy    = D_xxxxxxxy*v122 + D_xxxxxxy*v112 + D_xxxxxxyy*v123 + D_xxxxxxyz*v124 + &
      D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz &
      + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyz*M_yz + D_xxxxyz*M_z + &
      M_xyy*v120 + M_xzz*v121 + M_yy*v137 + M_yyy*v138 + M_yyz*v139 + &
      M_yzz*v136 + M_zz*v140 + M_zzz*v141
    L_xxxxyz   = D_xxxxxxyz*v112 + D_xxxxxyyz*M_xy + D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + &
      D_xxxxyyz*M_y + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + D_xxxxyzz*M_z + &
      M_yy*v139 + M_zz*v142
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    v157       = 0.0416666666666667d0*D_xxxxzzzz
    v159       = 0.166666666666667d0*D_xxxxzzzz
    L_xxxx     = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v112 + D_xxxxxxx*v122 + D_xxxxxxxx* &
      v143 + D_xxxxxxxy*v144 + D_xxxxxxxz*v145 + D_xxxxxxy*v123 + &
      D_xxxxxxyy*v146 + D_xxxxxxyz*v147 + D_xxxxxxz*v124 + D_xxxxxxzz* &
      v148 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxy* &
      M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_xyy*v125 + M_xyyy*v126 + &
      M_xyyz*v127 + M_xyzz*v121 + M_xzz*v128 + M_xzzz*v129 + M_yy*v149 &
      + M_yyy*v150 + M_yyyy*v151 + M_yyyz*v152 + M_yyz*v153 + M_yyzz* &
      v154 + M_yzz*v140 + M_yzzz*v141 + M_zz*v155 + M_zzz*v156 + M_zzzz &
      *v157
    L_xxxxz    = D_xxxxxxxz*v122 + D_xxxxxxyz*v123 + D_xxxxxxz*v112 + D_xxxxxxzz*v124 + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxz*M_x + D_xxxxxzz*M_xz &
      + D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + D_xxxxzz*M_z + &
      M_xyy*v127 + M_xzz*v130 + M_yy*v153 + M_yyy*v152 + M_yyz*v136 + &
      M_yzz*v142 + M_zz*v158 + M_zzz*v159
    D_xxxyyyyy = v115*(v508 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v160       = 0.5d0*D_xxxyyyyy
    v163       = 0.166666666666667d0*D_xxxyyyyy
    v170       = 0.0416666666666667d0*D_xxxyyyyy
    v192       = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = v105*(v134 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v164       = 0.5d0*D_xxxyyyyz
    v171       = 0.166666666666667d0*D_xxxyyyyz
    v193       = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyy  = D_xxxxyyyy*M_x + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyz*M_z
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    v161       = 0.5d0*D_xxxyyyzz
    v173       = 0.25d0*D_xxxyyyzz
    v195       = 0.0833333333333333d0*D_xxxyyyzz
    v203       = 0.166666666666667d0*D_xxxyyyzz
    L_xxxyyy   = D_xxxxxyyy*v112 + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyz*M_yz + D_xxxyyyz*M_z + &
      M_yy*v160 + M_zz*v161
    L_xxxyyyz  = D_xxxxyyyz*M_x + D_xxxyyyyz*M_y + D_xxxyyyz*M_0 + D_xxxyyyzz*M_z
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    v166       = 0.166666666666667d0*D_xxxyyzzz
    v167       = 0.5d0*D_xxxyyzzz
    v198       = 0.0833333333333333d0*D_xxxyyzzz
    v204       = 0.25d0*D_xxxyyzzz
    L_xxxyy    = D_xxxxxxyy*v122 + D_xxxxxyy*v112 + D_xxxxxyyy*v123 + D_xxxxxyyz*v124 + &
      D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz &
      + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyz*M_yz + D_xxxyyz*M_z + &
      M_xyy*v135 + M_xzz*v136 + M_yy*v162 + M_yyy*v163 + M_yyz*v164 + &
      M_yzz*v161 + M_zz*v165 + M_zzz*v166
    L_xxxyyz   = D_xxxxxyyz*v112 + D_xxxxyyyz*M_xy + D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + &
      D_xxxyyyz*M_y + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + D_xxxyyzz*M_z + &
      M_yy*v164 + M_zz*v167
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    v176       = 0.0416666666666667d0*D_xxxyzzzz
    v178       = 0.166666666666667d0*D_xxxyzzzz
    L_xxxy     = D_xxxxxxxy*v143 + D_xxxxxxy*v122 + D_xxxxxxyy*v144 + D_xxxxxxyz*v145 + &
      D_xxxxxy*v112 + D_xxxxxyy*v123 + D_xxxxxyyy*v146 + D_xxxxxyyz* &
      v147 + D_xxxxxyz*v124 + D_xxxxxyzz*v148 + D_xxxxy*M_x + D_xxxxyy* &
      M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyy*M_y &
      + D_xxxyyz*M_yz + D_xxxyz*M_z + M_xyy*v137 + M_xyyy*v138 + M_xyyz &
      *v139 + M_xyzz*v136 + M_xzz*v140 + M_xzzz*v141 + M_yy*v168 + &
      M_yyy*v169 + M_yyyy*v170 + M_yyyz*v171 + M_yyz*v172 + M_yyzz*v173 &
      + M_yzz*v165 + M_yzzz*v166 + M_zz*v174 + M_zzz*v175 + M_zzzz*v176
    L_xxxyz    = D_xxxxxxyz*v122 + D_xxxxxyyz*v123 + D_xxxxxyz*v112 + D_xxxxxyzz*v124 + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyz*M_x + D_xxxxyzz*M_xz &
      + D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + D_xxxyzz*M_z + &
      M_xyy*v139 + M_xzz*v142 + M_yy*v172 + M_yyy*v171 + M_yyz*v161 + &
      M_yzz*v167 + M_zz*v177 + M_zzz*v178
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    v202       = 0.00833333333333333d0*D_xxxzzzzz
    v207       = 0.0416666666666667d0*D_xxxzzzzz
    L_xxx      = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v112 + D_xxxxxx*v122 + D_xxxxxxx*v143 + &
      D_xxxxxxxx*v179 + D_xxxxxxxy*v180 + D_xxxxxxxz*v181 + D_xxxxxxy* &
      v144 + D_xxxxxxyy*v182 + D_xxxxxxyz*v183 + D_xxxxxxz*v145 + &
      D_xxxxxxzz*v184 + D_xxxxxy*v123 + D_xxxxxyy*v146 + D_xxxxxyyy* &
      v185 + D_xxxxxyyz*v186 + D_xxxxxyz*v147 + D_xxxxxyzz*v187 + &
      D_xxxxxz*v124 + D_xxxxxzz*v148 + D_xxxxxzzz*v188 + D_xxxxy*M_xy + &
      D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxy*M_y + D_xxxyz*M_yz + &
      D_xxxz*M_z + M_xyy*v149 + M_xyyy*v150 + M_xyyyy*v151 + M_xyyyz* &
      v152 + M_xyyz*v153 + M_xyyzz*v154 + M_xyzz*v140 + M_xyzzz*v141 + &
      M_xzz*v155 + M_xzzz*v156 + M_xzzzz*v157 + M_yy*v189 + M_yyy*v190 &
      + M_yyyy*v191 + M_yyyyy*v192 + M_yyyyz*v193 + M_yyyz*v194 + &
      M_yyyzz*v195 + M_yyz*v196 + M_yyzz*v197 + M_yyzzz*v198 + M_yzz* &
      v174 + M_yzzz*v175 + M_yzzzz*v176 + M_zz*v199 + M_zzz*v200 + &
      M_zzzz*v201 + M_zzzzz*v202
    L_xxxz     = D_xxxxxxxz*v143 + D_xxxxxxyz*v144 + D_xxxxxxz*v122 + D_xxxxxxzz*v145 + &
      D_xxxxxyyz*v146 + D_xxxxxyz*v123 + D_xxxxxyzz*v147 + D_xxxxxz* &
      v112 + D_xxxxxzz*v124 + D_xxxxxzzz*v148 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y + &
      D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_xyy*v153 + M_xyyy* &
      v152 + M_xyyz*v136 + M_xyzz*v142 + M_xzz*v158 + M_xzzz*v159 + &
      M_yy*v196 + M_yyy*v194 + M_yyyy*v193 + M_yyyz*v203 + M_yyz*v165 + &
      M_yyzz*v204 + M_yzz*v177 + M_yzzz*v178 + M_zz*v205 + M_zzz*v206 + &
      M_zzzz*v207
    D_xxyyyyyy = -v96*(v507 + h*v92 + v0*v108 + 135.0d0*v131 - 495.0d0*v208 + 6435.0d0*( &
      -v0*v68 + v132))
    v209       = 0.5d0*D_xxyyyyyy
    v212       = 0.166666666666667d0*D_xxyyyyyy
    v219       = 0.0416666666666667d0*D_xxyyyyyy
    v231       = 0.00833333333333333d0*D_xxyyyyyy
    v266       = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = v110*(v509 + 2027025.0d0*v484 + 155925.0d0*v489 + 103950.0d0*v491 - &
      135135.0d0*v492)
    v213       = 0.5d0*D_xxyyyyyz
    v220       = 0.166666666666667d0*D_xxyyyyyz
    v232       = 0.0416666666666667d0*D_xxyyyyyz
    v267       = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyy  = D_xxxyyyyy*M_x + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyz*M_z
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    v210       = 0.5d0*D_xxyyyyzz
    v222       = 0.25d0*D_xxyyyyzz
    v234       = 0.0833333333333333d0*D_xxyyyyzz
    v242       = 0.166666666666667d0*D_xxyyyyzz
    v269       = 0.0208333333333333d0*D_xxyyyyzz
    v282       = 0.0416666666666667d0*D_xxyyyyzz
    L_xxyyyy   = D_xxxxyyyy*v112 + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyz*M_yz + D_xxyyyyz*M_z + &
      M_yy*v209 + M_zz*v210
    L_xxyyyyz  = D_xxxyyyyz*M_x + D_xxyyyyyz*M_y + D_xxyyyyz*M_0 + D_xxyyyyzz*M_z
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    v215       = 0.166666666666667d0*D_xxyyyzzz
    v216       = 0.5d0*D_xxyyyzzz
    v237       = 0.0833333333333333d0*D_xxyyyzzz
    v243       = 0.25d0*D_xxyyyzzz
    v272       = 0.0277777777777778d0*D_xxyyyzzz
    L_xxyyy    = D_xxxxxyyy*v122 + D_xxxxyyy*v112 + D_xxxxyyyy*v123 + D_xxxxyyyz*v124 + &
      D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz &
      + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyz*M_yz + D_xxyyyz*M_z + &
      M_xyy*v160 + M_xzz*v161 + M_yy*v211 + M_yyy*v212 + M_yyz*v213 + &
      M_yzz*v210 + M_zz*v214 + M_zzz*v215
    L_xxyyyz   = D_xxxxyyyz*v112 + D_xxxyyyyz*M_xy + D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + &
      D_xxyyyyz*M_y + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + D_xxyyyzz*M_z + &
      M_yy*v213 + M_zz*v216
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    v225       = 0.0416666666666667d0*D_xxyyzzzz
    v227       = 0.166666666666667d0*D_xxyyzzzz
    v276       = 0.0208333333333333d0*D_xxyyzzzz
    v285       = 0.0833333333333333d0*D_xxyyzzzz
    L_xxyy     = D_xxxxxxyy*v143 + D_xxxxxyy*v122 + D_xxxxxyyy*v144 + D_xxxxxyyz*v145 + &
      D_xxxxyy*v112 + D_xxxxyyy*v123 + D_xxxxyyyy*v146 + D_xxxxyyyz* &
      v147 + D_xxxxyyz*v124 + D_xxxxyyzz*v148 + D_xxxyy*M_x + D_xxxyyy* &
      M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyy*M_y &
      + D_xxyyyz*M_yz + D_xxyyz*M_z + M_xyy*v162 + M_xyyy*v163 + M_xyyz &
      *v164 + M_xyzz*v161 + M_xzz*v165 + M_xzzz*v166 + M_yy*v217 + &
      M_yyy*v218 + M_yyyy*v219 + M_yyyz*v220 + M_yyz*v221 + M_yyzz*v222 &
      + M_yzz*v214 + M_yzzz*v215 + M_zz*v223 + M_zzz*v224 + M_zzzz*v225
    L_xxyyz    = D_xxxxxyyz*v122 + D_xxxxyyyz*v123 + D_xxxxyyz*v112 + D_xxxxyyzz*v124 + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyz*M_x + D_xxxyyzz*M_xz &
      + D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + D_xxyyzz*M_z + &
      M_xyy*v164 + M_xzz*v167 + M_yy*v221 + M_yyy*v220 + M_yyz*v210 + &
      M_yzz*v216 + M_zz*v226 + M_zzz*v227
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    v241       = 0.00833333333333333d0*D_xxyzzzzz
    v246       = 0.0416666666666667d0*D_xxyzzzzz
    L_xxy      = D_xxxxxxxy*v179 + D_xxxxxxy*v143 + D_xxxxxxyy*v180 + D_xxxxxxyz*v181 + &
      D_xxxxxy*v122 + D_xxxxxyy*v144 + D_xxxxxyyy*v182 + D_xxxxxyyz* &
      v183 + D_xxxxxyz*v145 + D_xxxxxyzz*v184 + D_xxxxy*v112 + D_xxxxyy &
      *v123 + D_xxxxyyy*v146 + D_xxxxyyyy*v185 + D_xxxxyyyz*v186 + &
      D_xxxxyyz*v147 + D_xxxxyyzz*v187 + D_xxxxyz*v124 + D_xxxxyzz*v148 &
      + D_xxxxyzzz*v188 + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyz*M_xyz + &
      D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z &
      + M_xyy*v168 + M_xyyy*v169 + M_xyyyy*v170 + M_xyyyz*v171 + M_xyyz &
      *v172 + M_xyyzz*v173 + M_xyzz*v165 + M_xyzzz*v166 + M_xzz*v174 + &
      M_xzzz*v175 + M_xzzzz*v176 + M_yy*v228 + M_yyy*v229 + M_yyyy*v230 &
      + M_yyyyy*v231 + M_yyyyz*v232 + M_yyyz*v233 + M_yyyzz*v234 + &
      M_yyz*v235 + M_yyzz*v236 + M_yyzzz*v237 + M_yzz*v223 + M_yzzz* &
      v224 + M_yzzzz*v225 + M_zz*v238 + M_zzz*v239 + M_zzzz*v240 + &
      M_zzzzz*v241
    L_xxyz     = D_xxxxxxyz*v143 + D_xxxxxyyz*v144 + D_xxxxxyz*v122 + D_xxxxxyzz*v145 + &
      D_xxxxyyyz*v146 + D_xxxxyyz*v123 + D_xxxxyyzz*v147 + D_xxxxyz* &
      v112 + D_xxxxyzz*v124 + D_xxxxyzzz*v148 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y + &
      D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_xyy*v172 + M_xyyy* &
      v171 + M_xyyz*v161 + M_xyzz*v167 + M_xzz*v177 + M_xzzz*v178 + &
      M_yy*v235 + M_yyy*v233 + M_yyyy*v232 + M_yyyz*v242 + M_yyz*v214 + &
      M_yyzz*v243 + M_yzz*v226 + M_yzzz*v227 + M_zz*v244 + M_zzz*v245 + &
      M_zzzz*v246
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    v281       = 0.00138888888888889d0*D_xxzzzzzz
    v289       = 0.00833333333333333d0*D_xxzzzzzz
    L_xx       = D_xx*M_0 + D_xxx*M_x + D_xxxx*v112 + D_xxxxx*v122 + D_xxxxxx*v143 + &
      D_xxxxxxx*v179 + D_xxxxxxxx*v247 + D_xxxxxxxy*v248 + D_xxxxxxxz* &
      v249 + D_xxxxxxy*v180 + D_xxxxxxyy*v250 + D_xxxxxxyz*v251 + &
      D_xxxxxxz*v181 + D_xxxxxxzz*v252 + D_xxxxxy*v144 + D_xxxxxyy*v182 &
      + D_xxxxxyyy*v253 + D_xxxxxyyz*v254 + D_xxxxxyz*v183 + D_xxxxxyzz &
      *v255 + D_xxxxxz*v145 + D_xxxxxzz*v184 + D_xxxxxzzz*v256 + &
      D_xxxxy*v123 + D_xxxxyy*v146 + D_xxxxyyy*v185 + D_xxxxyyyy*v257 + &
      D_xxxxyyyz*v258 + D_xxxxyyz*v186 + D_xxxxyyzz*v259 + D_xxxxyz* &
      v147 + D_xxxxyzz*v187 + D_xxxxyzzz*v260 + D_xxxxz*v124 + D_xxxxzz &
      *v148 + D_xxxxzzz*v188 + D_xxxxzzzz*v261 + D_xxxy*M_xy + D_xxxyz* &
      M_xyz + D_xxxz*M_xz + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + M_xyy &
      *v189 + M_xyyy*v190 + M_xyyyy*v191 + M_xyyyyy*v192 + M_xyyyyz* &
      v193 + M_xyyyz*v194 + M_xyyyzz*v195 + M_xyyz*v196 + M_xyyzz*v197 &
      + M_xyyzzz*v198 + M_xyzz*v174 + M_xyzzz*v175 + M_xyzzzz*v176 + &
      M_xzz*v199 + M_xzzz*v200 + M_xzzzz*v201 + M_xzzzzz*v202 + M_yy* &
      v262 + M_yyy*v263 + M_yyyy*v264 + M_yyyyy*v265 + M_yyyyyy*v266 + &
      M_yyyyyz*v267 + M_yyyyz*v268 + M_yyyyzz*v269 + M_yyyz*v270 + &
      M_yyyzz*v271 + M_yyyzzz*v272 + M_yyz*v273 + M_yyzz*v274 + M_yyzzz &
      *v275 + M_yyzzzz*v276 + M_yzz*v238 + M_yzzz*v239 + M_yzzzz*v240 + &
      M_yzzzzz*v241 + M_zz*v277 + M_zzz*v278 + M_zzzz*v279 + M_zzzzz* &
      v280 + M_zzzzzz*v281
    L_xxz      = D_xxxxxxxz*v179 + D_xxxxxxyz*v180 + D_xxxxxxz*v143 + D_xxxxxxzz*v181 + &
      D_xxxxxyyz*v182 + D_xxxxxyz*v144 + D_xxxxxyzz*v183 + D_xxxxxz* &
      v122 + D_xxxxxzz*v145 + D_xxxxxzzz*v184 + D_xxxxyyyz*v185 + &
      D_xxxxyyz*v146 + D_xxxxyyzz*v186 + D_xxxxyz*v123 + D_xxxxyzz*v147 &
      + D_xxxxyzzz*v187 + D_xxxxz*v112 + D_xxxxzz*v124 + D_xxxxzzz*v148 &
      + D_xxxxzzzz*v188 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + &
      D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z &
      + M_xyy*v196 + M_xyyy*v194 + M_xyyyy*v193 + M_xyyyz*v203 + M_xyyz &
      *v165 + M_xyyzz*v204 + M_xyzz*v177 + M_xyzzz*v178 + M_xzz*v205 + &
      M_xzzz*v206 + M_xzzzz*v207 + M_yy*v273 + M_yyy*v270 + M_yyyy*v268 &
      + M_yyyyy*v267 + M_yyyyz*v282 + M_yyyz*v283 + M_yyyzz*v237 + &
      M_yyz*v223 + M_yyzz*v284 + M_yyzzz*v285 + M_yzz*v244 + M_yzzz* &
      v245 + M_yzzzz*v246 + M_zz*v286 + M_zzz*v287 + M_zzzz*v288 + &
      M_zzzzz*v289
    D_xyyyyyyy = v102*v290
    v291       = 0.5d0*D_xyyyyyyy
    v294       = 0.166666666666667d0*D_xyyyyyyy
    v301       = 0.0416666666666667d0*D_xyyyyyyy
    v313       = 0.00833333333333333d0*D_xyyyyyyy
    v333       = 0.00138888888888889d0*D_xyyyyyyy
    v383       = 0.000198412698412698d0*D_xyyyyyyy
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = v118*(v111 + 467775.0d0*v491 + 155925.0d0*(-13.0d0*v492 + 13.0d0*v68))
    v295       = 0.5d0*D_xyyyyyyz
    v302       = 0.166666666666667d0*D_xyyyyyyz
    v314       = 0.0416666666666667d0*D_xyyyyyyz
    v334       = 0.00833333333333333d0*D_xyyyyyyz
    v384       = 0.00138888888888889d0*D_xyyyyyyz
    L_xyyyyyy  = D_xxyyyyyy*M_x + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyz*M_z
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    v292       = 0.5d0*D_xyyyyyzz
    v304       = 0.25d0*D_xyyyyyzz
    v316       = 0.0833333333333333d0*D_xyyyyyzz
    v324       = 0.166666666666667d0*D_xyyyyyzz
    v336       = 0.0208333333333333d0*D_xyyyyyzz
    v349       = 0.0416666666666667d0*D_xyyyyyzz
    v386       = 0.00416666666666667d0*D_xyyyyyzz
    v405       = 0.00833333333333333d0*D_xyyyyyzz
    L_xyyyyy   = D_xxxyyyyy*v112 + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyz*M_yz + D_xyyyyyz*M_z + &
      M_yy*v291 + M_zz*v292
    L_xyyyyyz  = D_xxyyyyyz*M_x + D_xyyyyyyz*M_y + D_xyyyyyz*M_0 + D_xyyyyyzz*M_z
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    v297       = 0.166666666666667d0*D_xyyyyzzz
    v298       = 0.5d0*D_xyyyyzzz
    v319       = 0.0833333333333333d0*D_xyyyyzzz
    v325       = 0.25d0*D_xyyyyzzz
    v339       = 0.0277777777777778d0*D_xyyyyzzz
    v389       = 0.00694444444444444d0*D_xyyyyzzz
    v407       = 0.0208333333333333d0*D_xyyyyzzz
    L_xyyyy    = D_xxxxyyyy*v122 + D_xxxyyyy*v112 + D_xxxyyyyy*v123 + D_xxxyyyyz*v124 + &
      D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz &
      + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyz*M_yz + D_xyyyyz*M_z + &
      M_xyy*v209 + M_xzz*v210 + M_yy*v293 + M_yyy*v294 + M_yyz*v295 + &
      M_yzz*v292 + M_zz*v296 + M_zzz*v297
    L_xyyyyz   = D_xxxyyyyz*v112 + D_xxyyyyyz*M_xy + D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + &
      D_xyyyyyz*M_y + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + D_xyyyyzz*M_z + &
      M_yy*v295 + M_zz*v298
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    v307       = 0.0416666666666667d0*D_xyyyzzzz
    v309       = 0.166666666666667d0*D_xyyyzzzz
    v343       = 0.0208333333333333d0*D_xyyyzzzz
    v352       = 0.0833333333333333d0*D_xyyyzzzz
    v393       = 0.00694444444444444d0*D_xyyyzzzz
    v409       = 0.0277777777777778d0*D_xyyyzzzz
    L_xyyy     = D_xxxxxyyy*v143 + D_xxxxyyy*v122 + D_xxxxyyyy*v144 + D_xxxxyyyz*v145 + &
      D_xxxyyy*v112 + D_xxxyyyy*v123 + D_xxxyyyyy*v146 + D_xxxyyyyz* &
      v147 + D_xxxyyyz*v124 + D_xxxyyyzz*v148 + D_xxyyy*M_x + D_xxyyyy* &
      M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyy*M_y &
      + D_xyyyyz*M_yz + D_xyyyz*M_z + M_xyy*v211 + M_xyyy*v212 + M_xyyz &
      *v213 + M_xyzz*v210 + M_xzz*v214 + M_xzzz*v215 + M_yy*v299 + &
      M_yyy*v300 + M_yyyy*v301 + M_yyyz*v302 + M_yyz*v303 + M_yyzz*v304 &
      + M_yzz*v296 + M_yzzz*v297 + M_zz*v305 + M_zzz*v306 + M_zzzz*v307
    L_xyyyz    = D_xxxxyyyz*v122 + D_xxxyyyyz*v123 + D_xxxyyyz*v112 + D_xxxyyyzz*v124 + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyz*M_x + D_xxyyyzz*M_xz &
      + D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + D_xyyyzz*M_z + &
      M_xyy*v213 + M_xzz*v216 + M_yy*v303 + M_yyy*v302 + M_yyz*v292 + &
      M_yzz*v298 + M_zz*v308 + M_zzz*v309
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    v323       = 0.00833333333333333d0*D_xyyzzzzz
    v328       = 0.0416666666666667d0*D_xyyzzzzz
    v398       = 0.00416666666666667d0*D_xyyzzzzz
    v412       = 0.0208333333333333d0*D_xyyzzzzz
    L_xyy      = D_xxxxxxyy*v179 + D_xxxxxyy*v143 + D_xxxxxyyy*v180 + D_xxxxxyyz*v181 + &
      D_xxxxyy*v122 + D_xxxxyyy*v144 + D_xxxxyyyy*v182 + D_xxxxyyyz* &
      v183 + D_xxxxyyz*v145 + D_xxxxyyzz*v184 + D_xxxyy*v112 + D_xxxyyy &
      *v123 + D_xxxyyyy*v146 + D_xxxyyyyy*v185 + D_xxxyyyyz*v186 + &
      D_xxxyyyz*v147 + D_xxxyyyzz*v187 + D_xxxyyz*v124 + D_xxxyyzz*v148 &
      + D_xxxyyzzz*v188 + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyz*M_xyz + &
      D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z &
      + M_xyy*v217 + M_xyyy*v218 + M_xyyyy*v219 + M_xyyyz*v220 + M_xyyz &
      *v221 + M_xyyzz*v222 + M_xyzz*v214 + M_xyzzz*v215 + M_xzz*v223 + &
      M_xzzz*v224 + M_xzzzz*v225 + M_yy*v310 + M_yyy*v311 + M_yyyy*v312 &
      + M_yyyyy*v313 + M_yyyyz*v314 + M_yyyz*v315 + M_yyyzz*v316 + &
      M_yyz*v317 + M_yyzz*v318 + M_yyzzz*v319 + M_yzz*v305 + M_yzzz* &
      v306 + M_yzzzz*v307 + M_zz*v320 + M_zzz*v321 + M_zzzz*v322 + &
      M_zzzzz*v323
    L_xyyz     = D_xxxxxyyz*v143 + D_xxxxyyyz*v144 + D_xxxxyyz*v122 + D_xxxxyyzz*v145 + &
      D_xxxyyyyz*v146 + D_xxxyyyz*v123 + D_xxxyyyzz*v147 + D_xxxyyz* &
      v112 + D_xxxyyzz*v124 + D_xxxyyzzz*v148 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y + &
      D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_xyy*v221 + M_xyyy* &
      v220 + M_xyyz*v210 + M_xyzz*v216 + M_xzz*v226 + M_xzzz*v227 + &
      M_yy*v317 + M_yyy*v315 + M_yyyy*v314 + M_yyyz*v324 + M_yyz*v296 + &
      M_yyzz*v325 + M_yzz*v308 + M_yzzz*v309 + M_zz*v326 + M_zzz*v327 + &
      M_zzzz*v328
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    v348       = 0.00138888888888889d0*D_xyzzzzzz
    v356       = 0.00833333333333333d0*D_xyzzzzzz
    L_xy       = D_xxxxxxxy*v247 + D_xxxxxxy*v179 + D_xxxxxxyy*v248 + D_xxxxxxyz*v249 + &
      D_xxxxxy*v143 + D_xxxxxyy*v180 + D_xxxxxyyy*v250 + D_xxxxxyyz* &
      v251 + D_xxxxxyz*v181 + D_xxxxxyzz*v252 + D_xxxxy*v122 + D_xxxxyy &
      *v144 + D_xxxxyyy*v182 + D_xxxxyyyy*v253 + D_xxxxyyyz*v254 + &
      D_xxxxyyz*v183 + D_xxxxyyzz*v255 + D_xxxxyz*v145 + D_xxxxyzz*v184 &
      + D_xxxxyzzz*v256 + D_xxxy*v112 + D_xxxyy*v123 + D_xxxyyy*v146 + &
      D_xxxyyyy*v185 + D_xxxyyyyy*v257 + D_xxxyyyyz*v258 + D_xxxyyyz* &
      v186 + D_xxxyyyzz*v259 + D_xxxyyz*v147 + D_xxxyyzz*v187 + &
      D_xxxyyzzz*v260 + D_xxxyz*v124 + D_xxxyzz*v148 + D_xxxyzzz*v188 + &
      D_xxxyzzzz*v261 + D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + &
      D_xxyz*M_xz + D_xy*M_0 + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + &
      M_xyy*v228 + M_xyyy*v229 + M_xyyyy*v230 + M_xyyyyy*v231 + &
      M_xyyyyz*v232 + M_xyyyz*v233 + M_xyyyzz*v234 + M_xyyz*v235 + &
      M_xyyzz*v236 + M_xyyzzz*v237 + M_xyzz*v223 + M_xyzzz*v224 + &
      M_xyzzzz*v225 + M_xzz*v238 + M_xzzz*v239 + M_xzzzz*v240 + &
      M_xzzzzz*v241 + M_yy*v329 + M_yyy*v330 + M_yyyy*v331 + M_yyyyy* &
      v332 + M_yyyyyy*v333 + M_yyyyyz*v334 + M_yyyyz*v335 + M_yyyyzz* &
      v336 + M_yyyz*v337 + M_yyyzz*v338 + M_yyyzzz*v339 + M_yyz*v340 + &
      M_yyzz*v341 + M_yyzzz*v342 + M_yyzzzz*v343 + M_yzz*v320 + M_yzzz* &
      v321 + M_yzzzz*v322 + M_yzzzzz*v323 + M_zz*v344 + M_zzz*v345 + &
      M_zzzz*v346 + M_zzzzz*v347 + M_zzzzzz*v348
    L_xyz      = D_xxxxxxyz*v179 + D_xxxxxyyz*v180 + D_xxxxxyz*v143 + D_xxxxxyzz*v181 + &
      D_xxxxyyyz*v182 + D_xxxxyyz*v144 + D_xxxxyyzz*v183 + D_xxxxyz* &
      v122 + D_xxxxyzz*v145 + D_xxxxyzzz*v184 + D_xxxyyyyz*v185 + &
      D_xxxyyyz*v146 + D_xxxyyyzz*v186 + D_xxxyyz*v123 + D_xxxyyzz*v147 &
      + D_xxxyyzzz*v187 + D_xxxyz*v112 + D_xxxyzz*v124 + D_xxxyzzz*v148 &
      + D_xxxyzzzz*v188 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + &
      D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z &
      + M_xyy*v235 + M_xyyy*v233 + M_xyyyy*v232 + M_xyyyz*v242 + M_xyyz &
      *v214 + M_xyyzz*v243 + M_xyzz*v226 + M_xyzzz*v227 + M_xzz*v244 + &
      M_xzzz*v245 + M_xzzzz*v246 + M_yy*v340 + M_yyy*v337 + M_yyyy*v335 &
      + M_yyyyy*v334 + M_yyyyz*v349 + M_yyyz*v350 + M_yyyzz*v319 + &
      M_yyz*v305 + M_yyzz*v351 + M_yyzzz*v352 + M_yzz*v326 + M_yzzz* &
      v327 + M_yzzzz*v328 + M_zz*v353 + M_zzz*v354 + M_zzzz*v355 + &
      M_zzzzz*v356
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    v404       = 0.000198412698412698d0*D_xzzzzzzz
    v417       = 0.00138888888888889d0*D_xzzzzzzz
    L_x        = D_x*M_0 + D_xx*M_x + D_xxx*v112 + D_xxxx*v122 + D_xxxxx*v143 + D_xxxxxx* &
      v179 + D_xxxxxxx*v247 + D_xxxxxxxx*v357 + D_xxxxxxxy*v358 + &
      D_xxxxxxxz*v359 + D_xxxxxxy*v248 + D_xxxxxxyy*v360 + D_xxxxxxyz* &
      v361 + D_xxxxxxz*v249 + D_xxxxxxzz*v362 + D_xxxxxy*v180 + &
      D_xxxxxyy*v250 + D_xxxxxyyy*v363 + D_xxxxxyyz*v364 + D_xxxxxyz* &
      v251 + D_xxxxxyzz*v365 + D_xxxxxz*v181 + D_xxxxxzz*v252 + &
      D_xxxxxzzz*v366 + D_xxxxy*v144 + D_xxxxyy*v182 + D_xxxxyyy*v253 + &
      D_xxxxyyyy*v367 + D_xxxxyyyz*v368 + D_xxxxyyz*v254 + D_xxxxyyzz* &
      v369 + D_xxxxyz*v183 + D_xxxxyzz*v255 + D_xxxxyzzz*v370 + D_xxxxz &
      *v145 + D_xxxxzz*v184 + D_xxxxzzz*v256 + D_xxxxzzzz*v371 + D_xxxy &
      *v123 + D_xxxyy*v146 + D_xxxyyy*v185 + D_xxxyyyy*v257 + &
      D_xxxyyyyy*v372 + D_xxxyyyyz*v373 + D_xxxyyyz*v258 + D_xxxyyyzz* &
      v374 + D_xxxyyz*v186 + D_xxxyyzz*v259 + D_xxxyyzzz*v375 + D_xxxyz &
      *v147 + D_xxxyzz*v187 + D_xxxyzzz*v260 + D_xxxyzzzz*v376 + D_xxxz &
      *v124 + D_xxxzz*v148 + D_xxxzzz*v188 + D_xxxzzzz*v261 + &
      D_xxxzzzzz*v377 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy* &
      M_y + D_xyz*M_yz + D_xz*M_z + M_xyy*v262 + M_xyyy*v263 + M_xyyyy* &
      v264 + M_xyyyyy*v265 + M_xyyyyyy*v266 + M_xyyyyyz*v267 + M_xyyyyz &
      *v268 + M_xyyyyzz*v269 + M_xyyyz*v270 + M_xyyyzz*v271 + M_xyyyzzz &
      *v272 + M_xyyz*v273 + M_xyyzz*v274 + M_xyyzzz*v275 + M_xyyzzzz* &
      v276 + M_xyzz*v238 + M_xyzzz*v239 + M_xyzzzz*v240 + M_xyzzzzz* &
      v241 + M_xzz*v277 + M_xzzz*v278 + M_xzzzz*v279 + M_xzzzzz*v280 + &
      M_xzzzzzz*v281 + M_yy*v378 + M_yyy*v379 + M_yyyy*v380 + M_yyyyy* &
      v381 + M_yyyyyy*v382 + M_yyyyyyy*v383 + M_yyyyyyz*v384 + M_yyyyyz &
      *v385 + M_yyyyyzz*v386 + M_yyyyz*v387 + M_yyyyzz*v388 + M_yyyyzzz &
      *v389 + M_yyyz*v390 + M_yyyzz*v391 + M_yyyzzz*v392 + M_yyyzzzz* &
      v393 + M_yyz*v394 + M_yyzz*v395 + M_yyzzz*v396 + M_yyzzzz*v397 + &
      M_yyzzzzz*v398 + M_yzz*v344 + M_yzzz*v345 + M_yzzzz*v346 + &
      M_yzzzzz*v347 + M_yzzzzzz*v348 + M_zz*v399 + M_zzz*v400 + M_zzzz* &
      v401 + M_zzzzz*v402 + M_zzzzzz*v403 + M_zzzzzzz*v404
    L_xz       = D_xxxxxxxz*v247 + D_xxxxxxyz*v248 + D_xxxxxxz*v179 + D_xxxxxxzz*v249 + &
      D_xxxxxyyz*v250 + D_xxxxxyz*v180 + D_xxxxxyzz*v251 + D_xxxxxz* &
      v143 + D_xxxxxzz*v181 + D_xxxxxzzz*v252 + D_xxxxyyyz*v253 + &
      D_xxxxyyz*v182 + D_xxxxyyzz*v254 + D_xxxxyz*v144 + D_xxxxyzz*v183 &
      + D_xxxxyzzz*v255 + D_xxxxz*v122 + D_xxxxzz*v145 + D_xxxxzzz*v184 &
      + D_xxxxzzzz*v256 + D_xxxyyyyz*v257 + D_xxxyyyz*v185 + D_xxxyyyzz &
      *v258 + D_xxxyyz*v146 + D_xxxyyzz*v186 + D_xxxyyzzz*v259 + &
      D_xxxyz*v123 + D_xxxyzz*v147 + D_xxxyzzz*v187 + D_xxxyzzzz*v260 + &
      D_xxxz*v112 + D_xxxzz*v124 + D_xxxzzz*v148 + D_xxxzzzz*v188 + &
      D_xxxzzzzz*v261 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + &
      D_xxzz*M_xz + D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + &
      M_xyy*v273 + M_xyyy*v270 + M_xyyyy*v268 + M_xyyyyy*v267 + &
      M_xyyyyz*v282 + M_xyyyz*v283 + M_xyyyzz*v237 + M_xyyz*v223 + &
      M_xyyzz*v284 + M_xyyzzz*v285 + M_xyzz*v244 + M_xyzzz*v245 + &
      M_xyzzzz*v246 + M_xzz*v286 + M_xzzz*v287 + M_xzzzz*v288 + &
      M_xzzzzz*v289 + M_yy*v394 + M_yyy*v390 + M_yyyy*v387 + M_yyyyy* &
      v385 + M_yyyyyy*v384 + M_yyyyyz*v405 + M_yyyyz*v406 + M_yyyyzz* &
      v407 + M_yyyz*v408 + M_yyyzz*v342 + M_yyyzzz*v409 + M_yyz*v320 + &
      M_yyzz*v410 + M_yyzzz*v411 + M_yyzzzz*v412 + M_yzz*v353 + M_yzzz* &
      v354 + M_yzzzz*v355 + M_yzzzzz*v356 + M_zz*v413 + M_zzz*v414 + &
      M_zzzz*v415 + M_zzzzz*v416 + M_zzzzzz*v417
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v208 - (1260.0d0*v131 + v68*v99))
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = v133*v290
    L_yyyyyyy  = D_xyyyyyyy*M_x + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyz*M_z
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    v419       = 0.5d0*D_yyyyyyzz
    L_yyyyyy   = D_xxyyyyyy*v112 + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*v418 + D_yyyyyyyz*M_yz &
      + D_yyyyyyz*M_z + M_zz*v419
    L_yyyyyyz  = D_xyyyyyyz*M_x + D_yyyyyyyz*M_y + D_yyyyyyz*M_0 + D_yyyyyyzz*M_z
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    v423       = 0.166666666666667d0*D_yyyyyzzz
    v424       = 0.5d0*D_yyyyyzzz
    L_yyyyy    = D_xxxyyyyy*v122 + D_xxyyyyy*v112 + D_xxyyyyyy*v123 + D_xxyyyyyz*v124 + &
      D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyz*M_xyz + D_xyyyyyz*M_xz &
      + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*v418 + D_yyyyyyyy*v420 + &
      D_yyyyyyyz*v421 + D_yyyyyyz*M_yz + D_yyyyyz*M_z + M_xyy*v291 + &
      M_xzz*v292 + M_yzz*v419 + M_zz*v422 + M_zzz*v423
    L_yyyyyz   = D_xxyyyyyz*v112 + D_xyyyyyyz*M_xy + D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + &
      D_yyyyyyyz*v418 + D_yyyyyyz*M_y + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 &
      + D_yyyyyzz*M_z + M_zz*v424
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    v430       = 0.0416666666666667d0*D_yyyyzzzz
    v432       = 0.166666666666667d0*D_yyyyzzzz
    L_yyyy     = D_xxxxyyyy*v143 + D_xxxyyyy*v122 + D_xxxyyyyy*v144 + D_xxxyyyyz*v145 + &
      D_xxyyyy*v112 + D_xxyyyyy*v123 + D_xxyyyyyy*v146 + D_xxyyyyyz* &
      v147 + D_xxyyyyz*v124 + D_xxyyyyzz*v148 + D_xyyyy*M_x + D_xyyyyy* &
      M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyy*M_y &
      + D_yyyyyy*v418 + D_yyyyyyy*v420 + D_yyyyyyyy*v425 + D_yyyyyyyz* &
      v426 + D_yyyyyyz*v421 + D_yyyyyyzz*v427 + D_yyyyyz*M_yz + D_yyyyz &
      *M_z + M_xyy*v293 + M_xyyy*v294 + M_xyyz*v295 + M_xyzz*v292 + &
      M_xzz*v296 + M_xzzz*v297 + M_yzz*v422 + M_yzzz*v423 + M_zz*v428 + &
      M_zzz*v429 + M_zzzz*v430
    L_yyyyz    = D_xxxyyyyz*v122 + D_xxyyyyyz*v123 + D_xxyyyyz*v112 + D_xxyyyyzz*v124 + &
      D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyz*M_x + D_xyyyyzz*M_xz &
      + D_yyyyyyyz*v420 + D_yyyyyyz*v418 + D_yyyyyyzz*v421 + D_yyyyyz* &
      M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + D_yyyyzz*M_z + M_xyy*v295 + &
      M_xzz*v298 + M_yzz*v424 + M_zz*v431 + M_zzz*v432
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    v440       = 0.00833333333333333d0*D_yyyzzzzz
    v443       = 0.0416666666666667d0*D_yyyzzzzz
    L_yyy      = D_xxxxxyyy*v179 + D_xxxxyyy*v143 + D_xxxxyyyy*v180 + D_xxxxyyyz*v181 + &
      D_xxxyyy*v122 + D_xxxyyyy*v144 + D_xxxyyyyy*v182 + D_xxxyyyyz* &
      v183 + D_xxxyyyz*v145 + D_xxxyyyzz*v184 + D_xxyyy*v112 + D_xxyyyy &
      *v123 + D_xxyyyyy*v146 + D_xxyyyyyy*v185 + D_xxyyyyyz*v186 + &
      D_xxyyyyz*v147 + D_xxyyyyzz*v187 + D_xxyyyz*v124 + D_xxyyyzz*v148 &
      + D_xxyyyzzz*v188 + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyz*M_xyz + &
      D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*v418 + D_yyyyyy* &
      v420 + D_yyyyyyy*v425 + D_yyyyyyyy*v433 + D_yyyyyyyz*v434 + &
      D_yyyyyyz*v426 + D_yyyyyyzz*v435 + D_yyyyyz*v421 + D_yyyyyzz*v427 &
      + D_yyyyyzzz*v436 + D_yyyyz*M_yz + D_yyyz*M_z + M_xyy*v299 + &
      M_xyyy*v300 + M_xyyyy*v301 + M_xyyyz*v302 + M_xyyz*v303 + M_xyyzz &
      *v304 + M_xyzz*v296 + M_xyzzz*v297 + M_xzz*v305 + M_xzzz*v306 + &
      M_xzzzz*v307 + M_yzz*v428 + M_yzzz*v429 + M_yzzzz*v430 + M_zz* &
      v437 + M_zzz*v438 + M_zzzz*v439 + M_zzzzz*v440
    L_yyyz     = D_xxxxyyyz*v143 + D_xxxyyyyz*v144 + D_xxxyyyz*v122 + D_xxxyyyzz*v145 + &
      D_xxyyyyyz*v146 + D_xxyyyyz*v123 + D_xxyyyyzz*v147 + D_xxyyyz* &
      v112 + D_xxyyyzz*v124 + D_xxyyyzzz*v148 + D_xyyyyz*M_xy + &
      D_xyyyyzz*M_xyz + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyyyz*v425 + &
      D_yyyyyyz*v420 + D_yyyyyyzz*v426 + D_yyyyyz*v418 + D_yyyyyzz*v421 &
      + D_yyyyyzzz*v427 + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + &
      D_yyyzz*M_z + M_xyy*v303 + M_xyyy*v302 + M_xyyz*v292 + M_xyzz* &
      v298 + M_xzz*v308 + M_xzzz*v309 + M_yzz*v431 + M_yzzz*v432 + M_zz &
      *v441 + M_zzz*v442 + M_zzzz*v443
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    v453       = 0.00138888888888889d0*D_yyzzzzzz
    v457       = 0.00833333333333333d0*D_yyzzzzzz
    L_yy       = D_xxxxxxyy*v247 + D_xxxxxyy*v179 + D_xxxxxyyy*v248 + D_xxxxxyyz*v249 + &
      D_xxxxyy*v143 + D_xxxxyyy*v180 + D_xxxxyyyy*v250 + D_xxxxyyyz* &
      v251 + D_xxxxyyz*v181 + D_xxxxyyzz*v252 + D_xxxyy*v122 + D_xxxyyy &
      *v144 + D_xxxyyyy*v182 + D_xxxyyyyy*v253 + D_xxxyyyyz*v254 + &
      D_xxxyyyz*v183 + D_xxxyyyzz*v255 + D_xxxyyz*v145 + D_xxxyyzz*v184 &
      + D_xxxyyzzz*v256 + D_xxyy*v112 + D_xxyyy*v123 + D_xxyyyy*v146 + &
      D_xxyyyyy*v185 + D_xxyyyyyy*v257 + D_xxyyyyyz*v258 + D_xxyyyyz* &
      v186 + D_xxyyyyzz*v259 + D_xxyyyz*v147 + D_xxyyyzz*v187 + &
      D_xxyyyzzz*v260 + D_xxyyz*v124 + D_xxyyzz*v148 + D_xxyyzzz*v188 + &
      D_xxyyzzzz*v261 + D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + &
      D_xyyz*M_xz + D_yy*M_0 + D_yyy*M_y + D_yyyy*v418 + D_yyyyy*v420 + &
      D_yyyyyy*v425 + D_yyyyyyy*v433 + D_yyyyyyyy*v444 + D_yyyyyyyz* &
      v445 + D_yyyyyyz*v434 + D_yyyyyyzz*v446 + D_yyyyyz*v426 + &
      D_yyyyyzz*v435 + D_yyyyyzzz*v447 + D_yyyyz*v421 + D_yyyyzz*v427 + &
      D_yyyyzzz*v436 + D_yyyyzzzz*v448 + D_yyyz*M_yz + D_yyz*M_z + &
      M_xyy*v310 + M_xyyy*v311 + M_xyyyy*v312 + M_xyyyyy*v313 + &
      M_xyyyyz*v314 + M_xyyyz*v315 + M_xyyyzz*v316 + M_xyyz*v317 + &
      M_xyyzz*v318 + M_xyyzzz*v319 + M_xyzz*v305 + M_xyzzz*v306 + &
      M_xyzzzz*v307 + M_xzz*v320 + M_xzzz*v321 + M_xzzzz*v322 + &
      M_xzzzzz*v323 + M_yzz*v437 + M_yzzz*v438 + M_yzzzz*v439 + &
      M_yzzzzz*v440 + M_zz*v449 + M_zzz*v450 + M_zzzz*v451 + M_zzzzz* &
      v452 + M_zzzzzz*v453
    L_yyz      = D_xxxxxyyz*v179 + D_xxxxyyyz*v180 + D_xxxxyyz*v143 + D_xxxxyyzz*v181 + &
      D_xxxyyyyz*v182 + D_xxxyyyz*v144 + D_xxxyyyzz*v183 + D_xxxyyz* &
      v122 + D_xxxyyzz*v145 + D_xxxyyzzz*v184 + D_xxyyyyyz*v185 + &
      D_xxyyyyz*v146 + D_xxyyyyzz*v186 + D_xxyyyz*v123 + D_xxyyyzz*v147 &
      + D_xxyyyzzz*v187 + D_xxyyz*v112 + D_xxyyzz*v124 + D_xxyyzzz*v148 &
      + D_xxyyzzzz*v188 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + &
      D_xyyzz*M_xz + D_yyyyyyyz*v433 + D_yyyyyyz*v425 + D_yyyyyyzz*v434 &
      + D_yyyyyz*v420 + D_yyyyyzz*v426 + D_yyyyyzzz*v435 + D_yyyyz*v418 &
      + D_yyyyzz*v421 + D_yyyyzzz*v427 + D_yyyyzzzz*v436 + D_yyyz*M_y + &
      D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_xyy*v317 + M_xyyy*v315 &
      + M_xyyyy*v314 + M_xyyyz*v324 + M_xyyz*v296 + M_xyyzz*v325 + &
      M_xyzz*v308 + M_xyzzz*v309 + M_xzz*v326 + M_xzzz*v327 + M_xzzzz* &
      v328 + M_yzz*v441 + M_yzzz*v442 + M_yzzzz*v443 + M_zz*v454 + &
      M_zzz*v455 + M_zzzz*v456 + M_zzzzz*v457
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    v469       = 0.000198412698412698d0*D_yzzzzzzz
    v474       = 0.00138888888888889d0*D_yzzzzzzz
    L_y        = D_xxxxxxxy*v357 + D_xxxxxxy*v247 + D_xxxxxxyy*v358 + D_xxxxxxyz*v359 + &
      D_xxxxxy*v179 + D_xxxxxyy*v248 + D_xxxxxyyy*v360 + D_xxxxxyyz* &
      v361 + D_xxxxxyz*v249 + D_xxxxxyzz*v362 + D_xxxxy*v143 + D_xxxxyy &
      *v180 + D_xxxxyyy*v250 + D_xxxxyyyy*v363 + D_xxxxyyyz*v364 + &
      D_xxxxyyz*v251 + D_xxxxyyzz*v365 + D_xxxxyz*v181 + D_xxxxyzz*v252 &
      + D_xxxxyzzz*v366 + D_xxxy*v122 + D_xxxyy*v144 + D_xxxyyy*v182 + &
      D_xxxyyyy*v253 + D_xxxyyyyy*v367 + D_xxxyyyyz*v368 + D_xxxyyyz* &
      v254 + D_xxxyyyzz*v369 + D_xxxyyz*v183 + D_xxxyyzz*v255 + &
      D_xxxyyzzz*v370 + D_xxxyz*v145 + D_xxxyzz*v184 + D_xxxyzzz*v256 + &
      D_xxxyzzzz*v371 + D_xxy*v112 + D_xxyy*v123 + D_xxyyy*v146 + &
      D_xxyyyy*v185 + D_xxyyyyy*v257 + D_xxyyyyyy*v372 + D_xxyyyyyz* &
      v373 + D_xxyyyyz*v258 + D_xxyyyyzz*v374 + D_xxyyyz*v186 + &
      D_xxyyyzz*v259 + D_xxyyyzzz*v375 + D_xxyyz*v147 + D_xxyyzz*v187 + &
      D_xxyyzzz*v260 + D_xxyyzzzz*v376 + D_xxyz*v124 + D_xxyzz*v148 + &
      D_xxyzzz*v188 + D_xxyzzzz*v261 + D_xxyzzzzz*v377 + D_xy*M_x + &
      D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyy*v418 + D_yyyy*v420 + D_yyyyy*v425 + D_yyyyyy*v433 + &
      D_yyyyyyy*v444 + D_yyyyyyyy*v458 + D_yyyyyyyz*v459 + D_yyyyyyz* &
      v445 + D_yyyyyyzz*v460 + D_yyyyyz*v434 + D_yyyyyzz*v446 + &
      D_yyyyyzzz*v461 + D_yyyyz*v426 + D_yyyyzz*v435 + D_yyyyzzz*v447 + &
      D_yyyyzzzz*v462 + D_yyyz*v421 + D_yyyzz*v427 + D_yyyzzz*v436 + &
      D_yyyzzzz*v448 + D_yyyzzzzz*v463 + D_yyz*M_yz + D_yz*M_z + M_xyy* &
      v329 + M_xyyy*v330 + M_xyyyy*v331 + M_xyyyyy*v332 + M_xyyyyyy* &
      v333 + M_xyyyyyz*v334 + M_xyyyyz*v335 + M_xyyyyzz*v336 + M_xyyyz* &
      v337 + M_xyyyzz*v338 + M_xyyyzzz*v339 + M_xyyz*v340 + M_xyyzz* &
      v341 + M_xyyzzz*v342 + M_xyyzzzz*v343 + M_xyzz*v320 + M_xyzzz* &
      v321 + M_xyzzzz*v322 + M_xyzzzzz*v323 + M_xzz*v344 + M_xzzz*v345 &
      + M_xzzzz*v346 + M_xzzzzz*v347 + M_xzzzzzz*v348 + M_yzz*v449 + &
      M_yzzz*v450 + M_yzzzz*v451 + M_yzzzzz*v452 + M_yzzzzzz*v453 + &
      M_zz*v464 + M_zzz*v465 + M_zzzz*v466 + M_zzzzz*v467 + M_zzzzzz* &
      v468 + M_zzzzzzz*v469
    L_yz       = D_xxxxxxyz*v247 + D_xxxxxyyz*v248 + D_xxxxxyz*v179 + D_xxxxxyzz*v249 + &
      D_xxxxyyyz*v250 + D_xxxxyyz*v180 + D_xxxxyyzz*v251 + D_xxxxyz* &
      v143 + D_xxxxyzz*v181 + D_xxxxyzzz*v252 + D_xxxyyyyz*v253 + &
      D_xxxyyyz*v182 + D_xxxyyyzz*v254 + D_xxxyyz*v144 + D_xxxyyzz*v183 &
      + D_xxxyyzzz*v255 + D_xxxyz*v122 + D_xxxyzz*v145 + D_xxxyzzz*v184 &
      + D_xxxyzzzz*v256 + D_xxyyyyyz*v257 + D_xxyyyyz*v185 + D_xxyyyyzz &
      *v258 + D_xxyyyz*v146 + D_xxyyyzz*v186 + D_xxyyyzzz*v259 + &
      D_xxyyz*v123 + D_xxyyzz*v147 + D_xxyyzzz*v187 + D_xxyyzzzz*v260 + &
      D_xxyz*v112 + D_xxyzz*v124 + D_xxyzzz*v148 + D_xxyzzzz*v188 + &
      D_xxyzzzzz*v261 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + &
      D_xyzz*M_xz + D_yyyyyyyz*v444 + D_yyyyyyz*v433 + D_yyyyyyzz*v445 &
      + D_yyyyyz*v425 + D_yyyyyzz*v434 + D_yyyyyzzz*v446 + D_yyyyz*v420 &
      + D_yyyyzz*v426 + D_yyyyzzz*v435 + D_yyyyzzzz*v447 + D_yyyz*v418 &
      + D_yyyzz*v421 + D_yyyzzz*v427 + D_yyyzzzz*v436 + D_yyyzzzzz*v448 &
      + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + M_xyy*v340 + &
      M_xyyy*v337 + M_xyyyy*v335 + M_xyyyyy*v334 + M_xyyyyz*v349 + &
      M_xyyyz*v350 + M_xyyyzz*v319 + M_xyyz*v305 + M_xyyzz*v351 + &
      M_xyyzzz*v352 + M_xyzz*v326 + M_xyzzz*v327 + M_xyzzzz*v328 + &
      M_xzz*v353 + M_xzzz*v354 + M_xzzzz*v355 + M_xzzzzz*v356 + M_yzz* &
      v454 + M_yzzz*v455 + M_yzzzz*v456 + M_yzzzzz*v457 + M_zz*v470 + &
      M_zzz*v471 + M_zzzz*v472 + M_zzzzz*v473 + M_zzzzzz*v474
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_0        = 2.48015873015873d-5*(D_xxxxxxxx*M_xxxxxxxx + D_yyyyyyyy*M_yyyyyyyy + &
      D_zzzzzzzz*M_zzzzzzzz + 8.0d0*(D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxz &
      *M_xxxxxxxz + D_yyyyyyyz*M_yyyyyyyz) + 70.0d0*(D_xxxxyyyy* &
      M_xxxxyyyy + D_xxxxzzzz*M_xxxxzzzz + D_yyyyzzzz*M_yyyyzzzz) + &
      420.0d0*(D_xxxxyyzz*M_xxxxyyzz + D_xxyyyyzz*M_xxyyyyzz + &
      D_xxyyzzzz*M_xxyyzzzz) + 560.0d0*(D_xxxyyyzz*M_xxxyyyzz + &
      D_xxxyyzzz*M_xxxyyzzz + D_xxyyyzzz*M_xxyyyzzz) + 168.0d0*( &
      D_xxxxxyyz*M_xxxxxyyz + D_xxxxxyzz*M_xxxxxyzz + D_xxyyyyyz* &
      M_xxyyyyyz + D_xxyzzzzz*M_xxyzzzzz) + 280.0d0*(D_xxxxyyyz* &
      M_xxxxyyyz + D_xxxxyzzz*M_xxxxyzzz + D_xxxyyyyz*M_xxxyyyyz + &
      D_xxxyzzzz*M_xxxyzzzz) + 28.0d0*(D_xxxxxxyy*M_xxxxxxyy + &
      D_xxxxxxzz*M_xxxxxxzz + D_xxyyyyyy*M_xxyyyyyy + D_xxzzzzzz* &
      M_xxzzzzzz + D_yyyyyyzz*M_yyyyyyzz + D_yyzzzzzz*M_yyzzzzzz) + &
      56.0d0*(D_xxxxxxyz*M_xxxxxxyz + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxzzz*M_xxxxxzzz + D_xxxyyyyy*M_xxxyyyyy + D_xxxzzzzz* &
      M_xxxzzzzz + D_yyyyyzzz*M_yyyyyzzz + D_yyyzzzzz*M_yyyzzzzz)) + &
      D_0*M_0 + D_x*M_x + D_xx*v112 + D_xxx*v122 + D_xxxx*v143 + &
      D_xxxxx*v179 + D_xxxxxx*v247 + D_xxxxxxx*v357 + D_xxxxxxy*v358 + &
      D_xxxxxxz*v359 + D_xxxxxy*v248 + D_xxxxxyy*v360 + D_xxxxxyz*v361 &
      + D_xxxxxz*v249 + D_xxxxxzz*v362 + D_xxxxy*v180 + D_xxxxyy*v250 + &
      D_xxxxyyy*v363 + D_xxxxyyz*v364 + D_xxxxyz*v251 + D_xxxxyzz*v365 &
      + D_xxxxz*v181 + D_xxxxzz*v252 + D_xxxxzzz*v366 + D_xxxy*v144 + &
      D_xxxyy*v182 + D_xxxyyy*v253 + D_xxxyyyy*v367 + D_xxxyyyz*v368 + &
      D_xxxyyz*v254 + D_xxxyyzz*v369 + D_xxxyz*v183 + D_xxxyzz*v255 + &
      D_xxxyzzz*v370 + D_xxxz*v145 + D_xxxzz*v184 + D_xxxzzz*v256 + &
      D_xxxzzzz*v371 + D_xxy*v123 + D_xxyy*v146 + D_xxyyy*v185 + &
      D_xxyyyy*v257 + D_xxyyyyy*v372 + D_xxyyyyz*v373 + D_xxyyyz*v258 + &
      D_xxyyyzz*v374 + D_xxyyz*v186 + D_xxyyzz*v259 + D_xxyyzzz*v375 + &
      D_xxyz*v147 + D_xxyzz*v187 + D_xxyzzz*v260 + D_xxyzzzz*v376 + &
      D_xxz*v124 + D_xxzz*v148 + D_xxzzz*v188 + D_xxzzzz*v261 + &
      D_xxzzzzz*v377 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + &
      D_yy*v418 + D_yyy*v420 + D_yyyy*v425 + D_yyyyy*v433 + D_yyyyyy* &
      v444 + D_yyyyyyy*v458 + D_yyyyyyz*v459 + D_yyyyyz*v445 + &
      D_yyyyyzz*v460 + D_yyyyz*v434 + D_yyyyzz*v446 + D_yyyyzzz*v461 + &
      D_yyyz*v426 + D_yyyzz*v435 + D_yyyzzz*v447 + D_yyyzzzz*v462 + &
      D_yyz*v421 + D_yyzz*v427 + D_yyzzz*v436 + D_yyzzzz*v448 + &
      D_yyzzzzz*v463 + D_yz*M_yz + D_z*M_z + D_zz*v475 + D_zzz*v476 + &
      D_zzzz*v477 + D_zzzzz*v478 + D_zzzzzz*v479 + D_zzzzzzz*v480 + &
      M_xyy*v378 + M_xyyy*v379 + M_xyyyy*v380 + M_xyyyyy*v381 + &
      M_xyyyyyy*v382 + M_xyyyyyyy*v383 + M_xyyyyyyz*v384 + M_xyyyyyz* &
      v385 + M_xyyyyyzz*v386 + M_xyyyyz*v387 + M_xyyyyzz*v388 + &
      M_xyyyyzzz*v389 + M_xyyyz*v390 + M_xyyyzz*v391 + M_xyyyzzz*v392 + &
      M_xyyyzzzz*v393 + M_xyyz*v394 + M_xyyzz*v395 + M_xyyzzz*v396 + &
      M_xyyzzzz*v397 + M_xyyzzzzz*v398 + M_xyzz*v344 + M_xyzzz*v345 + &
      M_xyzzzz*v346 + M_xyzzzzz*v347 + M_xyzzzzzz*v348 + M_xzz*v399 + &
      M_xzzz*v400 + M_xzzzz*v401 + M_xzzzzz*v402 + M_xzzzzzz*v403 + &
      M_xzzzzzzz*v404 + M_yzz*v464 + M_yzzz*v465 + M_yzzzz*v466 + &
      M_yzzzzz*v467 + M_yzzzzzz*v468 + M_yzzzzzzz*v469
    L_z        = D_xxxxxxxz*v357 + D_xxxxxxyz*v358 + D_xxxxxxz*v247 + D_xxxxxxzz*v359 + &
      D_xxxxxyyz*v360 + D_xxxxxyz*v248 + D_xxxxxyzz*v361 + D_xxxxxz* &
      v179 + D_xxxxxzz*v249 + D_xxxxxzzz*v362 + D_xxxxyyyz*v363 + &
      D_xxxxyyz*v250 + D_xxxxyyzz*v364 + D_xxxxyz*v180 + D_xxxxyzz*v251 &
      + D_xxxxyzzz*v365 + D_xxxxz*v143 + D_xxxxzz*v181 + D_xxxxzzz*v252 &
      + D_xxxxzzzz*v366 + D_xxxyyyyz*v367 + D_xxxyyyz*v253 + D_xxxyyyzz &
      *v368 + D_xxxyyz*v182 + D_xxxyyzz*v254 + D_xxxyyzzz*v369 + &
      D_xxxyz*v144 + D_xxxyzz*v183 + D_xxxyzzz*v255 + D_xxxyzzzz*v370 + &
      D_xxxz*v122 + D_xxxzz*v145 + D_xxxzzz*v184 + D_xxxzzzz*v256 + &
      D_xxxzzzzz*v371 + D_xxyyyyyz*v372 + D_xxyyyyz*v257 + D_xxyyyyzz* &
      v373 + D_xxyyyz*v185 + D_xxyyyzz*v258 + D_xxyyyzzz*v374 + D_xxyyz &
      *v146 + D_xxyyzz*v186 + D_xxyyzzz*v259 + D_xxyyzzzz*v375 + D_xxyz &
      *v123 + D_xxyzz*v147 + D_xxyzzz*v187 + D_xxyzzzz*v260 + &
      D_xxyzzzzz*v376 + D_xxz*v112 + D_xxzz*v124 + D_xxzzz*v148 + &
      D_xxzzzz*v188 + D_xxzzzzz*v261 + D_xxzzzzzz*v377 + D_xyz*M_xy + &
      D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyyyyz*v458 + &
      D_yyyyyyz*v444 + D_yyyyyyzz*v459 + D_yyyyyz*v433 + D_yyyyyzz*v445 &
      + D_yyyyyzzz*v460 + D_yyyyz*v425 + D_yyyyzz*v434 + D_yyyyzzz*v446 &
      + D_yyyyzzzz*v461 + D_yyyz*v420 + D_yyyzz*v426 + D_yyyzzz*v435 + &
      D_yyyzzzz*v447 + D_yyyzzzzz*v462 + D_yyz*v418 + D_yyzz*v421 + &
      D_yyzzz*v427 + D_yyzzzz*v436 + D_yyzzzzz*v448 + D_yyzzzzzz*v463 + &
      D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v475 + D_zzzz* &
      v476 + D_zzzzz*v477 + D_zzzzzz*v478 + D_zzzzzzz*v479 + D_zzzzzzzz &
      *v480 + M_xyy*v394 + M_xyyy*v390 + M_xyyyy*v387 + M_xyyyyy*v385 + &
      M_xyyyyyy*v384 + M_xyyyyyz*v405 + M_xyyyyz*v406 + M_xyyyyzz*v407 &
      + M_xyyyz*v408 + M_xyyyzz*v342 + M_xyyyzzz*v409 + M_xyyz*v320 + &
      M_xyyzz*v410 + M_xyyzzz*v411 + M_xyyzzzz*v412 + M_xyzz*v353 + &
      M_xyzzz*v354 + M_xyzzzz*v355 + M_xyzzzzz*v356 + M_xzz*v413 + &
      M_xzzz*v414 + M_xzzzz*v415 + M_xzzzzz*v416 + M_xzzzzzz*v417 + &
      M_yzz*v470 + M_yzzz*v471 + M_yzzzz*v472 + M_yzzzzz*v473 + &
      M_yzzzzzz*v474
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
#undef  M_xxy               
#undef  L_xxy               
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
#undef  M_xxxxx             
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  L_xxyyy             
#undef  M_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  M_xyyyy             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  L_yyyyy             
#undef  M_yyyyy             
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
#undef  L_xxyyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  M_xyyyyy            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  M_yyyyyy            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  M_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  M_xxxxxxz           
#undef  L_xxxxxyy           
#undef  M_xxxxxyy           
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
#undef  L_xxyyyyz           
#undef  M_xxyyyyz           
#undef  M_xyyyyyy           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  M_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_yyyyyyz           
#undef  M_xxxxxxxx          
#undef  L_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  L_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  L_xxxxxxyz          
#undef  M_xxxxxyyy          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  L_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  L_xxxxyyyz          
#undef  M_xxxyyyyy          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  M_xxxyyyyz          
#undef  M_xxyyyyyy          
#undef  L_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
#undef  L_yyyyyyyz          
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
