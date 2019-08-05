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
        
    
! OPS  76*DIV + 168*MUL + 105*POW = 349  (383 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u
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
    M_0      = W
    M_x      = W*x
    M_y      = W*y
    M_z      = W*z
    M_xx     = (1.0d0/2.0d0)*W*x**2
    M_xy     = W*x*y
    M_xz     = W*x*z
    M_yy     = (1.0d0/2.0d0)*W*y**2
    M_yz     = W*y*z
    M_zz     = (1.0d0/2.0d0)*W*z**2
    M_xxx    = (1.0d0/6.0d0)*W*x**3
    M_xxy    = (1.0d0/2.0d0)*W*x**2*y
    M_xxz    = (1.0d0/2.0d0)*W*x**2*z
    M_xyy    = (1.0d0/2.0d0)*W*x*y**2
    M_xyz    = W*x*y*z
    M_xzz    = (1.0d0/2.0d0)*W*x*z**2
    M_yyy    = (1.0d0/6.0d0)*W*y**3
    M_yyz    = (1.0d0/2.0d0)*W*y**2*z
    M_yzz    = (1.0d0/2.0d0)*W*y*z**2
    M_zzz    = (1.0d0/6.0d0)*W*z**3
    M_xxxx   = (1.0d0/24.0d0)*W*x**4
    M_xxxy   = (1.0d0/6.0d0)*W*x**3*y
    M_xxxz   = (1.0d0/6.0d0)*W*x**3*z
    M_xxyy   = (1.0d0/4.0d0)*W*x**2*y**2
    M_xxyz   = (1.0d0/2.0d0)*W*x**2*y*z
    M_xxzz   = (1.0d0/4.0d0)*W*x**2*z**2
    M_xyyy   = (1.0d0/6.0d0)*W*x*y**3
    M_xyyz   = (1.0d0/2.0d0)*W*x*y**2*z
    M_xyzz   = (1.0d0/2.0d0)*W*x*y*z**2
    M_xzzz   = (1.0d0/6.0d0)*W*x*z**3
    M_yyyy   = (1.0d0/24.0d0)*W*y**4
    M_yyyz   = (1.0d0/6.0d0)*W*y**3*z
    M_yyzz   = (1.0d0/4.0d0)*W*y**2*z**2
    M_yzzz   = (1.0d0/6.0d0)*W*y*z**3
    M_zzzz   = (1.0d0/24.0d0)*W*z**4
    M_xxxxx  = (1.0d0/120.0d0)*W*x**5
    M_xxxxy  = (1.0d0/24.0d0)*W*x**4*y
    M_xxxxz  = (1.0d0/24.0d0)*W*x**4*z
    M_xxxyy  = (1.0d0/12.0d0)*W*x**3*y**2
    M_xxxyz  = (1.0d0/6.0d0)*W*x**3*y*z
    M_xxxzz  = (1.0d0/12.0d0)*W*x**3*z**2
    M_xxyyy  = (1.0d0/12.0d0)*W*x**2*y**3
    M_xxyyz  = (1.0d0/4.0d0)*W*x**2*y**2*z
    M_xxyzz  = (1.0d0/4.0d0)*W*x**2*y*z**2
    M_xxzzz  = (1.0d0/12.0d0)*W*x**2*z**3
    M_xyyyy  = (1.0d0/24.0d0)*W*x*y**4
    M_xyyyz  = (1.0d0/6.0d0)*W*x*y**3*z
    M_xyyzz  = (1.0d0/4.0d0)*W*x*y**2*z**2
    M_xyzzz  = (1.0d0/6.0d0)*W*x*y*z**3
    M_xzzzz  = (1.0d0/24.0d0)*W*x*z**4
    M_yyyyy  = (1.0d0/120.0d0)*W*y**5
    M_yyyyz  = (1.0d0/24.0d0)*W*y**4*z
    M_yyyzz  = (1.0d0/12.0d0)*W*y**3*z**2
    M_yyzzz  = (1.0d0/12.0d0)*W*y**2*z**3
    M_yzzzz  = (1.0d0/24.0d0)*W*y*z**4
    M_zzzzz  = (1.0d0/120.0d0)*W*z**5
    M_xxxxxx = (1.0d0/720.0d0)*W*x**6
    M_xxxxxy = (1.0d0/120.0d0)*W*x**5*y
    M_xxxxxz = (1.0d0/120.0d0)*W*x**5*z
    M_xxxxyy = (1.0d0/48.0d0)*W*x**4*y**2
    M_xxxxyz = (1.0d0/24.0d0)*W*x**4*y*z
    M_xxxxzz = (1.0d0/48.0d0)*W*x**4*z**2
    M_xxxyyy = (1.0d0/36.0d0)*W*x**3*y**3
    M_xxxyyz = (1.0d0/12.0d0)*W*x**3*y**2*z
    M_xxxyzz = (1.0d0/12.0d0)*W*x**3*y*z**2
    M_xxxzzz = (1.0d0/36.0d0)*W*x**3*z**3
    M_xxyyyy = (1.0d0/48.0d0)*W*x**2*y**4
    M_xxyyyz = (1.0d0/12.0d0)*W*x**2*y**3*z
    M_xxyyzz = (1.0d0/8.0d0)*W*x**2*y**2*z**2
    M_xxyzzz = (1.0d0/12.0d0)*W*x**2*y*z**3
    M_xxzzzz = (1.0d0/48.0d0)*W*x**2*z**4
    M_xyyyyy = (1.0d0/120.0d0)*W*x*y**5
    M_xyyyyz = (1.0d0/24.0d0)*W*x*y**4*z
    M_xyyyzz = (1.0d0/12.0d0)*W*x*y**3*z**2
    M_xyyzzz = (1.0d0/12.0d0)*W*x*y**2*z**3
    M_xyzzzz = (1.0d0/24.0d0)*W*x*y*z**4
    M_xzzzzz = (1.0d0/120.0d0)*W*x*z**5
    M_yyyyyy = (1.0d0/720.0d0)*W*y**6
    M_yyyyyz = (1.0d0/120.0d0)*W*y**5*z
    M_yyyyzz = (1.0d0/48.0d0)*W*y**4*z**2
    M_yyyzzz = (1.0d0/36.0d0)*W*y**3*z**3
    M_yyzzzz = (1.0d0/48.0d0)*W*y**2*z**4
    M_yzzzzz = (1.0d0/120.0d0)*W*y*z**5
    M_zzzzzz = (1.0d0/720.0d0)*W*z**6
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
    
! OPS  840*ADD + 237*DIV + 1386*MUL + 630*POW = 3093  (3437 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u
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
    Ms_0      = M_0
    Ms_x      = M_0*x + M_x
    Ms_y      = M_0*y + M_y
    Ms_z      = M_0*z + M_z
    Ms_xx     = (1.0d0/2.0d0)*M_0*x**2 + M_x*x + M_xx
    Ms_xy     = M_0*x*y + M_x*y + M_xy + M_y*x
    Ms_xz     = M_0*x*z + M_x*z + M_xz + M_z*x
    Ms_yy     = (1.0d0/2.0d0)*M_0*y**2 + M_y*y + M_yy
    Ms_yz     = M_0*y*z + M_y*z + M_yz + M_z*y
    Ms_zz     = (1.0d0/2.0d0)*M_0*z**2 + M_z*z + M_zz
    Ms_xxx    = (1.0d0/6.0d0)*M_0*x**3 + (1.0d0/2.0d0)*M_x*x**2 + M_xx*x + M_xxx
    Ms_xxy    = M_x*x*y + M_xx*y + M_xxy + M_xy*x + (1.0d0/2.0d0)*(M_0*x**2*y + M_y*x**2 &
      )
    Ms_xxz    = M_x*x*z + M_xx*z + M_xxz + M_xz*x + (1.0d0/2.0d0)*(M_0*x**2*z + M_z*x**2 &
      )
    Ms_xyy    = M_xy*y + M_xyy + M_y*x*y + M_yy*x + (1.0d0/2.0d0)*(M_0*x*y**2 + M_x*y**2 &
      )
    Ms_xyz    = M_0*x*y*z + M_x*y*z + M_xy*z + M_xyz + M_xz*y + M_y*x*z + M_yz*x + M_z*x &
      *y
    Ms_xzz    = M_xz*z + M_xzz + M_z*x*z + M_zz*x + (1.0d0/2.0d0)*(M_0*x*z**2 + M_x*z**2 &
      )
    Ms_yyy    = (1.0d0/6.0d0)*M_0*y**3 + (1.0d0/2.0d0)*M_y*y**2 + M_yy*y + M_yyy
    Ms_yyz    = M_y*y*z + M_yy*z + M_yyz + M_yz*y + (1.0d0/2.0d0)*(M_0*y**2*z + M_z*y**2 &
      )
    Ms_yzz    = M_yz*z + M_yzz + M_z*y*z + M_zz*y + (1.0d0/2.0d0)*(M_0*y*z**2 + M_y*z**2 &
      )
    Ms_zzz    = (1.0d0/6.0d0)*M_0*z**3 + (1.0d0/2.0d0)*M_z*z**2 + M_zz*z + M_zzz
    Ms_xxxx   = (1.0d0/24.0d0)*M_0*x**4 + (1.0d0/6.0d0)*M_x*x**3 + (1.0d0/2.0d0)*M_xx*x &
      **2 + M_xxx*x + M_xxxx
    Ms_xxxy   = M_xx*x*y + M_xxx*y + M_xxxy + M_xxy*x + (1.0d0/6.0d0)*(M_0*x**3*y + M_y* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*y + M_xy*x**2)
    Ms_xxxz   = M_xx*x*z + M_xxx*z + M_xxxz + M_xxz*x + (1.0d0/6.0d0)*(M_0*x**3*z + M_z* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*z + M_xz*x**2)
    Ms_xxyy   = (1.0d0/4.0d0)*M_0*x**2*y**2 + M_xxy*y + M_xxyy + M_xy*x*y + M_xyy*x + ( &
      1.0d0/2.0d0)*(M_x*x*y**2 + M_xx*y**2 + M_y*x**2*y + M_yy*x**2)
    Ms_xxyz   = M_x*x*y*z + M_xx*y*z + M_xxy*z + M_xxyz + M_xxz*y + M_xy*x*z + M_xyz*x + &
      M_xz*x*y + (1.0d0/2.0d0)*(M_0*x**2*y*z + M_y*x**2*z + M_yz*x**2 + &
      M_z*x**2*y)
    Ms_xxzz   = (1.0d0/4.0d0)*M_0*x**2*z**2 + M_xxz*z + M_xxzz + M_xz*x*z + M_xzz*x + ( &
      1.0d0/2.0d0)*(M_x*x*z**2 + M_xx*z**2 + M_z*x**2*z + M_zz*x**2)
    Ms_xyyy   = M_xyy*y + M_xyyy + M_yy*x*y + M_yyy*x + (1.0d0/2.0d0)*(M_xy*y**2 + M_y*x &
      *y**2) + (1.0d0/6.0d0)*(M_0*x*y**3 + M_x*y**3)
    Ms_xyyz   = M_xy*y*z + M_xyy*z + M_xyyz + M_xyz*y + M_y*x*y*z + M_yy*x*z + M_yyz*x + &
      M_yz*x*y + (1.0d0/2.0d0)*(M_0*x*y**2*z + M_x*y**2*z + M_xz*y**2 + &
      M_z*x*y**2)
    Ms_xyzz   = M_xyz*z + M_xyzz + M_xz*y*z + M_xzz*y + M_yz*x*z + M_yzz*x + M_z*x*y*z + &
      M_zz*x*y + (1.0d0/2.0d0)*(M_0*x*y*z**2 + M_x*y*z**2 + M_xy*z**2 + &
      M_y*x*z**2)
    Ms_xzzz   = M_xzz*z + M_xzzz + M_zz*x*z + M_zzz*x + (1.0d0/2.0d0)*(M_xz*z**2 + M_z*x &
      *z**2) + (1.0d0/6.0d0)*(M_0*x*z**3 + M_x*z**3)
    Ms_yyyy   = (1.0d0/24.0d0)*M_0*y**4 + (1.0d0/6.0d0)*M_y*y**3 + (1.0d0/2.0d0)*M_yy*y &
      **2 + M_yyy*y + M_yyyy
    Ms_yyyz   = M_yy*y*z + M_yyy*z + M_yyyz + M_yyz*y + (1.0d0/6.0d0)*(M_0*y**3*z + M_z* &
      y**3) + (1.0d0/2.0d0)*(M_y*y**2*z + M_yz*y**2)
    Ms_yyzz   = (1.0d0/4.0d0)*M_0*y**2*z**2 + M_yyz*z + M_yyzz + M_yz*y*z + M_yzz*y + ( &
      1.0d0/2.0d0)*(M_y*y*z**2 + M_yy*z**2 + M_z*y**2*z + M_zz*y**2)
    Ms_yzzz   = M_yzz*z + M_yzzz + M_zz*y*z + M_zzz*y + (1.0d0/2.0d0)*(M_yz*z**2 + M_z*y &
      *z**2) + (1.0d0/6.0d0)*(M_0*y*z**3 + M_y*z**3)
    Ms_zzzz   = (1.0d0/24.0d0)*M_0*z**4 + (1.0d0/6.0d0)*M_z*z**3 + (1.0d0/2.0d0)*M_zz*z &
      **2 + M_zzz*z + M_zzzz
    Ms_xxxxx  = (1.0d0/120.0d0)*M_0*x**5 + (1.0d0/24.0d0)*M_x*x**4 + (1.0d0/6.0d0)*M_xx* &
      x**3 + (1.0d0/2.0d0)*M_xxx*x**2 + M_xxxx*x + M_xxxxx
    Ms_xxxxy  = M_xxx*x*y + M_xxxx*y + M_xxxxy + M_xxxy*x + (1.0d0/24.0d0)*(M_0*x**4*y + &
      M_y*x**4) + (1.0d0/6.0d0)*(M_x*x**3*y + M_xy*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*y + M_xxy*x**2)
    Ms_xxxxz  = M_xxx*x*z + M_xxxx*z + M_xxxxz + M_xxxz*x + (1.0d0/24.0d0)*(M_0*x**4*z + &
      M_z*x**4) + (1.0d0/6.0d0)*(M_x*x**3*z + M_xz*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*z + M_xxz*x**2)
    Ms_xxxyy  = (1.0d0/12.0d0)*M_0*x**3*y**2 + (1.0d0/4.0d0)*M_x*x**2*y**2 + M_xxxy*y + &
      M_xxxyy + M_xxy*x*y + M_xxyy*x + (1.0d0/6.0d0)*(M_y*x**3*y + M_yy &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*y**2 + M_xxx*y**2 + M_xy*x**2*y + &
      M_xyy*x**2)
    Ms_xxxyz  = M_xx*x*y*z + M_xxx*y*z + M_xxxy*z + M_xxxyz + M_xxxz*y + M_xxy*x*z + &
      M_xxyz*x + M_xxz*x*y + (1.0d0/6.0d0)*(M_0*x**3*y*z + M_y*x**3*z + &
      M_yz*x**3 + M_z*x**3*y) + (1.0d0/2.0d0)*(M_x*x**2*y*z + M_xy*x**2 &
      *z + M_xyz*x**2 + M_xz*x**2*y)
    Ms_xxxzz  = (1.0d0/12.0d0)*M_0*x**3*z**2 + (1.0d0/4.0d0)*M_x*x**2*z**2 + M_xxxz*z + &
      M_xxxzz + M_xxz*x*z + M_xxzz*x + (1.0d0/6.0d0)*(M_z*x**3*z + M_zz &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*z**2 + M_xxx*z**2 + M_xz*x**2*z + &
      M_xzz*x**2)
    Ms_xxyyy  = (1.0d0/12.0d0)*M_0*x**2*y**3 + M_xxyy*y + M_xxyyy + M_xyy*x*y + M_xyyy*x &
      + (1.0d0/4.0d0)*M_y*x**2*y**2 + (1.0d0/6.0d0)*(M_x*x*y**3 + M_xx* &
      y**3) + (1.0d0/2.0d0)*(M_xxy*y**2 + M_xy*x*y**2 + M_yy*x**2*y + &
      M_yyy*x**2)
    Ms_xxyyz  = M_xxy*y*z + M_xxyy*z + M_xxyyz + M_xxyz*y + M_xy*x*y*z + M_xyy*x*z + &
      M_xyyz*x + M_xyz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y**2*z + M_z*x**2* &
      y**2) + (1.0d0/2.0d0)*(M_x*x*y**2*z + M_xx*y**2*z + M_xxz*y**2 + &
      M_xz*x*y**2 + M_y*x**2*y*z + M_yy*x**2*z + M_yyz*x**2 + M_yz*x**2 &
      *y)
    Ms_xxyzz  = M_xxyz*z + M_xxyzz + M_xxz*y*z + M_xxzz*y + M_xyz*x*z + M_xyzz*x + M_xz* &
      x*y*z + M_xzz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y*z**2 + M_y*x**2*z** &
      2) + (1.0d0/2.0d0)*(M_x*x*y*z**2 + M_xx*y*z**2 + M_xxy*z**2 + &
      M_xy*x*z**2 + M_yz*x**2*z + M_yzz*x**2 + M_z*x**2*y*z + M_zz*x**2 &
      *y)
    Ms_xxzzz  = (1.0d0/12.0d0)*M_0*x**2*z**3 + M_xxzz*z + M_xxzzz + M_xzz*x*z + M_xzzz*x &
      + (1.0d0/4.0d0)*M_z*x**2*z**2 + (1.0d0/6.0d0)*(M_x*x*z**3 + M_xx* &
      z**3) + (1.0d0/2.0d0)*(M_xxz*z**2 + M_xz*x*z**2 + M_zz*x**2*z + &
      M_zzz*x**2)
    Ms_xyyyy  = M_xyyy*y + M_xyyyy + M_yyy*x*y + M_yyyy*x + (1.0d0/6.0d0)*(M_xy*y**3 + &
      M_y*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2 + M_yy*x*y**2) + (1.0d0/ &
      24.0d0)*(M_0*x*y**4 + M_x*y**4)
    Ms_xyyyz  = M_xyy*y*z + M_xyyy*z + M_xyyyz + M_xyyz*y + M_yy*x*y*z + M_yyy*x*z + &
      M_yyyz*x + M_yyz*x*y + (1.0d0/2.0d0)*(M_xy*y**2*z + M_xyz*y**2 + &
      M_y*x*y**2*z + M_yz*x*y**2) + (1.0d0/6.0d0)*(M_0*x*y**3*z + M_x*y &
      **3*z + M_xz*y**3 + M_z*x*y**3)
    Ms_xyyzz  = M_xyyz*z + M_xyyzz + M_xyz*y*z + M_xyzz*y + M_yyz*x*z + M_yyzz*x + M_yz* &
      x*y*z + M_yzz*x*y + (1.0d0/4.0d0)*(M_0*x*y**2*z**2 + M_x*y**2*z** &
      2) + (1.0d0/2.0d0)*(M_xy*y*z**2 + M_xyy*z**2 + M_xz*y**2*z + &
      M_xzz*y**2 + M_y*x*y*z**2 + M_yy*x*z**2 + M_z*x*y**2*z + M_zz*x*y &
      **2)
    Ms_xyzzz  = M_xyzz*z + M_xyzzz + M_xzz*y*z + M_xzzz*y + M_yzz*x*z + M_yzzz*x + M_zz* &
      x*y*z + M_zzz*x*y + (1.0d0/2.0d0)*(M_xyz*z**2 + M_xz*y*z**2 + &
      M_yz*x*z**2 + M_z*x*y*z**2) + (1.0d0/6.0d0)*(M_0*x*y*z**3 + M_x*y &
      *z**3 + M_xy*z**3 + M_y*x*z**3)
    Ms_xzzzz  = M_xzzz*z + M_xzzzz + M_zzz*x*z + M_zzzz*x + (1.0d0/6.0d0)*(M_xz*z**3 + &
      M_z*x*z**3) + (1.0d0/2.0d0)*(M_xzz*z**2 + M_zz*x*z**2) + (1.0d0/ &
      24.0d0)*(M_0*x*z**4 + M_x*z**4)
    Ms_yyyyy  = (1.0d0/120.0d0)*M_0*y**5 + (1.0d0/24.0d0)*M_y*y**4 + (1.0d0/6.0d0)*M_yy* &
      y**3 + (1.0d0/2.0d0)*M_yyy*y**2 + M_yyyy*y + M_yyyyy
    Ms_yyyyz  = M_yyy*y*z + M_yyyy*z + M_yyyyz + M_yyyz*y + (1.0d0/24.0d0)*(M_0*y**4*z + &
      M_z*y**4) + (1.0d0/6.0d0)*(M_y*y**3*z + M_yz*y**3) + (1.0d0/2.0d0 &
      )*(M_yy*y**2*z + M_yyz*y**2)
    Ms_yyyzz  = (1.0d0/12.0d0)*M_0*y**3*z**2 + (1.0d0/4.0d0)*M_y*y**2*z**2 + M_yyyz*z + &
      M_yyyzz + M_yyz*y*z + M_yyzz*y + (1.0d0/6.0d0)*(M_z*y**3*z + M_zz &
      *y**3) + (1.0d0/2.0d0)*(M_yy*y*z**2 + M_yyy*z**2 + M_yz*y**2*z + &
      M_yzz*y**2)
    Ms_yyzzz  = (1.0d0/12.0d0)*M_0*y**2*z**3 + M_yyzz*z + M_yyzzz + M_yzz*y*z + M_yzzz*y &
      + (1.0d0/4.0d0)*M_z*y**2*z**2 + (1.0d0/6.0d0)*(M_y*y*z**3 + M_yy* &
      z**3) + (1.0d0/2.0d0)*(M_yyz*z**2 + M_yz*y*z**2 + M_zz*y**2*z + &
      M_zzz*y**2)
    Ms_yzzzz  = M_yzzz*z + M_yzzzz + M_zzz*y*z + M_zzzz*y + (1.0d0/6.0d0)*(M_yz*z**3 + &
      M_z*y*z**3) + (1.0d0/2.0d0)*(M_yzz*z**2 + M_zz*y*z**2) + (1.0d0/ &
      24.0d0)*(M_0*y*z**4 + M_y*z**4)
    Ms_zzzzz  = (1.0d0/120.0d0)*M_0*z**5 + (1.0d0/24.0d0)*M_z*z**4 + (1.0d0/6.0d0)*M_zz* &
      z**3 + (1.0d0/2.0d0)*M_zzz*z**2 + M_zzzz*z + M_zzzzz
    Ms_xxxxxx = (1.0d0/720.0d0)*M_0*x**6 + (1.0d0/120.0d0)*M_x*x**5 + (1.0d0/24.0d0)* &
      M_xx*x**4 + (1.0d0/6.0d0)*M_xxx*x**3 + (1.0d0/2.0d0)*M_xxxx*x**2 &
      + M_xxxxx*x + M_xxxxxx
    Ms_xxxxxy = M_xxxx*x*y + M_xxxxx*y + M_xxxxxy + M_xxxxy*x + (1.0d0/120.0d0)*(M_0*x** &
      5*y + M_y*x**5) + (1.0d0/24.0d0)*(M_x*x**4*y + M_xy*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*y + M_xxy*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*y + M_xxxy*x**2)
    Ms_xxxxxz = M_xxxx*x*z + M_xxxxx*z + M_xxxxxz + M_xxxxz*x + (1.0d0/120.0d0)*(M_0*x** &
      5*z + M_z*x**5) + (1.0d0/24.0d0)*(M_x*x**4*z + M_xz*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*z + M_xxz*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*z + M_xxxz*x**2)
    Ms_xxxxyy = (1.0d0/48.0d0)*M_0*x**4*y**2 + (1.0d0/12.0d0)*M_x*x**3*y**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*y**2 + M_xxxxy*y + M_xxxxyy + M_xxxy*x*y + &
      M_xxxyy*x + (1.0d0/6.0d0)*(M_xy*x**3*y + M_xyy*x**3) + (1.0d0/ &
      24.0d0)*(M_y*x**4*y + M_yy*x**4) + (1.0d0/2.0d0)*(M_xxx*x*y**2 + &
      M_xxxx*y**2 + M_xxy*x**2*y + M_xxyy*x**2)
    Ms_xxxxyz = M_xxx*x*y*z + M_xxxx*y*z + M_xxxxy*z + M_xxxxyz + M_xxxxz*y + M_xxxy*x*z &
      + M_xxxyz*x + M_xxxz*x*y + (1.0d0/24.0d0)*(M_0*x**4*y*z + M_y*x** &
      4*z + M_yz*x**4 + M_z*x**4*y) + (1.0d0/6.0d0)*(M_x*x**3*y*z + &
      M_xy*x**3*z + M_xyz*x**3 + M_xz*x**3*y) + (1.0d0/2.0d0)*(M_xx*x** &
      2*y*z + M_xxy*x**2*z + M_xxyz*x**2 + M_xxz*x**2*y)
    Ms_xxxxzz = (1.0d0/48.0d0)*M_0*x**4*z**2 + (1.0d0/12.0d0)*M_x*x**3*z**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*z**2 + M_xxxxz*z + M_xxxxzz + M_xxxz*x*z + &
      M_xxxzz*x + (1.0d0/6.0d0)*(M_xz*x**3*z + M_xzz*x**3) + (1.0d0/ &
      24.0d0)*(M_z*x**4*z + M_zz*x**4) + (1.0d0/2.0d0)*(M_xxx*x*z**2 + &
      M_xxxx*z**2 + M_xxz*x**2*z + M_xxzz*x**2)
    Ms_xxxyyy = (1.0d0/36.0d0)*M_0*x**3*y**3 + M_xxxyy*y + M_xxxyyy + M_xxyy*x*y + &
      M_xxyyy*x + (1.0d0/4.0d0)*M_xy*x**2*y**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*y**3 + M_y*x**3*y**2) + (1.0d0/2.0d0)*(M_xxxy*y**2 + M_xxy*x* &
      y**2 + M_xyy*x**2*y + M_xyyy*x**2) + (1.0d0/6.0d0)*(M_xx*x*y**3 + &
      M_xxx*y**3 + M_yy*x**3*y + M_yyy*x**3)
    Ms_xxxyyz = M_xxxy*y*z + M_xxxyy*z + M_xxxyyz + M_xxxyz*y + M_xxy*x*y*z + M_xxyy*x*z &
      + M_xxyyz*x + M_xxyz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y**2*z + M_z* &
      x**3*y**2) + (1.0d0/4.0d0)*(M_x*x**2*y**2*z + M_xz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_y*x**3*y*z + M_yy*x**3*z + M_yyz*x**3 + M_yz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y**2*z + M_xxx*y**2*z + M_xxxz*y**2 + &
      M_xxz*x*y**2 + M_xy*x**2*y*z + M_xyy*x**2*z + M_xyyz*x**2 + M_xyz &
      *x**2*y)
    Ms_xxxyzz = M_xxxyz*z + M_xxxyzz + M_xxxz*y*z + M_xxxzz*y + M_xxyz*x*z + M_xxyzz*x + &
      M_xxz*x*y*z + M_xxzz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y*z**2 + M_y* &
      x**3*z**2) + (1.0d0/4.0d0)*(M_x*x**2*y*z**2 + M_xy*x**2*z**2) + ( &
      1.0d0/6.0d0)*(M_yz*x**3*z + M_yzz*x**3 + M_z*x**3*y*z + M_zz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y*z**2 + M_xxx*y*z**2 + M_xxxy*z**2 + &
      M_xxy*x*z**2 + M_xyz*x**2*z + M_xyzz*x**2 + M_xz*x**2*y*z + M_xzz &
      *x**2*y)
    Ms_xxxzzz = (1.0d0/36.0d0)*M_0*x**3*z**3 + M_xxxzz*z + M_xxxzzz + M_xxzz*x*z + &
      M_xxzzz*x + (1.0d0/4.0d0)*M_xz*x**2*z**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*z**3 + M_z*x**3*z**2) + (1.0d0/2.0d0)*(M_xxxz*z**2 + M_xxz*x* &
      z**2 + M_xzz*x**2*z + M_xzzz*x**2) + (1.0d0/6.0d0)*(M_xx*x*z**3 + &
      M_xxx*z**3 + M_zz*x**3*z + M_zzz*x**3)
    Ms_xxyyyy = (1.0d0/48.0d0)*M_0*x**2*y**4 + M_xxyyy*y + M_xxyyyy + M_xyyy*x*y + &
      M_xyyyy*x + (1.0d0/12.0d0)*M_y*x**2*y**3 + (1.0d0/4.0d0)*M_yy*x** &
      2*y**2 + (1.0d0/6.0d0)*(M_xxy*y**3 + M_xy*x*y**3) + (1.0d0/24.0d0 &
      )*(M_x*x*y**4 + M_xx*y**4) + (1.0d0/2.0d0)*(M_xxyy*y**2 + M_xyy*x &
      *y**2 + M_yyy*x**2*y + M_yyyy*x**2)
    Ms_xxyyyz = M_xxyy*y*z + M_xxyyy*z + M_xxyyyz + M_xxyyz*y + M_xyy*x*y*z + M_xyyy*x*z &
      + M_xyyyz*x + M_xyyz*x*y + (1.0d0/12.0d0)*(M_0*x**2*y**3*z + M_z* &
      x**2*y**3) + (1.0d0/4.0d0)*(M_y*x**2*y**2*z + M_yz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_x*x*y**3*z + M_xx*y**3*z + M_xxz*y**3 + M_xz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xxy*y**2*z + M_xxyz*y**2 + M_xy*x*y**2*z &
      + M_xyz*x*y**2 + M_yy*x**2*y*z + M_yyy*x**2*z + M_yyyz*x**2 + &
      M_yyz*x**2*y)
    Ms_xxyyzz = (1.0d0/8.0d0)*M_0*x**2*y**2*z**2 + M_xxyyz*z + M_xxyyzz + M_xxyz*y*z + &
      M_xxyzz*y + M_xyyz*x*z + M_xyyzz*x + M_xyz*x*y*z + M_xyzz*x*y + ( &
      1.0d0/4.0d0)*(M_x*x*y**2*z**2 + M_xx*y**2*z**2 + M_y*x**2*y*z**2 &
      + M_yy*x**2*z**2 + M_z*x**2*y**2*z + M_zz*x**2*y**2) + (1.0d0/ &
      2.0d0)*(M_xxy*y*z**2 + M_xxyy*z**2 + M_xxz*y**2*z + M_xxzz*y**2 + &
      M_xy*x*y*z**2 + M_xyy*x*z**2 + M_xz*x*y**2*z + M_xzz*x*y**2 + &
      M_yyz*x**2*z + M_yyzz*x**2 + M_yz*x**2*y*z + M_yzz*x**2*y)
    Ms_xxyzzz = M_xxyzz*z + M_xxyzzz + M_xxzz*y*z + M_xxzzz*y + M_xyzz*x*z + M_xyzzz*x + &
      M_xzz*x*y*z + M_xzzz*x*y + (1.0d0/4.0d0)*(M_yz*x**2*z**2 + M_z*x &
      **2*y*z**2) + (1.0d0/12.0d0)*(M_0*x**2*y*z**3 + M_y*x**2*z**3) + &
      (1.0d0/6.0d0)*(M_x*x*y*z**3 + M_xx*y*z**3 + M_xxy*z**3 + M_xy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xxyz*z**2 + M_xxz*y*z**2 + M_xyz*x*z**2 + &
      M_xz*x*y*z**2 + M_yzz*x**2*z + M_yzzz*x**2 + M_zz*x**2*y*z + &
      M_zzz*x**2*y)
    Ms_xxzzzz = (1.0d0/48.0d0)*M_0*x**2*z**4 + M_xxzzz*z + M_xxzzzz + M_xzzz*x*z + &
      M_xzzzz*x + (1.0d0/12.0d0)*M_z*x**2*z**3 + (1.0d0/4.0d0)*M_zz*x** &
      2*z**2 + (1.0d0/6.0d0)*(M_xxz*z**3 + M_xz*x*z**3) + (1.0d0/24.0d0 &
      )*(M_x*x*z**4 + M_xx*z**4) + (1.0d0/2.0d0)*(M_xxzz*z**2 + M_xzz*x &
      *z**2 + M_zzz*x**2*z + M_zzzz*x**2)
    Ms_xyyyyy = M_xyyyy*y + M_xyyyyy + M_yyyy*x*y + M_yyyyy*x + (1.0d0/24.0d0)*(M_xy*y** &
      4 + M_y*x*y**4) + (1.0d0/6.0d0)*(M_xyy*y**3 + M_yy*x*y**3) + ( &
      1.0d0/2.0d0)*(M_xyyy*y**2 + M_yyy*x*y**2) + (1.0d0/120.0d0)*(M_0* &
      x*y**5 + M_x*y**5)
    Ms_xyyyyz = M_xyyy*y*z + M_xyyyy*z + M_xyyyyz + M_xyyyz*y + M_yyy*x*y*z + M_yyyy*x*z &
      + M_yyyyz*x + M_yyyz*x*y + (1.0d0/6.0d0)*(M_xy*y**3*z + M_xyz*y** &
      3 + M_y*x*y**3*z + M_yz*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2*z + &
      M_xyyz*y**2 + M_yy*x*y**2*z + M_yyz*x*y**2) + (1.0d0/24.0d0)*(M_0 &
      *x*y**4*z + M_x*y**4*z + M_xz*y**4 + M_z*x*y**4)
    Ms_xyyyzz = M_xyyyz*z + M_xyyyzz + M_xyyz*y*z + M_xyyzz*y + M_yyyz*x*z + M_yyyzz*x + &
      M_yyz*x*y*z + M_yyzz*x*y + (1.0d0/4.0d0)*(M_xy*y**2*z**2 + M_y*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**3*z**2 + M_x*y**3*z**2) + ( &
      1.0d0/6.0d0)*(M_xz*y**3*z + M_xzz*y**3 + M_z*x*y**3*z + M_zz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xyy*y*z**2 + M_xyyy*z**2 + M_xyz*y**2*z + &
      M_xyzz*y**2 + M_yy*x*y*z**2 + M_yyy*x*z**2 + M_yz*x*y**2*z + &
      M_yzz*x*y**2)
    Ms_xyyzzz = M_xyyzz*z + M_xyyzzz + M_xyzz*y*z + M_xyzzz*y + M_yyzz*x*z + M_yyzzz*x + &
      M_yzz*x*y*z + M_yzzz*x*y + (1.0d0/4.0d0)*(M_xz*y**2*z**2 + M_z*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**2*z**3 + M_x*y**2*z**3) + ( &
      1.0d0/6.0d0)*(M_xy*y*z**3 + M_xyy*z**3 + M_y*x*y*z**3 + M_yy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xyyz*z**2 + M_xyz*y*z**2 + M_xzz*y**2*z + &
      M_xzzz*y**2 + M_yyz*x*z**2 + M_yz*x*y*z**2 + M_zz*x*y**2*z + &
      M_zzz*x*y**2)
    Ms_xyzzzz = M_xyzzz*z + M_xyzzzz + M_xzzz*y*z + M_xzzzz*y + M_yzzz*x*z + M_yzzzz*x + &
      M_zzz*x*y*z + M_zzzz*x*y + (1.0d0/6.0d0)*(M_xyz*z**3 + M_xz*y*z** &
      3 + M_yz*x*z**3 + M_z*x*y*z**3) + (1.0d0/2.0d0)*(M_xyzz*z**2 + &
      M_xzz*y*z**2 + M_yzz*x*z**2 + M_zz*x*y*z**2) + (1.0d0/24.0d0)*( &
      M_0*x*y*z**4 + M_x*y*z**4 + M_xy*z**4 + M_y*x*z**4)
    Ms_xzzzzz = M_xzzzz*z + M_xzzzzz + M_zzzz*x*z + M_zzzzz*x + (1.0d0/24.0d0)*(M_xz*z** &
      4 + M_z*x*z**4) + (1.0d0/6.0d0)*(M_xzz*z**3 + M_zz*x*z**3) + ( &
      1.0d0/2.0d0)*(M_xzzz*z**2 + M_zzz*x*z**2) + (1.0d0/120.0d0)*(M_0* &
      x*z**5 + M_x*z**5)
    Ms_yyyyyy = (1.0d0/720.0d0)*M_0*y**6 + (1.0d0/120.0d0)*M_y*y**5 + (1.0d0/24.0d0)* &
      M_yy*y**4 + (1.0d0/6.0d0)*M_yyy*y**3 + (1.0d0/2.0d0)*M_yyyy*y**2 &
      + M_yyyyy*y + M_yyyyyy
    Ms_yyyyyz = M_yyyy*y*z + M_yyyyy*z + M_yyyyyz + M_yyyyz*y + (1.0d0/120.0d0)*(M_0*y** &
      5*z + M_z*y**5) + (1.0d0/24.0d0)*(M_y*y**4*z + M_yz*y**4) + ( &
      1.0d0/6.0d0)*(M_yy*y**3*z + M_yyz*y**3) + (1.0d0/2.0d0)*(M_yyy*y &
      **2*z + M_yyyz*y**2)
    Ms_yyyyzz = (1.0d0/48.0d0)*M_0*y**4*z**2 + (1.0d0/12.0d0)*M_y*y**3*z**2 + (1.0d0/ &
      4.0d0)*M_yy*y**2*z**2 + M_yyyyz*z + M_yyyyzz + M_yyyz*y*z + &
      M_yyyzz*y + (1.0d0/6.0d0)*(M_yz*y**3*z + M_yzz*y**3) + (1.0d0/ &
      24.0d0)*(M_z*y**4*z + M_zz*y**4) + (1.0d0/2.0d0)*(M_yyy*y*z**2 + &
      M_yyyy*z**2 + M_yyz*y**2*z + M_yyzz*y**2)
    Ms_yyyzzz = (1.0d0/36.0d0)*M_0*y**3*z**3 + M_yyyzz*z + M_yyyzzz + M_yyzz*y*z + &
      M_yyzzz*y + (1.0d0/4.0d0)*M_yz*y**2*z**2 + (1.0d0/12.0d0)*(M_y*y &
      **2*z**3 + M_z*y**3*z**2) + (1.0d0/2.0d0)*(M_yyyz*z**2 + M_yyz*y* &
      z**2 + M_yzz*y**2*z + M_yzzz*y**2) + (1.0d0/6.0d0)*(M_yy*y*z**3 + &
      M_yyy*z**3 + M_zz*y**3*z + M_zzz*y**3)
    Ms_yyzzzz = (1.0d0/48.0d0)*M_0*y**2*z**4 + M_yyzzz*z + M_yyzzzz + M_yzzz*y*z + &
      M_yzzzz*y + (1.0d0/12.0d0)*M_z*y**2*z**3 + (1.0d0/4.0d0)*M_zz*y** &
      2*z**2 + (1.0d0/6.0d0)*(M_yyz*z**3 + M_yz*y*z**3) + (1.0d0/24.0d0 &
      )*(M_y*y*z**4 + M_yy*z**4) + (1.0d0/2.0d0)*(M_yyzz*z**2 + M_yzz*y &
      *z**2 + M_zzz*y**2*z + M_zzzz*y**2)
    Ms_yzzzzz = M_yzzzz*z + M_yzzzzz + M_zzzz*y*z + M_zzzzz*y + (1.0d0/24.0d0)*(M_yz*z** &
      4 + M_z*y*z**4) + (1.0d0/6.0d0)*(M_yzz*z**3 + M_zz*y*z**3) + ( &
      1.0d0/2.0d0)*(M_yzzz*z**2 + M_zzz*y*z**2) + (1.0d0/120.0d0)*(M_0* &
      y*z**5 + M_y*z**5)
    Ms_zzzzzz = (1.0d0/720.0d0)*M_0*z**6 + (1.0d0/120.0d0)*M_z*z**5 + (1.0d0/24.0d0)* &
      M_zz*z**4 + (1.0d0/6.0d0)*M_zzz*z**3 + (1.0d0/2.0d0)*M_zzzz*z**2 &
      + M_zzzzz*z + M_zzzzzz
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
    
! OPS  690*ADD + 2*DIV + 1126*MUL + 39*NEG + 256*POW + 58*SUB = 2171  (2235 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy,&
                D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz,&
                D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy,&
                D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy,&
                D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz
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
    h        = x**2 + y**2 + z**2
    u2       = 1.0/h
    u        = sqrt(u2)
    D_0      = u
    D_x      = -u**3*x
    D_y      = -u**3*y
    D_z      = -u**3*z
    D_xx     = -h*u**5 + 3*u**5*x**2
    D_xy     = 3*u**5*x*y
    D_xz     = 3*u**5*x*z
    D_yy     = -h*u**5 + 3*u**5*y**2
    D_yz     = 3*u**5*y*z
    D_zz     = -(D_xx + D_yy)
    D_xxx    = 9*h*u**7*x - 15*u**7*x**3
    D_xxy    = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz    = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy    = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz    = -15*u**7*x*y*z
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = 9*h*u**7*y - 15*u**7*y**3
    D_yyz    = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    D_xxxx   = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy   = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz   = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy   = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz   = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz   = -(D_xxxx + D_xxyy)
    D_xyyy   = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz   = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz   = -(D_xxxy + D_xyyy)
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz   = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    D_xxxxx  = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy  = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz  = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy  = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz  = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    D_xxyyy  = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz  = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    D_xyyyy  = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz  = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz  = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    D_xxxxxx = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    L_xxxxx  = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    L_xxxxy  = D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyz*M_yz + D_xxxxz*M_z + &
      D_xxxxzz*M_zz
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
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
    D_xxyyyy = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
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
    D_xyyyyy = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
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
    D_yyyyyy = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
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
    
! OPS  665*ADD + 71*DIV + 1134*MUL + 35*NEG + 546*POW = 2451  (2915 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz,&
                L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz,&
                L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz,&
                L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz,&
                L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz,&
                L_yyzzzz, L_yzzzzz, L_zzzzzz
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
    Ls_xxxxx  = L_xxxxx + L_xxxxxx*x + L_xxxxxy*y + L_xxxxxz*z
    Ls_xxxxy  = L_xxxxxy*x + L_xxxxy + L_xxxxyy*y + L_xxxxyz*z
    Ls_xxxyy  = L_xxxxyy*x + L_xxxyy + L_xxxyyy*y + L_xxxyyz*z
    Ls_xxyyy  = L_xxxyyy*x + L_xxyyy + L_xxyyyy*y + L_xxyyyz*z
    Ls_xyyyy  = L_xxyyyy*x + L_xyyyy + L_xyyyyy*y + L_xyyyyz*z
    Ls_yyyyy  = L_xyyyyy*x + L_yyyyy + L_yyyyyy*y + L_yyyyyz*z
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
    Ls_xxxx   = L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxz*x*z + L_xxxxy*y + L_xxxxyz* &
      y*z + L_xxxxz*z + (1.0d0/2.0d0)*(L_xxxxxx*x**2 + L_xxxxyy*y**2 + &
      L_xxxxzz*z**2)
    Ls_xxxxz  = L_xxxxxz*x + L_xxxxyz*y + L_xxxxz + L_xxxxzz*z
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    Ls_xxxy   = L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyz*x*z + L_xxxy + L_xxxyy*y + L_xxxyyz* &
      y*z + L_xxxyz*z + (1.0d0/2.0d0)*(L_xxxxxy*x**2 + L_xxxyyy*y**2 + &
      L_xxxyzz*z**2)
    Ls_xxxyz  = L_xxxxyz*x + L_xxxyyz*y + L_xxxyz + L_xxxyzz*z
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    Ls_xxx    = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/6.0d0)*(L_xxxxxx*x**3 + &
      L_xxxyyy*y**3 + L_xxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxx*x**2 + &
      L_xxxxxy*x**2*y + L_xxxxxz*x**2*z + L_xxxxyy*x*y**2 + L_xxxxzz*x* &
      z**2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z**2 + L_xxxzz &
      *z**2)
    Ls_xxxz   = L_xxxxyz*x*y + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + L_xxxyzz*y*z + &
      L_xxxz + L_xxxzz*z + (1.0d0/2.0d0)*(L_xxxxxz*x**2 + L_xxxyyz*y**2 &
      + L_xxxzzz*z**2)
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    Ls_xxyy   = L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyz*x*z + L_xxyy + L_xxyyy*y + L_xxyyyz* &
      y*z + L_xxyyz*z + (1.0d0/2.0d0)*(L_xxxxyy*x**2 + L_xxyyyy*y**2 + &
      L_xxyyzz*z**2)
    Ls_xxyyz  = L_xxxyyz*x + L_xxyyyz*y + L_xxyyz + L_xxyyzz*z
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    Ls_xxy    = L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/6.0d0)*(L_xxxxxy*x**3 + &
      L_xxyyyy*y**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + &
      L_xxxxyy*x**2*y + L_xxxxyz*x**2*z + L_xxxyyy*x*y**2 + L_xxxyzz*x* &
      z**2 + L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz &
      *z**2)
    Ls_xxyz   = L_xxxyyz*x*y + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + L_xxyyzz*y*z + &
      L_xxyz + L_xxyzz*z + (1.0d0/2.0d0)*(L_xxxxyz*x**2 + L_xxyyyz*y**2 &
      + L_xxyzzz*z**2)
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    Ls_xx     = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxyyyy*y &
      **4 + L_xxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyy*x**2*y**2 + &
      L_xxxxzz*x**2*z**2 + L_xxyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxx &
      *x**3 + L_xxxxxy*x**3*y + L_xxxxxz*x**3*z + L_xxxyyy*x*y**3 + &
      L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z** &
      3 + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    Ls_xxz    = L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/6.0d0)*(L_xxxxxz*x**3 + &
      L_xxyyyz*y**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2*y + &
      L_xxxxz*x**2 + L_xxxxzz*x**2*z + L_xxxyyz*x*y**2 + L_xxxzzz*x*z** &
      2 + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z**2 + L_xxzzz*z &
      **2)
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    Ls_xyyy   = L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyz*x*z + L_xyyy + L_xyyyy*y + L_xyyyyz* &
      y*z + L_xyyyz*z + (1.0d0/2.0d0)*(L_xxxyyy*x**2 + L_xyyyyy*y**2 + &
      L_xyyyzz*z**2)
    Ls_xyyyz  = L_xxyyyz*x + L_xyyyyz*y + L_xyyyz + L_xyyyzz*z
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    Ls_xyy    = L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/6.0d0)*(L_xxxxyy*x**3 + &
      L_xyyyyy*y**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + &
      L_xxxyyy*x**2*y + L_xxxyyz*x**2*z + L_xxyyyy*x*y**2 + L_xxyyzz*x* &
      z**2 + L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz &
      *z**2)
    Ls_xyyz   = L_xxyyyz*x*y + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + L_xyyyzz*y*z + &
      L_xyyz + L_xyyzz*z + (1.0d0/2.0d0)*(L_xxxyyz*x**2 + L_xyyyyz*y**2 &
      + L_xyyzzz*z**2)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    Ls_xy     = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xyyyyy*y &
      **4 + L_xyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyy*x**2*y**2 + &
      L_xxxyzz*x**2*z**2 + L_xyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxy &
      *x**3 + L_xxxxyy*x**3*y + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + &
      L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz*y**3*z + L_xyyzzz*y*z** &
      3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyyyz*x* &
      y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    Ls_xyz    = L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/6.0d0)*(L_xxxxyz*x**3 + &
      L_xyyyyz*y**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2*y + &
      L_xxxyz*x**2 + L_xxxyzz*x**2*z + L_xxyyyz*x*y**2 + L_xxyzzz*x*z** &
      2 + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z**2 + L_xyzzz*z &
      **2)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    Ls_x      = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xyyyyy*y**5 + &
      L_xzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + L_xxxxzz*x &
      **3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxzzz*x**2*z**3 + L_xyyyzz*y** &
      3*z**2 + L_xyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxz*x**4*z + L_xxyyyy*x*y** &
      4 + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y &
      *z**4 + L_xzzzz*z**4) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y &
      + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + L_xxyy*x*y**2 + L_xxyyz*x*y &
      **2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y &
      **2*z + L_xyzz*y*z**2 + L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 &
      + L_xxxxy*x**3*y + L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x &
      *y**3 + L_xxyyyz*x*y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + &
      L_xyyy*y**3 + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3)
    Ls_xz     = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/24.0d0)*(L_xxxxxz*x**4 + L_xyyyyz*y**4 &
      + L_xzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyz*x**2*y**2 + L_xxxzzz*x &
      **2*z**2 + L_xyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxyz*x**3*y + &
      L_xxxxz*x**3 + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxzzzz*x*z** &
      3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y*z**3 + L_xzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz*x**2*y*z + L_xxxz &
      *x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + &
      L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z &
      + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    Ls_yyyy   = L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyz*x*z + L_yyyy + L_yyyyy*y + L_yyyyyz* &
      y*z + L_yyyyz*z + (1.0d0/2.0d0)*(L_xxyyyy*x**2 + L_yyyyyy*y**2 + &
      L_yyyyzz*z**2)
    Ls_yyyyz  = L_xyyyyz*x + L_yyyyyz*y + L_yyyyz + L_yyyyzz*z
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    Ls_yyy    = L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/6.0d0)*(L_xxxyyy*x**3 + &
      L_yyyyyy*y**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + &
      L_xxyyyy*x**2*y + L_xxyyyz*x**2*z + L_xyyyyy*x*y**2 + L_xyyyzz*x* &
      z**2 + L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz &
      *z**2)
    Ls_yyyz   = L_xyyyyz*x*y + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + L_yyyyzz*y*z + &
      L_yyyz + L_yyyzz*z + (1.0d0/2.0d0)*(L_xxyyyz*x**2 + L_yyyyyz*y**2 &
      + L_yyyzzz*z**2)
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    Ls_yy     = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_yyyyyy*y &
      **4 + L_yyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyy*x**2*y**2 + &
      L_xxyyzz*x**2*z**2 + L_yyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyy &
      *x**3 + L_xxxyyy*x**3*y + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + &
      L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz*y**3*z + L_yyyzzz*y*z** &
      3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyyyz*x* &
      y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Ls_yyz    = L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/6.0d0)*(L_xxxyyz*x**3 + &
      L_yyyyyz*y**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2*y + &
      L_xxyyz*x**2 + L_xxyyzz*x**2*z + L_xyyyyz*x*y**2 + L_xyyzzz*x*z** &
      2 + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z**2 + L_yyzzz*z &
      **2)
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    Ls_y      = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_yyyyyy*y**5 + &
      L_yzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + L_xxxyzz*x &
      **3*z**2 + L_xxyyyy*x**2*y**3 + L_xxyzzz*x**2*z**3 + L_yyyyzz*y** &
      3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyz*x**4*z + L_xyyyyy*x*y** &
      4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y**4*z + L_yyzzzz*y &
      *z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3 &
      *y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + &
      L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y &
      **3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x &
      **2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + &
      L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + &
      L_yzz*z**2)
    Ls_yz     = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/24.0d0)*(L_xxxxyz*x**4 + L_yyyyyz*y**4 &
      + L_yzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyz*x**2*y**2 + L_xxyzzz*x &
      **2*z**2 + L_yyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyyz*x**3*y + &
      L_xxxyz*x**3 + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyzzzz*x*z** &
      3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y*z**3 + L_yzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz*x**2*y*z + L_xxyz &
      *x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + &
      L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z &
      + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    Ls_0      = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/720.0d0)*( &
      L_xxxxxx*x**6 + L_yyyyyy*y**6 + L_zzzzzz*z**6) + (1.0d0/36.0d0)*( &
      L_xxxyyy*x**3*y**3 + L_xxxzzz*x**3*z**3 + L_yyyzzz*y**3*z**3) + ( &
      1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy &
      *x**2*y**4 + L_xxzzzz*x**2*z**4 + L_yyyyzz*y**4*z**2 + L_yyzzzz*y &
      **2*z**4) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z &
      + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + &
      L_yyzz*y**2*z**2) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5 &
      *y + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + &
      L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3) + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_xxxxy*x**4*y + &
      L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xyyyyz*x* &
      y**4*z + L_xyzzzz*x*y*z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + &
      L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyy*x**3*y**2 + L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + &
      L_xxxzz*x**3*z**2 + L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + &
      L_xxyzzz*x**2*y*z**3 + L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + &
      L_xyyzzz*x*y**2*z**3 + L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3)
    Ls_z      = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/120.0d0)*(L_xxxxxz*x**5 + L_yyyyyz*y**5 + &
      L_zzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyz*x**3*y**2 + L_xxxzzz*x &
      **3*z**2 + L_xxyyyz*x**2*y**3 + L_xxzzzz*x**2*z**3 + L_yyyzzz*y** &
      3*z**2 + L_yyzzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxz*x**4 + L_xxxxzz*x**4*z + L_xyyyyz*x*y** &
      4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y**4*z + L_yzzzzz*y &
      *z**4 + L_zzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz* &
      x**3*y*z + L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + &
      L_xyyyzz*x*y**3*z + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y &
      **3 + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x &
      **2*z + L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + &
      L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + &
      L_zzz*z**2)
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
    
! OPS  418*ADD + 48*DIV + 783*MUL + 36*NEG + 435*POW = 1720  (2097 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz,&
                L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz,&
                L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz,&
                L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz,&
                L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz,&
                L_yyzzzz, L_yzzzzz, L_zzzzzz
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
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    L_yzz    = -(L_xxy + L_yyy)
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
    L_xxxyzz = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz = -(L_xxxxzz + L_xxyyzz)
    Phi_xx   = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxyyyy*y &
      **4 + L_xxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyy*x**2*y**2 + &
      L_xxxxzz*x**2*z**2 + L_xxyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxx &
      *x**3 + L_xxxxxy*x**3*y + L_xxxxxz*x**3*z + L_xxxyyy*x*y**3 + &
      L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z** &
      3 + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    L_xyyyzz = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz = -(L_xxxyzz + L_xyyyzz)
    Phi_xy   = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xyyyyy*y &
      **4 + L_xyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyy*x**2*y**2 + &
      L_xxxyzz*x**2*z**2 + L_xyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxy &
      *x**3 + L_xxxxyy*x**3*y + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + &
      L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz*y**3*z + L_xyyzzz*y*z** &
      3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyyyz*x* &
      y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    L_xzzzzz = -(L_xxxzzz + L_xyyzzz)
    Phi_x    = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xyyyyy*y**5 + &
      L_xzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + L_xxxxzz*x &
      **3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxzzz*x**2*z**3 + L_xyyyzz*y** &
      3*z**2 + L_xyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxz*x**4*z + L_xxyyyy*x*y** &
      4 + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y &
      *z**4 + L_xzzzz*z**4) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y &
      + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + L_xxyy*x*y**2 + L_xxyyz*x*y &
      **2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y &
      **2*z + L_xyzz*y*z**2 + L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 &
      + L_xxxxy*x**3*y + L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x &
      *y**3 + L_xxyyyz*x*y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + &
      L_xyyy*y**3 + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3)
    Phi_xz   = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/24.0d0)*(L_xxxxxz*x**4 + L_xyyyyz*y**4 &
      + L_xzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyz*x**2*y**2 + L_xxxzzz*x &
      **2*z**2 + L_xyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxyz*x**3*y + &
      L_xxxxz*x**3 + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxzzzz*x*z** &
      3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y*z**3 + L_xzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz*x**2*y*z + L_xxxz &
      *x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + &
      L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z &
      + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyyzz = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz = -(L_xxyyzz + L_yyyyzz)
    Phi_yy   = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_yyyyyy*y &
      **4 + L_yyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyy*x**2*y**2 + &
      L_xxyyzz*x**2*z**2 + L_yyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyy &
      *x**3 + L_xxxyyy*x**3*y + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + &
      L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz*y**3*z + L_yyyzzz*y*z** &
      3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyyyz*x* &
      y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Phi_zz   = -(Phi_xx + Phi_yy)
    L_yzzzzz = -(L_xxyzzz + L_yyyzzz)
    Phi_y    = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_yyyyyy*y**5 + &
      L_yzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + L_xxxyzz*x &
      **3*z**2 + L_xxyyyy*x**2*y**3 + L_xxyzzz*x**2*z**3 + L_yyyyzz*y** &
      3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyz*x**4*z + L_xyyyyy*x*y** &
      4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y**4*z + L_yyzzzz*y &
      *z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3 &
      *y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + &
      L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y &
      **3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x &
      **2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + &
      L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + &
      L_yzz*z**2)
    Phi_yz   = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/24.0d0)*(L_xxxxyz*x**4 + L_yyyyyz*y**4 &
      + L_yzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyz*x**2*y**2 + L_xxyzzz*x &
      **2*z**2 + L_yyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyyz*x**3*y + &
      L_xxxyz*x**3 + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyzzzz*x*z** &
      3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y*z**3 + L_yzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz*x**2*y*z + L_xxyz &
      *x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + &
      L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z &
      + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzzz = -(L_xxzzzz + L_yyzzzz)
    Phi_0    = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/720.0d0)*( &
      L_xxxxxx*x**6 + L_yyyyyy*y**6 + L_zzzzzz*z**6) + (1.0d0/36.0d0)*( &
      L_xxxyyy*x**3*y**3 + L_xxxzzz*x**3*z**3 + L_yyyzzz*y**3*z**3) + ( &
      1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy &
      *x**2*y**4 + L_xxzzzz*x**2*z**4 + L_yyyyzz*y**4*z**2 + L_yyzzzz*y &
      **2*z**4) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z &
      + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + &
      L_yyzz*y**2*z**2) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5 &
      *y + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + &
      L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3) + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_xxxxy*x**4*y + &
      L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xyyyyz*x* &
      y**4*z + L_xyzzzz*x*y*z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + &
      L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyy*x**3*y**2 + L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + &
      L_xxxzz*x**3*z**2 + L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + &
      L_xxyzzz*x**2*y*z**3 + L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + &
      L_xyyzzz*x*y**2*z**3 + L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3)
    Phi_z    = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/120.0d0)*(L_xxxxxz*x**5 + L_yyyyyz*y**5 + &
      L_zzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyz*x**3*y**2 + L_xxxzzz*x &
      **3*z**2 + L_xxyyyz*x**2*y**3 + L_xxzzzz*x**2*z**3 + L_yyyzzz*y** &
      3*z**2 + L_yyzzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxz*x**4 + L_xxxxzz*x**4*z + L_xyyyyz*x*y** &
      4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y**4*z + L_yzzzzz*y &
      *z**4 + L_zzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz* &
      x**3*y*z + L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + &
      L_xyyyzz*x*y**3*z + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y &
      **3 + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x &
      **2*z + L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + &
      L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + &
      L_zzz*z**2)
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
    
! OPS  840*ADD + 237*DIV + 1386*MUL + 630*POW = 3093  (3437 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u
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
    Ms_0      = Ms_0 + (M_0)
    Ms_x      = Ms_x + (M_0*x + M_x)
    Ms_y      = Ms_y + (M_0*y + M_y)
    Ms_z      = Ms_z + (M_0*z + M_z)
    Ms_xx     = Ms_xx + ((1.0d0/2.0d0)*M_0*x**2 + M_x*x + M_xx)
    Ms_xy     = Ms_xy + (M_0*x*y + M_x*y + M_xy + M_y*x)
    Ms_xz     = Ms_xz + (M_0*x*z + M_x*z + M_xz + M_z*x)
    Ms_yy     = Ms_yy + ((1.0d0/2.0d0)*M_0*y**2 + M_y*y + M_yy)
    Ms_yz     = Ms_yz + (M_0*y*z + M_y*z + M_yz + M_z*y)
    Ms_zz     = Ms_zz + ((1.0d0/2.0d0)*M_0*z**2 + M_z*z + M_zz)
    Ms_xxx    = Ms_xxx + ((1.0d0/6.0d0)*M_0*x**3 + (1.0d0/2.0d0)*M_x*x**2 + M_xx*x + M_xxx)
    Ms_xxy    = Ms_xxy + (M_x*x*y + M_xx*y + M_xxy + M_xy*x + (1.0d0/2.0d0)*(M_0*x**2*y + M_y*x**2 &
      ))
    Ms_xxz    = Ms_xxz + (M_x*x*z + M_xx*z + M_xxz + M_xz*x + (1.0d0/2.0d0)*(M_0*x**2*z + M_z*x**2 &
      ))
    Ms_xyy    = Ms_xyy + (M_xy*y + M_xyy + M_y*x*y + M_yy*x + (1.0d0/2.0d0)*(M_0*x*y**2 + M_x*y**2 &
      ))
    Ms_xyz    = Ms_xyz + (M_0*x*y*z + M_x*y*z + M_xy*z + M_xyz + M_xz*y + M_y*x*z + M_yz*x + M_z*x &
      *y)
    Ms_xzz    = Ms_xzz + (M_xz*z + M_xzz + M_z*x*z + M_zz*x + (1.0d0/2.0d0)*(M_0*x*z**2 + M_x*z**2 &
      ))
    Ms_yyy    = Ms_yyy + ((1.0d0/6.0d0)*M_0*y**3 + (1.0d0/2.0d0)*M_y*y**2 + M_yy*y + M_yyy)
    Ms_yyz    = Ms_yyz + (M_y*y*z + M_yy*z + M_yyz + M_yz*y + (1.0d0/2.0d0)*(M_0*y**2*z + M_z*y**2 &
      ))
    Ms_yzz    = Ms_yzz + (M_yz*z + M_yzz + M_z*y*z + M_zz*y + (1.0d0/2.0d0)*(M_0*y*z**2 + M_y*z**2 &
      ))
    Ms_zzz    = Ms_zzz + ((1.0d0/6.0d0)*M_0*z**3 + (1.0d0/2.0d0)*M_z*z**2 + M_zz*z + M_zzz)
    Ms_xxxx   = Ms_xxxx + ((1.0d0/24.0d0)*M_0*x**4 + (1.0d0/6.0d0)*M_x*x**3 + (1.0d0/2.0d0)*M_xx*x &
      **2 + M_xxx*x + M_xxxx)
    Ms_xxxy   = Ms_xxxy + (M_xx*x*y + M_xxx*y + M_xxxy + M_xxy*x + (1.0d0/6.0d0)*(M_0*x**3*y + M_y* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*y + M_xy*x**2))
    Ms_xxxz   = Ms_xxxz + (M_xx*x*z + M_xxx*z + M_xxxz + M_xxz*x + (1.0d0/6.0d0)*(M_0*x**3*z + M_z* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*z + M_xz*x**2))
    Ms_xxyy   = Ms_xxyy + ((1.0d0/4.0d0)*M_0*x**2*y**2 + M_xxy*y + M_xxyy + M_xy*x*y + M_xyy*x + ( &
      1.0d0/2.0d0)*(M_x*x*y**2 + M_xx*y**2 + M_y*x**2*y + M_yy*x**2))
    Ms_xxyz   = Ms_xxyz + (M_x*x*y*z + M_xx*y*z + M_xxy*z + M_xxyz + M_xxz*y + M_xy*x*z + M_xyz*x + &
      M_xz*x*y + (1.0d0/2.0d0)*(M_0*x**2*y*z + M_y*x**2*z + M_yz*x**2 + &
      M_z*x**2*y))
    Ms_xxzz   = Ms_xxzz + ((1.0d0/4.0d0)*M_0*x**2*z**2 + M_xxz*z + M_xxzz + M_xz*x*z + M_xzz*x + ( &
      1.0d0/2.0d0)*(M_x*x*z**2 + M_xx*z**2 + M_z*x**2*z + M_zz*x**2))
    Ms_xyyy   = Ms_xyyy + (M_xyy*y + M_xyyy + M_yy*x*y + M_yyy*x + (1.0d0/2.0d0)*(M_xy*y**2 + M_y*x &
      *y**2) + (1.0d0/6.0d0)*(M_0*x*y**3 + M_x*y**3))
    Ms_xyyz   = Ms_xyyz + (M_xy*y*z + M_xyy*z + M_xyyz + M_xyz*y + M_y*x*y*z + M_yy*x*z + M_yyz*x + &
      M_yz*x*y + (1.0d0/2.0d0)*(M_0*x*y**2*z + M_x*y**2*z + M_xz*y**2 + &
      M_z*x*y**2))
    Ms_xyzz   = Ms_xyzz + (M_xyz*z + M_xyzz + M_xz*y*z + M_xzz*y + M_yz*x*z + M_yzz*x + M_z*x*y*z + &
      M_zz*x*y + (1.0d0/2.0d0)*(M_0*x*y*z**2 + M_x*y*z**2 + M_xy*z**2 + &
      M_y*x*z**2))
    Ms_xzzz   = Ms_xzzz + (M_xzz*z + M_xzzz + M_zz*x*z + M_zzz*x + (1.0d0/2.0d0)*(M_xz*z**2 + M_z*x &
      *z**2) + (1.0d0/6.0d0)*(M_0*x*z**3 + M_x*z**3))
    Ms_yyyy   = Ms_yyyy + ((1.0d0/24.0d0)*M_0*y**4 + (1.0d0/6.0d0)*M_y*y**3 + (1.0d0/2.0d0)*M_yy*y &
      **2 + M_yyy*y + M_yyyy)
    Ms_yyyz   = Ms_yyyz + (M_yy*y*z + M_yyy*z + M_yyyz + M_yyz*y + (1.0d0/6.0d0)*(M_0*y**3*z + M_z* &
      y**3) + (1.0d0/2.0d0)*(M_y*y**2*z + M_yz*y**2))
    Ms_yyzz   = Ms_yyzz + ((1.0d0/4.0d0)*M_0*y**2*z**2 + M_yyz*z + M_yyzz + M_yz*y*z + M_yzz*y + ( &
      1.0d0/2.0d0)*(M_y*y*z**2 + M_yy*z**2 + M_z*y**2*z + M_zz*y**2))
    Ms_yzzz   = Ms_yzzz + (M_yzz*z + M_yzzz + M_zz*y*z + M_zzz*y + (1.0d0/2.0d0)*(M_yz*z**2 + M_z*y &
      *z**2) + (1.0d0/6.0d0)*(M_0*y*z**3 + M_y*z**3))
    Ms_zzzz   = Ms_zzzz + ((1.0d0/24.0d0)*M_0*z**4 + (1.0d0/6.0d0)*M_z*z**3 + (1.0d0/2.0d0)*M_zz*z &
      **2 + M_zzz*z + M_zzzz)
    Ms_xxxxx  = Ms_xxxxx + ((1.0d0/120.0d0)*M_0*x**5 + (1.0d0/24.0d0)*M_x*x**4 + (1.0d0/6.0d0)*M_xx* &
      x**3 + (1.0d0/2.0d0)*M_xxx*x**2 + M_xxxx*x + M_xxxxx)
    Ms_xxxxy  = Ms_xxxxy + (M_xxx*x*y + M_xxxx*y + M_xxxxy + M_xxxy*x + (1.0d0/24.0d0)*(M_0*x**4*y + &
      M_y*x**4) + (1.0d0/6.0d0)*(M_x*x**3*y + M_xy*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*y + M_xxy*x**2))
    Ms_xxxxz  = Ms_xxxxz + (M_xxx*x*z + M_xxxx*z + M_xxxxz + M_xxxz*x + (1.0d0/24.0d0)*(M_0*x**4*z + &
      M_z*x**4) + (1.0d0/6.0d0)*(M_x*x**3*z + M_xz*x**3) + (1.0d0/2.0d0 &
      )*(M_xx*x**2*z + M_xxz*x**2))
    Ms_xxxyy  = Ms_xxxyy + ((1.0d0/12.0d0)*M_0*x**3*y**2 + (1.0d0/4.0d0)*M_x*x**2*y**2 + M_xxxy*y + &
      M_xxxyy + M_xxy*x*y + M_xxyy*x + (1.0d0/6.0d0)*(M_y*x**3*y + M_yy &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*y**2 + M_xxx*y**2 + M_xy*x**2*y + &
      M_xyy*x**2))
    Ms_xxxyz  = Ms_xxxyz + (M_xx*x*y*z + M_xxx*y*z + M_xxxy*z + M_xxxyz + M_xxxz*y + M_xxy*x*z + &
      M_xxyz*x + M_xxz*x*y + (1.0d0/6.0d0)*(M_0*x**3*y*z + M_y*x**3*z + &
      M_yz*x**3 + M_z*x**3*y) + (1.0d0/2.0d0)*(M_x*x**2*y*z + M_xy*x**2 &
      *z + M_xyz*x**2 + M_xz*x**2*y))
    Ms_xxxzz  = Ms_xxxzz + ((1.0d0/12.0d0)*M_0*x**3*z**2 + (1.0d0/4.0d0)*M_x*x**2*z**2 + M_xxxz*z + &
      M_xxxzz + M_xxz*x*z + M_xxzz*x + (1.0d0/6.0d0)*(M_z*x**3*z + M_zz &
      *x**3) + (1.0d0/2.0d0)*(M_xx*x*z**2 + M_xxx*z**2 + M_xz*x**2*z + &
      M_xzz*x**2))
    Ms_xxyyy  = Ms_xxyyy + ((1.0d0/12.0d0)*M_0*x**2*y**3 + M_xxyy*y + M_xxyyy + M_xyy*x*y + M_xyyy*x &
      + (1.0d0/4.0d0)*M_y*x**2*y**2 + (1.0d0/6.0d0)*(M_x*x*y**3 + M_xx* &
      y**3) + (1.0d0/2.0d0)*(M_xxy*y**2 + M_xy*x*y**2 + M_yy*x**2*y + &
      M_yyy*x**2))
    Ms_xxyyz  = Ms_xxyyz + (M_xxy*y*z + M_xxyy*z + M_xxyyz + M_xxyz*y + M_xy*x*y*z + M_xyy*x*z + &
      M_xyyz*x + M_xyz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y**2*z + M_z*x**2* &
      y**2) + (1.0d0/2.0d0)*(M_x*x*y**2*z + M_xx*y**2*z + M_xxz*y**2 + &
      M_xz*x*y**2 + M_y*x**2*y*z + M_yy*x**2*z + M_yyz*x**2 + M_yz*x**2 &
      *y))
    Ms_xxyzz  = Ms_xxyzz + (M_xxyz*z + M_xxyzz + M_xxz*y*z + M_xxzz*y + M_xyz*x*z + M_xyzz*x + M_xz* &
      x*y*z + M_xzz*x*y + (1.0d0/4.0d0)*(M_0*x**2*y*z**2 + M_y*x**2*z** &
      2) + (1.0d0/2.0d0)*(M_x*x*y*z**2 + M_xx*y*z**2 + M_xxy*z**2 + &
      M_xy*x*z**2 + M_yz*x**2*z + M_yzz*x**2 + M_z*x**2*y*z + M_zz*x**2 &
      *y))
    Ms_xxzzz  = Ms_xxzzz + ((1.0d0/12.0d0)*M_0*x**2*z**3 + M_xxzz*z + M_xxzzz + M_xzz*x*z + M_xzzz*x &
      + (1.0d0/4.0d0)*M_z*x**2*z**2 + (1.0d0/6.0d0)*(M_x*x*z**3 + M_xx* &
      z**3) + (1.0d0/2.0d0)*(M_xxz*z**2 + M_xz*x*z**2 + M_zz*x**2*z + &
      M_zzz*x**2))
    Ms_xyyyy  = Ms_xyyyy + (M_xyyy*y + M_xyyyy + M_yyy*x*y + M_yyyy*x + (1.0d0/6.0d0)*(M_xy*y**3 + &
      M_y*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2 + M_yy*x*y**2) + (1.0d0/ &
      24.0d0)*(M_0*x*y**4 + M_x*y**4))
    Ms_xyyyz  = Ms_xyyyz + (M_xyy*y*z + M_xyyy*z + M_xyyyz + M_xyyz*y + M_yy*x*y*z + M_yyy*x*z + &
      M_yyyz*x + M_yyz*x*y + (1.0d0/2.0d0)*(M_xy*y**2*z + M_xyz*y**2 + &
      M_y*x*y**2*z + M_yz*x*y**2) + (1.0d0/6.0d0)*(M_0*x*y**3*z + M_x*y &
      **3*z + M_xz*y**3 + M_z*x*y**3))
    Ms_xyyzz  = Ms_xyyzz + (M_xyyz*z + M_xyyzz + M_xyz*y*z + M_xyzz*y + M_yyz*x*z + M_yyzz*x + M_yz* &
      x*y*z + M_yzz*x*y + (1.0d0/4.0d0)*(M_0*x*y**2*z**2 + M_x*y**2*z** &
      2) + (1.0d0/2.0d0)*(M_xy*y*z**2 + M_xyy*z**2 + M_xz*y**2*z + &
      M_xzz*y**2 + M_y*x*y*z**2 + M_yy*x*z**2 + M_z*x*y**2*z + M_zz*x*y &
      **2))
    Ms_xyzzz  = Ms_xyzzz + (M_xyzz*z + M_xyzzz + M_xzz*y*z + M_xzzz*y + M_yzz*x*z + M_yzzz*x + M_zz* &
      x*y*z + M_zzz*x*y + (1.0d0/2.0d0)*(M_xyz*z**2 + M_xz*y*z**2 + &
      M_yz*x*z**2 + M_z*x*y*z**2) + (1.0d0/6.0d0)*(M_0*x*y*z**3 + M_x*y &
      *z**3 + M_xy*z**3 + M_y*x*z**3))
    Ms_xzzzz  = Ms_xzzzz + (M_xzzz*z + M_xzzzz + M_zzz*x*z + M_zzzz*x + (1.0d0/6.0d0)*(M_xz*z**3 + &
      M_z*x*z**3) + (1.0d0/2.0d0)*(M_xzz*z**2 + M_zz*x*z**2) + (1.0d0/ &
      24.0d0)*(M_0*x*z**4 + M_x*z**4))
    Ms_yyyyy  = Ms_yyyyy + ((1.0d0/120.0d0)*M_0*y**5 + (1.0d0/24.0d0)*M_y*y**4 + (1.0d0/6.0d0)*M_yy* &
      y**3 + (1.0d0/2.0d0)*M_yyy*y**2 + M_yyyy*y + M_yyyyy)
    Ms_yyyyz  = Ms_yyyyz + (M_yyy*y*z + M_yyyy*z + M_yyyyz + M_yyyz*y + (1.0d0/24.0d0)*(M_0*y**4*z + &
      M_z*y**4) + (1.0d0/6.0d0)*(M_y*y**3*z + M_yz*y**3) + (1.0d0/2.0d0 &
      )*(M_yy*y**2*z + M_yyz*y**2))
    Ms_yyyzz  = Ms_yyyzz + ((1.0d0/12.0d0)*M_0*y**3*z**2 + (1.0d0/4.0d0)*M_y*y**2*z**2 + M_yyyz*z + &
      M_yyyzz + M_yyz*y*z + M_yyzz*y + (1.0d0/6.0d0)*(M_z*y**3*z + M_zz &
      *y**3) + (1.0d0/2.0d0)*(M_yy*y*z**2 + M_yyy*z**2 + M_yz*y**2*z + &
      M_yzz*y**2))
    Ms_yyzzz  = Ms_yyzzz + ((1.0d0/12.0d0)*M_0*y**2*z**3 + M_yyzz*z + M_yyzzz + M_yzz*y*z + M_yzzz*y &
      + (1.0d0/4.0d0)*M_z*y**2*z**2 + (1.0d0/6.0d0)*(M_y*y*z**3 + M_yy* &
      z**3) + (1.0d0/2.0d0)*(M_yyz*z**2 + M_yz*y*z**2 + M_zz*y**2*z + &
      M_zzz*y**2))
    Ms_yzzzz  = Ms_yzzzz + (M_yzzz*z + M_yzzzz + M_zzz*y*z + M_zzzz*y + (1.0d0/6.0d0)*(M_yz*z**3 + &
      M_z*y*z**3) + (1.0d0/2.0d0)*(M_yzz*z**2 + M_zz*y*z**2) + (1.0d0/ &
      24.0d0)*(M_0*y*z**4 + M_y*z**4))
    Ms_zzzzz  = Ms_zzzzz + ((1.0d0/120.0d0)*M_0*z**5 + (1.0d0/24.0d0)*M_z*z**4 + (1.0d0/6.0d0)*M_zz* &
      z**3 + (1.0d0/2.0d0)*M_zzz*z**2 + M_zzzz*z + M_zzzzz)
    Ms_xxxxxx = Ms_xxxxxx + ((1.0d0/720.0d0)*M_0*x**6 + (1.0d0/120.0d0)*M_x*x**5 + (1.0d0/24.0d0)* &
      M_xx*x**4 + (1.0d0/6.0d0)*M_xxx*x**3 + (1.0d0/2.0d0)*M_xxxx*x**2 &
      + M_xxxxx*x + M_xxxxxx)
    Ms_xxxxxy = Ms_xxxxxy + (M_xxxx*x*y + M_xxxxx*y + M_xxxxxy + M_xxxxy*x + (1.0d0/120.0d0)*(M_0*x** &
      5*y + M_y*x**5) + (1.0d0/24.0d0)*(M_x*x**4*y + M_xy*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*y + M_xxy*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*y + M_xxxy*x**2))
    Ms_xxxxxz = Ms_xxxxxz + (M_xxxx*x*z + M_xxxxx*z + M_xxxxxz + M_xxxxz*x + (1.0d0/120.0d0)*(M_0*x** &
      5*z + M_z*x**5) + (1.0d0/24.0d0)*(M_x*x**4*z + M_xz*x**4) + ( &
      1.0d0/6.0d0)*(M_xx*x**3*z + M_xxz*x**3) + (1.0d0/2.0d0)*(M_xxx*x &
      **2*z + M_xxxz*x**2))
    Ms_xxxxyy = Ms_xxxxyy + ((1.0d0/48.0d0)*M_0*x**4*y**2 + (1.0d0/12.0d0)*M_x*x**3*y**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*y**2 + M_xxxxy*y + M_xxxxyy + M_xxxy*x*y + &
      M_xxxyy*x + (1.0d0/6.0d0)*(M_xy*x**3*y + M_xyy*x**3) + (1.0d0/ &
      24.0d0)*(M_y*x**4*y + M_yy*x**4) + (1.0d0/2.0d0)*(M_xxx*x*y**2 + &
      M_xxxx*y**2 + M_xxy*x**2*y + M_xxyy*x**2))
    Ms_xxxxyz = Ms_xxxxyz + (M_xxx*x*y*z + M_xxxx*y*z + M_xxxxy*z + M_xxxxyz + M_xxxxz*y + M_xxxy*x*z &
      + M_xxxyz*x + M_xxxz*x*y + (1.0d0/24.0d0)*(M_0*x**4*y*z + M_y*x** &
      4*z + M_yz*x**4 + M_z*x**4*y) + (1.0d0/6.0d0)*(M_x*x**3*y*z + &
      M_xy*x**3*z + M_xyz*x**3 + M_xz*x**3*y) + (1.0d0/2.0d0)*(M_xx*x** &
      2*y*z + M_xxy*x**2*z + M_xxyz*x**2 + M_xxz*x**2*y))
    Ms_xxxxzz = Ms_xxxxzz + ((1.0d0/48.0d0)*M_0*x**4*z**2 + (1.0d0/12.0d0)*M_x*x**3*z**2 + (1.0d0/ &
      4.0d0)*M_xx*x**2*z**2 + M_xxxxz*z + M_xxxxzz + M_xxxz*x*z + &
      M_xxxzz*x + (1.0d0/6.0d0)*(M_xz*x**3*z + M_xzz*x**3) + (1.0d0/ &
      24.0d0)*(M_z*x**4*z + M_zz*x**4) + (1.0d0/2.0d0)*(M_xxx*x*z**2 + &
      M_xxxx*z**2 + M_xxz*x**2*z + M_xxzz*x**2))
    Ms_xxxyyy = Ms_xxxyyy + ((1.0d0/36.0d0)*M_0*x**3*y**3 + M_xxxyy*y + M_xxxyyy + M_xxyy*x*y + &
      M_xxyyy*x + (1.0d0/4.0d0)*M_xy*x**2*y**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*y**3 + M_y*x**3*y**2) + (1.0d0/2.0d0)*(M_xxxy*y**2 + M_xxy*x* &
      y**2 + M_xyy*x**2*y + M_xyyy*x**2) + (1.0d0/6.0d0)*(M_xx*x*y**3 + &
      M_xxx*y**3 + M_yy*x**3*y + M_yyy*x**3))
    Ms_xxxyyz = Ms_xxxyyz + (M_xxxy*y*z + M_xxxyy*z + M_xxxyyz + M_xxxyz*y + M_xxy*x*y*z + M_xxyy*x*z &
      + M_xxyyz*x + M_xxyz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y**2*z + M_z* &
      x**3*y**2) + (1.0d0/4.0d0)*(M_x*x**2*y**2*z + M_xz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_y*x**3*y*z + M_yy*x**3*z + M_yyz*x**3 + M_yz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y**2*z + M_xxx*y**2*z + M_xxxz*y**2 + &
      M_xxz*x*y**2 + M_xy*x**2*y*z + M_xyy*x**2*z + M_xyyz*x**2 + M_xyz &
      *x**2*y))
    Ms_xxxyzz = Ms_xxxyzz + (M_xxxyz*z + M_xxxyzz + M_xxxz*y*z + M_xxxzz*y + M_xxyz*x*z + M_xxyzz*x + &
      M_xxz*x*y*z + M_xxzz*x*y + (1.0d0/12.0d0)*(M_0*x**3*y*z**2 + M_y* &
      x**3*z**2) + (1.0d0/4.0d0)*(M_x*x**2*y*z**2 + M_xy*x**2*z**2) + ( &
      1.0d0/6.0d0)*(M_yz*x**3*z + M_yzz*x**3 + M_z*x**3*y*z + M_zz*x**3 &
      *y) + (1.0d0/2.0d0)*(M_xx*x*y*z**2 + M_xxx*y*z**2 + M_xxxy*z**2 + &
      M_xxy*x*z**2 + M_xyz*x**2*z + M_xyzz*x**2 + M_xz*x**2*y*z + M_xzz &
      *x**2*y))
    Ms_xxxzzz = Ms_xxxzzz + ((1.0d0/36.0d0)*M_0*x**3*z**3 + M_xxxzz*z + M_xxxzzz + M_xxzz*x*z + &
      M_xxzzz*x + (1.0d0/4.0d0)*M_xz*x**2*z**2 + (1.0d0/12.0d0)*(M_x*x &
      **2*z**3 + M_z*x**3*z**2) + (1.0d0/2.0d0)*(M_xxxz*z**2 + M_xxz*x* &
      z**2 + M_xzz*x**2*z + M_xzzz*x**2) + (1.0d0/6.0d0)*(M_xx*x*z**3 + &
      M_xxx*z**3 + M_zz*x**3*z + M_zzz*x**3))
    Ms_xxyyyy = Ms_xxyyyy + ((1.0d0/48.0d0)*M_0*x**2*y**4 + M_xxyyy*y + M_xxyyyy + M_xyyy*x*y + &
      M_xyyyy*x + (1.0d0/12.0d0)*M_y*x**2*y**3 + (1.0d0/4.0d0)*M_yy*x** &
      2*y**2 + (1.0d0/6.0d0)*(M_xxy*y**3 + M_xy*x*y**3) + (1.0d0/24.0d0 &
      )*(M_x*x*y**4 + M_xx*y**4) + (1.0d0/2.0d0)*(M_xxyy*y**2 + M_xyy*x &
      *y**2 + M_yyy*x**2*y + M_yyyy*x**2))
    Ms_xxyyyz = Ms_xxyyyz + (M_xxyy*y*z + M_xxyyy*z + M_xxyyyz + M_xxyyz*y + M_xyy*x*y*z + M_xyyy*x*z &
      + M_xyyyz*x + M_xyyz*x*y + (1.0d0/12.0d0)*(M_0*x**2*y**3*z + M_z* &
      x**2*y**3) + (1.0d0/4.0d0)*(M_y*x**2*y**2*z + M_yz*x**2*y**2) + ( &
      1.0d0/6.0d0)*(M_x*x*y**3*z + M_xx*y**3*z + M_xxz*y**3 + M_xz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xxy*y**2*z + M_xxyz*y**2 + M_xy*x*y**2*z &
      + M_xyz*x*y**2 + M_yy*x**2*y*z + M_yyy*x**2*z + M_yyyz*x**2 + &
      M_yyz*x**2*y))
    Ms_xxyyzz = Ms_xxyyzz + ((1.0d0/8.0d0)*M_0*x**2*y**2*z**2 + M_xxyyz*z + M_xxyyzz + M_xxyz*y*z + &
      M_xxyzz*y + M_xyyz*x*z + M_xyyzz*x + M_xyz*x*y*z + M_xyzz*x*y + ( &
      1.0d0/4.0d0)*(M_x*x*y**2*z**2 + M_xx*y**2*z**2 + M_y*x**2*y*z**2 &
      + M_yy*x**2*z**2 + M_z*x**2*y**2*z + M_zz*x**2*y**2) + (1.0d0/ &
      2.0d0)*(M_xxy*y*z**2 + M_xxyy*z**2 + M_xxz*y**2*z + M_xxzz*y**2 + &
      M_xy*x*y*z**2 + M_xyy*x*z**2 + M_xz*x*y**2*z + M_xzz*x*y**2 + &
      M_yyz*x**2*z + M_yyzz*x**2 + M_yz*x**2*y*z + M_yzz*x**2*y))
    Ms_xxyzzz = Ms_xxyzzz + (M_xxyzz*z + M_xxyzzz + M_xxzz*y*z + M_xxzzz*y + M_xyzz*x*z + M_xyzzz*x + &
      M_xzz*x*y*z + M_xzzz*x*y + (1.0d0/4.0d0)*(M_yz*x**2*z**2 + M_z*x &
      **2*y*z**2) + (1.0d0/12.0d0)*(M_0*x**2*y*z**3 + M_y*x**2*z**3) + &
      (1.0d0/6.0d0)*(M_x*x*y*z**3 + M_xx*y*z**3 + M_xxy*z**3 + M_xy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xxyz*z**2 + M_xxz*y*z**2 + M_xyz*x*z**2 + &
      M_xz*x*y*z**2 + M_yzz*x**2*z + M_yzzz*x**2 + M_zz*x**2*y*z + &
      M_zzz*x**2*y))
    Ms_xxzzzz = Ms_xxzzzz + ((1.0d0/48.0d0)*M_0*x**2*z**4 + M_xxzzz*z + M_xxzzzz + M_xzzz*x*z + &
      M_xzzzz*x + (1.0d0/12.0d0)*M_z*x**2*z**3 + (1.0d0/4.0d0)*M_zz*x** &
      2*z**2 + (1.0d0/6.0d0)*(M_xxz*z**3 + M_xz*x*z**3) + (1.0d0/24.0d0 &
      )*(M_x*x*z**4 + M_xx*z**4) + (1.0d0/2.0d0)*(M_xxzz*z**2 + M_xzz*x &
      *z**2 + M_zzz*x**2*z + M_zzzz*x**2))
    Ms_xyyyyy = Ms_xyyyyy + (M_xyyyy*y + M_xyyyyy + M_yyyy*x*y + M_yyyyy*x + (1.0d0/24.0d0)*(M_xy*y** &
      4 + M_y*x*y**4) + (1.0d0/6.0d0)*(M_xyy*y**3 + M_yy*x*y**3) + ( &
      1.0d0/2.0d0)*(M_xyyy*y**2 + M_yyy*x*y**2) + (1.0d0/120.0d0)*(M_0* &
      x*y**5 + M_x*y**5))
    Ms_xyyyyz = Ms_xyyyyz + (M_xyyy*y*z + M_xyyyy*z + M_xyyyyz + M_xyyyz*y + M_yyy*x*y*z + M_yyyy*x*z &
      + M_yyyyz*x + M_yyyz*x*y + (1.0d0/6.0d0)*(M_xy*y**3*z + M_xyz*y** &
      3 + M_y*x*y**3*z + M_yz*x*y**3) + (1.0d0/2.0d0)*(M_xyy*y**2*z + &
      M_xyyz*y**2 + M_yy*x*y**2*z + M_yyz*x*y**2) + (1.0d0/24.0d0)*(M_0 &
      *x*y**4*z + M_x*y**4*z + M_xz*y**4 + M_z*x*y**4))
    Ms_xyyyzz = Ms_xyyyzz + (M_xyyyz*z + M_xyyyzz + M_xyyz*y*z + M_xyyzz*y + M_yyyz*x*z + M_yyyzz*x + &
      M_yyz*x*y*z + M_yyzz*x*y + (1.0d0/4.0d0)*(M_xy*y**2*z**2 + M_y*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**3*z**2 + M_x*y**3*z**2) + ( &
      1.0d0/6.0d0)*(M_xz*y**3*z + M_xzz*y**3 + M_z*x*y**3*z + M_zz*x*y &
      **3) + (1.0d0/2.0d0)*(M_xyy*y*z**2 + M_xyyy*z**2 + M_xyz*y**2*z + &
      M_xyzz*y**2 + M_yy*x*y*z**2 + M_yyy*x*z**2 + M_yz*x*y**2*z + &
      M_yzz*x*y**2))
    Ms_xyyzzz = Ms_xyyzzz + (M_xyyzz*z + M_xyyzzz + M_xyzz*y*z + M_xyzzz*y + M_yyzz*x*z + M_yyzzz*x + &
      M_yzz*x*y*z + M_yzzz*x*y + (1.0d0/4.0d0)*(M_xz*y**2*z**2 + M_z*x* &
      y**2*z**2) + (1.0d0/12.0d0)*(M_0*x*y**2*z**3 + M_x*y**2*z**3) + ( &
      1.0d0/6.0d0)*(M_xy*y*z**3 + M_xyy*z**3 + M_y*x*y*z**3 + M_yy*x*z &
      **3) + (1.0d0/2.0d0)*(M_xyyz*z**2 + M_xyz*y*z**2 + M_xzz*y**2*z + &
      M_xzzz*y**2 + M_yyz*x*z**2 + M_yz*x*y*z**2 + M_zz*x*y**2*z + &
      M_zzz*x*y**2))
    Ms_xyzzzz = Ms_xyzzzz + (M_xyzzz*z + M_xyzzzz + M_xzzz*y*z + M_xzzzz*y + M_yzzz*x*z + M_yzzzz*x + &
      M_zzz*x*y*z + M_zzzz*x*y + (1.0d0/6.0d0)*(M_xyz*z**3 + M_xz*y*z** &
      3 + M_yz*x*z**3 + M_z*x*y*z**3) + (1.0d0/2.0d0)*(M_xyzz*z**2 + &
      M_xzz*y*z**2 + M_yzz*x*z**2 + M_zz*x*y*z**2) + (1.0d0/24.0d0)*( &
      M_0*x*y*z**4 + M_x*y*z**4 + M_xy*z**4 + M_y*x*z**4))
    Ms_xzzzzz = Ms_xzzzzz + (M_xzzzz*z + M_xzzzzz + M_zzzz*x*z + M_zzzzz*x + (1.0d0/24.0d0)*(M_xz*z** &
      4 + M_z*x*z**4) + (1.0d0/6.0d0)*(M_xzz*z**3 + M_zz*x*z**3) + ( &
      1.0d0/2.0d0)*(M_xzzz*z**2 + M_zzz*x*z**2) + (1.0d0/120.0d0)*(M_0* &
      x*z**5 + M_x*z**5))
    Ms_yyyyyy = Ms_yyyyyy + ((1.0d0/720.0d0)*M_0*y**6 + (1.0d0/120.0d0)*M_y*y**5 + (1.0d0/24.0d0)* &
      M_yy*y**4 + (1.0d0/6.0d0)*M_yyy*y**3 + (1.0d0/2.0d0)*M_yyyy*y**2 &
      + M_yyyyy*y + M_yyyyyy)
    Ms_yyyyyz = Ms_yyyyyz + (M_yyyy*y*z + M_yyyyy*z + M_yyyyyz + M_yyyyz*y + (1.0d0/120.0d0)*(M_0*y** &
      5*z + M_z*y**5) + (1.0d0/24.0d0)*(M_y*y**4*z + M_yz*y**4) + ( &
      1.0d0/6.0d0)*(M_yy*y**3*z + M_yyz*y**3) + (1.0d0/2.0d0)*(M_yyy*y &
      **2*z + M_yyyz*y**2))
    Ms_yyyyzz = Ms_yyyyzz + ((1.0d0/48.0d0)*M_0*y**4*z**2 + (1.0d0/12.0d0)*M_y*y**3*z**2 + (1.0d0/ &
      4.0d0)*M_yy*y**2*z**2 + M_yyyyz*z + M_yyyyzz + M_yyyz*y*z + &
      M_yyyzz*y + (1.0d0/6.0d0)*(M_yz*y**3*z + M_yzz*y**3) + (1.0d0/ &
      24.0d0)*(M_z*y**4*z + M_zz*y**4) + (1.0d0/2.0d0)*(M_yyy*y*z**2 + &
      M_yyyy*z**2 + M_yyz*y**2*z + M_yyzz*y**2))
    Ms_yyyzzz = Ms_yyyzzz + ((1.0d0/36.0d0)*M_0*y**3*z**3 + M_yyyzz*z + M_yyyzzz + M_yyzz*y*z + &
      M_yyzzz*y + (1.0d0/4.0d0)*M_yz*y**2*z**2 + (1.0d0/12.0d0)*(M_y*y &
      **2*z**3 + M_z*y**3*z**2) + (1.0d0/2.0d0)*(M_yyyz*z**2 + M_yyz*y* &
      z**2 + M_yzz*y**2*z + M_yzzz*y**2) + (1.0d0/6.0d0)*(M_yy*y*z**3 + &
      M_yyy*z**3 + M_zz*y**3*z + M_zzz*y**3))
    Ms_yyzzzz = Ms_yyzzzz + ((1.0d0/48.0d0)*M_0*y**2*z**4 + M_yyzzz*z + M_yyzzzz + M_yzzz*y*z + &
      M_yzzzz*y + (1.0d0/12.0d0)*M_z*y**2*z**3 + (1.0d0/4.0d0)*M_zz*y** &
      2*z**2 + (1.0d0/6.0d0)*(M_yyz*z**3 + M_yz*y*z**3) + (1.0d0/24.0d0 &
      )*(M_y*y*z**4 + M_yy*z**4) + (1.0d0/2.0d0)*(M_yyzz*z**2 + M_yzz*y &
      *z**2 + M_zzz*y**2*z + M_zzzz*y**2))
    Ms_yzzzzz = Ms_yzzzzz + (M_yzzzz*z + M_yzzzzz + M_zzzz*y*z + M_zzzzz*y + (1.0d0/24.0d0)*(M_yz*z** &
      4 + M_z*y*z**4) + (1.0d0/6.0d0)*(M_yzz*z**3 + M_zz*y*z**3) + ( &
      1.0d0/2.0d0)*(M_yzzz*z**2 + M_zzz*y*z**2) + (1.0d0/120.0d0)*(M_0* &
      y*z**5 + M_y*z**5))
    Ms_zzzzzz = Ms_zzzzzz + ((1.0d0/720.0d0)*M_0*z**6 + (1.0d0/120.0d0)*M_z*z**5 + (1.0d0/24.0d0)* &
      M_zz*z**4 + (1.0d0/6.0d0)*M_zzz*z**3 + (1.0d0/2.0d0)*M_zzzz*z**2 &
      + M_zzzzz*z + M_zzzzzz)
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
    
! OPS  690*ADD + 2*DIV + 1126*MUL + 39*NEG + 256*POW + 58*SUB = 2171  (2235 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy,&
                D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz,&
                D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy,&
                D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy,&
                D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz
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
    h        = x**2 + y**2 + z**2
    u2       = 1.0/h
    u        = sqrt(u2)
    D_0      = u
    D_x      = -u**3*x
    D_y      = -u**3*y
    D_z      = -u**3*z
    D_xx     = -h*u**5 + 3*u**5*x**2
    D_xy     = 3*u**5*x*y
    D_xz     = 3*u**5*x*z
    D_yy     = -h*u**5 + 3*u**5*y**2
    D_yz     = 3*u**5*y*z
    D_zz     = -(D_xx + D_yy)
    D_xxx    = 9*h*u**7*x - 15*u**7*x**3
    D_xxy    = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz    = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy    = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz    = -15*u**7*x*y*z
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = 9*h*u**7*y - 15*u**7*y**3
    D_yyz    = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    D_xxxx   = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy   = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz   = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy   = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz   = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz   = -(D_xxxx + D_xxyy)
    D_xyyy   = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz   = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz   = -(D_xxxy + D_xyyy)
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz   = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    D_xxxxx  = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy  = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz  = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy  = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz  = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    D_xxyyy  = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz  = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    D_xyyyy  = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz  = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz  = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    D_xxxxxx = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    L_xxxxxx = L_xxxxxx + (D_xxxxxx*M_0)
    D_xxxxxy = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    L_xxxxxy = L_xxxxxy + (D_xxxxxy*M_0)
    D_xxxxxz = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    L_xxxxx  = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z)
    L_xxxxxz = L_xxxxxz + (D_xxxxxz*M_0)
    D_xxxxyy = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    L_xxxxyy = L_xxxxyy + (D_xxxxyy*M_0)
    D_xxxxyz = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    L_xxxxy  = L_xxxxy + (D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z)
    L_xxxxyz = L_xxxxyz + (D_xxxxyz*M_0)
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    L_xxxx   = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyz*M_yz + D_xxxxz*M_z + &
      D_xxxxzz*M_zz)
    L_xxxxz  = L_xxxxz + (D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z)
    D_xxxyyy = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    L_xxxyyy = L_xxxyyy + (D_xxxyyy*M_0)
    D_xxxyyz = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
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
    D_xxyyyy = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    L_xxyyyy = L_xxyyyy + (D_xxyyyy*M_0)
    D_xxyyyz = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
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
    D_xyyyyy = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    L_xyyyyy = L_xyyyyy + (D_xyyyyy*M_0)
    D_xyyyyz = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
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
    D_yyyyyy = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    L_yyyyyy = L_yyyyyy + (D_yyyyyy*M_0)
    D_yyyyyz = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
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
    
! OPS  665*ADD + 71*DIV + 1134*MUL + 35*NEG + 546*POW = 2451  (2915 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz,&
                L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz,&
                L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz,&
                L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz,&
                L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz,&
                L_yyzzzz, L_yzzzzz, L_zzzzzz
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
    Ls_xxxxx  = Ls_xxxxx + (L_xxxxx + L_xxxxxx*x + L_xxxxxy*y + L_xxxxxz*z)
    Ls_xxxxy  = Ls_xxxxy + (L_xxxxxy*x + L_xxxxy + L_xxxxyy*y + L_xxxxyz*z)
    Ls_xxxyy  = Ls_xxxyy + (L_xxxxyy*x + L_xxxyy + L_xxxyyy*y + L_xxxyyz*z)
    Ls_xxyyy  = Ls_xxyyy + (L_xxxyyy*x + L_xxyyy + L_xxyyyy*y + L_xxyyyz*z)
    Ls_xyyyy  = Ls_xyyyy + (L_xxyyyy*x + L_xyyyy + L_xyyyyy*y + L_xyyyyz*z)
    Ls_yyyyy  = Ls_yyyyy + (L_xyyyyy*x + L_yyyyy + L_yyyyyy*y + L_yyyyyz*z)
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
    Ls_xxxx   = Ls_xxxx + (L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxz*x*z + L_xxxxy*y + L_xxxxyz* &
      y*z + L_xxxxz*z + (1.0d0/2.0d0)*(L_xxxxxx*x**2 + L_xxxxyy*y**2 + &
      L_xxxxzz*z**2))
    Ls_xxxxz  = Ls_xxxxz + (L_xxxxxz*x + L_xxxxyz*y + L_xxxxz + L_xxxxzz*z)
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    Ls_xxxy   = Ls_xxxy + (L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyz*x*z + L_xxxy + L_xxxyy*y + L_xxxyyz* &
      y*z + L_xxxyz*z + (1.0d0/2.0d0)*(L_xxxxxy*x**2 + L_xxxyyy*y**2 + &
      L_xxxyzz*z**2))
    Ls_xxxyz  = Ls_xxxyz + (L_xxxxyz*x + L_xxxyyz*y + L_xxxyz + L_xxxyzz*z)
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    Ls_xxx    = Ls_xxx + (L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/6.0d0)*(L_xxxxxx*x**3 + &
      L_xxxyyy*y**3 + L_xxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxx*x**2 + &
      L_xxxxxy*x**2*y + L_xxxxxz*x**2*z + L_xxxxyy*x*y**2 + L_xxxxzz*x* &
      z**2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z**2 + L_xxxzz &
      *z**2))
    Ls_xxxz   = Ls_xxxz + (L_xxxxyz*x*y + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + L_xxxyzz*y*z + &
      L_xxxz + L_xxxzz*z + (1.0d0/2.0d0)*(L_xxxxxz*x**2 + L_xxxyyz*y**2 &
      + L_xxxzzz*z**2))
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    Ls_xxyy   = Ls_xxyy + (L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyz*x*z + L_xxyy + L_xxyyy*y + L_xxyyyz* &
      y*z + L_xxyyz*z + (1.0d0/2.0d0)*(L_xxxxyy*x**2 + L_xxyyyy*y**2 + &
      L_xxyyzz*z**2))
    Ls_xxyyz  = Ls_xxyyz + (L_xxxyyz*x + L_xxyyyz*y + L_xxyyz + L_xxyyzz*z)
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    Ls_xxy    = Ls_xxy + (L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/6.0d0)*(L_xxxxxy*x**3 + &
      L_xxyyyy*y**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + &
      L_xxxxyy*x**2*y + L_xxxxyz*x**2*z + L_xxxyyy*x*y**2 + L_xxxyzz*x* &
      z**2 + L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz &
      *z**2))
    Ls_xxyz   = Ls_xxyz + (L_xxxyyz*x*y + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + L_xxyyzz*y*z + &
      L_xxyz + L_xxyzz*z + (1.0d0/2.0d0)*(L_xxxxyz*x**2 + L_xxyyyz*y**2 &
      + L_xxyzzz*z**2))
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    Ls_xx     = Ls_xx + (L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxyyyy*y &
      **4 + L_xxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyy*x**2*y**2 + &
      L_xxxxzz*x**2*z**2 + L_xxyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxx &
      *x**3 + L_xxxxxy*x**3*y + L_xxxxxz*x**3*z + L_xxxyyy*x*y**3 + &
      L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z** &
      3 + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2))
    Ls_xxz    = Ls_xxz + (L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/6.0d0)*(L_xxxxxz*x**3 + &
      L_xxyyyz*y**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2*y + &
      L_xxxxz*x**2 + L_xxxxzz*x**2*z + L_xxxyyz*x*y**2 + L_xxxzzz*x*z** &
      2 + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z**2 + L_xxzzz*z &
      **2))
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    Ls_xyyy   = Ls_xyyy + (L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyz*x*z + L_xyyy + L_xyyyy*y + L_xyyyyz* &
      y*z + L_xyyyz*z + (1.0d0/2.0d0)*(L_xxxyyy*x**2 + L_xyyyyy*y**2 + &
      L_xyyyzz*z**2))
    Ls_xyyyz  = Ls_xyyyz + (L_xxyyyz*x + L_xyyyyz*y + L_xyyyz + L_xyyyzz*z)
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    Ls_xyy    = Ls_xyy + (L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/6.0d0)*(L_xxxxyy*x**3 + &
      L_xyyyyy*y**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + &
      L_xxxyyy*x**2*y + L_xxxyyz*x**2*z + L_xxyyyy*x*y**2 + L_xxyyzz*x* &
      z**2 + L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz &
      *z**2))
    Ls_xyyz   = Ls_xyyz + (L_xxyyyz*x*y + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + L_xyyyzz*y*z + &
      L_xyyz + L_xyyzz*z + (1.0d0/2.0d0)*(L_xxxyyz*x**2 + L_xyyyyz*y**2 &
      + L_xyyzzz*z**2))
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    Ls_xy     = Ls_xy + (L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xyyyyy*y &
      **4 + L_xyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyy*x**2*y**2 + &
      L_xxxyzz*x**2*z**2 + L_xyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxy &
      *x**3 + L_xxxxyy*x**3*y + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + &
      L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz*y**3*z + L_xyyzzz*y*z** &
      3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyyyz*x* &
      y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2))
    Ls_xyz    = Ls_xyz + (L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/6.0d0)*(L_xxxxyz*x**3 + &
      L_xyyyyz*y**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2*y + &
      L_xxxyz*x**2 + L_xxxyzz*x**2*z + L_xxyyyz*x*y**2 + L_xxyzzz*x*z** &
      2 + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z**2 + L_xyzzz*z &
      **2))
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    Ls_x      = Ls_x + (L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xyyyyy*y**5 + &
      L_xzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + L_xxxxzz*x &
      **3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxzzz*x**2*z**3 + L_xyyyzz*y** &
      3*z**2 + L_xyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxz*x**4*z + L_xxyyyy*x*y** &
      4 + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y &
      *z**4 + L_xzzzz*z**4) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y &
      + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + L_xxyy*x*y**2 + L_xxyyz*x*y &
      **2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y &
      **2*z + L_xyzz*y*z**2 + L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 &
      + L_xxxxy*x**3*y + L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x &
      *y**3 + L_xxyyyz*x*y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + &
      L_xyyy*y**3 + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3))
    Ls_xz     = Ls_xz + (L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/24.0d0)*(L_xxxxxz*x**4 + L_xyyyyz*y**4 &
      + L_xzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyz*x**2*y**2 + L_xxxzzz*x &
      **2*z**2 + L_xyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxyz*x**3*y + &
      L_xxxxz*x**3 + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxzzzz*x*z** &
      3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y*z**3 + L_xzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz*x**2*y*z + L_xxxz &
      *x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + &
      L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z &
      + L_xyzzz*y*z**2 + L_xzzz*z**2))
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    Ls_yyyy   = Ls_yyyy + (L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyz*x*z + L_yyyy + L_yyyyy*y + L_yyyyyz* &
      y*z + L_yyyyz*z + (1.0d0/2.0d0)*(L_xxyyyy*x**2 + L_yyyyyy*y**2 + &
      L_yyyyzz*z**2))
    Ls_yyyyz  = Ls_yyyyz + (L_xyyyyz*x + L_yyyyyz*y + L_yyyyz + L_yyyyzz*z)
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    Ls_yyy    = Ls_yyy + (L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/6.0d0)*(L_xxxyyy*x**3 + &
      L_yyyyyy*y**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + &
      L_xxyyyy*x**2*y + L_xxyyyz*x**2*z + L_xyyyyy*x*y**2 + L_xyyyzz*x* &
      z**2 + L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz &
      *z**2))
    Ls_yyyz   = Ls_yyyz + (L_xyyyyz*x*y + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + L_yyyyzz*y*z + &
      L_yyyz + L_yyyzz*z + (1.0d0/2.0d0)*(L_xxyyyz*x**2 + L_yyyyyz*y**2 &
      + L_yyyzzz*z**2))
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    Ls_yy     = Ls_yy + (L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_yyyyyy*y &
      **4 + L_yyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyy*x**2*y**2 + &
      L_xxyyzz*x**2*z**2 + L_yyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyy &
      *x**3 + L_xxxyyy*x**3*y + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + &
      L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz*y**3*z + L_yyyzzz*y*z** &
      3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyyyz*x* &
      y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2))
    Ls_yyz    = Ls_yyz + (L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/6.0d0)*(L_xxxyyz*x**3 + &
      L_yyyyyz*y**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2*y + &
      L_xxyyz*x**2 + L_xxyyzz*x**2*z + L_xyyyyz*x*y**2 + L_xyyzzz*x*z** &
      2 + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z**2 + L_yyzzz*z &
      **2))
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    Ls_y      = Ls_y + (L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_yyyyyy*y**5 + &
      L_yzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + L_xxxyzz*x &
      **3*z**2 + L_xxyyyy*x**2*y**3 + L_xxyzzz*x**2*z**3 + L_yyyyzz*y** &
      3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyz*x**4*z + L_xyyyyy*x*y** &
      4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y**4*z + L_yyzzzz*y &
      *z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3 &
      *y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + &
      L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y &
      **3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x &
      **2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + &
      L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + &
      L_yzz*z**2))
    Ls_yz     = Ls_yz + (L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/24.0d0)*(L_xxxxyz*x**4 + L_yyyyyz*y**4 &
      + L_yzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyz*x**2*y**2 + L_xxyzzz*x &
      **2*z**2 + L_yyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyyz*x**3*y + &
      L_xxxyz*x**3 + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyzzzz*x*z** &
      3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y*z**3 + L_yzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz*x**2*y*z + L_xxyz &
      *x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + &
      L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z &
      + L_yyzzz*y*z**2 + L_yzzz*z**2))
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    Ls_0      = Ls_0 + (L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/720.0d0)*( &
      L_xxxxxx*x**6 + L_yyyyyy*y**6 + L_zzzzzz*z**6) + (1.0d0/36.0d0)*( &
      L_xxxyyy*x**3*y**3 + L_xxxzzz*x**3*z**3 + L_yyyzzz*y**3*z**3) + ( &
      1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy &
      *x**2*y**4 + L_xxzzzz*x**2*z**4 + L_yyyyzz*y**4*z**2 + L_yyzzzz*y &
      **2*z**4) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z &
      + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + &
      L_yyzz*y**2*z**2) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5 &
      *y + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + &
      L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3) + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_xxxxy*x**4*y + &
      L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xyyyyz*x* &
      y**4*z + L_xyzzzz*x*y*z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + &
      L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyy*x**3*y**2 + L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + &
      L_xxxzz*x**3*z**2 + L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + &
      L_xxyzzz*x**2*y*z**3 + L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + &
      L_xyyzzz*x*y**2*z**3 + L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3))
    Ls_z      = Ls_z + (L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/120.0d0)*(L_xxxxxz*x**5 + L_yyyyyz*y**5 + &
      L_zzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyz*x**3*y**2 + L_xxxzzz*x &
      **3*z**2 + L_xxyyyz*x**2*y**3 + L_xxzzzz*x**2*z**3 + L_yyyzzz*y** &
      3*z**2 + L_yyzzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxz*x**4 + L_xxxxzz*x**4*z + L_xyyyyz*x*y** &
      4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y**4*z + L_yzzzzz*y &
      *z**4 + L_zzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz* &
      x**3*y*z + L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + &
      L_xyyyzz*x*y**3*z + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y &
      **3 + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x &
      **2*z + L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + &
      L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + &
      L_zzz*z**2))
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
    
! OPS  690*ADD + 2*DIV + 1126*MUL + 39*NEG + 256*POW + 58*SUB = 2171  (2235 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy,&
                D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz,&
                D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy,&
                D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy,&
                D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz
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
    h        = x**2 + y**2 + z**2
    u2       = 1.0/h
    u        = sqrt(u2)
    D_0      = u
    D_x      = -u**3*x
    D_y      = -u**3*y
    D_z      = -u**3*z
    D_xx     = -h*u**5 + 3*u**5*x**2
    D_xy     = 3*u**5*x*y
    D_xz     = 3*u**5*x*z
    D_yy     = -h*u**5 + 3*u**5*y**2
    D_yz     = 3*u**5*y*z
    D_zz     = -(D_xx + D_yy)
    D_xxx    = 9*h*u**7*x - 15*u**7*x**3
    D_xxy    = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz    = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy    = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz    = -15*u**7*x*y*z
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = 9*h*u**7*y - 15*u**7*y**3
    D_yyz    = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    D_xxxx   = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy   = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz   = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy   = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz   = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz   = -(D_xxxx + D_xxyy)
    D_xyyy   = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz   = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz   = -(D_xxxy + D_xyyy)
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz   = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    D_xxxxx  = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy  = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz  = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy  = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz  = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    D_xxyyy  = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz  = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    D_xyyyy  = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz  = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz  = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    D_xxxxxx = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    L_xxxxx  = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    L_xxxxy  = D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyz*M_yz + D_xxxxz*M_z + &
      D_xxxxzz*M_zz
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
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
    D_xxyyyy = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
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
    D_xyyyyy = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
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
    D_yyyyyy = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
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
    
! OPS  418*ADD + 48*DIV + 783*MUL + 36*NEG + 435*POW = 1720  (2097 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz,&
                L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz,&
                L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz,&
                L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz,&
                L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz,&
                L_yyzzzz, L_yzzzzz, L_zzzzzz
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
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    L_yzz    = -(L_xxy + L_yyy)
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
    L_xxxyzz = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz = -(L_xxxxzz + L_xxyyzz)
    Phi_xx   = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxyyyy*y &
      **4 + L_xxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyy*x**2*y**2 + &
      L_xxxxzz*x**2*z**2 + L_xxyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxx &
      *x**3 + L_xxxxxy*x**3*y + L_xxxxxz*x**3*z + L_xxxyyy*x*y**3 + &
      L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z** &
      3 + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    L_xyyyzz = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz = -(L_xxxyzz + L_xyyyzz)
    Phi_xy   = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xyyyyy*y &
      **4 + L_xyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyy*x**2*y**2 + &
      L_xxxyzz*x**2*z**2 + L_xyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxy &
      *x**3 + L_xxxxyy*x**3*y + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + &
      L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz*y**3*z + L_xyyzzz*y*z** &
      3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyyyz*x* &
      y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    L_xzzzzz = -(L_xxxzzz + L_xyyzzz)
    Phi_x    = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xyyyyy*y**5 + &
      L_xzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + L_xxxxzz*x &
      **3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxzzz*x**2*z**3 + L_xyyyzz*y** &
      3*z**2 + L_xyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxz*x**4*z + L_xxyyyy*x*y** &
      4 + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y &
      *z**4 + L_xzzzz*z**4) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y &
      + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + L_xxyy*x*y**2 + L_xxyyz*x*y &
      **2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y &
      **2*z + L_xyzz*y*z**2 + L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 &
      + L_xxxxy*x**3*y + L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x &
      *y**3 + L_xxyyyz*x*y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + &
      L_xyyy*y**3 + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3)
    Phi_xz   = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/24.0d0)*(L_xxxxxz*x**4 + L_xyyyyz*y**4 &
      + L_xzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyz*x**2*y**2 + L_xxxzzz*x &
      **2*z**2 + L_xyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxyz*x**3*y + &
      L_xxxxz*x**3 + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxzzzz*x*z** &
      3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y*z**3 + L_xzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz*x**2*y*z + L_xxxz &
      *x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + &
      L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z &
      + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyyzz = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz = -(L_xxyyzz + L_yyyyzz)
    Phi_yy   = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_yyyyyy*y &
      **4 + L_yyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyy*x**2*y**2 + &
      L_xxyyzz*x**2*z**2 + L_yyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyy &
      *x**3 + L_xxxyyy*x**3*y + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + &
      L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz*y**3*z + L_yyyzzz*y*z** &
      3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyyyz*x* &
      y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Phi_zz   = -(Phi_xx + Phi_yy)
    L_yzzzzz = -(L_xxyzzz + L_yyyzzz)
    Phi_y    = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_yyyyyy*y**5 + &
      L_yzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + L_xxxyzz*x &
      **3*z**2 + L_xxyyyy*x**2*y**3 + L_xxyzzz*x**2*z**3 + L_yyyyzz*y** &
      3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyz*x**4*z + L_xyyyyy*x*y** &
      4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y**4*z + L_yyzzzz*y &
      *z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3 &
      *y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + &
      L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y &
      **3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x &
      **2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + &
      L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + &
      L_yzz*z**2)
    Phi_yz   = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/24.0d0)*(L_xxxxyz*x**4 + L_yyyyyz*y**4 &
      + L_yzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyz*x**2*y**2 + L_xxyzzz*x &
      **2*z**2 + L_yyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyyz*x**3*y + &
      L_xxxyz*x**3 + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyzzzz*x*z** &
      3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y*z**3 + L_yzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz*x**2*y*z + L_xxyz &
      *x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + &
      L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z &
      + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzzz = -(L_xxzzzz + L_yyzzzz)
    Phi_0    = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/720.0d0)*( &
      L_xxxxxx*x**6 + L_yyyyyy*y**6 + L_zzzzzz*z**6) + (1.0d0/36.0d0)*( &
      L_xxxyyy*x**3*y**3 + L_xxxzzz*x**3*z**3 + L_yyyzzz*y**3*z**3) + ( &
      1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy &
      *x**2*y**4 + L_xxzzzz*x**2*z**4 + L_yyyyzz*y**4*z**2 + L_yyzzzz*y &
      **2*z**4) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z &
      + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + &
      L_yyzz*y**2*z**2) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5 &
      *y + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + &
      L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3) + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_xxxxy*x**4*y + &
      L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xyyyyz*x* &
      y**4*z + L_xyzzzz*x*y*z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + &
      L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyy*x**3*y**2 + L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + &
      L_xxxzz*x**3*z**2 + L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + &
      L_xxyzzz*x**2*y*z**3 + L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + &
      L_xyyzzz*x*y**2*z**3 + L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3)
    Phi_z    = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/120.0d0)*(L_xxxxxz*x**5 + L_yyyyyz*y**5 + &
      L_zzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyz*x**3*y**2 + L_xxxzzz*x &
      **3*z**2 + L_xxyyyz*x**2*y**3 + L_xxzzzz*x**2*z**3 + L_yyyzzz*y** &
      3*z**2 + L_yyzzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxz*x**4 + L_xxxxzz*x**4*z + L_xyyyyz*x*y** &
      4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y**4*z + L_yzzzzz*y &
      *z**4 + L_zzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz* &
      x**3*y*z + L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + &
      L_xyyyzz*x*y**3*z + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y &
      **3 + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x &
      **2*z + L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + &
      L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + &
      L_zzz*z**2)
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
    
! OPS  665*ADD + 71*DIV + 1134*MUL + 35*NEG + 546*POW = 2451  (2915 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz,&
                L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz,&
                L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz,&
                L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz,&
                L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz,&
                L_yyzzzz, L_yzzzzz, L_zzzzzz
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
    Ls_xxxxx  = L_xxxxx + L_xxxxxx*x + L_xxxxxy*y + L_xxxxxz*z
    Ls_xxxxy  = L_xxxxxy*x + L_xxxxy + L_xxxxyy*y + L_xxxxyz*z
    Ls_xxxyy  = L_xxxxyy*x + L_xxxyy + L_xxxyyy*y + L_xxxyyz*z
    Ls_xxyyy  = L_xxxyyy*x + L_xxyyy + L_xxyyyy*y + L_xxyyyz*z
    Ls_xyyyy  = L_xxyyyy*x + L_xyyyy + L_xyyyyy*y + L_xyyyyz*z
    Ls_yyyyy  = L_xyyyyy*x + L_yyyyy + L_yyyyyy*y + L_yyyyyz*z
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
    Ls_xxxx   = L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxz*x*z + L_xxxxy*y + L_xxxxyz* &
      y*z + L_xxxxz*z + (1.0d0/2.0d0)*(L_xxxxxx*x**2 + L_xxxxyy*y**2 + &
      L_xxxxzz*z**2)
    Ls_xxxxz  = L_xxxxxz*x + L_xxxxyz*y + L_xxxxz + L_xxxxzz*z
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    Ls_xxxy   = L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyz*x*z + L_xxxy + L_xxxyy*y + L_xxxyyz* &
      y*z + L_xxxyz*z + (1.0d0/2.0d0)*(L_xxxxxy*x**2 + L_xxxyyy*y**2 + &
      L_xxxyzz*z**2)
    Ls_xxxyz  = L_xxxxyz*x + L_xxxyyz*y + L_xxxyz + L_xxxyzz*z
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    Ls_xxx    = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/6.0d0)*(L_xxxxxx*x**3 + &
      L_xxxyyy*y**3 + L_xxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxx*x**2 + &
      L_xxxxxy*x**2*y + L_xxxxxz*x**2*z + L_xxxxyy*x*y**2 + L_xxxxzz*x* &
      z**2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z**2 + L_xxxzz &
      *z**2)
    Ls_xxxz   = L_xxxxyz*x*y + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + L_xxxyzz*y*z + &
      L_xxxz + L_xxxzz*z + (1.0d0/2.0d0)*(L_xxxxxz*x**2 + L_xxxyyz*y**2 &
      + L_xxxzzz*z**2)
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    Ls_xxyy   = L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyz*x*z + L_xxyy + L_xxyyy*y + L_xxyyyz* &
      y*z + L_xxyyz*z + (1.0d0/2.0d0)*(L_xxxxyy*x**2 + L_xxyyyy*y**2 + &
      L_xxyyzz*z**2)
    Ls_xxyyz  = L_xxxyyz*x + L_xxyyyz*y + L_xxyyz + L_xxyyzz*z
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    Ls_xxy    = L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/6.0d0)*(L_xxxxxy*x**3 + &
      L_xxyyyy*y**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + &
      L_xxxxyy*x**2*y + L_xxxxyz*x**2*z + L_xxxyyy*x*y**2 + L_xxxyzz*x* &
      z**2 + L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz &
      *z**2)
    Ls_xxyz   = L_xxxyyz*x*y + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + L_xxyyzz*y*z + &
      L_xxyz + L_xxyzz*z + (1.0d0/2.0d0)*(L_xxxxyz*x**2 + L_xxyyyz*y**2 &
      + L_xxyzzz*z**2)
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    Ls_xx     = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxyyyy*y &
      **4 + L_xxzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxxyy*x**2*y**2 + &
      L_xxxxzz*x**2*z**2 + L_xxyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxx &
      *x**3 + L_xxxxxy*x**3*y + L_xxxxxz*x**3*z + L_xxxyyy*x*y**3 + &
      L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z** &
      3 + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    Ls_xxz    = L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/6.0d0)*(L_xxxxxz*x**3 + &
      L_xxyyyz*y**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2*y + &
      L_xxxxz*x**2 + L_xxxxzz*x**2*z + L_xxxyyz*x*y**2 + L_xxxzzz*x*z** &
      2 + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z**2 + L_xxzzz*z &
      **2)
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    Ls_xyyy   = L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyz*x*z + L_xyyy + L_xyyyy*y + L_xyyyyz* &
      y*z + L_xyyyz*z + (1.0d0/2.0d0)*(L_xxxyyy*x**2 + L_xyyyyy*y**2 + &
      L_xyyyzz*z**2)
    Ls_xyyyz  = L_xxyyyz*x + L_xyyyyz*y + L_xyyyz + L_xyyyzz*z
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    Ls_xyy    = L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/6.0d0)*(L_xxxxyy*x**3 + &
      L_xyyyyy*y**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + &
      L_xxxyyy*x**2*y + L_xxxyyz*x**2*z + L_xxyyyy*x*y**2 + L_xxyyzz*x* &
      z**2 + L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz &
      *z**2)
    Ls_xyyz   = L_xxyyyz*x*y + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + L_xyyyzz*y*z + &
      L_xyyz + L_xyyzz*z + (1.0d0/2.0d0)*(L_xxxyyz*x**2 + L_xyyyyz*y**2 &
      + L_xyyzzz*z**2)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    Ls_xy     = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xyyyyy*y &
      **4 + L_xyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyy*x**2*y**2 + &
      L_xxxyzz*x**2*z**2 + L_xyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxy &
      *x**3 + L_xxxxyy*x**3*y + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + &
      L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz*y**3*z + L_xyyzzz*y*z** &
      3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyyyz*x* &
      y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    Ls_xyz    = L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/6.0d0)*(L_xxxxyz*x**3 + &
      L_xyyyyz*y**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2*y + &
      L_xxxyz*x**2 + L_xxxyzz*x**2*z + L_xxyyyz*x*y**2 + L_xxyzzz*x*z** &
      2 + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z**2 + L_xyzzz*z &
      **2)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    Ls_x      = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/120.0d0)*(L_xxxxxx*x**5 + L_xyyyyy*y**5 + &
      L_xzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyy*x**3*y**2 + L_xxxxzz*x &
      **3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxzzz*x**2*z**3 + L_xyyyzz*y** &
      3*z**2 + L_xyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxx*x**4 + L_xxxxxy*x**4*y + L_xxxxxz*x**4*z + L_xxyyyy*x*y** &
      4 + L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y &
      *z**4 + L_xzzzz*z**4) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y &
      + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + L_xxyy*x*y**2 + L_xxyyz*x*y &
      **2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y &
      **2*z + L_xyzz*y*z**2 + L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 &
      + L_xxxxy*x**3*y + L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x &
      *y**3 + L_xxyyyz*x*y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + &
      L_xyyy*y**3 + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3)
    Ls_xz     = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/24.0d0)*(L_xxxxxz*x**4 + L_xyyyyz*y**4 &
      + L_xzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxxyyz*x**2*y**2 + L_xxxzzz*x &
      **2*z**2 + L_xyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxxyz*x**3*y + &
      L_xxxxz*x**3 + L_xxxxzz*x**3*z + L_xxyyyz*x*y**3 + L_xxzzzz*x*z** &
      3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y*z**3 + L_xzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz*x**2*y*z + L_xxxz &
      *x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxyyzz*x*y**2*z + &
      L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + L_xyyzz*y**2*z &
      + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    Ls_yyyy   = L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyz*x*z + L_yyyy + L_yyyyy*y + L_yyyyyz* &
      y*z + L_yyyyz*z + (1.0d0/2.0d0)*(L_xxyyyy*x**2 + L_yyyyyy*y**2 + &
      L_yyyyzz*z**2)
    Ls_yyyyz  = L_xyyyyz*x + L_yyyyyz*y + L_yyyyz + L_yyyyzz*z
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    Ls_yyy    = L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/6.0d0)*(L_xxxyyy*x**3 + &
      L_yyyyyy*y**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + &
      L_xxyyyy*x**2*y + L_xxyyyz*x**2*z + L_xyyyyy*x*y**2 + L_xyyyzz*x* &
      z**2 + L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz &
      *z**2)
    Ls_yyyz   = L_xyyyyz*x*y + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + L_yyyyzz*y*z + &
      L_yyyz + L_yyyzz*z + (1.0d0/2.0d0)*(L_xxyyyz*x**2 + L_yyyyyz*y**2 &
      + L_yyyzzz*z**2)
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    Ls_yy     = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_yyyyyy*y &
      **4 + L_yyzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyy*x**2*y**2 + &
      L_xxyyzz*x**2*z**2 + L_yyyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyy &
      *x**3 + L_xxxyyy*x**3*y + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + &
      L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz*y**3*z + L_yyyzzz*y*z** &
      3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyyyz*x* &
      y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Ls_yyz    = L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/6.0d0)*(L_xxxyyz*x**3 + &
      L_yyyyyz*y**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2*y + &
      L_xxyyz*x**2 + L_xxyyzz*x**2*z + L_xyyyyz*x*y**2 + L_xyyzzz*x*z** &
      2 + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z**2 + L_yyzzz*z &
      **2)
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    Ls_y      = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/120.0d0)*(L_xxxxxy*x**5 + L_yyyyyy*y**5 + &
      L_yzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + L_xxxyzz*x &
      **3*z**2 + L_xxyyyy*x**2*y**3 + L_xxyzzz*x**2*z**3 + L_yyyyzz*y** &
      3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyz*x**4*z + L_xyyyyy*x*y** &
      4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + L_yyyyyz*y**4*z + L_yyzzzz*y &
      *z**4 + L_yzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3 &
      *y + L_xxxyyz*x**3*y*z + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + &
      L_xyyyyz*x*y**3*z + L_xyyzzz*x*y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y &
      **3 + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x &
      **2*z + L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + &
      L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + &
      L_yzz*z**2)
    Ls_yz     = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/24.0d0)*(L_xxxxyz*x**4 + L_yyyyyz*y**4 &
      + L_yzzzzz*z**4) + (1.0d0/4.0d0)*(L_xxyyyz*x**2*y**2 + L_xxyzzz*x &
      **2*z**2 + L_yyyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyyz*x**3*y + &
      L_xxxyz*x**3 + L_xxxyzz*x**3*z + L_xyyyyz*x*y**3 + L_xyzzzz*x*z** &
      3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y*z**3 + L_yzzzz*z &
      **3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz*x**2*y*z + L_xxyz &
      *x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyyyzz*x*y**2*z + &
      L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + L_yyyzz*y**2*z &
      + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    Ls_0      = L_0 + L_x*x + (1.0d0/8.0d0)*L_xxyyzz*x**2*y**2*z**2 + L_xy*x*y + L_xyz*x &
      *y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z*z + (1.0d0/720.0d0)*( &
      L_xxxxxx*x**6 + L_yyyyyy*y**6 + L_zzzzzz*z**6) + (1.0d0/36.0d0)*( &
      L_xxxyyy*x**3*y**3 + L_xxxzzz*x**3*z**3 + L_yyyzzz*y**3*z**3) + ( &
      1.0d0/48.0d0)*(L_xxxxyy*x**4*y**2 + L_xxxxzz*x**4*z**2 + L_xxyyyy &
      *x**2*y**4 + L_xxzzzz*x**2*z**4 + L_yyyyzz*y**4*z**2 + L_yyzzzz*y &
      **2*z**4) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x**2*y**2*z &
      + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y**2*z**2 + &
      L_yyzz*y**2*z**2) + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_xxxxxy*x**5 &
      *y + L_xxxxxz*x**5*z + L_xyyyyy*x*y**5 + L_xzzzzz*x*z**5 + &
      L_yyyyy*y**5 + L_yyyyyz*y**5*z + L_yzzzzz*y*z**5 + L_zzzzz*z**5) &
      + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + &
      L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3) + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_xxxxy*x**4*y + &
      L_xxxxyz*x**4*y*z + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xyyyyz*x* &
      y**4*z + L_xyzzzz*x*y*z**4 + L_xzzzz*x*z**4 + L_yyyy*y**4 + &
      L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + (1.0d0/12.0d0)*( &
      L_xxxyy*x**3*y**2 + L_xxxyyz*x**3*y**2*z + L_xxxyzz*x**3*y*z**2 + &
      L_xxxzz*x**3*z**2 + L_xxyyy*x**2*y**3 + L_xxyyyz*x**2*y**3*z + &
      L_xxyzzz*x**2*y*z**3 + L_xxzzz*x**2*z**3 + L_xyyyzz*x*y**3*z**2 + &
      L_xyyzzz*x*y**2*z**3 + L_yyyzz*y**3*z**2 + L_yyzzz*y**2*z**3)
    Ls_z      = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/120.0d0)*(L_xxxxxz*x**5 + L_yyyyyz*y**5 + &
      L_zzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyz*x**3*y**2 + L_xxxzzz*x &
      **3*z**2 + L_xxyyyz*x**2*y**3 + L_xxzzzz*x**2*z**3 + L_yyyzzz*y** &
      3*z**2 + L_yyzzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxz*x**4 + L_xxxxzz*x**4*z + L_xyyyyz*x*y** &
      4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz*y**4*z + L_yzzzzz*y &
      *z**4 + L_zzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxyzz* &
      x**3*y*z + L_xxxz*x**3 + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + &
      L_xyyyzz*x*y**3*z + L_xyzzzz*x*y*z**3 + L_xzzzz*x*z**3 + L_yyyz*y &
      **3 + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x &
      **2*z + L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + &
      L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + &
      L_zzz*z**2)
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
