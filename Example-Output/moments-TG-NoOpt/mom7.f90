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
        
    
! OPS  112*DIV + 252*MUL + 168*POW = 532  (571 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u
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
    M_0       = W
    M_x       = W*x
    M_y       = W*y
    M_z       = W*z
    M_xx      = (1.0d0/2.0d0)*W*x**2
    M_xy      = W*x*y
    M_xz      = W*x*z
    M_yy      = (1.0d0/2.0d0)*W*y**2
    M_yz      = W*y*z
    M_zz      = (1.0d0/2.0d0)*W*z**2
    M_xxx     = (1.0d0/6.0d0)*W*x**3
    M_xxy     = (1.0d0/2.0d0)*W*x**2*y
    M_xxz     = (1.0d0/2.0d0)*W*x**2*z
    M_xyy     = (1.0d0/2.0d0)*W*x*y**2
    M_xyz     = W*x*y*z
    M_xzz     = (1.0d0/2.0d0)*W*x*z**2
    M_yyy     = (1.0d0/6.0d0)*W*y**3
    M_yyz     = (1.0d0/2.0d0)*W*y**2*z
    M_yzz     = (1.0d0/2.0d0)*W*y*z**2
    M_zzz     = (1.0d0/6.0d0)*W*z**3
    M_xxxx    = (1.0d0/24.0d0)*W*x**4
    M_xxxy    = (1.0d0/6.0d0)*W*x**3*y
    M_xxxz    = (1.0d0/6.0d0)*W*x**3*z
    M_xxyy    = (1.0d0/4.0d0)*W*x**2*y**2
    M_xxyz    = (1.0d0/2.0d0)*W*x**2*y*z
    M_xxzz    = (1.0d0/4.0d0)*W*x**2*z**2
    M_xyyy    = (1.0d0/6.0d0)*W*x*y**3
    M_xyyz    = (1.0d0/2.0d0)*W*x*y**2*z
    M_xyzz    = (1.0d0/2.0d0)*W*x*y*z**2
    M_xzzz    = (1.0d0/6.0d0)*W*x*z**3
    M_yyyy    = (1.0d0/24.0d0)*W*y**4
    M_yyyz    = (1.0d0/6.0d0)*W*y**3*z
    M_yyzz    = (1.0d0/4.0d0)*W*y**2*z**2
    M_yzzz    = (1.0d0/6.0d0)*W*y*z**3
    M_zzzz    = (1.0d0/24.0d0)*W*z**4
    M_xxxxx   = (1.0d0/120.0d0)*W*x**5
    M_xxxxy   = (1.0d0/24.0d0)*W*x**4*y
    M_xxxxz   = (1.0d0/24.0d0)*W*x**4*z
    M_xxxyy   = (1.0d0/12.0d0)*W*x**3*y**2
    M_xxxyz   = (1.0d0/6.0d0)*W*x**3*y*z
    M_xxxzz   = (1.0d0/12.0d0)*W*x**3*z**2
    M_xxyyy   = (1.0d0/12.0d0)*W*x**2*y**3
    M_xxyyz   = (1.0d0/4.0d0)*W*x**2*y**2*z
    M_xxyzz   = (1.0d0/4.0d0)*W*x**2*y*z**2
    M_xxzzz   = (1.0d0/12.0d0)*W*x**2*z**3
    M_xyyyy   = (1.0d0/24.0d0)*W*x*y**4
    M_xyyyz   = (1.0d0/6.0d0)*W*x*y**3*z
    M_xyyzz   = (1.0d0/4.0d0)*W*x*y**2*z**2
    M_xyzzz   = (1.0d0/6.0d0)*W*x*y*z**3
    M_xzzzz   = (1.0d0/24.0d0)*W*x*z**4
    M_yyyyy   = (1.0d0/120.0d0)*W*y**5
    M_yyyyz   = (1.0d0/24.0d0)*W*y**4*z
    M_yyyzz   = (1.0d0/12.0d0)*W*y**3*z**2
    M_yyzzz   = (1.0d0/12.0d0)*W*y**2*z**3
    M_yzzzz   = (1.0d0/24.0d0)*W*y*z**4
    M_zzzzz   = (1.0d0/120.0d0)*W*z**5
    M_xxxxxx  = (1.0d0/720.0d0)*W*x**6
    M_xxxxxy  = (1.0d0/120.0d0)*W*x**5*y
    M_xxxxxz  = (1.0d0/120.0d0)*W*x**5*z
    M_xxxxyy  = (1.0d0/48.0d0)*W*x**4*y**2
    M_xxxxyz  = (1.0d0/24.0d0)*W*x**4*y*z
    M_xxxxzz  = (1.0d0/48.0d0)*W*x**4*z**2
    M_xxxyyy  = (1.0d0/36.0d0)*W*x**3*y**3
    M_xxxyyz  = (1.0d0/12.0d0)*W*x**3*y**2*z
    M_xxxyzz  = (1.0d0/12.0d0)*W*x**3*y*z**2
    M_xxxzzz  = (1.0d0/36.0d0)*W*x**3*z**3
    M_xxyyyy  = (1.0d0/48.0d0)*W*x**2*y**4
    M_xxyyyz  = (1.0d0/12.0d0)*W*x**2*y**3*z
    M_xxyyzz  = (1.0d0/8.0d0)*W*x**2*y**2*z**2
    M_xxyzzz  = (1.0d0/12.0d0)*W*x**2*y*z**3
    M_xxzzzz  = (1.0d0/48.0d0)*W*x**2*z**4
    M_xyyyyy  = (1.0d0/120.0d0)*W*x*y**5
    M_xyyyyz  = (1.0d0/24.0d0)*W*x*y**4*z
    M_xyyyzz  = (1.0d0/12.0d0)*W*x*y**3*z**2
    M_xyyzzz  = (1.0d0/12.0d0)*W*x*y**2*z**3
    M_xyzzzz  = (1.0d0/24.0d0)*W*x*y*z**4
    M_xzzzzz  = (1.0d0/120.0d0)*W*x*z**5
    M_yyyyyy  = (1.0d0/720.0d0)*W*y**6
    M_yyyyyz  = (1.0d0/120.0d0)*W*y**5*z
    M_yyyyzz  = (1.0d0/48.0d0)*W*y**4*z**2
    M_yyyzzz  = (1.0d0/36.0d0)*W*y**3*z**3
    M_yyzzzz  = (1.0d0/48.0d0)*W*y**2*z**4
    M_yzzzzz  = (1.0d0/120.0d0)*W*y*z**5
    M_zzzzzz  = (1.0d0/720.0d0)*W*z**6
    M_xxxxxxx = (1.0d0/5040.0d0)*W*x**7
    M_xxxxxxy = (1.0d0/720.0d0)*W*x**6*y
    M_xxxxxxz = (1.0d0/720.0d0)*W*x**6*z
    M_xxxxxyy = (1.0d0/240.0d0)*W*x**5*y**2
    M_xxxxxyz = (1.0d0/120.0d0)*W*x**5*y*z
    M_xxxxxzz = (1.0d0/240.0d0)*W*x**5*z**2
    M_xxxxyyy = (1.0d0/144.0d0)*W*x**4*y**3
    M_xxxxyyz = (1.0d0/48.0d0)*W*x**4*y**2*z
    M_xxxxyzz = (1.0d0/48.0d0)*W*x**4*y*z**2
    M_xxxxzzz = (1.0d0/144.0d0)*W*x**4*z**3
    M_xxxyyyy = (1.0d0/144.0d0)*W*x**3*y**4
    M_xxxyyyz = (1.0d0/36.0d0)*W*x**3*y**3*z
    M_xxxyyzz = (1.0d0/24.0d0)*W*x**3*y**2*z**2
    M_xxxyzzz = (1.0d0/36.0d0)*W*x**3*y*z**3
    M_xxxzzzz = (1.0d0/144.0d0)*W*x**3*z**4
    M_xxyyyyy = (1.0d0/240.0d0)*W*x**2*y**5
    M_xxyyyyz = (1.0d0/48.0d0)*W*x**2*y**4*z
    M_xxyyyzz = (1.0d0/24.0d0)*W*x**2*y**3*z**2
    M_xxyyzzz = (1.0d0/24.0d0)*W*x**2*y**2*z**3
    M_xxyzzzz = (1.0d0/48.0d0)*W*x**2*y*z**4
    M_xxzzzzz = (1.0d0/240.0d0)*W*x**2*z**5
    M_xyyyyyy = (1.0d0/720.0d0)*W*x*y**6
    M_xyyyyyz = (1.0d0/120.0d0)*W*x*y**5*z
    M_xyyyyzz = (1.0d0/48.0d0)*W*x*y**4*z**2
    M_xyyyzzz = (1.0d0/36.0d0)*W*x*y**3*z**3
    M_xyyzzzz = (1.0d0/48.0d0)*W*x*y**2*z**4
    M_xyzzzzz = (1.0d0/120.0d0)*W*x*y*z**5
    M_xzzzzzz = (1.0d0/720.0d0)*W*x*z**6
    M_yyyyyyy = (1.0d0/5040.0d0)*W*y**7
    M_yyyyyyz = (1.0d0/720.0d0)*W*y**6*z
    M_yyyyyzz = (1.0d0/240.0d0)*W*y**5*z**2
    M_yyyyzzz = (1.0d0/144.0d0)*W*y**4*z**3
    M_yyyzzzz = (1.0d0/144.0d0)*W*y**3*z**4
    M_yyzzzzz = (1.0d0/240.0d0)*W*y**2*z**5
    M_yzzzzzz = (1.0d0/720.0d0)*W*y*z**6
    M_zzzzzzz = (1.0d0/5040.0d0)*W*z**7
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
    
! OPS  1596*ADD + 462*DIV + 2772*MUL + 1386*POW = 6216  (6934 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u
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
    Ms_0       = M_0
    Ms_x       = M_0*x + M_x
    Ms_y       = M_0*y + M_y
    Ms_z       = M_0*z + M_z
    Ms_xx      = (1.0d0/2.0d0)*M_0*x**2 + M_x*x + M_xx
    Ms_xy      = M_0*x*y + M_x*y + M_xy + M_y*x
    Ms_xz      = M_0*x*z + M_x*z + M_xz + M_z*x
    Ms_yy      = (1.0d0/2.0d0)*M_0*y**2 + M_y*y + M_yy
    Ms_yz      = M_0*y*z + M_y*z + M_yz + M_z*y
    Ms_zz      = (1.0d0/2.0d0)*M_0*z**2 + M_z*z + M_zz
    Ms_xxx     = (1.0d0/6.0d0)*M_0*x**3 + (1.0d0/2.0d0)*M_x*x**2 + M_xx*x + M_xxx
    Ms_xxy     = M_x*x*y + M_xx*y + M_xxy + M_xy*x + (1.0d0/2.0d0)*(M_0*x**2*y + M_y*x**2 &
      )
    Ms_xxz     = M_x*x*z + M_xx*z + M_xxz + M_xz*x + (1.0d0/2.0d0)*(M_0*x**2*z + M_z*x**2 &
      )
    Ms_xyy     = M_xy*y + M_xyy + M_y*x*y + M_yy*x + (1.0d0/2.0d0)*(M_0*x*y**2 + M_x*y**2 &
      )
    Ms_xyz     = M_0*x*y*z + M_x*y*z + M_xy*z + M_xyz + M_xz*y + M_y*x*z + M_yz*x + M_z*x &
      *y
    Ms_xzz     = M_xz*z + M_xzz + M_z*x*z + M_zz*x + (1.0d0/2.0d0)*(M_0*x*z**2 + M_x*z**2 &
      )
    Ms_yyy     = (1.0d0/6.0d0)*M_0*y**3 + (1.0d0/2.0d0)*M_y*y**2 + M_yy*y + M_yyy
    Ms_yyz     = M_y*y*z + M_yy*z + M_yyz + M_yz*y + (1.0d0/2.0d0)*(M_0*y**2*z + M_z*y**2 &
      )
    Ms_yzz     = M_yz*z + M_yzz + M_z*y*z + M_zz*y + (1.0d0/2.0d0)*(M_0*y*z**2 + M_y*z**2 &
      )
    Ms_zzz     = (1.0d0/6.0d0)*M_0*z**3 + (1.0d0/2.0d0)*M_z*z**2 + M_zz*z + M_zzz
    Ms_xxxx    = (1.0d0/24.0d0)*M_0*x**4 + (1.0d0/6.0d0)*M_x*x**3 + (1.0d0/2.0d0)*M_xx*x &
      **2 + M_xxx*x + M_xxxx
    Ms_xxxy    = M_xx*x*y + M_xxx*y + M_xxxy + M_xxy*x + (1.0d0/6.0d0)*(M_0*x**3*y + M_y* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*y + M_xy*x**2)
    Ms_xxxz    = M_xx*x*z + M_xxx*z + M_xxxz + M_xxz*x + (1.0d0/6.0d0)*(M_0*x**3*z + M_z* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*z + M_xz*x**2)
    Ms_xxyy    = (1.0d0/4.0d0)*M_0*x**2*y**2 + M_xxy*y + M_xxyy + M_xy*x*y + M_xyy*x + ( &
      1.0d0/2.0d0)*(M_x*x*y**2 + M_xx*y**2 + M_y*x**2*y + M_yy*x**2)
    Ms_xxyz    = M_x*x*y*z + M_xx*y*z + M_xxy*z + M_xxyz + M_xxz*y + M_xy*x*z + M_xyz*x + &
      M_xz*x*y + (1.0d0/2.0d0)*(M_0*x**2*y*z + M_y*x**2*z + M_yz*x**2 + &
      M_z*x**2*y)
    Ms_xxzz    = (1.0d0/4.0d0)*M_0*x**2*z**2 + M_xxz*z + M_xxzz + M_xz*x*z + M_xzz*x + ( &
      1.0d0/2.0d0)*(M_x*x*z**2 + M_xx*z**2 + M_z*x**2*z + M_zz*x**2)
    Ms_xyyy    = M_xyy*y + M_xyyy + M_yy*x*y + M_yyy*x + (1.0d0/2.0d0)*(M_xy*y**2 + M_y*x &
      *y**2) + (1.0d0/6.0d0)*(M_0*x*y**3 + M_x*y**3)
    Ms_xyyz    = M_xy*y*z + M_xyy*z + M_xyyz + M_xyz*y + M_y*x*y*z + M_yy*x*z + M_yyz*x + &
      M_yz*x*y + (1.0d0/2.0d0)*(M_0*x*y**2*z + M_x*y**2*z + M_xz*y**2 + &
      M_z*x*y**2)
    Ms_xyzz    = M_xyz*z + M_xyzz + M_xz*y*z + M_xzz*y + M_yz*x*z + M_yzz*x + M_z*x*y*z + &
      M_zz*x*y + (1.0d0/2.0d0)*(M_0*x*y*z**2 + M_x*y*z**2 + M_xy*z**2 + &
      M_y*x*z**2)
    Ms_xzzz    = M_xzz*z + M_xzzz + M_zz*x*z + M_zzz*x + (1.0d0/2.0d0)*(M_xz*z**2 + M_z*x &
      *z**2) + (1.0d0/6.0d0)*(M_0*x*z**3 + M_x*z**3)
    Ms_yyyy    = (1.0d0/24.0d0)*M_0*y**4 + (1.0d0/6.0d0)*M_y*y**3 + (1.0d0/2.0d0)*M_yy*y &
      **2 + M_yyy*y + M_yyyy
    Ms_yyyz    = M_yy*y*z + M_yyy*z + M_yyyz + M_yyz*y + (1.0d0/6.0d0)*(M_0*y**3*z + M_z* &
      y**3) + (1.0d0/2.0d0)*(M_y*y**2*z + M_yz*y**2)
    Ms_yyzz    = (1.0d0/4.0d0)*M_0*y**2*z**2 + M_yyz*z + M_yyzz + M_yz*y*z + M_yzz*y + ( &
      1.0d0/2.0d0)*(M_y*y*z**2 + M_yy*z**2 + M_z*y**2*z + M_zz*y**2)
    Ms_yzzz    = M_yzz*z + M_yzzz + M_zz*y*z + M_zzz*y + (1.0d0/2.0d0)*(M_yz*z**2 + M_z*y &
      *z**2) + (1.0d0/6.0d0)*(M_0*y*z**3 + M_y*z**3)
    Ms_zzzz    = (1.0d0/24.0d0)*M_0*z**4 + (1.0d0/6.0d0)*M_z*z**3 + (1.0d0/2.0d0)*M_zz*z &
      **2 + M_zzz*z + M_zzzz
    Ms_xxxxx   = (1.0d0/120.0d0)*M_0*x**5 + (1.0d0/24.0d0)*M_x*x**4 + (1.0d0/6.0d0)*M_xx* &
      x**3 + (1.0d0/2.0d0)*M_xxx*x**2 + M_xxxx*x + M_xxxxx
    Ms_xxxxy   = M_xxx*x*y + M_xxxx*y + M_xxxxy + M_xxxy*x + (1.0d0/24.0d0)*(M_0*x**4*y + &
      M_y*x**4) + (1.0d0/6.0d0)*(M_x*x**3*y + M_xy*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*y + M_xxy*x**2)
    Ms_xxxxz   = M_xxx*x*z + M_xxxx*z + M_xxxxz + M_xxxz*x + (1.0d0/24.0d0)*(M_0*x**4*z + &
      M_z*x**4) + (1.0d0/6.0d0)*(M_x*x**3*z + M_xz*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*z + M_xxz*x**2)
    Ms_xxxyy   = (1.0d0/12.0d0)*M_0*x**3*y**2 + (1.0d0/4.0d0)*M_x*x**2*y**2 + M_xxxy*y + &
      M_xxxyy + M_xxy*x*y + M_xxyy*x + (1.0d0/6.0d0)*(M_y*x**3*y + M_yy &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*y**2 + M_xxx*y**2 + M_xy*x**2*y + &
      M_xyy*x**2)
    Ms_xxxyz   = M_xx*x*y*z + M_xxx*y*z + M_xxxy*z + M_xxxyz + M_xxxz*y + M_xxy*x*z + &
      M_xxyz*x + M_xxz*x*y + (1.0d0/6.0d0)*(M_0*x**3*y*z + M_y*x**3*z + &
      M_yz*x**3 + M_z*x**3*y) + (1.0d0/2.0d0)*(M_x*x**2*y*z + M_xy*x**2 &
      *z + M_xyz*x**2 + M_xz*x**2*y)
    Ms_xxxzz   = (1.0d0/12.0d0)*M_0*x**3*z**2 + (1.0d0/4.0d0)*M_x*x**2*z**2 + M_xxxz*z + &
      M_xxxzz + M_xxz*x*z + M_xxzz*x + (1.0d0/6.0d0)*(M_z*x**3*z + M_zz &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*z**2 + M_xxx*z**2 + M_xz*x**2*z + &
      M_xzz*x**2)
    Ms_xxyyy   = (1.0d0/12.0d0)*M_0*x**2*y**3 + M_xxyy*y + M_xxyyy + M_xyy*x*y + M_xyyy*x &
      + (1.0d0/4.0d0)*M_y*x**2*y**2 + (1.0d0/6.0d0)*(M_x*x*y**3 + M_xx* &
      y**3) + (1.0d0/2.0d0)*(M_xxy*y**2 + M_xy*x*y**2 + M_yy*x**2*y + &
      M_yyy*x**2)
    Ms_xxyyz   = M_xxy*y*z + M_xxyy*z + M_xxyyz + M_xxyz*y + M_xy*x*y*z + M_xyy*x*z + &
      M_xyyz*x + M_xyz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y**2*z + M_z*x**2* &
      y**2) + (1.0d0/2.0d0)*(M_x*x*y**2*z + M_xx*y**2*z + M_xxz*y**2 + &
      M_xz*x*y**2 + M_y*x**2*y*z + M_yy*x**2*z + M_yyz*x**2 + M_yz*x**2 &
      *y)
    Ms_xxyzz   = M_xxyz*z + M_xxyzz + M_xxz*y*z + M_xxzz*y + M_xyz*x*z + M_xyzz*x + M_xz* &
      x*y*z + M_xzz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y*z**2 + M_y*x**2*z** &
      2) + (1.0d0/2.0d0)*(M_x*x*y*z**2 + M_xx*y*z**2 + M_xxy*z**2 + &
      M_xy*x*z**2 + M_yz*x**2*z + M_yzz*x**2 + M_z*x**2*y*z + M_zz*x**2 &
      *y)
    Ms_xxzzz   = (1.0d0/12.0d0)*M_0*x**2*z**3 + M_xxzz*z + M_xxzzz + M_xzz*x*z + M_xzzz*x &
      + (1.0d0/4.0d0)*M_z*x**2*z**2 + (1.0d0/6.0d0)*(M_x*x*z**3 + M_xx* &
      z**3) + (1.0d0/2.0d0)*(M_xxz*z**2 + M_xz*x*z**2 + M_zz*x**2*z + &
      M_zzz*x**2)
    Ms_xyyyy   = M_xyyy*y + M_xyyyy + M_yyy*x*y + M_yyyy*x + (1.0d0/6.0d0)*(M_xy*y**3 + &
      M_y*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2 + M_yy*x*y**2) + (1.0d0/ &
      24.0d0)*(M_0*x*y**4 + M_x*y**4)
    Ms_xyyyz   = M_xyy*y*z + M_xyyy*z + M_xyyyz + M_xyyz*y + M_yy*x*y*z + M_yyy*x*z + &
      M_yyyz*x + M_yyz*x*y + (1.0d0/2.0d0)*(M_xy*y**2*z + M_xyz*y**2 + &
      M_y*x*y**2*z + M_yz*x*y**2) + (1.0d0/6.0d0)*(M_0*x*y**3*z + M_x*y &
      **3*z + M_xz*y**3 + M_z*x*y**3)
    Ms_xyyzz   = M_xyyz*z + M_xyyzz + M_xyz*y*z + M_xyzz*y + M_yyz*x*z + M_yyzz*x + M_yz* &
      x*y*z + M_yzz*x*y + (1.0d0/4.0d0)*(M_0*x*y**2*z**2 + M_x*y**2*z** &
      2) + (1.0d0/2.0d0)*(M_xy*y*z**2 + M_xyy*z**2 + M_xz*y**2*z + &
      M_xzz*y**2 + M_y*x*y*z**2 + M_yy*x*z**2 + M_z*x*y**2*z + M_zz*x*y &
      **2)
    Ms_xyzzz   = M_xyzz*z + M_xyzzz + M_xzz*y*z + M_xzzz*y + M_yzz*x*z + M_yzzz*x + M_zz* &
      x*y*z + M_zzz*x*y + (1.0d0/2.0d0)*(M_xyz*z**2 + M_xz*y*z**2 + &
      M_yz*x*z**2 + M_z*x*y*z**2) + (1.0d0/6.0d0)*(M_0*x*y*z**3 + M_x*y &
      *z**3 + M_xy*z**3 + M_y*x*z**3)
    Ms_xzzzz   = M_xzzz*z + M_xzzzz + M_zzz*x*z + M_zzzz*x + (1.0d0/6.0d0)*(M_xz*z**3 + &
      M_z*x*z**3) + (1.0d0/2.0d0)*(M_xzz*z**2 + M_zz*x*z**2) + (1.0d0/ &
      24.0d0)*(M_0*x*z**4 + M_x*z**4)
    Ms_yyyyy   = (1.0d0/120.0d0)*M_0*y**5 + (1.0d0/24.0d0)*M_y*y**4 + (1.0d0/6.0d0)*M_yy* &
      y**3 + (1.0d0/2.0d0)*M_yyy*y**2 + M_yyyy*y + M_yyyyy
    Ms_yyyyz   = M_yyy*y*z + M_yyyy*z + M_yyyyz + M_yyyz*y + (1.0d0/24.0d0)*(M_0*y**4*z + &
      M_z*y**4) + (1.0d0/6.0d0)*(M_y*y**3*z + M_yz*y**3) + (1.0d0/2.0d0 &
      )*(M_yy*y**2*z + M_yyz*y**2)
    Ms_yyyzz   = (1.0d0/12.0d0)*M_0*y**3*z**2 + (1.0d0/4.0d0)*M_y*y**2*z**2 + M_yyyz*z + &
      M_yyyzz + M_yyz*y*z + M_yyzz*y + (1.0d0/6.0d0)*(M_z*y**3*z + M_zz &
      *y**3) + (1.0d0/2.0d0)*(M_yy*y*z**2 + M_yyy*z**2 + M_yz*y**2*z + &
      M_yzz*y**2)
    Ms_yyzzz   = (1.0d0/12.0d0)*M_0*y**2*z**3 + M_yyzz*z + M_yyzzz + M_yzz*y*z + M_yzzz*y &
      + (1.0d0/4.0d0)*M_z*y**2*z**2 + (1.0d0/6.0d0)*(M_y*y*z**3 + M_yy* &
      z**3) + (1.0d0/2.0d0)*(M_yyz*z**2 + M_yz*y*z**2 + M_zz*y**2*z + &
      M_zzz*y**2)
    Ms_yzzzz   = M_yzzz*z + M_yzzzz + M_zzz*y*z + M_zzzz*y + (1.0d0/6.0d0)*(M_yz*z**3 + &
      M_z*y*z**3) + (1.0d0/2.0d0)*(M_yzz*z**2 + M_zz*y*z**2) + (1.0d0/ &
      24.0d0)*(M_0*y*z**4 + M_y*z**4)
    Ms_zzzzz   = (1.0d0/120.0d0)*M_0*z**5 + (1.0d0/24.0d0)*M_z*z**4 + (1.0d0/6.0d0)*M_zz* &
      z**3 + (1.0d0/2.0d0)*M_zzz*z**2 + M_zzzz*z + M_zzzzz
    Ms_xxxxxx  = (1.0d0/720.0d0)*M_0*x**6 + (1.0d0/120.0d0)*M_x*x**5 + (1.0d0/24.0d0)* &
      M_xx*x**4 + (1.0d0/6.0d0)*M_xxx*x**3 + (1.0d0/2.0d0)*M_xxxx*x**2 &
      + M_xxxxx*x + M_xxxxxx
    Ms_xxxxxy  = M_xxxx*x*y + M_xxxxx*y + M_xxxxxy + M_xxxxy*x + (1.0d0/120.0d0)*(M_0*x** &
      5*y + M_y*x**5) + (1.0d0/24.0d0)*(M_x*x**4*y + M_xy*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*y + M_xxy*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*y + M_xxxy*x**2)
    Ms_xxxxxz  = M_xxxx*x*z + M_xxxxx*z + M_xxxxxz + M_xxxxz*x + (1.0d0/120.0d0)*(M_0*x** &
      5*z + M_z*x**5) + (1.0d0/24.0d0)*(M_x*x**4*z + M_xz*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*z + M_xxz*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*z + M_xxxz*x**2)
    Ms_xxxxyy  = (1.0d0/48.0d0)*M_0*x**4*y**2 + (1.0d0/12.0d0)*M_x*x**3*y**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*y**2 + M_xxxxy*y + M_xxxxyy + M_xxxy*x*y + &
      M_xxxyy*x + (1.0d0/6.0d0)*(M_xy*x**3*y + M_xyy*x**3) + (1.0d0/ &
      24.0d0)*(M_y*x**4*y + M_yy*x**4) + (1.0d0/2.0d0)*(M_xxx*x*y**2 + &
      M_xxxx*y**2 + M_xxy*x**2*y + M_xxyy*x**2)
    Ms_xxxxyz  = M_xxx*x*y*z + M_xxxx*y*z + M_xxxxy*z + M_xxxxyz + M_xxxxz*y + M_xxxy*x*z &
      + M_xxxyz*x + M_xxxz*x*y + (1.0d0/24.0d0)*(M_0*x**4*y*z + M_y*x** &
      4*z + M_yz*x**4 + M_z*x**4*y) + (1.0d0/6.0d0)*(M_x*x**3*y*z + &
      M_xy*x**3*z + M_xyz*x**3 + M_xz*x**3*y) + (1.0d0/2.0d0)*(M_xx*x** &
      2*y*z + M_xxy*x**2*z + M_xxyz*x**2 + M_xxz*x**2*y)
    Ms_xxxxzz  = (1.0d0/48.0d0)*M_0*x**4*z**2 + (1.0d0/12.0d0)*M_x*x**3*z**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*z**2 + M_xxxxz*z + M_xxxxzz + M_xxxz*x*z + &
      M_xxxzz*x + (1.0d0/6.0d0)*(M_xz*x**3*z + M_xzz*x**3) + (1.0d0/ &
      24.0d0)*(M_z*x**4*z + M_zz*x**4) + (1.0d0/2.0d0)*(M_xxx*x*z**2 + &
      M_xxxx*z**2 + M_xxz*x**2*z + M_xxzz*x**2)
    Ms_xxxyyy  = (1.0d0/36.0d0)*M_0*x**3*y**3 + M_xxxyy*y + M_xxxyyy + M_xxyy*x*y + &
      M_xxyyy*x + (1.0d0/4.0d0)*M_xy*x**2*y**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*y**3 + M_y*x**3*y**2) + (1.0d0/2.0d0)*(M_xxxy*y**2 + M_xxy*x* &
      y**2 + M_xyy*x**2*y + M_xyyy*x**2) + (1.0d0/6.0d0)*(M_xx*x*y**3 + &
      M_xxx*y**3 + M_yy*x**3*y + M_yyy*x**3)
    Ms_xxxyyz  = M_xxxy*y*z + M_xxxyy*z + M_xxxyyz + M_xxxyz*y + M_xxy*x*y*z + M_xxyy*x*z &
      + M_xxyyz*x + M_xxyz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y**2*z + M_z* &
      x**3*y**2) + (1.0d0/4.0d0)*(M_x*x**2*y**2*z + M_xz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_y*x**3*y*z + M_yy*x**3*z + M_yyz*x**3 + M_yz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y**2*z + M_xxx*y**2*z + M_xxxz*y**2 + &
      M_xxz*x*y**2 + M_xy*x**2*y*z + M_xyy*x**2*z + M_xyyz*x**2 + M_xyz &
      *x**2*y)
    Ms_xxxyzz  = M_xxxyz*z + M_xxxyzz + M_xxxz*y*z + M_xxxzz*y + M_xxyz*x*z + M_xxyzz*x + &
      M_xxz*x*y*z + M_xxzz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y*z**2 + M_y* &
      x**3*z**2) + (1.0d0/4.0d0)*(M_x*x**2*y*z**2 + M_xy*x**2*z**2) + ( &
      1.0d0/6.0d0)*(M_yz*x**3*z + M_yzz*x**3 + M_z*x**3*y*z + M_zz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y*z**2 + M_xxx*y*z**2 + M_xxxy*z**2 + &
      M_xxy*x*z**2 + M_xyz*x**2*z + M_xyzz*x**2 + M_xz*x**2*y*z + M_xzz &
      *x**2*y)
    Ms_xxxzzz  = (1.0d0/36.0d0)*M_0*x**3*z**3 + M_xxxzz*z + M_xxxzzz + M_xxzz*x*z + &
      M_xxzzz*x + (1.0d0/4.0d0)*M_xz*x**2*z**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*z**3 + M_z*x**3*z**2) + (1.0d0/2.0d0)*(M_xxxz*z**2 + M_xxz*x* &
      z**2 + M_xzz*x**2*z + M_xzzz*x**2) + (1.0d0/6.0d0)*(M_xx*x*z**3 + &
      M_xxx*z**3 + M_zz*x**3*z + M_zzz*x**3)
    Ms_xxyyyy  = (1.0d0/48.0d0)*M_0*x**2*y**4 + M_xxyyy*y + M_xxyyyy + M_xyyy*x*y + &
      M_xyyyy*x + (1.0d0/12.0d0)*M_y*x**2*y**3 + (1.0d0/4.0d0)*M_yy*x** &
      2*y**2 + (1.0d0/6.0d0)*(M_xxy*y**3 + M_xy*x*y**3) + (1.0d0/24.0d0 &
      )*(M_x*x*y**4 + M_xx*y**4) + (1.0d0/2.0d0)*(M_xxyy*y**2 + M_xyy*x &
      *y**2 + M_yyy*x**2*y + M_yyyy*x**2)
    Ms_xxyyyz  = M_xxyy*y*z + M_xxyyy*z + M_xxyyyz + M_xxyyz*y + M_xyy*x*y*z + M_xyyy*x*z &
      + M_xyyyz*x + M_xyyz*x*y + (1.0d0/12.0d0)*(M_0*x**2*y**3*z + M_z* &
      x**2*y**3) + (1.0d0/4.0d0)*(M_y*x**2*y**2*z + M_yz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_x*x*y**3*z + M_xx*y**3*z + M_xxz*y**3 + M_xz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xxy*y**2*z + M_xxyz*y**2 + M_xy*x*y**2*z &
      + M_xyz*x*y**2 + M_yy*x**2*y*z + M_yyy*x**2*z + M_yyyz*x**2 + &
      M_yyz*x**2*y)
    Ms_xxyyzz  = (1.0d0/8.0d0)*M_0*x**2*y**2*z**2 + M_xxyyz*z + M_xxyyzz + M_xxyz*y*z + &
      M_xxyzz*y + M_xyyz*x*z + M_xyyzz*x + M_xyz*x*y*z + M_xyzz*x*y + ( &
      1.0d0/4.0d0)*(M_x*x*y**2*z**2 + M_xx*y**2*z**2 + M_y*x**2*y*z**2 &
      + M_yy*x**2*z**2 + M_z*x**2*y**2*z + M_zz*x**2*y**2) + (1.0d0/ &
      2.0d0)*(M_xxy*y*z**2 + M_xxyy*z**2 + M_xxz*y**2*z + M_xxzz*y**2 + &
      M_xy*x*y*z**2 + M_xyy*x*z**2 + M_xz*x*y**2*z + M_xzz*x*y**2 + &
      M_yyz*x**2*z + M_yyzz*x**2 + M_yz*x**2*y*z + M_yzz*x**2*y)
    Ms_xxyzzz  = M_xxyzz*z + M_xxyzzz + M_xxzz*y*z + M_xxzzz*y + M_xyzz*x*z + M_xyzzz*x + &
      M_xzz*x*y*z + M_xzzz*x*y + (1.0d0/4.0d0)*(M_yz*x**2*z**2 + M_z*x &
      **2*y*z**2) + (1.0d0/12.0d0)*(M_0*x**2*y*z**3 + M_y*x**2*z**3) + &
      (1.0d0/6.0d0)*(M_x*x*y*z**3 + M_xx*y*z**3 + M_xxy*z**3 + M_xy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xxyz*z**2 + M_xxz*y*z**2 + M_xyz*x*z**2 + &
      M_xz*x*y*z**2 + M_yzz*x**2*z + M_yzzz*x**2 + M_zz*x**2*y*z + &
      M_zzz*x**2*y)
    Ms_xxzzzz  = (1.0d0/48.0d0)*M_0*x**2*z**4 + M_xxzzz*z + M_xxzzzz + M_xzzz*x*z + &
      M_xzzzz*x + (1.0d0/12.0d0)*M_z*x**2*z**3 + (1.0d0/4.0d0)*M_zz*x** &
      2*z**2 + (1.0d0/6.0d0)*(M_xxz*z**3 + M_xz*x*z**3) + (1.0d0/24.0d0 &
      )*(M_x*x*z**4 + M_xx*z**4) + (1.0d0/2.0d0)*(M_xxzz*z**2 + M_xzz*x &
      *z**2 + M_zzz*x**2*z + M_zzzz*x**2)
    Ms_xyyyyy  = M_xyyyy*y + M_xyyyyy + M_yyyy*x*y + M_yyyyy*x + (1.0d0/24.0d0)*(M_xy*y** &
      4 + M_y*x*y**4) + (1.0d0/6.0d0)*(M_xyy*y**3 + M_yy*x*y**3) + ( &
      1.0d0/2.0d0)*(M_xyyy*y**2 + M_yyy*x*y**2) + (1.0d0/120.0d0)*(M_0* &
      x*y**5 + M_x*y**5)
    Ms_xyyyyz  = M_xyyy*y*z + M_xyyyy*z + M_xyyyyz + M_xyyyz*y + M_yyy*x*y*z + M_yyyy*x*z &
      + M_yyyyz*x + M_yyyz*x*y + (1.0d0/6.0d0)*(M_xy*y**3*z + M_xyz*y** &
      3 + M_y*x*y**3*z + M_yz*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2*z + &
      M_xyyz*y**2 + M_yy*x*y**2*z + M_yyz*x*y**2) + (1.0d0/24.0d0)*(M_0 &
      *x*y**4*z + M_x*y**4*z + M_xz*y**4 + M_z*x*y**4)
    Ms_xyyyzz  = M_xyyyz*z + M_xyyyzz + M_xyyz*y*z + M_xyyzz*y + M_yyyz*x*z + M_yyyzz*x + &
      M_yyz*x*y*z + M_yyzz*x*y + (1.0d0/4.0d0)*(M_xy*y**2*z**2 + M_y*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**3*z**2 + M_x*y**3*z**2) + ( &
      1.0d0/6.0d0)*(M_xz*y**3*z + M_xzz*y**3 + M_z*x*y**3*z + M_zz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xyy*y*z**2 + M_xyyy*z**2 + M_xyz*y**2*z + &
      M_xyzz*y**2 + M_yy*x*y*z**2 + M_yyy*x*z**2 + M_yz*x*y**2*z + &
      M_yzz*x*y**2)
    Ms_xyyzzz  = M_xyyzz*z + M_xyyzzz + M_xyzz*y*z + M_xyzzz*y + M_yyzz*x*z + M_yyzzz*x + &
      M_yzz*x*y*z + M_yzzz*x*y + (1.0d0/4.0d0)*(M_xz*y**2*z**2 + M_z*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**2*z**3 + M_x*y**2*z**3) + ( &
      1.0d0/6.0d0)*(M_xy*y*z**3 + M_xyy*z**3 + M_y*x*y*z**3 + M_yy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xyyz*z**2 + M_xyz*y*z**2 + M_xzz*y**2*z + &
      M_xzzz*y**2 + M_yyz*x*z**2 + M_yz*x*y*z**2 + M_zz*x*y**2*z + &
      M_zzz*x*y**2)
    Ms_xyzzzz  = M_xyzzz*z + M_xyzzzz + M_xzzz*y*z + M_xzzzz*y + M_yzzz*x*z + M_yzzzz*x + &
      M_zzz*x*y*z + M_zzzz*x*y + (1.0d0/6.0d0)*(M_xyz*z**3 + M_xz*y*z** &
      3 + M_yz*x*z**3 + M_z*x*y*z**3) + (1.0d0/2.0d0)*(M_xyzz*z**2 + &
      M_xzz*y*z**2 + M_yzz*x*z**2 + M_zz*x*y*z**2) + (1.0d0/24.0d0)*( &
      M_0*x*y*z**4 + M_x*y*z**4 + M_xy*z**4 + M_y*x*z**4)
    Ms_xzzzzz  = M_xzzzz*z + M_xzzzzz + M_zzzz*x*z + M_zzzzz*x + (1.0d0/24.0d0)*(M_xz*z** &
      4 + M_z*x*z**4) + (1.0d0/6.0d0)*(M_xzz*z**3 + M_zz*x*z**3) + ( &
      1.0d0/2.0d0)*(M_xzzz*z**2 + M_zzz*x*z**2) + (1.0d0/120.0d0)*(M_0* &
      x*z**5 + M_x*z**5)
    Ms_yyyyyy  = (1.0d0/720.0d0)*M_0*y**6 + (1.0d0/120.0d0)*M_y*y**5 + (1.0d0/24.0d0)* &
      M_yy*y**4 + (1.0d0/6.0d0)*M_yyy*y**3 + (1.0d0/2.0d0)*M_yyyy*y**2 &
      + M_yyyyy*y + M_yyyyyy
    Ms_yyyyyz  = M_yyyy*y*z + M_yyyyy*z + M_yyyyyz + M_yyyyz*y + (1.0d0/120.0d0)*(M_0*y** &
      5*z + M_z*y**5) + (1.0d0/24.0d0)*(M_y*y**4*z + M_yz*y**4) + ( &
      1.0d0/6.0d0)*(M_yy*y**3*z + M_yyz*y**3) + (1.0d0/2.0d0)*(M_yyy*y &
      **2*z + M_yyyz*y**2)
    Ms_yyyyzz  = (1.0d0/48.0d0)*M_0*y**4*z**2 + (1.0d0/12.0d0)*M_y*y**3*z**2 + (1.0d0/ &
      4.0d0)*M_yy*y**2*z**2 + M_yyyyz*z + M_yyyyzz + M_yyyz*y*z + &
      M_yyyzz*y + (1.0d0/6.0d0)*(M_yz*y**3*z + M_yzz*y**3) + (1.0d0/ &
      24.0d0)*(M_z*y**4*z + M_zz*y**4) + (1.0d0/2.0d0)*(M_yyy*y*z**2 + &
      M_yyyy*z**2 + M_yyz*y**2*z + M_yyzz*y**2)
    Ms_yyyzzz  = (1.0d0/36.0d0)*M_0*y**3*z**3 + M_yyyzz*z + M_yyyzzz + M_yyzz*y*z + &
      M_yyzzz*y + (1.0d0/4.0d0)*M_yz*y**2*z**2 + (1.0d0/12.0d0)*(M_y*y &
      **2*z**3 + M_z*y**3*z**2) + (1.0d0/2.0d0)*(M_yyyz*z**2 + M_yyz*y* &
      z**2 + M_yzz*y**2*z + M_yzzz*y**2) + (1.0d0/6.0d0)*(M_yy*y*z**3 + &
      M_yyy*z**3 + M_zz*y**3*z + M_zzz*y**3)
    Ms_yyzzzz  = (1.0d0/48.0d0)*M_0*y**2*z**4 + M_yyzzz*z + M_yyzzzz + M_yzzz*y*z + &
      M_yzzzz*y + (1.0d0/12.0d0)*M_z*y**2*z**3 + (1.0d0/4.0d0)*M_zz*y** &
      2*z**2 + (1.0d0/6.0d0)*(M_yyz*z**3 + M_yz*y*z**3) + (1.0d0/24.0d0 &
      )*(M_y*y*z**4 + M_yy*z**4) + (1.0d0/2.0d0)*(M_yyzz*z**2 + M_yzz*y &
      *z**2 + M_zzz*y**2*z + M_zzzz*y**2)
    Ms_yzzzzz  = M_yzzzz*z + M_yzzzzz + M_zzzz*y*z + M_zzzzz*y + (1.0d0/24.0d0)*(M_yz*z** &
      4 + M_z*y*z**4) + (1.0d0/6.0d0)*(M_yzz*z**3 + M_zz*y*z**3) + ( &
      1.0d0/2.0d0)*(M_yzzz*z**2 + M_zzz*y*z**2) + (1.0d0/120.0d0)*(M_0* &
      y*z**5 + M_y*z**5)
    Ms_zzzzzz  = (1.0d0/720.0d0)*M_0*z**6 + (1.0d0/120.0d0)*M_z*z**5 + (1.0d0/24.0d0)* &
      M_zz*z**4 + (1.0d0/6.0d0)*M_zzz*z**3 + (1.0d0/2.0d0)*M_zzzz*z**2 &
      + M_zzzzz*z + M_zzzzzz
    Ms_xxxxxxx = (1.0d0/5040.0d0)*M_0*x**7 + (1.0d0/720.0d0)*M_x*x**6 + (1.0d0/120.0d0)* &
      M_xx*x**5 + (1.0d0/24.0d0)*M_xxx*x**4 + (1.0d0/6.0d0)*M_xxxx*x**3 &
      + (1.0d0/2.0d0)*M_xxxxx*x**2 + M_xxxxxx*x + M_xxxxxxx
    Ms_xxxxxxy = M_xxxxx*x*y + M_xxxxxx*y + M_xxxxxxy + M_xxxxxy*x + (1.0d0/720.0d0)*(M_0 &
      *x**6*y + M_y*x**6) + (1.0d0/120.0d0)*(M_x*x**5*y + M_xy*x**5) + &
      (1.0d0/24.0d0)*(M_xx*x**4*y + M_xxy*x**4) + (1.0d0/6.0d0)*(M_xxx* &
      x**3*y + M_xxxy*x**3) + (1.0d0/2.0d0)*(M_xxxx*x**2*y + M_xxxxy*x &
      **2)
    Ms_xxxxxxz = M_xxxxx*x*z + M_xxxxxx*z + M_xxxxxxz + M_xxxxxz*x + (1.0d0/720.0d0)*(M_0 &
      *x**6*z + M_z*x**6) + (1.0d0/120.0d0)*(M_x*x**5*z + M_xz*x**5) + &
      (1.0d0/24.0d0)*(M_xx*x**4*z + M_xxz*x**4) + (1.0d0/6.0d0)*(M_xxx* &
      x**3*z + M_xxxz*x**3) + (1.0d0/2.0d0)*(M_xxxx*x**2*z + M_xxxxz*x &
      **2)
    Ms_xxxxxyy = (1.0d0/240.0d0)*M_0*x**5*y**2 + (1.0d0/48.0d0)*M_x*x**4*y**2 + (1.0d0/ &
      12.0d0)*M_xx*x**3*y**2 + (1.0d0/4.0d0)*M_xxx*x**2*y**2 + M_xxxxxy &
      *y + M_xxxxxyy + M_xxxxy*x*y + M_xxxxyy*x + (1.0d0/6.0d0)*(M_xxy* &
      x**3*y + M_xxyy*x**3) + (1.0d0/24.0d0)*(M_xy*x**4*y + M_xyy*x**4 &
      ) + (1.0d0/120.0d0)*(M_y*x**5*y + M_yy*x**5) + (1.0d0/2.0d0)*( &
      M_xxxx*x*y**2 + M_xxxxx*y**2 + M_xxxy*x**2*y + M_xxxyy*x**2)
    Ms_xxxxxyz = M_xxxx*x*y*z + M_xxxxx*y*z + M_xxxxxy*z + M_xxxxxyz + M_xxxxxz*y + &
      M_xxxxy*x*z + M_xxxxyz*x + M_xxxxz*x*y + (1.0d0/120.0d0)*(M_0*x** &
      5*y*z + M_y*x**5*z + M_yz*x**5 + M_z*x**5*y) + (1.0d0/24.0d0)*( &
      M_x*x**4*y*z + M_xy*x**4*z + M_xyz*x**4 + M_xz*x**4*y) + (1.0d0/ &
      6.0d0)*(M_xx*x**3*y*z + M_xxy*x**3*z + M_xxyz*x**3 + M_xxz*x**3*y &
      ) + (1.0d0/2.0d0)*(M_xxx*x**2*y*z + M_xxxy*x**2*z + M_xxxyz*x**2 &
      + M_xxxz*x**2*y)
    Ms_xxxxxzz = (1.0d0/240.0d0)*M_0*x**5*z**2 + (1.0d0/48.0d0)*M_x*x**4*z**2 + (1.0d0/ &
      12.0d0)*M_xx*x**3*z**2 + (1.0d0/4.0d0)*M_xxx*x**2*z**2 + M_xxxxxz &
      *z + M_xxxxxzz + M_xxxxz*x*z + M_xxxxzz*x + (1.0d0/6.0d0)*(M_xxz* &
      x**3*z + M_xxzz*x**3) + (1.0d0/24.0d0)*(M_xz*x**4*z + M_xzz*x**4 &
      ) + (1.0d0/120.0d0)*(M_z*x**5*z + M_zz*x**5) + (1.0d0/2.0d0)*( &
      M_xxxx*x*z**2 + M_xxxxx*z**2 + M_xxxz*x**2*z + M_xxxzz*x**2)
    Ms_xxxxyyy = (1.0d0/144.0d0)*M_0*x**4*y**3 + (1.0d0/36.0d0)*M_x*x**3*y**3 + M_xxxxyy* &
      y + M_xxxxyyy + M_xxxyy*x*y + M_xxxyyy*x + (1.0d0/4.0d0)*M_xxy*x &
      **2*y**2 + (1.0d0/48.0d0)*M_y*x**4*y**2 + (1.0d0/12.0d0)*(M_xx*x &
      **2*y**3 + M_xy*x**3*y**2) + (1.0d0/24.0d0)*(M_yy*x**4*y + M_yyy* &
      x**4) + (1.0d0/2.0d0)*(M_xxxxy*y**2 + M_xxxy*x*y**2 + M_xxyy*x**2 &
      *y + M_xxyyy*x**2) + (1.0d0/6.0d0)*(M_xxx*x*y**3 + M_xxxx*y**3 + &
      M_xyy*x**3*y + M_xyyy*x**3)
    Ms_xxxxyyz = M_xxxxy*y*z + M_xxxxyy*z + M_xxxxyyz + M_xxxxyz*y + M_xxxy*x*y*z + &
      M_xxxyy*x*z + M_xxxyyz*x + M_xxxyz*x*y + (1.0d0/48.0d0)*(M_0*x**4 &
      *y**2*z + M_z*x**4*y**2) + (1.0d0/12.0d0)*(M_x*x**3*y**2*z + M_xz &
      *x**3*y**2) + (1.0d0/4.0d0)*(M_xx*x**2*y**2*z + M_xxz*x**2*y**2) &
      + (1.0d0/6.0d0)*(M_xy*x**3*y*z + M_xyy*x**3*z + M_xyyz*x**3 + &
      M_xyz*x**3*y) + (1.0d0/24.0d0)*(M_y*x**4*y*z + M_yy*x**4*z + &
      M_yyz*x**4 + M_yz*x**4*y) + (1.0d0/2.0d0)*(M_xxx*x*y**2*z + &
      M_xxxx*y**2*z + M_xxxxz*y**2 + M_xxxz*x*y**2 + M_xxy*x**2*y*z + &
      M_xxyy*x**2*z + M_xxyyz*x**2 + M_xxyz*x**2*y)
    Ms_xxxxyzz = M_xxxxyz*z + M_xxxxyzz + M_xxxxz*y*z + M_xxxxzz*y + M_xxxyz*x*z + &
      M_xxxyzz*x + M_xxxz*x*y*z + M_xxxzz*x*y + (1.0d0/48.0d0)*(M_0*x** &
      4*y*z**2 + M_y*x**4*z**2) + (1.0d0/12.0d0)*(M_x*x**3*y*z**2 + &
      M_xy*x**3*z**2) + (1.0d0/4.0d0)*(M_xx*x**2*y*z**2 + M_xxy*x**2*z &
      **2) + (1.0d0/6.0d0)*(M_xyz*x**3*z + M_xyzz*x**3 + M_xz*x**3*y*z &
      + M_xzz*x**3*y) + (1.0d0/24.0d0)*(M_yz*x**4*z + M_yzz*x**4 + M_z* &
      x**4*y*z + M_zz*x**4*y) + (1.0d0/2.0d0)*(M_xxx*x*y*z**2 + M_xxxx* &
      y*z**2 + M_xxxxy*z**2 + M_xxxy*x*z**2 + M_xxyz*x**2*z + M_xxyzz*x &
      **2 + M_xxz*x**2*y*z + M_xxzz*x**2*y)
    Ms_xxxxzzz = (1.0d0/144.0d0)*M_0*x**4*z**3 + (1.0d0/36.0d0)*M_x*x**3*z**3 + M_xxxxzz* &
      z + M_xxxxzzz + M_xxxzz*x*z + M_xxxzzz*x + (1.0d0/4.0d0)*M_xxz*x &
      **2*z**2 + (1.0d0/48.0d0)*M_z*x**4*z**2 + (1.0d0/12.0d0)*(M_xx*x &
      **2*z**3 + M_xz*x**3*z**2) + (1.0d0/24.0d0)*(M_zz*x**4*z + M_zzz* &
      x**4) + (1.0d0/2.0d0)*(M_xxxxz*z**2 + M_xxxz*x*z**2 + M_xxzz*x**2 &
      *z + M_xxzzz*x**2) + (1.0d0/6.0d0)*(M_xxx*x*z**3 + M_xxxx*z**3 + &
      M_xzz*x**3*z + M_xzzz*x**3)
    Ms_xxxyyyy = (1.0d0/144.0d0)*M_0*x**3*y**4 + (1.0d0/48.0d0)*M_x*x**2*y**4 + M_xxxyyy* &
      y + M_xxxyyyy + M_xxyyy*x*y + M_xxyyyy*x + (1.0d0/4.0d0)*M_xyy*x &
      **2*y**2 + (1.0d0/36.0d0)*M_y*x**3*y**3 + (1.0d0/24.0d0)*(M_xx*x* &
      y**4 + M_xxx*y**4) + (1.0d0/12.0d0)*(M_xy*x**2*y**3 + M_yy*x**3*y &
      **2) + (1.0d0/6.0d0)*(M_xxxy*y**3 + M_xxy*x*y**3 + M_yyy*x**3*y + &
      M_yyyy*x**3) + (1.0d0/2.0d0)*(M_xxxyy*y**2 + M_xxyy*x*y**2 + &
      M_xyyy*x**2*y + M_xyyyy*x**2)
    Ms_xxxyyyz = M_xxxyy*y*z + M_xxxyyy*z + M_xxxyyyz + M_xxxyyz*y + M_xxyy*x*y*z + &
      M_xxyyy*x*z + M_xxyyyz*x + M_xxyyz*x*y + (1.0d0/36.0d0)*(M_0*x**3 &
      *y**3*z + M_z*x**3*y**3) + (1.0d0/4.0d0)*(M_xy*x**2*y**2*z + &
      M_xyz*x**2*y**2) + (1.0d0/12.0d0)*(M_x*x**2*y**3*z + M_xz*x**2*y &
      **3 + M_y*x**3*y**2*z + M_yz*x**3*y**2) + (1.0d0/2.0d0)*(M_xxxy*y &
      **2*z + M_xxxyz*y**2 + M_xxy*x*y**2*z + M_xxyz*x*y**2 + M_xyy*x** &
      2*y*z + M_xyyy*x**2*z + M_xyyyz*x**2 + M_xyyz*x**2*y) + (1.0d0/ &
      6.0d0)*(M_xx*x*y**3*z + M_xxx*y**3*z + M_xxxz*y**3 + M_xxz*x*y**3 &
      + M_yy*x**3*y*z + M_yyy*x**3*z + M_yyyz*x**3 + M_yyz*x**3*y)
    Ms_xxxyyzz = (1.0d0/24.0d0)*M_0*x**3*y**2*z**2 + (1.0d0/8.0d0)*M_x*x**2*y**2*z**2 + &
      M_xxxyyz*z + M_xxxyyzz + M_xxxyz*y*z + M_xxxyzz*y + M_xxyyz*x*z + &
      M_xxyyzz*x + M_xxyz*x*y*z + M_xxyzz*x*y + (1.0d0/6.0d0)*(M_yyz*x &
      **3*z + M_yyzz*x**3 + M_yz*x**3*y*z + M_yzz*x**3*y) + (1.0d0/ &
      12.0d0)*(M_y*x**3*y*z**2 + M_yy*x**3*z**2 + M_z*x**3*y**2*z + &
      M_zz*x**3*y**2) + (1.0d0/4.0d0)*(M_xx*x*y**2*z**2 + M_xxx*y**2*z &
      **2 + M_xy*x**2*y*z**2 + M_xyy*x**2*z**2 + M_xz*x**2*y**2*z + &
      M_xzz*x**2*y**2) + (1.0d0/2.0d0)*(M_xxxy*y*z**2 + M_xxxyy*z**2 + &
      M_xxxz*y**2*z + M_xxxzz*y**2 + M_xxy*x*y*z**2 + M_xxyy*x*z**2 + &
      M_xxz*x*y**2*z + M_xxzz*x*y**2 + M_xyyz*x**2*z + M_xyyzz*x**2 + &
      M_xyz*x**2*y*z + M_xyzz*x**2*y)
    Ms_xxxyzzz = M_xxxyzz*z + M_xxxyzzz + M_xxxzz*y*z + M_xxxzzz*y + M_xxyzz*x*z + &
      M_xxyzzz*x + M_xxzz*x*y*z + M_xxzzz*x*y + (1.0d0/4.0d0)*(M_xyz*x &
      **2*z**2 + M_xz*x**2*y*z**2) + (1.0d0/36.0d0)*(M_0*x**3*y*z**3 + &
      M_y*x**3*z**3) + (1.0d0/12.0d0)*(M_x*x**2*y*z**3 + M_xy*x**2*z**3 &
      + M_yz*x**3*z**2 + M_z*x**3*y*z**2) + (1.0d0/2.0d0)*(M_xxxyz*z**2 &
      + M_xxxz*y*z**2 + M_xxyz*x*z**2 + M_xxz*x*y*z**2 + M_xyzz*x**2*z &
      + M_xyzzz*x**2 + M_xzz*x**2*y*z + M_xzzz*x**2*y) + (1.0d0/6.0d0)* &
      (M_xx*x*y*z**3 + M_xxx*y*z**3 + M_xxxy*z**3 + M_xxy*x*z**3 + &
      M_yzz*x**3*z + M_yzzz*x**3 + M_zz*x**3*y*z + M_zzz*x**3*y)
    Ms_xxxzzzz = (1.0d0/144.0d0)*M_0*x**3*z**4 + (1.0d0/48.0d0)*M_x*x**2*z**4 + M_xxxzzz* &
      z + M_xxxzzzz + M_xxzzz*x*z + M_xxzzzz*x + (1.0d0/4.0d0)*M_xzz*x &
      **2*z**2 + (1.0d0/36.0d0)*M_z*x**3*z**3 + (1.0d0/24.0d0)*(M_xx*x* &
      z**4 + M_xxx*z**4) + (1.0d0/12.0d0)*(M_xz*x**2*z**3 + M_zz*x**3*z &
      **2) + (1.0d0/6.0d0)*(M_xxxz*z**3 + M_xxz*x*z**3 + M_zzz*x**3*z + &
      M_zzzz*x**3) + (1.0d0/2.0d0)*(M_xxxzz*z**2 + M_xxzz*x*z**2 + &
      M_xzzz*x**2*z + M_xzzzz*x**2)
    Ms_xxyyyyy = (1.0d0/240.0d0)*M_0*x**2*y**5 + M_xxyyyy*y + M_xxyyyyy + M_xyyyy*x*y + &
      M_xyyyyy*x + (1.0d0/48.0d0)*M_y*x**2*y**4 + (1.0d0/12.0d0)*M_yy*x &
      **2*y**3 + (1.0d0/4.0d0)*M_yyy*x**2*y**2 + (1.0d0/24.0d0)*(M_xxy* &
      y**4 + M_xy*x*y**4) + (1.0d0/6.0d0)*(M_xxyy*y**3 + M_xyy*x*y**3) &
      + (1.0d0/120.0d0)*(M_x*x*y**5 + M_xx*y**5) + (1.0d0/2.0d0)*( &
      M_xxyyy*y**2 + M_xyyy*x*y**2 + M_yyyy*x**2*y + M_yyyyy*x**2)
    Ms_xxyyyyz = M_xxyyy*y*z + M_xxyyyy*z + M_xxyyyyz + M_xxyyyz*y + M_xyyy*x*y*z + &
      M_xyyyy*x*z + M_xyyyyz*x + M_xyyyz*x*y + (1.0d0/48.0d0)*(M_0*x**2 &
      *y**4*z + M_z*x**2*y**4) + (1.0d0/12.0d0)*(M_y*x**2*y**3*z + M_yz &
      *x**2*y**3) + (1.0d0/4.0d0)*(M_yy*x**2*y**2*z + M_yyz*x**2*y**2) &
      + (1.0d0/6.0d0)*(M_xxy*y**3*z + M_xxyz*y**3 + M_xy*x*y**3*z + &
      M_xyz*x*y**3) + (1.0d0/24.0d0)*(M_x*x*y**4*z + M_xx*y**4*z + &
      M_xxz*y**4 + M_xz*x*y**4) + (1.0d0/2.0d0)*(M_xxyy*y**2*z + &
      M_xxyyz*y**2 + M_xyy*x*y**2*z + M_xyyz*x*y**2 + M_yyy*x**2*y*z + &
      M_yyyy*x**2*z + M_yyyyz*x**2 + M_yyyz*x**2*y)
    Ms_xxyyyzz = (1.0d0/24.0d0)*M_0*x**2*y**3*z**2 + M_xxyyyz*z + M_xxyyyzz + M_xxyyz*y*z &
      + M_xxyyzz*y + M_xyyyz*x*z + M_xyyyzz*x + M_xyyz*x*y*z + M_xyyzz* &
      x*y + (1.0d0/8.0d0)*M_y*x**2*y**2*z**2 + (1.0d0/6.0d0)*(M_xxz*y** &
      3*z + M_xxzz*y**3 + M_xz*x*y**3*z + M_xzz*x*y**3) + (1.0d0/12.0d0 &
      )*(M_x*x*y**3*z**2 + M_xx*y**3*z**2 + M_z*x**2*y**3*z + M_zz*x**2 &
      *y**3) + (1.0d0/4.0d0)*(M_xxy*y**2*z**2 + M_xy*x*y**2*z**2 + M_yy &
      *x**2*y*z**2 + M_yyy*x**2*z**2 + M_yz*x**2*y**2*z + M_yzz*x**2*y &
      **2) + (1.0d0/2.0d0)*(M_xxyy*y*z**2 + M_xxyyy*z**2 + M_xxyz*y**2* &
      z + M_xxyzz*y**2 + M_xyy*x*y*z**2 + M_xyyy*x*z**2 + M_xyz*x*y**2* &
      z + M_xyzz*x*y**2 + M_yyyz*x**2*z + M_yyyzz*x**2 + M_yyz*x**2*y*z &
      + M_yyzz*x**2*y)
    Ms_xxyyzzz = (1.0d0/24.0d0)*M_0*x**2*y**2*z**3 + M_xxyyzz*z + M_xxyyzzz + M_xxyzz*y*z &
      + M_xxyzzz*y + M_xyyzz*x*z + M_xyyzzz*x + M_xyzz*x*y*z + M_xyzzz* &
      x*y + (1.0d0/8.0d0)*M_z*x**2*y**2*z**2 + (1.0d0/6.0d0)*(M_xxy*y*z &
      **3 + M_xxyy*z**3 + M_xy*x*y*z**3 + M_xyy*x*z**3) + (1.0d0/12.0d0 &
      )*(M_x*x*y**2*z**3 + M_xx*y**2*z**3 + M_y*x**2*y*z**3 + M_yy*x**2 &
      *z**3) + (1.0d0/4.0d0)*(M_xxz*y**2*z**2 + M_xz*x*y**2*z**2 + &
      M_yyz*x**2*z**2 + M_yz*x**2*y*z**2 + M_zz*x**2*y**2*z + M_zzz*x** &
      2*y**2) + (1.0d0/2.0d0)*(M_xxyyz*z**2 + M_xxyz*y*z**2 + M_xxzz*y &
      **2*z + M_xxzzz*y**2 + M_xyyz*x*z**2 + M_xyz*x*y*z**2 + M_xzz*x*y &
      **2*z + M_xzzz*x*y**2 + M_yyzz*x**2*z + M_yyzzz*x**2 + M_yzz*x**2 &
      *y*z + M_yzzz*x**2*y)
    Ms_xxyzzzz = M_xxyzzz*z + M_xxyzzzz + M_xxzzz*y*z + M_xxzzzz*y + M_xyzzz*x*z + &
      M_xyzzzz*x + M_xzzz*x*y*z + M_xzzzz*x*y + (1.0d0/12.0d0)*(M_yz*x &
      **2*z**3 + M_z*x**2*y*z**3) + (1.0d0/4.0d0)*(M_yzz*x**2*z**2 + &
      M_zz*x**2*y*z**2) + (1.0d0/48.0d0)*(M_0*x**2*y*z**4 + M_y*x**2*z &
      **4) + (1.0d0/6.0d0)*(M_xxyz*z**3 + M_xxz*y*z**3 + M_xyz*x*z**3 + &
      M_xz*x*y*z**3) + (1.0d0/24.0d0)*(M_x*x*y*z**4 + M_xx*y*z**4 + &
      M_xxy*z**4 + M_xy*x*z**4) + (1.0d0/2.0d0)*(M_xxyzz*z**2 + M_xxzz* &
      y*z**2 + M_xyzz*x*z**2 + M_xzz*x*y*z**2 + M_yzzz*x**2*z + M_yzzzz &
      *x**2 + M_zzz*x**2*y*z + M_zzzz*x**2*y)
    Ms_xxzzzzz = (1.0d0/240.0d0)*M_0*x**2*z**5 + M_xxzzzz*z + M_xxzzzzz + M_xzzzz*x*z + &
      M_xzzzzz*x + (1.0d0/48.0d0)*M_z*x**2*z**4 + (1.0d0/12.0d0)*M_zz*x &
      **2*z**3 + (1.0d0/4.0d0)*M_zzz*x**2*z**2 + (1.0d0/24.0d0)*(M_xxz* &
      z**4 + M_xz*x*z**4) + (1.0d0/6.0d0)*(M_xxzz*z**3 + M_xzz*x*z**3) &
      + (1.0d0/120.0d0)*(M_x*x*z**5 + M_xx*z**5) + (1.0d0/2.0d0)*( &
      M_xxzzz*z**2 + M_xzzz*x*z**2 + M_zzzz*x**2*z + M_zzzzz*x**2)
    Ms_xyyyyyy = M_xyyyyy*y + M_xyyyyyy + M_yyyyy*x*y + M_yyyyyy*x + (1.0d0/120.0d0)*( &
      M_xy*y**5 + M_y*x*y**5) + (1.0d0/24.0d0)*(M_xyy*y**4 + M_yy*x*y** &
      4) + (1.0d0/6.0d0)*(M_xyyy*y**3 + M_yyy*x*y**3) + (1.0d0/2.0d0)*( &
      M_xyyyy*y**2 + M_yyyy*x*y**2) + (1.0d0/720.0d0)*(M_0*x*y**6 + M_x &
      *y**6)
    Ms_xyyyyyz = M_xyyyy*y*z + M_xyyyyy*z + M_xyyyyyz + M_xyyyyz*y + M_yyyy*x*y*z + &
      M_yyyyy*x*z + M_yyyyyz*x + M_yyyyz*x*y + (1.0d0/24.0d0)*(M_xy*y** &
      4*z + M_xyz*y**4 + M_y*x*y**4*z + M_yz*x*y**4) + (1.0d0/6.0d0)*( &
      M_xyy*y**3*z + M_xyyz*y**3 + M_yy*x*y**3*z + M_yyz*x*y**3) + ( &
      1.0d0/2.0d0)*(M_xyyy*y**2*z + M_xyyyz*y**2 + M_yyy*x*y**2*z + &
      M_yyyz*x*y**2) + (1.0d0/120.0d0)*(M_0*x*y**5*z + M_x*y**5*z + &
      M_xz*y**5 + M_z*x*y**5)
    Ms_xyyyyzz = M_xyyyyz*z + M_xyyyyzz + M_xyyyz*y*z + M_xyyyzz*y + M_yyyyz*x*z + &
      M_yyyyzz*x + M_yyyz*x*y*z + M_yyyzz*x*y + (1.0d0/12.0d0)*(M_xy*y &
      **3*z**2 + M_y*x*y**3*z**2) + (1.0d0/4.0d0)*(M_xyy*y**2*z**2 + &
      M_yy*x*y**2*z**2) + (1.0d0/48.0d0)*(M_0*x*y**4*z**2 + M_x*y**4*z &
      **2) + (1.0d0/6.0d0)*(M_xyz*y**3*z + M_xyzz*y**3 + M_yz*x*y**3*z &
      + M_yzz*x*y**3) + (1.0d0/24.0d0)*(M_xz*y**4*z + M_xzz*y**4 + M_z* &
      x*y**4*z + M_zz*x*y**4) + (1.0d0/2.0d0)*(M_xyyy*y*z**2 + M_xyyyy* &
      z**2 + M_xyyz*y**2*z + M_xyyzz*y**2 + M_yyy*x*y*z**2 + M_yyyy*x*z &
      **2 + M_yyz*x*y**2*z + M_yyzz*x*y**2)
    Ms_xyyyzzz = M_xyyyzz*z + M_xyyyzzz + M_xyyzz*y*z + M_xyyzzz*y + M_yyyzz*x*z + &
      M_yyyzzz*x + M_yyzz*x*y*z + M_yyzzz*x*y + (1.0d0/4.0d0)*(M_xyz*y &
      **2*z**2 + M_yz*x*y**2*z**2) + (1.0d0/36.0d0)*(M_0*x*y**3*z**3 + &
      M_x*y**3*z**3) + (1.0d0/12.0d0)*(M_xy*y**2*z**3 + M_xz*y**3*z**2 &
      + M_y*x*y**2*z**3 + M_z*x*y**3*z**2) + (1.0d0/2.0d0)*(M_xyyyz*z** &
      2 + M_xyyz*y*z**2 + M_xyzz*y**2*z + M_xyzzz*y**2 + M_yyyz*x*z**2 &
      + M_yyz*x*y*z**2 + M_yzz*x*y**2*z + M_yzzz*x*y**2) + (1.0d0/6.0d0 &
      )*(M_xyy*y*z**3 + M_xyyy*z**3 + M_xzz*y**3*z + M_xzzz*y**3 + M_yy &
      *x*y*z**3 + M_yyy*x*z**3 + M_zz*x*y**3*z + M_zzz*x*y**3)
    Ms_xyyzzzz = M_xyyzzz*z + M_xyyzzzz + M_xyzzz*y*z + M_xyzzzz*y + M_yyzzz*x*z + &
      M_yyzzzz*x + M_yzzz*x*y*z + M_yzzzz*x*y + (1.0d0/12.0d0)*(M_xz*y &
      **2*z**3 + M_z*x*y**2*z**3) + (1.0d0/4.0d0)*(M_xzz*y**2*z**2 + &
      M_zz*x*y**2*z**2) + (1.0d0/48.0d0)*(M_0*x*y**2*z**4 + M_x*y**2*z &
      **4) + (1.0d0/6.0d0)*(M_xyyz*z**3 + M_xyz*y*z**3 + M_yyz*x*z**3 + &
      M_yz*x*y*z**3) + (1.0d0/24.0d0)*(M_xy*y*z**4 + M_xyy*z**4 + M_y*x &
      *y*z**4 + M_yy*x*z**4) + (1.0d0/2.0d0)*(M_xyyzz*z**2 + M_xyzz*y*z &
      **2 + M_xzzz*y**2*z + M_xzzzz*y**2 + M_yyzz*x*z**2 + M_yzz*x*y*z &
      **2 + M_zzz*x*y**2*z + M_zzzz*x*y**2)
    Ms_xyzzzzz = M_xyzzzz*z + M_xyzzzzz + M_xzzzz*y*z + M_xzzzzz*y + M_yzzzz*x*z + &
      M_yzzzzz*x + M_zzzz*x*y*z + M_zzzzz*x*y + (1.0d0/24.0d0)*(M_xyz*z &
      **4 + M_xz*y*z**4 + M_yz*x*z**4 + M_z*x*y*z**4) + (1.0d0/6.0d0)*( &
      M_xyzz*z**3 + M_xzz*y*z**3 + M_yzz*x*z**3 + M_zz*x*y*z**3) + ( &
      1.0d0/2.0d0)*(M_xyzzz*z**2 + M_xzzz*y*z**2 + M_yzzz*x*z**2 + &
      M_zzz*x*y*z**2) + (1.0d0/120.0d0)*(M_0*x*y*z**5 + M_x*y*z**5 + &
      M_xy*z**5 + M_y*x*z**5)
    Ms_xzzzzzz = M_xzzzzz*z + M_xzzzzzz + M_zzzzz*x*z + M_zzzzzz*x + (1.0d0/120.0d0)*( &
      M_xz*z**5 + M_z*x*z**5) + (1.0d0/24.0d0)*(M_xzz*z**4 + M_zz*x*z** &
      4) + (1.0d0/6.0d0)*(M_xzzz*z**3 + M_zzz*x*z**3) + (1.0d0/2.0d0)*( &
      M_xzzzz*z**2 + M_zzzz*x*z**2) + (1.0d0/720.0d0)*(M_0*x*z**6 + M_x &
      *z**6)
    Ms_yyyyyyy = (1.0d0/5040.0d0)*M_0*y**7 + (1.0d0/720.0d0)*M_y*y**6 + (1.0d0/120.0d0)* &
      M_yy*y**5 + (1.0d0/24.0d0)*M_yyy*y**4 + (1.0d0/6.0d0)*M_yyyy*y**3 &
      + (1.0d0/2.0d0)*M_yyyyy*y**2 + M_yyyyyy*y + M_yyyyyyy
    Ms_yyyyyyz = M_yyyyy*y*z + M_yyyyyy*z + M_yyyyyyz + M_yyyyyz*y + (1.0d0/720.0d0)*(M_0 &
      *y**6*z + M_z*y**6) + (1.0d0/120.0d0)*(M_y*y**5*z + M_yz*y**5) + &
      (1.0d0/24.0d0)*(M_yy*y**4*z + M_yyz*y**4) + (1.0d0/6.0d0)*(M_yyy* &
      y**3*z + M_yyyz*y**3) + (1.0d0/2.0d0)*(M_yyyy*y**2*z + M_yyyyz*y &
      **2)
    Ms_yyyyyzz = (1.0d0/240.0d0)*M_0*y**5*z**2 + (1.0d0/48.0d0)*M_y*y**4*z**2 + (1.0d0/ &
      12.0d0)*M_yy*y**3*z**2 + (1.0d0/4.0d0)*M_yyy*y**2*z**2 + M_yyyyyz &
      *z + M_yyyyyzz + M_yyyyz*y*z + M_yyyyzz*y + (1.0d0/6.0d0)*(M_yyz* &
      y**3*z + M_yyzz*y**3) + (1.0d0/24.0d0)*(M_yz*y**4*z + M_yzz*y**4 &
      ) + (1.0d0/120.0d0)*(M_z*y**5*z + M_zz*y**5) + (1.0d0/2.0d0)*( &
      M_yyyy*y*z**2 + M_yyyyy*z**2 + M_yyyz*y**2*z + M_yyyzz*y**2)
    Ms_yyyyzzz = (1.0d0/144.0d0)*M_0*y**4*z**3 + (1.0d0/36.0d0)*M_y*y**3*z**3 + M_yyyyzz* &
      z + M_yyyyzzz + M_yyyzz*y*z + M_yyyzzz*y + (1.0d0/4.0d0)*M_yyz*y &
      **2*z**2 + (1.0d0/48.0d0)*M_z*y**4*z**2 + (1.0d0/12.0d0)*(M_yy*y &
      **2*z**3 + M_yz*y**3*z**2) + (1.0d0/24.0d0)*(M_zz*y**4*z + M_zzz* &
      y**4) + (1.0d0/2.0d0)*(M_yyyyz*z**2 + M_yyyz*y*z**2 + M_yyzz*y**2 &
      *z + M_yyzzz*y**2) + (1.0d0/6.0d0)*(M_yyy*y*z**3 + M_yyyy*z**3 + &
      M_yzz*y**3*z + M_yzzz*y**3)
    Ms_yyyzzzz = (1.0d0/144.0d0)*M_0*y**3*z**4 + (1.0d0/48.0d0)*M_y*y**2*z**4 + M_yyyzzz* &
      z + M_yyyzzzz + M_yyzzz*y*z + M_yyzzzz*y + (1.0d0/4.0d0)*M_yzz*y &
      **2*z**2 + (1.0d0/36.0d0)*M_z*y**3*z**3 + (1.0d0/24.0d0)*(M_yy*y* &
      z**4 + M_yyy*z**4) + (1.0d0/12.0d0)*(M_yz*y**2*z**3 + M_zz*y**3*z &
      **2) + (1.0d0/6.0d0)*(M_yyyz*z**3 + M_yyz*y*z**3 + M_zzz*y**3*z + &
      M_zzzz*y**3) + (1.0d0/2.0d0)*(M_yyyzz*z**2 + M_yyzz*y*z**2 + &
      M_yzzz*y**2*z + M_yzzzz*y**2)
    Ms_yyzzzzz = (1.0d0/240.0d0)*M_0*y**2*z**5 + M_yyzzzz*z + M_yyzzzzz + M_yzzzz*y*z + &
      M_yzzzzz*y + (1.0d0/48.0d0)*M_z*y**2*z**4 + (1.0d0/12.0d0)*M_zz*y &
      **2*z**3 + (1.0d0/4.0d0)*M_zzz*y**2*z**2 + (1.0d0/24.0d0)*(M_yyz* &
      z**4 + M_yz*y*z**4) + (1.0d0/6.0d0)*(M_yyzz*z**3 + M_yzz*y*z**3) &
      + (1.0d0/120.0d0)*(M_y*y*z**5 + M_yy*z**5) + (1.0d0/2.0d0)*( &
      M_yyzzz*z**2 + M_yzzz*y*z**2 + M_zzzz*y**2*z + M_zzzzz*y**2)
    Ms_yzzzzzz = M_yzzzzz*z + M_yzzzzzz + M_zzzzz*y*z + M_zzzzzz*y + (1.0d0/120.0d0)*( &
      M_yz*z**5 + M_z*y*z**5) + (1.0d0/24.0d0)*(M_yzz*z**4 + M_zz*y*z** &
      4) + (1.0d0/6.0d0)*(M_yzzz*z**3 + M_zzz*y*z**3) + (1.0d0/2.0d0)*( &
      M_yzzzz*z**2 + M_zzzz*y*z**2) + (1.0d0/720.0d0)*(M_0*y*z**6 + M_y &
      *z**6)
    Ms_zzzzzzz = (1.0d0/5040.0d0)*M_0*z**7 + (1.0d0/720.0d0)*M_z*z**6 + (1.0d0/120.0d0)* &
      M_zz*z**5 + (1.0d0/24.0d0)*M_zzz*z**4 + (1.0d0/6.0d0)*M_zzzz*z**3 &
      + (1.0d0/2.0d0)*M_zzzzz*z**2 + M_zzzzzz*z + M_zzzzzzz
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
    
! OPS  1234*ADD + 2*DIV + 1920*MUL + 60*NEG + 427*POW + 94*SUB = 3737  (3828 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
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
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz
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
    h         = x**2 + y**2 + z**2
    u2        = 1.0/h
    u         = sqrt(u2)
    D_0       = u
    D_x       = -u**3*x
    D_y       = -u**3*y
    D_z       = -u**3*z
    D_xx      = -h*u**5 + 3*u**5*x**2
    D_xy      = 3*u**5*x*y
    D_xz      = 3*u**5*x*z
    D_yy      = -h*u**5 + 3*u**5*y**2
    D_yz      = 3*u**5*y*z
    D_zz      = -(D_xx + D_yy)
    D_xxx     = 9*h*u**7*x - 15*u**7*x**3
    D_xxy     = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz     = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy     = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz     = -15*u**7*x*y*z
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = 9*h*u**7*y - 15*u**7*y**3
    D_yyz     = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    D_xxxx    = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy    = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz    = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy    = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz    = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz    = -(D_xxxx + D_xxyy)
    D_xyyy    = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz    = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz    = -(D_xxxy + D_xyyy)
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz    = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    D_xxxxx   = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy   = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz   = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy   = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz   = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    D_xxyyy   = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz   = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    D_xyyyy   = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz   = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    D_yyyyy   = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz   = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    D_xxxxxx  = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    D_xxxxxy  = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    D_xxxxxz  = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    D_xxxxyy  = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    D_xxxxyz  = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy  = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    D_xxxyyz  = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy  = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    D_xxyyyz  = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy  = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    D_xyyyyz  = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    D_yyyyyz  = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    D_xxxxxxx = 11025*h**3*u**15*x - 99225*h**2*u**15*x**3 + 218295*h*u**15*x**5 - &
      135135*u**15*x**7
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = 1575*h**3*u**15*y - 42525*h**2*u**15*x**2*y + 155925*h*u**15*x**4*y - &
      135135*u**15*x**6*y
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = 1575*h**3*u**15*z - 42525*h**2*u**15*x**2*z + 155925*h*u**15*x**4*z - &
      135135*u**15*x**6*z
    L_xxxxxx  = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = 1575*h**3*u**15*x - 9450*h**2*u**15*x**3 - 14175*h**2*u**15*x*y**2 + &
      10395*h*u**15*x**5 + 103950*h*u**15*x**3*y**2 - 135135*u**15*x**5 &
      *y**2
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x**3*y*z - 135135*u**15*x**5*y* &
      z
    L_xxxxxy  = D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxy*M_xy + D_xxxxxxz &
      *M_xz + D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + D_xxxxxzz*M_zz
    L_xxxxxz  = D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z
    D_xxxxyyy = 945*h**3*u**15*y - 17010*h**2*u**15*x**2*y - 2835*h**2*u**15*y**3 + &
      31185*h*u**15*x**4*y + 62370*h*u**15*x**2*y**3 - 135135*u**15*x** &
      4*y**3
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = 315*h**3*u**15*z - 5670*h**2*u**15*x**2*z - 2835*h**2*u**15*y**2*z + &
      10395*h*u**15*x**4*z + 62370*h*u**15*x**2*y**2*z - 135135*u**15*x &
      **4*y**2*z
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
    D_xxxyyyy = 945*h**3*u**15*x - 2835*h**2*u**15*x**3 - 17010*h**2*u**15*x*y**2 + &
      62370*h*u**15*x**3*y**2 + 31185*h*u**15*x*y**4 - 135135*u**15*x** &
      3*y**4
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = -8505*h**2*u**15*x*y*z - 135135*u**15*x**3*y**3*z + 31185*(h*u**15*x**3* &
      y*z + h*u**15*x*y**3*z)
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
    D_xxyyyyy = 1575*h**3*u**15*y - 14175*h**2*u**15*x**2*y - 9450*h**2*u**15*y**3 + &
      103950*h*u**15*x**2*y**3 + 10395*h*u**15*y**5 - 135135*u**15*x**2 &
      *y**5
    L_xxyyyyy = D_xxyyyyy*M_0
    D_xxyyyyz = 315*h**3*u**15*z - 2835*h**2*u**15*x**2*z - 5670*h**2*u**15*y**2*z + &
      62370*h*u**15*x**2*y**2*z + 10395*h*u**15*y**4*z - 135135*u**15*x &
      **2*y**4*z
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
    D_xyyyyyy = 1575*h**3*u**15*x - 42525*h**2*u**15*x*y**2 + 155925*h*u**15*x*y**4 - &
      135135*u**15*x*y**6
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x*y**3*z - 135135*u**15*x*y**5* &
      z
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
    D_yyyyyyy = 11025*h**3*u**15*y - 99225*h**2*u**15*y**3 + 218295*h*u**15*y**5 - &
      135135*u**15*y**7
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = 1575*h**3*u**15*z - 42525*h**2*u**15*y**2*z + 155925*h*u**15*y**4*z - &
      135135*u**15*y**6*z
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
    
! OPS  1190*ADD + 130*DIV + 2142*MUL + 56*NEG + 1134*POW = 4652  (5527 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
    Ls_xxxxxx  = L_xxxxxx + L_xxxxxxx*x + L_xxxxxxy*y + L_xxxxxxz*z
    Ls_xxxxxy  = L_xxxxxxy*x + L_xxxxxy + L_xxxxxyy*y + L_xxxxxyz*z
    Ls_xxxxyy  = L_xxxxxyy*x + L_xxxxyy + L_xxxxyyy*y + L_xxxxyyz*z
    Ls_xxxyyy  = L_xxxxyyy*x + L_xxxyyy + L_xxxyyyy*y + L_xxxyyyz*z
    Ls_xxyyyy  = L_xxxyyyy*x + L_xxyyyy + L_xxyyyyy*y + L_xxyyyyz*z
    Ls_xyyyyy  = L_xxyyyyy*x + L_xyyyyy + L_xyyyyyy*y + L_xyyyyyz*z
    Ls_yyyyyy  = L_xyyyyyy*x + L_yyyyyy + L_yyyyyyy*y + L_yyyyyyz*z
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
    Ls_xxxxx   = L_xxxxx + L_xxxxxx*x + L_xxxxxxy*x*y + L_xxxxxxz*x*z + L_xxxxxy*y + &
      L_xxxxxyz*y*z + L_xxxxxz*z + (1.0d0/2.0d0)*(L_xxxxxxx*x**2 + &
      L_xxxxxyy*y**2 + L_xxxxxzz*z**2)
    Ls_xxxxxz  = L_xxxxxxz*x + L_xxxxxyz*y + L_xxxxxz + L_xxxxxzz*z
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    Ls_xxxxy   = L_xxxxxy*x + L_xxxxxyy*x*y + L_xxxxxyz*x*z + L_xxxxy + L_xxxxyy*y + &
      L_xxxxyyz*y*z + L_xxxxyz*z + (1.0d0/2.0d0)*(L_xxxxxxy*x**2 + &
      L_xxxxyyy*y**2 + L_xxxxyzz*z**2)
    Ls_xxxxyz  = L_xxxxxyz*x + L_xxxxyyz*y + L_xxxxyz + L_xxxxyzz*z
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    Ls_xxxx    = L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxyz*x*y*z + L_xxxxxz*x*z + &
      L_xxxxy*y + L_xxxxyz*y*z + L_xxxxz*z + (1.0d0/6.0d0)*(L_xxxxxxx*x &
      **3 + L_xxxxyyy*y**3 + L_xxxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxx* &
      x**2 + L_xxxxxxy*x**2*y + L_xxxxxxz*x**2*z + L_xxxxxyy*x*y**2 + &
      L_xxxxxzz*x*z**2 + L_xxxxyy*y**2 + L_xxxxyyz*y**2*z + L_xxxxyzz*y &
      *z**2 + L_xxxxzz*z**2)
    Ls_xxxxz   = L_xxxxxyz*x*y + L_xxxxxz*x + L_xxxxxzz*x*z + L_xxxxyz*y + L_xxxxyzz*y*z &
      + L_xxxxz + L_xxxxzz*z + (1.0d0/2.0d0)*(L_xxxxxxz*x**2 + &
      L_xxxxyyz*y**2 + L_xxxxzzz*z**2)
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    Ls_xxxyy   = L_xxxxyy*x + L_xxxxyyy*x*y + L_xxxxyyz*x*z + L_xxxyy + L_xxxyyy*y + &
      L_xxxyyyz*y*z + L_xxxyyz*z + (1.0d0/2.0d0)*(L_xxxxxyy*x**2 + &
      L_xxxyyyy*y**2 + L_xxxyyzz*z**2)
    Ls_xxxyyz  = L_xxxxyyz*x + L_xxxyyyz*y + L_xxxyyz + L_xxxyyzz*z
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    Ls_xxxy    = L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyyz*x*y*z + L_xxxxyz*x*z + L_xxxy + &
      L_xxxyy*y + L_xxxyyz*y*z + L_xxxyz*z + (1.0d0/6.0d0)*(L_xxxxxxy*x &
      **3 + L_xxxyyyy*y**3 + L_xxxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxy* &
      x**2 + L_xxxxxyy*x**2*y + L_xxxxxyz*x**2*z + L_xxxxyyy*x*y**2 + &
      L_xxxxyzz*x*z**2 + L_xxxyyy*y**2 + L_xxxyyyz*y**2*z + L_xxxyyzz*y &
      *z**2 + L_xxxyzz*z**2)
    Ls_xxxyz   = L_xxxxyyz*x*y + L_xxxxyz*x + L_xxxxyzz*x*z + L_xxxyyz*y + L_xxxyyzz*y*z &
      + L_xxxyz + L_xxxyzz*z + (1.0d0/2.0d0)*(L_xxxxxyz*x**2 + &
      L_xxxyyyz*y**2 + L_xxxyzzz*z**2)
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    Ls_xxx     = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/24.0d0)*(L_xxxxxxx*x**4 + &
      L_xxxyyyy*y**4 + L_xxxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxxyy*x**2* &
      y**2 + L_xxxxxzz*x**2*z**2 + L_xxxyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxx*x**3 + L_xxxxxxy*x**3*y + L_xxxxxxz*x**3*z + L_xxxxyyy &
      *x*y**3 + L_xxxxzzz*x*z**3 + L_xxxyyy*y**3 + L_xxxyyyz*y**3*z + &
      L_xxxyzzz*y*z**3 + L_xxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxx*x**2 + &
      L_xxxxxy*x**2*y + L_xxxxxyz*x**2*y*z + L_xxxxxz*x**2*z + L_xxxxyy &
      *x*y**2 + L_xxxxyyz*x*y**2*z + L_xxxxyzz*x*y*z**2 + L_xxxxzz*x*z &
      **2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z**2 + L_xxxzz* &
      z**2)
    Ls_xxxz    = L_xxxxyz*x*y + L_xxxxyzz*x*y*z + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + &
      L_xxxyzz*y*z + L_xxxz + L_xxxzz*z + (1.0d0/6.0d0)*(L_xxxxxxz*x**3 &
      + L_xxxyyyz*y**3 + L_xxxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxyz*x** &
      2*y + L_xxxxxz*x**2 + L_xxxxxzz*x**2*z + L_xxxxyyz*x*y**2 + &
      L_xxxxzzz*x*z**2 + L_xxxyyz*y**2 + L_xxxyyzz*y**2*z + L_xxxyzzz*y &
      *z**2 + L_xxxzzz*z**2)
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    Ls_xxyyy   = L_xxxyyy*x + L_xxxyyyy*x*y + L_xxxyyyz*x*z + L_xxyyy + L_xxyyyy*y + &
      L_xxyyyyz*y*z + L_xxyyyz*z + (1.0d0/2.0d0)*(L_xxxxyyy*x**2 + &
      L_xxyyyyy*y**2 + L_xxyyyzz*z**2)
    Ls_xxyyyz  = L_xxxyyyz*x + L_xxyyyyz*y + L_xxyyyz + L_xxyyyzz*z
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    Ls_xxyy    = L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyyz*x*y*z + L_xxxyyz*x*z + L_xxyy + &
      L_xxyyy*y + L_xxyyyz*y*z + L_xxyyz*z + (1.0d0/6.0d0)*(L_xxxxxyy*x &
      **3 + L_xxyyyyy*y**3 + L_xxyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyy* &
      x**2 + L_xxxxyyy*x**2*y + L_xxxxyyz*x**2*z + L_xxxyyyy*x*y**2 + &
      L_xxxyyzz*x*z**2 + L_xxyyyy*y**2 + L_xxyyyyz*y**2*z + L_xxyyyzz*y &
      *z**2 + L_xxyyzz*z**2)
    Ls_xxyyz   = L_xxxyyyz*x*y + L_xxxyyz*x + L_xxxyyzz*x*z + L_xxyyyz*y + L_xxyyyzz*y*z &
      + L_xxyyz + L_xxyyzz*z + (1.0d0/2.0d0)*(L_xxxxyyz*x**2 + &
      L_xxyyyyz*y**2 + L_xxyyzzz*z**2)
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    Ls_xxy     = L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/24.0d0)*(L_xxxxxxy*x**4 + &
      L_xxyyyyy*y**4 + L_xxyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyyy*x**2* &
      y**2 + L_xxxxyzz*x**2*z**2 + L_xxyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxy*x**3 + L_xxxxxyy*x**3*y + L_xxxxxyz*x**3*z + L_xxxyyyy &
      *x*y**3 + L_xxxyzzz*x*z**3 + L_xxyyyy*y**3 + L_xxyyyyz*y**3*z + &
      L_xxyyzzz*y*z**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + &
      L_xxxxyy*x**2*y + L_xxxxyyz*x**2*y*z + L_xxxxyz*x**2*z + L_xxxyyy &
      *x*y**2 + L_xxxyyyz*x*y**2*z + L_xxxyyzz*x*y*z**2 + L_xxxyzz*x*z &
      **2 + L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz* &
      z**2)
    Ls_xxyz    = L_xxxyyz*x*y + L_xxxyyzz*x*y*z + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + &
      L_xxyyzz*y*z + L_xxyz + L_xxyzz*z + (1.0d0/6.0d0)*(L_xxxxxyz*x**3 &
      + L_xxyyyyz*y**3 + L_xxyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyyz*x** &
      2*y + L_xxxxyz*x**2 + L_xxxxyzz*x**2*z + L_xxxyyyz*x*y**2 + &
      L_xxxyzzz*x*z**2 + L_xxyyyz*y**2 + L_xxyyyzz*y**2*z + L_xxyyzzz*y &
      *z**2 + L_xxyzzz*z**2)
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    Ls_xx      = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + &
      L_xxyyyyy*y**5 + L_xxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3 &
      *y**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x**2*y**3 + L_xxxxzzz*x** &
      2*z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x &
      **2*y*z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + &
      L_xxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + L_xxxxyz*x** &
      2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x*y**2*z + &
      L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + L_xxyyz*y**2*z &
      + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxx*x**3 + &
      L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x**3*z + L_xxxyyy &
      *x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 + L_xxxzzz*x*z &
      **3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z**3 + L_xxzzz* &
      z**3)
    Ls_xxz     = L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/24.0d0)*(L_xxxxxxz*x**4 + &
      L_xxyyyyz*y**4 + L_xxzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyyz*x**2* &
      y**2 + L_xxxxzzz*x**2*z**2 + L_xxyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxyz*x**3*y + L_xxxxxz*x**3 + L_xxxxxzz*x**3*z + L_xxxyyyz &
      *x*y**3 + L_xxxzzzz*x*z**3 + L_xxyyyz*y**3 + L_xxyyyzz*y**3*z + &
      L_xxyzzzz*y*z**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2* &
      y + L_xxxxyzz*x**2*y*z + L_xxxxz*x**2 + L_xxxxzz*x**2*z + &
      L_xxxyyz*x*y**2 + L_xxxyyzz*x*y**2*z + L_xxxyzzz*x*y*z**2 + &
      L_xxxzzz*x*z**2 + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z** &
      2 + L_xxzzz*z**2)
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    Ls_xyyyy   = L_xxyyyy*x + L_xxyyyyy*x*y + L_xxyyyyz*x*z + L_xyyyy + L_xyyyyy*y + &
      L_xyyyyyz*y*z + L_xyyyyz*z + (1.0d0/2.0d0)*(L_xxxyyyy*x**2 + &
      L_xyyyyyy*y**2 + L_xyyyyzz*z**2)
    Ls_xyyyyz  = L_xxyyyyz*x + L_xyyyyyz*y + L_xyyyyz + L_xyyyyzz*z
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    Ls_xyyy    = L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyyz*x*y*z + L_xxyyyz*x*z + L_xyyy + &
      L_xyyyy*y + L_xyyyyz*y*z + L_xyyyz*z + (1.0d0/6.0d0)*(L_xxxxyyy*x &
      **3 + L_xyyyyyy*y**3 + L_xyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyy* &
      x**2 + L_xxxyyyy*x**2*y + L_xxxyyyz*x**2*z + L_xxyyyyy*x*y**2 + &
      L_xxyyyzz*x*z**2 + L_xyyyyy*y**2 + L_xyyyyyz*y**2*z + L_xyyyyzz*y &
      *z**2 + L_xyyyzz*z**2)
    Ls_xyyyz   = L_xxyyyyz*x*y + L_xxyyyz*x + L_xxyyyzz*x*z + L_xyyyyz*y + L_xyyyyzz*y*z &
      + L_xyyyz + L_xyyyzz*z + (1.0d0/2.0d0)*(L_xxxyyyz*x**2 + &
      L_xyyyyyz*y**2 + L_xyyyzzz*z**2)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    Ls_xyy     = L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/24.0d0)*(L_xxxxxyy*x**4 + &
      L_xyyyyyy*y**4 + L_xyyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyyy*x**2* &
      y**2 + L_xxxyyzz*x**2*z**2 + L_xyyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxyy*x**3 + L_xxxxyyy*x**3*y + L_xxxxyyz*x**3*z + L_xxyyyyy &
      *x*y**3 + L_xxyyzzz*x*z**3 + L_xyyyyy*y**3 + L_xyyyyyz*y**3*z + &
      L_xyyyzzz*y*z**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + &
      L_xxxyyy*x**2*y + L_xxxyyyz*x**2*y*z + L_xxxyyz*x**2*z + L_xxyyyy &
      *x*y**2 + L_xxyyyyz*x*y**2*z + L_xxyyyzz*x*y*z**2 + L_xxyyzz*x*z &
      **2 + L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz* &
      z**2)
    Ls_xyyz    = L_xxyyyz*x*y + L_xxyyyzz*x*y*z + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + &
      L_xyyyzz*y*z + L_xyyz + L_xyyzz*z + (1.0d0/6.0d0)*(L_xxxxyyz*x**3 &
      + L_xyyyyyz*y**3 + L_xyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyyz*x** &
      2*y + L_xxxyyz*x**2 + L_xxxyyzz*x**2*z + L_xxyyyyz*x*y**2 + &
      L_xxyyzzz*x*z**2 + L_xyyyyz*y**2 + L_xyyyyzz*y**2*z + L_xyyyzzz*y &
      *z**2 + L_xyyzzz*z**2)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    Ls_xy      = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + &
      L_xyyyyyy*y**5 + L_xyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3 &
      *y**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x**2*y**3 + L_xxxyzzz*x** &
      2*z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x &
      **2*y*z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + &
      L_xyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x &
      **4*y + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2)
    Ls_xyz     = L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/24.0d0)*(L_xxxxxyz*x**4 + &
      L_xyyyyyz*y**4 + L_xyzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyyz*x**2* &
      y**2 + L_xxxyzzz*x**2*z**2 + L_xyyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxyyz*x**3*y + L_xxxxyz*x**3 + L_xxxxyzz*x**3*z + L_xxyyyyz &
      *x*y**3 + L_xxyzzzz*x*z**3 + L_xyyyyz*y**3 + L_xyyyyzz*y**3*z + &
      L_xyyzzzz*y*z**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2* &
      y + L_xxxyyzz*x**2*y*z + L_xxxyz*x**2 + L_xxxyzz*x**2*z + &
      L_xxyyyz*x*y**2 + L_xxyyyzz*x*y**2*z + L_xxyyzzz*x*y*z**2 + &
      L_xxyzzz*x*z**2 + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z** &
      2 + L_xyzzz*z**2)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    Ls_x       = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxx*x**6 + L_xyyyyyy*y**6 + L_xzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxzzz*x**3*z**3 + &
      L_xyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyy*x**4*y**2 + &
      L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y**4 + L_xxxzzzz*x**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyy*x**2*y**2 + L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + &
      L_xxxzz*x**2*z**2 + L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxz*x**5 &
      *z + L_xxyyyyy*x*y**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxyz*x**4*y*z + L_xxxxxz*x &
      **4*z + L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 &
      + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z &
      **4 + L_xzzzz*z**4) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + &
      L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z**2 + L_xxxxzz*x**3*z** &
      2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3*z + L_xxxyzzz*x**2*y &
      *z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y**3*z**2 + L_xxyyzzz*x* &
      y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y**2*z**3)
    Ls_xz      = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/120.0d0)*(L_xxxxxxz*x**5 + L_xyyyyyz*y &
      **5 + L_xzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + &
      L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x**2*y**3 + L_xxxzzzz*x**2*z**3 + &
      L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y*z** &
      2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxz*x**4 + &
      L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + L_xxzzzzz*x*z**4 + L_xyyyyz &
      *y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 &
      + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + &
      L_xxyzzzz*x*y*z**3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y &
      **3*z + L_xyzzzz*y*z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz* &
      x**2*y + L_xxxyzz*x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + &
      L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz* &
      x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z &
      **2)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    Ls_yyyyy   = L_xyyyyy*x + L_xyyyyyy*x*y + L_xyyyyyz*x*z + L_yyyyy + L_yyyyyy*y + &
      L_yyyyyyz*y*z + L_yyyyyz*z + (1.0d0/2.0d0)*(L_xxyyyyy*x**2 + &
      L_yyyyyyy*y**2 + L_yyyyyzz*z**2)
    Ls_yyyyyz  = L_xyyyyyz*x + L_yyyyyyz*y + L_yyyyyz + L_yyyyyzz*z
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    Ls_yyyy    = L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyyz*x*y*z + L_xyyyyz*x*z + L_yyyy + &
      L_yyyyy*y + L_yyyyyz*y*z + L_yyyyz*z + (1.0d0/6.0d0)*(L_xxxyyyy*x &
      **3 + L_yyyyyyy*y**3 + L_yyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyy* &
      x**2 + L_xxyyyyy*x**2*y + L_xxyyyyz*x**2*z + L_xyyyyyy*x*y**2 + &
      L_xyyyyzz*x*z**2 + L_yyyyyy*y**2 + L_yyyyyyz*y**2*z + L_yyyyyzz*y &
      *z**2 + L_yyyyzz*z**2)
    Ls_yyyyz   = L_xyyyyyz*x*y + L_xyyyyz*x + L_xyyyyzz*x*z + L_yyyyyz*y + L_yyyyyzz*y*z &
      + L_yyyyz + L_yyyyzz*z + (1.0d0/2.0d0)*(L_xxyyyyz*x**2 + &
      L_yyyyyyz*y**2 + L_yyyyzzz*z**2)
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    Ls_yyy     = L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/24.0d0)*(L_xxxxyyy*x**4 + &
      L_yyyyyyy*y**4 + L_yyyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyyy*x**2* &
      y**2 + L_xxyyyzz*x**2*z**2 + L_yyyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxyyy*x**3 + L_xxxyyyy*x**3*y + L_xxxyyyz*x**3*z + L_xyyyyyy &
      *x*y**3 + L_xyyyzzz*x*z**3 + L_yyyyyy*y**3 + L_yyyyyyz*y**3*z + &
      L_yyyyzzz*y*z**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + &
      L_xxyyyy*x**2*y + L_xxyyyyz*x**2*y*z + L_xxyyyz*x**2*z + L_xyyyyy &
      *x*y**2 + L_xyyyyyz*x*y**2*z + L_xyyyyzz*x*y*z**2 + L_xyyyzz*x*z &
      **2 + L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz* &
      z**2)
    Ls_yyyz    = L_xyyyyz*x*y + L_xyyyyzz*x*y*z + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + &
      L_yyyyzz*y*z + L_yyyz + L_yyyzz*z + (1.0d0/6.0d0)*(L_xxxyyyz*x**3 &
      + L_yyyyyyz*y**3 + L_yyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyyz*x** &
      2*y + L_xxyyyz*x**2 + L_xxyyyzz*x**2*z + L_xyyyyyz*x*y**2 + &
      L_xyyyzzz*x*z**2 + L_yyyyyz*y**2 + L_yyyyyzz*y**2*z + L_yyyyzzz*y &
      *z**2 + L_yyyzzz*z**2)
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    Ls_yy      = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + &
      L_yyyyyyy*y**5 + L_yyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3 &
      *y**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x**2*y**3 + L_xxyyzzz*x** &
      2*z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x &
      **2*y*z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + &
      L_yyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x &
      **4*y + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2)
    Ls_yyz     = L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/24.0d0)*(L_xxxxyyz*x**4 + &
      L_yyyyyyz*y**4 + L_yyzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyyz*x**2* &
      y**2 + L_xxyyzzz*x**2*z**2 + L_yyyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxyyyz*x**3*y + L_xxxyyz*x**3 + L_xxxyyzz*x**3*z + L_xyyyyyz &
      *x*y**3 + L_xyyzzzz*x*z**3 + L_yyyyyz*y**3 + L_yyyyyzz*y**3*z + &
      L_yyyzzzz*y*z**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2* &
      y + L_xxyyyzz*x**2*y*z + L_xxyyz*x**2 + L_xxyyzz*x**2*z + &
      L_xyyyyz*x*y**2 + L_xyyyyzz*x*y**2*z + L_xyyyzzz*x*y*z**2 + &
      L_xyyzzz*x*z**2 + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z** &
      2 + L_yyzzz*z**2)
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    Ls_y       = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxy*x**6 + L_yyyyyyy*y**6 + L_yzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyzzz*x**3*z**3 + &
      L_yyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyy*x**4*y**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyzzzz*x**2*z**4 + &
      L_yyyyyzz*y**4*z**2 + L_yyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyy*x**2*y**2 + L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + &
      L_xxyzz*x**2*z**2 + L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyz*x**5 &
      *z + L_xyyyyyy*x*y**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xyyyyy*x*y**4 + L_xyyyyyz*x*y**4*z + &
      L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y &
      **4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x &
      **3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + &
      L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz* &
      x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y &
      *z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x &
      *y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z &
      **2 + L_yzz*z**2) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3)
    Ls_yz      = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/120.0d0)*(L_xxxxxyz*x**5 + L_yyyyyyz*y &
      **5 + L_yzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + &
      L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x**2*y**3 + L_xxyzzzz*x**2*z**3 + &
      L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y*z** &
      2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyz*x**4 + &
      L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + L_xyzzzzz*x*z**4 + L_yyyyyz &
      *y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 &
      + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + &
      L_xyyzzzz*x*y*z**3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y &
      **3*z + L_yyzzzz*y*z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz* &
      x**2*y + L_xxyyzz*x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + &
      L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz* &
      x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z &
      **2)
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    Ls_0       = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/5040.0d0)*( &
      L_xxxxxxx*x**7 + L_yyyyyyy*y**7 + L_zzzzzzz*z**7) + (1.0d0/ &
      240.0d0)*(L_xxxxxyy*x**5*y**2 + L_xxxxxzz*x**5*z**2 + L_xxyyyyy*x &
      **2*y**5 + L_xxzzzzz*x**2*z**5 + L_yyyyyzz*y**5*z**2 + L_yyzzzzz* &
      y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyy*x**4*y**3 + L_xxxxzzz*x** &
      4*z**3 + L_xxxyyyy*x**3*y**4 + L_xxxzzzz*x**3*z**4 + L_yyyyzzz*y &
      **4*z**3 + L_yyyzzzz*y**3*z**4) + (1.0d0/36.0d0)*(L_xxxyyy*x**3*y &
      **3 + L_xxxyyyz*x**3*y**3*z + L_xxxyzzz*x**3*y*z**3 + L_xxxzzz*x &
      **3*z**3 + L_xyyyzzz*x*y**3*z**3 + L_yyyzzz*y**3*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z + L_xxyzz*x**2*y*z &
      **2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + L_yyzz*y**2*z**2) &
      + (1.0d0/720.0d0)*(L_xxxxxx*x**6 + L_xxxxxxy*x**6*y + L_xxxxxxz*x &
      **6*z + L_xyyyyyy*x*y**6 + L_xzzzzzz*x*z**6 + L_yyyyyy*y**6 + &
      L_yyyyyyz*y**6*z + L_yzzzzzz*y*z**6 + L_zzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z &
      + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 &
      + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z**2) + (1.0d0/ &
      6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z + L_xxxz*x &
      **3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y*z**3 + &
      L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 + &
      L_zzz*z**3) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5*y + &
      L_xxxxxyz*x**5*y*z + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + &
      L_xyyyyyz*x*y**5*z + L_xyzzzzz*x*y*z**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxyyz*x**4*y**2*z + &
      L_xxxxyzz*x**4*y*z**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy*x**2*y**4 + &
      L_xxyyyyz*x**2*y**4*z + L_xxyzzzz*x**2*y*z**4 + L_xxzzzz*x**2*z** &
      4 + L_xyyyyzz*x*y**4*z**2 + L_xyyzzzz*x*y**2*z**4 + L_yyyyzz*y**4 &
      *z**2 + L_yyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + &
      L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + L_xxyzzz*x**2*y*z**3 + &
      L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + L_xyyzzz*x*y**2*z**3 + &
      L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3) + (1.0d0/24.0d0)*(L_xxxx*x &
      **4 + L_xxxxy*x**4*y + L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + &
      L_xxxyyzz*x**3*y**2*z**2 + L_xxyyyzz*x**2*y**3*z**2 + L_xxyyzzz*x &
      **2*y**2*z**3 + L_xyyyy*x*y**4 + L_xyyyyz*x*y**4*z + L_xyzzzz*x*y &
      *z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y &
      *z**4 + L_zzzz*z**4)
    Ls_z       = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxz*x**6 + L_yyyyyyz*y**6 + L_zzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxzzzz*x**3*z**3 + &
      L_yyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyz*x**4*y**2 + &
      L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y**4 + L_xxzzzzz*x**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyz*x**2*y**2 + L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + &
      L_xxzzz*x**2*z**2 + L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxz*x**5 + L_xxxxxzz*x**5 &
      *z + L_xyyyyyz*x*y**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + &
      L_xxxxzz*x**4*z + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z + &
      L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y &
      **4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyyz*x**3*y**2 + L_xxxyyzz*x**3*y**2*z + L_xxxyzzz*x**3*y*z** &
      2 + L_xxxzzz*x**3*z**2 + L_xxyyyz*x**2*y**3 + L_xxyyyzz*x**2*y**3 &
      *z + L_xxyzzzz*x**2*y*z**3 + L_xxzzzz*x**2*z**3 + L_xyyyzzz*x*y** &
      3*z**2 + L_xyyzzzz*x*y**2*z**3 + L_yyyzzz*y**3*z**2 + L_yyzzzz*y &
      **2*z**3) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz*x**3*y*z + &
      L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xyyyzz*x*y**3*z &
      + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 + L_yyyzz*y**3 &
      *z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)*(L_xxyz*x**2*y &
      + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + L_xyyz*x*y**2 + &
      L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z**2 + L_yyz*y**2 &
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
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
    
! OPS  643*ADD + 73*DIV + 1281*MUL + 57*NEG + 783*POW = 2837  (3440 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
    Phi_xx    = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + &
      L_xxyyyyy*y**5 + L_xxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3 &
      *y**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x**2*y**3 + L_xxxxzzz*x** &
      2*z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x &
      **2*y*z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + &
      L_xxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + L_xxxxyz*x** &
      2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x*y**2*z + &
      L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + L_xxyyz*y**2*z &
      + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxx*x**3 + &
      L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x**3*z + L_xxxyyy &
      *x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 + L_xxxzzz*x*z &
      **3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z**3 + L_xxzzz* &
      z**3)
    L_xyyyyzz = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz = -(L_xxxyzzz + L_xyyyzzz)
    Phi_xy    = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + &
      L_xyyyyyy*y**5 + L_xyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3 &
      *y**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x**2*y**3 + L_xxxyzzz*x** &
      2*z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x &
      **2*y*z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + &
      L_xyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x &
      **4*y + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2)
    L_xzzzzzz = -(L_xxxzzzz + L_xyyzzzz)
    Phi_x     = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxx*x**6 + L_xyyyyyy*y**6 + L_xzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxzzz*x**3*z**3 + &
      L_xyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyy*x**4*y**2 + &
      L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y**4 + L_xxxzzzz*x**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyy*x**2*y**2 + L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + &
      L_xxxzz*x**2*z**2 + L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxz*x**5 &
      *z + L_xxyyyyy*x*y**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxyz*x**4*y*z + L_xxxxxz*x &
      **4*z + L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 &
      + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z &
      **4 + L_xzzzz*z**4) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + &
      L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z**2 + L_xxxxzz*x**3*z** &
      2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3*z + L_xxxyzzz*x**2*y &
      *z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y**3*z**2 + L_xxyyzzz*x* &
      y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y**2*z**3)
    Phi_xz    = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/120.0d0)*(L_xxxxxxz*x**5 + L_xyyyyyz*y &
      **5 + L_xzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + &
      L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x**2*y**3 + L_xxxzzzz*x**2*z**3 + &
      L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y*z** &
      2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxz*x**4 + &
      L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + L_xxzzzzz*x*z**4 + L_xyyyyz &
      *y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 &
      + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + &
      L_xxyzzzz*x*y*z**3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y &
      **3*z + L_xyzzzz*y*z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz* &
      x**2*y + L_xxxyzz*x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + &
      L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz* &
      x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z &
      **2)
    L_yyyyyzz = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz = -(L_xxyyzzz + L_yyyyzzz)
    Phi_yy    = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + &
      L_yyyyyyy*y**5 + L_yyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3 &
      *y**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x**2*y**3 + L_xxyyzzz*x** &
      2*z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x &
      **2*y*z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + &
      L_yyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x &
      **4*y + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2)
    Phi_zz    = -(Phi_xx + Phi_yy)
    L_yzzzzzz = -(L_xxyzzzz + L_yyyzzzz)
    Phi_y     = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxy*x**6 + L_yyyyyyy*y**6 + L_yzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyzzz*x**3*z**3 + &
      L_yyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyy*x**4*y**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyzzzz*x**2*z**4 + &
      L_yyyyyzz*y**4*z**2 + L_yyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyy*x**2*y**2 + L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + &
      L_xxyzz*x**2*z**2 + L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyz*x**5 &
      *z + L_xyyyyyy*x*y**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xyyyyy*x*y**4 + L_xyyyyyz*x*y**4*z + &
      L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y &
      **4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x &
      **3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + &
      L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz* &
      x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y &
      *z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x &
      *y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z &
      **2 + L_yzz*z**2) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3)
    Phi_yz    = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/120.0d0)*(L_xxxxxyz*x**5 + L_yyyyyyz*y &
      **5 + L_yzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + &
      L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x**2*y**3 + L_xxyzzzz*x**2*z**3 + &
      L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y*z** &
      2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyz*x**4 + &
      L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + L_xyzzzzz*x*z**4 + L_yyyyyz &
      *y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 &
      + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + &
      L_xyyzzzz*x*y*z**3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y &
      **3*z + L_yyzzzz*y*z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz* &
      x**2*y + L_xxyyzz*x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + &
      L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz* &
      x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z &
      **2)
    L_zzzzzzz = -(L_xxzzzzz + L_yyzzzzz)
    Phi_0     = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/5040.0d0)*( &
      L_xxxxxxx*x**7 + L_yyyyyyy*y**7 + L_zzzzzzz*z**7) + (1.0d0/ &
      240.0d0)*(L_xxxxxyy*x**5*y**2 + L_xxxxxzz*x**5*z**2 + L_xxyyyyy*x &
      **2*y**5 + L_xxzzzzz*x**2*z**5 + L_yyyyyzz*y**5*z**2 + L_yyzzzzz* &
      y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyy*x**4*y**3 + L_xxxxzzz*x** &
      4*z**3 + L_xxxyyyy*x**3*y**4 + L_xxxzzzz*x**3*z**4 + L_yyyyzzz*y &
      **4*z**3 + L_yyyzzzz*y**3*z**4) + (1.0d0/36.0d0)*(L_xxxyyy*x**3*y &
      **3 + L_xxxyyyz*x**3*y**3*z + L_xxxyzzz*x**3*y*z**3 + L_xxxzzz*x &
      **3*z**3 + L_xyyyzzz*x*y**3*z**3 + L_yyyzzz*y**3*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z + L_xxyzz*x**2*y*z &
      **2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + L_yyzz*y**2*z**2) &
      + (1.0d0/720.0d0)*(L_xxxxxx*x**6 + L_xxxxxxy*x**6*y + L_xxxxxxz*x &
      **6*z + L_xyyyyyy*x*y**6 + L_xzzzzzz*x*z**6 + L_yyyyyy*y**6 + &
      L_yyyyyyz*y**6*z + L_yzzzzzz*y*z**6 + L_zzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z &
      + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 &
      + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z**2) + (1.0d0/ &
      6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z + L_xxxz*x &
      **3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y*z**3 + &
      L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 + &
      L_zzz*z**3) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5*y + &
      L_xxxxxyz*x**5*y*z + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + &
      L_xyyyyyz*x*y**5*z + L_xyzzzzz*x*y*z**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxyyz*x**4*y**2*z + &
      L_xxxxyzz*x**4*y*z**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy*x**2*y**4 + &
      L_xxyyyyz*x**2*y**4*z + L_xxyzzzz*x**2*y*z**4 + L_xxzzzz*x**2*z** &
      4 + L_xyyyyzz*x*y**4*z**2 + L_xyyzzzz*x*y**2*z**4 + L_yyyyzz*y**4 &
      *z**2 + L_yyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + &
      L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + L_xxyzzz*x**2*y*z**3 + &
      L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + L_xyyzzz*x*y**2*z**3 + &
      L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3) + (1.0d0/24.0d0)*(L_xxxx*x &
      **4 + L_xxxxy*x**4*y + L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + &
      L_xxxyyzz*x**3*y**2*z**2 + L_xxyyyzz*x**2*y**3*z**2 + L_xxyyzzz*x &
      **2*y**2*z**3 + L_xyyyy*x*y**4 + L_xyyyyz*x*y**4*z + L_xyzzzz*x*y &
      *z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y &
      *z**4 + L_zzzz*z**4)
    Phi_z     = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxz*x**6 + L_yyyyyyz*y**6 + L_zzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxzzzz*x**3*z**3 + &
      L_yyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyz*x**4*y**2 + &
      L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y**4 + L_xxzzzzz*x**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyz*x**2*y**2 + L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + &
      L_xxzzz*x**2*z**2 + L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxz*x**5 + L_xxxxxzz*x**5 &
      *z + L_xyyyyyz*x*y**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + &
      L_xxxxzz*x**4*z + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z + &
      L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y &
      **4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyyz*x**3*y**2 + L_xxxyyzz*x**3*y**2*z + L_xxxyzzz*x**3*y*z** &
      2 + L_xxxzzz*x**3*z**2 + L_xxyyyz*x**2*y**3 + L_xxyyyzz*x**2*y**3 &
      *z + L_xxyzzzz*x**2*y*z**3 + L_xxzzzz*x**2*z**3 + L_xyyyzzz*x*y** &
      3*z**2 + L_xyyzzzz*x*y**2*z**3 + L_yyyzzz*y**3*z**2 + L_yyzzzz*y &
      **2*z**3) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz*x**3*y*z + &
      L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xyyyzz*x*y**3*z &
      + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 + L_yyyzz*y**3 &
      *z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)*(L_xxyz*x**2*y &
      + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + L_xyyz*x*y**2 + &
      L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z**2 + L_yyz*y**2 &
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
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
    
! OPS  1596*ADD + 462*DIV + 2772*MUL + 1386*POW = 6216  (6934 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u
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
    Ms_0       = Ms_0 + (M_0)
    Ms_x       = Ms_x + (M_0*x + M_x)
    Ms_y       = Ms_y + (M_0*y + M_y)
    Ms_z       = Ms_z + (M_0*z + M_z)
    Ms_xx      = Ms_xx + ((1.0d0/2.0d0)*M_0*x**2 + M_x*x + M_xx)
    Ms_xy      = Ms_xy + (M_0*x*y + M_x*y + M_xy + M_y*x)
    Ms_xz      = Ms_xz + (M_0*x*z + M_x*z + M_xz + M_z*x)
    Ms_yy      = Ms_yy + ((1.0d0/2.0d0)*M_0*y**2 + M_y*y + M_yy)
    Ms_yz      = Ms_yz + (M_0*y*z + M_y*z + M_yz + M_z*y)
    Ms_zz      = Ms_zz + ((1.0d0/2.0d0)*M_0*z**2 + M_z*z + M_zz)
    Ms_xxx     = Ms_xxx + ((1.0d0/6.0d0)*M_0*x**3 + (1.0d0/2.0d0)*M_x*x**2 + M_xx*x + M_xxx)
    Ms_xxy     = Ms_xxy + (M_x*x*y + M_xx*y + M_xxy + M_xy*x + (1.0d0/2.0d0)*(M_0*x**2*y + M_y*x**2 &
      ))
    Ms_xxz     = Ms_xxz + (M_x*x*z + M_xx*z + M_xxz + M_xz*x + (1.0d0/2.0d0)*(M_0*x**2*z + M_z*x**2 &
      ))
    Ms_xyy     = Ms_xyy + (M_xy*y + M_xyy + M_y*x*y + M_yy*x + (1.0d0/2.0d0)*(M_0*x*y**2 + M_x*y**2 &
      ))
    Ms_xyz     = Ms_xyz + (M_0*x*y*z + M_x*y*z + M_xy*z + M_xyz + M_xz*y + M_y*x*z + M_yz*x + M_z*x &
      *y)
    Ms_xzz     = Ms_xzz + (M_xz*z + M_xzz + M_z*x*z + M_zz*x + (1.0d0/2.0d0)*(M_0*x*z**2 + M_x*z**2 &
      ))
    Ms_yyy     = Ms_yyy + ((1.0d0/6.0d0)*M_0*y**3 + (1.0d0/2.0d0)*M_y*y**2 + M_yy*y + M_yyy)
    Ms_yyz     = Ms_yyz + (M_y*y*z + M_yy*z + M_yyz + M_yz*y + (1.0d0/2.0d0)*(M_0*y**2*z + M_z*y**2 &
      ))
    Ms_yzz     = Ms_yzz + (M_yz*z + M_yzz + M_z*y*z + M_zz*y + (1.0d0/2.0d0)*(M_0*y*z**2 + M_y*z**2 &
      ))
    Ms_zzz     = Ms_zzz + ((1.0d0/6.0d0)*M_0*z**3 + (1.0d0/2.0d0)*M_z*z**2 + M_zz*z + M_zzz)
    Ms_xxxx    = Ms_xxxx + ((1.0d0/24.0d0)*M_0*x**4 + (1.0d0/6.0d0)*M_x*x**3 + (1.0d0/2.0d0)*M_xx*x &
      **2 + M_xxx*x + M_xxxx)
    Ms_xxxy    = Ms_xxxy + (M_xx*x*y + M_xxx*y + M_xxxy + M_xxy*x + (1.0d0/6.0d0)*(M_0*x**3*y + M_y* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*y + M_xy*x**2))
    Ms_xxxz    = Ms_xxxz + (M_xx*x*z + M_xxx*z + M_xxxz + M_xxz*x + (1.0d0/6.0d0)*(M_0*x**3*z + M_z* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*z + M_xz*x**2))
    Ms_xxyy    = Ms_xxyy + ((1.0d0/4.0d0)*M_0*x**2*y**2 + M_xxy*y + M_xxyy + M_xy*x*y + M_xyy*x + ( &
      1.0d0/2.0d0)*(M_x*x*y**2 + M_xx*y**2 + M_y*x**2*y + M_yy*x**2))
    Ms_xxyz    = Ms_xxyz + (M_x*x*y*z + M_xx*y*z + M_xxy*z + M_xxyz + M_xxz*y + M_xy*x*z + M_xyz*x + &
      M_xz*x*y + (1.0d0/2.0d0)*(M_0*x**2*y*z + M_y*x**2*z + M_yz*x**2 + &
      M_z*x**2*y))
    Ms_xxzz    = Ms_xxzz + ((1.0d0/4.0d0)*M_0*x**2*z**2 + M_xxz*z + M_xxzz + M_xz*x*z + M_xzz*x + ( &
      1.0d0/2.0d0)*(M_x*x*z**2 + M_xx*z**2 + M_z*x**2*z + M_zz*x**2))
    Ms_xyyy    = Ms_xyyy + (M_xyy*y + M_xyyy + M_yy*x*y + M_yyy*x + (1.0d0/2.0d0)*(M_xy*y**2 + M_y*x &
      *y**2) + (1.0d0/6.0d0)*(M_0*x*y**3 + M_x*y**3))
    Ms_xyyz    = Ms_xyyz + (M_xy*y*z + M_xyy*z + M_xyyz + M_xyz*y + M_y*x*y*z + M_yy*x*z + M_yyz*x + &
      M_yz*x*y + (1.0d0/2.0d0)*(M_0*x*y**2*z + M_x*y**2*z + M_xz*y**2 + &
      M_z*x*y**2))
    Ms_xyzz    = Ms_xyzz + (M_xyz*z + M_xyzz + M_xz*y*z + M_xzz*y + M_yz*x*z + M_yzz*x + M_z*x*y*z + &
      M_zz*x*y + (1.0d0/2.0d0)*(M_0*x*y*z**2 + M_x*y*z**2 + M_xy*z**2 + &
      M_y*x*z**2))
    Ms_xzzz    = Ms_xzzz + (M_xzz*z + M_xzzz + M_zz*x*z + M_zzz*x + (1.0d0/2.0d0)*(M_xz*z**2 + M_z*x &
      *z**2) + (1.0d0/6.0d0)*(M_0*x*z**3 + M_x*z**3))
    Ms_yyyy    = Ms_yyyy + ((1.0d0/24.0d0)*M_0*y**4 + (1.0d0/6.0d0)*M_y*y**3 + (1.0d0/2.0d0)*M_yy*y &
      **2 + M_yyy*y + M_yyyy)
    Ms_yyyz    = Ms_yyyz + (M_yy*y*z + M_yyy*z + M_yyyz + M_yyz*y + (1.0d0/6.0d0)*(M_0*y**3*z + M_z* &
      y**3) + (1.0d0/2.0d0)*(M_y*y**2*z + M_yz*y**2))
    Ms_yyzz    = Ms_yyzz + ((1.0d0/4.0d0)*M_0*y**2*z**2 + M_yyz*z + M_yyzz + M_yz*y*z + M_yzz*y + ( &
      1.0d0/2.0d0)*(M_y*y*z**2 + M_yy*z**2 + M_z*y**2*z + M_zz*y**2))
    Ms_yzzz    = Ms_yzzz + (M_yzz*z + M_yzzz + M_zz*y*z + M_zzz*y + (1.0d0/2.0d0)*(M_yz*z**2 + M_z*y &
      *z**2) + (1.0d0/6.0d0)*(M_0*y*z**3 + M_y*z**3))
    Ms_zzzz    = Ms_zzzz + ((1.0d0/24.0d0)*M_0*z**4 + (1.0d0/6.0d0)*M_z*z**3 + (1.0d0/2.0d0)*M_zz*z &
      **2 + M_zzz*z + M_zzzz)
    Ms_xxxxx   = Ms_xxxxx + ((1.0d0/120.0d0)*M_0*x**5 + (1.0d0/24.0d0)*M_x*x**4 + (1.0d0/6.0d0)*M_xx* &
      x**3 + (1.0d0/2.0d0)*M_xxx*x**2 + M_xxxx*x + M_xxxxx)
    Ms_xxxxy   = Ms_xxxxy + (M_xxx*x*y + M_xxxx*y + M_xxxxy + M_xxxy*x + (1.0d0/24.0d0)*(M_0*x**4*y + &
      M_y*x**4) + (1.0d0/6.0d0)*(M_x*x**3*y + M_xy*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*y + M_xxy*x**2))
    Ms_xxxxz   = Ms_xxxxz + (M_xxx*x*z + M_xxxx*z + M_xxxxz + M_xxxz*x + (1.0d0/24.0d0)*(M_0*x**4*z + &
      M_z*x**4) + (1.0d0/6.0d0)*(M_x*x**3*z + M_xz*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*z + M_xxz*x**2))
    Ms_xxxyy   = Ms_xxxyy + ((1.0d0/12.0d0)*M_0*x**3*y**2 + (1.0d0/4.0d0)*M_x*x**2*y**2 + M_xxxy*y + &
      M_xxxyy + M_xxy*x*y + M_xxyy*x + (1.0d0/6.0d0)*(M_y*x**3*y + M_yy &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*y**2 + M_xxx*y**2 + M_xy*x**2*y + &
      M_xyy*x**2))
    Ms_xxxyz   = Ms_xxxyz + (M_xx*x*y*z + M_xxx*y*z + M_xxxy*z + M_xxxyz + M_xxxz*y + M_xxy*x*z + &
      M_xxyz*x + M_xxz*x*y + (1.0d0/6.0d0)*(M_0*x**3*y*z + M_y*x**3*z + &
      M_yz*x**3 + M_z*x**3*y) + (1.0d0/2.0d0)*(M_x*x**2*y*z + M_xy*x**2 &
      *z + M_xyz*x**2 + M_xz*x**2*y))
    Ms_xxxzz   = Ms_xxxzz + ((1.0d0/12.0d0)*M_0*x**3*z**2 + (1.0d0/4.0d0)*M_x*x**2*z**2 + M_xxxz*z + &
      M_xxxzz + M_xxz*x*z + M_xxzz*x + (1.0d0/6.0d0)*(M_z*x**3*z + M_zz &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*z**2 + M_xxx*z**2 + M_xz*x**2*z + &
      M_xzz*x**2))
    Ms_xxyyy   = Ms_xxyyy + ((1.0d0/12.0d0)*M_0*x**2*y**3 + M_xxyy*y + M_xxyyy + M_xyy*x*y + M_xyyy*x &
      + (1.0d0/4.0d0)*M_y*x**2*y**2 + (1.0d0/6.0d0)*(M_x*x*y**3 + M_xx* &
      y**3) + (1.0d0/2.0d0)*(M_xxy*y**2 + M_xy*x*y**2 + M_yy*x**2*y + &
      M_yyy*x**2))
    Ms_xxyyz   = Ms_xxyyz + (M_xxy*y*z + M_xxyy*z + M_xxyyz + M_xxyz*y + M_xy*x*y*z + M_xyy*x*z + &
      M_xyyz*x + M_xyz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y**2*z + M_z*x**2* &
      y**2) + (1.0d0/2.0d0)*(M_x*x*y**2*z + M_xx*y**2*z + M_xxz*y**2 + &
      M_xz*x*y**2 + M_y*x**2*y*z + M_yy*x**2*z + M_yyz*x**2 + M_yz*x**2 &
      *y))
    Ms_xxyzz   = Ms_xxyzz + (M_xxyz*z + M_xxyzz + M_xxz*y*z + M_xxzz*y + M_xyz*x*z + M_xyzz*x + M_xz* &
      x*y*z + M_xzz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y*z**2 + M_y*x**2*z** &
      2) + (1.0d0/2.0d0)*(M_x*x*y*z**2 + M_xx*y*z**2 + M_xxy*z**2 + &
      M_xy*x*z**2 + M_yz*x**2*z + M_yzz*x**2 + M_z*x**2*y*z + M_zz*x**2 &
      *y))
    Ms_xxzzz   = Ms_xxzzz + ((1.0d0/12.0d0)*M_0*x**2*z**3 + M_xxzz*z + M_xxzzz + M_xzz*x*z + M_xzzz*x &
      + (1.0d0/4.0d0)*M_z*x**2*z**2 + (1.0d0/6.0d0)*(M_x*x*z**3 + M_xx* &
      z**3) + (1.0d0/2.0d0)*(M_xxz*z**2 + M_xz*x*z**2 + M_zz*x**2*z + &
      M_zzz*x**2))
    Ms_xyyyy   = Ms_xyyyy + (M_xyyy*y + M_xyyyy + M_yyy*x*y + M_yyyy*x + (1.0d0/6.0d0)*(M_xy*y**3 + &
      M_y*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2 + M_yy*x*y**2) + (1.0d0/ &
      24.0d0)*(M_0*x*y**4 + M_x*y**4))
    Ms_xyyyz   = Ms_xyyyz + (M_xyy*y*z + M_xyyy*z + M_xyyyz + M_xyyz*y + M_yy*x*y*z + M_yyy*x*z + &
      M_yyyz*x + M_yyz*x*y + (1.0d0/2.0d0)*(M_xy*y**2*z + M_xyz*y**2 + &
      M_y*x*y**2*z + M_yz*x*y**2) + (1.0d0/6.0d0)*(M_0*x*y**3*z + M_x*y &
      **3*z + M_xz*y**3 + M_z*x*y**3))
    Ms_xyyzz   = Ms_xyyzz + (M_xyyz*z + M_xyyzz + M_xyz*y*z + M_xyzz*y + M_yyz*x*z + M_yyzz*x + M_yz* &
      x*y*z + M_yzz*x*y + (1.0d0/4.0d0)*(M_0*x*y**2*z**2 + M_x*y**2*z** &
      2) + (1.0d0/2.0d0)*(M_xy*y*z**2 + M_xyy*z**2 + M_xz*y**2*z + &
      M_xzz*y**2 + M_y*x*y*z**2 + M_yy*x*z**2 + M_z*x*y**2*z + M_zz*x*y &
      **2))
    Ms_xyzzz   = Ms_xyzzz + (M_xyzz*z + M_xyzzz + M_xzz*y*z + M_xzzz*y + M_yzz*x*z + M_yzzz*x + M_zz* &
      x*y*z + M_zzz*x*y + (1.0d0/2.0d0)*(M_xyz*z**2 + M_xz*y*z**2 + &
      M_yz*x*z**2 + M_z*x*y*z**2) + (1.0d0/6.0d0)*(M_0*x*y*z**3 + M_x*y &
      *z**3 + M_xy*z**3 + M_y*x*z**3))
    Ms_xzzzz   = Ms_xzzzz + (M_xzzz*z + M_xzzzz + M_zzz*x*z + M_zzzz*x + (1.0d0/6.0d0)*(M_xz*z**3 + &
      M_z*x*z**3) + (1.0d0/2.0d0)*(M_xzz*z**2 + M_zz*x*z**2) + (1.0d0/ &
      24.0d0)*(M_0*x*z**4 + M_x*z**4))
    Ms_yyyyy   = Ms_yyyyy + ((1.0d0/120.0d0)*M_0*y**5 + (1.0d0/24.0d0)*M_y*y**4 + (1.0d0/6.0d0)*M_yy* &
      y**3 + (1.0d0/2.0d0)*M_yyy*y**2 + M_yyyy*y + M_yyyyy)
    Ms_yyyyz   = Ms_yyyyz + (M_yyy*y*z + M_yyyy*z + M_yyyyz + M_yyyz*y + (1.0d0/24.0d0)*(M_0*y**4*z + &
      M_z*y**4) + (1.0d0/6.0d0)*(M_y*y**3*z + M_yz*y**3) + (1.0d0/2.0d0 &
      )*(M_yy*y**2*z + M_yyz*y**2))
    Ms_yyyzz   = Ms_yyyzz + ((1.0d0/12.0d0)*M_0*y**3*z**2 + (1.0d0/4.0d0)*M_y*y**2*z**2 + M_yyyz*z + &
      M_yyyzz + M_yyz*y*z + M_yyzz*y + (1.0d0/6.0d0)*(M_z*y**3*z + M_zz &
      *y**3) + (1.0d0/2.0d0)*(M_yy*y*z**2 + M_yyy*z**2 + M_yz*y**2*z + &
      M_yzz*y**2))
    Ms_yyzzz   = Ms_yyzzz + ((1.0d0/12.0d0)*M_0*y**2*z**3 + M_yyzz*z + M_yyzzz + M_yzz*y*z + M_yzzz*y &
      + (1.0d0/4.0d0)*M_z*y**2*z**2 + (1.0d0/6.0d0)*(M_y*y*z**3 + M_yy* &
      z**3) + (1.0d0/2.0d0)*(M_yyz*z**2 + M_yz*y*z**2 + M_zz*y**2*z + &
      M_zzz*y**2))
    Ms_yzzzz   = Ms_yzzzz + (M_yzzz*z + M_yzzzz + M_zzz*y*z + M_zzzz*y + (1.0d0/6.0d0)*(M_yz*z**3 + &
      M_z*y*z**3) + (1.0d0/2.0d0)*(M_yzz*z**2 + M_zz*y*z**2) + (1.0d0/ &
      24.0d0)*(M_0*y*z**4 + M_y*z**4))
    Ms_zzzzz   = Ms_zzzzz + ((1.0d0/120.0d0)*M_0*z**5 + (1.0d0/24.0d0)*M_z*z**4 + (1.0d0/6.0d0)*M_zz* &
      z**3 + (1.0d0/2.0d0)*M_zzz*z**2 + M_zzzz*z + M_zzzzz)
    Ms_xxxxxx  = Ms_xxxxxx + ((1.0d0/720.0d0)*M_0*x**6 + (1.0d0/120.0d0)*M_x*x**5 + (1.0d0/24.0d0)* &
      M_xx*x**4 + (1.0d0/6.0d0)*M_xxx*x**3 + (1.0d0/2.0d0)*M_xxxx*x**2 &
      + M_xxxxx*x + M_xxxxxx)
    Ms_xxxxxy  = Ms_xxxxxy + (M_xxxx*x*y + M_xxxxx*y + M_xxxxxy + M_xxxxy*x + (1.0d0/120.0d0)*(M_0*x** &
      5*y + M_y*x**5) + (1.0d0/24.0d0)*(M_x*x**4*y + M_xy*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*y + M_xxy*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*y + M_xxxy*x**2))
    Ms_xxxxxz  = Ms_xxxxxz + (M_xxxx*x*z + M_xxxxx*z + M_xxxxxz + M_xxxxz*x + (1.0d0/120.0d0)*(M_0*x** &
      5*z + M_z*x**5) + (1.0d0/24.0d0)*(M_x*x**4*z + M_xz*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*z + M_xxz*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*z + M_xxxz*x**2))
    Ms_xxxxyy  = Ms_xxxxyy + ((1.0d0/48.0d0)*M_0*x**4*y**2 + (1.0d0/12.0d0)*M_x*x**3*y**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*y**2 + M_xxxxy*y + M_xxxxyy + M_xxxy*x*y + &
      M_xxxyy*x + (1.0d0/6.0d0)*(M_xy*x**3*y + M_xyy*x**3) + (1.0d0/ &
      24.0d0)*(M_y*x**4*y + M_yy*x**4) + (1.0d0/2.0d0)*(M_xxx*x*y**2 + &
      M_xxxx*y**2 + M_xxy*x**2*y + M_xxyy*x**2))
    Ms_xxxxyz  = Ms_xxxxyz + (M_xxx*x*y*z + M_xxxx*y*z + M_xxxxy*z + M_xxxxyz + M_xxxxz*y + M_xxxy*x*z &
      + M_xxxyz*x + M_xxxz*x*y + (1.0d0/24.0d0)*(M_0*x**4*y*z + M_y*x** &
      4*z + M_yz*x**4 + M_z*x**4*y) + (1.0d0/6.0d0)*(M_x*x**3*y*z + &
      M_xy*x**3*z + M_xyz*x**3 + M_xz*x**3*y) + (1.0d0/2.0d0)*(M_xx*x** &
      2*y*z + M_xxy*x**2*z + M_xxyz*x**2 + M_xxz*x**2*y))
    Ms_xxxxzz  = Ms_xxxxzz + ((1.0d0/48.0d0)*M_0*x**4*z**2 + (1.0d0/12.0d0)*M_x*x**3*z**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*z**2 + M_xxxxz*z + M_xxxxzz + M_xxxz*x*z + &
      M_xxxzz*x + (1.0d0/6.0d0)*(M_xz*x**3*z + M_xzz*x**3) + (1.0d0/ &
      24.0d0)*(M_z*x**4*z + M_zz*x**4) + (1.0d0/2.0d0)*(M_xxx*x*z**2 + &
      M_xxxx*z**2 + M_xxz*x**2*z + M_xxzz*x**2))
    Ms_xxxyyy  = Ms_xxxyyy + ((1.0d0/36.0d0)*M_0*x**3*y**3 + M_xxxyy*y + M_xxxyyy + M_xxyy*x*y + &
      M_xxyyy*x + (1.0d0/4.0d0)*M_xy*x**2*y**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*y**3 + M_y*x**3*y**2) + (1.0d0/2.0d0)*(M_xxxy*y**2 + M_xxy*x* &
      y**2 + M_xyy*x**2*y + M_xyyy*x**2) + (1.0d0/6.0d0)*(M_xx*x*y**3 + &
      M_xxx*y**3 + M_yy*x**3*y + M_yyy*x**3))
    Ms_xxxyyz  = Ms_xxxyyz + (M_xxxy*y*z + M_xxxyy*z + M_xxxyyz + M_xxxyz*y + M_xxy*x*y*z + M_xxyy*x*z &
      + M_xxyyz*x + M_xxyz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y**2*z + M_z* &
      x**3*y**2) + (1.0d0/4.0d0)*(M_x*x**2*y**2*z + M_xz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_y*x**3*y*z + M_yy*x**3*z + M_yyz*x**3 + M_yz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y**2*z + M_xxx*y**2*z + M_xxxz*y**2 + &
      M_xxz*x*y**2 + M_xy*x**2*y*z + M_xyy*x**2*z + M_xyyz*x**2 + M_xyz &
      *x**2*y))
    Ms_xxxyzz  = Ms_xxxyzz + (M_xxxyz*z + M_xxxyzz + M_xxxz*y*z + M_xxxzz*y + M_xxyz*x*z + M_xxyzz*x + &
      M_xxz*x*y*z + M_xxzz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y*z**2 + M_y* &
      x**3*z**2) + (1.0d0/4.0d0)*(M_x*x**2*y*z**2 + M_xy*x**2*z**2) + ( &
      1.0d0/6.0d0)*(M_yz*x**3*z + M_yzz*x**3 + M_z*x**3*y*z + M_zz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y*z**2 + M_xxx*y*z**2 + M_xxxy*z**2 + &
      M_xxy*x*z**2 + M_xyz*x**2*z + M_xyzz*x**2 + M_xz*x**2*y*z + M_xzz &
      *x**2*y))
    Ms_xxxzzz  = Ms_xxxzzz + ((1.0d0/36.0d0)*M_0*x**3*z**3 + M_xxxzz*z + M_xxxzzz + M_xxzz*x*z + &
      M_xxzzz*x + (1.0d0/4.0d0)*M_xz*x**2*z**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*z**3 + M_z*x**3*z**2) + (1.0d0/2.0d0)*(M_xxxz*z**2 + M_xxz*x* &
      z**2 + M_xzz*x**2*z + M_xzzz*x**2) + (1.0d0/6.0d0)*(M_xx*x*z**3 + &
      M_xxx*z**3 + M_zz*x**3*z + M_zzz*x**3))
    Ms_xxyyyy  = Ms_xxyyyy + ((1.0d0/48.0d0)*M_0*x**2*y**4 + M_xxyyy*y + M_xxyyyy + M_xyyy*x*y + &
      M_xyyyy*x + (1.0d0/12.0d0)*M_y*x**2*y**3 + (1.0d0/4.0d0)*M_yy*x** &
      2*y**2 + (1.0d0/6.0d0)*(M_xxy*y**3 + M_xy*x*y**3) + (1.0d0/24.0d0 &
      )*(M_x*x*y**4 + M_xx*y**4) + (1.0d0/2.0d0)*(M_xxyy*y**2 + M_xyy*x &
      *y**2 + M_yyy*x**2*y + M_yyyy*x**2))
    Ms_xxyyyz  = Ms_xxyyyz + (M_xxyy*y*z + M_xxyyy*z + M_xxyyyz + M_xxyyz*y + M_xyy*x*y*z + M_xyyy*x*z &
      + M_xyyyz*x + M_xyyz*x*y + (1.0d0/12.0d0)*(M_0*x**2*y**3*z + M_z* &
      x**2*y**3) + (1.0d0/4.0d0)*(M_y*x**2*y**2*z + M_yz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_x*x*y**3*z + M_xx*y**3*z + M_xxz*y**3 + M_xz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xxy*y**2*z + M_xxyz*y**2 + M_xy*x*y**2*z &
      + M_xyz*x*y**2 + M_yy*x**2*y*z + M_yyy*x**2*z + M_yyyz*x**2 + &
      M_yyz*x**2*y))
    Ms_xxyyzz  = Ms_xxyyzz + ((1.0d0/8.0d0)*M_0*x**2*y**2*z**2 + M_xxyyz*z + M_xxyyzz + M_xxyz*y*z + &
      M_xxyzz*y + M_xyyz*x*z + M_xyyzz*x + M_xyz*x*y*z + M_xyzz*x*y + ( &
      1.0d0/4.0d0)*(M_x*x*y**2*z**2 + M_xx*y**2*z**2 + M_y*x**2*y*z**2 &
      + M_yy*x**2*z**2 + M_z*x**2*y**2*z + M_zz*x**2*y**2) + (1.0d0/ &
      2.0d0)*(M_xxy*y*z**2 + M_xxyy*z**2 + M_xxz*y**2*z + M_xxzz*y**2 + &
      M_xy*x*y*z**2 + M_xyy*x*z**2 + M_xz*x*y**2*z + M_xzz*x*y**2 + &
      M_yyz*x**2*z + M_yyzz*x**2 + M_yz*x**2*y*z + M_yzz*x**2*y))
    Ms_xxyzzz  = Ms_xxyzzz + (M_xxyzz*z + M_xxyzzz + M_xxzz*y*z + M_xxzzz*y + M_xyzz*x*z + M_xyzzz*x + &
      M_xzz*x*y*z + M_xzzz*x*y + (1.0d0/4.0d0)*(M_yz*x**2*z**2 + M_z*x &
      **2*y*z**2) + (1.0d0/12.0d0)*(M_0*x**2*y*z**3 + M_y*x**2*z**3) + &
      (1.0d0/6.0d0)*(M_x*x*y*z**3 + M_xx*y*z**3 + M_xxy*z**3 + M_xy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xxyz*z**2 + M_xxz*y*z**2 + M_xyz*x*z**2 + &
      M_xz*x*y*z**2 + M_yzz*x**2*z + M_yzzz*x**2 + M_zz*x**2*y*z + &
      M_zzz*x**2*y))
    Ms_xxzzzz  = Ms_xxzzzz + ((1.0d0/48.0d0)*M_0*x**2*z**4 + M_xxzzz*z + M_xxzzzz + M_xzzz*x*z + &
      M_xzzzz*x + (1.0d0/12.0d0)*M_z*x**2*z**3 + (1.0d0/4.0d0)*M_zz*x** &
      2*z**2 + (1.0d0/6.0d0)*(M_xxz*z**3 + M_xz*x*z**3) + (1.0d0/24.0d0 &
      )*(M_x*x*z**4 + M_xx*z**4) + (1.0d0/2.0d0)*(M_xxzz*z**2 + M_xzz*x &
      *z**2 + M_zzz*x**2*z + M_zzzz*x**2))
    Ms_xyyyyy  = Ms_xyyyyy + (M_xyyyy*y + M_xyyyyy + M_yyyy*x*y + M_yyyyy*x + (1.0d0/24.0d0)*(M_xy*y** &
      4 + M_y*x*y**4) + (1.0d0/6.0d0)*(M_xyy*y**3 + M_yy*x*y**3) + ( &
      1.0d0/2.0d0)*(M_xyyy*y**2 + M_yyy*x*y**2) + (1.0d0/120.0d0)*(M_0* &
      x*y**5 + M_x*y**5))
    Ms_xyyyyz  = Ms_xyyyyz + (M_xyyy*y*z + M_xyyyy*z + M_xyyyyz + M_xyyyz*y + M_yyy*x*y*z + M_yyyy*x*z &
      + M_yyyyz*x + M_yyyz*x*y + (1.0d0/6.0d0)*(M_xy*y**3*z + M_xyz*y** &
      3 + M_y*x*y**3*z + M_yz*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2*z + &
      M_xyyz*y**2 + M_yy*x*y**2*z + M_yyz*x*y**2) + (1.0d0/24.0d0)*(M_0 &
      *x*y**4*z + M_x*y**4*z + M_xz*y**4 + M_z*x*y**4))
    Ms_xyyyzz  = Ms_xyyyzz + (M_xyyyz*z + M_xyyyzz + M_xyyz*y*z + M_xyyzz*y + M_yyyz*x*z + M_yyyzz*x + &
      M_yyz*x*y*z + M_yyzz*x*y + (1.0d0/4.0d0)*(M_xy*y**2*z**2 + M_y*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**3*z**2 + M_x*y**3*z**2) + ( &
      1.0d0/6.0d0)*(M_xz*y**3*z + M_xzz*y**3 + M_z*x*y**3*z + M_zz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xyy*y*z**2 + M_xyyy*z**2 + M_xyz*y**2*z + &
      M_xyzz*y**2 + M_yy*x*y*z**2 + M_yyy*x*z**2 + M_yz*x*y**2*z + &
      M_yzz*x*y**2))
    Ms_xyyzzz  = Ms_xyyzzz + (M_xyyzz*z + M_xyyzzz + M_xyzz*y*z + M_xyzzz*y + M_yyzz*x*z + M_yyzzz*x + &
      M_yzz*x*y*z + M_yzzz*x*y + (1.0d0/4.0d0)*(M_xz*y**2*z**2 + M_z*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**2*z**3 + M_x*y**2*z**3) + ( &
      1.0d0/6.0d0)*(M_xy*y*z**3 + M_xyy*z**3 + M_y*x*y*z**3 + M_yy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xyyz*z**2 + M_xyz*y*z**2 + M_xzz*y**2*z + &
      M_xzzz*y**2 + M_yyz*x*z**2 + M_yz*x*y*z**2 + M_zz*x*y**2*z + &
      M_zzz*x*y**2))
    Ms_xyzzzz  = Ms_xyzzzz + (M_xyzzz*z + M_xyzzzz + M_xzzz*y*z + M_xzzzz*y + M_yzzz*x*z + M_yzzzz*x + &
      M_zzz*x*y*z + M_zzzz*x*y + (1.0d0/6.0d0)*(M_xyz*z**3 + M_xz*y*z** &
      3 + M_yz*x*z**3 + M_z*x*y*z**3) + (1.0d0/2.0d0)*(M_xyzz*z**2 + &
      M_xzz*y*z**2 + M_yzz*x*z**2 + M_zz*x*y*z**2) + (1.0d0/24.0d0)*( &
      M_0*x*y*z**4 + M_x*y*z**4 + M_xy*z**4 + M_y*x*z**4))
    Ms_xzzzzz  = Ms_xzzzzz + (M_xzzzz*z + M_xzzzzz + M_zzzz*x*z + M_zzzzz*x + (1.0d0/24.0d0)*(M_xz*z** &
      4 + M_z*x*z**4) + (1.0d0/6.0d0)*(M_xzz*z**3 + M_zz*x*z**3) + ( &
      1.0d0/2.0d0)*(M_xzzz*z**2 + M_zzz*x*z**2) + (1.0d0/120.0d0)*(M_0* &
      x*z**5 + M_x*z**5))
    Ms_yyyyyy  = Ms_yyyyyy + ((1.0d0/720.0d0)*M_0*y**6 + (1.0d0/120.0d0)*M_y*y**5 + (1.0d0/24.0d0)* &
      M_yy*y**4 + (1.0d0/6.0d0)*M_yyy*y**3 + (1.0d0/2.0d0)*M_yyyy*y**2 &
      + M_yyyyy*y + M_yyyyyy)
    Ms_yyyyyz  = Ms_yyyyyz + (M_yyyy*y*z + M_yyyyy*z + M_yyyyyz + M_yyyyz*y + (1.0d0/120.0d0)*(M_0*y** &
      5*z + M_z*y**5) + (1.0d0/24.0d0)*(M_y*y**4*z + M_yz*y**4) + ( &
      1.0d0/6.0d0)*(M_yy*y**3*z + M_yyz*y**3) + (1.0d0/2.0d0)*(M_yyy*y &
      **2*z + M_yyyz*y**2))
    Ms_yyyyzz  = Ms_yyyyzz + ((1.0d0/48.0d0)*M_0*y**4*z**2 + (1.0d0/12.0d0)*M_y*y**3*z**2 + (1.0d0/ &
      4.0d0)*M_yy*y**2*z**2 + M_yyyyz*z + M_yyyyzz + M_yyyz*y*z + &
      M_yyyzz*y + (1.0d0/6.0d0)*(M_yz*y**3*z + M_yzz*y**3) + (1.0d0/ &
      24.0d0)*(M_z*y**4*z + M_zz*y**4) + (1.0d0/2.0d0)*(M_yyy*y*z**2 + &
      M_yyyy*z**2 + M_yyz*y**2*z + M_yyzz*y**2))
    Ms_yyyzzz  = Ms_yyyzzz + ((1.0d0/36.0d0)*M_0*y**3*z**3 + M_yyyzz*z + M_yyyzzz + M_yyzz*y*z + &
      M_yyzzz*y + (1.0d0/4.0d0)*M_yz*y**2*z**2 + (1.0d0/12.0d0)*(M_y*y &
      **2*z**3 + M_z*y**3*z**2) + (1.0d0/2.0d0)*(M_yyyz*z**2 + M_yyz*y* &
      z**2 + M_yzz*y**2*z + M_yzzz*y**2) + (1.0d0/6.0d0)*(M_yy*y*z**3 + &
      M_yyy*z**3 + M_zz*y**3*z + M_zzz*y**3))
    Ms_yyzzzz  = Ms_yyzzzz + ((1.0d0/48.0d0)*M_0*y**2*z**4 + M_yyzzz*z + M_yyzzzz + M_yzzz*y*z + &
      M_yzzzz*y + (1.0d0/12.0d0)*M_z*y**2*z**3 + (1.0d0/4.0d0)*M_zz*y** &
      2*z**2 + (1.0d0/6.0d0)*(M_yyz*z**3 + M_yz*y*z**3) + (1.0d0/24.0d0 &
      )*(M_y*y*z**4 + M_yy*z**4) + (1.0d0/2.0d0)*(M_yyzz*z**2 + M_yzz*y &
      *z**2 + M_zzz*y**2*z + M_zzzz*y**2))
    Ms_yzzzzz  = Ms_yzzzzz + (M_yzzzz*z + M_yzzzzz + M_zzzz*y*z + M_zzzzz*y + (1.0d0/24.0d0)*(M_yz*z** &
      4 + M_z*y*z**4) + (1.0d0/6.0d0)*(M_yzz*z**3 + M_zz*y*z**3) + ( &
      1.0d0/2.0d0)*(M_yzzz*z**2 + M_zzz*y*z**2) + (1.0d0/120.0d0)*(M_0* &
      y*z**5 + M_y*z**5))
    Ms_zzzzzz  = Ms_zzzzzz + ((1.0d0/720.0d0)*M_0*z**6 + (1.0d0/120.0d0)*M_z*z**5 + (1.0d0/24.0d0)* &
      M_zz*z**4 + (1.0d0/6.0d0)*M_zzz*z**3 + (1.0d0/2.0d0)*M_zzzz*z**2 &
      + M_zzzzz*z + M_zzzzzz)
    Ms_xxxxxxx = Ms_xxxxxxx + ((1.0d0/5040.0d0)*M_0*x**7 + (1.0d0/720.0d0)*M_x*x**6 + (1.0d0/120.0d0)* &
      M_xx*x**5 + (1.0d0/24.0d0)*M_xxx*x**4 + (1.0d0/6.0d0)*M_xxxx*x**3 &
      + (1.0d0/2.0d0)*M_xxxxx*x**2 + M_xxxxxx*x + M_xxxxxxx)
    Ms_xxxxxxy = Ms_xxxxxxy + (M_xxxxx*x*y + M_xxxxxx*y + M_xxxxxxy + M_xxxxxy*x + (1.0d0/720.0d0)*(M_0 &
      *x**6*y + M_y*x**6) + (1.0d0/120.0d0)*(M_x*x**5*y + M_xy*x**5) + &
      (1.0d0/24.0d0)*(M_xx*x**4*y + M_xxy*x**4) + (1.0d0/6.0d0)*(M_xxx* &
      x**3*y + M_xxxy*x**3) + (1.0d0/2.0d0)*(M_xxxx*x**2*y + M_xxxxy*x &
      **2))
    Ms_xxxxxxz = Ms_xxxxxxz + (M_xxxxx*x*z + M_xxxxxx*z + M_xxxxxxz + M_xxxxxz*x + (1.0d0/720.0d0)*(M_0 &
      *x**6*z + M_z*x**6) + (1.0d0/120.0d0)*(M_x*x**5*z + M_xz*x**5) + &
      (1.0d0/24.0d0)*(M_xx*x**4*z + M_xxz*x**4) + (1.0d0/6.0d0)*(M_xxx* &
      x**3*z + M_xxxz*x**3) + (1.0d0/2.0d0)*(M_xxxx*x**2*z + M_xxxxz*x &
      **2))
    Ms_xxxxxyy = Ms_xxxxxyy + ((1.0d0/240.0d0)*M_0*x**5*y**2 + (1.0d0/48.0d0)*M_x*x**4*y**2 + (1.0d0/ &
      12.0d0)*M_xx*x**3*y**2 + (1.0d0/4.0d0)*M_xxx*x**2*y**2 + M_xxxxxy &
      *y + M_xxxxxyy + M_xxxxy*x*y + M_xxxxyy*x + (1.0d0/6.0d0)*(M_xxy* &
      x**3*y + M_xxyy*x**3) + (1.0d0/24.0d0)*(M_xy*x**4*y + M_xyy*x**4 &
      ) + (1.0d0/120.0d0)*(M_y*x**5*y + M_yy*x**5) + (1.0d0/2.0d0)*( &
      M_xxxx*x*y**2 + M_xxxxx*y**2 + M_xxxy*x**2*y + M_xxxyy*x**2))
    Ms_xxxxxyz = Ms_xxxxxyz + (M_xxxx*x*y*z + M_xxxxx*y*z + M_xxxxxy*z + M_xxxxxyz + M_xxxxxz*y + &
      M_xxxxy*x*z + M_xxxxyz*x + M_xxxxz*x*y + (1.0d0/120.0d0)*(M_0*x** &
      5*y*z + M_y*x**5*z + M_yz*x**5 + M_z*x**5*y) + (1.0d0/24.0d0)*( &
      M_x*x**4*y*z + M_xy*x**4*z + M_xyz*x**4 + M_xz*x**4*y) + (1.0d0/ &
      6.0d0)*(M_xx*x**3*y*z + M_xxy*x**3*z + M_xxyz*x**3 + M_xxz*x**3*y &
      ) + (1.0d0/2.0d0)*(M_xxx*x**2*y*z + M_xxxy*x**2*z + M_xxxyz*x**2 &
      + M_xxxz*x**2*y))
    Ms_xxxxxzz = Ms_xxxxxzz + ((1.0d0/240.0d0)*M_0*x**5*z**2 + (1.0d0/48.0d0)*M_x*x**4*z**2 + (1.0d0/ &
      12.0d0)*M_xx*x**3*z**2 + (1.0d0/4.0d0)*M_xxx*x**2*z**2 + M_xxxxxz &
      *z + M_xxxxxzz + M_xxxxz*x*z + M_xxxxzz*x + (1.0d0/6.0d0)*(M_xxz* &
      x**3*z + M_xxzz*x**3) + (1.0d0/24.0d0)*(M_xz*x**4*z + M_xzz*x**4 &
      ) + (1.0d0/120.0d0)*(M_z*x**5*z + M_zz*x**5) + (1.0d0/2.0d0)*( &
      M_xxxx*x*z**2 + M_xxxxx*z**2 + M_xxxz*x**2*z + M_xxxzz*x**2))
    Ms_xxxxyyy = Ms_xxxxyyy + ((1.0d0/144.0d0)*M_0*x**4*y**3 + (1.0d0/36.0d0)*M_x*x**3*y**3 + M_xxxxyy* &
      y + M_xxxxyyy + M_xxxyy*x*y + M_xxxyyy*x + (1.0d0/4.0d0)*M_xxy*x &
      **2*y**2 + (1.0d0/48.0d0)*M_y*x**4*y**2 + (1.0d0/12.0d0)*(M_xx*x &
      **2*y**3 + M_xy*x**3*y**2) + (1.0d0/24.0d0)*(M_yy*x**4*y + M_yyy* &
      x**4) + (1.0d0/2.0d0)*(M_xxxxy*y**2 + M_xxxy*x*y**2 + M_xxyy*x**2 &
      *y + M_xxyyy*x**2) + (1.0d0/6.0d0)*(M_xxx*x*y**3 + M_xxxx*y**3 + &
      M_xyy*x**3*y + M_xyyy*x**3))
    Ms_xxxxyyz = Ms_xxxxyyz + (M_xxxxy*y*z + M_xxxxyy*z + M_xxxxyyz + M_xxxxyz*y + M_xxxy*x*y*z + &
      M_xxxyy*x*z + M_xxxyyz*x + M_xxxyz*x*y + (1.0d0/48.0d0)*(M_0*x**4 &
      *y**2*z + M_z*x**4*y**2) + (1.0d0/12.0d0)*(M_x*x**3*y**2*z + M_xz &
      *x**3*y**2) + (1.0d0/4.0d0)*(M_xx*x**2*y**2*z + M_xxz*x**2*y**2) &
      + (1.0d0/6.0d0)*(M_xy*x**3*y*z + M_xyy*x**3*z + M_xyyz*x**3 + &
      M_xyz*x**3*y) + (1.0d0/24.0d0)*(M_y*x**4*y*z + M_yy*x**4*z + &
      M_yyz*x**4 + M_yz*x**4*y) + (1.0d0/2.0d0)*(M_xxx*x*y**2*z + &
      M_xxxx*y**2*z + M_xxxxz*y**2 + M_xxxz*x*y**2 + M_xxy*x**2*y*z + &
      M_xxyy*x**2*z + M_xxyyz*x**2 + M_xxyz*x**2*y))
    Ms_xxxxyzz = Ms_xxxxyzz + (M_xxxxyz*z + M_xxxxyzz + M_xxxxz*y*z + M_xxxxzz*y + M_xxxyz*x*z + &
      M_xxxyzz*x + M_xxxz*x*y*z + M_xxxzz*x*y + (1.0d0/48.0d0)*(M_0*x** &
      4*y*z**2 + M_y*x**4*z**2) + (1.0d0/12.0d0)*(M_x*x**3*y*z**2 + &
      M_xy*x**3*z**2) + (1.0d0/4.0d0)*(M_xx*x**2*y*z**2 + M_xxy*x**2*z &
      **2) + (1.0d0/6.0d0)*(M_xyz*x**3*z + M_xyzz*x**3 + M_xz*x**3*y*z &
      + M_xzz*x**3*y) + (1.0d0/24.0d0)*(M_yz*x**4*z + M_yzz*x**4 + M_z* &
      x**4*y*z + M_zz*x**4*y) + (1.0d0/2.0d0)*(M_xxx*x*y*z**2 + M_xxxx* &
      y*z**2 + M_xxxxy*z**2 + M_xxxy*x*z**2 + M_xxyz*x**2*z + M_xxyzz*x &
      **2 + M_xxz*x**2*y*z + M_xxzz*x**2*y))
    Ms_xxxxzzz = Ms_xxxxzzz + ((1.0d0/144.0d0)*M_0*x**4*z**3 + (1.0d0/36.0d0)*M_x*x**3*z**3 + M_xxxxzz* &
      z + M_xxxxzzz + M_xxxzz*x*z + M_xxxzzz*x + (1.0d0/4.0d0)*M_xxz*x &
      **2*z**2 + (1.0d0/48.0d0)*M_z*x**4*z**2 + (1.0d0/12.0d0)*(M_xx*x &
      **2*z**3 + M_xz*x**3*z**2) + (1.0d0/24.0d0)*(M_zz*x**4*z + M_zzz* &
      x**4) + (1.0d0/2.0d0)*(M_xxxxz*z**2 + M_xxxz*x*z**2 + M_xxzz*x**2 &
      *z + M_xxzzz*x**2) + (1.0d0/6.0d0)*(M_xxx*x*z**3 + M_xxxx*z**3 + &
      M_xzz*x**3*z + M_xzzz*x**3))
    Ms_xxxyyyy = Ms_xxxyyyy + ((1.0d0/144.0d0)*M_0*x**3*y**4 + (1.0d0/48.0d0)*M_x*x**2*y**4 + M_xxxyyy* &
      y + M_xxxyyyy + M_xxyyy*x*y + M_xxyyyy*x + (1.0d0/4.0d0)*M_xyy*x &
      **2*y**2 + (1.0d0/36.0d0)*M_y*x**3*y**3 + (1.0d0/24.0d0)*(M_xx*x* &
      y**4 + M_xxx*y**4) + (1.0d0/12.0d0)*(M_xy*x**2*y**3 + M_yy*x**3*y &
      **2) + (1.0d0/6.0d0)*(M_xxxy*y**3 + M_xxy*x*y**3 + M_yyy*x**3*y + &
      M_yyyy*x**3) + (1.0d0/2.0d0)*(M_xxxyy*y**2 + M_xxyy*x*y**2 + &
      M_xyyy*x**2*y + M_xyyyy*x**2))
    Ms_xxxyyyz = Ms_xxxyyyz + (M_xxxyy*y*z + M_xxxyyy*z + M_xxxyyyz + M_xxxyyz*y + M_xxyy*x*y*z + &
      M_xxyyy*x*z + M_xxyyyz*x + M_xxyyz*x*y + (1.0d0/36.0d0)*(M_0*x**3 &
      *y**3*z + M_z*x**3*y**3) + (1.0d0/4.0d0)*(M_xy*x**2*y**2*z + &
      M_xyz*x**2*y**2) + (1.0d0/12.0d0)*(M_x*x**2*y**3*z + M_xz*x**2*y &
      **3 + M_y*x**3*y**2*z + M_yz*x**3*y**2) + (1.0d0/2.0d0)*(M_xxxy*y &
      **2*z + M_xxxyz*y**2 + M_xxy*x*y**2*z + M_xxyz*x*y**2 + M_xyy*x** &
      2*y*z + M_xyyy*x**2*z + M_xyyyz*x**2 + M_xyyz*x**2*y) + (1.0d0/ &
      6.0d0)*(M_xx*x*y**3*z + M_xxx*y**3*z + M_xxxz*y**3 + M_xxz*x*y**3 &
      + M_yy*x**3*y*z + M_yyy*x**3*z + M_yyyz*x**3 + M_yyz*x**3*y))
    Ms_xxxyyzz = Ms_xxxyyzz + ((1.0d0/24.0d0)*M_0*x**3*y**2*z**2 + (1.0d0/8.0d0)*M_x*x**2*y**2*z**2 + &
      M_xxxyyz*z + M_xxxyyzz + M_xxxyz*y*z + M_xxxyzz*y + M_xxyyz*x*z + &
      M_xxyyzz*x + M_xxyz*x*y*z + M_xxyzz*x*y + (1.0d0/6.0d0)*(M_yyz*x &
      **3*z + M_yyzz*x**3 + M_yz*x**3*y*z + M_yzz*x**3*y) + (1.0d0/ &
      12.0d0)*(M_y*x**3*y*z**2 + M_yy*x**3*z**2 + M_z*x**3*y**2*z + &
      M_zz*x**3*y**2) + (1.0d0/4.0d0)*(M_xx*x*y**2*z**2 + M_xxx*y**2*z &
      **2 + M_xy*x**2*y*z**2 + M_xyy*x**2*z**2 + M_xz*x**2*y**2*z + &
      M_xzz*x**2*y**2) + (1.0d0/2.0d0)*(M_xxxy*y*z**2 + M_xxxyy*z**2 + &
      M_xxxz*y**2*z + M_xxxzz*y**2 + M_xxy*x*y*z**2 + M_xxyy*x*z**2 + &
      M_xxz*x*y**2*z + M_xxzz*x*y**2 + M_xyyz*x**2*z + M_xyyzz*x**2 + &
      M_xyz*x**2*y*z + M_xyzz*x**2*y))
    Ms_xxxyzzz = Ms_xxxyzzz + (M_xxxyzz*z + M_xxxyzzz + M_xxxzz*y*z + M_xxxzzz*y + M_xxyzz*x*z + &
      M_xxyzzz*x + M_xxzz*x*y*z + M_xxzzz*x*y + (1.0d0/4.0d0)*(M_xyz*x &
      **2*z**2 + M_xz*x**2*y*z**2) + (1.0d0/36.0d0)*(M_0*x**3*y*z**3 + &
      M_y*x**3*z**3) + (1.0d0/12.0d0)*(M_x*x**2*y*z**3 + M_xy*x**2*z**3 &
      + M_yz*x**3*z**2 + M_z*x**3*y*z**2) + (1.0d0/2.0d0)*(M_xxxyz*z**2 &
      + M_xxxz*y*z**2 + M_xxyz*x*z**2 + M_xxz*x*y*z**2 + M_xyzz*x**2*z &
      + M_xyzzz*x**2 + M_xzz*x**2*y*z + M_xzzz*x**2*y) + (1.0d0/6.0d0)* &
      (M_xx*x*y*z**3 + M_xxx*y*z**3 + M_xxxy*z**3 + M_xxy*x*z**3 + &
      M_yzz*x**3*z + M_yzzz*x**3 + M_zz*x**3*y*z + M_zzz*x**3*y))
    Ms_xxxzzzz = Ms_xxxzzzz + ((1.0d0/144.0d0)*M_0*x**3*z**4 + (1.0d0/48.0d0)*M_x*x**2*z**4 + M_xxxzzz* &
      z + M_xxxzzzz + M_xxzzz*x*z + M_xxzzzz*x + (1.0d0/4.0d0)*M_xzz*x &
      **2*z**2 + (1.0d0/36.0d0)*M_z*x**3*z**3 + (1.0d0/24.0d0)*(M_xx*x* &
      z**4 + M_xxx*z**4) + (1.0d0/12.0d0)*(M_xz*x**2*z**3 + M_zz*x**3*z &
      **2) + (1.0d0/6.0d0)*(M_xxxz*z**3 + M_xxz*x*z**3 + M_zzz*x**3*z + &
      M_zzzz*x**3) + (1.0d0/2.0d0)*(M_xxxzz*z**2 + M_xxzz*x*z**2 + &
      M_xzzz*x**2*z + M_xzzzz*x**2))
    Ms_xxyyyyy = Ms_xxyyyyy + ((1.0d0/240.0d0)*M_0*x**2*y**5 + M_xxyyyy*y + M_xxyyyyy + M_xyyyy*x*y + &
      M_xyyyyy*x + (1.0d0/48.0d0)*M_y*x**2*y**4 + (1.0d0/12.0d0)*M_yy*x &
      **2*y**3 + (1.0d0/4.0d0)*M_yyy*x**2*y**2 + (1.0d0/24.0d0)*(M_xxy* &
      y**4 + M_xy*x*y**4) + (1.0d0/6.0d0)*(M_xxyy*y**3 + M_xyy*x*y**3) &
      + (1.0d0/120.0d0)*(M_x*x*y**5 + M_xx*y**5) + (1.0d0/2.0d0)*( &
      M_xxyyy*y**2 + M_xyyy*x*y**2 + M_yyyy*x**2*y + M_yyyyy*x**2))
    Ms_xxyyyyz = Ms_xxyyyyz + (M_xxyyy*y*z + M_xxyyyy*z + M_xxyyyyz + M_xxyyyz*y + M_xyyy*x*y*z + &
      M_xyyyy*x*z + M_xyyyyz*x + M_xyyyz*x*y + (1.0d0/48.0d0)*(M_0*x**2 &
      *y**4*z + M_z*x**2*y**4) + (1.0d0/12.0d0)*(M_y*x**2*y**3*z + M_yz &
      *x**2*y**3) + (1.0d0/4.0d0)*(M_yy*x**2*y**2*z + M_yyz*x**2*y**2) &
      + (1.0d0/6.0d0)*(M_xxy*y**3*z + M_xxyz*y**3 + M_xy*x*y**3*z + &
      M_xyz*x*y**3) + (1.0d0/24.0d0)*(M_x*x*y**4*z + M_xx*y**4*z + &
      M_xxz*y**4 + M_xz*x*y**4) + (1.0d0/2.0d0)*(M_xxyy*y**2*z + &
      M_xxyyz*y**2 + M_xyy*x*y**2*z + M_xyyz*x*y**2 + M_yyy*x**2*y*z + &
      M_yyyy*x**2*z + M_yyyyz*x**2 + M_yyyz*x**2*y))
    Ms_xxyyyzz = Ms_xxyyyzz + ((1.0d0/24.0d0)*M_0*x**2*y**3*z**2 + M_xxyyyz*z + M_xxyyyzz + M_xxyyz*y*z &
      + M_xxyyzz*y + M_xyyyz*x*z + M_xyyyzz*x + M_xyyz*x*y*z + M_xyyzz* &
      x*y + (1.0d0/8.0d0)*M_y*x**2*y**2*z**2 + (1.0d0/6.0d0)*(M_xxz*y** &
      3*z + M_xxzz*y**3 + M_xz*x*y**3*z + M_xzz*x*y**3) + (1.0d0/12.0d0 &
      )*(M_x*x*y**3*z**2 + M_xx*y**3*z**2 + M_z*x**2*y**3*z + M_zz*x**2 &
      *y**3) + (1.0d0/4.0d0)*(M_xxy*y**2*z**2 + M_xy*x*y**2*z**2 + M_yy &
      *x**2*y*z**2 + M_yyy*x**2*z**2 + M_yz*x**2*y**2*z + M_yzz*x**2*y &
      **2) + (1.0d0/2.0d0)*(M_xxyy*y*z**2 + M_xxyyy*z**2 + M_xxyz*y**2* &
      z + M_xxyzz*y**2 + M_xyy*x*y*z**2 + M_xyyy*x*z**2 + M_xyz*x*y**2* &
      z + M_xyzz*x*y**2 + M_yyyz*x**2*z + M_yyyzz*x**2 + M_yyz*x**2*y*z &
      + M_yyzz*x**2*y))
    Ms_xxyyzzz = Ms_xxyyzzz + ((1.0d0/24.0d0)*M_0*x**2*y**2*z**3 + M_xxyyzz*z + M_xxyyzzz + M_xxyzz*y*z &
      + M_xxyzzz*y + M_xyyzz*x*z + M_xyyzzz*x + M_xyzz*x*y*z + M_xyzzz* &
      x*y + (1.0d0/8.0d0)*M_z*x**2*y**2*z**2 + (1.0d0/6.0d0)*(M_xxy*y*z &
      **3 + M_xxyy*z**3 + M_xy*x*y*z**3 + M_xyy*x*z**3) + (1.0d0/12.0d0 &
      )*(M_x*x*y**2*z**3 + M_xx*y**2*z**3 + M_y*x**2*y*z**3 + M_yy*x**2 &
      *z**3) + (1.0d0/4.0d0)*(M_xxz*y**2*z**2 + M_xz*x*y**2*z**2 + &
      M_yyz*x**2*z**2 + M_yz*x**2*y*z**2 + M_zz*x**2*y**2*z + M_zzz*x** &
      2*y**2) + (1.0d0/2.0d0)*(M_xxyyz*z**2 + M_xxyz*y*z**2 + M_xxzz*y &
      **2*z + M_xxzzz*y**2 + M_xyyz*x*z**2 + M_xyz*x*y*z**2 + M_xzz*x*y &
      **2*z + M_xzzz*x*y**2 + M_yyzz*x**2*z + M_yyzzz*x**2 + M_yzz*x**2 &
      *y*z + M_yzzz*x**2*y))
    Ms_xxyzzzz = Ms_xxyzzzz + (M_xxyzzz*z + M_xxyzzzz + M_xxzzz*y*z + M_xxzzzz*y + M_xyzzz*x*z + &
      M_xyzzzz*x + M_xzzz*x*y*z + M_xzzzz*x*y + (1.0d0/12.0d0)*(M_yz*x &
      **2*z**3 + M_z*x**2*y*z**3) + (1.0d0/4.0d0)*(M_yzz*x**2*z**2 + &
      M_zz*x**2*y*z**2) + (1.0d0/48.0d0)*(M_0*x**2*y*z**4 + M_y*x**2*z &
      **4) + (1.0d0/6.0d0)*(M_xxyz*z**3 + M_xxz*y*z**3 + M_xyz*x*z**3 + &
      M_xz*x*y*z**3) + (1.0d0/24.0d0)*(M_x*x*y*z**4 + M_xx*y*z**4 + &
      M_xxy*z**4 + M_xy*x*z**4) + (1.0d0/2.0d0)*(M_xxyzz*z**2 + M_xxzz* &
      y*z**2 + M_xyzz*x*z**2 + M_xzz*x*y*z**2 + M_yzzz*x**2*z + M_yzzzz &
      *x**2 + M_zzz*x**2*y*z + M_zzzz*x**2*y))
    Ms_xxzzzzz = Ms_xxzzzzz + ((1.0d0/240.0d0)*M_0*x**2*z**5 + M_xxzzzz*z + M_xxzzzzz + M_xzzzz*x*z + &
      M_xzzzzz*x + (1.0d0/48.0d0)*M_z*x**2*z**4 + (1.0d0/12.0d0)*M_zz*x &
      **2*z**3 + (1.0d0/4.0d0)*M_zzz*x**2*z**2 + (1.0d0/24.0d0)*(M_xxz* &
      z**4 + M_xz*x*z**4) + (1.0d0/6.0d0)*(M_xxzz*z**3 + M_xzz*x*z**3) &
      + (1.0d0/120.0d0)*(M_x*x*z**5 + M_xx*z**5) + (1.0d0/2.0d0)*( &
      M_xxzzz*z**2 + M_xzzz*x*z**2 + M_zzzz*x**2*z + M_zzzzz*x**2))
    Ms_xyyyyyy = Ms_xyyyyyy + (M_xyyyyy*y + M_xyyyyyy + M_yyyyy*x*y + M_yyyyyy*x + (1.0d0/120.0d0)*( &
      M_xy*y**5 + M_y*x*y**5) + (1.0d0/24.0d0)*(M_xyy*y**4 + M_yy*x*y** &
      4) + (1.0d0/6.0d0)*(M_xyyy*y**3 + M_yyy*x*y**3) + (1.0d0/2.0d0)*( &
      M_xyyyy*y**2 + M_yyyy*x*y**2) + (1.0d0/720.0d0)*(M_0*x*y**6 + M_x &
      *y**6))
    Ms_xyyyyyz = Ms_xyyyyyz + (M_xyyyy*y*z + M_xyyyyy*z + M_xyyyyyz + M_xyyyyz*y + M_yyyy*x*y*z + &
      M_yyyyy*x*z + M_yyyyyz*x + M_yyyyz*x*y + (1.0d0/24.0d0)*(M_xy*y** &
      4*z + M_xyz*y**4 + M_y*x*y**4*z + M_yz*x*y**4) + (1.0d0/6.0d0)*( &
      M_xyy*y**3*z + M_xyyz*y**3 + M_yy*x*y**3*z + M_yyz*x*y**3) + ( &
      1.0d0/2.0d0)*(M_xyyy*y**2*z + M_xyyyz*y**2 + M_yyy*x*y**2*z + &
      M_yyyz*x*y**2) + (1.0d0/120.0d0)*(M_0*x*y**5*z + M_x*y**5*z + &
      M_xz*y**5 + M_z*x*y**5))
    Ms_xyyyyzz = Ms_xyyyyzz + (M_xyyyyz*z + M_xyyyyzz + M_xyyyz*y*z + M_xyyyzz*y + M_yyyyz*x*z + &
      M_yyyyzz*x + M_yyyz*x*y*z + M_yyyzz*x*y + (1.0d0/12.0d0)*(M_xy*y &
      **3*z**2 + M_y*x*y**3*z**2) + (1.0d0/4.0d0)*(M_xyy*y**2*z**2 + &
      M_yy*x*y**2*z**2) + (1.0d0/48.0d0)*(M_0*x*y**4*z**2 + M_x*y**4*z &
      **2) + (1.0d0/6.0d0)*(M_xyz*y**3*z + M_xyzz*y**3 + M_yz*x*y**3*z &
      + M_yzz*x*y**3) + (1.0d0/24.0d0)*(M_xz*y**4*z + M_xzz*y**4 + M_z* &
      x*y**4*z + M_zz*x*y**4) + (1.0d0/2.0d0)*(M_xyyy*y*z**2 + M_xyyyy* &
      z**2 + M_xyyz*y**2*z + M_xyyzz*y**2 + M_yyy*x*y*z**2 + M_yyyy*x*z &
      **2 + M_yyz*x*y**2*z + M_yyzz*x*y**2))
    Ms_xyyyzzz = Ms_xyyyzzz + (M_xyyyzz*z + M_xyyyzzz + M_xyyzz*y*z + M_xyyzzz*y + M_yyyzz*x*z + &
      M_yyyzzz*x + M_yyzz*x*y*z + M_yyzzz*x*y + (1.0d0/4.0d0)*(M_xyz*y &
      **2*z**2 + M_yz*x*y**2*z**2) + (1.0d0/36.0d0)*(M_0*x*y**3*z**3 + &
      M_x*y**3*z**3) + (1.0d0/12.0d0)*(M_xy*y**2*z**3 + M_xz*y**3*z**2 &
      + M_y*x*y**2*z**3 + M_z*x*y**3*z**2) + (1.0d0/2.0d0)*(M_xyyyz*z** &
      2 + M_xyyz*y*z**2 + M_xyzz*y**2*z + M_xyzzz*y**2 + M_yyyz*x*z**2 &
      + M_yyz*x*y*z**2 + M_yzz*x*y**2*z + M_yzzz*x*y**2) + (1.0d0/6.0d0 &
      )*(M_xyy*y*z**3 + M_xyyy*z**3 + M_xzz*y**3*z + M_xzzz*y**3 + M_yy &
      *x*y*z**3 + M_yyy*x*z**3 + M_zz*x*y**3*z + M_zzz*x*y**3))
    Ms_xyyzzzz = Ms_xyyzzzz + (M_xyyzzz*z + M_xyyzzzz + M_xyzzz*y*z + M_xyzzzz*y + M_yyzzz*x*z + &
      M_yyzzzz*x + M_yzzz*x*y*z + M_yzzzz*x*y + (1.0d0/12.0d0)*(M_xz*y &
      **2*z**3 + M_z*x*y**2*z**3) + (1.0d0/4.0d0)*(M_xzz*y**2*z**2 + &
      M_zz*x*y**2*z**2) + (1.0d0/48.0d0)*(M_0*x*y**2*z**4 + M_x*y**2*z &
      **4) + (1.0d0/6.0d0)*(M_xyyz*z**3 + M_xyz*y*z**3 + M_yyz*x*z**3 + &
      M_yz*x*y*z**3) + (1.0d0/24.0d0)*(M_xy*y*z**4 + M_xyy*z**4 + M_y*x &
      *y*z**4 + M_yy*x*z**4) + (1.0d0/2.0d0)*(M_xyyzz*z**2 + M_xyzz*y*z &
      **2 + M_xzzz*y**2*z + M_xzzzz*y**2 + M_yyzz*x*z**2 + M_yzz*x*y*z &
      **2 + M_zzz*x*y**2*z + M_zzzz*x*y**2))
    Ms_xyzzzzz = Ms_xyzzzzz + (M_xyzzzz*z + M_xyzzzzz + M_xzzzz*y*z + M_xzzzzz*y + M_yzzzz*x*z + &
      M_yzzzzz*x + M_zzzz*x*y*z + M_zzzzz*x*y + (1.0d0/24.0d0)*(M_xyz*z &
      **4 + M_xz*y*z**4 + M_yz*x*z**4 + M_z*x*y*z**4) + (1.0d0/6.0d0)*( &
      M_xyzz*z**3 + M_xzz*y*z**3 + M_yzz*x*z**3 + M_zz*x*y*z**3) + ( &
      1.0d0/2.0d0)*(M_xyzzz*z**2 + M_xzzz*y*z**2 + M_yzzz*x*z**2 + &
      M_zzz*x*y*z**2) + (1.0d0/120.0d0)*(M_0*x*y*z**5 + M_x*y*z**5 + &
      M_xy*z**5 + M_y*x*z**5))
    Ms_xzzzzzz = Ms_xzzzzzz + (M_xzzzzz*z + M_xzzzzzz + M_zzzzz*x*z + M_zzzzzz*x + (1.0d0/120.0d0)*( &
      M_xz*z**5 + M_z*x*z**5) + (1.0d0/24.0d0)*(M_xzz*z**4 + M_zz*x*z** &
      4) + (1.0d0/6.0d0)*(M_xzzz*z**3 + M_zzz*x*z**3) + (1.0d0/2.0d0)*( &
      M_xzzzz*z**2 + M_zzzz*x*z**2) + (1.0d0/720.0d0)*(M_0*x*z**6 + M_x &
      *z**6))
    Ms_yyyyyyy = Ms_yyyyyyy + ((1.0d0/5040.0d0)*M_0*y**7 + (1.0d0/720.0d0)*M_y*y**6 + (1.0d0/120.0d0)* &
      M_yy*y**5 + (1.0d0/24.0d0)*M_yyy*y**4 + (1.0d0/6.0d0)*M_yyyy*y**3 &
      + (1.0d0/2.0d0)*M_yyyyy*y**2 + M_yyyyyy*y + M_yyyyyyy)
    Ms_yyyyyyz = Ms_yyyyyyz + (M_yyyyy*y*z + M_yyyyyy*z + M_yyyyyyz + M_yyyyyz*y + (1.0d0/720.0d0)*(M_0 &
      *y**6*z + M_z*y**6) + (1.0d0/120.0d0)*(M_y*y**5*z + M_yz*y**5) + &
      (1.0d0/24.0d0)*(M_yy*y**4*z + M_yyz*y**4) + (1.0d0/6.0d0)*(M_yyy* &
      y**3*z + M_yyyz*y**3) + (1.0d0/2.0d0)*(M_yyyy*y**2*z + M_yyyyz*y &
      **2))
    Ms_yyyyyzz = Ms_yyyyyzz + ((1.0d0/240.0d0)*M_0*y**5*z**2 + (1.0d0/48.0d0)*M_y*y**4*z**2 + (1.0d0/ &
      12.0d0)*M_yy*y**3*z**2 + (1.0d0/4.0d0)*M_yyy*y**2*z**2 + M_yyyyyz &
      *z + M_yyyyyzz + M_yyyyz*y*z + M_yyyyzz*y + (1.0d0/6.0d0)*(M_yyz* &
      y**3*z + M_yyzz*y**3) + (1.0d0/24.0d0)*(M_yz*y**4*z + M_yzz*y**4 &
      ) + (1.0d0/120.0d0)*(M_z*y**5*z + M_zz*y**5) + (1.0d0/2.0d0)*( &
      M_yyyy*y*z**2 + M_yyyyy*z**2 + M_yyyz*y**2*z + M_yyyzz*y**2))
    Ms_yyyyzzz = Ms_yyyyzzz + ((1.0d0/144.0d0)*M_0*y**4*z**3 + (1.0d0/36.0d0)*M_y*y**3*z**3 + M_yyyyzz* &
      z + M_yyyyzzz + M_yyyzz*y*z + M_yyyzzz*y + (1.0d0/4.0d0)*M_yyz*y &
      **2*z**2 + (1.0d0/48.0d0)*M_z*y**4*z**2 + (1.0d0/12.0d0)*(M_yy*y &
      **2*z**3 + M_yz*y**3*z**2) + (1.0d0/24.0d0)*(M_zz*y**4*z + M_zzz* &
      y**4) + (1.0d0/2.0d0)*(M_yyyyz*z**2 + M_yyyz*y*z**2 + M_yyzz*y**2 &
      *z + M_yyzzz*y**2) + (1.0d0/6.0d0)*(M_yyy*y*z**3 + M_yyyy*z**3 + &
      M_yzz*y**3*z + M_yzzz*y**3))
    Ms_yyyzzzz = Ms_yyyzzzz + ((1.0d0/144.0d0)*M_0*y**3*z**4 + (1.0d0/48.0d0)*M_y*y**2*z**4 + M_yyyzzz* &
      z + M_yyyzzzz + M_yyzzz*y*z + M_yyzzzz*y + (1.0d0/4.0d0)*M_yzz*y &
      **2*z**2 + (1.0d0/36.0d0)*M_z*y**3*z**3 + (1.0d0/24.0d0)*(M_yy*y* &
      z**4 + M_yyy*z**4) + (1.0d0/12.0d0)*(M_yz*y**2*z**3 + M_zz*y**3*z &
      **2) + (1.0d0/6.0d0)*(M_yyyz*z**3 + M_yyz*y*z**3 + M_zzz*y**3*z + &
      M_zzzz*y**3) + (1.0d0/2.0d0)*(M_yyyzz*z**2 + M_yyzz*y*z**2 + &
      M_yzzz*y**2*z + M_yzzzz*y**2))
    Ms_yyzzzzz = Ms_yyzzzzz + ((1.0d0/240.0d0)*M_0*y**2*z**5 + M_yyzzzz*z + M_yyzzzzz + M_yzzzz*y*z + &
      M_yzzzzz*y + (1.0d0/48.0d0)*M_z*y**2*z**4 + (1.0d0/12.0d0)*M_zz*y &
      **2*z**3 + (1.0d0/4.0d0)*M_zzz*y**2*z**2 + (1.0d0/24.0d0)*(M_yyz* &
      z**4 + M_yz*y*z**4) + (1.0d0/6.0d0)*(M_yyzz*z**3 + M_yzz*y*z**3) &
      + (1.0d0/120.0d0)*(M_y*y*z**5 + M_yy*z**5) + (1.0d0/2.0d0)*( &
      M_yyzzz*z**2 + M_yzzz*y*z**2 + M_zzzz*y**2*z + M_zzzzz*y**2))
    Ms_yzzzzzz = Ms_yzzzzzz + (M_yzzzzz*z + M_yzzzzzz + M_zzzzz*y*z + M_zzzzzz*y + (1.0d0/120.0d0)*( &
      M_yz*z**5 + M_z*y*z**5) + (1.0d0/24.0d0)*(M_yzz*z**4 + M_zz*y*z** &
      4) + (1.0d0/6.0d0)*(M_yzzz*z**3 + M_zzz*y*z**3) + (1.0d0/2.0d0)*( &
      M_yzzzz*z**2 + M_zzzz*y*z**2) + (1.0d0/720.0d0)*(M_0*y*z**6 + M_y &
      *z**6))
    Ms_zzzzzzz = Ms_zzzzzzz + ((1.0d0/5040.0d0)*M_0*z**7 + (1.0d0/720.0d0)*M_z*z**6 + (1.0d0/120.0d0)* &
      M_zz*z**5 + (1.0d0/24.0d0)*M_zzz*z**4 + (1.0d0/6.0d0)*M_zzzz*z**3 &
      + (1.0d0/2.0d0)*M_zzzzz*z**2 + M_zzzzzz*z + M_zzzzzzz)
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
    
! OPS  1234*ADD + 2*DIV + 1920*MUL + 60*NEG + 427*POW + 94*SUB = 3737  (3828 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
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
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz
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
    h         = x**2 + y**2 + z**2
    u2        = 1.0/h
    u         = sqrt(u2)
    D_0       = u
    D_x       = -u**3*x
    D_y       = -u**3*y
    D_z       = -u**3*z
    D_xx      = -h*u**5 + 3*u**5*x**2
    D_xy      = 3*u**5*x*y
    D_xz      = 3*u**5*x*z
    D_yy      = -h*u**5 + 3*u**5*y**2
    D_yz      = 3*u**5*y*z
    D_zz      = -(D_xx + D_yy)
    D_xxx     = 9*h*u**7*x - 15*u**7*x**3
    D_xxy     = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz     = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy     = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz     = -15*u**7*x*y*z
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = 9*h*u**7*y - 15*u**7*y**3
    D_yyz     = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    D_xxxx    = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy    = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz    = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy    = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz    = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz    = -(D_xxxx + D_xxyy)
    D_xyyy    = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz    = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz    = -(D_xxxy + D_xyyy)
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz    = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    D_xxxxx   = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy   = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz   = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy   = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz   = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    D_xxyyy   = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz   = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    D_xyyyy   = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz   = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    D_yyyyy   = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz   = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    D_xxxxxx  = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    D_xxxxxy  = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    D_xxxxxz  = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    D_xxxxyy  = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    D_xxxxyz  = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy  = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    D_xxxyyz  = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy  = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    D_xxyyyz  = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy  = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    D_xyyyyz  = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    D_yyyyyz  = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    D_xxxxxxx = 11025*h**3*u**15*x - 99225*h**2*u**15*x**3 + 218295*h*u**15*x**5 - &
      135135*u**15*x**7
    L_xxxxxxx = L_xxxxxxx + (D_xxxxxxx*M_0)
    D_xxxxxxy = 1575*h**3*u**15*y - 42525*h**2*u**15*x**2*y + 155925*h*u**15*x**4*y - &
      135135*u**15*x**6*y
    L_xxxxxxy = L_xxxxxxy + (D_xxxxxxy*M_0)
    D_xxxxxxz = 1575*h**3*u**15*z - 42525*h**2*u**15*x**2*z + 155925*h*u**15*x**4*z - &
      135135*u**15*x**6*z
    L_xxxxxx  = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z)
    L_xxxxxxz = L_xxxxxxz + (D_xxxxxxz*M_0)
    D_xxxxxyy = 1575*h**3*u**15*x - 9450*h**2*u**15*x**3 - 14175*h**2*u**15*x*y**2 + &
      10395*h*u**15*x**5 + 103950*h*u**15*x**3*y**2 - 135135*u**15*x**5 &
      *y**2
    L_xxxxxyy = L_xxxxxyy + (D_xxxxxyy*M_0)
    D_xxxxxyz = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x**3*y*z - 135135*u**15*x**5*y* &
      z
    L_xxxxxy  = L_xxxxxy + (D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z)
    L_xxxxxyz = L_xxxxxyz + (D_xxxxxyz*M_0)
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    L_xxxxx   = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxy*M_xy + D_xxxxxxz &
      *M_xz + D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + D_xxxxxzz*M_zz)
    L_xxxxxz  = L_xxxxxz + (D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z)
    D_xxxxyyy = 945*h**3*u**15*y - 17010*h**2*u**15*x**2*y - 2835*h**2*u**15*y**3 + &
      31185*h*u**15*x**4*y + 62370*h*u**15*x**2*y**3 - 135135*u**15*x** &
      4*y**3
    L_xxxxyyy = L_xxxxyyy + (D_xxxxyyy*M_0)
    D_xxxxyyz = 315*h**3*u**15*z - 5670*h**2*u**15*x**2*z - 2835*h**2*u**15*y**2*z + &
      10395*h*u**15*x**4*z + 62370*h*u**15*x**2*y**2*z - 135135*u**15*x &
      **4*y**2*z
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
    D_xxxyyyy = 945*h**3*u**15*x - 2835*h**2*u**15*x**3 - 17010*h**2*u**15*x*y**2 + &
      62370*h*u**15*x**3*y**2 + 31185*h*u**15*x*y**4 - 135135*u**15*x** &
      3*y**4
    L_xxxyyyy = L_xxxyyyy + (D_xxxyyyy*M_0)
    D_xxxyyyz = -8505*h**2*u**15*x*y*z - 135135*u**15*x**3*y**3*z + 31185*(h*u**15*x**3* &
      y*z + h*u**15*x*y**3*z)
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
    D_xxyyyyy = 1575*h**3*u**15*y - 14175*h**2*u**15*x**2*y - 9450*h**2*u**15*y**3 + &
      103950*h*u**15*x**2*y**3 + 10395*h*u**15*y**5 - 135135*u**15*x**2 &
      *y**5
    L_xxyyyyy = L_xxyyyyy + (D_xxyyyyy*M_0)
    D_xxyyyyz = 315*h**3*u**15*z - 2835*h**2*u**15*x**2*z - 5670*h**2*u**15*y**2*z + &
      62370*h*u**15*x**2*y**2*z + 10395*h*u**15*y**4*z - 135135*u**15*x &
      **2*y**4*z
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
    D_xyyyyyy = 1575*h**3*u**15*x - 42525*h**2*u**15*x*y**2 + 155925*h*u**15*x*y**4 - &
      135135*u**15*x*y**6
    L_xyyyyyy = L_xyyyyyy + (D_xyyyyyy*M_0)
    D_xyyyyyz = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x*y**3*z - 135135*u**15*x*y**5* &
      z
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
    D_yyyyyyy = 11025*h**3*u**15*y - 99225*h**2*u**15*y**3 + 218295*h*u**15*y**5 - &
      135135*u**15*y**7
    L_yyyyyyy = L_yyyyyyy + (D_yyyyyyy*M_0)
    D_yyyyyyz = 1575*h**3*u**15*z - 42525*h**2*u**15*y**2*z + 155925*h*u**15*y**4*z - &
      135135*u**15*y**6*z
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
    
! OPS  1190*ADD + 130*DIV + 2142*MUL + 56*NEG + 1134*POW = 4652  (5527 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
    Ls_xxxxxx  = Ls_xxxxxx + (L_xxxxxx + L_xxxxxxx*x + L_xxxxxxy*y + L_xxxxxxz*z)
    Ls_xxxxxy  = Ls_xxxxxy + (L_xxxxxxy*x + L_xxxxxy + L_xxxxxyy*y + L_xxxxxyz*z)
    Ls_xxxxyy  = Ls_xxxxyy + (L_xxxxxyy*x + L_xxxxyy + L_xxxxyyy*y + L_xxxxyyz*z)
    Ls_xxxyyy  = Ls_xxxyyy + (L_xxxxyyy*x + L_xxxyyy + L_xxxyyyy*y + L_xxxyyyz*z)
    Ls_xxyyyy  = Ls_xxyyyy + (L_xxxyyyy*x + L_xxyyyy + L_xxyyyyy*y + L_xxyyyyz*z)
    Ls_xyyyyy  = Ls_xyyyyy + (L_xxyyyyy*x + L_xyyyyy + L_xyyyyyy*y + L_xyyyyyz*z)
    Ls_yyyyyy  = Ls_yyyyyy + (L_xyyyyyy*x + L_yyyyyy + L_yyyyyyy*y + L_yyyyyyz*z)
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
    Ls_xxxxx   = Ls_xxxxx + (L_xxxxx + L_xxxxxx*x + L_xxxxxxy*x*y + L_xxxxxxz*x*z + L_xxxxxy*y + &
      L_xxxxxyz*y*z + L_xxxxxz*z + (1.0d0/2.0d0)*(L_xxxxxxx*x**2 + &
      L_xxxxxyy*y**2 + L_xxxxxzz*z**2))
    Ls_xxxxxz  = Ls_xxxxxz + (L_xxxxxxz*x + L_xxxxxyz*y + L_xxxxxz + L_xxxxxzz*z)
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    Ls_xxxxy   = Ls_xxxxy + (L_xxxxxy*x + L_xxxxxyy*x*y + L_xxxxxyz*x*z + L_xxxxy + L_xxxxyy*y + &
      L_xxxxyyz*y*z + L_xxxxyz*z + (1.0d0/2.0d0)*(L_xxxxxxy*x**2 + &
      L_xxxxyyy*y**2 + L_xxxxyzz*z**2))
    Ls_xxxxyz  = Ls_xxxxyz + (L_xxxxxyz*x + L_xxxxyyz*y + L_xxxxyz + L_xxxxyzz*z)
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    Ls_xxxx    = Ls_xxxx + (L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxyz*x*y*z + L_xxxxxz*x*z + &
      L_xxxxy*y + L_xxxxyz*y*z + L_xxxxz*z + (1.0d0/6.0d0)*(L_xxxxxxx*x &
      **3 + L_xxxxyyy*y**3 + L_xxxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxx* &
      x**2 + L_xxxxxxy*x**2*y + L_xxxxxxz*x**2*z + L_xxxxxyy*x*y**2 + &
      L_xxxxxzz*x*z**2 + L_xxxxyy*y**2 + L_xxxxyyz*y**2*z + L_xxxxyzz*y &
      *z**2 + L_xxxxzz*z**2))
    Ls_xxxxz   = Ls_xxxxz + (L_xxxxxyz*x*y + L_xxxxxz*x + L_xxxxxzz*x*z + L_xxxxyz*y + L_xxxxyzz*y*z &
      + L_xxxxz + L_xxxxzz*z + (1.0d0/2.0d0)*(L_xxxxxxz*x**2 + &
      L_xxxxyyz*y**2 + L_xxxxzzz*z**2))
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    Ls_xxxyy   = Ls_xxxyy + (L_xxxxyy*x + L_xxxxyyy*x*y + L_xxxxyyz*x*z + L_xxxyy + L_xxxyyy*y + &
      L_xxxyyyz*y*z + L_xxxyyz*z + (1.0d0/2.0d0)*(L_xxxxxyy*x**2 + &
      L_xxxyyyy*y**2 + L_xxxyyzz*z**2))
    Ls_xxxyyz  = Ls_xxxyyz + (L_xxxxyyz*x + L_xxxyyyz*y + L_xxxyyz + L_xxxyyzz*z)
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    Ls_xxxy    = Ls_xxxy + (L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyyz*x*y*z + L_xxxxyz*x*z + L_xxxy + &
      L_xxxyy*y + L_xxxyyz*y*z + L_xxxyz*z + (1.0d0/6.0d0)*(L_xxxxxxy*x &
      **3 + L_xxxyyyy*y**3 + L_xxxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxy* &
      x**2 + L_xxxxxyy*x**2*y + L_xxxxxyz*x**2*z + L_xxxxyyy*x*y**2 + &
      L_xxxxyzz*x*z**2 + L_xxxyyy*y**2 + L_xxxyyyz*y**2*z + L_xxxyyzz*y &
      *z**2 + L_xxxyzz*z**2))
    Ls_xxxyz   = Ls_xxxyz + (L_xxxxyyz*x*y + L_xxxxyz*x + L_xxxxyzz*x*z + L_xxxyyz*y + L_xxxyyzz*y*z &
      + L_xxxyz + L_xxxyzz*z + (1.0d0/2.0d0)*(L_xxxxxyz*x**2 + &
      L_xxxyyyz*y**2 + L_xxxyzzz*z**2))
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    Ls_xxx     = Ls_xxx + (L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/24.0d0)*(L_xxxxxxx*x**4 + &
      L_xxxyyyy*y**4 + L_xxxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxxyy*x**2* &
      y**2 + L_xxxxxzz*x**2*z**2 + L_xxxyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxx*x**3 + L_xxxxxxy*x**3*y + L_xxxxxxz*x**3*z + L_xxxxyyy &
      *x*y**3 + L_xxxxzzz*x*z**3 + L_xxxyyy*y**3 + L_xxxyyyz*y**3*z + &
      L_xxxyzzz*y*z**3 + L_xxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxx*x**2 + &
      L_xxxxxy*x**2*y + L_xxxxxyz*x**2*y*z + L_xxxxxz*x**2*z + L_xxxxyy &
      *x*y**2 + L_xxxxyyz*x*y**2*z + L_xxxxyzz*x*y*z**2 + L_xxxxzz*x*z &
      **2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z**2 + L_xxxzz* &
      z**2))
    Ls_xxxz    = Ls_xxxz + (L_xxxxyz*x*y + L_xxxxyzz*x*y*z + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + &
      L_xxxyzz*y*z + L_xxxz + L_xxxzz*z + (1.0d0/6.0d0)*(L_xxxxxxz*x**3 &
      + L_xxxyyyz*y**3 + L_xxxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxyz*x** &
      2*y + L_xxxxxz*x**2 + L_xxxxxzz*x**2*z + L_xxxxyyz*x*y**2 + &
      L_xxxxzzz*x*z**2 + L_xxxyyz*y**2 + L_xxxyyzz*y**2*z + L_xxxyzzz*y &
      *z**2 + L_xxxzzz*z**2))
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    Ls_xxyyy   = Ls_xxyyy + (L_xxxyyy*x + L_xxxyyyy*x*y + L_xxxyyyz*x*z + L_xxyyy + L_xxyyyy*y + &
      L_xxyyyyz*y*z + L_xxyyyz*z + (1.0d0/2.0d0)*(L_xxxxyyy*x**2 + &
      L_xxyyyyy*y**2 + L_xxyyyzz*z**2))
    Ls_xxyyyz  = Ls_xxyyyz + (L_xxxyyyz*x + L_xxyyyyz*y + L_xxyyyz + L_xxyyyzz*z)
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    Ls_xxyy    = Ls_xxyy + (L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyyz*x*y*z + L_xxxyyz*x*z + L_xxyy + &
      L_xxyyy*y + L_xxyyyz*y*z + L_xxyyz*z + (1.0d0/6.0d0)*(L_xxxxxyy*x &
      **3 + L_xxyyyyy*y**3 + L_xxyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyy* &
      x**2 + L_xxxxyyy*x**2*y + L_xxxxyyz*x**2*z + L_xxxyyyy*x*y**2 + &
      L_xxxyyzz*x*z**2 + L_xxyyyy*y**2 + L_xxyyyyz*y**2*z + L_xxyyyzz*y &
      *z**2 + L_xxyyzz*z**2))
    Ls_xxyyz   = Ls_xxyyz + (L_xxxyyyz*x*y + L_xxxyyz*x + L_xxxyyzz*x*z + L_xxyyyz*y + L_xxyyyzz*y*z &
      + L_xxyyz + L_xxyyzz*z + (1.0d0/2.0d0)*(L_xxxxyyz*x**2 + &
      L_xxyyyyz*y**2 + L_xxyyzzz*z**2))
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    Ls_xxy     = Ls_xxy + (L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/24.0d0)*(L_xxxxxxy*x**4 + &
      L_xxyyyyy*y**4 + L_xxyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyyy*x**2* &
      y**2 + L_xxxxyzz*x**2*z**2 + L_xxyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxy*x**3 + L_xxxxxyy*x**3*y + L_xxxxxyz*x**3*z + L_xxxyyyy &
      *x*y**3 + L_xxxyzzz*x*z**3 + L_xxyyyy*y**3 + L_xxyyyyz*y**3*z + &
      L_xxyyzzz*y*z**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + &
      L_xxxxyy*x**2*y + L_xxxxyyz*x**2*y*z + L_xxxxyz*x**2*z + L_xxxyyy &
      *x*y**2 + L_xxxyyyz*x*y**2*z + L_xxxyyzz*x*y*z**2 + L_xxxyzz*x*z &
      **2 + L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz* &
      z**2))
    Ls_xxyz    = Ls_xxyz + (L_xxxyyz*x*y + L_xxxyyzz*x*y*z + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + &
      L_xxyyzz*y*z + L_xxyz + L_xxyzz*z + (1.0d0/6.0d0)*(L_xxxxxyz*x**3 &
      + L_xxyyyyz*y**3 + L_xxyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyyz*x** &
      2*y + L_xxxxyz*x**2 + L_xxxxyzz*x**2*z + L_xxxyyyz*x*y**2 + &
      L_xxxyzzz*x*z**2 + L_xxyyyz*y**2 + L_xxyyyzz*y**2*z + L_xxyyzzz*y &
      *z**2 + L_xxyzzz*z**2))
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    Ls_xx      = Ls_xx + (L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + &
      L_xxyyyyy*y**5 + L_xxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3 &
      *y**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x**2*y**3 + L_xxxxzzz*x** &
      2*z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x &
      **2*y*z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + &
      L_xxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + L_xxxxyz*x** &
      2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x*y**2*z + &
      L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + L_xxyyz*y**2*z &
      + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxx*x**3 + &
      L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x**3*z + L_xxxyyy &
      *x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 + L_xxxzzz*x*z &
      **3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z**3 + L_xxzzz* &
      z**3))
    Ls_xxz     = Ls_xxz + (L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/24.0d0)*(L_xxxxxxz*x**4 + &
      L_xxyyyyz*y**4 + L_xxzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyyz*x**2* &
      y**2 + L_xxxxzzz*x**2*z**2 + L_xxyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxyz*x**3*y + L_xxxxxz*x**3 + L_xxxxxzz*x**3*z + L_xxxyyyz &
      *x*y**3 + L_xxxzzzz*x*z**3 + L_xxyyyz*y**3 + L_xxyyyzz*y**3*z + &
      L_xxyzzzz*y*z**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2* &
      y + L_xxxxyzz*x**2*y*z + L_xxxxz*x**2 + L_xxxxzz*x**2*z + &
      L_xxxyyz*x*y**2 + L_xxxyyzz*x*y**2*z + L_xxxyzzz*x*y*z**2 + &
      L_xxxzzz*x*z**2 + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z** &
      2 + L_xxzzz*z**2))
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    Ls_xyyyy   = Ls_xyyyy + (L_xxyyyy*x + L_xxyyyyy*x*y + L_xxyyyyz*x*z + L_xyyyy + L_xyyyyy*y + &
      L_xyyyyyz*y*z + L_xyyyyz*z + (1.0d0/2.0d0)*(L_xxxyyyy*x**2 + &
      L_xyyyyyy*y**2 + L_xyyyyzz*z**2))
    Ls_xyyyyz  = Ls_xyyyyz + (L_xxyyyyz*x + L_xyyyyyz*y + L_xyyyyz + L_xyyyyzz*z)
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    Ls_xyyy    = Ls_xyyy + (L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyyz*x*y*z + L_xxyyyz*x*z + L_xyyy + &
      L_xyyyy*y + L_xyyyyz*y*z + L_xyyyz*z + (1.0d0/6.0d0)*(L_xxxxyyy*x &
      **3 + L_xyyyyyy*y**3 + L_xyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyy* &
      x**2 + L_xxxyyyy*x**2*y + L_xxxyyyz*x**2*z + L_xxyyyyy*x*y**2 + &
      L_xxyyyzz*x*z**2 + L_xyyyyy*y**2 + L_xyyyyyz*y**2*z + L_xyyyyzz*y &
      *z**2 + L_xyyyzz*z**2))
    Ls_xyyyz   = Ls_xyyyz + (L_xxyyyyz*x*y + L_xxyyyz*x + L_xxyyyzz*x*z + L_xyyyyz*y + L_xyyyyzz*y*z &
      + L_xyyyz + L_xyyyzz*z + (1.0d0/2.0d0)*(L_xxxyyyz*x**2 + &
      L_xyyyyyz*y**2 + L_xyyyzzz*z**2))
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    Ls_xyy     = Ls_xyy + (L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/24.0d0)*(L_xxxxxyy*x**4 + &
      L_xyyyyyy*y**4 + L_xyyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyyy*x**2* &
      y**2 + L_xxxyyzz*x**2*z**2 + L_xyyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxyy*x**3 + L_xxxxyyy*x**3*y + L_xxxxyyz*x**3*z + L_xxyyyyy &
      *x*y**3 + L_xxyyzzz*x*z**3 + L_xyyyyy*y**3 + L_xyyyyyz*y**3*z + &
      L_xyyyzzz*y*z**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + &
      L_xxxyyy*x**2*y + L_xxxyyyz*x**2*y*z + L_xxxyyz*x**2*z + L_xxyyyy &
      *x*y**2 + L_xxyyyyz*x*y**2*z + L_xxyyyzz*x*y*z**2 + L_xxyyzz*x*z &
      **2 + L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz* &
      z**2))
    Ls_xyyz    = Ls_xyyz + (L_xxyyyz*x*y + L_xxyyyzz*x*y*z + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + &
      L_xyyyzz*y*z + L_xyyz + L_xyyzz*z + (1.0d0/6.0d0)*(L_xxxxyyz*x**3 &
      + L_xyyyyyz*y**3 + L_xyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyyz*x** &
      2*y + L_xxxyyz*x**2 + L_xxxyyzz*x**2*z + L_xxyyyyz*x*y**2 + &
      L_xxyyzzz*x*z**2 + L_xyyyyz*y**2 + L_xyyyyzz*y**2*z + L_xyyyzzz*y &
      *z**2 + L_xyyzzz*z**2))
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    Ls_xy      = Ls_xy + (L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + &
      L_xyyyyyy*y**5 + L_xyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3 &
      *y**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x**2*y**3 + L_xxxyzzz*x** &
      2*z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x &
      **2*y*z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + &
      L_xyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x &
      **4*y + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2))
    Ls_xyz     = Ls_xyz + (L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/24.0d0)*(L_xxxxxyz*x**4 + &
      L_xyyyyyz*y**4 + L_xyzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyyz*x**2* &
      y**2 + L_xxxyzzz*x**2*z**2 + L_xyyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxyyz*x**3*y + L_xxxxyz*x**3 + L_xxxxyzz*x**3*z + L_xxyyyyz &
      *x*y**3 + L_xxyzzzz*x*z**3 + L_xyyyyz*y**3 + L_xyyyyzz*y**3*z + &
      L_xyyzzzz*y*z**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2* &
      y + L_xxxyyzz*x**2*y*z + L_xxxyz*x**2 + L_xxxyzz*x**2*z + &
      L_xxyyyz*x*y**2 + L_xxyyyzz*x*y**2*z + L_xxyyzzz*x*y*z**2 + &
      L_xxyzzz*x*z**2 + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z** &
      2 + L_xyzzz*z**2))
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    Ls_x       = Ls_x + (L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxx*x**6 + L_xyyyyyy*y**6 + L_xzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxzzz*x**3*z**3 + &
      L_xyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyy*x**4*y**2 + &
      L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y**4 + L_xxxzzzz*x**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyy*x**2*y**2 + L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + &
      L_xxxzz*x**2*z**2 + L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxz*x**5 &
      *z + L_xxyyyyy*x*y**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxyz*x**4*y*z + L_xxxxxz*x &
      **4*z + L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 &
      + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z &
      **4 + L_xzzzz*z**4) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + &
      L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z**2 + L_xxxxzz*x**3*z** &
      2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3*z + L_xxxyzzz*x**2*y &
      *z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y**3*z**2 + L_xxyyzzz*x* &
      y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y**2*z**3))
    Ls_xz      = Ls_xz + (L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/120.0d0)*(L_xxxxxxz*x**5 + L_xyyyyyz*y &
      **5 + L_xzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + &
      L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x**2*y**3 + L_xxxzzzz*x**2*z**3 + &
      L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y*z** &
      2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxz*x**4 + &
      L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + L_xxzzzzz*x*z**4 + L_xyyyyz &
      *y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 &
      + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + &
      L_xxyzzzz*x*y*z**3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y &
      **3*z + L_xyzzzz*y*z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz* &
      x**2*y + L_xxxyzz*x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + &
      L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz* &
      x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z &
      **2))
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    Ls_yyyyy   = Ls_yyyyy + (L_xyyyyy*x + L_xyyyyyy*x*y + L_xyyyyyz*x*z + L_yyyyy + L_yyyyyy*y + &
      L_yyyyyyz*y*z + L_yyyyyz*z + (1.0d0/2.0d0)*(L_xxyyyyy*x**2 + &
      L_yyyyyyy*y**2 + L_yyyyyzz*z**2))
    Ls_yyyyyz  = Ls_yyyyyz + (L_xyyyyyz*x + L_yyyyyyz*y + L_yyyyyz + L_yyyyyzz*z)
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    Ls_yyyy    = Ls_yyyy + (L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyyz*x*y*z + L_xyyyyz*x*z + L_yyyy + &
      L_yyyyy*y + L_yyyyyz*y*z + L_yyyyz*z + (1.0d0/6.0d0)*(L_xxxyyyy*x &
      **3 + L_yyyyyyy*y**3 + L_yyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyy* &
      x**2 + L_xxyyyyy*x**2*y + L_xxyyyyz*x**2*z + L_xyyyyyy*x*y**2 + &
      L_xyyyyzz*x*z**2 + L_yyyyyy*y**2 + L_yyyyyyz*y**2*z + L_yyyyyzz*y &
      *z**2 + L_yyyyzz*z**2))
    Ls_yyyyz   = Ls_yyyyz + (L_xyyyyyz*x*y + L_xyyyyz*x + L_xyyyyzz*x*z + L_yyyyyz*y + L_yyyyyzz*y*z &
      + L_yyyyz + L_yyyyzz*z + (1.0d0/2.0d0)*(L_xxyyyyz*x**2 + &
      L_yyyyyyz*y**2 + L_yyyyzzz*z**2))
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    Ls_yyy     = Ls_yyy + (L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/24.0d0)*(L_xxxxyyy*x**4 + &
      L_yyyyyyy*y**4 + L_yyyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyyy*x**2* &
      y**2 + L_xxyyyzz*x**2*z**2 + L_yyyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxyyy*x**3 + L_xxxyyyy*x**3*y + L_xxxyyyz*x**3*z + L_xyyyyyy &
      *x*y**3 + L_xyyyzzz*x*z**3 + L_yyyyyy*y**3 + L_yyyyyyz*y**3*z + &
      L_yyyyzzz*y*z**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + &
      L_xxyyyy*x**2*y + L_xxyyyyz*x**2*y*z + L_xxyyyz*x**2*z + L_xyyyyy &
      *x*y**2 + L_xyyyyyz*x*y**2*z + L_xyyyyzz*x*y*z**2 + L_xyyyzz*x*z &
      **2 + L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz* &
      z**2))
    Ls_yyyz    = Ls_yyyz + (L_xyyyyz*x*y + L_xyyyyzz*x*y*z + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + &
      L_yyyyzz*y*z + L_yyyz + L_yyyzz*z + (1.0d0/6.0d0)*(L_xxxyyyz*x**3 &
      + L_yyyyyyz*y**3 + L_yyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyyz*x** &
      2*y + L_xxyyyz*x**2 + L_xxyyyzz*x**2*z + L_xyyyyyz*x*y**2 + &
      L_xyyyzzz*x*z**2 + L_yyyyyz*y**2 + L_yyyyyzz*y**2*z + L_yyyyzzz*y &
      *z**2 + L_yyyzzz*z**2))
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    Ls_yy      = Ls_yy + (L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + &
      L_yyyyyyy*y**5 + L_yyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3 &
      *y**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x**2*y**3 + L_xxyyzzz*x** &
      2*z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x &
      **2*y*z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + &
      L_yyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x &
      **4*y + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2))
    Ls_yyz     = Ls_yyz + (L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/24.0d0)*(L_xxxxyyz*x**4 + &
      L_yyyyyyz*y**4 + L_yyzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyyz*x**2* &
      y**2 + L_xxyyzzz*x**2*z**2 + L_yyyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxyyyz*x**3*y + L_xxxyyz*x**3 + L_xxxyyzz*x**3*z + L_xyyyyyz &
      *x*y**3 + L_xyyzzzz*x*z**3 + L_yyyyyz*y**3 + L_yyyyyzz*y**3*z + &
      L_yyyzzzz*y*z**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2* &
      y + L_xxyyyzz*x**2*y*z + L_xxyyz*x**2 + L_xxyyzz*x**2*z + &
      L_xyyyyz*x*y**2 + L_xyyyyzz*x*y**2*z + L_xyyyzzz*x*y*z**2 + &
      L_xyyzzz*x*z**2 + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z** &
      2 + L_yyzzz*z**2))
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    Ls_y       = Ls_y + ((1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxy*x**6 + L_yyyyyyy*y**6 + L_yzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyzzz*x**3*z**3 + &
      L_yyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyy*x**4*y**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyzzzz*x**2*z**4 + &
      L_yyyyyzz*y**4*z**2 + L_yyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyy*x**2*y**2 + L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + &
      L_xxyzz*x**2*z**2 + L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyz*x**5 &
      *z + L_xyyyyyy*x*y**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xyyyyy*x*y**4 + L_xyyyyyz*x*y**4*z + &
      L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y &
      **4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x &
      **3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + &
      L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz* &
      x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y &
      *z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x &
      *y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z &
      **2 + L_yzz*z**2) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3))
    Ls_yz      = Ls_yz + (L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/120.0d0)*(L_xxxxxyz*x**5 + L_yyyyyyz*y &
      **5 + L_yzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + &
      L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x**2*y**3 + L_xxyzzzz*x**2*z**3 + &
      L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y*z** &
      2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyz*x**4 + &
      L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + L_xyzzzzz*x*z**4 + L_yyyyyz &
      *y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 &
      + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + &
      L_xyyzzzz*x*y*z**3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y &
      **3*z + L_yyzzzz*y*z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz* &
      x**2*y + L_xxyyzz*x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + &
      L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz* &
      x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z &
      **2))
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    Ls_0       = Ls_0 + (L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/5040.0d0)*( &
      L_xxxxxxx*x**7 + L_yyyyyyy*y**7 + L_zzzzzzz*z**7) + (1.0d0/ &
      240.0d0)*(L_xxxxxyy*x**5*y**2 + L_xxxxxzz*x**5*z**2 + L_xxyyyyy*x &
      **2*y**5 + L_xxzzzzz*x**2*z**5 + L_yyyyyzz*y**5*z**2 + L_yyzzzzz* &
      y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyy*x**4*y**3 + L_xxxxzzz*x** &
      4*z**3 + L_xxxyyyy*x**3*y**4 + L_xxxzzzz*x**3*z**4 + L_yyyyzzz*y &
      **4*z**3 + L_yyyzzzz*y**3*z**4) + (1.0d0/36.0d0)*(L_xxxyyy*x**3*y &
      **3 + L_xxxyyyz*x**3*y**3*z + L_xxxyzzz*x**3*y*z**3 + L_xxxzzz*x &
      **3*z**3 + L_xyyyzzz*x*y**3*z**3 + L_yyyzzz*y**3*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z + L_xxyzz*x**2*y*z &
      **2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + L_yyzz*y**2*z**2) &
      + (1.0d0/720.0d0)*(L_xxxxxx*x**6 + L_xxxxxxy*x**6*y + L_xxxxxxz*x &
      **6*z + L_xyyyyyy*x*y**6 + L_xzzzzzz*x*z**6 + L_yyyyyy*y**6 + &
      L_yyyyyyz*y**6*z + L_yzzzzzz*y*z**6 + L_zzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z &
      + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 &
      + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z**2) + (1.0d0/ &
      6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z + L_xxxz*x &
      **3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y*z**3 + &
      L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 + &
      L_zzz*z**3) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5*y + &
      L_xxxxxyz*x**5*y*z + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + &
      L_xyyyyyz*x*y**5*z + L_xyzzzzz*x*y*z**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxyyz*x**4*y**2*z + &
      L_xxxxyzz*x**4*y*z**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy*x**2*y**4 + &
      L_xxyyyyz*x**2*y**4*z + L_xxyzzzz*x**2*y*z**4 + L_xxzzzz*x**2*z** &
      4 + L_xyyyyzz*x*y**4*z**2 + L_xyyzzzz*x*y**2*z**4 + L_yyyyzz*y**4 &
      *z**2 + L_yyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + &
      L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + L_xxyzzz*x**2*y*z**3 + &
      L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + L_xyyzzz*x*y**2*z**3 + &
      L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3) + (1.0d0/24.0d0)*(L_xxxx*x &
      **4 + L_xxxxy*x**4*y + L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + &
      L_xxxyyzz*x**3*y**2*z**2 + L_xxyyyzz*x**2*y**3*z**2 + L_xxyyzzz*x &
      **2*y**2*z**3 + L_xyyyy*x*y**4 + L_xyyyyz*x*y**4*z + L_xyzzzz*x*y &
      *z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y &
      *z**4 + L_zzzz*z**4))
    Ls_z       = Ls_z + ((1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxz*x**6 + L_yyyyyyz*y**6 + L_zzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxzzzz*x**3*z**3 + &
      L_yyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyz*x**4*y**2 + &
      L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y**4 + L_xxzzzzz*x**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyz*x**2*y**2 + L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + &
      L_xxzzz*x**2*z**2 + L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxz*x**5 + L_xxxxxzz*x**5 &
      *z + L_xyyyyyz*x*y**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + &
      L_xxxxzz*x**4*z + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z + &
      L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y &
      **4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyyz*x**3*y**2 + L_xxxyyzz*x**3*y**2*z + L_xxxyzzz*x**3*y*z** &
      2 + L_xxxzzz*x**3*z**2 + L_xxyyyz*x**2*y**3 + L_xxyyyzz*x**2*y**3 &
      *z + L_xxyzzzz*x**2*y*z**3 + L_xxzzzz*x**2*z**3 + L_xyyyzzz*x*y** &
      3*z**2 + L_xyyzzzz*x*y**2*z**3 + L_yyyzzz*y**3*z**2 + L_yyzzzz*y &
      **2*z**3) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz*x**3*y*z + &
      L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xyyyzz*x*y**3*z &
      + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 + L_yyyzz*y**3 &
      *z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)*(L_xxyz*x**2*y &
      + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + L_xyyz*x*y**2 + &
      L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z**2 + L_yyz*y**2 &
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2))
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
    
! OPS  1234*ADD + 2*DIV + 1920*MUL + 60*NEG + 427*POW + 94*SUB = 3737  (3828 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
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
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz
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
    h         = x**2 + y**2 + z**2
    u2        = 1.0/h
    u         = sqrt(u2)
    D_0       = u
    D_x       = -u**3*x
    D_y       = -u**3*y
    D_z       = -u**3*z
    D_xx      = -h*u**5 + 3*u**5*x**2
    D_xy      = 3*u**5*x*y
    D_xz      = 3*u**5*x*z
    D_yy      = -h*u**5 + 3*u**5*y**2
    D_yz      = 3*u**5*y*z
    D_zz      = -(D_xx + D_yy)
    D_xxx     = 9*h*u**7*x - 15*u**7*x**3
    D_xxy     = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz     = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy     = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz     = -15*u**7*x*y*z
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = 9*h*u**7*y - 15*u**7*y**3
    D_yyz     = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    D_xxxx    = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy    = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz    = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy    = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz    = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz    = -(D_xxxx + D_xxyy)
    D_xyyy    = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz    = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz    = -(D_xxxy + D_xyyy)
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz    = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    D_xxxxx   = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy   = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz   = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy   = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz   = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    D_xxyyy   = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz   = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    D_xyyyy   = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz   = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    D_yyyyy   = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz   = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    D_xxxxxx  = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    D_xxxxxy  = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    D_xxxxxz  = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    D_xxxxyy  = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    D_xxxxyz  = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy  = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    D_xxxyyz  = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy  = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    D_xxyyyz  = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy  = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    D_xyyyyz  = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    D_yyyyyz  = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    D_xxxxxxx = 11025*h**3*u**15*x - 99225*h**2*u**15*x**3 + 218295*h*u**15*x**5 - &
      135135*u**15*x**7
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = 1575*h**3*u**15*y - 42525*h**2*u**15*x**2*y + 155925*h*u**15*x**4*y - &
      135135*u**15*x**6*y
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = 1575*h**3*u**15*z - 42525*h**2*u**15*x**2*z + 155925*h*u**15*x**4*z - &
      135135*u**15*x**6*z
    L_xxxxxx  = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = 1575*h**3*u**15*x - 9450*h**2*u**15*x**3 - 14175*h**2*u**15*x*y**2 + &
      10395*h*u**15*x**5 + 103950*h*u**15*x**3*y**2 - 135135*u**15*x**5 &
      *y**2
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x**3*y*z - 135135*u**15*x**5*y* &
      z
    L_xxxxxy  = D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxy*M_xy + D_xxxxxxz &
      *M_xz + D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + D_xxxxxzz*M_zz
    L_xxxxxz  = D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z
    D_xxxxyyy = 945*h**3*u**15*y - 17010*h**2*u**15*x**2*y - 2835*h**2*u**15*y**3 + &
      31185*h*u**15*x**4*y + 62370*h*u**15*x**2*y**3 - 135135*u**15*x** &
      4*y**3
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = 315*h**3*u**15*z - 5670*h**2*u**15*x**2*z - 2835*h**2*u**15*y**2*z + &
      10395*h*u**15*x**4*z + 62370*h*u**15*x**2*y**2*z - 135135*u**15*x &
      **4*y**2*z
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
    D_xxxyyyy = 945*h**3*u**15*x - 2835*h**2*u**15*x**3 - 17010*h**2*u**15*x*y**2 + &
      62370*h*u**15*x**3*y**2 + 31185*h*u**15*x*y**4 - 135135*u**15*x** &
      3*y**4
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = -8505*h**2*u**15*x*y*z - 135135*u**15*x**3*y**3*z + 31185*(h*u**15*x**3* &
      y*z + h*u**15*x*y**3*z)
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
    D_xxyyyyy = 1575*h**3*u**15*y - 14175*h**2*u**15*x**2*y - 9450*h**2*u**15*y**3 + &
      103950*h*u**15*x**2*y**3 + 10395*h*u**15*y**5 - 135135*u**15*x**2 &
      *y**5
    L_xxyyyyy = D_xxyyyyy*M_0
    D_xxyyyyz = 315*h**3*u**15*z - 2835*h**2*u**15*x**2*z - 5670*h**2*u**15*y**2*z + &
      62370*h*u**15*x**2*y**2*z + 10395*h*u**15*y**4*z - 135135*u**15*x &
      **2*y**4*z
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
    D_xyyyyyy = 1575*h**3*u**15*x - 42525*h**2*u**15*x*y**2 + 155925*h*u**15*x*y**4 - &
      135135*u**15*x*y**6
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x*y**3*z - 135135*u**15*x*y**5* &
      z
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
    D_yyyyyyy = 11025*h**3*u**15*y - 99225*h**2*u**15*y**3 + 218295*h*u**15*y**5 - &
      135135*u**15*y**7
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = 1575*h**3*u**15*z - 42525*h**2*u**15*y**2*z + 155925*h*u**15*y**4*z - &
      135135*u**15*y**6*z
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
    
! OPS  643*ADD + 73*DIV + 1281*MUL + 57*NEG + 783*POW = 2837  (3440 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
    Phi_xx    = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + &
      L_xxyyyyy*y**5 + L_xxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3 &
      *y**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x**2*y**3 + L_xxxxzzz*x** &
      2*z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x &
      **2*y*z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + &
      L_xxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + L_xxxxyz*x** &
      2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x*y**2*z + &
      L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + L_xxyyz*y**2*z &
      + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxx*x**3 + &
      L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x**3*z + L_xxxyyy &
      *x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 + L_xxxzzz*x*z &
      **3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z**3 + L_xxzzz* &
      z**3)
    L_xyyyyzz = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz = -(L_xxxyzzz + L_xyyyzzz)
    Phi_xy    = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + &
      L_xyyyyyy*y**5 + L_xyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3 &
      *y**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x**2*y**3 + L_xxxyzzz*x** &
      2*z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x &
      **2*y*z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + &
      L_xyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x &
      **4*y + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2)
    L_xzzzzzz = -(L_xxxzzzz + L_xyyzzzz)
    Phi_x     = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxx*x**6 + L_xyyyyyy*y**6 + L_xzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxzzz*x**3*z**3 + &
      L_xyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyy*x**4*y**2 + &
      L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y**4 + L_xxxzzzz*x**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyy*x**2*y**2 + L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + &
      L_xxxzz*x**2*z**2 + L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxz*x**5 &
      *z + L_xxyyyyy*x*y**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxyz*x**4*y*z + L_xxxxxz*x &
      **4*z + L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 &
      + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z &
      **4 + L_xzzzz*z**4) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + &
      L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z**2 + L_xxxxzz*x**3*z** &
      2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3*z + L_xxxyzzz*x**2*y &
      *z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y**3*z**2 + L_xxyyzzz*x* &
      y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y**2*z**3)
    Phi_xz    = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/120.0d0)*(L_xxxxxxz*x**5 + L_xyyyyyz*y &
      **5 + L_xzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + &
      L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x**2*y**3 + L_xxxzzzz*x**2*z**3 + &
      L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y*z** &
      2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxz*x**4 + &
      L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + L_xxzzzzz*x*z**4 + L_xyyyyz &
      *y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 &
      + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + &
      L_xxyzzzz*x*y*z**3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y &
      **3*z + L_xyzzzz*y*z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz* &
      x**2*y + L_xxxyzz*x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + &
      L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz* &
      x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z &
      **2)
    L_yyyyyzz = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz = -(L_xxyyzzz + L_yyyyzzz)
    Phi_yy    = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + &
      L_yyyyyyy*y**5 + L_yyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3 &
      *y**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x**2*y**3 + L_xxyyzzz*x** &
      2*z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x &
      **2*y*z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + &
      L_yyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x &
      **4*y + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2)
    Phi_zz    = -(Phi_xx + Phi_yy)
    L_yzzzzzz = -(L_xxyzzzz + L_yyyzzzz)
    Phi_y     = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxy*x**6 + L_yyyyyyy*y**6 + L_yzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyzzz*x**3*z**3 + &
      L_yyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyy*x**4*y**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyzzzz*x**2*z**4 + &
      L_yyyyyzz*y**4*z**2 + L_yyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyy*x**2*y**2 + L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + &
      L_xxyzz*x**2*z**2 + L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyz*x**5 &
      *z + L_xyyyyyy*x*y**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xyyyyy*x*y**4 + L_xyyyyyz*x*y**4*z + &
      L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y &
      **4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x &
      **3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + &
      L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz* &
      x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y &
      *z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x &
      *y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z &
      **2 + L_yzz*z**2) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3)
    Phi_yz    = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/120.0d0)*(L_xxxxxyz*x**5 + L_yyyyyyz*y &
      **5 + L_yzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + &
      L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x**2*y**3 + L_xxyzzzz*x**2*z**3 + &
      L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y*z** &
      2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyz*x**4 + &
      L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + L_xyzzzzz*x*z**4 + L_yyyyyz &
      *y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 &
      + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + &
      L_xyyzzzz*x*y*z**3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y &
      **3*z + L_yyzzzz*y*z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz* &
      x**2*y + L_xxyyzz*x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + &
      L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz* &
      x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z &
      **2)
    L_zzzzzzz = -(L_xxzzzzz + L_yyzzzzz)
    Phi_0     = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/5040.0d0)*( &
      L_xxxxxxx*x**7 + L_yyyyyyy*y**7 + L_zzzzzzz*z**7) + (1.0d0/ &
      240.0d0)*(L_xxxxxyy*x**5*y**2 + L_xxxxxzz*x**5*z**2 + L_xxyyyyy*x &
      **2*y**5 + L_xxzzzzz*x**2*z**5 + L_yyyyyzz*y**5*z**2 + L_yyzzzzz* &
      y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyy*x**4*y**3 + L_xxxxzzz*x** &
      4*z**3 + L_xxxyyyy*x**3*y**4 + L_xxxzzzz*x**3*z**4 + L_yyyyzzz*y &
      **4*z**3 + L_yyyzzzz*y**3*z**4) + (1.0d0/36.0d0)*(L_xxxyyy*x**3*y &
      **3 + L_xxxyyyz*x**3*y**3*z + L_xxxyzzz*x**3*y*z**3 + L_xxxzzz*x &
      **3*z**3 + L_xyyyzzz*x*y**3*z**3 + L_yyyzzz*y**3*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z + L_xxyzz*x**2*y*z &
      **2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + L_yyzz*y**2*z**2) &
      + (1.0d0/720.0d0)*(L_xxxxxx*x**6 + L_xxxxxxy*x**6*y + L_xxxxxxz*x &
      **6*z + L_xyyyyyy*x*y**6 + L_xzzzzzz*x*z**6 + L_yyyyyy*y**6 + &
      L_yyyyyyz*y**6*z + L_yzzzzzz*y*z**6 + L_zzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z &
      + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 &
      + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z**2) + (1.0d0/ &
      6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z + L_xxxz*x &
      **3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y*z**3 + &
      L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 + &
      L_zzz*z**3) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5*y + &
      L_xxxxxyz*x**5*y*z + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + &
      L_xyyyyyz*x*y**5*z + L_xyzzzzz*x*y*z**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxyyz*x**4*y**2*z + &
      L_xxxxyzz*x**4*y*z**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy*x**2*y**4 + &
      L_xxyyyyz*x**2*y**4*z + L_xxyzzzz*x**2*y*z**4 + L_xxzzzz*x**2*z** &
      4 + L_xyyyyzz*x*y**4*z**2 + L_xyyzzzz*x*y**2*z**4 + L_yyyyzz*y**4 &
      *z**2 + L_yyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + &
      L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + L_xxyzzz*x**2*y*z**3 + &
      L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + L_xyyzzz*x*y**2*z**3 + &
      L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3) + (1.0d0/24.0d0)*(L_xxxx*x &
      **4 + L_xxxxy*x**4*y + L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + &
      L_xxxyyzz*x**3*y**2*z**2 + L_xxyyyzz*x**2*y**3*z**2 + L_xxyyzzz*x &
      **2*y**2*z**3 + L_xyyyy*x*y**4 + L_xyyyyz*x*y**4*z + L_xyzzzz*x*y &
      *z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y &
      *z**4 + L_zzzz*z**4)
    Phi_z     = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxz*x**6 + L_yyyyyyz*y**6 + L_zzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxzzzz*x**3*z**3 + &
      L_yyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyz*x**4*y**2 + &
      L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y**4 + L_xxzzzzz*x**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyz*x**2*y**2 + L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + &
      L_xxzzz*x**2*z**2 + L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxz*x**5 + L_xxxxxzz*x**5 &
      *z + L_xyyyyyz*x*y**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + &
      L_xxxxzz*x**4*z + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z + &
      L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y &
      **4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyyz*x**3*y**2 + L_xxxyyzz*x**3*y**2*z + L_xxxyzzz*x**3*y*z** &
      2 + L_xxxzzz*x**3*z**2 + L_xxyyyz*x**2*y**3 + L_xxyyyzz*x**2*y**3 &
      *z + L_xxyzzzz*x**2*y*z**3 + L_xxzzzz*x**2*z**3 + L_xyyyzzz*x*y** &
      3*z**2 + L_xyyzzzz*x*y**2*z**3 + L_yyyzzz*y**3*z**2 + L_yyzzzz*y &
      **2*z**3) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz*x**3*y*z + &
      L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xyyyzz*x*y**3*z &
      + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 + L_yyyzz*y**3 &
      *z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)*(L_xxyz*x**2*y &
      + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + L_xyyz*x*y**2 + &
      L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z**2 + L_yyz*y**2 &
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
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
    
! OPS  1190*ADD + 130*DIV + 2142*MUL + 56*NEG + 1134*POW = 4652  (5527 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
    Ls_xxxxxx  = L_xxxxxx + L_xxxxxxx*x + L_xxxxxxy*y + L_xxxxxxz*z
    Ls_xxxxxy  = L_xxxxxxy*x + L_xxxxxy + L_xxxxxyy*y + L_xxxxxyz*z
    Ls_xxxxyy  = L_xxxxxyy*x + L_xxxxyy + L_xxxxyyy*y + L_xxxxyyz*z
    Ls_xxxyyy  = L_xxxxyyy*x + L_xxxyyy + L_xxxyyyy*y + L_xxxyyyz*z
    Ls_xxyyyy  = L_xxxyyyy*x + L_xxyyyy + L_xxyyyyy*y + L_xxyyyyz*z
    Ls_xyyyyy  = L_xxyyyyy*x + L_xyyyyy + L_xyyyyyy*y + L_xyyyyyz*z
    Ls_yyyyyy  = L_xyyyyyy*x + L_yyyyyy + L_yyyyyyy*y + L_yyyyyyz*z
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
    Ls_xxxxx   = L_xxxxx + L_xxxxxx*x + L_xxxxxxy*x*y + L_xxxxxxz*x*z + L_xxxxxy*y + &
      L_xxxxxyz*y*z + L_xxxxxz*z + (1.0d0/2.0d0)*(L_xxxxxxx*x**2 + &
      L_xxxxxyy*y**2 + L_xxxxxzz*z**2)
    Ls_xxxxxz  = L_xxxxxxz*x + L_xxxxxyz*y + L_xxxxxz + L_xxxxxzz*z
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    Ls_xxxxy   = L_xxxxxy*x + L_xxxxxyy*x*y + L_xxxxxyz*x*z + L_xxxxy + L_xxxxyy*y + &
      L_xxxxyyz*y*z + L_xxxxyz*z + (1.0d0/2.0d0)*(L_xxxxxxy*x**2 + &
      L_xxxxyyy*y**2 + L_xxxxyzz*z**2)
    Ls_xxxxyz  = L_xxxxxyz*x + L_xxxxyyz*y + L_xxxxyz + L_xxxxyzz*z
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    Ls_xxxx    = L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxyz*x*y*z + L_xxxxxz*x*z + &
      L_xxxxy*y + L_xxxxyz*y*z + L_xxxxz*z + (1.0d0/6.0d0)*(L_xxxxxxx*x &
      **3 + L_xxxxyyy*y**3 + L_xxxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxx* &
      x**2 + L_xxxxxxy*x**2*y + L_xxxxxxz*x**2*z + L_xxxxxyy*x*y**2 + &
      L_xxxxxzz*x*z**2 + L_xxxxyy*y**2 + L_xxxxyyz*y**2*z + L_xxxxyzz*y &
      *z**2 + L_xxxxzz*z**2)
    Ls_xxxxz   = L_xxxxxyz*x*y + L_xxxxxz*x + L_xxxxxzz*x*z + L_xxxxyz*y + L_xxxxyzz*y*z &
      + L_xxxxz + L_xxxxzz*z + (1.0d0/2.0d0)*(L_xxxxxxz*x**2 + &
      L_xxxxyyz*y**2 + L_xxxxzzz*z**2)
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    Ls_xxxyy   = L_xxxxyy*x + L_xxxxyyy*x*y + L_xxxxyyz*x*z + L_xxxyy + L_xxxyyy*y + &
      L_xxxyyyz*y*z + L_xxxyyz*z + (1.0d0/2.0d0)*(L_xxxxxyy*x**2 + &
      L_xxxyyyy*y**2 + L_xxxyyzz*z**2)
    Ls_xxxyyz  = L_xxxxyyz*x + L_xxxyyyz*y + L_xxxyyz + L_xxxyyzz*z
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    Ls_xxxy    = L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyyz*x*y*z + L_xxxxyz*x*z + L_xxxy + &
      L_xxxyy*y + L_xxxyyz*y*z + L_xxxyz*z + (1.0d0/6.0d0)*(L_xxxxxxy*x &
      **3 + L_xxxyyyy*y**3 + L_xxxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxy* &
      x**2 + L_xxxxxyy*x**2*y + L_xxxxxyz*x**2*z + L_xxxxyyy*x*y**2 + &
      L_xxxxyzz*x*z**2 + L_xxxyyy*y**2 + L_xxxyyyz*y**2*z + L_xxxyyzz*y &
      *z**2 + L_xxxyzz*z**2)
    Ls_xxxyz   = L_xxxxyyz*x*y + L_xxxxyz*x + L_xxxxyzz*x*z + L_xxxyyz*y + L_xxxyyzz*y*z &
      + L_xxxyz + L_xxxyzz*z + (1.0d0/2.0d0)*(L_xxxxxyz*x**2 + &
      L_xxxyyyz*y**2 + L_xxxyzzz*z**2)
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    Ls_xxx     = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/24.0d0)*(L_xxxxxxx*x**4 + &
      L_xxxyyyy*y**4 + L_xxxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxxyy*x**2* &
      y**2 + L_xxxxxzz*x**2*z**2 + L_xxxyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxx*x**3 + L_xxxxxxy*x**3*y + L_xxxxxxz*x**3*z + L_xxxxyyy &
      *x*y**3 + L_xxxxzzz*x*z**3 + L_xxxyyy*y**3 + L_xxxyyyz*y**3*z + &
      L_xxxyzzz*y*z**3 + L_xxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxx*x**2 + &
      L_xxxxxy*x**2*y + L_xxxxxyz*x**2*y*z + L_xxxxxz*x**2*z + L_xxxxyy &
      *x*y**2 + L_xxxxyyz*x*y**2*z + L_xxxxyzz*x*y*z**2 + L_xxxxzz*x*z &
      **2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z**2 + L_xxxzz* &
      z**2)
    Ls_xxxz    = L_xxxxyz*x*y + L_xxxxyzz*x*y*z + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + &
      L_xxxyzz*y*z + L_xxxz + L_xxxzz*z + (1.0d0/6.0d0)*(L_xxxxxxz*x**3 &
      + L_xxxyyyz*y**3 + L_xxxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxyz*x** &
      2*y + L_xxxxxz*x**2 + L_xxxxxzz*x**2*z + L_xxxxyyz*x*y**2 + &
      L_xxxxzzz*x*z**2 + L_xxxyyz*y**2 + L_xxxyyzz*y**2*z + L_xxxyzzz*y &
      *z**2 + L_xxxzzz*z**2)
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    Ls_xxyyy   = L_xxxyyy*x + L_xxxyyyy*x*y + L_xxxyyyz*x*z + L_xxyyy + L_xxyyyy*y + &
      L_xxyyyyz*y*z + L_xxyyyz*z + (1.0d0/2.0d0)*(L_xxxxyyy*x**2 + &
      L_xxyyyyy*y**2 + L_xxyyyzz*z**2)
    Ls_xxyyyz  = L_xxxyyyz*x + L_xxyyyyz*y + L_xxyyyz + L_xxyyyzz*z
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    Ls_xxyy    = L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyyz*x*y*z + L_xxxyyz*x*z + L_xxyy + &
      L_xxyyy*y + L_xxyyyz*y*z + L_xxyyz*z + (1.0d0/6.0d0)*(L_xxxxxyy*x &
      **3 + L_xxyyyyy*y**3 + L_xxyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyy* &
      x**2 + L_xxxxyyy*x**2*y + L_xxxxyyz*x**2*z + L_xxxyyyy*x*y**2 + &
      L_xxxyyzz*x*z**2 + L_xxyyyy*y**2 + L_xxyyyyz*y**2*z + L_xxyyyzz*y &
      *z**2 + L_xxyyzz*z**2)
    Ls_xxyyz   = L_xxxyyyz*x*y + L_xxxyyz*x + L_xxxyyzz*x*z + L_xxyyyz*y + L_xxyyyzz*y*z &
      + L_xxyyz + L_xxyyzz*z + (1.0d0/2.0d0)*(L_xxxxyyz*x**2 + &
      L_xxyyyyz*y**2 + L_xxyyzzz*z**2)
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    Ls_xxy     = L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/24.0d0)*(L_xxxxxxy*x**4 + &
      L_xxyyyyy*y**4 + L_xxyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyyy*x**2* &
      y**2 + L_xxxxyzz*x**2*z**2 + L_xxyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxy*x**3 + L_xxxxxyy*x**3*y + L_xxxxxyz*x**3*z + L_xxxyyyy &
      *x*y**3 + L_xxxyzzz*x*z**3 + L_xxyyyy*y**3 + L_xxyyyyz*y**3*z + &
      L_xxyyzzz*y*z**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + &
      L_xxxxyy*x**2*y + L_xxxxyyz*x**2*y*z + L_xxxxyz*x**2*z + L_xxxyyy &
      *x*y**2 + L_xxxyyyz*x*y**2*z + L_xxxyyzz*x*y*z**2 + L_xxxyzz*x*z &
      **2 + L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz* &
      z**2)
    Ls_xxyz    = L_xxxyyz*x*y + L_xxxyyzz*x*y*z + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + &
      L_xxyyzz*y*z + L_xxyz + L_xxyzz*z + (1.0d0/6.0d0)*(L_xxxxxyz*x**3 &
      + L_xxyyyyz*y**3 + L_xxyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyyz*x** &
      2*y + L_xxxxyz*x**2 + L_xxxxyzz*x**2*z + L_xxxyyyz*x*y**2 + &
      L_xxxyzzz*x*z**2 + L_xxyyyz*y**2 + L_xxyyyzz*y**2*z + L_xxyyzzz*y &
      *z**2 + L_xxyzzz*z**2)
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    Ls_xx      = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + &
      L_xxyyyyy*y**5 + L_xxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3 &
      *y**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x**2*y**3 + L_xxxxzzz*x** &
      2*z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x &
      **2*y*z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + &
      L_xxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + L_xxxxyz*x** &
      2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x*y**2*z + &
      L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + L_xxyyz*y**2*z &
      + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxx*x**3 + &
      L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x**3*z + L_xxxyyy &
      *x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 + L_xxxzzz*x*z &
      **3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z**3 + L_xxzzz* &
      z**3)
    Ls_xxz     = L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/24.0d0)*(L_xxxxxxz*x**4 + &
      L_xxyyyyz*y**4 + L_xxzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyyz*x**2* &
      y**2 + L_xxxxzzz*x**2*z**2 + L_xxyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxxyz*x**3*y + L_xxxxxz*x**3 + L_xxxxxzz*x**3*z + L_xxxyyyz &
      *x*y**3 + L_xxxzzzz*x*z**3 + L_xxyyyz*y**3 + L_xxyyyzz*y**3*z + &
      L_xxyzzzz*y*z**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2* &
      y + L_xxxxyzz*x**2*y*z + L_xxxxz*x**2 + L_xxxxzz*x**2*z + &
      L_xxxyyz*x*y**2 + L_xxxyyzz*x*y**2*z + L_xxxyzzz*x*y*z**2 + &
      L_xxxzzz*x*z**2 + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z** &
      2 + L_xxzzz*z**2)
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    Ls_xyyyy   = L_xxyyyy*x + L_xxyyyyy*x*y + L_xxyyyyz*x*z + L_xyyyy + L_xyyyyy*y + &
      L_xyyyyyz*y*z + L_xyyyyz*z + (1.0d0/2.0d0)*(L_xxxyyyy*x**2 + &
      L_xyyyyyy*y**2 + L_xyyyyzz*z**2)
    Ls_xyyyyz  = L_xxyyyyz*x + L_xyyyyyz*y + L_xyyyyz + L_xyyyyzz*z
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    Ls_xyyy    = L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyyz*x*y*z + L_xxyyyz*x*z + L_xyyy + &
      L_xyyyy*y + L_xyyyyz*y*z + L_xyyyz*z + (1.0d0/6.0d0)*(L_xxxxyyy*x &
      **3 + L_xyyyyyy*y**3 + L_xyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyy* &
      x**2 + L_xxxyyyy*x**2*y + L_xxxyyyz*x**2*z + L_xxyyyyy*x*y**2 + &
      L_xxyyyzz*x*z**2 + L_xyyyyy*y**2 + L_xyyyyyz*y**2*z + L_xyyyyzz*y &
      *z**2 + L_xyyyzz*z**2)
    Ls_xyyyz   = L_xxyyyyz*x*y + L_xxyyyz*x + L_xxyyyzz*x*z + L_xyyyyz*y + L_xyyyyzz*y*z &
      + L_xyyyz + L_xyyyzz*z + (1.0d0/2.0d0)*(L_xxxyyyz*x**2 + &
      L_xyyyyyz*y**2 + L_xyyyzzz*z**2)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    Ls_xyy     = L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/24.0d0)*(L_xxxxxyy*x**4 + &
      L_xyyyyyy*y**4 + L_xyyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyyy*x**2* &
      y**2 + L_xxxyyzz*x**2*z**2 + L_xyyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxyy*x**3 + L_xxxxyyy*x**3*y + L_xxxxyyz*x**3*z + L_xxyyyyy &
      *x*y**3 + L_xxyyzzz*x*z**3 + L_xyyyyy*y**3 + L_xyyyyyz*y**3*z + &
      L_xyyyzzz*y*z**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + &
      L_xxxyyy*x**2*y + L_xxxyyyz*x**2*y*z + L_xxxyyz*x**2*z + L_xxyyyy &
      *x*y**2 + L_xxyyyyz*x*y**2*z + L_xxyyyzz*x*y*z**2 + L_xxyyzz*x*z &
      **2 + L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz* &
      z**2)
    Ls_xyyz    = L_xxyyyz*x*y + L_xxyyyzz*x*y*z + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + &
      L_xyyyzz*y*z + L_xyyz + L_xyyzz*z + (1.0d0/6.0d0)*(L_xxxxyyz*x**3 &
      + L_xyyyyyz*y**3 + L_xyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyyz*x** &
      2*y + L_xxxyyz*x**2 + L_xxxyyzz*x**2*z + L_xxyyyyz*x*y**2 + &
      L_xxyyzzz*x*z**2 + L_xyyyyz*y**2 + L_xyyyyzz*y**2*z + L_xyyyzzz*y &
      *z**2 + L_xyyzzz*z**2)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    Ls_xy      = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + &
      L_xyyyyyy*y**5 + L_xyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3 &
      *y**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x**2*y**3 + L_xxxyzzz*x** &
      2*z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x &
      **2*y*z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + &
      L_xyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x &
      **4*y + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2)
    Ls_xyz     = L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/24.0d0)*(L_xxxxxyz*x**4 + &
      L_xyyyyyz*y**4 + L_xyzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyyz*x**2* &
      y**2 + L_xxxyzzz*x**2*z**2 + L_xyyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxxyyz*x**3*y + L_xxxxyz*x**3 + L_xxxxyzz*x**3*z + L_xxyyyyz &
      *x*y**3 + L_xxyzzzz*x*z**3 + L_xyyyyz*y**3 + L_xyyyyzz*y**3*z + &
      L_xyyzzzz*y*z**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2* &
      y + L_xxxyyzz*x**2*y*z + L_xxxyz*x**2 + L_xxxyzz*x**2*z + &
      L_xxyyyz*x*y**2 + L_xxyyyzz*x*y**2*z + L_xxyyzzz*x*y*z**2 + &
      L_xxyzzz*x*z**2 + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z** &
      2 + L_xyzzz*z**2)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    Ls_x       = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxx*x**6 + L_xyyyyyy*y**6 + L_xzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxzzz*x**3*z**3 + &
      L_xyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyy*x**4*y**2 + &
      L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y**4 + L_xxxzzzz*x**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyy*x**2*y**2 + L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + &
      L_xxxzz*x**2*z**2 + L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxz*x**5 &
      *z + L_xxyyyyy*x*y**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxyz*x**4*y*z + L_xxxxxz*x &
      **4*z + L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 &
      + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z &
      **4 + L_xzzzz*z**4) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + &
      L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z**2 + L_xxxxzz*x**3*z** &
      2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3*z + L_xxxyzzz*x**2*y &
      *z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y**3*z**2 + L_xxyyzzz*x* &
      y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y**2*z**3)
    Ls_xz      = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/120.0d0)*(L_xxxxxxz*x**5 + L_xyyyyyz*y &
      **5 + L_xzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + &
      L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x**2*y**3 + L_xxxzzzz*x**2*z**3 + &
      L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y*z** &
      2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxz*x**4 + &
      L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + L_xxzzzzz*x*z**4 + L_xyyyyz &
      *y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 &
      + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + &
      L_xxyzzzz*x*y*z**3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y &
      **3*z + L_xyzzzz*y*z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz* &
      x**2*y + L_xxxyzz*x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + &
      L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz* &
      x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z &
      **2)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    Ls_yyyyy   = L_xyyyyy*x + L_xyyyyyy*x*y + L_xyyyyyz*x*z + L_yyyyy + L_yyyyyy*y + &
      L_yyyyyyz*y*z + L_yyyyyz*z + (1.0d0/2.0d0)*(L_xxyyyyy*x**2 + &
      L_yyyyyyy*y**2 + L_yyyyyzz*z**2)
    Ls_yyyyyz  = L_xyyyyyz*x + L_yyyyyyz*y + L_yyyyyz + L_yyyyyzz*z
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    Ls_yyyy    = L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyyz*x*y*z + L_xyyyyz*x*z + L_yyyy + &
      L_yyyyy*y + L_yyyyyz*y*z + L_yyyyz*z + (1.0d0/6.0d0)*(L_xxxyyyy*x &
      **3 + L_yyyyyyy*y**3 + L_yyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyy* &
      x**2 + L_xxyyyyy*x**2*y + L_xxyyyyz*x**2*z + L_xyyyyyy*x*y**2 + &
      L_xyyyyzz*x*z**2 + L_yyyyyy*y**2 + L_yyyyyyz*y**2*z + L_yyyyyzz*y &
      *z**2 + L_yyyyzz*z**2)
    Ls_yyyyz   = L_xyyyyyz*x*y + L_xyyyyz*x + L_xyyyyzz*x*z + L_yyyyyz*y + L_yyyyyzz*y*z &
      + L_yyyyz + L_yyyyzz*z + (1.0d0/2.0d0)*(L_xxyyyyz*x**2 + &
      L_yyyyyyz*y**2 + L_yyyyzzz*z**2)
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    Ls_yyy     = L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/24.0d0)*(L_xxxxyyy*x**4 + &
      L_yyyyyyy*y**4 + L_yyyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyyy*x**2* &
      y**2 + L_xxyyyzz*x**2*z**2 + L_yyyyyzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxyyy*x**3 + L_xxxyyyy*x**3*y + L_xxxyyyz*x**3*z + L_xyyyyyy &
      *x*y**3 + L_xyyyzzz*x*z**3 + L_yyyyyy*y**3 + L_yyyyyyz*y**3*z + &
      L_yyyyzzz*y*z**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + &
      L_xxyyyy*x**2*y + L_xxyyyyz*x**2*y*z + L_xxyyyz*x**2*z + L_xyyyyy &
      *x*y**2 + L_xyyyyyz*x*y**2*z + L_xyyyyzz*x*y*z**2 + L_xyyyzz*x*z &
      **2 + L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz* &
      z**2)
    Ls_yyyz    = L_xyyyyz*x*y + L_xyyyyzz*x*y*z + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + &
      L_yyyyzz*y*z + L_yyyz + L_yyyzz*z + (1.0d0/6.0d0)*(L_xxxyyyz*x**3 &
      + L_yyyyyyz*y**3 + L_yyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyyz*x** &
      2*y + L_xxyyyz*x**2 + L_xxyyyzz*x**2*z + L_xyyyyyz*x*y**2 + &
      L_xyyyzzz*x*z**2 + L_yyyyyz*y**2 + L_yyyyyzz*y**2*z + L_yyyyzzz*y &
      *z**2 + L_yyyzzz*z**2)
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    Ls_yy      = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + &
      L_yyyyyyy*y**5 + L_yyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3 &
      *y**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x**2*y**3 + L_xxyyzzz*x** &
      2*z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x &
      **2*y*z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + &
      L_yyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x &
      **4*y + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2)
    Ls_yyz     = L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/24.0d0)*(L_xxxxyyz*x**4 + &
      L_yyyyyyz*y**4 + L_yyzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyyz*x**2* &
      y**2 + L_xxyyzzz*x**2*z**2 + L_yyyyzzz*y**2*z**2) + (1.0d0/6.0d0) &
      *(L_xxxyyyz*x**3*y + L_xxxyyz*x**3 + L_xxxyyzz*x**3*z + L_xyyyyyz &
      *x*y**3 + L_xyyzzzz*x*z**3 + L_yyyyyz*y**3 + L_yyyyyzz*y**3*z + &
      L_yyyzzzz*y*z**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2* &
      y + L_xxyyyzz*x**2*y*z + L_xxyyz*x**2 + L_xxyyzz*x**2*z + &
      L_xyyyyz*x*y**2 + L_xyyyyzz*x*y**2*z + L_xyyyzzz*x*y*z**2 + &
      L_xyyzzz*x*z**2 + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z** &
      2 + L_yyzzz*z**2)
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    Ls_y       = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxy*x**6 + L_yyyyyyy*y**6 + L_yzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyzzz*x**3*z**3 + &
      L_yyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyy*x**4*y**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyzzzz*x**2*z**4 + &
      L_yyyyyzz*y**4*z**2 + L_yyyzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyy*x**2*y**2 + L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + &
      L_xxyzz*x**2*z**2 + L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyz*x**5 &
      *z + L_xyyyyyy*x*y**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xyyyyy*x*y**4 + L_xyyyyyz*x*y**4*z + &
      L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y &
      **4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x &
      **3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + &
      L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz* &
      x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y &
      *z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x &
      *y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z &
      **2 + L_yzz*z**2) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3)
    Ls_yz      = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/120.0d0)*(L_xxxxxyz*x**5 + L_yyyyyyz*y &
      **5 + L_yzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + &
      L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x**2*y**3 + L_xxyzzzz*x**2*z**3 + &
      L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/4.0d0)*( &
      L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y*z** &
      2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2*z &
      **2) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyz*x**4 + &
      L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + L_xyzzzzz*x*z**4 + L_yyyyyz &
      *y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z**4) + ( &
      1.0d0/6.0d0)*(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 &
      + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + &
      L_xyyzzzz*x*y*z**3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y &
      **3*z + L_yyzzzz*y*z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz* &
      x**2*y + L_xxyyzz*x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + &
      L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz* &
      x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z &
      **2)
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    Ls_0       = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/5040.0d0)*( &
      L_xxxxxxx*x**7 + L_yyyyyyy*y**7 + L_zzzzzzz*z**7) + (1.0d0/ &
      240.0d0)*(L_xxxxxyy*x**5*y**2 + L_xxxxxzz*x**5*z**2 + L_xxyyyyy*x &
      **2*y**5 + L_xxzzzzz*x**2*z**5 + L_yyyyyzz*y**5*z**2 + L_yyzzzzz* &
      y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyy*x**4*y**3 + L_xxxxzzz*x** &
      4*z**3 + L_xxxyyyy*x**3*y**4 + L_xxxzzzz*x**3*z**4 + L_yyyyzzz*y &
      **4*z**3 + L_yyyzzzz*y**3*z**4) + (1.0d0/36.0d0)*(L_xxxyyy*x**3*y &
      **3 + L_xxxyyyz*x**3*y**3*z + L_xxxyzzz*x**3*y*z**3 + L_xxxzzz*x &
      **3*z**3 + L_xyyyzzz*x*y**3*z**3 + L_yyyzzz*y**3*z**3) + (1.0d0/ &
      4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z + L_xxyzz*x**2*y*z &
      **2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + L_yyzz*y**2*z**2) &
      + (1.0d0/720.0d0)*(L_xxxxxx*x**6 + L_xxxxxxy*x**6*y + L_xxxxxxz*x &
      **6*z + L_xyyyyyy*x*y**6 + L_xzzzzzz*x*z**6 + L_yyyyyy*y**6 + &
      L_yyyyyyz*y**6*z + L_yzzzzzz*y*z**6 + L_zzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z &
      + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 &
      + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z**2) + (1.0d0/ &
      6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z + L_xxxz*x &
      **3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y*z**3 + &
      L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 + &
      L_zzz*z**3) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5*y + &
      L_xxxxxyz*x**5*y*z + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + &
      L_xyyyyyz*x*y**5*z + L_xyzzzzz*x*y*z**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxyyz*x**4*y**2*z + &
      L_xxxxyzz*x**4*y*z**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy*x**2*y**4 + &
      L_xxyyyyz*x**2*y**4*z + L_xxyzzzz*x**2*y*z**4 + L_xxzzzz*x**2*z** &
      4 + L_xyyyyzz*x*y**4*z**2 + L_xyyzzzz*x*y**2*z**4 + L_yyyyzz*y**4 &
      *z**2 + L_yyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + &
      L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + L_xxyzzz*x**2*y*z**3 + &
      L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + L_xyyzzz*x*y**2*z**3 + &
      L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3) + (1.0d0/24.0d0)*(L_xxxx*x &
      **4 + L_xxxxy*x**4*y + L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + &
      L_xxxyyzz*x**3*y**2*z**2 + L_xxyyyzz*x**2*y**3*z**2 + L_xxyyzzz*x &
      **2*y**2*z**3 + L_xyyyy*x*y**4 + L_xyyyyz*x*y**4*z + L_xyzzzz*x*y &
      *z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y &
      *z**4 + L_zzzz*z**4)
    Ls_z       = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      720.0d0)*(L_xxxxxxz*x**6 + L_yyyyyyz*y**6 + L_zzzzzzz*z**6) + ( &
      1.0d0/36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxzzzz*x**3*z**3 + &
      L_yyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyz*x**4*y**2 + &
      L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y**4 + L_xxzzzzz*x**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyz*x**2*y**2 + L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + &
      L_xxzzz*x**2*z**2 + L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + ( &
      1.0d0/120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxz*x**5 + L_xxxxxzz*x**5 &
      *z + L_xyyyyyz*x*y**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      24.0d0)*(L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + &
      L_xxxxzz*x**4*z + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z + &
      L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y &
      **4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyyz*x**3*y**2 + L_xxxyyzz*x**3*y**2*z + L_xxxyzzz*x**3*y*z** &
      2 + L_xxxzzz*x**3*z**2 + L_xxyyyz*x**2*y**3 + L_xxyyyzz*x**2*y**3 &
      *z + L_xxyzzzz*x**2*y*z**3 + L_xxzzzz*x**2*z**3 + L_xyyyzzz*x*y** &
      3*z**2 + L_xyyzzzz*x*y**2*z**3 + L_yyyzzz*y**3*z**2 + L_yyzzzz*y &
      **2*z**3) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz*x**3*y*z + &
      L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xyyyzz*x*y**3*z &
      + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 + L_yyyzz*y**3 &
      *z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)*(L_xxyz*x**2*y &
      + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + L_xyyz*x*y**2 + &
      L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z**2 + L_yyz*y**2 &
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
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
