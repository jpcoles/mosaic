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
        
    
! OPS  29*ADD + 81*DIV + 252*MUL + 126*POW + 54*SUB = 542  (571 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u
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
    M_0      = W
    M_x      = W*x
    M_y      = W*y
    M_z      = W*z
    M_xy     = W*x*y
    M_xz     = W*x*z
    M_yz     = W*y*z
    M_xyz    = W*x*y*z
    h        = x**2 + y**2 + z**2
    M_xx     = W*(-1.0d0/3.0d0*h + x**2)
    M_yy     = W*(-1.0d0/3.0d0*h + y**2)
    M_xxx    = W*(-3.0d0/5.0d0*h*x + x**3)
    M_xxy    = W*(-1.0d0/5.0d0*h*y + x**2*y)
    M_xxz    = W*(-1.0d0/5.0d0*h*z + x**2*z)
    M_xyy    = W*(-1.0d0/5.0d0*h*x + x*y**2)
    M_yyy    = W*(-3.0d0/5.0d0*h*y + y**3)
    M_yyz    = W*(-1.0d0/5.0d0*h*z + y**2*z)
    M_xxxx   = W*((3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4)
    M_xxxy   = W*(-3.0d0/7.0d0*h*x*y + x**3*y)
    M_xxxz   = W*(-3.0d0/7.0d0*h*x*z + x**3*z)
    M_xxyy   = W*((1.0d0/35.0d0)*h**2 - 1.0d0/7.0d0*h*x**2 - 1.0d0/7.0d0*h*y**2 + x**2* &
      y**2)
    M_xxyz   = W*(-1.0d0/7.0d0*h*y*z + x**2*y*z)
    M_xyyy   = W*(-3.0d0/7.0d0*h*x*y + x*y**3)
    M_xyyz   = W*(-1.0d0/7.0d0*h*x*z + x*y**2*z)
    M_yyyy   = W*((3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4)
    M_yyyz   = W*(-3.0d0/7.0d0*h*y*z + y**3*z)
    M_xxxxx  = W*((5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5)
    M_xxxxy  = W*((1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y)
    M_xxxxz  = W*((1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z)
    M_xxxyy  = W*((1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x &
      **3*y**2)
    M_xxxyz  = W*(-1.0d0/3.0d0*h*x*y*z + x**3*y*z)
    M_xxyyy  = W*((1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x &
      **2*y**3)
    M_xxyyz  = W*((1.0d0/63.0d0)*h**2*z - 1.0d0/9.0d0*h*x**2*z - 1.0d0/9.0d0*h*y**2*z + &
      x**2*y**2*z)
    M_xyyyy  = W*((1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4)
    M_xyyyz  = W*(-1.0d0/3.0d0*h*x*y*z + x*y**3*z)
    M_yyyyy  = W*((5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5)
    M_yyyyz  = W*((1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z)
    M_xxxxxx = W*(-5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*x**2 - 15.0d0/11.0d0*h*x**4 &
      + x**6)
    M_xxxxxy = W*((5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x**3*y + x**5*y)
    M_xxxxxz = W*((5.0d0/33.0d0)*h**2*x*z - 10.0d0/11.0d0*h*x**3*z + x**5*z)
    M_xxxxyy = W*(-1.0d0/231.0d0*h**3 + (2.0d0/33.0d0)*h**2*x**2 + (1.0d0/33.0d0)*h**2* &
      y**2 - 1.0d0/11.0d0*h*x**4 - 6.0d0/11.0d0*h*x**2*y**2 + x**4*y**2 &
      )
    M_xxxxyz = W*((1.0d0/33.0d0)*h**2*y*z - 6.0d0/11.0d0*h*x**2*y*z + x**4*y*z)
    M_xxxyyy = W*((1.0d0/11.0d0)*h**2*x*y - 3.0d0/11.0d0*h*x**3*y - 3.0d0/11.0d0*h*x*y &
      **3 + x**3*y**3)
    M_xxxyyz = W*((1.0d0/33.0d0)*h**2*x*z - 1.0d0/11.0d0*h*x**3*z - 3.0d0/11.0d0*h*x*y &
      **2*z + x**3*y**2*z)
    M_xxyyyy = W*(-1.0d0/231.0d0*h**3 + (1.0d0/33.0d0)*h**2*x**2 + (2.0d0/33.0d0)*h**2* &
      y**2 - 6.0d0/11.0d0*h*x**2*y**2 - 1.0d0/11.0d0*h*y**4 + x**2*y**4 &
      )
    M_xxyyyz = W*((1.0d0/33.0d0)*h**2*y*z - 3.0d0/11.0d0*h*x**2*y*z - 1.0d0/11.0d0*h*y &
      **3*z + x**2*y**3*z)
    M_xyyyyy = W*((5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x*y**3 + x*y**5)
    M_xyyyyz = W*((1.0d0/33.0d0)*h**2*x*z - 6.0d0/11.0d0*h*x*y**2*z + x*y**4*z)
    M_yyyyyy = W*(-5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*y**2 - 15.0d0/11.0d0*h*y**4 &
      + y**6)
    M_yyyyyz = W*((5.0d0/33.0d0)*h**2*y*z - 10.0d0/11.0d0*h*y**3*z + y**5*z)
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
    end subroutine mom_es_P2M
    
! OPS  1133*ADD + 481*DIV + 3180*MUL + 493*NEG + 126*POW + 1178*SUB = 6591  (7572 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz,&
                M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz,&
                S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy,&
                S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz,&
                S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy,&
                S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz, S_xxxxxx,&
                S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy, S_xxxyyz,&
                S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy, S_yyyyyz
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
    Ms_0      = M_0
    Ms_x      = M_0*x + M_x
    Ms_y      = M_0*y + M_y
    Ms_z      = M_0*z + M_z
    M_zz      = -(M_xx + M_yy)
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    M_xxzz    = -(M_xxxx + M_xxyy)
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -(M_xxxzz + M_xyyzz)
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    S_0       = 1
    S_x       = x
    S_y       = y
    S_z       = z
    S_xy      = x*y
    Ms_xy     = M_0*S_xy + M_x*y + M_xy + M_y*x
    S_xz      = x*z
    Ms_xz     = M_0*S_xz + M_x*z + M_xz + M_z*x
    S_yz      = y*z
    Ms_yz     = M_0*S_yz + M_y*z + M_yz + M_z*y
    S_xyz     = x*y*z
    Ms_xyz    = M_0*S_xyz + M_x*S_yz + M_xy*z + M_xyz + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy
    h         = x**2 + y**2 + z**2
    S_xx      = -1.0d0/3.0d0*h + x**2
    Ms_xx     = M_0*S_xx + (4.0d0/3.0d0)*M_x*x + M_xx - 2.0d0/3.0d0*(M_y*y + M_z*z)
    S_yy      = -1.0d0/3.0d0*h + y**2
    Ms_yy     = M_0*S_yy + (4.0d0/3.0d0)*M_y*y + M_yy - 2.0d0/3.0d0*(M_x*x + M_z*z)
    S_zz      = -(S_xx + S_yy)
    S_xxx     = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx    = M_0*S_xxx + (9.0d0/5.0d0)*M_x*S_xx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(M_xx*x - M_xy*y - M_xz*z - M_y* &
      S_xy - M_z*S_xz)
    S_xxy     = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy    = M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (1.0d0/15.0d0)*M_y*(15*S_xx - &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xy + M_xy*x) - 1.0d0/5.0d0*(3*M_yy &
      *y + 2*M_yz*z + 2*M_z*S_yz + y*(-M_xx - M_yy))
    S_xxz     = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz    = M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (1.0d0/15.0d0)*M_z*(21*S_xx + &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xz + M_xz*x) - 1.0d0/5.0d0*(2*M_y* &
      S_yz + M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy))
    S_xyy     = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy    = M_0*S_xyy + (1.0d0/15.0d0)*M_x*(-6*S_xx + 15*S_yy) + M_xyy + (4.0d0/ &
      5.0d0)*M_yy*x + (8.0d0/5.0d0)*(M_xy*y + M_y*S_xy) - 1.0d0/5.0d0*( &
      3*M_xx*x + 2*M_xz*z + 2*M_z*S_xz + x*(-M_xx - M_yy))
    S_xzz     = -(S_xxx + S_xyy)
    S_yyy     = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy    = M_0*S_yyy + (9.0d0/5.0d0)*M_y*S_yy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(-M_x*S_xy - M_xy*x + M_yy*y - &
      M_yz*z - M_z*S_yz)
    S_yyz     = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz    = M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (1.0d0/15.0d0)*M_z*(6*S_xx + &
      21*S_yy) + (8.0d0/5.0d0)*(M_y*S_yz + M_yz*y) - 1.0d0/5.0d0*(2*M_x &
      *S_xz + M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy))
    S_yzz     = -(S_xxy + S_yyy)
    S_zzz     = -(S_xxz + S_yyz)
    S_xxxx    = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4
    Ms_xxxx   = M_0*S_xxxx + (16.0d0/7.0d0)*M_x*S_xxx + (72.0d0/35.0d0)*M_xx*S_xx - &
      6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_yz*S_yz + (32.0d0/35.0d0) &
      *(M_xxx*x + M_xxxx) - 96.0d0/35.0d0*(M_xy*S_xy + M_xz*S_xz) - &
      12.0d0/7.0d0*(M_y*S_xxy + M_z*S_xxz) + (1.0d0/210.0d0)*(M_yy*( &
      -180*S_xx + 72*S_yy) + (-M_xx - M_yy)*(-252*S_xx - 72*S_yy)) - &
      3.0d0/35.0d0*(M_xxzz + M_yyyy + M_yyzz) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xxz*z + M_xyy*x + x*(-M_xxx - M_xyy)) + (12.0d0/35.0d0)*( &
      M_yyy*y + M_yyz*z + y*(-M_xxy - M_yyy) + z*(-M_xxz - M_yyz))
    S_xxxy    = -3.0d0/7.0d0*h*x*y + x**3*y
    Ms_xxxy   = M_0*S_xxxy + (15.0d0/7.0d0)*M_x*S_xxy + (4.0d0/7.0d0)*M_xxx*y + M_xxxy + &
      (12.0d0/7.0d0)*(M_xx*S_xy + M_xxy*x) + (1.0d0/105.0d0)*(M_xy*(225 &
      *S_xx - 90*S_yy) + M_y*(105*S_xxx - 90*S_xyy)) - 9.0d0/7.0d0*( &
      M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz*S_yz + M_yz* &
      S_xz + M_z*S_xyz) - 3.0d0/7.0d0*(M_yyy*x + S_xy*(-M_xx - M_yy) + &
      x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy))
    S_xxxz    = -3.0d0/7.0d0*h*x*z + x**3*z
    Ms_xxxz   = M_0*S_xxxz + (15.0d0/7.0d0)*M_x*S_xxz + (4.0d0/7.0d0)*M_xxx*z + M_xxxz + &
      (12.0d0/7.0d0)*(M_xx*S_xz + M_xxz*x) + (1.0d0/105.0d0)*(M_xz*(315 &
      *S_xx + 90*S_yy) + M_z*(195*S_xxx + 90*S_xyy)) - 9.0d0/7.0d0*( &
      S_xz*(-M_xx - M_yy) + z*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 3.0d0/7.0d0*(M_xyy*z + &
      M_yy*S_xz + M_yyz*x + x*(-M_xxz - M_yyz))
    S_xxyy    = (1.0d0/35.0d0)*h**2 + x**2*y**2 - 1.0d0/7.0d0*(h*x**2 + h*y**2)
    Ms_xxyy   = M_0*S_xxyy + (33.0d0/35.0d0)*M_xxyy + (108.0d0/35.0d0)*M_xy*S_xy + ( &
      4.0d0/35.0d0)*z*(-M_xxz - M_yyz) + (54.0d0/35.0d0)*(M_xxy*y + &
      M_xyy*x) + (1.0d0/105.0d0)*(M_x*(-30*S_xxx + 180*S_xyy) + M_y*( &
      180*S_xxy - 30*S_yyy) + M_z*(-30*S_xxz - 30*S_yyz)) + (1.0d0/ &
      210.0d0)*(M_xx*(-126*S_xx + 180*S_yy) + M_yy*(180*S_xx - 126*S_yy &
      ) + (-M_xx - M_yy)*(-54*S_xx - 54*S_yy)) - 1.0d0/35.0d0*(16*M_xxx &
      *x + M_xxxx + 6*M_xxz*z + M_xxzz + 12*M_xz*S_xz + 16*M_yyy*y + &
      M_yyyy + 6*M_yyz*z + M_yyzz + 12*M_yz*S_yz + 6*x*(-M_xxx - M_xyy &
      ) + 6*y*(-M_xxy - M_yyy))
    S_xxyz    = -1.0d0/7.0d0*h*y*z + x**2*y*z
    Ms_xxyz   = M_0*S_xxyz + M_xxyz + (9.0d0/7.0d0)*M_yz*S_xx + (1.0d0/105.0d0)*(M_y*( &
      105*S_xxz - 30*S_yyz) + M_z*(135*S_xxy + 30*S_yyy)) + (6.0d0/ &
      7.0d0)*(M_xx*S_yz + M_xxy*z + M_xxz*y) + (12.0d0/7.0d0)*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 1.0d0/7.0d0*(3*M_yy* &
      S_yz + M_yyy*z + 3*M_yyz*y + 3*S_yz*(-M_xx - M_yy) + y*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxy - M_yyy))
    S_xxzz    = -(S_xxxx + S_xxyy)
    S_xyyy    = -3.0d0/7.0d0*h*x*y + x*y**3
    Ms_xyyy   = M_0*S_xyyy + M_xyyy + (15.0d0/7.0d0)*M_y*S_xyy + (4.0d0/7.0d0)*M_yyy*x + &
      (1.0d0/105.0d0)*(M_x*(-90*S_xxy + 105*S_yyy) + M_xy*(-90*S_xx + &
      225*S_yy)) - 9.0d0/7.0d0*(M_xx*S_xy + M_xxy*x) + (12.0d0/7.0d0)*( &
      M_xyy*y + M_yy*S_xy) - 3.0d0/7.0d0*(M_xxx*y + S_xy*(-M_xx - M_yy &
      ) + x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xyz &
      *z + M_xz*S_yz + M_yz*S_xz + M_z*S_xyz)
    S_xyyz    = -1.0d0/7.0d0*h*x*z + x*y**2*z
    Ms_xyyz   = M_0*S_xyyz + M_xyyz + (9.0d0/7.0d0)*M_xz*S_yy + (1.0d0/105.0d0)*(M_x*( &
      -30*S_xxz + 105*S_yyz) + M_z*(30*S_xxx + 135*S_xyy)) + (6.0d0/ &
      7.0d0)*(M_xyy*z + M_yy*S_xz + M_yyz*x) + (12.0d0/7.0d0)*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 1.0d0/7.0d0*(3*M_xx* &
      S_xz + M_xxx*z + 3*M_xxz*x + 3*S_xz*(-M_xx - M_yy) + x*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxx - M_xyy))
    S_xyzz    = -(S_xxxy + S_xyyy)
    S_xzzz    = -(S_xxxz + S_xyyz)
    S_yyyy    = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4
    Ms_yyyy   = M_0*S_yyyy - 6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_xz*S_xz + (16.0d0/ &
      7.0d0)*M_y*S_yyy + (72.0d0/35.0d0)*M_yy*S_yy - 12.0d0/7.0d0*(M_x* &
      S_xyy + M_z*S_yyz) + (1.0d0/210.0d0)*(M_xx*(72*S_xx - 180*S_yy) + &
      (-M_xx - M_yy)*(-72*S_xx - 252*S_yy)) - 96.0d0/35.0d0*(M_xy*S_xy &
      + M_yz*S_yz) + (32.0d0/35.0d0)*(M_yyy*y + M_yyyy) - 3.0d0/35.0d0* &
      (M_xxxx + M_xxzz + M_yyzz) + (12.0d0/35.0d0)*(M_xxx*x + M_xxz*z + &
      x*(-M_xxx - M_xyy) + z*(-M_xxz - M_yyz)) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xyy*x + M_yyz*z + y*(-M_xxy - M_yyy))
    S_yyyz    = -3.0d0/7.0d0*h*y*z + y**3*z
    Ms_yyyz   = M_0*S_yyyz + (15.0d0/7.0d0)*M_y*S_yyz + (4.0d0/7.0d0)*M_yyy*z + M_yyyz + &
      (12.0d0/7.0d0)*(M_yy*S_yz + M_yyz*y) + (1.0d0/105.0d0)*(M_yz*(90* &
      S_xx + 315*S_yy) + M_z*(90*S_xxy + 195*S_yyy)) - 9.0d0/7.0d0*( &
      S_yz*(-M_xx - M_yy) + z*(-M_xxy - M_yyy)) - 6.0d0/7.0d0*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 3.0d0/7.0d0*(M_xx*S_yz &
      + M_xxy*z + M_xxz*y + y*(-M_xxz - M_yyz))
    S_yyzz    = -(S_xxyy + S_yyyy)
    S_yzzz    = -(S_xxyz + S_yyyz)
    S_zzzz    = -(S_xxzz + S_yyzz)
    S_xxxxx   = (5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5
    Ms_xxxxx  = M_0*S_xxxxx + (1.0d0/945.0d0)*M_x*(2400*S_xxxx - 450*S_xxyy - 225*S_xxzz &
      - 225*S_yyyy - 225*S_yyzz) + (200.0d0/63.0d0)*M_xx*S_xxx + ( &
      40.0d0/63.0d0)*M_xxxx*x + (16.0d0/21.0d0)*M_xxxxx + (10.0d0/ &
      21.0d0)*(-M_xxxyy + x*(-M_xxyy - M_yyyy)) - 80.0d0/63.0d0*(M_xxxy &
      *y + M_xxxz*z) - 80.0d0/21.0d0*(M_xxy*S_xy + M_xxz*S_xz) - &
      100.0d0/21.0d0*(M_xy*S_xxy + M_xz*S_xxz) - 20.0d0/9.0d0*(M_y* &
      S_xxxy + M_z*S_xxxz) + (1.0d0/1890.0d0)*(M_xyy*(-4500*S_xx + 1800 &
      *S_yy) + M_yy*(-2100*S_xxx + 1800*S_xyy) + (-M_xx - M_yy)*(-3900* &
      S_xxx - 1800*S_xyy) + (-M_xxx - M_xyy)*(-6300*S_xx - 1800*S_yy)) &
      + (5.0d0/21.0d0)*(-M_xxxzz - M_xyyyy - M_xyyzz + M_yyyy*x + x*( &
      -M_xxzz - M_yyzz)) + (40.0d0/21.0d0)*(M_xxx*S_xx - M_xxyy*x + &
      M_xyz*S_yz + M_yz*S_xyz - x*(-M_xxxx - M_xxyy)) + (20.0d0/21.0d0) &
      *(M_xyyy*y + M_xyyz*z + M_yyy*S_xy + M_yyz*S_xz + S_xy*(-M_xxy - &
      M_yyy) + S_xz*(-M_xxz - M_yyz) + y*(-M_xxxy - M_xyyy) + z*( &
      -M_xxxz - M_xyyz))
    S_xxxxy   = (1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y
    Ms_xxxxy  = M_0*S_xxxxy + (8.0d0/3.0d0)*M_x*S_xxxy + (20.0d0/7.0d0)*M_xx*S_xxy - &
      12.0d0/7.0d0*M_xxyy*y - 24.0d0/7.0d0*M_xyy*S_xy + (1.0d0/5670.0d0 &
      )*M_yyy*(-3780*S_xx + 2160*S_yy) - 4.0d0/3.0d0*M_z*S_xxyz - 6.0d0 &
      /7.0d0*S_xx*(-M_xxy - M_yyy) + (2.0d0/7.0d0)*y*(-M_xxyy - M_yyyy &
      ) - 16.0d0/7.0d0*(M_xyz*S_xz + M_xz*S_xyz) + (4.0d0/7.0d0)*(M_yyz &
      *S_yz - y*(-M_xxxx - M_xxyy)) + (1.0d0/1890.0d0)*(M_xxy*(5400* &
      S_xx - 2160*S_yy) + M_yy*(-3780*S_xxy + 360*S_yyy) + (-M_xx - &
      M_yy)*(-1620*S_xxy - 360*S_yyy)) + (1.0d0/945.0d0)*(M_xy*(2520* &
      S_xxx - 2160*S_xyy) + M_y*(900*S_xxxx - 1350*S_xxyy - 45*S_xxzz - &
      45*S_yyyy - 45*S_yyzz) + M_yz*(-1260*S_xxz + 360*S_yyz)) - 8.0d0/ &
      7.0d0*(M_xxyz*z + M_xxz*S_yz + M_xyyy*x + S_xy*(-M_xxx - M_xyy) + &
      x*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(32*M_xxx*S_xy + 8*M_xxxx* &
      y + 20*M_xxxxy + 32*M_xxxy*x - 2*M_xxyyy - M_xxyzz + 5*M_yyyy*y - &
      M_yyyyy + 4*M_yyyz*z - M_yyyzz + 4*S_yz*(-M_xxz - M_yyz) + y*( &
      -M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz))
    S_xxxxz   = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z
    Ms_xxxxz  = M_0*S_xxxxz + (8.0d0/3.0d0)*M_x*S_xxxz + (20.0d0/7.0d0)*M_xx*S_xxz - &
      4.0d0/3.0d0*M_y*S_xxyz - 6.0d0/7.0d0*M_yyz*S_xx - 24.0d0/7.0d0* &
      S_xz*(-M_xxx - M_xyy) - 12.0d0/7.0d0*z*(-M_xxxx - M_xxyy) + ( &
      2.0d0/7.0d0)*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*(-M_xxz - &
      M_yyz)*(-5940*S_xx - 2160*S_yy) + (4.0d0/7.0d0)*(-M_xxyy*z + S_yz &
      *(-M_xxy - M_yyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz*S_xy) + ( &
      1.0d0/1890.0d0)*(M_xxz*(7560*S_xx + 2160*S_yy) + M_yy*(-1260* &
      S_xxz + 360*S_yyz) + (-M_xx - M_yy)*(-4140*S_xxz - 360*S_yyz)) + &
      (1.0d0/945.0d0)*(M_xz*(4680*S_xxx + 2160*S_xyy) + M_yz*(-1620* &
      S_xxy - 360*S_yyy) + M_z*(1980*S_xxxx + 810*S_xxyy - 225*S_xxzz - &
      225*S_yyyy - 225*S_yyzz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + x*(-M_xxxz - M_xyyz)) + (1.0d0/21.0d0)*( &
      32*M_xxx*S_xz + 8*M_xxxx*z + 20*M_xxxxz + 32*M_xxxz*x - 2*M_xxyyz &
      - M_xxzzz + 4*M_yyy*S_yz + M_yyyy*z - M_yyyyz + 4*M_yyyz*y - &
      M_yyzzz + 4*y*(-M_xxyz - M_yyyz) + 5*z*(-M_xxzz - M_yyzz))
    S_xxxyy   = (1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x**3 &
      *y**2
    Ms_xxxyy  = M_0*S_xxxyy + (1.0d0/5670.0d0)*M_xxx*(-3510*S_xx + 3780*S_yy) - 20.0d0/ &
      63.0d0*M_xxxx*x + (82.0d0/63.0d0)*M_xxxy*y - 2.0d0/63.0d0*M_xxxz* &
      z - 2.0d0/7.0d0*M_yyyy*x - 8.0d0/7.0d0*(M_xyyy*y + M_yyy*S_xy) + &
      (1.0d0/945.0d0)*(M_x*(-255*S_xxxx + 2115*S_xxyy - 45*S_xxzz - 45* &
      S_yyyy - 45*S_yyzz) + M_xy*(4140*S_xxy - 630*S_yyy) + M_xz*(-270* &
      S_xxz - 630*S_yyz) + M_y*(1680*S_xxxy - 630*S_xyyy) + M_z*(-210* &
      S_xxxz - 630*S_xyyz)) + (1.0d0/1890.0d0)*(M_xx*(-1110*S_xxx + &
      3780*S_xyy) + M_xyy*(4140*S_xx - 2790*S_yy) + M_yy*(1680*S_xxx - &
      2790*S_xyy) + (-M_xx - M_yy)*(-570*S_xxx - 990*S_xyy) + (-M_xxx - &
      M_xyy)*(-630*S_xx - 990*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxx + 19* &
      M_xxxyy - M_xxxzz + 82*M_xxy*S_xy + 41*M_xxyy*x - 2*M_xxz*S_xz - &
      M_xyyyy - 10*M_xyyz*z - M_xyyzz - 20*M_xyz*S_yz - 10*M_yyz*S_xz - &
      20*M_yz*S_xyz - 10*S_xy*(-M_xxy - M_yyy) + 4*S_xz*(-M_xxz - M_yyz &
      ) - x*(-M_xxxx - M_xxyy) - 5*x*(-M_xxyy - M_yyyy) + x*(-M_xxzz - &
      M_yyzz) - 10*y*(-M_xxxy - M_xyyy) + 4*z*(-M_xxxz - M_xyyz))
    S_xxxyz   = -1.0d0/3.0d0*h*x*y*z + x**3*y*z
    Ms_xxxyz  = M_0*S_xxxyz + (7.0d0/3.0d0)*M_x*S_xxyz + M_xxxyz + 3*M_xyz*S_xx + (5.0d0 &
      /3.0d0)*M_yz*S_xxx + (1.0d0/945.0d0)*(M_xy*(2205*S_xxz - 630* &
      S_yyz) + M_xz*(2835*S_xxy + 630*S_yyy) + M_y*(945*S_xxxz - 630* &
      S_xyyz) + M_z*(1575*S_xxxy + 630*S_xyyy)) + 2*(M_xx*S_xyz + 3* &
      M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz*y + M_xxy*S_xz + M_xxyz*x + &
      M_xxz*S_xy) - (M_xyy*S_yz + 3*M_xyyy*z + M_xyyz*y + M_yy*S_xyz + &
      3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy))
    S_xxxzz   = -(S_xxxxx + S_xxxyy)
    S_xxyyy   = (1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x**2 &
      *y**3
    Ms_xxyyy  = M_0*S_xxyyy - 2.0d0/7.0d0*M_xxxx*y + (82.0d0/63.0d0)*M_xyyy*x + (1.0d0/ &
      5670.0d0)*M_yyy*(3780*S_xx - 3510*S_yy) - 20.0d0/63.0d0*M_yyyy*y &
      - 2.0d0/63.0d0*M_yyyz*z - 8.0d0/7.0d0*(M_xxx*S_xy + M_xxxy*x) + ( &
      1.0d0/945.0d0)*(M_x*(-630*S_xxxy + 1680*S_xyyy) + M_xy*(-630* &
      S_xxx + 4140*S_xyy) + M_y*(-45*S_xxxx + 2115*S_xxyy - 45*S_xxzz - &
      255*S_yyyy - 45*S_yyzz) + M_yz*(-630*S_xxz - 270*S_yyz) + M_z*( &
      -630*S_xxyz - 210*S_yyyz)) + (1.0d0/1890.0d0)*(M_xx*(-2790*S_xxy &
      + 1680*S_yyy) + M_xxy*(-2790*S_xx + 4140*S_yy) + M_yy*(3780*S_xxy &
      - 1110*S_yyy) + (-M_xx - M_yy)*(-990*S_xxy - 570*S_yyy) + (-M_xxy &
      - M_yyy)*(-990*S_xx - 630*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxy + 41* &
      M_xxyy*y + 19*M_xxyyy - 10*M_xxyz*z - M_xxyzz - 10*M_xxz*S_yz + &
      82*M_xyy*S_xy - 20*M_xyz*S_xz - 20*M_xz*S_xyz - M_yyyyy - M_yyyzz &
      - 2*M_yyz*S_yz - 10*S_xy*(-M_xxx - M_xyy) + 4*S_yz*(-M_xxz - &
      M_yyz) - 10*x*(-M_xxxy - M_xyyy) - 5*y*(-M_xxxx - M_xxyy) - y*( &
      -M_xxyy - M_yyyy) + y*(-M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz &
      ))
    S_xxyyz   = (1.0d0/63.0d0)*h**2*z + x**2*y**2*z - 1.0d0/9.0d0*(h*x**2*z + h*y**2*z)
    Ms_xxyyz  = M_0*S_xxyyz + (17.0d0/21.0d0)*M_xxyy*z + (61.0d0/63.0d0)*M_xxyyz + ( &
      5.0d0/63.0d0)*z*(-M_xxzz - M_yyzz) + (1.0d0/5670.0d0)*(-M_xxz - &
      M_yyz)*(-1350*S_xx - 1350*S_yy) - 2.0d0/21.0d0*(M_xxxx*z + M_yyyy &
      *z) + (68.0d0/21.0d0)*(M_xy*S_xyz + M_xyz*S_xy) - 10.0d0/21.0d0*( &
      S_xz*(-M_xxx - M_xyy) + S_yz*(-M_xxy - M_yyy)) - 5.0d0/21.0d0*(z* &
      (-M_xxxx - M_xxyy) + z*(-M_xxyy - M_yyyy)) - 8.0d0/21.0d0*(M_xxx* &
      S_xz + M_xxxz*x + M_yyy*S_yz + M_yyyz*y) + (34.0d0/21.0d0)*(M_xxy &
      *S_yz + M_xxyz*y + M_xyy*S_xz + M_xyyz*x) + (1.0d0/945.0d0)*(M_x* &
      (-210*S_xxxz + 1680*S_xyyz) + M_xz*(90*S_xxx + 1980*S_xyy) + M_y* &
      (1680*S_xxyz - 210*S_yyyz) + M_yz*(1980*S_xxy + 90*S_yyy) + M_z*( &
      135*S_xxxx + 1215*S_xxyy - 75*S_xxzz + 135*S_yyyy - 75*S_yyzz)) + &
      (1.0d0/1890.0d0)*(M_xx*(-930*S_xxz + 1680*S_yyz) + M_xxz*(-630* &
      S_xx + 1980*S_yy) + M_yy*(1680*S_xxz - 930*S_yyz) + M_yyz*(1980* &
      S_xx - 630*S_yy) + (-M_xx - M_yy)*(-750*S_xxz - 750*S_yyz)) - &
      1.0d0/63.0d0*(M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + 10*x*( &
      -M_xxxz - M_xyyz) + 10*y*(-M_xxyz - M_yyyz))
    S_xxyzz   = -(S_xxxxy + S_xxyyy)
    S_xxzzz   = -(S_xxxxz + S_xxyyz)
    S_xyyyy   = (1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4
    Ms_xyyyy  = M_0*S_xyyyy + (1.0d0/5670.0d0)*M_xxx*(2160*S_xx - 3780*S_yy) - 24.0d0/ &
      7.0d0*M_xxy*S_xy - 12.0d0/7.0d0*M_xxyy*x + (8.0d0/3.0d0)*M_y* &
      S_xyyy + (20.0d0/7.0d0)*M_yy*S_xyy - 4.0d0/3.0d0*M_z*S_xyyz - &
      6.0d0/7.0d0*S_yy*(-M_xxx - M_xyy) + (2.0d0/7.0d0)*x*(-M_xxxx - &
      M_xxyy) + (4.0d0/7.0d0)*(M_xxz*S_xz - x*(-M_xxyy - M_yyyy)) - &
      16.0d0/7.0d0*(M_xyz*S_yz + M_yz*S_xyz) + (1.0d0/945.0d0)*(M_x*( &
      -45*S_xxxx - 1350*S_xxyy - 45*S_xxzz + 900*S_yyyy - 45*S_yyzz) + &
      M_xy*(-2160*S_xxy + 2520*S_yyy) + M_xz*(360*S_xxz - 1260*S_yyz)) &
      + (1.0d0/1890.0d0)*(M_xx*(360*S_xxx - 3780*S_xyy) + M_xyy*(-2160* &
      S_xx + 5400*S_yy) + (-M_xx - M_yy)*(-360*S_xxx - 1620*S_xyy)) - &
      8.0d0/7.0d0*(M_xxxy*y + M_xyyz*z + M_yyz*S_xz + S_xy*(-M_xxy - &
      M_yyy) + y*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(5*M_xxxx*x - &
      M_xxxxx - 2*M_xxxyy + 4*M_xxxz*z - M_xxxzz + 32*M_xyyy*y + 20* &
      M_xyyyy - M_xyyzz + 32*M_yyy*S_xy + 8*M_yyyy*x + 4*S_xz*(-M_xxz - &
      M_yyz) + x*(-M_xxzz - M_yyzz) + 4*z*(-M_xxxz - M_xyyz))
    S_xyyyz   = -1.0d0/3.0d0*h*x*y*z + x*y**3*z
    Ms_xyyyz  = M_0*S_xyyyz + M_xyyyz + 3*M_xyz*S_yy + (5.0d0/3.0d0)*M_xz*S_yyy + (7.0d0 &
      /3.0d0)*M_y*S_xyyz + (1.0d0/945.0d0)*(M_x*(-630*S_xxyz + 945* &
      S_yyyz) + M_xy*(-630*S_xxz + 2205*S_yyz) + M_yz*(630*S_xxx + 2835 &
      *S_xyy) + M_z*(630*S_xxxy + 1575*S_xyyy)) + 2*(M_xyy*S_yz + 3* &
      M_xyyy*z + M_xyyz*y + M_yy*S_xyz + 3*M_yyy*S_xz + 3*M_yyyz*x + &
      M_yyz*S_xy) - (M_xx*S_xyz + 3*M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz* &
      y + M_xxy*S_xz + M_xxyz*x + M_xxz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy))
    S_xyyzz   = -(S_xxxyy + S_xyyyy)
    S_xyzzz   = -(S_xxxyz + S_xyyyz)
    S_xzzzz   = -(S_xxxzz + S_xyyzz)
    S_yyyyy   = (5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5
    Ms_yyyyy  = M_0*S_yyyyy + (1.0d0/945.0d0)*M_y*(-225*S_xxxx - 450*S_xxyy - 225*S_xxzz &
      + 2400*S_yyyy - 225*S_yyzz) + (200.0d0/63.0d0)*M_yy*S_yyy + ( &
      40.0d0/63.0d0)*M_yyyy*y + (16.0d0/21.0d0)*M_yyyyy + (10.0d0/ &
      21.0d0)*(-M_xxyyy + y*(-M_xxxx - M_xxyy)) - 20.0d0/9.0d0*(M_x* &
      S_xyyy + M_z*S_yyyz) - 100.0d0/21.0d0*(M_xy*S_xyy + M_yz*S_yyz) - &
      80.0d0/21.0d0*(M_xyy*S_xy + M_yyz*S_yz) - 80.0d0/63.0d0*(M_xyyy*x &
      + M_yyyz*z) + (1.0d0/1890.0d0)*(M_xx*(1800*S_xxy - 2100*S_yyy) + &
      M_xxy*(1800*S_xx - 4500*S_yy) + (-M_xx - M_yy)*(-1800*S_xxy - &
      3900*S_yyy) + (-M_xxy - M_yyy)*(-1800*S_xx - 6300*S_yy)) + (5.0d0 &
      /21.0d0)*(M_xxxx*y - M_xxxxy - M_xxyzz - M_yyyzz + y*(-M_xxzz - &
      M_yyzz)) + (40.0d0/21.0d0)*(-M_xxyy*y + M_xyz*S_xz + M_xz*S_xyz + &
      M_yyy*S_yy - y*(-M_xxyy - M_yyyy)) + (20.0d0/21.0d0)*(M_xxx*S_xy &
      + M_xxxy*x + M_xxyz*z + M_xxz*S_yz + S_xy*(-M_xxx - M_xyy) + S_yz &
      *(-M_xxz - M_yyz) + x*(-M_xxxy - M_xyyy) + z*(-M_xxyz - M_yyyz))
    S_yyyyz   = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z
    Ms_yyyyz  = M_0*S_yyyyz - 4.0d0/3.0d0*M_x*S_xyyz - 6.0d0/7.0d0*M_xxz*S_yy + (8.0d0/ &
      3.0d0)*M_y*S_yyyz + (20.0d0/7.0d0)*M_yy*S_yyz - 24.0d0/7.0d0*S_yz &
      *(-M_xxy - M_yyy) + (2.0d0/7.0d0)*z*(-M_xxxx - M_xxyy) - 12.0d0/ &
      7.0d0*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*(-M_xxz - M_yyz)*( &
      -2160*S_xx - 5940*S_yy) + (4.0d0/7.0d0)*(-M_xxyy*z + S_xz*(-M_xxx &
      - M_xyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz*S_xy) + (1.0d0/ &
      1890.0d0)*(M_xx*(360*S_xxz - 1260*S_yyz) + M_yyz*(2160*S_xx + &
      7560*S_yy) + (-M_xx - M_yy)*(-360*S_xxz - 4140*S_yyz)) + (1.0d0/ &
      945.0d0)*(M_xz*(-360*S_xxx - 1620*S_xyy) + M_yz*(2160*S_xxy + &
      4680*S_yyy) + M_z*(-225*S_xxxx + 810*S_xxyy - 225*S_xxzz + 1980* &
      S_yyyy - 225*S_yyzz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + y*(-M_xxyz - M_yyyz)) + (1.0d0/21.0d0)*(4 &
      *M_xxx*S_xz + M_xxxx*z - M_xxxxz + 4*M_xxxz*x - 2*M_xxyyz - &
      M_xxzzz + 32*M_yyy*S_yz + 8*M_yyyy*z + 20*M_yyyyz + 32*M_yyyz*y - &
      M_yyzzz + 4*x*(-M_xxxz - M_xyyz) + 5*z*(-M_xxzz - M_yyzz))
    S_yyyzz   = -(S_xxyyy + S_yyyyy)
    S_yyzzz   = -(S_xxyyz + S_yyyyz)
    S_yzzzz   = -(S_xxyzz + S_yyyzz)
    S_zzzzz   = -(S_xxzzz + S_yyzzz)
    S_xxxxxx  = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*x**2 - 15.0d0/11.0d0*h*x**4 + &
      x**6
    Ms_xxxxxx = M_0*S_xxxxxx + (800.0d0/231.0d0)*M_xxx*S_xxx + (32.0d0/77.0d0)*M_xxxxx*x &
      + (136.0d0/231.0d0)*M_xxxxxx - 30.0d0/77.0d0*M_xxxxzz + (480.0d0/ &
      77.0d0)*M_xyz*S_xyz + (10.0d0/231.0d0)*M_yyyyyy + (5.0d0/77.0d0)* &
      M_yyyyzz + (40.0d0/11.0d0)*M_yz*S_xxyz + (90.0d0/77.0d0)*S_xx*( &
      -M_xxyy - M_yyyy) - 25.0d0/77.0d0*(M_xxyyyy + M_xxyyzz) + (5.0d0/ &
      231.0d0)*(M_xxzzzz + M_yyzzzz) - 80.0d0/77.0d0*(M_xxxxy*y + &
      M_xxxxz*z) - 320.0d0/77.0d0*(M_xxxy*S_xy + M_xxxz*S_xz) - 160.0d0 &
      /77.0d0*(M_xxxyy*x + x*(-M_xxxxx - M_xxxyy)) - 600.0d0/77.0d0*( &
      M_xxy*S_xxy + M_xxz*S_xxz) + (1.0d0/41580.0d0)*(M_xxyy*(-162000* &
      S_xx + 64800*S_yy) + (-M_xxxx - M_xxyy)*(-226800*S_xx - 64800* &
      S_yy)) - 80.0d0/11.0d0*(M_xy*S_xxxy + M_xz*S_xxxz) + (1.0d0/ &
      62370.0d0)*(M_yyy*(113400*S_xxy - 10800*S_yyy) + (-M_xxz - M_yyz) &
      *(124200*S_xxz + 10800*S_yyz)) + (1.0d0/249480.0d0)*(M_yyyy*( &
      113400*S_xx - 64800*S_yy) + (-M_xxzz - M_yyzz)*(178200*S_xx + &
      64800*S_yy)) - 40.0d0/77.0d0*(M_yyyz*S_yz + S_yz*(-M_xxyz - &
      M_yyyz)) - 20.0d0/77.0d0*(y*(-M_xxyyy - M_yyyyy) + z*(-M_xxyyz - &
      M_yyyyz)) + (60.0d0/77.0d0)*(-M_xxxxyy + M_xyyyy*x + x*(-M_xxxzz &
      - M_xyyzz)) + (1.0d0/10395.0d0)*(M_x*(25920*S_xxxxx - 16200* &
      S_xxxyy - 8100*S_xxxzz - 8100*S_xyyyy - 8100*S_xyyzz) + M_y*( &
      -27000*S_xxxxy + 2700*S_xxyyy + 1350*S_xxyzz + 1350*S_yyyyy + &
      1350*S_yyyzz) + M_z*(-27000*S_xxxxz + 2700*S_xxyyz + 1350*S_xxzzz &
      + 1350*S_yyyyz + 1350*S_yyzzz)) - 10.0d0/77.0d0*(M_yyyyy*y + &
      M_yyyyz*z + y*(-M_xxyzz - M_yyyzz) + z*(-M_xxzzz - M_yyzzz)) + ( &
      240.0d0/77.0d0)*(M_xxyz*S_yz + M_xyyy*S_xy + M_xyyz*S_xz + S_xy*( &
      -M_xxxy - M_xyyy) + S_xz*(-M_xxxz - M_xyyz)) + (120.0d0/77.0d0)*( &
      M_xxxx*S_xx + M_xxyyy*y + M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y* &
      (-M_xxxxy - M_xxyyy) + z*(-M_xxxxz - M_xxyyz)) + (1.0d0/20790.0d0 &
      )*(M_xx*(86400*S_xxxx - 16200*S_xxyy - 8100*S_xxzz - 8100*S_yyyy &
      - 8100*S_yyzz) + M_xyy*(-75600*S_xxx + 64800*S_xyy) + M_yy*( &
      -27000*S_xxxx + 40500*S_xxyy + 1350*S_xxzz + 1350*S_yyyy + 1350* &
      S_yyzz) + M_yyz*(37800*S_xxz - 10800*S_yyz) + (-M_xx - M_yy)*( &
      -59400*S_xxxx - 24300*S_xxyy + 6750*S_xxzz + 6750*S_yyyy + 6750* &
      S_yyzz) + (-M_xxx - M_xyy)*(-140400*S_xxx - 64800*S_xyy) + ( &
      -M_xxy - M_yyy)*(48600*S_xxy + 10800*S_yyy))
    S_xxxxxy  = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x**3*y + x**5*y
    Ms_xxxxxy = M_0*S_xxxxxy + (100.0d0/33.0d0)*M_xxx*S_xxy + (8.0d0/33.0d0)*M_xxxxx*y + &
      (28.0d0/33.0d0)*M_xxxxxy - 60.0d0/11.0d0*M_xxyy*S_xy - 30.0d0/ &
      11.0d0*S_xx*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_xxx*(-M_xxy - &
      M_yyy) + (10.0d0/33.0d0)*(-M_xxxyyy + x*(-M_xxyyy - M_yyyyy)) + ( &
      140.0d0/33.0d0)*(M_xx*S_xxxy - M_xz*S_xxyz) - 40.0d0/11.0d0*( &
      M_xxyz*S_xz + M_xxz*S_xyz) + (25.0d0/33.0d0)*(M_xyyyy*y + M_yyyy* &
      S_xy) + (10.0d0/11.0d0)*(S_xy*(-M_xxyy - M_yyyy) + y*(-M_xxxyy - &
      M_xyyyy)) + (1.0d0/62370.0d0)*(M_xxxy*(189000*S_xx - 75600*S_yy) &
      + M_xyyy*(-132300*S_xx + 75600*S_yy) + M_yyy*(-56700*S_xxx + &
      75600*S_xyy)) + (40.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x - &
      M_xxxyz*z - M_xxxz*S_yz) + (1.0d0/10395.0d0)*(M_x*(31500*S_xxxxy &
      - 3150*S_xxyyy - 1575*S_xxyzz - 1575*S_yyyyy - 1575*S_yyyzz) + &
      M_xy*(31500*S_xxxx - 47250*S_xxyy - 1575*S_xxzz - 1575*S_yyyy - &
      1575*S_yyzz) + M_xyz*(-44100*S_xxz + 12600*S_yyz) + M_y*(8820* &
      S_xxxxx - 22050*S_xxxyy - 1575*S_xxxzz - 1575*S_xyyyy - 1575* &
      S_xyyzz) + M_yz*(-18900*S_xxxz + 12600*S_xyyz)) + (1.0d0/ &
      20790.0d0)*(M_xxy*(88200*S_xxx - 75600*S_xyy) + M_xyy*(-132300* &
      S_xxy + 12600*S_yyy) + M_yy*(-56700*S_xxxy + 12600*S_xyyy) + ( &
      -M_xx - M_yy)*(-31500*S_xxxy - 12600*S_xyyy) + (-M_xxx - M_xyy)*( &
      -56700*S_xxy - 12600*S_yyy)) + (5.0d0/33.0d0)*(-M_xxxyzz - &
      M_xyyyyy - M_xyyyzz + M_yyyyy*x + S_xy*(-M_xxzz - M_yyzz) + x*( &
      -M_xxyzz - M_yyyzz) + y*(-M_xxxzz - M_xyyzz)) + (20.0d0/11.0d0)*( &
      -M_xxxyy*y - M_xxyyy*x + M_xyyz*S_yz + M_yyz*S_xyz - M_z*S_xxxyz &
      - S_xy*(-M_xxxx - M_xxyy) - x*(-M_xxxxy - M_xxyyy)) + (20.0d0/ &
      33.0d0)*(M_xyyyz*z + M_yyyz*S_xz + S_xyz*(-M_xxz - M_yyz) + S_xz* &
      (-M_xxyz - M_yyyz) + S_yz*(-M_xxxz - M_xyyz) - y*(-M_xxxxx - &
      M_xxxyy) + z*(-M_xxxyz - M_xyyyz))
    S_xxxxxz  = (5.0d0/33.0d0)*h**2*x*z - 10.0d0/11.0d0*h*x**3*z + x**5*z
    Ms_xxxxxz = M_0*S_xxxxxz + (100.0d0/33.0d0)*M_xxx*S_xxz + (8.0d0/33.0d0)*M_xxxxx*z + &
      (28.0d0/33.0d0)*M_xxxxxz - 30.0d0/11.0d0*M_xyyz*S_xx - 50.0d0/ &
      33.0d0*M_yyz*S_xxx - 60.0d0/11.0d0*S_xz*(-M_xxxx - M_xxyy) + ( &
      10.0d0/33.0d0)*(-M_xxxyyz + x*(-M_xxyyz - M_yyyyz)) + (140.0d0/ &
      33.0d0)*(M_xx*S_xxxz - M_xy*S_xxyz) - 40.0d0/11.0d0*(M_xxy*S_xyz &
      + M_xxyz*S_xy) + (10.0d0/11.0d0)*(S_xz*(-M_xxyy - M_yyyy) + z*( &
      -M_xxxyy - M_xyyyy)) + (25.0d0/33.0d0)*(S_xz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxxzz - M_xyyzz)) + (1.0d0/62370.0d0)*(M_xxxz*(264600*S_xx &
      + 75600*S_yy) + (-M_xxxz - M_xyyz)*(-207900*S_xx - 75600*S_yy) + &
      (-M_xxz - M_yyz)*(-132300*S_xxx - 75600*S_xyy)) + (40.0d0/33.0d0) &
      *(M_xxxx*S_xz + M_xxxxz*x - M_xxxy*S_yz - M_xxxyz*y) + (1.0d0/ &
      10395.0d0)*(M_x*(31500*S_xxxxz - 3150*S_xxyyz - 1575*S_xxzzz - &
      1575*S_yyyyz - 1575*S_yyzzz) + M_xyz*(-56700*S_xxy - 12600*S_yyy &
      ) + M_xz*(69300*S_xxxx + 28350*S_xxyy - 7875*S_xxzz - 7875*S_yyyy &
      - 7875*S_yyzz) + M_yz*(-31500*S_xxxy - 12600*S_xyyy) + M_z*(21420 &
      *S_xxxxx + 3150*S_xxxyy - 7875*S_xxxzz - 7875*S_xyyyy - 7875* &
      S_xyyzz)) + (1.0d0/20790.0d0)*(M_xxz*(163800*S_xxx + 75600*S_xyy &
      ) + M_xyy*(-44100*S_xxz + 12600*S_yyz) + M_yy*(-18900*S_xxxz + &
      12600*S_xyyz) + (-M_xx - M_yy)*(-69300*S_xxxz - 12600*S_xyyz) + ( &
      -M_xxx - M_xyy)*(-144900*S_xxz - 12600*S_yyz)) + (5.0d0/33.0d0)*( &
      -M_xxxzzz + M_xyyyy*z - M_xyyyyz - M_xyyzzz + M_yyyy*S_xz + &
      M_yyyyz*x + x*(-M_xxzzz - M_yyzzz)) + (20.0d0/33.0d0)*(-M_xxxyy*z &
      + M_xyyy*S_yz + M_xyyyz*y + M_yyy*S_xyz + M_yyyz*S_xy + S_xy*( &
      -M_xxyz - M_yyyz) + y*(-M_xxxyz - M_xyyyz)) + (20.0d0/11.0d0)*( &
      -M_xxyy*S_xz - M_xxyyz*x - M_y*S_xxxyz + S_xyz*(-M_xxy - M_yyy) + &
      S_yz*(-M_xxxy - M_xyyy) - x*(-M_xxxxz - M_xxyyz) - z*(-M_xxxxx - &
      M_xxxyy))
    S_xxxxyy  = -1.0d0/231.0d0*h**3 + x**4*y**2 - 1.0d0/11.0d0*(h*x**4 + 6*h*x**2*y**2) &
      + (1.0d0/33.0d0)*(2*h**2*x**2 + h**2*y**2)
    Ms_xxxxyy = M_0*S_xxxxyy - 16.0d0/77.0d0*M_xxxxx*x - 4.0d0/77.0d0*M_xxxxxx - 5.0d0/ &
      77.0d0*M_xxyyzz - 240.0d0/77.0d0*M_xyz*S_xyz + (12.0d0/77.0d0)* &
      M_yyyyy*y - 2.0d0/77.0d0*z*(-M_xxzzz - M_yyzzz) - 1.0d0/21.0d0*( &
      M_xxxxzz + 2*M_xxyyyy) + (2.0d0/21.0d0)*(M_yyyyz*z + x*(-M_xxxzz &
      - M_xyyzz)) + (8.0d0/21.0d0)*(M_yyyz*S_yz + S_xz*(-M_xxxz - &
      M_xyyz)) + (4.0d0/21.0d0)*(y*(-M_xxyyy - M_yyyyy) + z*(-M_xxxxz - &
      M_xxyyz)) + (1.0d0/62370.0d0)*(M_xxx*(-47520*S_xxx + 120960*S_xyy &
      ) + M_yyy*(-120960*S_xxy + 20520*S_yyy) + (-M_xxz - M_yyz)*(17280 &
      *S_xxz + 9720*S_yyz)) + (1.0d0/249480.0d0)*(M_xxxx*(-133920*S_xx &
      + 120960*S_yy) + M_yyyy*(-120960*S_xx + 85320*S_yy) + (-M_xxzz - &
      M_yyzz)*(28080*S_xx + 20520*S_yy)) + (1.0d0/41580.0d0)*(M_xxyy*( &
      141480*S_xx - 92880*S_yy) + (-M_xxxx - M_xxyy)*(-7560*S_xx - &
      28080*S_yy) + (-M_xxyy - M_yyyy)*(-20520*S_xx + 7560*S_yy)) - &
      60.0d0/77.0d0*(M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y*(-M_xxxxy - &
      M_xxyyy)) - 120.0d0/77.0d0*(M_xxyz*S_yz + M_xyyz*S_xz + S_xy*( &
      -M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_x*(-2880*S_xxxxx + &
      28260*S_xxxyy - 990*S_xxxzz - 990*S_xyyyy - 990*S_xyyzz) + M_xy*( &
      57960*S_xxxy - 20160*S_xyyy) + M_xz*(-2520*S_xxxz - 20160*S_xyyz &
      ) + M_y*(18540*S_xxxxy - 12060*S_xxyyy - 360*S_xxyzz - 360* &
      S_yyyyy - 360*S_yyyzz) + M_yz*(-17640*S_xxyz + 2520*S_yyyz) + M_z &
      *(-1620*S_xxxxz - 10800*S_xxyyz + 270*S_xxzzz + 270*S_yyyyz + 270 &
      *S_yyzzz)) + (1.0d0/20790.0d0)*(M_xx*(-12960*S_xxxx + 68580* &
      S_xxyy - 990*S_xxzz - 990*S_yyyy - 990*S_yyzz) + M_xxy*(141480* &
      S_xxy - 20160*S_yyy) + M_xxz*(360*S_xxz - 20160*S_yyz) + M_xyy*( &
      57960*S_xxx - 92880*S_xyy) + M_yy*(18540*S_xxxx - 52380*S_xxyy - &
      360*S_xxzz + 2160*S_yyyy - 360*S_yyzz) + M_yyz*(-17640*S_xxz + &
      10440*S_yyz) + (-M_xx - M_yy)*(-5580*S_xxxx - 16200*S_xxyy + 1350 &
      *S_xxzz - 1170*S_yyyy + 1350*S_yyzz) + (-M_xxx - M_xyy)*(-10440* &
      S_xxx - 28080*S_xyy) + (-M_xxy - M_yyy)*(-20520*S_xxy - 360*S_yyy &
      )) + (1.0d0/231.0d0)*(232*M_xxxxy*y + 202*M_xxxxyy + 8*M_xxxxz*z &
      + 928*M_xxxy*S_xy + 464*M_xxxyy*x + 32*M_xxxz*S_xz - 404*M_xxyyy* &
      y + M_xxzzzz - 808*M_xyyy*S_xy - 202*M_xyyyy*x - 5*M_yyyyyy - 4* &
      M_yyyyzz + M_yyzzzz + 32*S_yz*(-M_xxyz - M_yyyz) + 16*x*(-M_xxxxx &
      - M_xxxyy) + 8*y*(-M_xxyzz - M_yyyzz) + 16*z*(-M_xxyyz - M_yyyyz &
      ))
    S_xxxxyz  = (1.0d0/33.0d0)*h**2*y*z - 6.0d0/11.0d0*h*x**2*y*z + x**4*y*z
    Ms_xxxxyz = M_0*S_xxxxyz + (48.0d0/11.0d0)*M_xxyz*S_xx + (6.0d0/11.0d0)*S_yz*( &
      -M_xxyy - M_yyyy) + (2.0d0/11.0d0)*(y*(-M_xxyyz - M_yyyyz) + z*( &
      -M_xxyyy - M_yyyyy)) - 16.0d0/11.0d0*(M_xxyy*S_yz + M_xxyyz*y + &
      S_yz*(-M_xxxx - M_xxyy) + z*(-M_xxxxy - M_xxyyy)) + (1.0d0/ &
      62370.0d0)*(M_yyy*(-34020*S_xxz + 15120*S_yyz) + M_yyyz*(-41580* &
      S_xx + 7560*S_yy) + (-M_xxyz - M_yyyz)*(-49140*S_xx - 7560*S_yy) &
      + (-M_xxz - M_yyz)*(-49140*S_xxy - 15120*S_yyy)) + (32.0d0/11.0d0 &
      )*(M_x*S_xxxyz - M_xyy*S_xyz - M_xyyz*S_xy - S_xyz*(-M_xxx - &
      M_xyy) - S_xz*(-M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_xy*( &
      30240*S_xxxz - 20160*S_xyyz) + M_xz*(50400*S_xxxy + 20160*S_xyyy &
      ) + M_y*(10080*S_xxxxz - 11970*S_xxyyz - 315*S_xxzzz - 315* &
      S_yyyyz - 315*S_yyzzz) + M_yz*(20160*S_xxxx - 5670*S_xxyy - 1575* &
      S_xxzz - 4095*S_yyyy - 1575*S_yyzz) + M_z*(20160*S_xxxxy + 8190* &
      S_xxyyy - 1575*S_xxyzz - 1575*S_yyyyy - 1575*S_yyyzz)) + (1.0d0/ &
      20790.0d0)*(M_xxy*(70560*S_xxz - 20160*S_yyz) + M_xxz*(90720* &
      S_xxy + 20160*S_yyy) + M_yy*(-34020*S_xxyz + 2520*S_yyyz) + M_yyz &
      *(-41580*S_xxy - 5040*S_yyy) + (-M_xx - M_yy)*(-36540*S_xxyz - &
      2520*S_yyyz) + (-M_xxy - M_yyy)*(-36540*S_xxz + 5040*S_yyz)) + ( &
      1.0d0/33.0d0)*(112*M_xx*S_xxyz + 64*M_xxx*S_xyz + 16*M_xxxx*S_yz &
      + 16*M_xxxxy*z + 32*M_xxxxyz + 16*M_xxxxz*y + 64*M_xxxy*S_xz + 64 &
      *M_xxxyz*x + 64*M_xxxz*S_xy - 16*M_xxyyy*z - 2*M_xxyyyz - &
      M_xxyzzz - 32*M_xyyy*S_xz - 32*M_xyyyz*x + 160*M_xyz*S_xxx + 5* &
      M_yyyy*S_yz + M_yyyyy*z - M_yyyyyz + 5*M_yyyyz*y - M_yyyzzz - 32* &
      S_xy*(-M_xxxz - M_xyyz) + 5*S_yz*(-M_xxzz - M_yyzz) - 32*x*( &
      -M_xxxyz - M_xyyyz) - 16*y*(-M_xxxxz - M_xxyyz) + y*(-M_xxzzz - &
      M_yyzzz) + 5*z*(-M_xxyzz - M_yyyzz))
    S_xxxyyy  = x**3*y**3 + (1.0d0/11.0d0)*(h**2*x*y - 3*h*x**3*y - 3*h*x*y**3)
    Ms_xxxyyy = M_0*S_xxxyyy + (1.0d0/62370.0d0)*(M_xxx*(-107730*S_xxy + 45360*S_yyy) + &
      M_xxxy*(-107730*S_xx + 124740*S_yy) + M_xyyy*(124740*S_xx - &
      107730*S_yy) + M_yyy*(45360*S_xxx - 107730*S_xyy)) + (1.0d0/ &
      10395.0d0)*(M_x*(-6615*S_xxxxy + 23625*S_xxyyy - 945*S_xxyzz - &
      945*S_yyyyy - 945*S_yyyzz) + M_xy*(-6615*S_xxxx + 65205*S_xxyy - &
      945*S_xxzz - 6615*S_yyyy - 945*S_yyzz) + M_xyz*(-9450*S_xxz - &
      9450*S_yyz) + M_xz*(-9450*S_xxyz - 5670*S_yyyz) + M_y*(-945* &
      S_xxxxx + 23625*S_xxxyy - 945*S_xxxzz - 6615*S_xyyyy - 945* &
      S_xyyzz) + M_yz*(-5670*S_xxxz - 9450*S_xyyz) + M_z*(-5670*S_xxxyz &
      - 5670*S_xyyyz)) + (1.0d0/20790.0d0)*(M_xx*(-32130*S_xxxy + 45360 &
      *S_xyyy) + M_xxy*(-32130*S_xxx + 124740*S_xyy) + M_xyy*(124740* &
      S_xxy - 32130*S_yyy) + M_yy*(45360*S_xxxy - 32130*S_xyyy) + ( &
      -M_xx - M_yy)*(-13230*S_xxxy - 13230*S_xyyy) + (-M_xxx - M_xyy)*( &
      -17010*S_xxy - 13230*S_yyy) + (-M_xxxy - M_xyyy)*(-17010*S_xx - &
      17010*S_yy) + (-M_xxy - M_yyy)*(-13230*S_xxx - 17010*S_xyy)) + ( &
      1.0d0/11.0d0)*(-10*M_xxxx*S_xy - 2*M_xxxxx*y - M_xxxxxy - 10* &
      M_xxxxy*x + 21*M_xxxyy*y + 9*M_xxxyyy - 2*M_xxxyz*z - M_xxxyzz - &
      2*M_xxxz*S_yz + 63*M_xxyy*S_xy + 21*M_xxyyy*x - 6*M_xxyz*S_xz - 6 &
      *M_xxz*S_xyz - 10*M_xyyyy*y - M_xyyyyy - 2*M_xyyyz*z - M_xyyyzz - &
      6*M_xyyz*S_yz - 10*M_yyyy*S_xy - 2*M_yyyyy*x - 2*M_yyyz*S_xz - 6* &
      M_yyz*S_xyz - 3*S_xy*(-M_xxxx - M_xxyy) - 3*S_xy*(-M_xxyy - &
      M_yyyy) + S_xy*(-M_xxzz - M_yyzz) + 4*S_xyz*(-M_xxz - M_yyz) + 4* &
      S_xz*(-M_xxyz - M_yyyz) + 4*S_yz*(-M_xxxz - M_xyyz) - 3*x*( &
      -M_xxxxy - M_xxyyy) - x*(-M_xxyyy - M_yyyyy) + x*(-M_xxyzz - &
      M_yyyzz) - y*(-M_xxxxx - M_xxxyy) - 3*y*(-M_xxxyy - M_xyyyy) + y* &
      (-M_xxxzz - M_xyyzz) + 4*z*(-M_xxxyz - M_xyyyz))
    S_xxxyyz  = (1.0d0/33.0d0)*h**2*x*z + x**3*y**2*z - 1.0d0/11.0d0*(h*x**3*z + 3*h*x*y &
      **2*z)
    Ms_xxxyyz = M_0*S_xxxyyz + (46.0d0/11.0d0)*(M_xxy*S_xyz + M_xxyz*S_xy) + (23.0d0/ &
      11.0d0)*(M_xxyy*S_xz + M_xxyyz*x) + (1.0d0/62370.0d0)*(M_xxx*( &
      -35910*S_xxz + 45360*S_yyz) + M_xxxz*(-32130*S_xx + 49140*S_yy) + &
      (-M_xxxz - M_xyyz)*(-24570*S_xx - 32130*S_yy) + (-M_xxz - M_yyz)* &
      (-20790*S_xxx - 32130*S_xyy)) + (1.0d0/10395.0d0)*(M_x*(-2205* &
      S_xxxxz + 24885*S_xxyyz - 315*S_xxzzz - 315*S_yyyyz - 315*S_yyzzz &
      ) + M_xy*(47880*S_xxyz - 5670*S_yyyz) + M_xyz*(56700*S_xxy + 3150 &
      *S_yyy) + M_xz*(-315*S_xxxx + 31185*S_xxyy - 1575*S_xxzz + 4095* &
      S_yyyy - 1575*S_yyzz) + M_y*(18900*S_xxxyz - 5670*S_xyyyz) + M_yz &
      *(27720*S_xxxy + 3150*S_xyyy) + M_z*(315*S_xxxxx + 14805*S_xxxyy &
      - 1575*S_xxxzz + 4095*S_xyyyy - 1575*S_xyyzz)) - 1.0d0/11.0d0*(14 &
      *S_xyz*(-M_xxy - M_yyy) + 3*S_xz*(-M_xxxx - M_xxyy) + 7*S_xz*( &
      -M_xxyy - M_yyyy) + 14*S_yz*(-M_xxxy - M_xyyy) + x*(-M_xxxxz - &
      M_xxyyz) + z*(-M_xxxxx - M_xxxyy) + 7*z*(-M_xxxyy - M_xyyyy)) + ( &
      1.0d0/20790.0d0)*(M_xx*(-10710*S_xxxz + 45360*S_xyyz) + M_xxz*( &
      -6930*S_xxx + 49140*S_xyy) + M_xyy*(47880*S_xxz - 25830*S_yyz) + &
      M_xyyz*(56700*S_xx - 17010*S_yy) + M_yy*(18900*S_xxxz - 25830* &
      S_xyyz) + M_yyz*(27720*S_xxx - 17010*S_xyy) + (-M_xx - M_yy)*( &
      -8190*S_xxxz - 19530*S_xyyz) + (-M_xxx - M_xyy)*(-11970*S_xxz - &
      19530*S_yyz)) + (1.0d0/33.0d0)*(-10*M_xxxx*S_xz - 2*M_xxxxx*z - &
      M_xxxxxz - 10*M_xxxxz*x + 46*M_xxxy*S_yz + 23*M_xxxyy*z + 31* &
      M_xxxyyz + 46*M_xxxyz*y - M_xxxzzz - 32*M_xyyy*S_yz - 8*M_xyyyy*z &
      - M_xyyyyz - 32*M_xyyyz*y - M_xyyzzz - 32*M_yyy*S_xyz - 8*M_yyyy* &
      S_xz - 8*M_yyyyz*x - 32*M_yyyz*S_xy - 14*S_xy*(-M_xxyz - M_yyyz) &
      + 5*S_xz*(-M_xxzz - M_yyzz) - 7*x*(-M_xxyyz - M_yyyyz) + x*( &
      -M_xxzzz - M_yyzzz) - 14*y*(-M_xxxyz - M_xyyyz) + 5*z*(-M_xxxzz - &
      M_xyyzz))
    S_xxyyyy  = -1.0d0/231.0d0*h**3 + x**2*y**4 + (1.0d0/33.0d0)*(h**2*x**2 + 2*h**2*y** &
      2) - 1.0d0/11.0d0*(6*h*x**2*y**2 + h*y**4)
    Ms_xxyyyy = M_0*S_xxyyyy + (12.0d0/77.0d0)*M_xxxxx*x - 5.0d0/77.0d0*M_xxyyzz - &
      240.0d0/77.0d0*M_xyz*S_xyz - 16.0d0/77.0d0*M_yyyyy*y - 4.0d0/ &
      77.0d0*M_yyyyyy - 2.0d0/77.0d0*z*(-M_xxzzz - M_yyzzz) - 1.0d0/ &
      21.0d0*(2*M_xxxxyy + M_yyyyzz) + (2.0d0/21.0d0)*(M_xxxxz*z + y*( &
      -M_xxyzz - M_yyyzz)) + (8.0d0/21.0d0)*(M_xxxz*S_xz + S_yz*( &
      -M_xxyz - M_yyyz)) + (4.0d0/21.0d0)*(x*(-M_xxxxx - M_xxxyy) + z*( &
      -M_xxyyz - M_yyyyz)) + (1.0d0/62370.0d0)*(M_xxx*(20520*S_xxx - &
      120960*S_xyy) + M_yyy*(120960*S_xxy - 47520*S_yyy) + (-M_xxz - &
      M_yyz)*(9720*S_xxz + 17280*S_yyz)) + (1.0d0/249480.0d0)*(M_xxxx*( &
      85320*S_xx - 120960*S_yy) + M_yyyy*(120960*S_xx - 133920*S_yy) + &
      (-M_xxzz - M_yyzz)*(20520*S_xx + 28080*S_yy)) + (1.0d0/41580.0d0) &
      *(M_xxyy*(-92880*S_xx + 141480*S_yy) + (-M_xxxx - M_xxyy)*(7560* &
      S_xx - 20520*S_yy) + (-M_xxyy - M_yyyy)*(-28080*S_xx - 7560*S_yy &
      )) - 60.0d0/77.0d0*(M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y*( &
      -M_xxxxy - M_xxyyy)) - 120.0d0/77.0d0*(M_xxyz*S_yz + M_xyyz*S_xz &
      + S_xy*(-M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_x*(-360*S_xxxxx &
      - 12060*S_xxxyy - 360*S_xxxzz + 18540*S_xyyyy - 360*S_xyyzz) + &
      M_xy*(-20160*S_xxxy + 57960*S_xyyy) + M_xz*(2520*S_xxxz - 17640* &
      S_xyyz) + M_y*(-990*S_xxxxy + 28260*S_xxyyy - 990*S_xxyzz - 2880* &
      S_yyyyy - 990*S_yyyzz) + M_yz*(-20160*S_xxyz - 2520*S_yyyz) + M_z &
      *(270*S_xxxxz - 10800*S_xxyyz + 270*S_xxzzz - 1620*S_yyyyz + 270* &
      S_yyzzz)) + (1.0d0/20790.0d0)*(M_xx*(2160*S_xxxx - 52380*S_xxyy - &
      360*S_xxzz + 18540*S_yyyy - 360*S_yyzz) + M_xxy*(-92880*S_xxy + &
      57960*S_yyy) + M_xxz*(10440*S_xxz - 17640*S_yyz) + M_xyy*(-20160* &
      S_xxx + 141480*S_xyy) + M_yy*(-990*S_xxxx + 68580*S_xxyy - 990* &
      S_xxzz - 12960*S_yyyy - 990*S_yyzz) + M_yyz*(-20160*S_xxz + 360* &
      S_yyz) + (-M_xx - M_yy)*(-1170*S_xxxx - 16200*S_xxyy + 1350* &
      S_xxzz - 5580*S_yyyy + 1350*S_yyzz) + (-M_xxx - M_xyy)*(-360* &
      S_xxx - 20520*S_xyy) + (-M_xxy - M_yyy)*(-28080*S_xxy - 10440* &
      S_yyy)) + (1.0d0/231.0d0)*(-5*M_xxxxxx - 202*M_xxxxy*y - 4* &
      M_xxxxzz - 808*M_xxxy*S_xy - 404*M_xxxyy*x + 464*M_xxyyy*y + 202* &
      M_xxyyyy + M_xxzzzz + 928*M_xyyy*S_xy + 232*M_xyyyy*x + 8*M_yyyyz &
      *z + 32*M_yyyz*S_yz + M_yyzzzz + 32*S_xz*(-M_xxxz - M_xyyz) + 8*x &
      *(-M_xxxzz - M_xyyzz) + 16*y*(-M_xxyyy - M_yyyyy) + 16*z*( &
      -M_xxxxz - M_xxyyz))
    S_xxyyyz  = (1.0d0/33.0d0)*h**2*y*z + x**2*y**3*z - 1.0d0/11.0d0*(3*h*x**2*y*z + h*y &
      **3*z)
    Ms_xxyyyz = M_0*S_xxyyyz + (23.0d0/11.0d0)*(M_xxyy*S_yz + M_xxyyz*y) + (46.0d0/ &
      11.0d0)*(M_xyy*S_xyz + M_xyyz*S_xy) + (1.0d0/62370.0d0)*(M_yyy*( &
      45360*S_xxz - 35910*S_yyz) + M_yyyz*(49140*S_xx - 32130*S_yy) + ( &
      -M_xxyz - M_yyyz)*(-32130*S_xx - 24570*S_yy) + (-M_xxz - M_yyz)*( &
      -32130*S_xxy - 20790*S_yyy)) + (1.0d0/10395.0d0)*(M_x*(-5670* &
      S_xxxyz + 18900*S_xyyyz) + M_xy*(-5670*S_xxxz + 47880*S_xyyz) + &
      M_xyz*(3150*S_xxx + 56700*S_xyy) + M_xz*(3150*S_xxxy + 27720* &
      S_xyyy) + M_y*(-315*S_xxxxz + 24885*S_xxyyz - 315*S_xxzzz - 2205* &
      S_yyyyz - 315*S_yyzzz) + M_yz*(4095*S_xxxx + 31185*S_xxyy - 1575* &
      S_xxzz - 315*S_yyyy - 1575*S_yyzz) + M_z*(4095*S_xxxxy + 14805* &
      S_xxyyy - 1575*S_xxyzz + 315*S_yyyyy - 1575*S_yyyzz)) - 1.0d0/ &
      11.0d0*(14*S_xyz*(-M_xxx - M_xyy) + 14*S_xz*(-M_xxxy - M_xyyy) + &
      7*S_yz*(-M_xxxx - M_xxyy) + 3*S_yz*(-M_xxyy - M_yyyy) + y*( &
      -M_xxyyz - M_yyyyz) + 7*z*(-M_xxxxy - M_xxyyy) + z*(-M_xxyyy - &
      M_yyyyy)) + (1.0d0/20790.0d0)*(M_xx*(-25830*S_xxyz + 18900*S_yyyz &
      ) + M_xxy*(-25830*S_xxz + 47880*S_yyz) + M_xxyz*(-17010*S_xx + &
      56700*S_yy) + M_xxz*(-17010*S_xxy + 27720*S_yyy) + M_yy*(45360* &
      S_xxyz - 10710*S_yyyz) + M_yyz*(49140*S_xxy - 6930*S_yyy) + ( &
      -M_xx - M_yy)*(-19530*S_xxyz - 8190*S_yyyz) + (-M_xxy - M_yyy)*( &
      -19530*S_xxz - 11970*S_yyz)) + (1.0d0/33.0d0)*(-32*M_xxx*S_xyz - &
      8*M_xxxx*S_yz - 8*M_xxxxy*z - M_xxxxyz - 8*M_xxxxz*y - 32*M_xxxy* &
      S_xz - 32*M_xxxyz*x - 32*M_xxxz*S_xy + 23*M_xxyyy*z + 31*M_xxyyyz &
      - M_xxyzzz + 46*M_xyyy*S_xz + 46*M_xyyyz*x - 10*M_yyyy*S_yz - 2* &
      M_yyyyy*z - M_yyyyyz - 10*M_yyyyz*y - M_yyyzzz - 14*S_xy*(-M_xxxz &
      - M_xyyz) + 5*S_yz*(-M_xxzz - M_yyzz) - 14*x*(-M_xxxyz - M_xyyyz &
      ) - 7*y*(-M_xxxxz - M_xxyyz) + y*(-M_xxzzz - M_yyzzz) + 5*z*( &
      -M_xxyzz - M_yyyzz))
    S_xyyyyy  = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x*y**3 + x*y**5
    Ms_xyyyyy = M_0*S_xyyyyy - 60.0d0/11.0d0*M_xxyy*S_xy + (28.0d0/33.0d0)*M_xyyyyy + ( &
      100.0d0/33.0d0)*M_yyy*S_xyy + (8.0d0/33.0d0)*M_yyyyy*x - 30.0d0/ &
      11.0d0*S_yy*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_yyy*(-M_xxx - &
      M_xyy) + (10.0d0/33.0d0)*(-M_xxxyyy + y*(-M_xxxxx - M_xxxyy)) + ( &
      25.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x) - 40.0d0/11.0d0*(M_xyyz* &
      S_yz + M_yyz*S_xyz) + (140.0d0/33.0d0)*(M_yy*S_xyyy - M_yz*S_xyyz &
      ) + (10.0d0/11.0d0)*(S_xy*(-M_xxxx - M_xxyy) + x*(-M_xxxxy - &
      M_xxyyy)) + (1.0d0/62370.0d0)*(M_xxx*(75600*S_xxy - 56700*S_yyy) &
      + M_xxxy*(75600*S_xx - 132300*S_yy) + M_xyyy*(-75600*S_xx + &
      189000*S_yy)) + (40.0d0/33.0d0)*(M_xyyyy*y - M_xyyyz*z + M_yyyy* &
      S_xy - M_yyyz*S_xz) + (1.0d0/10395.0d0)*(M_x*(-1575*S_xxxxy - &
      22050*S_xxyyy - 1575*S_xxyzz + 8820*S_yyyyy - 1575*S_yyyzz) + &
      M_xy*(-1575*S_xxxx - 47250*S_xxyy - 1575*S_xxzz + 31500*S_yyyy - &
      1575*S_yyzz) + M_xyz*(12600*S_xxz - 44100*S_yyz) + M_xz*(12600* &
      S_xxyz - 18900*S_yyyz) + M_y*(-1575*S_xxxxx - 3150*S_xxxyy - 1575 &
      *S_xxxzz + 31500*S_xyyyy - 1575*S_xyyzz)) + (1.0d0/20790.0d0)*( &
      M_xx*(12600*S_xxxy - 56700*S_xyyy) + M_xxy*(12600*S_xxx - 132300* &
      S_xyy) + M_xyy*(-75600*S_xxy + 88200*S_yyy) + (-M_xx - M_yy)*( &
      -12600*S_xxxy - 31500*S_xyyy) + (-M_xxy - M_yyy)*(-12600*S_xxx - &
      56700*S_xyy)) + (5.0d0/33.0d0)*(M_xxxxx*y - M_xxxxxy - M_xxxyzz - &
      M_xyyyzz + S_xy*(-M_xxzz - M_yyzz) + x*(-M_xxyzz - M_yyyzz) + y*( &
      -M_xxxzz - M_xyyzz)) + (20.0d0/11.0d0)*(-M_xxxyy*y - M_xxyyy*x + &
      M_xxyz*S_xz + M_xxz*S_xyz - M_z*S_xyyyz - S_xy*(-M_xxyy - M_yyyy &
      ) - y*(-M_xxxyy - M_xyyyy)) + (20.0d0/33.0d0)*(M_xxxyz*z + M_xxxz &
      *S_yz + S_xyz*(-M_xxz - M_yyz) + S_xz*(-M_xxyz - M_yyyz) + S_yz*( &
      -M_xxxz - M_xyyz) - x*(-M_xxyyy - M_yyyyy) + z*(-M_xxxyz - &
      M_xyyyz))
    S_xyyyyz  = (1.0d0/33.0d0)*h**2*x*z - 6.0d0/11.0d0*h*x*y**2*z + x*y**4*z
    Ms_xyyyyz = M_0*S_xyyyyz + (48.0d0/11.0d0)*M_xyyz*S_yy + (6.0d0/11.0d0)*S_xz*( &
      -M_xxxx - M_xxyy) + (2.0d0/11.0d0)*(x*(-M_xxxxz - M_xxyyz) + z*( &
      -M_xxxxx - M_xxxyy)) + (1.0d0/62370.0d0)*(M_xxx*(15120*S_xxz - &
      34020*S_yyz) + M_xxxz*(7560*S_xx - 41580*S_yy) + (-M_xxxz - &
      M_xyyz)*(-7560*S_xx - 49140*S_yy) + (-M_xxz - M_yyz)*(-15120* &
      S_xxx - 49140*S_xyy)) - 16.0d0/11.0d0*(M_xxyy*S_xz + M_xxyyz*x + &
      S_xz*(-M_xxyy - M_yyyy) + z*(-M_xxxyy - M_xyyyy)) + (1.0d0/ &
      10395.0d0)*(M_x*(-315*S_xxxxz - 11970*S_xxyyz - 315*S_xxzzz + &
      10080*S_yyyyz - 315*S_yyzzz) + M_xy*(-20160*S_xxyz + 30240*S_yyyz &
      ) + M_xz*(-4095*S_xxxx - 5670*S_xxyy - 1575*S_xxzz + 20160*S_yyyy &
      - 1575*S_yyzz) + M_yz*(20160*S_xxxy + 50400*S_xyyy) + M_z*(-1575* &
      S_xxxxx + 8190*S_xxxyy - 1575*S_xxxzz + 20160*S_xyyyy - 1575* &
      S_xyyzz)) + (32.0d0/11.0d0)*(-M_xxy*S_xyz - M_xxyz*S_xy + M_y* &
      S_xyyyz - S_xyz*(-M_xxy - M_yyy) - S_yz*(-M_xxxy - M_xyyy)) + ( &
      1.0d0/20790.0d0)*(M_xx*(2520*S_xxxz - 34020*S_xyyz) + M_xxz*( &
      -5040*S_xxx - 41580*S_xyy) + M_xyy*(-20160*S_xxz + 70560*S_yyz) + &
      M_yyz*(20160*S_xxx + 90720*S_xyy) + (-M_xx - M_yy)*(-2520*S_xxxz &
      - 36540*S_xyyz) + (-M_xxx - M_xyy)*(5040*S_xxz - 36540*S_yyz)) + &
      (1.0d0/33.0d0)*(5*M_xxxx*S_xz + M_xxxxx*z - M_xxxxxz + 5*M_xxxxz* &
      x - 32*M_xxxy*S_yz - 16*M_xxxyy*z - 2*M_xxxyyz - 32*M_xxxyz*y - &
      M_xxxzzz + 64*M_xyyy*S_yz + 16*M_xyyyy*z + 32*M_xyyyyz + 64* &
      M_xyyyz*y - M_xyyzzz + 160*M_xyz*S_yyy + 112*M_yy*S_xyyz + 64* &
      M_yyy*S_xyz + 16*M_yyyy*S_xz + 16*M_yyyyz*x + 64*M_yyyz*S_xy - 32 &
      *S_xy*(-M_xxyz - M_yyyz) + 5*S_xz*(-M_xxzz - M_yyzz) - 16*x*( &
      -M_xxyyz - M_yyyyz) + x*(-M_xxzzz - M_yyzzz) - 32*y*(-M_xxxyz - &
      M_xyyyz) + 5*z*(-M_xxxzz - M_xyyzz))
    S_yyyyyy  = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*y**2 - 15.0d0/11.0d0*h*y**4 + &
      y**6
    Ms_yyyyyy = M_0*S_yyyyyy + (10.0d0/231.0d0)*M_xxxxxx + (5.0d0/77.0d0)*M_xxxxzz + ( &
      480.0d0/77.0d0)*M_xyz*S_xyz + (40.0d0/11.0d0)*M_xz*S_xyyz + ( &
      800.0d0/231.0d0)*M_yyy*S_yyy + (32.0d0/77.0d0)*M_yyyyy*y + ( &
      136.0d0/231.0d0)*M_yyyyyy - 30.0d0/77.0d0*M_yyyyzz + (90.0d0/ &
      77.0d0)*S_yy*(-M_xxxx - M_xxyy) - 25.0d0/77.0d0*(M_xxxxyy + &
      M_xxyyzz) + (5.0d0/231.0d0)*(M_xxzzzz + M_yyzzzz) + (1.0d0/ &
      62370.0d0)*(M_xxx*(-10800*S_xxx + 113400*S_xyy) + (-M_xxz - M_yyz &
      )*(10800*S_xxz + 124200*S_yyz)) + (1.0d0/249480.0d0)*(M_xxxx*( &
      -64800*S_xx + 113400*S_yy) + (-M_xxzz - M_yyzz)*(64800*S_xx + &
      178200*S_yy)) - 40.0d0/77.0d0*(M_xxxz*S_xz + S_xz*(-M_xxxz - &
      M_xyyz)) + (1.0d0/41580.0d0)*(M_xxyy*(64800*S_xx - 162000*S_yy) + &
      (-M_xxyy - M_yyyy)*(-64800*S_xx - 226800*S_yy)) - 160.0d0/77.0d0* &
      (M_xxyyy*y + y*(-M_xxyyy - M_yyyyy)) - 80.0d0/11.0d0*(M_xy*S_xyyy &
      + M_yz*S_yyyz) - 600.0d0/77.0d0*(M_xyy*S_xyy + M_yyz*S_yyz) - &
      320.0d0/77.0d0*(M_xyyy*S_xy + M_yyyz*S_yz) - 80.0d0/77.0d0*( &
      M_xyyyy*x + M_yyyyz*z) - 20.0d0/77.0d0*(x*(-M_xxxxx - M_xxxyy) + &
      z*(-M_xxxxz - M_xxyyz)) + (1.0d0/10395.0d0)*(M_x*(1350*S_xxxxx + &
      2700*S_xxxyy + 1350*S_xxxzz - 27000*S_xyyyy + 1350*S_xyyzz) + M_y &
      *(-8100*S_xxxxy - 16200*S_xxyyy - 8100*S_xxyzz + 25920*S_yyyyy - &
      8100*S_yyyzz) + M_z*(1350*S_xxxxz + 2700*S_xxyyz + 1350*S_xxzzz - &
      27000*S_yyyyz + 1350*S_yyzzz)) + (60.0d0/77.0d0)*(M_xxxxy*y - &
      M_xxyyyy + y*(-M_xxyzz - M_yyyzz)) - 10.0d0/77.0d0*(M_xxxxx*x + &
      M_xxxxz*z + x*(-M_xxxzz - M_xyyzz) + z*(-M_xxzzz - M_yyzzz)) + ( &
      240.0d0/77.0d0)*(M_xxxy*S_xy + M_xxyz*S_yz + M_xyyz*S_xz + S_xy*( &
      -M_xxxy - M_xyyy) + S_yz*(-M_xxyz - M_yyyz)) + (120.0d0/77.0d0)*( &
      M_xxxyy*x + M_xxyyz*z + M_yyyy*S_yy + x*(-M_xxxyy - M_xyyyy) + y* &
      (-M_xxxxy - M_xxyyy) + z*(-M_xxyyz - M_yyyyz)) + (1.0d0/20790.0d0 &
      )*(M_xx*(1350*S_xxxx + 40500*S_xxyy + 1350*S_xxzz - 27000*S_yyyy &
      + 1350*S_yyzz) + M_xxy*(64800*S_xxy - 75600*S_yyy) + M_xxz*( &
      -10800*S_xxz + 37800*S_yyz) + M_yy*(-8100*S_xxxx - 16200*S_xxyy - &
      8100*S_xxzz + 86400*S_yyyy - 8100*S_yyzz) + (-M_xx - M_yy)*(6750* &
      S_xxxx - 24300*S_xxyy + 6750*S_xxzz - 59400*S_yyyy + 6750*S_yyzz &
      ) + (-M_xxx - M_xyy)*(10800*S_xxx + 48600*S_xyy) + (-M_xxy - &
      M_yyy)*(-64800*S_xxy - 140400*S_yyy))
    S_yyyyyz  = (5.0d0/33.0d0)*h**2*y*z - 10.0d0/11.0d0*h*y**3*z + y**5*z
    Ms_yyyyyz = M_0*S_yyyyyz - 30.0d0/11.0d0*M_xxyz*S_yy - 50.0d0/33.0d0*M_xxz*S_yyy + ( &
      100.0d0/33.0d0)*M_yyy*S_yyz + (8.0d0/33.0d0)*M_yyyyy*z + (28.0d0/ &
      33.0d0)*M_yyyyyz - 60.0d0/11.0d0*S_yz*(-M_xxyy - M_yyyy) + ( &
      10.0d0/33.0d0)*(-M_xxyyyz + y*(-M_xxxxz - M_xxyyz)) + (140.0d0/ &
      33.0d0)*(-M_xy*S_xyyz + M_yy*S_yyyz) - 40.0d0/11.0d0*(M_xyy*S_xyz &
      + M_xyyz*S_xy) + (10.0d0/11.0d0)*(S_yz*(-M_xxxx - M_xxyy) + z*( &
      -M_xxxxy - M_xxyyy)) + (25.0d0/33.0d0)*(S_yz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxyzz - M_yyyzz)) + (1.0d0/62370.0d0)*(M_yyyz*(75600*S_xx + &
      264600*S_yy) + (-M_xxyz - M_yyyz)*(-75600*S_xx - 207900*S_yy) + ( &
      -M_xxz - M_yyz)*(-75600*S_xxy - 132300*S_yyy)) + (40.0d0/33.0d0)* &
      (-M_xyyy*S_xz - M_xyyyz*x + M_yyyy*S_yz + M_yyyyz*y) + (1.0d0/ &
      20790.0d0)*(M_xx*(12600*S_xxyz - 18900*S_yyyz) + M_xxy*(12600* &
      S_xxz - 44100*S_yyz) + M_yyz*(75600*S_xxy + 163800*S_yyy) + ( &
      -M_xx - M_yy)*(-12600*S_xxyz - 69300*S_yyyz) + (-M_xxy - M_yyy)*( &
      -12600*S_xxz - 144900*S_yyz)) + (1.0d0/10395.0d0)*(M_xyz*(-12600* &
      S_xxx - 56700*S_xyy) + M_xz*(-12600*S_xxxy - 31500*S_xyyy) + M_y* &
      (-1575*S_xxxxz - 3150*S_xxyyz - 1575*S_xxzzz + 31500*S_yyyyz - &
      1575*S_yyzzz) + M_yz*(-7875*S_xxxx + 28350*S_xxyy - 7875*S_xxzz + &
      69300*S_yyyy - 7875*S_yyzz) + M_z*(-7875*S_xxxxy + 3150*S_xxyyy - &
      7875*S_xxyzz + 21420*S_yyyyy - 7875*S_yyyzz)) + (20.0d0/11.0d0)*( &
      -M_x*S_xyyyz - M_xxyy*S_yz - M_xxyyz*y + S_xyz*(-M_xxx - M_xyy) + &
      S_xz*(-M_xxxy - M_xyyy) - y*(-M_xxyyz - M_yyyyz) - z*(-M_xxyyy - &
      M_yyyyy)) + (20.0d0/33.0d0)*(M_xxx*S_xyz + M_xxxy*S_xz + M_xxxyz* &
      x + M_xxxz*S_xy - M_xxyyy*z + S_xy*(-M_xxxz - M_xyyz) + x*( &
      -M_xxxyz - M_xyyyz)) + (5.0d0/33.0d0)*(M_xxxx*S_yz + M_xxxxy*z - &
      M_xxxxyz + M_xxxxz*y - M_xxyzzz - M_yyyzzz + y*(-M_xxzzz - &
      M_yyzzz))
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
    end subroutine mom_es_M2M
    
! OPS  690*ADD + 73*DIV + 1126*MUL + 74*NEG + 256*POW + 58*SUB = 2277  (2771 before optimization)
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
                D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define z                    r(3)
#define y                    r(2)
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
#define M_xxx                M(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define M_xxy                M(10)
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
#define L_xxxx               L(16)
#define M_xxxx               M(16)
#define M_xxxy               M(17)
#define L_xxxy               L(17)
#define L_xxxz               L(18)
#define M_xxxz               M(18)
#define M_xxyy               M(19)
#define L_xxyy               L(19)
#define M_xxyz               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define M_xyyz               M(22)
#define L_xyyz               L(22)
#define L_yyyy               L(23)
#define M_yyyy               M(23)
#define M_yyyz               M(24)
#define L_yyyz               L(24)
#define L_xxxxx              L(25)
#define M_xxxxx              M(25)
#define M_xxxxy              M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define L_xxxyy              L(28)
#define M_xxxyy              M(28)
#define L_xxxyz              L(29)
#define M_xxxyz              M(29)
#define M_xxyyy              M(30)
#define L_xxyyy              L(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define L_xyyyy              L(32)
#define M_xyyyy              M(32)
#define L_xyyyz              L(33)
#define M_xyyyz              M(33)
#define M_yyyyy              M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_yyyyz              M(35)
#define L_xxxxxx             L(36)
#define M_xxxxxx             M(36)
#define L_xxxxxy             L(37)
#define M_xxxxxy             M(37)
#define L_xxxxxz             L(38)
#define M_xxxxxz             M(38)
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
#define M_xxyyyz             M(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define M_xyyyyy             M(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define L_yyyyyy             L(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define L_yyyyyz             L(48)
    M_zz     = -(M_xx + M_yy)
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    M_xxzz   = -(M_xxxx + M_xxyy)
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    M_xxxxzz = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz = -(M_xxzzzz + M_yyzzzz)
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
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxy*M_xy + D_xxxxxz*M_xz + D_xxxxy*M_y + &
      D_xxxxyz*M_yz + D_xxxxz*M_z + (1.0d0/2.0d0)*(D_xxxxxx*M_xx + &
      D_xxxxyy*M_yy + D_xxxxzz*M_zz)
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    L_xxxyy  = D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    L_xxxy   = D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyy*M_y + &
      D_xxxyyz*M_yz + D_xxxyz*M_z + (1.0d0/2.0d0)*(D_xxxxxy*M_xx + &
      D_xxxyyy*M_yy + D_xxxyzz*M_zz)
    L_xxxyz  = D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    L_xxx    = D_xxx*M_0 + D_xxxx*M_x + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + (1.0d0/6.0d0)*(D_xxxxxx* &
      M_xxx + D_xxxyyy*M_yyy + D_xxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxx &
      *M_xx + D_xxxxxy*M_xxy + D_xxxxxz*M_xxz + D_xxxxyy*M_xyy + &
      D_xxxxzz*M_xzz + D_xxxyy*M_yy + D_xxxyyz*M_yyz + D_xxxyzz*M_yzz + &
      D_xxxzz*M_zz)
    L_xxxz   = D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y + D_xxxyzz* &
      M_yz + D_xxxz*M_0 + D_xxxzz*M_z + (1.0d0/2.0d0)*(D_xxxxxz*M_xx + &
      D_xxxyyz*M_yy + D_xxxzzz*M_zz)
    D_xxyyyy = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    L_xxyyy  = D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    L_xxyy   = D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyy*M_y + &
      D_xxyyyz*M_yz + D_xxyyz*M_z + (1.0d0/2.0d0)*(D_xxxxyy*M_xx + &
      D_xxyyyy*M_yy + D_xxyyzz*M_zz)
    L_xxyyz  = D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    L_xxy    = D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z + (1.0d0/6.0d0)*(D_xxxxxy* &
      M_xxx + D_xxyyyy*M_yyy + D_xxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxy &
      *M_xx + D_xxxxyy*M_xxy + D_xxxxyz*M_xxz + D_xxxyyy*M_xyy + &
      D_xxxyzz*M_xzz + D_xxyyy*M_yy + D_xxyyyz*M_yyz + D_xxyyzz*M_yzz + &
      D_xxyzz*M_zz)
    L_xxyz   = D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y + D_xxyyzz* &
      M_yz + D_xxyz*M_0 + D_xxyzz*M_z + (1.0d0/2.0d0)*(D_xxxxyz*M_xx + &
      D_xxyyyz*M_yy + D_xxyzzz*M_zz)
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    L_xx     = D_xx*M_0 + D_xxx*M_x + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy &
      *M_y + D_xxyz*M_yz + D_xxz*M_z + (1.0d0/24.0d0)*(D_xxxxxx*M_xxxx &
      + D_xxyyyy*M_yyyy + D_xxzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyy* &
      M_xxyy + D_xxxxzz*M_xxzz + D_xxyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxx*M_xxx + D_xxxxxy*M_xxxy + D_xxxxxz*M_xxxz + D_xxxyyy* &
      M_xyyy + D_xxxzzz*M_xzzz + D_xxyyy*M_yyy + D_xxyyyz*M_yyyz + &
      D_xxyzzz*M_yzzz + D_xxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxx*M_xx + &
      D_xxxxy*M_xxy + D_xxxxyz*M_xxyz + D_xxxxz*M_xxz + D_xxxyy*M_xyy + &
      D_xxxyyz*M_xyyz + D_xxxyzz*M_xyzz + D_xxxzz*M_xzz + D_xxyy*M_yy + &
      D_xxyyz*M_yyz + D_xxyzz*M_yzz + D_xxzz*M_zz)
    L_xxz    = D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + (1.0d0/6.0d0)*(D_xxxxxz* &
      M_xxx + D_xxyyyz*M_yyy + D_xxzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxxyz*M_xxy + D_xxxxz*M_xx + D_xxxxzz*M_xxz + D_xxxyyz*M_xyy + &
      D_xxxzzz*M_xzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyzzz*M_yzz + &
      D_xxzzz*M_zz)
    D_xyyyyy = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    L_xyyyy  = D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    L_xyyy   = D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyy*M_y + &
      D_xyyyyz*M_yz + D_xyyyz*M_z + (1.0d0/2.0d0)*(D_xxxyyy*M_xx + &
      D_xyyyyy*M_yy + D_xyyyzz*M_zz)
    L_xyyyz  = D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    L_xyy    = D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z + (1.0d0/6.0d0)*(D_xxxxyy* &
      M_xxx + D_xyyyyy*M_yyy + D_xyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyy &
      *M_xx + D_xxxyyy*M_xxy + D_xxxyyz*M_xxz + D_xxyyyy*M_xyy + &
      D_xxyyzz*M_xzz + D_xyyyy*M_yy + D_xyyyyz*M_yyz + D_xyyyzz*M_yzz + &
      D_xyyzz*M_zz)
    L_xyyz   = D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y + D_xyyyzz* &
      M_yz + D_xyyz*M_0 + D_xyyzz*M_z + (1.0d0/2.0d0)*(D_xxxyyz*M_xx + &
      D_xyyyyz*M_yy + D_xyyzzz*M_zz)
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    L_xy     = D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy &
      *M_y + D_xyyz*M_yz + D_xyz*M_z + (1.0d0/24.0d0)*(D_xxxxxy*M_xxxx &
      + D_xyyyyy*M_yyyy + D_xyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyy* &
      M_xxyy + D_xxxyzz*M_xxzz + D_xyyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyz*M_xxxz + D_xxyyyy* &
      M_xyyy + D_xxyzzz*M_xzzz + D_xyyyy*M_yyy + D_xyyyyz*M_yyyz + &
      D_xyyzzz*M_yzzz + D_xyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxy*M_xx + &
      D_xxxyy*M_xxy + D_xxxyyz*M_xxyz + D_xxxyz*M_xxz + D_xxyyy*M_xyy + &
      D_xxyyyz*M_xyyz + D_xxyyzz*M_xyzz + D_xxyzz*M_xzz + D_xyyy*M_yy + &
      D_xyyyz*M_yyz + D_xyyzz*M_yzz + D_xyzz*M_zz)
    L_xyz    = D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + (1.0d0/6.0d0)*(D_xxxxyz* &
      M_xxx + D_xyyyyz*M_yyy + D_xyzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxyyz*M_xxy + D_xxxyz*M_xx + D_xxxyzz*M_xxz + D_xxyyyz*M_xyy + &
      D_xxyzzz*M_xzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyzzz*M_yzz + &
      D_xyzzz*M_zz)
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = D_x*M_0 + D_xx*M_x + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + &
      D_xyz*M_yz + D_xz*M_z + (1.0d0/120.0d0)*(D_xxxxxx*M_xxxxx + &
      D_xyyyyy*M_yyyyy + D_xzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyy* &
      M_xxxyy + D_xxxxzz*M_xxxzz + D_xxxyyy*M_xxyyy + D_xxxzzz*M_xxzzz &
      + D_xyyyzz*M_yyyzz + D_xyyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxxyy* &
      M_xxyy + D_xxxyyz*M_xxyyz + D_xxxyzz*M_xxyzz + D_xxxzz*M_xxzz + &
      D_xxyyzz*M_xyyzz + D_xyyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxx* &
      M_xxxx + D_xxxxxy*M_xxxxy + D_xxxxxz*M_xxxxz + D_xxyyyy*M_xyyyy + &
      D_xxzzzz*M_xzzzz + D_xyyyy*M_yyyy + D_xyyyyz*M_yyyyz + D_xyzzzz* &
      M_yzzzz + D_xzzzz*M_zzzz) + (1.0d0/2.0d0)*(D_xxx*M_xx + D_xxxy* &
      M_xxy + D_xxxyz*M_xxyz + D_xxxz*M_xxz + D_xxyy*M_xyy + D_xxyyz* &
      M_xyyz + D_xxyzz*M_xyzz + D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz* &
      M_yyz + D_xyzz*M_yzz + D_xzz*M_zz) + (1.0d0/6.0d0)*(D_xxxx*M_xxx &
      + D_xxxxy*M_xxxy + D_xxxxyz*M_xxxyz + D_xxxxz*M_xxxz + D_xxyyy* &
      M_xyyy + D_xxyyyz*M_xyyyz + D_xxyzzz*M_xyzzz + D_xxzzz*M_xzzz + &
      D_xyyy*M_yyy + D_xyyyz*M_yyyz + D_xyzzz*M_yzzz + D_xzzz*M_zzz)
    L_xz     = D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + &
      D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + (1.0d0/24.0d0)*(D_xxxxxz* &
      M_xxxx + D_xyyyyz*M_yyyy + D_xzzzzz*M_zzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyz*M_xxyy + D_xxxzzz*M_xxzz + D_xyyzzz*M_yyzz) + (1.0d0/ &
      6.0d0)*(D_xxxxyz*M_xxxy + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + &
      D_xxyyyz*M_xyyy + D_xxzzzz*M_xzzz + D_xyyyz*M_yyy + D_xyyyzz* &
      M_yyyz + D_xyzzzz*M_yzzz + D_xzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz*M_xx + D_xxxzz*M_xxz + &
      D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyzzz*M_xyzz + D_xxzzz*M_xzz &
      + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz*M_yzz + D_xzzz*M_zz)
    D_yyyyyy = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    L_yyyyy  = D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyy*M_y + &
      D_yyyyyz*M_yz + D_yyyyz*M_z + (1.0d0/2.0d0)*(D_xxyyyy*M_xx + &
      D_yyyyyy*M_yy + D_yyyyzz*M_zz)
    L_yyyyz  = D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyz*M_yz + D_yyyz*M_z + (1.0d0/6.0d0)*(D_xxxyyy* &
      M_xxx + D_yyyyyy*M_yyy + D_yyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyy &
      *M_xx + D_xxyyyy*M_xxy + D_xxyyyz*M_xxz + D_xyyyyy*M_xyy + &
      D_xyyyzz*M_xzz + D_yyyyy*M_yy + D_yyyyyz*M_yyz + D_yyyyzz*M_yzz + &
      D_yyyzz*M_zz)
    L_yyyz   = D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzz*M_z + (1.0d0/2.0d0)*(D_xxyyyz*M_xx + &
      D_yyyyyz*M_yy + D_yyyzzz*M_zz)
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy &
      *M_y + D_yyyz*M_yz + D_yyz*M_z + (1.0d0/24.0d0)*(D_xxxxyy*M_xxxx &
      + D_yyyyyy*M_yyyy + D_yyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyy* &
      M_xxyy + D_xxyyzz*M_xxzz + D_yyyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyz*M_xxxz + D_xyyyyy* &
      M_xyyy + D_xyyzzz*M_xzzz + D_yyyyy*M_yyy + D_yyyyyz*M_yyyz + &
      D_yyyzzz*M_yzzz + D_yyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyy*M_xx + &
      D_xxyyy*M_xxy + D_xxyyyz*M_xxyz + D_xxyyz*M_xxz + D_xyyyy*M_xyy + &
      D_xyyyyz*M_xyyz + D_xyyyzz*M_xyzz + D_xyyzz*M_xzz + D_yyyy*M_yy + &
      D_yyyyz*M_yyz + D_yyyzz*M_yzz + D_yyzz*M_zz)
    L_yyz    = D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyz*M_y + &
      D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + (1.0d0/6.0d0)*(D_xxxyyz* &
      M_xxx + D_yyyyyz*M_yyy + D_yyzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxyyyz*M_xxy + D_xxyyz*M_xx + D_xxyyzz*M_xxz + D_xyyyyz*M_xyy + &
      D_xyyzzz*M_xzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyzzz*M_yzz + &
      D_yyzzz*M_zz)
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyz*M_yz + D_yz*M_z + (1.0d0/120.0d0)*(D_xxxxxy*M_xxxxx + &
      D_yyyyyy*M_yyyyy + D_yzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyy* &
      M_xxxyy + D_xxxyzz*M_xxxzz + D_xxyyyy*M_xxyyy + D_xxyzzz*M_xxzzz &
      + D_yyyyzz*M_yyyzz + D_yyyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyyy* &
      M_xxyy + D_xxyyyz*M_xxyyz + D_xxyyzz*M_xxyzz + D_xxyzz*M_xxzz + &
      D_xyyyzz*M_xyyzz + D_yyyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxy* &
      M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyz*M_xxxxz + D_xyyyyy*M_xyyyy + &
      D_xyzzzz*M_xzzzz + D_yyyyy*M_yyyy + D_yyyyyz*M_yyyyz + D_yyzzzz* &
      M_yzzzz + D_yzzzz*M_zzzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + D_xxxyy &
      *M_xxxy + D_xxxyyz*M_xxxyz + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + &
      D_xyyyyz*M_xyyyz + D_xyyzzz*M_xyzzz + D_xyzzz*M_xzzz + D_yyyy* &
      M_yyy + D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + D_xxyz*M_xxz &
      + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + D_xyzz*M_xzz + &
      D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz*M_zz)
    L_yz     = D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyz*M_y + &
      D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + (1.0d0/24.0d0)*(D_xxxxyz* &
      M_xxxx + D_yyyyyz*M_yyyy + D_yzzzzz*M_zzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyz*M_xxyy + D_xxyzzz*M_xxzz + D_yyyzzz*M_yyzz) + (1.0d0/ &
      6.0d0)*(D_xxxyyz*M_xxxy + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + &
      D_xyyyyz*M_xyyy + D_xyzzzz*M_xzzz + D_yyyyz*M_yyy + D_yyyyzz* &
      M_yyyz + D_yyzzzz*M_yzzz + D_yzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz*M_xx + D_xxyzz*M_xxz + &
      D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyzzz*M_xyzz + D_xyzzz*M_xzz &
      + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz*M_yzz + D_yzzz*M_zz)
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = D_0*M_0 + D_x*M_x + (1.0d0/8.0d0)*D_xxyyzz*M_xxyyzz + D_xy*M_xy + D_xyz* &
      M_xyz + D_xz*M_xz + D_y*M_y + D_yz*M_yz + D_z*M_z + (1.0d0/ &
      720.0d0)*(D_xxxxxx*M_xxxxxx + D_yyyyyy*M_yyyyyy + D_zzzzzz* &
      M_zzzzzz) + (1.0d0/36.0d0)*(D_xxxyyy*M_xxxyyy + D_xxxzzz*M_xxxzzz &
      + D_yyyzzz*M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyy*M_xxxxyy + &
      D_xxxxzz*M_xxxxzz + D_xxyyyy*M_xxyyyy + D_xxzzzz*M_xxzzzz + &
      D_yyyyzz*M_yyyyzz + D_yyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyy* &
      M_xxyy + D_xxyyz*M_xxyyz + D_xxyzz*M_xxyzz + D_xxzz*M_xxzz + &
      D_xyyzz*M_xyyzz + D_yyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxx* &
      M_xxxxx + D_xxxxxy*M_xxxxxy + D_xxxxxz*M_xxxxxz + D_xyyyyy* &
      M_xyyyyy + D_xzzzzz*M_xzzzzz + D_yyyyy*M_yyyyy + D_yyyyyz* &
      M_yyyyyz + D_yzzzzz*M_yzzzzz + D_zzzzz*M_zzzzz) + (1.0d0/2.0d0)*( &
      D_xx*M_xx + D_xxy*M_xxy + D_xxyz*M_xxyz + D_xxz*M_xxz + D_xyy* &
      M_xyy + D_xyyz*M_xyyz + D_xyzz*M_xyzz + D_xzz*M_xzz + D_yy*M_yy + &
      D_yyz*M_yyz + D_yzz*M_yzz + D_zz*M_zz) + (1.0d0/6.0d0)*(D_xxx* &
      M_xxx + D_xxxy*M_xxxy + D_xxxyz*M_xxxyz + D_xxxz*M_xxxz + D_xyyy* &
      M_xyyy + D_xyyyz*M_xyyyz + D_xyzzz*M_xyzzz + D_xzzz*M_xzzz + &
      D_yyy*M_yyy + D_yyyz*M_yyyz + D_yzzz*M_yzzz + D_zzz*M_zzz) + ( &
      1.0d0/24.0d0)*(D_xxxx*M_xxxx + D_xxxxy*M_xxxxy + D_xxxxyz* &
      M_xxxxyz + D_xxxxz*M_xxxxz + D_xyyyy*M_xyyyy + D_xyyyyz*M_xyyyyz &
      + D_xyzzzz*M_xyzzzz + D_xzzzz*M_xzzzz + D_yyyy*M_yyyy + D_yyyyz* &
      M_yyyyz + D_yzzzz*M_yzzzz + D_zzzz*M_zzzz) + (1.0d0/12.0d0)*( &
      D_xxxyy*M_xxxyy + D_xxxyyz*M_xxxyyz + D_xxxyzz*M_xxxyzz + D_xxxzz &
      *M_xxxzz + D_xxyyy*M_xxyyy + D_xxyyyz*M_xxyyyz + D_xxyzzz* &
      M_xxyzzz + D_xxzzz*M_xxzzz + D_xyyyzz*M_xyyyzz + D_xyyzzz* &
      M_xyyzzz + D_yyyzz*M_yyyzz + D_yyzzz*M_yyzzz)
    L_z      = D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yz*M_y + D_yzz* &
      M_yz + D_z*M_0 + D_zz*M_z + (1.0d0/120.0d0)*(D_xxxxxz*M_xxxxx + &
      D_yyyyyz*M_yyyyy + D_zzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyz* &
      M_xxxyy + D_xxxzzz*M_xxxzz + D_xxyyyz*M_xxyyy + D_xxzzzz*M_xxzzz &
      + D_yyyzzz*M_yyyzz + D_yyzzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyyz* &
      M_xxyy + D_xxyyzz*M_xxyyz + D_xxyzzz*M_xxyzz + D_xxzzz*M_xxzz + &
      D_xyyzzz*M_xyyzz + D_yyzzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxyz* &
      M_xxxxy + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + D_xyyyyz*M_xyyyy + &
      D_xzzzzz*M_xzzzz + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + D_yzzzzz* &
      M_yzzzz + D_zzzzz*M_zzzz) + (1.0d0/6.0d0)*(D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy &
      + D_xyyyzz*M_xyyyz + D_xyzzzz*M_xyzzz + D_xzzzz*M_xzzz + D_yyyz* &
      M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + D_xxzz*M_xxz &
      + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz*M_xyzz + D_xzzz*M_xzz + &
      D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz*M_zz)
#undef  M_0                 
#undef  L_0                 
#undef  z                   
#undef  y                   
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
#undef  M_xxx               
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxy               
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
#undef  L_xxxx              
#undef  M_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  M_xxyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  L_xxxyy             
#undef  M_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  M_xxyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  L_xxxxxz            
#undef  M_xxxxxz            
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
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
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
    
! OPS  1133*ADD + 481*DIV + 3180*MUL + 493*NEG + 126*POW + 1178*SUB = 6591  (7572 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz,&
                M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz,&
                S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy,&
                S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz,&
                S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy,&
                S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz, S_xxxxxx,&
                S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy, S_xxxyyz,&
                S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy, S_yyyyyz
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
    Ms_0      = Ms_0 + (M_0)
    Ms_x      = Ms_x + (M_0*x + M_x)
    Ms_y      = Ms_y + (M_0*y + M_y)
    Ms_z      = Ms_z + (M_0*z + M_z)
    M_zz      = -(M_xx + M_yy)
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    M_xxzz    = -(M_xxxx + M_xxyy)
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -(M_xxxzz + M_xyyzz)
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    S_0       = 1
    S_x       = x
    S_y       = y
    S_z       = z
    S_xy      = x*y
    Ms_xy     = Ms_xy + (M_0*S_xy + M_x*y + M_xy + M_y*x)
    S_xz      = x*z
    Ms_xz     = Ms_xz + (M_0*S_xz + M_x*z + M_xz + M_z*x)
    S_yz      = y*z
    Ms_yz     = Ms_yz + (M_0*S_yz + M_y*z + M_yz + M_z*y)
    S_xyz     = x*y*z
    Ms_xyz    = Ms_xyz + (M_0*S_xyz + M_x*S_yz + M_xy*z + M_xyz + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy)
    h         = x**2 + y**2 + z**2
    S_xx      = -1.0d0/3.0d0*h + x**2
    Ms_xx     = Ms_xx + (M_0*S_xx + (4.0d0/3.0d0)*M_x*x + M_xx - 2.0d0/3.0d0*(M_y*y + M_z*z))
    S_yy      = -1.0d0/3.0d0*h + y**2
    Ms_yy     = Ms_yy + (M_0*S_yy + (4.0d0/3.0d0)*M_y*y + M_yy - 2.0d0/3.0d0*(M_x*x + M_z*z))
    S_zz      = -(S_xx + S_yy)
    S_xxx     = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx    = Ms_xxx + (M_0*S_xxx + (9.0d0/5.0d0)*M_x*S_xx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(M_xx*x - M_xy*y - M_xz*z - M_y* &
      S_xy - M_z*S_xz))
    S_xxy     = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy    = Ms_xxy + (M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (1.0d0/15.0d0)*M_y*(15*S_xx - &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xy + M_xy*x) - 1.0d0/5.0d0*(3*M_yy &
      *y + 2*M_yz*z + 2*M_z*S_yz + y*(-M_xx - M_yy)))
    S_xxz     = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz    = Ms_xxz + (M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (1.0d0/15.0d0)*M_z*(21*S_xx + &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xz + M_xz*x) - 1.0d0/5.0d0*(2*M_y* &
      S_yz + M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy)))
    S_xyy     = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy    = Ms_xyy + (M_0*S_xyy + (1.0d0/15.0d0)*M_x*(-6*S_xx + 15*S_yy) + M_xyy + (4.0d0/ &
      5.0d0)*M_yy*x + (8.0d0/5.0d0)*(M_xy*y + M_y*S_xy) - 1.0d0/5.0d0*( &
      3*M_xx*x + 2*M_xz*z + 2*M_z*S_xz + x*(-M_xx - M_yy)))
    S_xzz     = -(S_xxx + S_xyy)
    S_yyy     = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy    = Ms_yyy + (M_0*S_yyy + (9.0d0/5.0d0)*M_y*S_yy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(-M_x*S_xy - M_xy*x + M_yy*y - &
      M_yz*z - M_z*S_yz))
    S_yyz     = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz    = Ms_yyz + (M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (1.0d0/15.0d0)*M_z*(6*S_xx + &
      21*S_yy) + (8.0d0/5.0d0)*(M_y*S_yz + M_yz*y) - 1.0d0/5.0d0*(2*M_x &
      *S_xz + M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy)))
    S_yzz     = -(S_xxy + S_yyy)
    S_zzz     = -(S_xxz + S_yyz)
    S_xxxx    = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4
    Ms_xxxx   = Ms_xxxx + (M_0*S_xxxx + (16.0d0/7.0d0)*M_x*S_xxx + (72.0d0/35.0d0)*M_xx*S_xx - &
      6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_yz*S_yz + (32.0d0/35.0d0) &
      *(M_xxx*x + M_xxxx) - 96.0d0/35.0d0*(M_xy*S_xy + M_xz*S_xz) - &
      12.0d0/7.0d0*(M_y*S_xxy + M_z*S_xxz) + (1.0d0/210.0d0)*(M_yy*( &
      -180*S_xx + 72*S_yy) + (-M_xx - M_yy)*(-252*S_xx - 72*S_yy)) - &
      3.0d0/35.0d0*(M_xxzz + M_yyyy + M_yyzz) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xxz*z + M_xyy*x + x*(-M_xxx - M_xyy)) + (12.0d0/35.0d0)*( &
      M_yyy*y + M_yyz*z + y*(-M_xxy - M_yyy) + z*(-M_xxz - M_yyz)))
    S_xxxy    = -3.0d0/7.0d0*h*x*y + x**3*y
    Ms_xxxy   = Ms_xxxy + (M_0*S_xxxy + (15.0d0/7.0d0)*M_x*S_xxy + (4.0d0/7.0d0)*M_xxx*y + M_xxxy + &
      (12.0d0/7.0d0)*(M_xx*S_xy + M_xxy*x) + (1.0d0/105.0d0)*(M_xy*(225 &
      *S_xx - 90*S_yy) + M_y*(105*S_xxx - 90*S_xyy)) - 9.0d0/7.0d0*( &
      M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz*S_yz + M_yz* &
      S_xz + M_z*S_xyz) - 3.0d0/7.0d0*(M_yyy*x + S_xy*(-M_xx - M_yy) + &
      x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy)))
    S_xxxz    = -3.0d0/7.0d0*h*x*z + x**3*z
    Ms_xxxz   = Ms_xxxz + (M_0*S_xxxz + (15.0d0/7.0d0)*M_x*S_xxz + (4.0d0/7.0d0)*M_xxx*z + M_xxxz + &
      (12.0d0/7.0d0)*(M_xx*S_xz + M_xxz*x) + (1.0d0/105.0d0)*(M_xz*(315 &
      *S_xx + 90*S_yy) + M_z*(195*S_xxx + 90*S_xyy)) - 9.0d0/7.0d0*( &
      S_xz*(-M_xx - M_yy) + z*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 3.0d0/7.0d0*(M_xyy*z + &
      M_yy*S_xz + M_yyz*x + x*(-M_xxz - M_yyz)))
    S_xxyy    = (1.0d0/35.0d0)*h**2 + x**2*y**2 - 1.0d0/7.0d0*(h*x**2 + h*y**2)
    Ms_xxyy   = Ms_xxyy + (M_0*S_xxyy + (33.0d0/35.0d0)*M_xxyy + (108.0d0/35.0d0)*M_xy*S_xy + ( &
      4.0d0/35.0d0)*z*(-M_xxz - M_yyz) + (54.0d0/35.0d0)*(M_xxy*y + &
      M_xyy*x) + (1.0d0/105.0d0)*(M_x*(-30*S_xxx + 180*S_xyy) + M_y*( &
      180*S_xxy - 30*S_yyy) + M_z*(-30*S_xxz - 30*S_yyz)) + (1.0d0/ &
      210.0d0)*(M_xx*(-126*S_xx + 180*S_yy) + M_yy*(180*S_xx - 126*S_yy &
      ) + (-M_xx - M_yy)*(-54*S_xx - 54*S_yy)) - 1.0d0/35.0d0*(16*M_xxx &
      *x + M_xxxx + 6*M_xxz*z + M_xxzz + 12*M_xz*S_xz + 16*M_yyy*y + &
      M_yyyy + 6*M_yyz*z + M_yyzz + 12*M_yz*S_yz + 6*x*(-M_xxx - M_xyy &
      ) + 6*y*(-M_xxy - M_yyy)))
    S_xxyz    = -1.0d0/7.0d0*h*y*z + x**2*y*z
    Ms_xxyz   = Ms_xxyz + (M_0*S_xxyz + M_xxyz + (9.0d0/7.0d0)*M_yz*S_xx + (1.0d0/105.0d0)*(M_y*( &
      105*S_xxz - 30*S_yyz) + M_z*(135*S_xxy + 30*S_yyy)) + (6.0d0/ &
      7.0d0)*(M_xx*S_yz + M_xxy*z + M_xxz*y) + (12.0d0/7.0d0)*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 1.0d0/7.0d0*(3*M_yy* &
      S_yz + M_yyy*z + 3*M_yyz*y + 3*S_yz*(-M_xx - M_yy) + y*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxy - M_yyy)))
    S_xxzz    = -(S_xxxx + S_xxyy)
    S_xyyy    = -3.0d0/7.0d0*h*x*y + x*y**3
    Ms_xyyy   = Ms_xyyy + (M_0*S_xyyy + M_xyyy + (15.0d0/7.0d0)*M_y*S_xyy + (4.0d0/7.0d0)*M_yyy*x + &
      (1.0d0/105.0d0)*(M_x*(-90*S_xxy + 105*S_yyy) + M_xy*(-90*S_xx + &
      225*S_yy)) - 9.0d0/7.0d0*(M_xx*S_xy + M_xxy*x) + (12.0d0/7.0d0)*( &
      M_xyy*y + M_yy*S_xy) - 3.0d0/7.0d0*(M_xxx*y + S_xy*(-M_xx - M_yy &
      ) + x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xyz &
      *z + M_xz*S_yz + M_yz*S_xz + M_z*S_xyz))
    S_xyyz    = -1.0d0/7.0d0*h*x*z + x*y**2*z
    Ms_xyyz   = Ms_xyyz + (M_0*S_xyyz + M_xyyz + (9.0d0/7.0d0)*M_xz*S_yy + (1.0d0/105.0d0)*(M_x*( &
      -30*S_xxz + 105*S_yyz) + M_z*(30*S_xxx + 135*S_xyy)) + (6.0d0/ &
      7.0d0)*(M_xyy*z + M_yy*S_xz + M_yyz*x) + (12.0d0/7.0d0)*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 1.0d0/7.0d0*(3*M_xx* &
      S_xz + M_xxx*z + 3*M_xxz*x + 3*S_xz*(-M_xx - M_yy) + x*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxx - M_xyy)))
    S_xyzz    = -(S_xxxy + S_xyyy)
    S_xzzz    = -(S_xxxz + S_xyyz)
    S_yyyy    = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4
    Ms_yyyy   = Ms_yyyy + (M_0*S_yyyy - 6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_xz*S_xz + (16.0d0/ &
      7.0d0)*M_y*S_yyy + (72.0d0/35.0d0)*M_yy*S_yy - 12.0d0/7.0d0*(M_x* &
      S_xyy + M_z*S_yyz) + (1.0d0/210.0d0)*(M_xx*(72*S_xx - 180*S_yy) + &
      (-M_xx - M_yy)*(-72*S_xx - 252*S_yy)) - 96.0d0/35.0d0*(M_xy*S_xy &
      + M_yz*S_yz) + (32.0d0/35.0d0)*(M_yyy*y + M_yyyy) - 3.0d0/35.0d0* &
      (M_xxxx + M_xxzz + M_yyzz) + (12.0d0/35.0d0)*(M_xxx*x + M_xxz*z + &
      x*(-M_xxx - M_xyy) + z*(-M_xxz - M_yyz)) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xyy*x + M_yyz*z + y*(-M_xxy - M_yyy)))
    S_yyyz    = -3.0d0/7.0d0*h*y*z + y**3*z
    Ms_yyyz   = Ms_yyyz + (M_0*S_yyyz + (15.0d0/7.0d0)*M_y*S_yyz + (4.0d0/7.0d0)*M_yyy*z + M_yyyz + &
      (12.0d0/7.0d0)*(M_yy*S_yz + M_yyz*y) + (1.0d0/105.0d0)*(M_yz*(90* &
      S_xx + 315*S_yy) + M_z*(90*S_xxy + 195*S_yyy)) - 9.0d0/7.0d0*( &
      S_yz*(-M_xx - M_yy) + z*(-M_xxy - M_yyy)) - 6.0d0/7.0d0*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 3.0d0/7.0d0*(M_xx*S_yz &
      + M_xxy*z + M_xxz*y + y*(-M_xxz - M_yyz)))
    S_yyzz    = -(S_xxyy + S_yyyy)
    S_yzzz    = -(S_xxyz + S_yyyz)
    S_zzzz    = -(S_xxzz + S_yyzz)
    S_xxxxx   = (5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5
    Ms_xxxxx  = Ms_xxxxx + (M_0*S_xxxxx + (1.0d0/945.0d0)*M_x*(2400*S_xxxx - 450*S_xxyy - 225*S_xxzz &
      - 225*S_yyyy - 225*S_yyzz) + (200.0d0/63.0d0)*M_xx*S_xxx + ( &
      40.0d0/63.0d0)*M_xxxx*x + (16.0d0/21.0d0)*M_xxxxx + (10.0d0/ &
      21.0d0)*(-M_xxxyy + x*(-M_xxyy - M_yyyy)) - 80.0d0/63.0d0*(M_xxxy &
      *y + M_xxxz*z) - 80.0d0/21.0d0*(M_xxy*S_xy + M_xxz*S_xz) - &
      100.0d0/21.0d0*(M_xy*S_xxy + M_xz*S_xxz) - 20.0d0/9.0d0*(M_y* &
      S_xxxy + M_z*S_xxxz) + (1.0d0/1890.0d0)*(M_xyy*(-4500*S_xx + 1800 &
      *S_yy) + M_yy*(-2100*S_xxx + 1800*S_xyy) + (-M_xx - M_yy)*(-3900* &
      S_xxx - 1800*S_xyy) + (-M_xxx - M_xyy)*(-6300*S_xx - 1800*S_yy)) &
      + (5.0d0/21.0d0)*(-M_xxxzz - M_xyyyy - M_xyyzz + M_yyyy*x + x*( &
      -M_xxzz - M_yyzz)) + (40.0d0/21.0d0)*(M_xxx*S_xx - M_xxyy*x + &
      M_xyz*S_yz + M_yz*S_xyz - x*(-M_xxxx - M_xxyy)) + (20.0d0/21.0d0) &
      *(M_xyyy*y + M_xyyz*z + M_yyy*S_xy + M_yyz*S_xz + S_xy*(-M_xxy - &
      M_yyy) + S_xz*(-M_xxz - M_yyz) + y*(-M_xxxy - M_xyyy) + z*( &
      -M_xxxz - M_xyyz)))
    S_xxxxy   = (1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y
    Ms_xxxxy  = Ms_xxxxy + (M_0*S_xxxxy + (8.0d0/3.0d0)*M_x*S_xxxy + (20.0d0/7.0d0)*M_xx*S_xxy - &
      12.0d0/7.0d0*M_xxyy*y - 24.0d0/7.0d0*M_xyy*S_xy + (1.0d0/5670.0d0 &
      )*M_yyy*(-3780*S_xx + 2160*S_yy) - 4.0d0/3.0d0*M_z*S_xxyz - 6.0d0 &
      /7.0d0*S_xx*(-M_xxy - M_yyy) + (2.0d0/7.0d0)*y*(-M_xxyy - M_yyyy &
      ) - 16.0d0/7.0d0*(M_xyz*S_xz + M_xz*S_xyz) + (4.0d0/7.0d0)*(M_yyz &
      *S_yz - y*(-M_xxxx - M_xxyy)) + (1.0d0/1890.0d0)*(M_xxy*(5400* &
      S_xx - 2160*S_yy) + M_yy*(-3780*S_xxy + 360*S_yyy) + (-M_xx - &
      M_yy)*(-1620*S_xxy - 360*S_yyy)) + (1.0d0/945.0d0)*(M_xy*(2520* &
      S_xxx - 2160*S_xyy) + M_y*(900*S_xxxx - 1350*S_xxyy - 45*S_xxzz - &
      45*S_yyyy - 45*S_yyzz) + M_yz*(-1260*S_xxz + 360*S_yyz)) - 8.0d0/ &
      7.0d0*(M_xxyz*z + M_xxz*S_yz + M_xyyy*x + S_xy*(-M_xxx - M_xyy) + &
      x*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(32*M_xxx*S_xy + 8*M_xxxx* &
      y + 20*M_xxxxy + 32*M_xxxy*x - 2*M_xxyyy - M_xxyzz + 5*M_yyyy*y - &
      M_yyyyy + 4*M_yyyz*z - M_yyyzz + 4*S_yz*(-M_xxz - M_yyz) + y*( &
      -M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz)))
    S_xxxxz   = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z
    Ms_xxxxz  = Ms_xxxxz + (M_0*S_xxxxz + (8.0d0/3.0d0)*M_x*S_xxxz + (20.0d0/7.0d0)*M_xx*S_xxz - &
      4.0d0/3.0d0*M_y*S_xxyz - 6.0d0/7.0d0*M_yyz*S_xx - 24.0d0/7.0d0* &
      S_xz*(-M_xxx - M_xyy) - 12.0d0/7.0d0*z*(-M_xxxx - M_xxyy) + ( &
      2.0d0/7.0d0)*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*(-M_xxz - &
      M_yyz)*(-5940*S_xx - 2160*S_yy) + (4.0d0/7.0d0)*(-M_xxyy*z + S_yz &
      *(-M_xxy - M_yyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz*S_xy) + ( &
      1.0d0/1890.0d0)*(M_xxz*(7560*S_xx + 2160*S_yy) + M_yy*(-1260* &
      S_xxz + 360*S_yyz) + (-M_xx - M_yy)*(-4140*S_xxz - 360*S_yyz)) + &
      (1.0d0/945.0d0)*(M_xz*(4680*S_xxx + 2160*S_xyy) + M_yz*(-1620* &
      S_xxy - 360*S_yyy) + M_z*(1980*S_xxxx + 810*S_xxyy - 225*S_xxzz - &
      225*S_yyyy - 225*S_yyzz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + x*(-M_xxxz - M_xyyz)) + (1.0d0/21.0d0)*( &
      32*M_xxx*S_xz + 8*M_xxxx*z + 20*M_xxxxz + 32*M_xxxz*x - 2*M_xxyyz &
      - M_xxzzz + 4*M_yyy*S_yz + M_yyyy*z - M_yyyyz + 4*M_yyyz*y - &
      M_yyzzz + 4*y*(-M_xxyz - M_yyyz) + 5*z*(-M_xxzz - M_yyzz)))
    S_xxxyy   = (1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x**3 &
      *y**2
    Ms_xxxyy  = Ms_xxxyy + (M_0*S_xxxyy + (1.0d0/5670.0d0)*M_xxx*(-3510*S_xx + 3780*S_yy) - 20.0d0/ &
      63.0d0*M_xxxx*x + (82.0d0/63.0d0)*M_xxxy*y - 2.0d0/63.0d0*M_xxxz* &
      z - 2.0d0/7.0d0*M_yyyy*x - 8.0d0/7.0d0*(M_xyyy*y + M_yyy*S_xy) + &
      (1.0d0/945.0d0)*(M_x*(-255*S_xxxx + 2115*S_xxyy - 45*S_xxzz - 45* &
      S_yyyy - 45*S_yyzz) + M_xy*(4140*S_xxy - 630*S_yyy) + M_xz*(-270* &
      S_xxz - 630*S_yyz) + M_y*(1680*S_xxxy - 630*S_xyyy) + M_z*(-210* &
      S_xxxz - 630*S_xyyz)) + (1.0d0/1890.0d0)*(M_xx*(-1110*S_xxx + &
      3780*S_xyy) + M_xyy*(4140*S_xx - 2790*S_yy) + M_yy*(1680*S_xxx - &
      2790*S_xyy) + (-M_xx - M_yy)*(-570*S_xxx - 990*S_xyy) + (-M_xxx - &
      M_xyy)*(-630*S_xx - 990*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxx + 19* &
      M_xxxyy - M_xxxzz + 82*M_xxy*S_xy + 41*M_xxyy*x - 2*M_xxz*S_xz - &
      M_xyyyy - 10*M_xyyz*z - M_xyyzz - 20*M_xyz*S_yz - 10*M_yyz*S_xz - &
      20*M_yz*S_xyz - 10*S_xy*(-M_xxy - M_yyy) + 4*S_xz*(-M_xxz - M_yyz &
      ) - x*(-M_xxxx - M_xxyy) - 5*x*(-M_xxyy - M_yyyy) + x*(-M_xxzz - &
      M_yyzz) - 10*y*(-M_xxxy - M_xyyy) + 4*z*(-M_xxxz - M_xyyz)))
    S_xxxyz   = -1.0d0/3.0d0*h*x*y*z + x**3*y*z
    Ms_xxxyz  = Ms_xxxyz + (M_0*S_xxxyz + (7.0d0/3.0d0)*M_x*S_xxyz + M_xxxyz + 3*M_xyz*S_xx + (5.0d0 &
      /3.0d0)*M_yz*S_xxx + (1.0d0/945.0d0)*(M_xy*(2205*S_xxz - 630* &
      S_yyz) + M_xz*(2835*S_xxy + 630*S_yyy) + M_y*(945*S_xxxz - 630* &
      S_xyyz) + M_z*(1575*S_xxxy + 630*S_xyyy)) + 2*(M_xx*S_xyz + 3* &
      M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz*y + M_xxy*S_xz + M_xxyz*x + &
      M_xxz*S_xy) - (M_xyy*S_yz + 3*M_xyyy*z + M_xyyz*y + M_yy*S_xyz + &
      3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy)))
    S_xxxzz   = -(S_xxxxx + S_xxxyy)
    S_xxyyy   = (1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x**2 &
      *y**3
    Ms_xxyyy  = Ms_xxyyy + (M_0*S_xxyyy - 2.0d0/7.0d0*M_xxxx*y + (82.0d0/63.0d0)*M_xyyy*x + (1.0d0/ &
      5670.0d0)*M_yyy*(3780*S_xx - 3510*S_yy) - 20.0d0/63.0d0*M_yyyy*y &
      - 2.0d0/63.0d0*M_yyyz*z - 8.0d0/7.0d0*(M_xxx*S_xy + M_xxxy*x) + ( &
      1.0d0/945.0d0)*(M_x*(-630*S_xxxy + 1680*S_xyyy) + M_xy*(-630* &
      S_xxx + 4140*S_xyy) + M_y*(-45*S_xxxx + 2115*S_xxyy - 45*S_xxzz - &
      255*S_yyyy - 45*S_yyzz) + M_yz*(-630*S_xxz - 270*S_yyz) + M_z*( &
      -630*S_xxyz - 210*S_yyyz)) + (1.0d0/1890.0d0)*(M_xx*(-2790*S_xxy &
      + 1680*S_yyy) + M_xxy*(-2790*S_xx + 4140*S_yy) + M_yy*(3780*S_xxy &
      - 1110*S_yyy) + (-M_xx - M_yy)*(-990*S_xxy - 570*S_yyy) + (-M_xxy &
      - M_yyy)*(-990*S_xx - 630*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxy + 41* &
      M_xxyy*y + 19*M_xxyyy - 10*M_xxyz*z - M_xxyzz - 10*M_xxz*S_yz + &
      82*M_xyy*S_xy - 20*M_xyz*S_xz - 20*M_xz*S_xyz - M_yyyyy - M_yyyzz &
      - 2*M_yyz*S_yz - 10*S_xy*(-M_xxx - M_xyy) + 4*S_yz*(-M_xxz - &
      M_yyz) - 10*x*(-M_xxxy - M_xyyy) - 5*y*(-M_xxxx - M_xxyy) - y*( &
      -M_xxyy - M_yyyy) + y*(-M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz &
      )))
    S_xxyyz   = (1.0d0/63.0d0)*h**2*z + x**2*y**2*z - 1.0d0/9.0d0*(h*x**2*z + h*y**2*z)
    Ms_xxyyz  = Ms_xxyyz + (M_0*S_xxyyz + (17.0d0/21.0d0)*M_xxyy*z + (61.0d0/63.0d0)*M_xxyyz + ( &
      5.0d0/63.0d0)*z*(-M_xxzz - M_yyzz) + (1.0d0/5670.0d0)*(-M_xxz - &
      M_yyz)*(-1350*S_xx - 1350*S_yy) - 2.0d0/21.0d0*(M_xxxx*z + M_yyyy &
      *z) + (68.0d0/21.0d0)*(M_xy*S_xyz + M_xyz*S_xy) - 10.0d0/21.0d0*( &
      S_xz*(-M_xxx - M_xyy) + S_yz*(-M_xxy - M_yyy)) - 5.0d0/21.0d0*(z* &
      (-M_xxxx - M_xxyy) + z*(-M_xxyy - M_yyyy)) - 8.0d0/21.0d0*(M_xxx* &
      S_xz + M_xxxz*x + M_yyy*S_yz + M_yyyz*y) + (34.0d0/21.0d0)*(M_xxy &
      *S_yz + M_xxyz*y + M_xyy*S_xz + M_xyyz*x) + (1.0d0/945.0d0)*(M_x* &
      (-210*S_xxxz + 1680*S_xyyz) + M_xz*(90*S_xxx + 1980*S_xyy) + M_y* &
      (1680*S_xxyz - 210*S_yyyz) + M_yz*(1980*S_xxy + 90*S_yyy) + M_z*( &
      135*S_xxxx + 1215*S_xxyy - 75*S_xxzz + 135*S_yyyy - 75*S_yyzz)) + &
      (1.0d0/1890.0d0)*(M_xx*(-930*S_xxz + 1680*S_yyz) + M_xxz*(-630* &
      S_xx + 1980*S_yy) + M_yy*(1680*S_xxz - 930*S_yyz) + M_yyz*(1980* &
      S_xx - 630*S_yy) + (-M_xx - M_yy)*(-750*S_xxz - 750*S_yyz)) - &
      1.0d0/63.0d0*(M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + 10*x*( &
      -M_xxxz - M_xyyz) + 10*y*(-M_xxyz - M_yyyz)))
    S_xxyzz   = -(S_xxxxy + S_xxyyy)
    S_xxzzz   = -(S_xxxxz + S_xxyyz)
    S_xyyyy   = (1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4
    Ms_xyyyy  = Ms_xyyyy + (M_0*S_xyyyy + (1.0d0/5670.0d0)*M_xxx*(2160*S_xx - 3780*S_yy) - 24.0d0/ &
      7.0d0*M_xxy*S_xy - 12.0d0/7.0d0*M_xxyy*x + (8.0d0/3.0d0)*M_y* &
      S_xyyy + (20.0d0/7.0d0)*M_yy*S_xyy - 4.0d0/3.0d0*M_z*S_xyyz - &
      6.0d0/7.0d0*S_yy*(-M_xxx - M_xyy) + (2.0d0/7.0d0)*x*(-M_xxxx - &
      M_xxyy) + (4.0d0/7.0d0)*(M_xxz*S_xz - x*(-M_xxyy - M_yyyy)) - &
      16.0d0/7.0d0*(M_xyz*S_yz + M_yz*S_xyz) + (1.0d0/945.0d0)*(M_x*( &
      -45*S_xxxx - 1350*S_xxyy - 45*S_xxzz + 900*S_yyyy - 45*S_yyzz) + &
      M_xy*(-2160*S_xxy + 2520*S_yyy) + M_xz*(360*S_xxz - 1260*S_yyz)) &
      + (1.0d0/1890.0d0)*(M_xx*(360*S_xxx - 3780*S_xyy) + M_xyy*(-2160* &
      S_xx + 5400*S_yy) + (-M_xx - M_yy)*(-360*S_xxx - 1620*S_xyy)) - &
      8.0d0/7.0d0*(M_xxxy*y + M_xyyz*z + M_yyz*S_xz + S_xy*(-M_xxy - &
      M_yyy) + y*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(5*M_xxxx*x - &
      M_xxxxx - 2*M_xxxyy + 4*M_xxxz*z - M_xxxzz + 32*M_xyyy*y + 20* &
      M_xyyyy - M_xyyzz + 32*M_yyy*S_xy + 8*M_yyyy*x + 4*S_xz*(-M_xxz - &
      M_yyz) + x*(-M_xxzz - M_yyzz) + 4*z*(-M_xxxz - M_xyyz)))
    S_xyyyz   = -1.0d0/3.0d0*h*x*y*z + x*y**3*z
    Ms_xyyyz  = Ms_xyyyz + (M_0*S_xyyyz + M_xyyyz + 3*M_xyz*S_yy + (5.0d0/3.0d0)*M_xz*S_yyy + (7.0d0 &
      /3.0d0)*M_y*S_xyyz + (1.0d0/945.0d0)*(M_x*(-630*S_xxyz + 945* &
      S_yyyz) + M_xy*(-630*S_xxz + 2205*S_yyz) + M_yz*(630*S_xxx + 2835 &
      *S_xyy) + M_z*(630*S_xxxy + 1575*S_xyyy)) + 2*(M_xyy*S_yz + 3* &
      M_xyyy*z + M_xyyz*y + M_yy*S_xyz + 3*M_yyy*S_xz + 3*M_yyyz*x + &
      M_yyz*S_xy) - (M_xx*S_xyz + 3*M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz* &
      y + M_xxy*S_xz + M_xxyz*x + M_xxz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy)))
    S_xyyzz   = -(S_xxxyy + S_xyyyy)
    S_xyzzz   = -(S_xxxyz + S_xyyyz)
    S_xzzzz   = -(S_xxxzz + S_xyyzz)
    S_yyyyy   = (5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5
    Ms_yyyyy  = Ms_yyyyy + (M_0*S_yyyyy + (1.0d0/945.0d0)*M_y*(-225*S_xxxx - 450*S_xxyy - 225*S_xxzz &
      + 2400*S_yyyy - 225*S_yyzz) + (200.0d0/63.0d0)*M_yy*S_yyy + ( &
      40.0d0/63.0d0)*M_yyyy*y + (16.0d0/21.0d0)*M_yyyyy + (10.0d0/ &
      21.0d0)*(-M_xxyyy + y*(-M_xxxx - M_xxyy)) - 20.0d0/9.0d0*(M_x* &
      S_xyyy + M_z*S_yyyz) - 100.0d0/21.0d0*(M_xy*S_xyy + M_yz*S_yyz) - &
      80.0d0/21.0d0*(M_xyy*S_xy + M_yyz*S_yz) - 80.0d0/63.0d0*(M_xyyy*x &
      + M_yyyz*z) + (1.0d0/1890.0d0)*(M_xx*(1800*S_xxy - 2100*S_yyy) + &
      M_xxy*(1800*S_xx - 4500*S_yy) + (-M_xx - M_yy)*(-1800*S_xxy - &
      3900*S_yyy) + (-M_xxy - M_yyy)*(-1800*S_xx - 6300*S_yy)) + (5.0d0 &
      /21.0d0)*(M_xxxx*y - M_xxxxy - M_xxyzz - M_yyyzz + y*(-M_xxzz - &
      M_yyzz)) + (40.0d0/21.0d0)*(-M_xxyy*y + M_xyz*S_xz + M_xz*S_xyz + &
      M_yyy*S_yy - y*(-M_xxyy - M_yyyy)) + (20.0d0/21.0d0)*(M_xxx*S_xy &
      + M_xxxy*x + M_xxyz*z + M_xxz*S_yz + S_xy*(-M_xxx - M_xyy) + S_yz &
      *(-M_xxz - M_yyz) + x*(-M_xxxy - M_xyyy) + z*(-M_xxyz - M_yyyz)))
    S_yyyyz   = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z
    Ms_yyyyz  = Ms_yyyyz + (M_0*S_yyyyz - 4.0d0/3.0d0*M_x*S_xyyz - 6.0d0/7.0d0*M_xxz*S_yy + (8.0d0/ &
      3.0d0)*M_y*S_yyyz + (20.0d0/7.0d0)*M_yy*S_yyz - 24.0d0/7.0d0*S_yz &
      *(-M_xxy - M_yyy) + (2.0d0/7.0d0)*z*(-M_xxxx - M_xxyy) - 12.0d0/ &
      7.0d0*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*(-M_xxz - M_yyz)*( &
      -2160*S_xx - 5940*S_yy) + (4.0d0/7.0d0)*(-M_xxyy*z + S_xz*(-M_xxx &
      - M_xyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz*S_xy) + (1.0d0/ &
      1890.0d0)*(M_xx*(360*S_xxz - 1260*S_yyz) + M_yyz*(2160*S_xx + &
      7560*S_yy) + (-M_xx - M_yy)*(-360*S_xxz - 4140*S_yyz)) + (1.0d0/ &
      945.0d0)*(M_xz*(-360*S_xxx - 1620*S_xyy) + M_yz*(2160*S_xxy + &
      4680*S_yyy) + M_z*(-225*S_xxxx + 810*S_xxyy - 225*S_xxzz + 1980* &
      S_yyyy - 225*S_yyzz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + y*(-M_xxyz - M_yyyz)) + (1.0d0/21.0d0)*(4 &
      *M_xxx*S_xz + M_xxxx*z - M_xxxxz + 4*M_xxxz*x - 2*M_xxyyz - &
      M_xxzzz + 32*M_yyy*S_yz + 8*M_yyyy*z + 20*M_yyyyz + 32*M_yyyz*y - &
      M_yyzzz + 4*x*(-M_xxxz - M_xyyz) + 5*z*(-M_xxzz - M_yyzz)))
    S_yyyzz   = -(S_xxyyy + S_yyyyy)
    S_yyzzz   = -(S_xxyyz + S_yyyyz)
    S_yzzzz   = -(S_xxyzz + S_yyyzz)
    S_zzzzz   = -(S_xxzzz + S_yyzzz)
    S_xxxxxx  = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*x**2 - 15.0d0/11.0d0*h*x**4 + &
      x**6
    Ms_xxxxxx = Ms_xxxxxx + (M_0*S_xxxxxx + (800.0d0/231.0d0)*M_xxx*S_xxx + (32.0d0/77.0d0)*M_xxxxx*x &
      + (136.0d0/231.0d0)*M_xxxxxx - 30.0d0/77.0d0*M_xxxxzz + (480.0d0/ &
      77.0d0)*M_xyz*S_xyz + (10.0d0/231.0d0)*M_yyyyyy + (5.0d0/77.0d0)* &
      M_yyyyzz + (40.0d0/11.0d0)*M_yz*S_xxyz + (90.0d0/77.0d0)*S_xx*( &
      -M_xxyy - M_yyyy) - 25.0d0/77.0d0*(M_xxyyyy + M_xxyyzz) + (5.0d0/ &
      231.0d0)*(M_xxzzzz + M_yyzzzz) - 80.0d0/77.0d0*(M_xxxxy*y + &
      M_xxxxz*z) - 320.0d0/77.0d0*(M_xxxy*S_xy + M_xxxz*S_xz) - 160.0d0 &
      /77.0d0*(M_xxxyy*x + x*(-M_xxxxx - M_xxxyy)) - 600.0d0/77.0d0*( &
      M_xxy*S_xxy + M_xxz*S_xxz) + (1.0d0/41580.0d0)*(M_xxyy*(-162000* &
      S_xx + 64800*S_yy) + (-M_xxxx - M_xxyy)*(-226800*S_xx - 64800* &
      S_yy)) - 80.0d0/11.0d0*(M_xy*S_xxxy + M_xz*S_xxxz) + (1.0d0/ &
      62370.0d0)*(M_yyy*(113400*S_xxy - 10800*S_yyy) + (-M_xxz - M_yyz) &
      *(124200*S_xxz + 10800*S_yyz)) + (1.0d0/249480.0d0)*(M_yyyy*( &
      113400*S_xx - 64800*S_yy) + (-M_xxzz - M_yyzz)*(178200*S_xx + &
      64800*S_yy)) - 40.0d0/77.0d0*(M_yyyz*S_yz + S_yz*(-M_xxyz - &
      M_yyyz)) - 20.0d0/77.0d0*(y*(-M_xxyyy - M_yyyyy) + z*(-M_xxyyz - &
      M_yyyyz)) + (60.0d0/77.0d0)*(-M_xxxxyy + M_xyyyy*x + x*(-M_xxxzz &
      - M_xyyzz)) + (1.0d0/10395.0d0)*(M_x*(25920*S_xxxxx - 16200* &
      S_xxxyy - 8100*S_xxxzz - 8100*S_xyyyy - 8100*S_xyyzz) + M_y*( &
      -27000*S_xxxxy + 2700*S_xxyyy + 1350*S_xxyzz + 1350*S_yyyyy + &
      1350*S_yyyzz) + M_z*(-27000*S_xxxxz + 2700*S_xxyyz + 1350*S_xxzzz &
      + 1350*S_yyyyz + 1350*S_yyzzz)) - 10.0d0/77.0d0*(M_yyyyy*y + &
      M_yyyyz*z + y*(-M_xxyzz - M_yyyzz) + z*(-M_xxzzz - M_yyzzz)) + ( &
      240.0d0/77.0d0)*(M_xxyz*S_yz + M_xyyy*S_xy + M_xyyz*S_xz + S_xy*( &
      -M_xxxy - M_xyyy) + S_xz*(-M_xxxz - M_xyyz)) + (120.0d0/77.0d0)*( &
      M_xxxx*S_xx + M_xxyyy*y + M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y* &
      (-M_xxxxy - M_xxyyy) + z*(-M_xxxxz - M_xxyyz)) + (1.0d0/20790.0d0 &
      )*(M_xx*(86400*S_xxxx - 16200*S_xxyy - 8100*S_xxzz - 8100*S_yyyy &
      - 8100*S_yyzz) + M_xyy*(-75600*S_xxx + 64800*S_xyy) + M_yy*( &
      -27000*S_xxxx + 40500*S_xxyy + 1350*S_xxzz + 1350*S_yyyy + 1350* &
      S_yyzz) + M_yyz*(37800*S_xxz - 10800*S_yyz) + (-M_xx - M_yy)*( &
      -59400*S_xxxx - 24300*S_xxyy + 6750*S_xxzz + 6750*S_yyyy + 6750* &
      S_yyzz) + (-M_xxx - M_xyy)*(-140400*S_xxx - 64800*S_xyy) + ( &
      -M_xxy - M_yyy)*(48600*S_xxy + 10800*S_yyy)))
    S_xxxxxy  = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x**3*y + x**5*y
    Ms_xxxxxy = Ms_xxxxxy + (M_0*S_xxxxxy + (100.0d0/33.0d0)*M_xxx*S_xxy + (8.0d0/33.0d0)*M_xxxxx*y + &
      (28.0d0/33.0d0)*M_xxxxxy - 60.0d0/11.0d0*M_xxyy*S_xy - 30.0d0/ &
      11.0d0*S_xx*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_xxx*(-M_xxy - &
      M_yyy) + (10.0d0/33.0d0)*(-M_xxxyyy + x*(-M_xxyyy - M_yyyyy)) + ( &
      140.0d0/33.0d0)*(M_xx*S_xxxy - M_xz*S_xxyz) - 40.0d0/11.0d0*( &
      M_xxyz*S_xz + M_xxz*S_xyz) + (25.0d0/33.0d0)*(M_xyyyy*y + M_yyyy* &
      S_xy) + (10.0d0/11.0d0)*(S_xy*(-M_xxyy - M_yyyy) + y*(-M_xxxyy - &
      M_xyyyy)) + (1.0d0/62370.0d0)*(M_xxxy*(189000*S_xx - 75600*S_yy) &
      + M_xyyy*(-132300*S_xx + 75600*S_yy) + M_yyy*(-56700*S_xxx + &
      75600*S_xyy)) + (40.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x - &
      M_xxxyz*z - M_xxxz*S_yz) + (1.0d0/10395.0d0)*(M_x*(31500*S_xxxxy &
      - 3150*S_xxyyy - 1575*S_xxyzz - 1575*S_yyyyy - 1575*S_yyyzz) + &
      M_xy*(31500*S_xxxx - 47250*S_xxyy - 1575*S_xxzz - 1575*S_yyyy - &
      1575*S_yyzz) + M_xyz*(-44100*S_xxz + 12600*S_yyz) + M_y*(8820* &
      S_xxxxx - 22050*S_xxxyy - 1575*S_xxxzz - 1575*S_xyyyy - 1575* &
      S_xyyzz) + M_yz*(-18900*S_xxxz + 12600*S_xyyz)) + (1.0d0/ &
      20790.0d0)*(M_xxy*(88200*S_xxx - 75600*S_xyy) + M_xyy*(-132300* &
      S_xxy + 12600*S_yyy) + M_yy*(-56700*S_xxxy + 12600*S_xyyy) + ( &
      -M_xx - M_yy)*(-31500*S_xxxy - 12600*S_xyyy) + (-M_xxx - M_xyy)*( &
      -56700*S_xxy - 12600*S_yyy)) + (5.0d0/33.0d0)*(-M_xxxyzz - &
      M_xyyyyy - M_xyyyzz + M_yyyyy*x + S_xy*(-M_xxzz - M_yyzz) + x*( &
      -M_xxyzz - M_yyyzz) + y*(-M_xxxzz - M_xyyzz)) + (20.0d0/11.0d0)*( &
      -M_xxxyy*y - M_xxyyy*x + M_xyyz*S_yz + M_yyz*S_xyz - M_z*S_xxxyz &
      - S_xy*(-M_xxxx - M_xxyy) - x*(-M_xxxxy - M_xxyyy)) + (20.0d0/ &
      33.0d0)*(M_xyyyz*z + M_yyyz*S_xz + S_xyz*(-M_xxz - M_yyz) + S_xz* &
      (-M_xxyz - M_yyyz) + S_yz*(-M_xxxz - M_xyyz) - y*(-M_xxxxx - &
      M_xxxyy) + z*(-M_xxxyz - M_xyyyz)))
    S_xxxxxz  = (5.0d0/33.0d0)*h**2*x*z - 10.0d0/11.0d0*h*x**3*z + x**5*z
    Ms_xxxxxz = Ms_xxxxxz + (M_0*S_xxxxxz + (100.0d0/33.0d0)*M_xxx*S_xxz + (8.0d0/33.0d0)*M_xxxxx*z + &
      (28.0d0/33.0d0)*M_xxxxxz - 30.0d0/11.0d0*M_xyyz*S_xx - 50.0d0/ &
      33.0d0*M_yyz*S_xxx - 60.0d0/11.0d0*S_xz*(-M_xxxx - M_xxyy) + ( &
      10.0d0/33.0d0)*(-M_xxxyyz + x*(-M_xxyyz - M_yyyyz)) + (140.0d0/ &
      33.0d0)*(M_xx*S_xxxz - M_xy*S_xxyz) - 40.0d0/11.0d0*(M_xxy*S_xyz &
      + M_xxyz*S_xy) + (10.0d0/11.0d0)*(S_xz*(-M_xxyy - M_yyyy) + z*( &
      -M_xxxyy - M_xyyyy)) + (25.0d0/33.0d0)*(S_xz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxxzz - M_xyyzz)) + (1.0d0/62370.0d0)*(M_xxxz*(264600*S_xx &
      + 75600*S_yy) + (-M_xxxz - M_xyyz)*(-207900*S_xx - 75600*S_yy) + &
      (-M_xxz - M_yyz)*(-132300*S_xxx - 75600*S_xyy)) + (40.0d0/33.0d0) &
      *(M_xxxx*S_xz + M_xxxxz*x - M_xxxy*S_yz - M_xxxyz*y) + (1.0d0/ &
      10395.0d0)*(M_x*(31500*S_xxxxz - 3150*S_xxyyz - 1575*S_xxzzz - &
      1575*S_yyyyz - 1575*S_yyzzz) + M_xyz*(-56700*S_xxy - 12600*S_yyy &
      ) + M_xz*(69300*S_xxxx + 28350*S_xxyy - 7875*S_xxzz - 7875*S_yyyy &
      - 7875*S_yyzz) + M_yz*(-31500*S_xxxy - 12600*S_xyyy) + M_z*(21420 &
      *S_xxxxx + 3150*S_xxxyy - 7875*S_xxxzz - 7875*S_xyyyy - 7875* &
      S_xyyzz)) + (1.0d0/20790.0d0)*(M_xxz*(163800*S_xxx + 75600*S_xyy &
      ) + M_xyy*(-44100*S_xxz + 12600*S_yyz) + M_yy*(-18900*S_xxxz + &
      12600*S_xyyz) + (-M_xx - M_yy)*(-69300*S_xxxz - 12600*S_xyyz) + ( &
      -M_xxx - M_xyy)*(-144900*S_xxz - 12600*S_yyz)) + (5.0d0/33.0d0)*( &
      -M_xxxzzz + M_xyyyy*z - M_xyyyyz - M_xyyzzz + M_yyyy*S_xz + &
      M_yyyyz*x + x*(-M_xxzzz - M_yyzzz)) + (20.0d0/33.0d0)*(-M_xxxyy*z &
      + M_xyyy*S_yz + M_xyyyz*y + M_yyy*S_xyz + M_yyyz*S_xy + S_xy*( &
      -M_xxyz - M_yyyz) + y*(-M_xxxyz - M_xyyyz)) + (20.0d0/11.0d0)*( &
      -M_xxyy*S_xz - M_xxyyz*x - M_y*S_xxxyz + S_xyz*(-M_xxy - M_yyy) + &
      S_yz*(-M_xxxy - M_xyyy) - x*(-M_xxxxz - M_xxyyz) - z*(-M_xxxxx - &
      M_xxxyy)))
    S_xxxxyy  = -1.0d0/231.0d0*h**3 + x**4*y**2 - 1.0d0/11.0d0*(h*x**4 + 6*h*x**2*y**2) &
      + (1.0d0/33.0d0)*(2*h**2*x**2 + h**2*y**2)
    Ms_xxxxyy = Ms_xxxxyy + (M_0*S_xxxxyy - 16.0d0/77.0d0*M_xxxxx*x - 4.0d0/77.0d0*M_xxxxxx - 5.0d0/ &
      77.0d0*M_xxyyzz - 240.0d0/77.0d0*M_xyz*S_xyz + (12.0d0/77.0d0)* &
      M_yyyyy*y - 2.0d0/77.0d0*z*(-M_xxzzz - M_yyzzz) - 1.0d0/21.0d0*( &
      M_xxxxzz + 2*M_xxyyyy) + (2.0d0/21.0d0)*(M_yyyyz*z + x*(-M_xxxzz &
      - M_xyyzz)) + (8.0d0/21.0d0)*(M_yyyz*S_yz + S_xz*(-M_xxxz - &
      M_xyyz)) + (4.0d0/21.0d0)*(y*(-M_xxyyy - M_yyyyy) + z*(-M_xxxxz - &
      M_xxyyz)) + (1.0d0/62370.0d0)*(M_xxx*(-47520*S_xxx + 120960*S_xyy &
      ) + M_yyy*(-120960*S_xxy + 20520*S_yyy) + (-M_xxz - M_yyz)*(17280 &
      *S_xxz + 9720*S_yyz)) + (1.0d0/249480.0d0)*(M_xxxx*(-133920*S_xx &
      + 120960*S_yy) + M_yyyy*(-120960*S_xx + 85320*S_yy) + (-M_xxzz - &
      M_yyzz)*(28080*S_xx + 20520*S_yy)) + (1.0d0/41580.0d0)*(M_xxyy*( &
      141480*S_xx - 92880*S_yy) + (-M_xxxx - M_xxyy)*(-7560*S_xx - &
      28080*S_yy) + (-M_xxyy - M_yyyy)*(-20520*S_xx + 7560*S_yy)) - &
      60.0d0/77.0d0*(M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y*(-M_xxxxy - &
      M_xxyyy)) - 120.0d0/77.0d0*(M_xxyz*S_yz + M_xyyz*S_xz + S_xy*( &
      -M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_x*(-2880*S_xxxxx + &
      28260*S_xxxyy - 990*S_xxxzz - 990*S_xyyyy - 990*S_xyyzz) + M_xy*( &
      57960*S_xxxy - 20160*S_xyyy) + M_xz*(-2520*S_xxxz - 20160*S_xyyz &
      ) + M_y*(18540*S_xxxxy - 12060*S_xxyyy - 360*S_xxyzz - 360* &
      S_yyyyy - 360*S_yyyzz) + M_yz*(-17640*S_xxyz + 2520*S_yyyz) + M_z &
      *(-1620*S_xxxxz - 10800*S_xxyyz + 270*S_xxzzz + 270*S_yyyyz + 270 &
      *S_yyzzz)) + (1.0d0/20790.0d0)*(M_xx*(-12960*S_xxxx + 68580* &
      S_xxyy - 990*S_xxzz - 990*S_yyyy - 990*S_yyzz) + M_xxy*(141480* &
      S_xxy - 20160*S_yyy) + M_xxz*(360*S_xxz - 20160*S_yyz) + M_xyy*( &
      57960*S_xxx - 92880*S_xyy) + M_yy*(18540*S_xxxx - 52380*S_xxyy - &
      360*S_xxzz + 2160*S_yyyy - 360*S_yyzz) + M_yyz*(-17640*S_xxz + &
      10440*S_yyz) + (-M_xx - M_yy)*(-5580*S_xxxx - 16200*S_xxyy + 1350 &
      *S_xxzz - 1170*S_yyyy + 1350*S_yyzz) + (-M_xxx - M_xyy)*(-10440* &
      S_xxx - 28080*S_xyy) + (-M_xxy - M_yyy)*(-20520*S_xxy - 360*S_yyy &
      )) + (1.0d0/231.0d0)*(232*M_xxxxy*y + 202*M_xxxxyy + 8*M_xxxxz*z &
      + 928*M_xxxy*S_xy + 464*M_xxxyy*x + 32*M_xxxz*S_xz - 404*M_xxyyy* &
      y + M_xxzzzz - 808*M_xyyy*S_xy - 202*M_xyyyy*x - 5*M_yyyyyy - 4* &
      M_yyyyzz + M_yyzzzz + 32*S_yz*(-M_xxyz - M_yyyz) + 16*x*(-M_xxxxx &
      - M_xxxyy) + 8*y*(-M_xxyzz - M_yyyzz) + 16*z*(-M_xxyyz - M_yyyyz &
      )))
    S_xxxxyz  = (1.0d0/33.0d0)*h**2*y*z - 6.0d0/11.0d0*h*x**2*y*z + x**4*y*z
    Ms_xxxxyz = Ms_xxxxyz + (M_0*S_xxxxyz + (48.0d0/11.0d0)*M_xxyz*S_xx + (6.0d0/11.0d0)*S_yz*( &
      -M_xxyy - M_yyyy) + (2.0d0/11.0d0)*(y*(-M_xxyyz - M_yyyyz) + z*( &
      -M_xxyyy - M_yyyyy)) - 16.0d0/11.0d0*(M_xxyy*S_yz + M_xxyyz*y + &
      S_yz*(-M_xxxx - M_xxyy) + z*(-M_xxxxy - M_xxyyy)) + (1.0d0/ &
      62370.0d0)*(M_yyy*(-34020*S_xxz + 15120*S_yyz) + M_yyyz*(-41580* &
      S_xx + 7560*S_yy) + (-M_xxyz - M_yyyz)*(-49140*S_xx - 7560*S_yy) &
      + (-M_xxz - M_yyz)*(-49140*S_xxy - 15120*S_yyy)) + (32.0d0/11.0d0 &
      )*(M_x*S_xxxyz - M_xyy*S_xyz - M_xyyz*S_xy - S_xyz*(-M_xxx - &
      M_xyy) - S_xz*(-M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_xy*( &
      30240*S_xxxz - 20160*S_xyyz) + M_xz*(50400*S_xxxy + 20160*S_xyyy &
      ) + M_y*(10080*S_xxxxz - 11970*S_xxyyz - 315*S_xxzzz - 315* &
      S_yyyyz - 315*S_yyzzz) + M_yz*(20160*S_xxxx - 5670*S_xxyy - 1575* &
      S_xxzz - 4095*S_yyyy - 1575*S_yyzz) + M_z*(20160*S_xxxxy + 8190* &
      S_xxyyy - 1575*S_xxyzz - 1575*S_yyyyy - 1575*S_yyyzz)) + (1.0d0/ &
      20790.0d0)*(M_xxy*(70560*S_xxz - 20160*S_yyz) + M_xxz*(90720* &
      S_xxy + 20160*S_yyy) + M_yy*(-34020*S_xxyz + 2520*S_yyyz) + M_yyz &
      *(-41580*S_xxy - 5040*S_yyy) + (-M_xx - M_yy)*(-36540*S_xxyz - &
      2520*S_yyyz) + (-M_xxy - M_yyy)*(-36540*S_xxz + 5040*S_yyz)) + ( &
      1.0d0/33.0d0)*(112*M_xx*S_xxyz + 64*M_xxx*S_xyz + 16*M_xxxx*S_yz &
      + 16*M_xxxxy*z + 32*M_xxxxyz + 16*M_xxxxz*y + 64*M_xxxy*S_xz + 64 &
      *M_xxxyz*x + 64*M_xxxz*S_xy - 16*M_xxyyy*z - 2*M_xxyyyz - &
      M_xxyzzz - 32*M_xyyy*S_xz - 32*M_xyyyz*x + 160*M_xyz*S_xxx + 5* &
      M_yyyy*S_yz + M_yyyyy*z - M_yyyyyz + 5*M_yyyyz*y - M_yyyzzz - 32* &
      S_xy*(-M_xxxz - M_xyyz) + 5*S_yz*(-M_xxzz - M_yyzz) - 32*x*( &
      -M_xxxyz - M_xyyyz) - 16*y*(-M_xxxxz - M_xxyyz) + y*(-M_xxzzz - &
      M_yyzzz) + 5*z*(-M_xxyzz - M_yyyzz)))
    S_xxxyyy  = x**3*y**3 + (1.0d0/11.0d0)*(h**2*x*y - 3*h*x**3*y - 3*h*x*y**3)
    Ms_xxxyyy = Ms_xxxyyy + (M_0*S_xxxyyy + (1.0d0/62370.0d0)*(M_xxx*(-107730*S_xxy + 45360*S_yyy) + &
      M_xxxy*(-107730*S_xx + 124740*S_yy) + M_xyyy*(124740*S_xx - &
      107730*S_yy) + M_yyy*(45360*S_xxx - 107730*S_xyy)) + (1.0d0/ &
      10395.0d0)*(M_x*(-6615*S_xxxxy + 23625*S_xxyyy - 945*S_xxyzz - &
      945*S_yyyyy - 945*S_yyyzz) + M_xy*(-6615*S_xxxx + 65205*S_xxyy - &
      945*S_xxzz - 6615*S_yyyy - 945*S_yyzz) + M_xyz*(-9450*S_xxz - &
      9450*S_yyz) + M_xz*(-9450*S_xxyz - 5670*S_yyyz) + M_y*(-945* &
      S_xxxxx + 23625*S_xxxyy - 945*S_xxxzz - 6615*S_xyyyy - 945* &
      S_xyyzz) + M_yz*(-5670*S_xxxz - 9450*S_xyyz) + M_z*(-5670*S_xxxyz &
      - 5670*S_xyyyz)) + (1.0d0/20790.0d0)*(M_xx*(-32130*S_xxxy + 45360 &
      *S_xyyy) + M_xxy*(-32130*S_xxx + 124740*S_xyy) + M_xyy*(124740* &
      S_xxy - 32130*S_yyy) + M_yy*(45360*S_xxxy - 32130*S_xyyy) + ( &
      -M_xx - M_yy)*(-13230*S_xxxy - 13230*S_xyyy) + (-M_xxx - M_xyy)*( &
      -17010*S_xxy - 13230*S_yyy) + (-M_xxxy - M_xyyy)*(-17010*S_xx - &
      17010*S_yy) + (-M_xxy - M_yyy)*(-13230*S_xxx - 17010*S_xyy)) + ( &
      1.0d0/11.0d0)*(-10*M_xxxx*S_xy - 2*M_xxxxx*y - M_xxxxxy - 10* &
      M_xxxxy*x + 21*M_xxxyy*y + 9*M_xxxyyy - 2*M_xxxyz*z - M_xxxyzz - &
      2*M_xxxz*S_yz + 63*M_xxyy*S_xy + 21*M_xxyyy*x - 6*M_xxyz*S_xz - 6 &
      *M_xxz*S_xyz - 10*M_xyyyy*y - M_xyyyyy - 2*M_xyyyz*z - M_xyyyzz - &
      6*M_xyyz*S_yz - 10*M_yyyy*S_xy - 2*M_yyyyy*x - 2*M_yyyz*S_xz - 6* &
      M_yyz*S_xyz - 3*S_xy*(-M_xxxx - M_xxyy) - 3*S_xy*(-M_xxyy - &
      M_yyyy) + S_xy*(-M_xxzz - M_yyzz) + 4*S_xyz*(-M_xxz - M_yyz) + 4* &
      S_xz*(-M_xxyz - M_yyyz) + 4*S_yz*(-M_xxxz - M_xyyz) - 3*x*( &
      -M_xxxxy - M_xxyyy) - x*(-M_xxyyy - M_yyyyy) + x*(-M_xxyzz - &
      M_yyyzz) - y*(-M_xxxxx - M_xxxyy) - 3*y*(-M_xxxyy - M_xyyyy) + y* &
      (-M_xxxzz - M_xyyzz) + 4*z*(-M_xxxyz - M_xyyyz)))
    S_xxxyyz  = (1.0d0/33.0d0)*h**2*x*z + x**3*y**2*z - 1.0d0/11.0d0*(h*x**3*z + 3*h*x*y &
      **2*z)
    Ms_xxxyyz = Ms_xxxyyz + (M_0*S_xxxyyz + (46.0d0/11.0d0)*(M_xxy*S_xyz + M_xxyz*S_xy) + (23.0d0/ &
      11.0d0)*(M_xxyy*S_xz + M_xxyyz*x) + (1.0d0/62370.0d0)*(M_xxx*( &
      -35910*S_xxz + 45360*S_yyz) + M_xxxz*(-32130*S_xx + 49140*S_yy) + &
      (-M_xxxz - M_xyyz)*(-24570*S_xx - 32130*S_yy) + (-M_xxz - M_yyz)* &
      (-20790*S_xxx - 32130*S_xyy)) + (1.0d0/10395.0d0)*(M_x*(-2205* &
      S_xxxxz + 24885*S_xxyyz - 315*S_xxzzz - 315*S_yyyyz - 315*S_yyzzz &
      ) + M_xy*(47880*S_xxyz - 5670*S_yyyz) + M_xyz*(56700*S_xxy + 3150 &
      *S_yyy) + M_xz*(-315*S_xxxx + 31185*S_xxyy - 1575*S_xxzz + 4095* &
      S_yyyy - 1575*S_yyzz) + M_y*(18900*S_xxxyz - 5670*S_xyyyz) + M_yz &
      *(27720*S_xxxy + 3150*S_xyyy) + M_z*(315*S_xxxxx + 14805*S_xxxyy &
      - 1575*S_xxxzz + 4095*S_xyyyy - 1575*S_xyyzz)) - 1.0d0/11.0d0*(14 &
      *S_xyz*(-M_xxy - M_yyy) + 3*S_xz*(-M_xxxx - M_xxyy) + 7*S_xz*( &
      -M_xxyy - M_yyyy) + 14*S_yz*(-M_xxxy - M_xyyy) + x*(-M_xxxxz - &
      M_xxyyz) + z*(-M_xxxxx - M_xxxyy) + 7*z*(-M_xxxyy - M_xyyyy)) + ( &
      1.0d0/20790.0d0)*(M_xx*(-10710*S_xxxz + 45360*S_xyyz) + M_xxz*( &
      -6930*S_xxx + 49140*S_xyy) + M_xyy*(47880*S_xxz - 25830*S_yyz) + &
      M_xyyz*(56700*S_xx - 17010*S_yy) + M_yy*(18900*S_xxxz - 25830* &
      S_xyyz) + M_yyz*(27720*S_xxx - 17010*S_xyy) + (-M_xx - M_yy)*( &
      -8190*S_xxxz - 19530*S_xyyz) + (-M_xxx - M_xyy)*(-11970*S_xxz - &
      19530*S_yyz)) + (1.0d0/33.0d0)*(-10*M_xxxx*S_xz - 2*M_xxxxx*z - &
      M_xxxxxz - 10*M_xxxxz*x + 46*M_xxxy*S_yz + 23*M_xxxyy*z + 31* &
      M_xxxyyz + 46*M_xxxyz*y - M_xxxzzz - 32*M_xyyy*S_yz - 8*M_xyyyy*z &
      - M_xyyyyz - 32*M_xyyyz*y - M_xyyzzz - 32*M_yyy*S_xyz - 8*M_yyyy* &
      S_xz - 8*M_yyyyz*x - 32*M_yyyz*S_xy - 14*S_xy*(-M_xxyz - M_yyyz) &
      + 5*S_xz*(-M_xxzz - M_yyzz) - 7*x*(-M_xxyyz - M_yyyyz) + x*( &
      -M_xxzzz - M_yyzzz) - 14*y*(-M_xxxyz - M_xyyyz) + 5*z*(-M_xxxzz - &
      M_xyyzz)))
    S_xxyyyy  = -1.0d0/231.0d0*h**3 + x**2*y**4 + (1.0d0/33.0d0)*(h**2*x**2 + 2*h**2*y** &
      2) - 1.0d0/11.0d0*(6*h*x**2*y**2 + h*y**4)
    Ms_xxyyyy = Ms_xxyyyy + (M_0*S_xxyyyy + (12.0d0/77.0d0)*M_xxxxx*x - 5.0d0/77.0d0*M_xxyyzz - &
      240.0d0/77.0d0*M_xyz*S_xyz - 16.0d0/77.0d0*M_yyyyy*y - 4.0d0/ &
      77.0d0*M_yyyyyy - 2.0d0/77.0d0*z*(-M_xxzzz - M_yyzzz) - 1.0d0/ &
      21.0d0*(2*M_xxxxyy + M_yyyyzz) + (2.0d0/21.0d0)*(M_xxxxz*z + y*( &
      -M_xxyzz - M_yyyzz)) + (8.0d0/21.0d0)*(M_xxxz*S_xz + S_yz*( &
      -M_xxyz - M_yyyz)) + (4.0d0/21.0d0)*(x*(-M_xxxxx - M_xxxyy) + z*( &
      -M_xxyyz - M_yyyyz)) + (1.0d0/62370.0d0)*(M_xxx*(20520*S_xxx - &
      120960*S_xyy) + M_yyy*(120960*S_xxy - 47520*S_yyy) + (-M_xxz - &
      M_yyz)*(9720*S_xxz + 17280*S_yyz)) + (1.0d0/249480.0d0)*(M_xxxx*( &
      85320*S_xx - 120960*S_yy) + M_yyyy*(120960*S_xx - 133920*S_yy) + &
      (-M_xxzz - M_yyzz)*(20520*S_xx + 28080*S_yy)) + (1.0d0/41580.0d0) &
      *(M_xxyy*(-92880*S_xx + 141480*S_yy) + (-M_xxxx - M_xxyy)*(7560* &
      S_xx - 20520*S_yy) + (-M_xxyy - M_yyyy)*(-28080*S_xx - 7560*S_yy &
      )) - 60.0d0/77.0d0*(M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y*( &
      -M_xxxxy - M_xxyyy)) - 120.0d0/77.0d0*(M_xxyz*S_yz + M_xyyz*S_xz &
      + S_xy*(-M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_x*(-360*S_xxxxx &
      - 12060*S_xxxyy - 360*S_xxxzz + 18540*S_xyyyy - 360*S_xyyzz) + &
      M_xy*(-20160*S_xxxy + 57960*S_xyyy) + M_xz*(2520*S_xxxz - 17640* &
      S_xyyz) + M_y*(-990*S_xxxxy + 28260*S_xxyyy - 990*S_xxyzz - 2880* &
      S_yyyyy - 990*S_yyyzz) + M_yz*(-20160*S_xxyz - 2520*S_yyyz) + M_z &
      *(270*S_xxxxz - 10800*S_xxyyz + 270*S_xxzzz - 1620*S_yyyyz + 270* &
      S_yyzzz)) + (1.0d0/20790.0d0)*(M_xx*(2160*S_xxxx - 52380*S_xxyy - &
      360*S_xxzz + 18540*S_yyyy - 360*S_yyzz) + M_xxy*(-92880*S_xxy + &
      57960*S_yyy) + M_xxz*(10440*S_xxz - 17640*S_yyz) + M_xyy*(-20160* &
      S_xxx + 141480*S_xyy) + M_yy*(-990*S_xxxx + 68580*S_xxyy - 990* &
      S_xxzz - 12960*S_yyyy - 990*S_yyzz) + M_yyz*(-20160*S_xxz + 360* &
      S_yyz) + (-M_xx - M_yy)*(-1170*S_xxxx - 16200*S_xxyy + 1350* &
      S_xxzz - 5580*S_yyyy + 1350*S_yyzz) + (-M_xxx - M_xyy)*(-360* &
      S_xxx - 20520*S_xyy) + (-M_xxy - M_yyy)*(-28080*S_xxy - 10440* &
      S_yyy)) + (1.0d0/231.0d0)*(-5*M_xxxxxx - 202*M_xxxxy*y - 4* &
      M_xxxxzz - 808*M_xxxy*S_xy - 404*M_xxxyy*x + 464*M_xxyyy*y + 202* &
      M_xxyyyy + M_xxzzzz + 928*M_xyyy*S_xy + 232*M_xyyyy*x + 8*M_yyyyz &
      *z + 32*M_yyyz*S_yz + M_yyzzzz + 32*S_xz*(-M_xxxz - M_xyyz) + 8*x &
      *(-M_xxxzz - M_xyyzz) + 16*y*(-M_xxyyy - M_yyyyy) + 16*z*( &
      -M_xxxxz - M_xxyyz)))
    S_xxyyyz  = (1.0d0/33.0d0)*h**2*y*z + x**2*y**3*z - 1.0d0/11.0d0*(3*h*x**2*y*z + h*y &
      **3*z)
    Ms_xxyyyz = Ms_xxyyyz + (M_0*S_xxyyyz + (23.0d0/11.0d0)*(M_xxyy*S_yz + M_xxyyz*y) + (46.0d0/ &
      11.0d0)*(M_xyy*S_xyz + M_xyyz*S_xy) + (1.0d0/62370.0d0)*(M_yyy*( &
      45360*S_xxz - 35910*S_yyz) + M_yyyz*(49140*S_xx - 32130*S_yy) + ( &
      -M_xxyz - M_yyyz)*(-32130*S_xx - 24570*S_yy) + (-M_xxz - M_yyz)*( &
      -32130*S_xxy - 20790*S_yyy)) + (1.0d0/10395.0d0)*(M_x*(-5670* &
      S_xxxyz + 18900*S_xyyyz) + M_xy*(-5670*S_xxxz + 47880*S_xyyz) + &
      M_xyz*(3150*S_xxx + 56700*S_xyy) + M_xz*(3150*S_xxxy + 27720* &
      S_xyyy) + M_y*(-315*S_xxxxz + 24885*S_xxyyz - 315*S_xxzzz - 2205* &
      S_yyyyz - 315*S_yyzzz) + M_yz*(4095*S_xxxx + 31185*S_xxyy - 1575* &
      S_xxzz - 315*S_yyyy - 1575*S_yyzz) + M_z*(4095*S_xxxxy + 14805* &
      S_xxyyy - 1575*S_xxyzz + 315*S_yyyyy - 1575*S_yyyzz)) - 1.0d0/ &
      11.0d0*(14*S_xyz*(-M_xxx - M_xyy) + 14*S_xz*(-M_xxxy - M_xyyy) + &
      7*S_yz*(-M_xxxx - M_xxyy) + 3*S_yz*(-M_xxyy - M_yyyy) + y*( &
      -M_xxyyz - M_yyyyz) + 7*z*(-M_xxxxy - M_xxyyy) + z*(-M_xxyyy - &
      M_yyyyy)) + (1.0d0/20790.0d0)*(M_xx*(-25830*S_xxyz + 18900*S_yyyz &
      ) + M_xxy*(-25830*S_xxz + 47880*S_yyz) + M_xxyz*(-17010*S_xx + &
      56700*S_yy) + M_xxz*(-17010*S_xxy + 27720*S_yyy) + M_yy*(45360* &
      S_xxyz - 10710*S_yyyz) + M_yyz*(49140*S_xxy - 6930*S_yyy) + ( &
      -M_xx - M_yy)*(-19530*S_xxyz - 8190*S_yyyz) + (-M_xxy - M_yyy)*( &
      -19530*S_xxz - 11970*S_yyz)) + (1.0d0/33.0d0)*(-32*M_xxx*S_xyz - &
      8*M_xxxx*S_yz - 8*M_xxxxy*z - M_xxxxyz - 8*M_xxxxz*y - 32*M_xxxy* &
      S_xz - 32*M_xxxyz*x - 32*M_xxxz*S_xy + 23*M_xxyyy*z + 31*M_xxyyyz &
      - M_xxyzzz + 46*M_xyyy*S_xz + 46*M_xyyyz*x - 10*M_yyyy*S_yz - 2* &
      M_yyyyy*z - M_yyyyyz - 10*M_yyyyz*y - M_yyyzzz - 14*S_xy*(-M_xxxz &
      - M_xyyz) + 5*S_yz*(-M_xxzz - M_yyzz) - 14*x*(-M_xxxyz - M_xyyyz &
      ) - 7*y*(-M_xxxxz - M_xxyyz) + y*(-M_xxzzz - M_yyzzz) + 5*z*( &
      -M_xxyzz - M_yyyzz)))
    S_xyyyyy  = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x*y**3 + x*y**5
    Ms_xyyyyy = Ms_xyyyyy + (M_0*S_xyyyyy - 60.0d0/11.0d0*M_xxyy*S_xy + (28.0d0/33.0d0)*M_xyyyyy + ( &
      100.0d0/33.0d0)*M_yyy*S_xyy + (8.0d0/33.0d0)*M_yyyyy*x - 30.0d0/ &
      11.0d0*S_yy*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_yyy*(-M_xxx - &
      M_xyy) + (10.0d0/33.0d0)*(-M_xxxyyy + y*(-M_xxxxx - M_xxxyy)) + ( &
      25.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x) - 40.0d0/11.0d0*(M_xyyz* &
      S_yz + M_yyz*S_xyz) + (140.0d0/33.0d0)*(M_yy*S_xyyy - M_yz*S_xyyz &
      ) + (10.0d0/11.0d0)*(S_xy*(-M_xxxx - M_xxyy) + x*(-M_xxxxy - &
      M_xxyyy)) + (1.0d0/62370.0d0)*(M_xxx*(75600*S_xxy - 56700*S_yyy) &
      + M_xxxy*(75600*S_xx - 132300*S_yy) + M_xyyy*(-75600*S_xx + &
      189000*S_yy)) + (40.0d0/33.0d0)*(M_xyyyy*y - M_xyyyz*z + M_yyyy* &
      S_xy - M_yyyz*S_xz) + (1.0d0/10395.0d0)*(M_x*(-1575*S_xxxxy - &
      22050*S_xxyyy - 1575*S_xxyzz + 8820*S_yyyyy - 1575*S_yyyzz) + &
      M_xy*(-1575*S_xxxx - 47250*S_xxyy - 1575*S_xxzz + 31500*S_yyyy - &
      1575*S_yyzz) + M_xyz*(12600*S_xxz - 44100*S_yyz) + M_xz*(12600* &
      S_xxyz - 18900*S_yyyz) + M_y*(-1575*S_xxxxx - 3150*S_xxxyy - 1575 &
      *S_xxxzz + 31500*S_xyyyy - 1575*S_xyyzz)) + (1.0d0/20790.0d0)*( &
      M_xx*(12600*S_xxxy - 56700*S_xyyy) + M_xxy*(12600*S_xxx - 132300* &
      S_xyy) + M_xyy*(-75600*S_xxy + 88200*S_yyy) + (-M_xx - M_yy)*( &
      -12600*S_xxxy - 31500*S_xyyy) + (-M_xxy - M_yyy)*(-12600*S_xxx - &
      56700*S_xyy)) + (5.0d0/33.0d0)*(M_xxxxx*y - M_xxxxxy - M_xxxyzz - &
      M_xyyyzz + S_xy*(-M_xxzz - M_yyzz) + x*(-M_xxyzz - M_yyyzz) + y*( &
      -M_xxxzz - M_xyyzz)) + (20.0d0/11.0d0)*(-M_xxxyy*y - M_xxyyy*x + &
      M_xxyz*S_xz + M_xxz*S_xyz - M_z*S_xyyyz - S_xy*(-M_xxyy - M_yyyy &
      ) - y*(-M_xxxyy - M_xyyyy)) + (20.0d0/33.0d0)*(M_xxxyz*z + M_xxxz &
      *S_yz + S_xyz*(-M_xxz - M_yyz) + S_xz*(-M_xxyz - M_yyyz) + S_yz*( &
      -M_xxxz - M_xyyz) - x*(-M_xxyyy - M_yyyyy) + z*(-M_xxxyz - &
      M_xyyyz)))
    S_xyyyyz  = (1.0d0/33.0d0)*h**2*x*z - 6.0d0/11.0d0*h*x*y**2*z + x*y**4*z
    Ms_xyyyyz = Ms_xyyyyz + (M_0*S_xyyyyz + (48.0d0/11.0d0)*M_xyyz*S_yy + (6.0d0/11.0d0)*S_xz*( &
      -M_xxxx - M_xxyy) + (2.0d0/11.0d0)*(x*(-M_xxxxz - M_xxyyz) + z*( &
      -M_xxxxx - M_xxxyy)) + (1.0d0/62370.0d0)*(M_xxx*(15120*S_xxz - &
      34020*S_yyz) + M_xxxz*(7560*S_xx - 41580*S_yy) + (-M_xxxz - &
      M_xyyz)*(-7560*S_xx - 49140*S_yy) + (-M_xxz - M_yyz)*(-15120* &
      S_xxx - 49140*S_xyy)) - 16.0d0/11.0d0*(M_xxyy*S_xz + M_xxyyz*x + &
      S_xz*(-M_xxyy - M_yyyy) + z*(-M_xxxyy - M_xyyyy)) + (1.0d0/ &
      10395.0d0)*(M_x*(-315*S_xxxxz - 11970*S_xxyyz - 315*S_xxzzz + &
      10080*S_yyyyz - 315*S_yyzzz) + M_xy*(-20160*S_xxyz + 30240*S_yyyz &
      ) + M_xz*(-4095*S_xxxx - 5670*S_xxyy - 1575*S_xxzz + 20160*S_yyyy &
      - 1575*S_yyzz) + M_yz*(20160*S_xxxy + 50400*S_xyyy) + M_z*(-1575* &
      S_xxxxx + 8190*S_xxxyy - 1575*S_xxxzz + 20160*S_xyyyy - 1575* &
      S_xyyzz)) + (32.0d0/11.0d0)*(-M_xxy*S_xyz - M_xxyz*S_xy + M_y* &
      S_xyyyz - S_xyz*(-M_xxy - M_yyy) - S_yz*(-M_xxxy - M_xyyy)) + ( &
      1.0d0/20790.0d0)*(M_xx*(2520*S_xxxz - 34020*S_xyyz) + M_xxz*( &
      -5040*S_xxx - 41580*S_xyy) + M_xyy*(-20160*S_xxz + 70560*S_yyz) + &
      M_yyz*(20160*S_xxx + 90720*S_xyy) + (-M_xx - M_yy)*(-2520*S_xxxz &
      - 36540*S_xyyz) + (-M_xxx - M_xyy)*(5040*S_xxz - 36540*S_yyz)) + &
      (1.0d0/33.0d0)*(5*M_xxxx*S_xz + M_xxxxx*z - M_xxxxxz + 5*M_xxxxz* &
      x - 32*M_xxxy*S_yz - 16*M_xxxyy*z - 2*M_xxxyyz - 32*M_xxxyz*y - &
      M_xxxzzz + 64*M_xyyy*S_yz + 16*M_xyyyy*z + 32*M_xyyyyz + 64* &
      M_xyyyz*y - M_xyyzzz + 160*M_xyz*S_yyy + 112*M_yy*S_xyyz + 64* &
      M_yyy*S_xyz + 16*M_yyyy*S_xz + 16*M_yyyyz*x + 64*M_yyyz*S_xy - 32 &
      *S_xy*(-M_xxyz - M_yyyz) + 5*S_xz*(-M_xxzz - M_yyzz) - 16*x*( &
      -M_xxyyz - M_yyyyz) + x*(-M_xxzzz - M_yyzzz) - 32*y*(-M_xxxyz - &
      M_xyyyz) + 5*z*(-M_xxxzz - M_xyyzz)))
    S_yyyyyy  = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*y**2 - 15.0d0/11.0d0*h*y**4 + &
      y**6
    Ms_yyyyyy = Ms_yyyyyy + (M_0*S_yyyyyy + (10.0d0/231.0d0)*M_xxxxxx + (5.0d0/77.0d0)*M_xxxxzz + ( &
      480.0d0/77.0d0)*M_xyz*S_xyz + (40.0d0/11.0d0)*M_xz*S_xyyz + ( &
      800.0d0/231.0d0)*M_yyy*S_yyy + (32.0d0/77.0d0)*M_yyyyy*y + ( &
      136.0d0/231.0d0)*M_yyyyyy - 30.0d0/77.0d0*M_yyyyzz + (90.0d0/ &
      77.0d0)*S_yy*(-M_xxxx - M_xxyy) - 25.0d0/77.0d0*(M_xxxxyy + &
      M_xxyyzz) + (5.0d0/231.0d0)*(M_xxzzzz + M_yyzzzz) + (1.0d0/ &
      62370.0d0)*(M_xxx*(-10800*S_xxx + 113400*S_xyy) + (-M_xxz - M_yyz &
      )*(10800*S_xxz + 124200*S_yyz)) + (1.0d0/249480.0d0)*(M_xxxx*( &
      -64800*S_xx + 113400*S_yy) + (-M_xxzz - M_yyzz)*(64800*S_xx + &
      178200*S_yy)) - 40.0d0/77.0d0*(M_xxxz*S_xz + S_xz*(-M_xxxz - &
      M_xyyz)) + (1.0d0/41580.0d0)*(M_xxyy*(64800*S_xx - 162000*S_yy) + &
      (-M_xxyy - M_yyyy)*(-64800*S_xx - 226800*S_yy)) - 160.0d0/77.0d0* &
      (M_xxyyy*y + y*(-M_xxyyy - M_yyyyy)) - 80.0d0/11.0d0*(M_xy*S_xyyy &
      + M_yz*S_yyyz) - 600.0d0/77.0d0*(M_xyy*S_xyy + M_yyz*S_yyz) - &
      320.0d0/77.0d0*(M_xyyy*S_xy + M_yyyz*S_yz) - 80.0d0/77.0d0*( &
      M_xyyyy*x + M_yyyyz*z) - 20.0d0/77.0d0*(x*(-M_xxxxx - M_xxxyy) + &
      z*(-M_xxxxz - M_xxyyz)) + (1.0d0/10395.0d0)*(M_x*(1350*S_xxxxx + &
      2700*S_xxxyy + 1350*S_xxxzz - 27000*S_xyyyy + 1350*S_xyyzz) + M_y &
      *(-8100*S_xxxxy - 16200*S_xxyyy - 8100*S_xxyzz + 25920*S_yyyyy - &
      8100*S_yyyzz) + M_z*(1350*S_xxxxz + 2700*S_xxyyz + 1350*S_xxzzz - &
      27000*S_yyyyz + 1350*S_yyzzz)) + (60.0d0/77.0d0)*(M_xxxxy*y - &
      M_xxyyyy + y*(-M_xxyzz - M_yyyzz)) - 10.0d0/77.0d0*(M_xxxxx*x + &
      M_xxxxz*z + x*(-M_xxxzz - M_xyyzz) + z*(-M_xxzzz - M_yyzzz)) + ( &
      240.0d0/77.0d0)*(M_xxxy*S_xy + M_xxyz*S_yz + M_xyyz*S_xz + S_xy*( &
      -M_xxxy - M_xyyy) + S_yz*(-M_xxyz - M_yyyz)) + (120.0d0/77.0d0)*( &
      M_xxxyy*x + M_xxyyz*z + M_yyyy*S_yy + x*(-M_xxxyy - M_xyyyy) + y* &
      (-M_xxxxy - M_xxyyy) + z*(-M_xxyyz - M_yyyyz)) + (1.0d0/20790.0d0 &
      )*(M_xx*(1350*S_xxxx + 40500*S_xxyy + 1350*S_xxzz - 27000*S_yyyy &
      + 1350*S_yyzz) + M_xxy*(64800*S_xxy - 75600*S_yyy) + M_xxz*( &
      -10800*S_xxz + 37800*S_yyz) + M_yy*(-8100*S_xxxx - 16200*S_xxyy - &
      8100*S_xxzz + 86400*S_yyyy - 8100*S_yyzz) + (-M_xx - M_yy)*(6750* &
      S_xxxx - 24300*S_xxyy + 6750*S_xxzz - 59400*S_yyyy + 6750*S_yyzz &
      ) + (-M_xxx - M_xyy)*(10800*S_xxx + 48600*S_xyy) + (-M_xxy - &
      M_yyy)*(-64800*S_xxy - 140400*S_yyy)))
    S_yyyyyz  = (5.0d0/33.0d0)*h**2*y*z - 10.0d0/11.0d0*h*y**3*z + y**5*z
    Ms_yyyyyz = Ms_yyyyyz + (M_0*S_yyyyyz - 30.0d0/11.0d0*M_xxyz*S_yy - 50.0d0/33.0d0*M_xxz*S_yyy + ( &
      100.0d0/33.0d0)*M_yyy*S_yyz + (8.0d0/33.0d0)*M_yyyyy*z + (28.0d0/ &
      33.0d0)*M_yyyyyz - 60.0d0/11.0d0*S_yz*(-M_xxyy - M_yyyy) + ( &
      10.0d0/33.0d0)*(-M_xxyyyz + y*(-M_xxxxz - M_xxyyz)) + (140.0d0/ &
      33.0d0)*(-M_xy*S_xyyz + M_yy*S_yyyz) - 40.0d0/11.0d0*(M_xyy*S_xyz &
      + M_xyyz*S_xy) + (10.0d0/11.0d0)*(S_yz*(-M_xxxx - M_xxyy) + z*( &
      -M_xxxxy - M_xxyyy)) + (25.0d0/33.0d0)*(S_yz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxyzz - M_yyyzz)) + (1.0d0/62370.0d0)*(M_yyyz*(75600*S_xx + &
      264600*S_yy) + (-M_xxyz - M_yyyz)*(-75600*S_xx - 207900*S_yy) + ( &
      -M_xxz - M_yyz)*(-75600*S_xxy - 132300*S_yyy)) + (40.0d0/33.0d0)* &
      (-M_xyyy*S_xz - M_xyyyz*x + M_yyyy*S_yz + M_yyyyz*y) + (1.0d0/ &
      20790.0d0)*(M_xx*(12600*S_xxyz - 18900*S_yyyz) + M_xxy*(12600* &
      S_xxz - 44100*S_yyz) + M_yyz*(75600*S_xxy + 163800*S_yyy) + ( &
      -M_xx - M_yy)*(-12600*S_xxyz - 69300*S_yyyz) + (-M_xxy - M_yyy)*( &
      -12600*S_xxz - 144900*S_yyz)) + (1.0d0/10395.0d0)*(M_xyz*(-12600* &
      S_xxx - 56700*S_xyy) + M_xz*(-12600*S_xxxy - 31500*S_xyyy) + M_y* &
      (-1575*S_xxxxz - 3150*S_xxyyz - 1575*S_xxzzz + 31500*S_yyyyz - &
      1575*S_yyzzz) + M_yz*(-7875*S_xxxx + 28350*S_xxyy - 7875*S_xxzz + &
      69300*S_yyyy - 7875*S_yyzz) + M_z*(-7875*S_xxxxy + 3150*S_xxyyy - &
      7875*S_xxyzz + 21420*S_yyyyy - 7875*S_yyyzz)) + (20.0d0/11.0d0)*( &
      -M_x*S_xyyyz - M_xxyy*S_yz - M_xxyyz*y + S_xyz*(-M_xxx - M_xyy) + &
      S_xz*(-M_xxxy - M_xyyy) - y*(-M_xxyyz - M_yyyyz) - z*(-M_xxyyy - &
      M_yyyyy)) + (20.0d0/33.0d0)*(M_xxx*S_xyz + M_xxxy*S_xz + M_xxxyz* &
      x + M_xxxz*S_xy - M_xxyyy*z + S_xy*(-M_xxxz - M_xyyz) + x*( &
      -M_xxxyz - M_xyyyz)) + (5.0d0/33.0d0)*(M_xxxx*S_yz + M_xxxxy*z - &
      M_xxxxyz + M_xxxxz*y - M_xxyzzz - M_yyyzzz + y*(-M_xxzzz - &
      M_yyzzz)))
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
    end subroutine mom_es_M2M_add
    
! OPS  690*ADD + 73*DIV + 1126*MUL + 74*NEG + 256*POW + 58*SUB = 2277  (2771 before optimization)
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
                D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define z                    r(3)
#define y                    r(2)
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
#define M_xxx                M(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define M_xxy                M(10)
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
#define L_xxxx               L(16)
#define M_xxxx               M(16)
#define M_xxxy               M(17)
#define L_xxxy               L(17)
#define L_xxxz               L(18)
#define M_xxxz               M(18)
#define M_xxyy               M(19)
#define L_xxyy               L(19)
#define M_xxyz               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define M_xyyz               M(22)
#define L_xyyz               L(22)
#define L_yyyy               L(23)
#define M_yyyy               M(23)
#define M_yyyz               M(24)
#define L_yyyz               L(24)
#define L_xxxxx              L(25)
#define M_xxxxx              M(25)
#define M_xxxxy              M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define L_xxxyy              L(28)
#define M_xxxyy              M(28)
#define L_xxxyz              L(29)
#define M_xxxyz              M(29)
#define M_xxyyy              M(30)
#define L_xxyyy              L(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define L_xyyyy              L(32)
#define M_xyyyy              M(32)
#define L_xyyyz              L(33)
#define M_xyyyz              M(33)
#define M_yyyyy              M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_yyyyz              M(35)
#define L_xxxxxx             L(36)
#define M_xxxxxx             M(36)
#define L_xxxxxy             L(37)
#define M_xxxxxy             M(37)
#define L_xxxxxz             L(38)
#define M_xxxxxz             M(38)
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
#define M_xxyyyz             M(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define M_xyyyyy             M(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define L_yyyyyy             L(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define L_yyyyyz             L(48)
    M_zz     = -(M_xx + M_yy)
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    M_xxzz   = -(M_xxxx + M_xxyy)
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    M_xxxxzz = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz = -(M_xxzzzz + M_yyzzzz)
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
    L_xxxx   = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxy*M_xy + D_xxxxxz*M_xz + D_xxxxy*M_y + &
      D_xxxxyz*M_yz + D_xxxxz*M_z + (1.0d0/2.0d0)*(D_xxxxxx*M_xx + &
      D_xxxxyy*M_yy + D_xxxxzz*M_zz))
    L_xxxxz  = L_xxxxz + (D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z)
    D_xxxyyy = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    L_xxxyyy = L_xxxyyy + (D_xxxyyy*M_0)
    D_xxxyyz = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    L_xxxyy  = L_xxxyy + (D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z)
    L_xxxyyz = L_xxxyyz + (D_xxxyyz*M_0)
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    L_xxxy   = L_xxxy + (D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyy*M_y + &
      D_xxxyyz*M_yz + D_xxxyz*M_z + (1.0d0/2.0d0)*(D_xxxxxy*M_xx + &
      D_xxxyyy*M_yy + D_xxxyzz*M_zz))
    L_xxxyz  = L_xxxyz + (D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z)
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    L_xxx    = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + (1.0d0/6.0d0)*(D_xxxxxx* &
      M_xxx + D_xxxyyy*M_yyy + D_xxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxx &
      *M_xx + D_xxxxxy*M_xxy + D_xxxxxz*M_xxz + D_xxxxyy*M_xyy + &
      D_xxxxzz*M_xzz + D_xxxyy*M_yy + D_xxxyyz*M_yyz + D_xxxyzz*M_yzz + &
      D_xxxzz*M_zz))
    L_xxxz   = L_xxxz + (D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y + D_xxxyzz* &
      M_yz + D_xxxz*M_0 + D_xxxzz*M_z + (1.0d0/2.0d0)*(D_xxxxxz*M_xx + &
      D_xxxyyz*M_yy + D_xxxzzz*M_zz))
    D_xxyyyy = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    L_xxyyyy = L_xxyyyy + (D_xxyyyy*M_0)
    D_xxyyyz = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    L_xxyyy  = L_xxyyy + (D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z)
    L_xxyyyz = L_xxyyyz + (D_xxyyyz*M_0)
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    L_xxyy   = L_xxyy + (D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyy*M_y + &
      D_xxyyyz*M_yz + D_xxyyz*M_z + (1.0d0/2.0d0)*(D_xxxxyy*M_xx + &
      D_xxyyyy*M_yy + D_xxyyzz*M_zz))
    L_xxyyz  = L_xxyyz + (D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z)
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    L_xxy    = L_xxy + (D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z + (1.0d0/6.0d0)*(D_xxxxxy* &
      M_xxx + D_xxyyyy*M_yyy + D_xxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxy &
      *M_xx + D_xxxxyy*M_xxy + D_xxxxyz*M_xxz + D_xxxyyy*M_xyy + &
      D_xxxyzz*M_xzz + D_xxyyy*M_yy + D_xxyyyz*M_yyz + D_xxyyzz*M_yzz + &
      D_xxyzz*M_zz))
    L_xxyz   = L_xxyz + (D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y + D_xxyyzz* &
      M_yz + D_xxyz*M_0 + D_xxyzz*M_z + (1.0d0/2.0d0)*(D_xxxxyz*M_xx + &
      D_xxyyyz*M_yy + D_xxyzzz*M_zz))
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    L_xx     = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy &
      *M_y + D_xxyz*M_yz + D_xxz*M_z + (1.0d0/24.0d0)*(D_xxxxxx*M_xxxx &
      + D_xxyyyy*M_yyyy + D_xxzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyy* &
      M_xxyy + D_xxxxzz*M_xxzz + D_xxyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxx*M_xxx + D_xxxxxy*M_xxxy + D_xxxxxz*M_xxxz + D_xxxyyy* &
      M_xyyy + D_xxxzzz*M_xzzz + D_xxyyy*M_yyy + D_xxyyyz*M_yyyz + &
      D_xxyzzz*M_yzzz + D_xxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxx*M_xx + &
      D_xxxxy*M_xxy + D_xxxxyz*M_xxyz + D_xxxxz*M_xxz + D_xxxyy*M_xyy + &
      D_xxxyyz*M_xyyz + D_xxxyzz*M_xyzz + D_xxxzz*M_xzz + D_xxyy*M_yy + &
      D_xxyyz*M_yyz + D_xxyzz*M_yzz + D_xxzz*M_zz))
    L_xxz    = L_xxz + (D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + (1.0d0/6.0d0)*(D_xxxxxz* &
      M_xxx + D_xxyyyz*M_yyy + D_xxzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxxyz*M_xxy + D_xxxxz*M_xx + D_xxxxzz*M_xxz + D_xxxyyz*M_xyy + &
      D_xxxzzz*M_xzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyzzz*M_yzz + &
      D_xxzzz*M_zz))
    D_xyyyyy = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    L_xyyyyy = L_xyyyyy + (D_xyyyyy*M_0)
    D_xyyyyz = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    L_xyyyy  = L_xyyyy + (D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z)
    L_xyyyyz = L_xyyyyz + (D_xyyyyz*M_0)
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    L_xyyy   = L_xyyy + (D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyy*M_y + &
      D_xyyyyz*M_yz + D_xyyyz*M_z + (1.0d0/2.0d0)*(D_xxxyyy*M_xx + &
      D_xyyyyy*M_yy + D_xyyyzz*M_zz))
    L_xyyyz  = L_xyyyz + (D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z)
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    L_xyy    = L_xyy + (D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z + (1.0d0/6.0d0)*(D_xxxxyy* &
      M_xxx + D_xyyyyy*M_yyy + D_xyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyy &
      *M_xx + D_xxxyyy*M_xxy + D_xxxyyz*M_xxz + D_xxyyyy*M_xyy + &
      D_xxyyzz*M_xzz + D_xyyyy*M_yy + D_xyyyyz*M_yyz + D_xyyyzz*M_yzz + &
      D_xyyzz*M_zz))
    L_xyyz   = L_xyyz + (D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y + D_xyyyzz* &
      M_yz + D_xyyz*M_0 + D_xyyzz*M_z + (1.0d0/2.0d0)*(D_xxxyyz*M_xx + &
      D_xyyyyz*M_yy + D_xyyzzz*M_zz))
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    L_xy     = L_xy + (D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy &
      *M_y + D_xyyz*M_yz + D_xyz*M_z + (1.0d0/24.0d0)*(D_xxxxxy*M_xxxx &
      + D_xyyyyy*M_yyyy + D_xyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyy* &
      M_xxyy + D_xxxyzz*M_xxzz + D_xyyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyz*M_xxxz + D_xxyyyy* &
      M_xyyy + D_xxyzzz*M_xzzz + D_xyyyy*M_yyy + D_xyyyyz*M_yyyz + &
      D_xyyzzz*M_yzzz + D_xyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxy*M_xx + &
      D_xxxyy*M_xxy + D_xxxyyz*M_xxyz + D_xxxyz*M_xxz + D_xxyyy*M_xyy + &
      D_xxyyyz*M_xyyz + D_xxyyzz*M_xyzz + D_xxyzz*M_xzz + D_xyyy*M_yy + &
      D_xyyyz*M_yyz + D_xyyzz*M_yzz + D_xyzz*M_zz))
    L_xyz    = L_xyz + (D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + (1.0d0/6.0d0)*(D_xxxxyz* &
      M_xxx + D_xyyyyz*M_yyy + D_xyzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxyyz*M_xxy + D_xxxyz*M_xx + D_xxxyzz*M_xxz + D_xxyyyz*M_xyy + &
      D_xxyzzz*M_xzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyzzz*M_yzz + &
      D_xyzzz*M_zz))
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = L_x + (D_x*M_0 + D_xx*M_x + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + &
      D_xyz*M_yz + D_xz*M_z + (1.0d0/120.0d0)*(D_xxxxxx*M_xxxxx + &
      D_xyyyyy*M_yyyyy + D_xzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyy* &
      M_xxxyy + D_xxxxzz*M_xxxzz + D_xxxyyy*M_xxyyy + D_xxxzzz*M_xxzzz &
      + D_xyyyzz*M_yyyzz + D_xyyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxxyy* &
      M_xxyy + D_xxxyyz*M_xxyyz + D_xxxyzz*M_xxyzz + D_xxxzz*M_xxzz + &
      D_xxyyzz*M_xyyzz + D_xyyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxx* &
      M_xxxx + D_xxxxxy*M_xxxxy + D_xxxxxz*M_xxxxz + D_xxyyyy*M_xyyyy + &
      D_xxzzzz*M_xzzzz + D_xyyyy*M_yyyy + D_xyyyyz*M_yyyyz + D_xyzzzz* &
      M_yzzzz + D_xzzzz*M_zzzz) + (1.0d0/2.0d0)*(D_xxx*M_xx + D_xxxy* &
      M_xxy + D_xxxyz*M_xxyz + D_xxxz*M_xxz + D_xxyy*M_xyy + D_xxyyz* &
      M_xyyz + D_xxyzz*M_xyzz + D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz* &
      M_yyz + D_xyzz*M_yzz + D_xzz*M_zz) + (1.0d0/6.0d0)*(D_xxxx*M_xxx &
      + D_xxxxy*M_xxxy + D_xxxxyz*M_xxxyz + D_xxxxz*M_xxxz + D_xxyyy* &
      M_xyyy + D_xxyyyz*M_xyyyz + D_xxyzzz*M_xyzzz + D_xxzzz*M_xzzz + &
      D_xyyy*M_yyy + D_xyyyz*M_yyyz + D_xyzzz*M_yzzz + D_xzzz*M_zzz))
    L_xz     = L_xz + (D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + &
      D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + (1.0d0/24.0d0)*(D_xxxxxz* &
      M_xxxx + D_xyyyyz*M_yyyy + D_xzzzzz*M_zzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyz*M_xxyy + D_xxxzzz*M_xxzz + D_xyyzzz*M_yyzz) + (1.0d0/ &
      6.0d0)*(D_xxxxyz*M_xxxy + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + &
      D_xxyyyz*M_xyyy + D_xxzzzz*M_xzzz + D_xyyyz*M_yyy + D_xyyyzz* &
      M_yyyz + D_xyzzzz*M_yzzz + D_xzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz*M_xx + D_xxxzz*M_xxz + &
      D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyzzz*M_xyzz + D_xxzzz*M_xzz &
      + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz*M_yzz + D_xzzz*M_zz))
    D_yyyyyy = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    L_yyyyyy = L_yyyyyy + (D_yyyyyy*M_0)
    D_yyyyyz = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    L_yyyyy  = L_yyyyy + (D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z)
    L_yyyyyz = L_yyyyyz + (D_yyyyyz*M_0)
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = L_yyyy + (D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyy*M_y + &
      D_yyyyyz*M_yz + D_yyyyz*M_z + (1.0d0/2.0d0)*(D_xxyyyy*M_xx + &
      D_yyyyyy*M_yy + D_yyyyzz*M_zz))
    L_yyyyz  = L_yyyyz + (D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z)
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = L_yyy + (D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyz*M_yz + D_yyyz*M_z + (1.0d0/6.0d0)*(D_xxxyyy* &
      M_xxx + D_yyyyyy*M_yyy + D_yyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyy &
      *M_xx + D_xxyyyy*M_xxy + D_xxyyyz*M_xxz + D_xyyyyy*M_xyy + &
      D_xyyyzz*M_xzz + D_yyyyy*M_yy + D_yyyyyz*M_yyz + D_yyyyzz*M_yzz + &
      D_yyyzz*M_zz))
    L_yyyz   = L_yyyz + (D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzz*M_z + (1.0d0/2.0d0)*(D_xxyyyz*M_xx + &
      D_yyyyyz*M_yy + D_yyyzzz*M_zz))
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = L_yy + (D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy &
      *M_y + D_yyyz*M_yz + D_yyz*M_z + (1.0d0/24.0d0)*(D_xxxxyy*M_xxxx &
      + D_yyyyyy*M_yyyy + D_yyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyy* &
      M_xxyy + D_xxyyzz*M_xxzz + D_yyyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyz*M_xxxz + D_xyyyyy* &
      M_xyyy + D_xyyzzz*M_xzzz + D_yyyyy*M_yyy + D_yyyyyz*M_yyyz + &
      D_yyyzzz*M_yzzz + D_yyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyy*M_xx + &
      D_xxyyy*M_xxy + D_xxyyyz*M_xxyz + D_xxyyz*M_xxz + D_xyyyy*M_xyy + &
      D_xyyyyz*M_xyyz + D_xyyyzz*M_xyzz + D_xyyzz*M_xzz + D_yyyy*M_yy + &
      D_yyyyz*M_yyz + D_yyyzz*M_yzz + D_yyzz*M_zz))
    L_yyz    = L_yyz + (D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyz*M_y + &
      D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + (1.0d0/6.0d0)*(D_xxxyyz* &
      M_xxx + D_yyyyyz*M_yyy + D_yyzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxyyyz*M_xxy + D_xxyyz*M_xx + D_xxyyzz*M_xxz + D_xyyyyz*M_xyy + &
      D_xyyzzz*M_xzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyzzz*M_yzz + &
      D_yyzzz*M_zz))
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = L_y + (D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyz*M_yz + D_yz*M_z + (1.0d0/120.0d0)*(D_xxxxxy*M_xxxxx + &
      D_yyyyyy*M_yyyyy + D_yzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyy* &
      M_xxxyy + D_xxxyzz*M_xxxzz + D_xxyyyy*M_xxyyy + D_xxyzzz*M_xxzzz &
      + D_yyyyzz*M_yyyzz + D_yyyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyyy* &
      M_xxyy + D_xxyyyz*M_xxyyz + D_xxyyzz*M_xxyzz + D_xxyzz*M_xxzz + &
      D_xyyyzz*M_xyyzz + D_yyyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxy* &
      M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyz*M_xxxxz + D_xyyyyy*M_xyyyy + &
      D_xyzzzz*M_xzzzz + D_yyyyy*M_yyyy + D_yyyyyz*M_yyyyz + D_yyzzzz* &
      M_yzzzz + D_yzzzz*M_zzzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + D_xxxyy &
      *M_xxxy + D_xxxyyz*M_xxxyz + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + &
      D_xyyyyz*M_xyyyz + D_xyyzzz*M_xyzzz + D_xyzzz*M_xzzz + D_yyyy* &
      M_yyy + D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + D_xxyz*M_xxz &
      + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + D_xyzz*M_xzz + &
      D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz*M_zz))
    L_yz     = L_yz + (D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyz*M_y + &
      D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + (1.0d0/24.0d0)*(D_xxxxyz* &
      M_xxxx + D_yyyyyz*M_yyyy + D_yzzzzz*M_zzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyz*M_xxyy + D_xxyzzz*M_xxzz + D_yyyzzz*M_yyzz) + (1.0d0/ &
      6.0d0)*(D_xxxyyz*M_xxxy + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + &
      D_xyyyyz*M_xyyy + D_xyzzzz*M_xzzz + D_yyyyz*M_yyy + D_yyyyzz* &
      M_yyyz + D_yyzzzz*M_yzzz + D_yzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz*M_xx + D_xxyzz*M_xxz + &
      D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyzzz*M_xyzz + D_xyzzz*M_xzz &
      + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz*M_yzz + D_yzzz*M_zz))
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = L_0 + (D_0*M_0 + D_x*M_x + (1.0d0/8.0d0)*D_xxyyzz*M_xxyyzz + D_xy*M_xy + D_xyz* &
      M_xyz + D_xz*M_xz + D_y*M_y + D_yz*M_yz + D_z*M_z + (1.0d0/ &
      720.0d0)*(D_xxxxxx*M_xxxxxx + D_yyyyyy*M_yyyyyy + D_zzzzzz* &
      M_zzzzzz) + (1.0d0/36.0d0)*(D_xxxyyy*M_xxxyyy + D_xxxzzz*M_xxxzzz &
      + D_yyyzzz*M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyy*M_xxxxyy + &
      D_xxxxzz*M_xxxxzz + D_xxyyyy*M_xxyyyy + D_xxzzzz*M_xxzzzz + &
      D_yyyyzz*M_yyyyzz + D_yyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyy* &
      M_xxyy + D_xxyyz*M_xxyyz + D_xxyzz*M_xxyzz + D_xxzz*M_xxzz + &
      D_xyyzz*M_xyyzz + D_yyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxx* &
      M_xxxxx + D_xxxxxy*M_xxxxxy + D_xxxxxz*M_xxxxxz + D_xyyyyy* &
      M_xyyyyy + D_xzzzzz*M_xzzzzz + D_yyyyy*M_yyyyy + D_yyyyyz* &
      M_yyyyyz + D_yzzzzz*M_yzzzzz + D_zzzzz*M_zzzzz) + (1.0d0/2.0d0)*( &
      D_xx*M_xx + D_xxy*M_xxy + D_xxyz*M_xxyz + D_xxz*M_xxz + D_xyy* &
      M_xyy + D_xyyz*M_xyyz + D_xyzz*M_xyzz + D_xzz*M_xzz + D_yy*M_yy + &
      D_yyz*M_yyz + D_yzz*M_yzz + D_zz*M_zz) + (1.0d0/6.0d0)*(D_xxx* &
      M_xxx + D_xxxy*M_xxxy + D_xxxyz*M_xxxyz + D_xxxz*M_xxxz + D_xyyy* &
      M_xyyy + D_xyyyz*M_xyyyz + D_xyzzz*M_xyzzz + D_xzzz*M_xzzz + &
      D_yyy*M_yyy + D_yyyz*M_yyyz + D_yzzz*M_yzzz + D_zzz*M_zzz) + ( &
      1.0d0/24.0d0)*(D_xxxx*M_xxxx + D_xxxxy*M_xxxxy + D_xxxxyz* &
      M_xxxxyz + D_xxxxz*M_xxxxz + D_xyyyy*M_xyyyy + D_xyyyyz*M_xyyyyz &
      + D_xyzzzz*M_xyzzzz + D_xzzzz*M_xzzzz + D_yyyy*M_yyyy + D_yyyyz* &
      M_yyyyz + D_yzzzz*M_yzzzz + D_zzzz*M_zzzz) + (1.0d0/12.0d0)*( &
      D_xxxyy*M_xxxyy + D_xxxyyz*M_xxxyyz + D_xxxyzz*M_xxxyzz + D_xxxzz &
      *M_xxxzz + D_xxyyy*M_xxyyy + D_xxyyyz*M_xxyyyz + D_xxyzzz* &
      M_xxyzzz + D_xxzzz*M_xxzzz + D_xyyyzz*M_xyyyzz + D_xyyzzz* &
      M_xyyzzz + D_yyyzz*M_yyyzz + D_yyzzz*M_yyzzz))
    L_z      = L_z + (D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yz*M_y + D_yzz* &
      M_yz + D_z*M_0 + D_zz*M_z + (1.0d0/120.0d0)*(D_xxxxxz*M_xxxxx + &
      D_yyyyyz*M_yyyyy + D_zzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyz* &
      M_xxxyy + D_xxxzzz*M_xxxzz + D_xxyyyz*M_xxyyy + D_xxzzzz*M_xxzzz &
      + D_yyyzzz*M_yyyzz + D_yyzzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyyz* &
      M_xxyy + D_xxyyzz*M_xxyyz + D_xxyzzz*M_xxyzz + D_xxzzz*M_xxzz + &
      D_xyyzzz*M_xyyzz + D_yyzzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxyz* &
      M_xxxxy + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + D_xyyyyz*M_xyyyy + &
      D_xzzzzz*M_xzzzz + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + D_yzzzzz* &
      M_yzzzz + D_zzzzz*M_zzzz) + (1.0d0/6.0d0)*(D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy &
      + D_xyyyzz*M_xyyyz + D_xyzzzz*M_xyzzz + D_xzzzz*M_xzzz + D_yyyz* &
      M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + D_xxzz*M_xxz &
      + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz*M_xyzz + D_xzzz*M_xzz + &
      D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz*M_zz))
#undef  M_0                 
#undef  L_0                 
#undef  z                   
#undef  y                   
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
#undef  M_xxx               
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxy               
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
#undef  L_xxxx              
#undef  M_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  M_xxyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  L_xxxyy             
#undef  M_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  M_xxyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  L_xxxxxz            
#undef  M_xxxxxz            
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
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
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
    
! OPS  690*ADD + 73*DIV + 1126*MUL + 74*NEG + 256*POW + 58*SUB = 2277  (2771 before optimization)
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
                D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define y                    r(1:2,2)
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
#define M_xxx                M(1:2,9)
#define L_xxx                L(1:2,9)
#define L_xxy                L(1:2,10)
#define M_xxy                M(1:2,10)
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
#define L_xxxx               L(1:2,16)
#define M_xxxx               M(1:2,16)
#define M_xxxy               M(1:2,17)
#define L_xxxy               L(1:2,17)
#define L_xxxz               L(1:2,18)
#define M_xxxz               M(1:2,18)
#define M_xxyy               M(1:2,19)
#define L_xxyy               L(1:2,19)
#define M_xxyz               M(1:2,20)
#define L_xxyz               L(1:2,20)
#define L_xyyy               L(1:2,21)
#define M_xyyy               M(1:2,21)
#define M_xyyz               M(1:2,22)
#define L_xyyz               L(1:2,22)
#define L_yyyy               L(1:2,23)
#define M_yyyy               M(1:2,23)
#define M_yyyz               M(1:2,24)
#define L_yyyz               L(1:2,24)
#define L_xxxxx              L(1:2,25)
#define M_xxxxx              M(1:2,25)
#define M_xxxxy              M(1:2,26)
#define L_xxxxy              L(1:2,26)
#define L_xxxxz              L(1:2,27)
#define M_xxxxz              M(1:2,27)
#define L_xxxyy              L(1:2,28)
#define M_xxxyy              M(1:2,28)
#define L_xxxyz              L(1:2,29)
#define M_xxxyz              M(1:2,29)
#define M_xxyyy              M(1:2,30)
#define L_xxyyy              L(1:2,30)
#define L_xxyyz              L(1:2,31)
#define M_xxyyz              M(1:2,31)
#define L_xyyyy              L(1:2,32)
#define M_xyyyy              M(1:2,32)
#define L_xyyyz              L(1:2,33)
#define M_xyyyz              M(1:2,33)
#define M_yyyyy              M(1:2,34)
#define L_yyyyy              L(1:2,34)
#define L_yyyyz              L(1:2,35)
#define M_yyyyz              M(1:2,35)
#define L_xxxxxx             L(1:2,36)
#define M_xxxxxx             M(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define M_xxxxxy             M(1:2,37)
#define L_xxxxxz             L(1:2,38)
#define M_xxxxxz             M(1:2,38)
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
#define M_xxyyyz             M(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define L_xyyyyy             L(1:2,45)
#define M_xyyyyy             M(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define M_xyyyyz             M(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define M_yyyyyy             M(1:2,47)
#define M_yyyyyz             M(1:2,48)
#define L_yyyyyz             L(1:2,48)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    M_zz     = -(M_xx + M_yy)
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    M_xxzz   = -(M_xxxx + M_xxyy)
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    M_xxxxzz = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz = -(M_xxzzzz + M_yyzzzz)
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
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxy*M_xy + D_xxxxxz*M_xz + D_xxxxy*M_y + &
      D_xxxxyz*M_yz + D_xxxxz*M_z + (1.0d0/2.0d0)*(D_xxxxxx*M_xx + &
      D_xxxxyy*M_yy + D_xxxxzz*M_zz)
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    L_xxxyy  = D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    L_xxxy   = D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyy*M_y + &
      D_xxxyyz*M_yz + D_xxxyz*M_z + (1.0d0/2.0d0)*(D_xxxxxy*M_xx + &
      D_xxxyyy*M_yy + D_xxxyzz*M_zz)
    L_xxxyz  = D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    L_xxx    = D_xxx*M_0 + D_xxxx*M_x + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + (1.0d0/6.0d0)*(D_xxxxxx* &
      M_xxx + D_xxxyyy*M_yyy + D_xxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxx &
      *M_xx + D_xxxxxy*M_xxy + D_xxxxxz*M_xxz + D_xxxxyy*M_xyy + &
      D_xxxxzz*M_xzz + D_xxxyy*M_yy + D_xxxyyz*M_yyz + D_xxxyzz*M_yzz + &
      D_xxxzz*M_zz)
    L_xxxz   = D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y + D_xxxyzz* &
      M_yz + D_xxxz*M_0 + D_xxxzz*M_z + (1.0d0/2.0d0)*(D_xxxxxz*M_xx + &
      D_xxxyyz*M_yy + D_xxxzzz*M_zz)
    D_xxyyyy = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    L_xxyyy  = D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    L_xxyy   = D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyy*M_y + &
      D_xxyyyz*M_yz + D_xxyyz*M_z + (1.0d0/2.0d0)*(D_xxxxyy*M_xx + &
      D_xxyyyy*M_yy + D_xxyyzz*M_zz)
    L_xxyyz  = D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    L_xxy    = D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z + (1.0d0/6.0d0)*(D_xxxxxy* &
      M_xxx + D_xxyyyy*M_yyy + D_xxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxy &
      *M_xx + D_xxxxyy*M_xxy + D_xxxxyz*M_xxz + D_xxxyyy*M_xyy + &
      D_xxxyzz*M_xzz + D_xxyyy*M_yy + D_xxyyyz*M_yyz + D_xxyyzz*M_yzz + &
      D_xxyzz*M_zz)
    L_xxyz   = D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y + D_xxyyzz* &
      M_yz + D_xxyz*M_0 + D_xxyzz*M_z + (1.0d0/2.0d0)*(D_xxxxyz*M_xx + &
      D_xxyyyz*M_yy + D_xxyzzz*M_zz)
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    L_xx     = D_xx*M_0 + D_xxx*M_x + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy &
      *M_y + D_xxyz*M_yz + D_xxz*M_z + (1.0d0/24.0d0)*(D_xxxxxx*M_xxxx &
      + D_xxyyyy*M_yyyy + D_xxzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyy* &
      M_xxyy + D_xxxxzz*M_xxzz + D_xxyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxx*M_xxx + D_xxxxxy*M_xxxy + D_xxxxxz*M_xxxz + D_xxxyyy* &
      M_xyyy + D_xxxzzz*M_xzzz + D_xxyyy*M_yyy + D_xxyyyz*M_yyyz + &
      D_xxyzzz*M_yzzz + D_xxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxx*M_xx + &
      D_xxxxy*M_xxy + D_xxxxyz*M_xxyz + D_xxxxz*M_xxz + D_xxxyy*M_xyy + &
      D_xxxyyz*M_xyyz + D_xxxyzz*M_xyzz + D_xxxzz*M_xzz + D_xxyy*M_yy + &
      D_xxyyz*M_yyz + D_xxyzz*M_yzz + D_xxzz*M_zz)
    L_xxz    = D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + (1.0d0/6.0d0)*(D_xxxxxz* &
      M_xxx + D_xxyyyz*M_yyy + D_xxzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxxyz*M_xxy + D_xxxxz*M_xx + D_xxxxzz*M_xxz + D_xxxyyz*M_xyy + &
      D_xxxzzz*M_xzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyzzz*M_yzz + &
      D_xxzzz*M_zz)
    D_xyyyyy = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    L_xyyyy  = D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    L_xyyy   = D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyy*M_y + &
      D_xyyyyz*M_yz + D_xyyyz*M_z + (1.0d0/2.0d0)*(D_xxxyyy*M_xx + &
      D_xyyyyy*M_yy + D_xyyyzz*M_zz)
    L_xyyyz  = D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    L_xyy    = D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z + (1.0d0/6.0d0)*(D_xxxxyy* &
      M_xxx + D_xyyyyy*M_yyy + D_xyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyy &
      *M_xx + D_xxxyyy*M_xxy + D_xxxyyz*M_xxz + D_xxyyyy*M_xyy + &
      D_xxyyzz*M_xzz + D_xyyyy*M_yy + D_xyyyyz*M_yyz + D_xyyyzz*M_yzz + &
      D_xyyzz*M_zz)
    L_xyyz   = D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y + D_xyyyzz* &
      M_yz + D_xyyz*M_0 + D_xyyzz*M_z + (1.0d0/2.0d0)*(D_xxxyyz*M_xx + &
      D_xyyyyz*M_yy + D_xyyzzz*M_zz)
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    L_xy     = D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy &
      *M_y + D_xyyz*M_yz + D_xyz*M_z + (1.0d0/24.0d0)*(D_xxxxxy*M_xxxx &
      + D_xyyyyy*M_yyyy + D_xyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyy* &
      M_xxyy + D_xxxyzz*M_xxzz + D_xyyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyz*M_xxxz + D_xxyyyy* &
      M_xyyy + D_xxyzzz*M_xzzz + D_xyyyy*M_yyy + D_xyyyyz*M_yyyz + &
      D_xyyzzz*M_yzzz + D_xyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxy*M_xx + &
      D_xxxyy*M_xxy + D_xxxyyz*M_xxyz + D_xxxyz*M_xxz + D_xxyyy*M_xyy + &
      D_xxyyyz*M_xyyz + D_xxyyzz*M_xyzz + D_xxyzz*M_xzz + D_xyyy*M_yy + &
      D_xyyyz*M_yyz + D_xyyzz*M_yzz + D_xyzz*M_zz)
    L_xyz    = D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + (1.0d0/6.0d0)*(D_xxxxyz* &
      M_xxx + D_xyyyyz*M_yyy + D_xyzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxyyz*M_xxy + D_xxxyz*M_xx + D_xxxyzz*M_xxz + D_xxyyyz*M_xyy + &
      D_xxyzzz*M_xzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyzzz*M_yzz + &
      D_xyzzz*M_zz)
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = D_x*M_0 + D_xx*M_x + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + &
      D_xyz*M_yz + D_xz*M_z + (1.0d0/120.0d0)*(D_xxxxxx*M_xxxxx + &
      D_xyyyyy*M_yyyyy + D_xzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyy* &
      M_xxxyy + D_xxxxzz*M_xxxzz + D_xxxyyy*M_xxyyy + D_xxxzzz*M_xxzzz &
      + D_xyyyzz*M_yyyzz + D_xyyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxxyy* &
      M_xxyy + D_xxxyyz*M_xxyyz + D_xxxyzz*M_xxyzz + D_xxxzz*M_xxzz + &
      D_xxyyzz*M_xyyzz + D_xyyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxx* &
      M_xxxx + D_xxxxxy*M_xxxxy + D_xxxxxz*M_xxxxz + D_xxyyyy*M_xyyyy + &
      D_xxzzzz*M_xzzzz + D_xyyyy*M_yyyy + D_xyyyyz*M_yyyyz + D_xyzzzz* &
      M_yzzzz + D_xzzzz*M_zzzz) + (1.0d0/2.0d0)*(D_xxx*M_xx + D_xxxy* &
      M_xxy + D_xxxyz*M_xxyz + D_xxxz*M_xxz + D_xxyy*M_xyy + D_xxyyz* &
      M_xyyz + D_xxyzz*M_xyzz + D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz* &
      M_yyz + D_xyzz*M_yzz + D_xzz*M_zz) + (1.0d0/6.0d0)*(D_xxxx*M_xxx &
      + D_xxxxy*M_xxxy + D_xxxxyz*M_xxxyz + D_xxxxz*M_xxxz + D_xxyyy* &
      M_xyyy + D_xxyyyz*M_xyyyz + D_xxyzzz*M_xyzzz + D_xxzzz*M_xzzz + &
      D_xyyy*M_yyy + D_xyyyz*M_yyyz + D_xyzzz*M_yzzz + D_xzzz*M_zzz)
    L_xz     = D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + &
      D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + (1.0d0/24.0d0)*(D_xxxxxz* &
      M_xxxx + D_xyyyyz*M_yyyy + D_xzzzzz*M_zzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyz*M_xxyy + D_xxxzzz*M_xxzz + D_xyyzzz*M_yyzz) + (1.0d0/ &
      6.0d0)*(D_xxxxyz*M_xxxy + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + &
      D_xxyyyz*M_xyyy + D_xxzzzz*M_xzzz + D_xyyyz*M_yyy + D_xyyyzz* &
      M_yyyz + D_xyzzzz*M_yzzz + D_xzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz*M_xx + D_xxxzz*M_xxz + &
      D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyzzz*M_xyzz + D_xxzzz*M_xzz &
      + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz*M_yzz + D_xzzz*M_zz)
    D_yyyyyy = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    L_yyyyy  = D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyy*M_y + &
      D_yyyyyz*M_yz + D_yyyyz*M_z + (1.0d0/2.0d0)*(D_xxyyyy*M_xx + &
      D_yyyyyy*M_yy + D_yyyyzz*M_zz)
    L_yyyyz  = D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyz*M_yz + D_yyyz*M_z + (1.0d0/6.0d0)*(D_xxxyyy* &
      M_xxx + D_yyyyyy*M_yyy + D_yyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyy &
      *M_xx + D_xxyyyy*M_xxy + D_xxyyyz*M_xxz + D_xyyyyy*M_xyy + &
      D_xyyyzz*M_xzz + D_yyyyy*M_yy + D_yyyyyz*M_yyz + D_yyyyzz*M_yzz + &
      D_yyyzz*M_zz)
    L_yyyz   = D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzz*M_z + (1.0d0/2.0d0)*(D_xxyyyz*M_xx + &
      D_yyyyyz*M_yy + D_yyyzzz*M_zz)
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy &
      *M_y + D_yyyz*M_yz + D_yyz*M_z + (1.0d0/24.0d0)*(D_xxxxyy*M_xxxx &
      + D_yyyyyy*M_yyyy + D_yyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyy* &
      M_xxyy + D_xxyyzz*M_xxzz + D_yyyyzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyz*M_xxxz + D_xyyyyy* &
      M_xyyy + D_xyyzzz*M_xzzz + D_yyyyy*M_yyy + D_yyyyyz*M_yyyz + &
      D_yyyzzz*M_yzzz + D_yyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyy*M_xx + &
      D_xxyyy*M_xxy + D_xxyyyz*M_xxyz + D_xxyyz*M_xxz + D_xyyyy*M_xyy + &
      D_xyyyyz*M_xyyz + D_xyyyzz*M_xyzz + D_xyyzz*M_xzz + D_yyyy*M_yy + &
      D_yyyyz*M_yyz + D_yyyzz*M_yzz + D_yyzz*M_zz)
    L_yyz    = D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyz*M_y + &
      D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + (1.0d0/6.0d0)*(D_xxxyyz* &
      M_xxx + D_yyyyyz*M_yyy + D_yyzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxyyyz*M_xxy + D_xxyyz*M_xx + D_xxyyzz*M_xxz + D_xyyyyz*M_xyy + &
      D_xyyzzz*M_xzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyzzz*M_yzz + &
      D_yyzzz*M_zz)
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyz*M_yz + D_yz*M_z + (1.0d0/120.0d0)*(D_xxxxxy*M_xxxxx + &
      D_yyyyyy*M_yyyyy + D_yzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyy* &
      M_xxxyy + D_xxxyzz*M_xxxzz + D_xxyyyy*M_xxyyy + D_xxyzzz*M_xxzzz &
      + D_yyyyzz*M_yyyzz + D_yyyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyyy* &
      M_xxyy + D_xxyyyz*M_xxyyz + D_xxyyzz*M_xxyzz + D_xxyzz*M_xxzz + &
      D_xyyyzz*M_xyyzz + D_yyyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxy* &
      M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyz*M_xxxxz + D_xyyyyy*M_xyyyy + &
      D_xyzzzz*M_xzzzz + D_yyyyy*M_yyyy + D_yyyyyz*M_yyyyz + D_yyzzzz* &
      M_yzzzz + D_yzzzz*M_zzzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + D_xxxyy &
      *M_xxxy + D_xxxyyz*M_xxxyz + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + &
      D_xyyyyz*M_xyyyz + D_xyyzzz*M_xyzzz + D_xyzzz*M_xzzz + D_yyyy* &
      M_yyy + D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + D_xxyz*M_xxz &
      + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + D_xyzz*M_xzz + &
      D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz*M_zz)
    L_yz     = D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyz*M_y + &
      D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + (1.0d0/24.0d0)*(D_xxxxyz* &
      M_xxxx + D_yyyyyz*M_yyyy + D_yzzzzz*M_zzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyz*M_xxyy + D_xxyzzz*M_xxzz + D_yyyzzz*M_yyzz) + (1.0d0/ &
      6.0d0)*(D_xxxyyz*M_xxxy + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + &
      D_xyyyyz*M_xyyy + D_xyzzzz*M_xzzz + D_yyyyz*M_yyy + D_yyyyzz* &
      M_yyyz + D_yyzzzz*M_yzzz + D_yzzzz*M_zzz) + (1.0d0/2.0d0)*( &
      D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz*M_xx + D_xxyzz*M_xxz + &
      D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyzzz*M_xyzz + D_xyzzz*M_xzz &
      + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz*M_yzz + D_yzzz*M_zz)
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = D_0*M_0 + D_x*M_x + (1.0d0/8.0d0)*D_xxyyzz*M_xxyyzz + D_xy*M_xy + D_xyz* &
      M_xyz + D_xz*M_xz + D_y*M_y + D_yz*M_yz + D_z*M_z + (1.0d0/ &
      720.0d0)*(D_xxxxxx*M_xxxxxx + D_yyyyyy*M_yyyyyy + D_zzzzzz* &
      M_zzzzzz) + (1.0d0/36.0d0)*(D_xxxyyy*M_xxxyyy + D_xxxzzz*M_xxxzzz &
      + D_yyyzzz*M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyy*M_xxxxyy + &
      D_xxxxzz*M_xxxxzz + D_xxyyyy*M_xxyyyy + D_xxzzzz*M_xxzzzz + &
      D_yyyyzz*M_yyyyzz + D_yyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyy* &
      M_xxyy + D_xxyyz*M_xxyyz + D_xxyzz*M_xxyzz + D_xxzz*M_xxzz + &
      D_xyyzz*M_xyyzz + D_yyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxx* &
      M_xxxxx + D_xxxxxy*M_xxxxxy + D_xxxxxz*M_xxxxxz + D_xyyyyy* &
      M_xyyyyy + D_xzzzzz*M_xzzzzz + D_yyyyy*M_yyyyy + D_yyyyyz* &
      M_yyyyyz + D_yzzzzz*M_yzzzzz + D_zzzzz*M_zzzzz) + (1.0d0/2.0d0)*( &
      D_xx*M_xx + D_xxy*M_xxy + D_xxyz*M_xxyz + D_xxz*M_xxz + D_xyy* &
      M_xyy + D_xyyz*M_xyyz + D_xyzz*M_xyzz + D_xzz*M_xzz + D_yy*M_yy + &
      D_yyz*M_yyz + D_yzz*M_yzz + D_zz*M_zz) + (1.0d0/6.0d0)*(D_xxx* &
      M_xxx + D_xxxy*M_xxxy + D_xxxyz*M_xxxyz + D_xxxz*M_xxxz + D_xyyy* &
      M_xyyy + D_xyyyz*M_xyyyz + D_xyzzz*M_xyzzz + D_xzzz*M_xzzz + &
      D_yyy*M_yyy + D_yyyz*M_yyyz + D_yzzz*M_yzzz + D_zzz*M_zzz) + ( &
      1.0d0/24.0d0)*(D_xxxx*M_xxxx + D_xxxxy*M_xxxxy + D_xxxxyz* &
      M_xxxxyz + D_xxxxz*M_xxxxz + D_xyyyy*M_xyyyy + D_xyyyyz*M_xyyyyz &
      + D_xyzzzz*M_xyzzzz + D_xzzzz*M_xzzzz + D_yyyy*M_yyyy + D_yyyyz* &
      M_yyyyz + D_yzzzz*M_yzzzz + D_zzzz*M_zzzz) + (1.0d0/12.0d0)*( &
      D_xxxyy*M_xxxyy + D_xxxyyz*M_xxxyyz + D_xxxyzz*M_xxxyzz + D_xxxzz &
      *M_xxxzz + D_xxyyy*M_xxyyy + D_xxyyyz*M_xxyyyz + D_xxyzzz* &
      M_xxyzzz + D_xxzzz*M_xxzzz + D_xyyyzz*M_xyyyzz + D_xyyzzz* &
      M_xyyzzz + D_yyyzz*M_yyyzz + D_yyzzz*M_yyzzz)
    L_z      = D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yz*M_y + D_yzz* &
      M_yz + D_z*M_0 + D_zz*M_z + (1.0d0/120.0d0)*(D_xxxxxz*M_xxxxx + &
      D_yyyyyz*M_yyyyy + D_zzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyz* &
      M_xxxyy + D_xxxzzz*M_xxxzz + D_xxyyyz*M_xxyyy + D_xxzzzz*M_xxzzz &
      + D_yyyzzz*M_yyyzz + D_yyzzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyyz* &
      M_xxyy + D_xxyyzz*M_xxyyz + D_xxyzzz*M_xxyzz + D_xxzzz*M_xxzz + &
      D_xyyzzz*M_xyyzz + D_yyzzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxxyz* &
      M_xxxxy + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + D_xyyyyz*M_xyyyy + &
      D_xzzzzz*M_xzzzz + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + D_yzzzzz* &
      M_yzzzz + D_zzzzz*M_zzzz) + (1.0d0/6.0d0)*(D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy &
      + D_xyyyzz*M_xyyyz + D_xyzzzz*M_xyzzz + D_xzzzz*M_xzzz + D_yyyz* &
      M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + D_xxzz*M_xxz &
      + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz*M_xyzz + D_xzzz*M_xzz + &
      D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz*M_zz)
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  L_0                 
#undef  z                   
#undef  y                   
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
#undef  M_xxx               
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxy               
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
#undef  L_xxxx              
#undef  M_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  M_xxyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  L_xxxyy             
#undef  M_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  M_xxyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  L_xxxxxz            
#undef  M_xxxxxz            
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
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
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
