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
        
    
! OPS  50*ADD + 136*DIV + 426*MUL + 227*POW + 88*SUB = 927  (966 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u
#define x                    r(1)
#define y                    r(2)
#define z                    r(3)
#define M_0                  M(0)
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
    M_0       = W
    M_xy      = W*x*y
    M_xz      = W*x*z
    M_yz      = W*y*z
    M_xyz     = W*x*y*z
    h         = x**2 + y**2 + z**2
    M_xx      = W*(-1.0d0/3.0d0*h + x**2)
    M_yy      = W*(-1.0d0/3.0d0*h + y**2)
    M_xxx     = W*(-3.0d0/5.0d0*h*x + x**3)
    M_xxy     = W*(-1.0d0/5.0d0*h*y + x**2*y)
    M_xxz     = W*(-1.0d0/5.0d0*h*z + x**2*z)
    M_xyy     = W*(-1.0d0/5.0d0*h*x + x*y**2)
    M_yyy     = W*(-3.0d0/5.0d0*h*y + y**3)
    M_yyz     = W*(-1.0d0/5.0d0*h*z + y**2*z)
    M_xxxx    = W*((3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4)
    M_xxxy    = W*(-3.0d0/7.0d0*h*x*y + x**3*y)
    M_xxxz    = W*(-3.0d0/7.0d0*h*x*z + x**3*z)
    M_xxyy    = W*((1.0d0/35.0d0)*h**2 - 1.0d0/7.0d0*h*x**2 - 1.0d0/7.0d0*h*y**2 + x**2* &
      y**2)
    M_xxyz    = W*(-1.0d0/7.0d0*h*y*z + x**2*y*z)
    M_xyyy    = W*(-3.0d0/7.0d0*h*x*y + x*y**3)
    M_xyyz    = W*(-1.0d0/7.0d0*h*x*z + x*y**2*z)
    M_yyyy    = W*((3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4)
    M_yyyz    = W*(-3.0d0/7.0d0*h*y*z + y**3*z)
    M_xxxxx   = W*((5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5)
    M_xxxxy   = W*((1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y)
    M_xxxxz   = W*((1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z)
    M_xxxyy   = W*((1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x &
      **3*y**2)
    M_xxxyz   = W*(-1.0d0/3.0d0*h*x*y*z + x**3*y*z)
    M_xxyyy   = W*((1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x &
      **2*y**3)
    M_xxyyz   = W*((1.0d0/63.0d0)*h**2*z - 1.0d0/9.0d0*h*x**2*z - 1.0d0/9.0d0*h*y**2*z + &
      x**2*y**2*z)
    M_xyyyy   = W*((1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4)
    M_xyyyz   = W*(-1.0d0/3.0d0*h*x*y*z + x*y**3*z)
    M_yyyyy   = W*((5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5)
    M_yyyyz   = W*((1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z)
    M_xxxxxx  = W*(-5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*x**2 - 15.0d0/11.0d0*h*x**4 &
      + x**6)
    M_xxxxxy  = W*((5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x**3*y + x**5*y)
    M_xxxxxz  = W*((5.0d0/33.0d0)*h**2*x*z - 10.0d0/11.0d0*h*x**3*z + x**5*z)
    M_xxxxyy  = W*(-1.0d0/231.0d0*h**3 + (2.0d0/33.0d0)*h**2*x**2 + (1.0d0/33.0d0)*h**2* &
      y**2 - 1.0d0/11.0d0*h*x**4 - 6.0d0/11.0d0*h*x**2*y**2 + x**4*y**2 &
      )
    M_xxxxyz  = W*((1.0d0/33.0d0)*h**2*y*z - 6.0d0/11.0d0*h*x**2*y*z + x**4*y*z)
    M_xxxyyy  = W*((1.0d0/11.0d0)*h**2*x*y - 3.0d0/11.0d0*h*x**3*y - 3.0d0/11.0d0*h*x*y &
      **3 + x**3*y**3)
    M_xxxyyz  = W*((1.0d0/33.0d0)*h**2*x*z - 1.0d0/11.0d0*h*x**3*z - 3.0d0/11.0d0*h*x*y &
      **2*z + x**3*y**2*z)
    M_xxyyyy  = W*(-1.0d0/231.0d0*h**3 + (1.0d0/33.0d0)*h**2*x**2 + (2.0d0/33.0d0)*h**2* &
      y**2 - 6.0d0/11.0d0*h*x**2*y**2 - 1.0d0/11.0d0*h*y**4 + x**2*y**4 &
      )
    M_xxyyyz  = W*((1.0d0/33.0d0)*h**2*y*z - 3.0d0/11.0d0*h*x**2*y*z - 1.0d0/11.0d0*h*y &
      **3*z + x**2*y**3*z)
    M_xyyyyy  = W*((5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x*y**3 + x*y**5)
    M_xyyyyz  = W*((1.0d0/33.0d0)*h**2*x*z - 6.0d0/11.0d0*h*x*y**2*z + x*y**4*z)
    M_yyyyyy  = W*(-5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*y**2 - 15.0d0/11.0d0*h*y**4 &
      + y**6)
    M_yyyyyz  = W*((5.0d0/33.0d0)*h**2*y*z - 10.0d0/11.0d0*h*y**3*z + y**5*z)
    M_xxxxxxx = W*(-35.0d0/429.0d0*h**3*x + (105.0d0/143.0d0)*h**2*x**3 - 21.0d0/13.0d0* &
      h*x**5 + x**7)
    M_xxxxxxy = W*(-5.0d0/429.0d0*h**3*y + (45.0d0/143.0d0)*h**2*x**2*y - 15.0d0/13.0d0* &
      h*x**4*y + x**6*y)
    M_xxxxxxz = W*(-5.0d0/429.0d0*h**3*z + (45.0d0/143.0d0)*h**2*x**2*z - 15.0d0/13.0d0* &
      h*x**4*z + x**6*z)
    M_xxxxxyy = W*(-5.0d0/429.0d0*h**3*x + (10.0d0/143.0d0)*h**2*x**3 + (15.0d0/143.0d0) &
      *h**2*x*y**2 - 1.0d0/13.0d0*h*x**5 - 10.0d0/13.0d0*h*x**3*y**2 + &
      x**5*y**2)
    M_xxxxxyz = W*((15.0d0/143.0d0)*h**2*x*y*z - 10.0d0/13.0d0*h*x**3*y*z + x**5*y*z)
    M_xxxxyyy = W*(-1.0d0/143.0d0*h**3*y + (18.0d0/143.0d0)*h**2*x**2*y + (3.0d0/143.0d0 &
      )*h**2*y**3 - 3.0d0/13.0d0*h*x**4*y - 6.0d0/13.0d0*h*x**2*y**3 + &
      x**4*y**3)
    M_xxxxyyz = W*(-1.0d0/429.0d0*h**3*z + (6.0d0/143.0d0)*h**2*x**2*z + (3.0d0/143.0d0) &
      *h**2*y**2*z - 1.0d0/13.0d0*h*x**4*z - 6.0d0/13.0d0*h*x**2*y**2*z &
      + x**4*y**2*z)
    M_xxxyyyy = W*(-1.0d0/143.0d0*h**3*x + (3.0d0/143.0d0)*h**2*x**3 + (18.0d0/143.0d0)* &
      h**2*x*y**2 - 6.0d0/13.0d0*h*x**3*y**2 - 3.0d0/13.0d0*h*x*y**4 + &
      x**3*y**4)
    M_xxxyyyz = W*((9.0d0/143.0d0)*h**2*x*y*z - 3.0d0/13.0d0*h*x**3*y*z - 3.0d0/13.0d0*h &
      *x*y**3*z + x**3*y**3*z)
    M_xxyyyyy = W*(-5.0d0/429.0d0*h**3*y + (15.0d0/143.0d0)*h**2*x**2*y + (10.0d0/ &
      143.0d0)*h**2*y**3 - 10.0d0/13.0d0*h*x**2*y**3 - 1.0d0/13.0d0*h*y &
      **5 + x**2*y**5)
    M_xxyyyyz = W*(-1.0d0/429.0d0*h**3*z + (3.0d0/143.0d0)*h**2*x**2*z + (6.0d0/143.0d0) &
      *h**2*y**2*z - 6.0d0/13.0d0*h*x**2*y**2*z - 1.0d0/13.0d0*h*y**4*z &
      + x**2*y**4*z)
    M_xyyyyyy = W*(-5.0d0/429.0d0*h**3*x + (45.0d0/143.0d0)*h**2*x*y**2 - 15.0d0/13.0d0* &
      h*x*y**4 + x*y**6)
    M_xyyyyyz = W*((15.0d0/143.0d0)*h**2*x*y*z - 10.0d0/13.0d0*h*x*y**3*z + x*y**5*z)
    M_yyyyyyy = W*(-35.0d0/429.0d0*h**3*y + (105.0d0/143.0d0)*h**2*y**3 - 21.0d0/13.0d0* &
      h*y**5 + y**7)
    M_yyyyyyz = W*(-5.0d0/429.0d0*h**3*z + (45.0d0/143.0d0)*h**2*y**2*z - 15.0d0/13.0d0* &
      h*y**4*z + y**6*z)
#undef  x                   
#undef  y                   
#undef  z                   
#undef  M_0                 
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
    
! OPS  2103*ADD + 889*DIV + 5924*MUL + 1041*NEG + 227*POW + 2346*SUB = 12530  (14259 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, M_zz,&
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
                S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy, S_xxxyyz, S_xxyyyy,&
                S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy, S_yyyyyz, S_xxxxxxx,&
                S_xxxxxxy, S_xxxxxxz, S_xxxxxyy, S_xxxxxyz, S_xxxxyyy,&
                S_xxxxyyz, S_xxxyyyy, S_xxxyyyz, S_xxyyyyy, S_xxyyyyz,&
                S_xyyyyyy, S_xyyyyyz, S_yyyyyyy, S_yyyyyyz
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define z                    r(3)
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
#define Ms_xyy               Ms(9)
#define M_xyy                M(9)
#define M_xyz                M(10)
#define Ms_xyz               Ms(10)
#define Ms_yyy               Ms(11)
#define M_yyy                M(11)
#define M_yyz                M(12)
#define Ms_yyz               Ms(12)
#define M_xxxx               M(13)
#define Ms_xxxx              Ms(13)
#define M_xxxy               M(14)
#define Ms_xxxy              Ms(14)
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
#define M_yyyy               M(20)
#define Ms_yyyy              Ms(20)
#define M_yyyz               M(21)
#define Ms_yyyz              Ms(21)
#define Ms_xxxxx             Ms(22)
#define M_xxxxx              M(22)
#define Ms_xxxxy             Ms(23)
#define M_xxxxy              M(23)
#define Ms_xxxxz             Ms(24)
#define M_xxxxz              M(24)
#define Ms_xxxyy             Ms(25)
#define M_xxxyy              M(25)
#define M_xxxyz              M(26)
#define Ms_xxxyz             Ms(26)
#define Ms_xxyyy             Ms(27)
#define M_xxyyy              M(27)
#define Ms_xxyyz             Ms(28)
#define M_xxyyz              M(28)
#define Ms_xyyyy             Ms(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define Ms_xyyyz             Ms(30)
#define M_yyyyy              M(31)
#define Ms_yyyyy             Ms(31)
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
#define M_xxyyyz             M(41)
#define Ms_xxyyyz            Ms(41)
#define Ms_xyyyyy            Ms(42)
#define M_xyyyyy             M(42)
#define Ms_xyyyyz            Ms(43)
#define M_xyyyyz             M(43)
#define Ms_yyyyyy            Ms(44)
#define M_yyyyyy             M(44)
#define M_yyyyyz             M(45)
#define Ms_yyyyyz            Ms(45)
#define Ms_xxxxxxx           Ms(46)
#define M_xxxxxxx            M(46)
#define Ms_xxxxxxy           Ms(47)
#define M_xxxxxxy            M(47)
#define Ms_xxxxxxz           Ms(48)
#define M_xxxxxxz            M(48)
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
#define Ms_xxyyyyz           Ms(56)
#define M_xxyyyyz            M(56)
#define M_xyyyyyy            M(57)
#define Ms_xyyyyyy           Ms(57)
#define M_xyyyyyz            M(58)
#define Ms_xyyyyyz           Ms(58)
#define Ms_yyyyyyy           Ms(59)
#define M_yyyyyyy            M(59)
#define M_yyyyyyz            M(60)
#define Ms_yyyyyyz           Ms(60)
    Ms_0       = M_0
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    S_0        = 1
    S_x        = x
    S_y        = y
    S_z        = z
    S_xy       = x*y
    Ms_xy      = M_0*S_xy + M_xy
    S_xz       = x*z
    Ms_xz      = M_0*S_xz + M_xz
    S_yz       = y*z
    Ms_yz      = M_0*S_yz + M_yz
    S_xyz      = x*y*z
    Ms_xyz     = M_0*S_xyz + M_xy*z + M_xyz + M_xz*y + M_yz*x
    h          = x**2 + y**2 + z**2
    S_xx       = -1.0d0/3.0d0*h + x**2
    Ms_xx      = M_0*S_xx + M_xx
    S_yy       = -1.0d0/3.0d0*h + y**2
    Ms_yy      = M_0*S_yy + M_yy
    S_zz       = -(S_xx + S_yy)
    S_xxx      = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx     = M_0*S_xxx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(M_xx*x - M_xy*y - M_xz*z)
    S_xxy      = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy     = M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (8.0d0/5.0d0)*M_xy*x - 1.0d0/ &
      5.0d0*(3*M_yy*y + 2*M_yz*z + y*(-M_xx - M_yy))
    S_xxz      = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz     = M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (8.0d0/5.0d0)*M_xz*x - 1.0d0/ &
      5.0d0*(M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy))
    S_xyy      = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy     = M_0*S_xyy + (8.0d0/5.0d0)*M_xy*y + M_xyy + (4.0d0/5.0d0)*M_yy*x - 1.0d0/ &
      5.0d0*(3*M_xx*x + 2*M_xz*z + x*(-M_xx - M_yy))
    S_xzz      = -(S_xxx + S_xyy)
    S_yyy      = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy     = M_0*S_yyy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(-M_xy*x + M_yy*y - M_yz*z)
    S_yyz      = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz     = M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (8.0d0/5.0d0)*M_yz*y - 1.0d0/ &
      5.0d0*(M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy))
    S_yzz      = -(S_xxy + S_yyy)
    S_zzz      = -(S_xxz + S_yyz)
    S_xxxx     = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4
    Ms_xxxx    = M_0*S_xxxx + (72.0d0/35.0d0)*M_xx*S_xx - 6.0d0/35.0d0*M_xxyy + (24.0d0/ &
      35.0d0)*M_yz*S_yz + (32.0d0/35.0d0)*(M_xxx*x + M_xxxx) - 96.0d0/ &
      35.0d0*(M_xy*S_xy + M_xz*S_xz) + (1.0d0/210.0d0)*(M_yy*(-180*S_xx &
      + 72*S_yy) + (-M_xx - M_yy)*(-252*S_xx - 72*S_yy)) - 3.0d0/35.0d0 &
      *(M_xxzz + M_yyyy + M_yyzz) - 48.0d0/35.0d0*(M_xxy*y + M_xxz*z + &
      M_xyy*x + x*(-M_xxx - M_xyy)) + (12.0d0/35.0d0)*(M_yyy*y + M_yyz* &
      z + y*(-M_xxy - M_yyy) + z*(-M_xxz - M_yyz))
    S_xxxy     = -3.0d0/7.0d0*h*x*y + x**3*y
    Ms_xxxy    = M_0*S_xxxy + (4.0d0/7.0d0)*M_xxx*y + M_xxxy + (1.0d0/105.0d0)*M_xy*(225* &
      S_xx - 90*S_yy) + (12.0d0/7.0d0)*(M_xx*S_xy + M_xxy*x) - 9.0d0/ &
      7.0d0*(M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz*S_yz + &
      M_yz*S_xz) - 3.0d0/7.0d0*(M_yyy*x + S_xy*(-M_xx - M_yy) + x*( &
      -M_xxy - M_yyy) + y*(-M_xxx - M_xyy))
    S_xxxz     = -3.0d0/7.0d0*h*x*z + x**3*z
    Ms_xxxz    = M_0*S_xxxz + (4.0d0/7.0d0)*M_xxx*z + M_xxxz + (1.0d0/105.0d0)*M_xz*(315* &
      S_xx + 90*S_yy) + (12.0d0/7.0d0)*(M_xx*S_xz + M_xxz*x) - 9.0d0/ &
      7.0d0*(S_xz*(-M_xx - M_yy) + z*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*( &
      M_xy*S_yz + M_xyz*y + M_yz*S_xy) - 3.0d0/7.0d0*(M_xyy*z + M_yy* &
      S_xz + M_yyz*x + x*(-M_xxz - M_yyz))
    S_xxyy     = (1.0d0/35.0d0)*h**2 + x**2*y**2 - 1.0d0/7.0d0*(h*x**2 + h*y**2)
    Ms_xxyy    = M_0*S_xxyy + (33.0d0/35.0d0)*M_xxyy + (108.0d0/35.0d0)*M_xy*S_xy + ( &
      4.0d0/35.0d0)*z*(-M_xxz - M_yyz) + (54.0d0/35.0d0)*(M_xxy*y + &
      M_xyy*x) + (1.0d0/210.0d0)*(M_xx*(-126*S_xx + 180*S_yy) + M_yy*( &
      180*S_xx - 126*S_yy) + (-M_xx - M_yy)*(-54*S_xx - 54*S_yy)) - &
      1.0d0/35.0d0*(16*M_xxx*x + M_xxxx + 6*M_xxz*z + M_xxzz + 12*M_xz* &
      S_xz + 16*M_yyy*y + M_yyyy + 6*M_yyz*z + M_yyzz + 12*M_yz*S_yz + &
      6*x*(-M_xxx - M_xyy) + 6*y*(-M_xxy - M_yyy))
    S_xxyz     = -1.0d0/7.0d0*h*y*z + x**2*y*z
    Ms_xxyz    = M_0*S_xxyz + M_xxyz + (9.0d0/7.0d0)*M_yz*S_xx + (6.0d0/7.0d0)*(M_xx*S_yz &
      + M_xxy*z + M_xxz*y) + (12.0d0/7.0d0)*(M_xy*S_xz + M_xyz*x + M_xz &
      *S_xy) - 1.0d0/7.0d0*(3*M_yy*S_yz + M_yyy*z + 3*M_yyz*y + 3*S_yz* &
      (-M_xx - M_yy) + y*(-M_xxz - M_yyz) + 3*z*(-M_xxy - M_yyy))
    S_xxzz     = -(S_xxxx + S_xxyy)
    S_xyyy     = -3.0d0/7.0d0*h*x*y + x*y**3
    Ms_xyyy    = M_0*S_xyyy + (1.0d0/105.0d0)*M_xy*(-90*S_xx + 225*S_yy) + M_xyyy + ( &
      4.0d0/7.0d0)*M_yyy*x - 9.0d0/7.0d0*(M_xx*S_xy + M_xxy*x) + ( &
      12.0d0/7.0d0)*(M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz &
      *S_yz + M_yz*S_xz) - 3.0d0/7.0d0*(M_xxx*y + S_xy*(-M_xx - M_yy) + &
      x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy))
    S_xyyz     = -1.0d0/7.0d0*h*x*z + x*y**2*z
    Ms_xyyz    = M_0*S_xyyz + M_xyyz + (9.0d0/7.0d0)*M_xz*S_yy + (12.0d0/7.0d0)*(M_xy* &
      S_yz + M_xyz*y + M_yz*S_xy) + (6.0d0/7.0d0)*(M_xyy*z + M_yy*S_xz &
      + M_yyz*x) - 1.0d0/7.0d0*(3*M_xx*S_xz + M_xxx*z + 3*M_xxz*x + 3* &
      S_xz*(-M_xx - M_yy) + x*(-M_xxz - M_yyz) + 3*z*(-M_xxx - M_xyy))
    S_xyzz     = -(S_xxxy + S_xyyy)
    S_xzzz     = -(S_xxxz + S_xyyz)
    S_yyyy     = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4
    Ms_yyyy    = M_0*S_yyyy - 6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_xz*S_xz + (72.0d0/ &
      35.0d0)*M_yy*S_yy + (1.0d0/210.0d0)*(M_xx*(72*S_xx - 180*S_yy) + &
      (-M_xx - M_yy)*(-72*S_xx - 252*S_yy)) - 96.0d0/35.0d0*(M_xy*S_xy &
      + M_yz*S_yz) + (32.0d0/35.0d0)*(M_yyy*y + M_yyyy) - 3.0d0/35.0d0* &
      (M_xxxx + M_xxzz + M_yyzz) + (12.0d0/35.0d0)*(M_xxx*x + M_xxz*z + &
      x*(-M_xxx - M_xyy) + z*(-M_xxz - M_yyz)) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xyy*x + M_yyz*z + y*(-M_xxy - M_yyy))
    S_yyyz     = -3.0d0/7.0d0*h*y*z + y**3*z
    Ms_yyyz    = M_0*S_yyyz + (4.0d0/7.0d0)*M_yyy*z + M_yyyz + (1.0d0/105.0d0)*M_yz*(90* &
      S_xx + 315*S_yy) + (12.0d0/7.0d0)*(M_yy*S_yz + M_yyz*y) - 9.0d0/ &
      7.0d0*(S_yz*(-M_xx - M_yy) + z*(-M_xxy - M_yyy)) - 6.0d0/7.0d0*( &
      M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 3.0d0/7.0d0*(M_xx*S_yz + M_xxy &
      *z + M_xxz*y + y*(-M_xxz - M_yyz))
    S_yyzz     = -(S_xxyy + S_yyyy)
    S_yzzz     = -(S_xxyz + S_yyyz)
    S_zzzz     = -(S_xxzz + S_yyzz)
    S_xxxxx    = (5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5
    Ms_xxxxx   = M_0*S_xxxxx + (200.0d0/63.0d0)*M_xx*S_xxx + (40.0d0/63.0d0)*M_xxxx*x + ( &
      16.0d0/21.0d0)*M_xxxxx + (10.0d0/21.0d0)*(-M_xxxyy + x*(-M_xxyy - &
      M_yyyy)) - 80.0d0/63.0d0*(M_xxxy*y + M_xxxz*z) - 80.0d0/21.0d0*( &
      M_xxy*S_xy + M_xxz*S_xz) - 100.0d0/21.0d0*(M_xy*S_xxy + M_xz* &
      S_xxz) + (1.0d0/1890.0d0)*(M_xyy*(-4500*S_xx + 1800*S_yy) + M_yy* &
      (-2100*S_xxx + 1800*S_xyy) + (-M_xx - M_yy)*(-3900*S_xxx - 1800* &
      S_xyy) + (-M_xxx - M_xyy)*(-6300*S_xx - 1800*S_yy)) + (5.0d0/ &
      21.0d0)*(-M_xxxzz - M_xyyyy - M_xyyzz + M_yyyy*x + x*(-M_xxzz - &
      M_yyzz)) + (40.0d0/21.0d0)*(M_xxx*S_xx - M_xxyy*x + M_xyz*S_yz + &
      M_yz*S_xyz - x*(-M_xxxx - M_xxyy)) + (20.0d0/21.0d0)*(M_xyyy*y + &
      M_xyyz*z + M_yyy*S_xy + M_yyz*S_xz + S_xy*(-M_xxy - M_yyy) + S_xz &
      *(-M_xxz - M_yyz) + y*(-M_xxxy - M_xyyy) + z*(-M_xxxz - M_xyyz))
    S_xxxxy    = (1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y
    Ms_xxxxy   = M_0*S_xxxxy + (20.0d0/7.0d0)*M_xx*S_xxy - 12.0d0/7.0d0*M_xxyy*y - 24.0d0 &
      /7.0d0*M_xyy*S_xy + (1.0d0/5670.0d0)*M_yyy*(-3780*S_xx + 2160* &
      S_yy) - 6.0d0/7.0d0*S_xx*(-M_xxy - M_yyy) + (2.0d0/7.0d0)*y*( &
      -M_xxyy - M_yyyy) + (1.0d0/945.0d0)*(M_xy*(2520*S_xxx - 2160* &
      S_xyy) + M_yz*(-1260*S_xxz + 360*S_yyz)) - 16.0d0/7.0d0*(M_xyz* &
      S_xz + M_xz*S_xyz) + (4.0d0/7.0d0)*(M_yyz*S_yz - y*(-M_xxxx - &
      M_xxyy)) + (1.0d0/1890.0d0)*(M_xxy*(5400*S_xx - 2160*S_yy) + M_yy &
      *(-3780*S_xxy + 360*S_yyy) + (-M_xx - M_yy)*(-1620*S_xxy - 360* &
      S_yyy)) - 8.0d0/7.0d0*(M_xxyz*z + M_xxz*S_yz + M_xyyy*x + S_xy*( &
      -M_xxx - M_xyy) + x*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(32* &
      M_xxx*S_xy + 8*M_xxxx*y + 20*M_xxxxy + 32*M_xxxy*x - 2*M_xxyyy - &
      M_xxyzz + 5*M_yyyy*y - M_yyyyy + 4*M_yyyz*z - M_yyyzz + 4*S_yz*( &
      -M_xxz - M_yyz) + y*(-M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz))
    S_xxxxz    = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z
    Ms_xxxxz   = M_0*S_xxxxz + (20.0d0/7.0d0)*M_xx*S_xxz - 6.0d0/7.0d0*M_yyz*S_xx - &
      24.0d0/7.0d0*S_xz*(-M_xxx - M_xyy) - 12.0d0/7.0d0*z*(-M_xxxx - &
      M_xxyy) + (2.0d0/7.0d0)*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*( &
      -M_xxz - M_yyz)*(-5940*S_xx - 2160*S_yy) + (4.0d0/7.0d0)*(-M_xxyy &
      *z + S_yz*(-M_xxy - M_yyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz* &
      S_xy) + (1.0d0/945.0d0)*(M_xz*(4680*S_xxx + 2160*S_xyy) + M_yz*( &
      -1620*S_xxy - 360*S_yyy)) + (1.0d0/1890.0d0)*(M_xxz*(7560*S_xx + &
      2160*S_yy) + M_yy*(-1260*S_xxz + 360*S_yyz) + (-M_xx - M_yy)*( &
      -4140*S_xxz - 360*S_yyz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + x*(-M_xxxz - M_xyyz)) + (1.0d0/21.0d0)*( &
      32*M_xxx*S_xz + 8*M_xxxx*z + 20*M_xxxxz + 32*M_xxxz*x - 2*M_xxyyz &
      - M_xxzzz + 4*M_yyy*S_yz + M_yyyy*z - M_yyyyz + 4*M_yyyz*y - &
      M_yyzzz + 4*y*(-M_xxyz - M_yyyz) + 5*z*(-M_xxzz - M_yyzz))
    S_xxxyy    = (1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x**3 &
      *y**2
    Ms_xxxyy   = M_0*S_xxxyy + (1.0d0/5670.0d0)*M_xxx*(-3510*S_xx + 3780*S_yy) - 20.0d0/ &
      63.0d0*M_xxxx*x + (82.0d0/63.0d0)*M_xxxy*y - 2.0d0/63.0d0*M_xxxz* &
      z - 2.0d0/7.0d0*M_yyyy*x + (1.0d0/945.0d0)*(M_xy*(4140*S_xxy - &
      630*S_yyy) + M_xz*(-270*S_xxz - 630*S_yyz)) - 8.0d0/7.0d0*(M_xyyy &
      *y + M_yyy*S_xy) + (1.0d0/1890.0d0)*(M_xx*(-1110*S_xxx + 3780* &
      S_xyy) + M_xyy*(4140*S_xx - 2790*S_yy) + M_yy*(1680*S_xxx - 2790* &
      S_xyy) + (-M_xx - M_yy)*(-570*S_xxx - 990*S_xyy) + (-M_xxx - &
      M_xyy)*(-630*S_xx - 990*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxx + 19* &
      M_xxxyy - M_xxxzz + 82*M_xxy*S_xy + 41*M_xxyy*x - 2*M_xxz*S_xz - &
      M_xyyyy - 10*M_xyyz*z - M_xyyzz - 20*M_xyz*S_yz - 10*M_yyz*S_xz - &
      20*M_yz*S_xyz - 10*S_xy*(-M_xxy - M_yyy) + 4*S_xz*(-M_xxz - M_yyz &
      ) - x*(-M_xxxx - M_xxyy) - 5*x*(-M_xxyy - M_yyyy) + x*(-M_xxzz - &
      M_yyzz) - 10*y*(-M_xxxy - M_xyyy) + 4*z*(-M_xxxz - M_xyyz))
    S_xxxyz    = -1.0d0/3.0d0*h*x*y*z + x**3*y*z
    Ms_xxxyz   = M_0*S_xxxyz + M_xxxyz + 3*M_xyz*S_xx + (5.0d0/3.0d0)*M_yz*S_xxx + (1.0d0 &
      /945.0d0)*(M_xy*(2205*S_xxz - 630*S_yyz) + M_xz*(2835*S_xxy + 630 &
      *S_yyy)) + 2*(M_xx*S_xyz + 3*M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz*y &
      + M_xxy*S_xz + M_xxyz*x + M_xxz*S_xy) - (M_xyy*S_yz + 3*M_xyyy*z &
      + M_xyyz*y + M_yy*S_xyz + 3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy &
      + 3*S_xy*(-M_xxz - M_yyz) + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - &
      M_yyy) + S_yz*(-M_xxx - M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*( &
      -M_xxxz - M_xyyz) + z*(-M_xxxy - M_xyyy))
    S_xxxzz    = -(S_xxxxx + S_xxxyy)
    S_xxyyy    = (1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x**2 &
      *y**3
    Ms_xxyyy   = M_0*S_xxyyy - 2.0d0/7.0d0*M_xxxx*y + (82.0d0/63.0d0)*M_xyyy*x + (1.0d0/ &
      5670.0d0)*M_yyy*(3780*S_xx - 3510*S_yy) - 20.0d0/63.0d0*M_yyyy*y &
      - 2.0d0/63.0d0*M_yyyz*z - 8.0d0/7.0d0*(M_xxx*S_xy + M_xxxy*x) + ( &
      1.0d0/945.0d0)*(M_xy*(-630*S_xxx + 4140*S_xyy) + M_yz*(-630*S_xxz &
      - 270*S_yyz)) + (1.0d0/1890.0d0)*(M_xx*(-2790*S_xxy + 1680*S_yyy &
      ) + M_xxy*(-2790*S_xx + 4140*S_yy) + M_yy*(3780*S_xxy - 1110* &
      S_yyy) + (-M_xx - M_yy)*(-990*S_xxy - 570*S_yyy) + (-M_xxy - &
      M_yyy)*(-990*S_xx - 630*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxy + 41* &
      M_xxyy*y + 19*M_xxyyy - 10*M_xxyz*z - M_xxyzz - 10*M_xxz*S_yz + &
      82*M_xyy*S_xy - 20*M_xyz*S_xz - 20*M_xz*S_xyz - M_yyyyy - M_yyyzz &
      - 2*M_yyz*S_yz - 10*S_xy*(-M_xxx - M_xyy) + 4*S_yz*(-M_xxz - &
      M_yyz) - 10*x*(-M_xxxy - M_xyyy) - 5*y*(-M_xxxx - M_xxyy) - y*( &
      -M_xxyy - M_yyyy) + y*(-M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz &
      ))
    S_xxyyz    = (1.0d0/63.0d0)*h**2*z + x**2*y**2*z - 1.0d0/9.0d0*(h*x**2*z + h*y**2*z)
    Ms_xxyyz   = M_0*S_xxyyz + (17.0d0/21.0d0)*M_xxyy*z + (61.0d0/63.0d0)*M_xxyyz + ( &
      5.0d0/63.0d0)*z*(-M_xxzz - M_yyzz) + (1.0d0/5670.0d0)*(-M_xxz - &
      M_yyz)*(-1350*S_xx - 1350*S_yy) - 2.0d0/21.0d0*(M_xxxx*z + M_yyyy &
      *z) + (68.0d0/21.0d0)*(M_xy*S_xyz + M_xyz*S_xy) + (1.0d0/945.0d0) &
      *(M_xz*(90*S_xxx + 1980*S_xyy) + M_yz*(1980*S_xxy + 90*S_yyy)) - &
      10.0d0/21.0d0*(S_xz*(-M_xxx - M_xyy) + S_yz*(-M_xxy - M_yyy)) - &
      5.0d0/21.0d0*(z*(-M_xxxx - M_xxyy) + z*(-M_xxyy - M_yyyy)) - &
      8.0d0/21.0d0*(M_xxx*S_xz + M_xxxz*x + M_yyy*S_yz + M_yyyz*y) + ( &
      34.0d0/21.0d0)*(M_xxy*S_yz + M_xxyz*y + M_xyy*S_xz + M_xyyz*x) + &
      (1.0d0/1890.0d0)*(M_xx*(-930*S_xxz + 1680*S_yyz) + M_xxz*(-630* &
      S_xx + 1980*S_yy) + M_yy*(1680*S_xxz - 930*S_yyz) + M_yyz*(1980* &
      S_xx - 630*S_yy) + (-M_xx - M_yy)*(-750*S_xxz - 750*S_yyz)) - &
      1.0d0/63.0d0*(M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + 10*x*( &
      -M_xxxz - M_xyyz) + 10*y*(-M_xxyz - M_yyyz))
    S_xxyzz    = -(S_xxxxy + S_xxyyy)
    S_xxzzz    = -(S_xxxxz + S_xxyyz)
    S_xyyyy    = (1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4
    Ms_xyyyy   = M_0*S_xyyyy + (1.0d0/5670.0d0)*M_xxx*(2160*S_xx - 3780*S_yy) - 24.0d0/ &
      7.0d0*M_xxy*S_xy - 12.0d0/7.0d0*M_xxyy*x + (20.0d0/7.0d0)*M_yy* &
      S_xyy - 6.0d0/7.0d0*S_yy*(-M_xxx - M_xyy) + (2.0d0/7.0d0)*x*( &
      -M_xxxx - M_xxyy) + (4.0d0/7.0d0)*(M_xxz*S_xz - x*(-M_xxyy - &
      M_yyyy)) + (1.0d0/945.0d0)*(M_xy*(-2160*S_xxy + 2520*S_yyy) + &
      M_xz*(360*S_xxz - 1260*S_yyz)) - 16.0d0/7.0d0*(M_xyz*S_yz + M_yz* &
      S_xyz) + (1.0d0/1890.0d0)*(M_xx*(360*S_xxx - 3780*S_xyy) + M_xyy* &
      (-2160*S_xx + 5400*S_yy) + (-M_xx - M_yy)*(-360*S_xxx - 1620* &
      S_xyy)) - 8.0d0/7.0d0*(M_xxxy*y + M_xyyz*z + M_yyz*S_xz + S_xy*( &
      -M_xxy - M_yyy) + y*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(5* &
      M_xxxx*x - M_xxxxx - 2*M_xxxyy + 4*M_xxxz*z - M_xxxzz + 32*M_xyyy &
      *y + 20*M_xyyyy - M_xyyzz + 32*M_yyy*S_xy + 8*M_yyyy*x + 4*S_xz*( &
      -M_xxz - M_yyz) + x*(-M_xxzz - M_yyzz) + 4*z*(-M_xxxz - M_xyyz))
    S_xyyyz    = -1.0d0/3.0d0*h*x*y*z + x*y**3*z
    Ms_xyyyz   = M_0*S_xyyyz + M_xyyyz + 3*M_xyz*S_yy + (5.0d0/3.0d0)*M_xz*S_yyy + (1.0d0 &
      /945.0d0)*(M_xy*(-630*S_xxz + 2205*S_yyz) + M_yz*(630*S_xxx + &
      2835*S_xyy)) + 2*(M_xyy*S_yz + 3*M_xyyy*z + M_xyyz*y + M_yy*S_xyz &
      + 3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy) - (M_xx*S_xyz + 3*M_xxx &
      *S_yz + 3*M_xxxy*z + 3*M_xxxz*y + M_xxy*S_xz + M_xxyz*x + M_xxz* &
      S_xy + 3*S_xy*(-M_xxz - M_yyz) + S_xyz*(-M_xx - M_yy) + S_xz*( &
      -M_xxy - M_yyy) + S_yz*(-M_xxx - M_xyy) + 3*x*(-M_xxyz - M_yyyz) &
      + 3*y*(-M_xxxz - M_xyyz) + z*(-M_xxxy - M_xyyy))
    S_xyyzz    = -(S_xxxyy + S_xyyyy)
    S_xyzzz    = -(S_xxxyz + S_xyyyz)
    S_xzzzz    = -(S_xxxzz + S_xyyzz)
    S_yyyyy    = (5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5
    Ms_yyyyy   = M_0*S_yyyyy + (200.0d0/63.0d0)*M_yy*S_yyy + (40.0d0/63.0d0)*M_yyyy*y + ( &
      16.0d0/21.0d0)*M_yyyyy + (10.0d0/21.0d0)*(-M_xxyyy + y*(-M_xxxx - &
      M_xxyy)) - 100.0d0/21.0d0*(M_xy*S_xyy + M_yz*S_yyz) - 80.0d0/ &
      21.0d0*(M_xyy*S_xy + M_yyz*S_yz) - 80.0d0/63.0d0*(M_xyyy*x + &
      M_yyyz*z) + (1.0d0/1890.0d0)*(M_xx*(1800*S_xxy - 2100*S_yyy) + &
      M_xxy*(1800*S_xx - 4500*S_yy) + (-M_xx - M_yy)*(-1800*S_xxy - &
      3900*S_yyy) + (-M_xxy - M_yyy)*(-1800*S_xx - 6300*S_yy)) + (5.0d0 &
      /21.0d0)*(M_xxxx*y - M_xxxxy - M_xxyzz - M_yyyzz + y*(-M_xxzz - &
      M_yyzz)) + (40.0d0/21.0d0)*(-M_xxyy*y + M_xyz*S_xz + M_xz*S_xyz + &
      M_yyy*S_yy - y*(-M_xxyy - M_yyyy)) + (20.0d0/21.0d0)*(M_xxx*S_xy &
      + M_xxxy*x + M_xxyz*z + M_xxz*S_yz + S_xy*(-M_xxx - M_xyy) + S_yz &
      *(-M_xxz - M_yyz) + x*(-M_xxxy - M_xyyy) + z*(-M_xxyz - M_yyyz))
    S_yyyyz    = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z
    Ms_yyyyz   = M_0*S_yyyyz - 6.0d0/7.0d0*M_xxz*S_yy + (20.0d0/7.0d0)*M_yy*S_yyz - &
      24.0d0/7.0d0*S_yz*(-M_xxy - M_yyy) + (2.0d0/7.0d0)*z*(-M_xxxx - &
      M_xxyy) - 12.0d0/7.0d0*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*( &
      -M_xxz - M_yyz)*(-2160*S_xx - 5940*S_yy) + (4.0d0/7.0d0)*(-M_xxyy &
      *z + S_xz*(-M_xxx - M_xyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz* &
      S_xy) + (1.0d0/945.0d0)*(M_xz*(-360*S_xxx - 1620*S_xyy) + M_yz*( &
      2160*S_xxy + 4680*S_yyy)) + (1.0d0/1890.0d0)*(M_xx*(360*S_xxz - &
      1260*S_yyz) + M_yyz*(2160*S_xx + 7560*S_yy) + (-M_xx - M_yy)*( &
      -360*S_xxz - 4140*S_yyz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + y*(-M_xxyz - M_yyyz)) + (1.0d0/21.0d0)*(4 &
      *M_xxx*S_xz + M_xxxx*z - M_xxxxz + 4*M_xxxz*x - 2*M_xxyyz - &
      M_xxzzz + 32*M_yyy*S_yz + 8*M_yyyy*z + 20*M_yyyyz + 32*M_yyyz*y - &
      M_yyzzz + 4*x*(-M_xxxz - M_xyyz) + 5*z*(-M_xxzz - M_yyzz))
    S_yyyzz    = -(S_xxyyy + S_yyyyy)
    S_yyzzz    = -(S_xxyyz + S_yyyyz)
    S_yzzzz    = -(S_xxyzz + S_yyyzz)
    S_zzzzz    = -(S_xxzzz + S_yyzzz)
    S_xxxxxx   = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*x**2 - 15.0d0/11.0d0*h*x**4 + &
      x**6
    Ms_xxxxxx  = M_0*S_xxxxxx + (800.0d0/231.0d0)*M_xxx*S_xxx + (32.0d0/77.0d0)*M_xxxxx*x &
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
      - M_xyyzz)) - 10.0d0/77.0d0*(M_yyyyy*y + M_yyyyz*z + y*(-M_xxyzz &
      - M_yyyzz) + z*(-M_xxzzz - M_yyzzz)) + (240.0d0/77.0d0)*(M_xxyz* &
      S_yz + M_xyyy*S_xy + M_xyyz*S_xz + S_xy*(-M_xxxy - M_xyyy) + S_xz &
      *(-M_xxxz - M_xyyz)) + (120.0d0/77.0d0)*(M_xxxx*S_xx + M_xxyyy*y &
      + M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y*(-M_xxxxy - M_xxyyy) + z &
      *(-M_xxxxz - M_xxyyz)) + (1.0d0/20790.0d0)*(M_xx*(86400*S_xxxx - &
      16200*S_xxyy - 8100*S_xxzz - 8100*S_yyyy - 8100*S_yyzz) + M_xyy*( &
      -75600*S_xxx + 64800*S_xyy) + M_yy*(-27000*S_xxxx + 40500*S_xxyy &
      + 1350*S_xxzz + 1350*S_yyyy + 1350*S_yyzz) + M_yyz*(37800*S_xxz - &
      10800*S_yyz) + (-M_xx - M_yy)*(-59400*S_xxxx - 24300*S_xxyy + &
      6750*S_xxzz + 6750*S_yyyy + 6750*S_yyzz) + (-M_xxx - M_xyy)*( &
      -140400*S_xxx - 64800*S_xyy) + (-M_xxy - M_yyy)*(48600*S_xxy + &
      10800*S_yyy))
    S_xxxxxy   = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x**3*y + x**5*y
    Ms_xxxxxy  = M_0*S_xxxxxy + (100.0d0/33.0d0)*M_xxx*S_xxy + (8.0d0/33.0d0)*M_xxxxx*y + &
      (28.0d0/33.0d0)*M_xxxxxy - 60.0d0/11.0d0*M_xxyy*S_xy - 30.0d0/ &
      11.0d0*S_xx*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_xxx*(-M_xxy - &
      M_yyy) + (10.0d0/33.0d0)*(-M_xxxyyy + x*(-M_xxyyy - M_yyyyy)) + ( &
      140.0d0/33.0d0)*(M_xx*S_xxxy - M_xz*S_xxyz) - 40.0d0/11.0d0*( &
      M_xxyz*S_xz + M_xxz*S_xyz) + (25.0d0/33.0d0)*(M_xyyyy*y + M_yyyy* &
      S_xy) + (10.0d0/11.0d0)*(S_xy*(-M_xxyy - M_yyyy) + y*(-M_xxxyy - &
      M_xyyyy)) + (1.0d0/62370.0d0)*(M_xxxy*(189000*S_xx - 75600*S_yy) &
      + M_xyyy*(-132300*S_xx + 75600*S_yy) + M_yyy*(-56700*S_xxx + &
      75600*S_xyy)) + (1.0d0/10395.0d0)*(M_xy*(31500*S_xxxx - 47250* &
      S_xxyy - 1575*S_xxzz - 1575*S_yyyy - 1575*S_yyzz) + M_xyz*(-44100 &
      *S_xxz + 12600*S_yyz) + M_yz*(-18900*S_xxxz + 12600*S_xyyz)) + ( &
      40.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x - M_xxxyz*z - M_xxxz*S_yz &
      ) + (1.0d0/20790.0d0)*(M_xxy*(88200*S_xxx - 75600*S_xyy) + M_xyy* &
      (-132300*S_xxy + 12600*S_yyy) + M_yy*(-56700*S_xxxy + 12600* &
      S_xyyy) + (-M_xx - M_yy)*(-31500*S_xxxy - 12600*S_xyyy) + (-M_xxx &
      - M_xyy)*(-56700*S_xxy - 12600*S_yyy)) + (20.0d0/11.0d0)*( &
      -M_xxxyy*y - M_xxyyy*x + M_xyyz*S_yz + M_yyz*S_xyz - S_xy*( &
      -M_xxxx - M_xxyy) - x*(-M_xxxxy - M_xxyyy)) + (5.0d0/33.0d0)*( &
      -M_xxxyzz - M_xyyyyy - M_xyyyzz + M_yyyyy*x + S_xy*(-M_xxzz - &
      M_yyzz) + x*(-M_xxyzz - M_yyyzz) + y*(-M_xxxzz - M_xyyzz)) + ( &
      20.0d0/33.0d0)*(M_xyyyz*z + M_yyyz*S_xz + S_xyz*(-M_xxz - M_yyz) &
      + S_xz*(-M_xxyz - M_yyyz) + S_yz*(-M_xxxz - M_xyyz) - y*(-M_xxxxx &
      - M_xxxyy) + z*(-M_xxxyz - M_xyyyz))
    S_xxxxxz   = (5.0d0/33.0d0)*h**2*x*z - 10.0d0/11.0d0*h*x**3*z + x**5*z
    Ms_xxxxxz  = M_0*S_xxxxxz + (100.0d0/33.0d0)*M_xxx*S_xxz + (8.0d0/33.0d0)*M_xxxxx*z + &
      (28.0d0/33.0d0)*M_xxxxxz - 30.0d0/11.0d0*M_xyyz*S_xx - 50.0d0/ &
      33.0d0*M_yyz*S_xxx - 60.0d0/11.0d0*S_xz*(-M_xxxx - M_xxyy) + ( &
      10.0d0/33.0d0)*(-M_xxxyyz + x*(-M_xxyyz - M_yyyyz)) + (140.0d0/ &
      33.0d0)*(M_xx*S_xxxz - M_xy*S_xxyz) - 40.0d0/11.0d0*(M_xxy*S_xyz &
      + M_xxyz*S_xy) + (10.0d0/11.0d0)*(S_xz*(-M_xxyy - M_yyyy) + z*( &
      -M_xxxyy - M_xyyyy)) + (25.0d0/33.0d0)*(S_xz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxxzz - M_xyyzz)) + (1.0d0/62370.0d0)*(M_xxxz*(264600*S_xx &
      + 75600*S_yy) + (-M_xxxz - M_xyyz)*(-207900*S_xx - 75600*S_yy) + &
      (-M_xxz - M_yyz)*(-132300*S_xxx - 75600*S_xyy)) + (1.0d0/ &
      10395.0d0)*(M_xyz*(-56700*S_xxy - 12600*S_yyy) + M_xz*(69300* &
      S_xxxx + 28350*S_xxyy - 7875*S_xxzz - 7875*S_yyyy - 7875*S_yyzz) &
      + M_yz*(-31500*S_xxxy - 12600*S_xyyy)) + (40.0d0/33.0d0)*(M_xxxx* &
      S_xz + M_xxxxz*x - M_xxxy*S_yz - M_xxxyz*y) + (1.0d0/20790.0d0)*( &
      M_xxz*(163800*S_xxx + 75600*S_xyy) + M_xyy*(-44100*S_xxz + 12600* &
      S_yyz) + M_yy*(-18900*S_xxxz + 12600*S_xyyz) + (-M_xx - M_yy)*( &
      -69300*S_xxxz - 12600*S_xyyz) + (-M_xxx - M_xyy)*(-144900*S_xxz - &
      12600*S_yyz)) + (20.0d0/11.0d0)*(-M_xxyy*S_xz - M_xxyyz*x + S_xyz &
      *(-M_xxy - M_yyy) + S_yz*(-M_xxxy - M_xyyy) - x*(-M_xxxxz - &
      M_xxyyz) - z*(-M_xxxxx - M_xxxyy)) + (5.0d0/33.0d0)*(-M_xxxzzz + &
      M_xyyyy*z - M_xyyyyz - M_xyyzzz + M_yyyy*S_xz + M_yyyyz*x + x*( &
      -M_xxzzz - M_yyzzz)) + (20.0d0/33.0d0)*(-M_xxxyy*z + M_xyyy*S_yz &
      + M_xyyyz*y + M_yyy*S_xyz + M_yyyz*S_xy + S_xy*(-M_xxyz - M_yyyz &
      ) + y*(-M_xxxyz - M_xyyyz))
    S_xxxxyy   = -1.0d0/231.0d0*h**3 + x**4*y**2 - 1.0d0/11.0d0*(h*x**4 + 6*h*x**2*y**2) &
      + (1.0d0/33.0d0)*(2*h**2*x**2 + h**2*y**2)
    Ms_xxxxyy  = M_0*S_xxxxyy - 16.0d0/77.0d0*M_xxxxx*x - 4.0d0/77.0d0*M_xxxxxx - 5.0d0/ &
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
      -M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_xy*(57960*S_xxxy - &
      20160*S_xyyy) + M_xz*(-2520*S_xxxz - 20160*S_xyyz) + M_yz*(-17640 &
      *S_xxyz + 2520*S_yyyz)) + (1.0d0/20790.0d0)*(M_xx*(-12960*S_xxxx &
      + 68580*S_xxyy - 990*S_xxzz - 990*S_yyyy - 990*S_yyzz) + M_xxy*( &
      141480*S_xxy - 20160*S_yyy) + M_xxz*(360*S_xxz - 20160*S_yyz) + &
      M_xyy*(57960*S_xxx - 92880*S_xyy) + M_yy*(18540*S_xxxx - 52380* &
      S_xxyy - 360*S_xxzz + 2160*S_yyyy - 360*S_yyzz) + M_yyz*(-17640* &
      S_xxz + 10440*S_yyz) + (-M_xx - M_yy)*(-5580*S_xxxx - 16200* &
      S_xxyy + 1350*S_xxzz - 1170*S_yyyy + 1350*S_yyzz) + (-M_xxx - &
      M_xyy)*(-10440*S_xxx - 28080*S_xyy) + (-M_xxy - M_yyy)*(-20520* &
      S_xxy - 360*S_yyy)) + (1.0d0/231.0d0)*(232*M_xxxxy*y + 202* &
      M_xxxxyy + 8*M_xxxxz*z + 928*M_xxxy*S_xy + 464*M_xxxyy*x + 32* &
      M_xxxz*S_xz - 404*M_xxyyy*y + M_xxzzzz - 808*M_xyyy*S_xy - 202* &
      M_xyyyy*x - 5*M_yyyyyy - 4*M_yyyyzz + M_yyzzzz + 32*S_yz*(-M_xxyz &
      - M_yyyz) + 16*x*(-M_xxxxx - M_xxxyy) + 8*y*(-M_xxyzz - M_yyyzz) &
      + 16*z*(-M_xxyyz - M_yyyyz))
    S_xxxxyz   = (1.0d0/33.0d0)*h**2*y*z - 6.0d0/11.0d0*h*x**2*y*z + x**4*y*z
    Ms_xxxxyz  = M_0*S_xxxxyz + (48.0d0/11.0d0)*M_xxyz*S_xx + (6.0d0/11.0d0)*S_yz*( &
      -M_xxyy - M_yyyy) + (2.0d0/11.0d0)*(y*(-M_xxyyz - M_yyyyz) + z*( &
      -M_xxyyy - M_yyyyy)) + (1.0d0/10395.0d0)*(M_xy*(30240*S_xxxz - &
      20160*S_xyyz) + M_xz*(50400*S_xxxy + 20160*S_xyyy) + M_yz*(20160* &
      S_xxxx - 5670*S_xxyy - 1575*S_xxzz - 4095*S_yyyy - 1575*S_yyzz)) &
      - 16.0d0/11.0d0*(M_xxyy*S_yz + M_xxyyz*y + S_yz*(-M_xxxx - M_xxyy &
      ) + z*(-M_xxxxy - M_xxyyy)) - 32.0d0/11.0d0*(M_xyy*S_xyz + M_xyyz &
      *S_xy + S_xyz*(-M_xxx - M_xyy) + S_xz*(-M_xxxy - M_xyyy)) + ( &
      1.0d0/62370.0d0)*(M_yyy*(-34020*S_xxz + 15120*S_yyz) + M_yyyz*( &
      -41580*S_xx + 7560*S_yy) + (-M_xxyz - M_yyyz)*(-49140*S_xx - 7560 &
      *S_yy) + (-M_xxz - M_yyz)*(-49140*S_xxy - 15120*S_yyy)) + (1.0d0/ &
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
    S_xxxyyy   = x**3*y**3 + (1.0d0/11.0d0)*(h**2*x*y - 3*h*x**3*y - 3*h*x*y**3)
    Ms_xxxyyy  = M_0*S_xxxyyy + (1.0d0/62370.0d0)*(M_xxx*(-107730*S_xxy + 45360*S_yyy) + &
      M_xxxy*(-107730*S_xx + 124740*S_yy) + M_xyyy*(124740*S_xx - &
      107730*S_yy) + M_yyy*(45360*S_xxx - 107730*S_xyy)) + (1.0d0/ &
      10395.0d0)*(M_xy*(-6615*S_xxxx + 65205*S_xxyy - 945*S_xxzz - 6615 &
      *S_yyyy - 945*S_yyzz) + M_xyz*(-9450*S_xxz - 9450*S_yyz) + M_xz*( &
      -9450*S_xxyz - 5670*S_yyyz) + M_yz*(-5670*S_xxxz - 9450*S_xyyz)) &
      + (1.0d0/20790.0d0)*(M_xx*(-32130*S_xxxy + 45360*S_xyyy) + M_xxy* &
      (-32130*S_xxx + 124740*S_xyy) + M_xyy*(124740*S_xxy - 32130*S_yyy &
      ) + M_yy*(45360*S_xxxy - 32130*S_xyyy) + (-M_xx - M_yy)*(-13230* &
      S_xxxy - 13230*S_xyyy) + (-M_xxx - M_xyy)*(-17010*S_xxy - 13230* &
      S_yyy) + (-M_xxxy - M_xyyy)*(-17010*S_xx - 17010*S_yy) + (-M_xxy &
      - M_yyy)*(-13230*S_xxx - 17010*S_xyy)) + (1.0d0/11.0d0)*(-10* &
      M_xxxx*S_xy - 2*M_xxxxx*y - M_xxxxxy - 10*M_xxxxy*x + 21*M_xxxyy* &
      y + 9*M_xxxyyy - 2*M_xxxyz*z - M_xxxyzz - 2*M_xxxz*S_yz + 63* &
      M_xxyy*S_xy + 21*M_xxyyy*x - 6*M_xxyz*S_xz - 6*M_xxz*S_xyz - 10* &
      M_xyyyy*y - M_xyyyyy - 2*M_xyyyz*z - M_xyyyzz - 6*M_xyyz*S_yz - &
      10*M_yyyy*S_xy - 2*M_yyyyy*x - 2*M_yyyz*S_xz - 6*M_yyz*S_xyz - 3* &
      S_xy*(-M_xxxx - M_xxyy) - 3*S_xy*(-M_xxyy - M_yyyy) + S_xy*( &
      -M_xxzz - M_yyzz) + 4*S_xyz*(-M_xxz - M_yyz) + 4*S_xz*(-M_xxyz - &
      M_yyyz) + 4*S_yz*(-M_xxxz - M_xyyz) - 3*x*(-M_xxxxy - M_xxyyy) - &
      x*(-M_xxyyy - M_yyyyy) + x*(-M_xxyzz - M_yyyzz) - y*(-M_xxxxx - &
      M_xxxyy) - 3*y*(-M_xxxyy - M_xyyyy) + y*(-M_xxxzz - M_xyyzz) + 4* &
      z*(-M_xxxyz - M_xyyyz))
    S_xxxyyz   = (1.0d0/33.0d0)*h**2*x*z + x**3*y**2*z - 1.0d0/11.0d0*(h*x**3*z + 3*h*x*y &
      **2*z)
    Ms_xxxyyz  = M_0*S_xxxyyz + (46.0d0/11.0d0)*(M_xxy*S_xyz + M_xxyz*S_xy) + (23.0d0/ &
      11.0d0)*(M_xxyy*S_xz + M_xxyyz*x) + (1.0d0/62370.0d0)*(M_xxx*( &
      -35910*S_xxz + 45360*S_yyz) + M_xxxz*(-32130*S_xx + 49140*S_yy) + &
      (-M_xxxz - M_xyyz)*(-24570*S_xx - 32130*S_yy) + (-M_xxz - M_yyz)* &
      (-20790*S_xxx - 32130*S_xyy)) + (1.0d0/10395.0d0)*(M_xy*(47880* &
      S_xxyz - 5670*S_yyyz) + M_xyz*(56700*S_xxy + 3150*S_yyy) + M_xz*( &
      -315*S_xxxx + 31185*S_xxyy - 1575*S_xxzz + 4095*S_yyyy - 1575* &
      S_yyzz) + M_yz*(27720*S_xxxy + 3150*S_xyyy)) - 1.0d0/11.0d0*(14* &
      S_xyz*(-M_xxy - M_yyy) + 3*S_xz*(-M_xxxx - M_xxyy) + 7*S_xz*( &
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
    S_xxyyyy   = -1.0d0/231.0d0*h**3 + x**2*y**4 + (1.0d0/33.0d0)*(h**2*x**2 + 2*h**2*y** &
      2) - 1.0d0/11.0d0*(6*h*x**2*y**2 + h*y**4)
    Ms_xxyyyy  = M_0*S_xxyyyy + (12.0d0/77.0d0)*M_xxxxx*x - 5.0d0/77.0d0*M_xxyyzz - &
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
      + S_xy*(-M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_xy*(-20160* &
      S_xxxy + 57960*S_xyyy) + M_xz*(2520*S_xxxz - 17640*S_xyyz) + M_yz &
      *(-20160*S_xxyz - 2520*S_yyyz)) + (1.0d0/20790.0d0)*(M_xx*(2160* &
      S_xxxx - 52380*S_xxyy - 360*S_xxzz + 18540*S_yyyy - 360*S_yyzz) + &
      M_xxy*(-92880*S_xxy + 57960*S_yyy) + M_xxz*(10440*S_xxz - 17640* &
      S_yyz) + M_xyy*(-20160*S_xxx + 141480*S_xyy) + M_yy*(-990*S_xxxx &
      + 68580*S_xxyy - 990*S_xxzz - 12960*S_yyyy - 990*S_yyzz) + M_yyz* &
      (-20160*S_xxz + 360*S_yyz) + (-M_xx - M_yy)*(-1170*S_xxxx - 16200 &
      *S_xxyy + 1350*S_xxzz - 5580*S_yyyy + 1350*S_yyzz) + (-M_xxx - &
      M_xyy)*(-360*S_xxx - 20520*S_xyy) + (-M_xxy - M_yyy)*(-28080* &
      S_xxy - 10440*S_yyy)) + (1.0d0/231.0d0)*(-5*M_xxxxxx - 202* &
      M_xxxxy*y - 4*M_xxxxzz - 808*M_xxxy*S_xy - 404*M_xxxyy*x + 464* &
      M_xxyyy*y + 202*M_xxyyyy + M_xxzzzz + 928*M_xyyy*S_xy + 232* &
      M_xyyyy*x + 8*M_yyyyz*z + 32*M_yyyz*S_yz + M_yyzzzz + 32*S_xz*( &
      -M_xxxz - M_xyyz) + 8*x*(-M_xxxzz - M_xyyzz) + 16*y*(-M_xxyyy - &
      M_yyyyy) + 16*z*(-M_xxxxz - M_xxyyz))
    S_xxyyyz   = (1.0d0/33.0d0)*h**2*y*z + x**2*y**3*z - 1.0d0/11.0d0*(3*h*x**2*y*z + h*y &
      **3*z)
    Ms_xxyyyz  = M_0*S_xxyyyz + (23.0d0/11.0d0)*(M_xxyy*S_yz + M_xxyyz*y) + (46.0d0/ &
      11.0d0)*(M_xyy*S_xyz + M_xyyz*S_xy) + (1.0d0/10395.0d0)*(M_xy*( &
      -5670*S_xxxz + 47880*S_xyyz) + M_xyz*(3150*S_xxx + 56700*S_xyy) + &
      M_xz*(3150*S_xxxy + 27720*S_xyyy) + M_yz*(4095*S_xxxx + 31185* &
      S_xxyy - 1575*S_xxzz - 315*S_yyyy - 1575*S_yyzz)) + (1.0d0/ &
      62370.0d0)*(M_yyy*(45360*S_xxz - 35910*S_yyz) + M_yyyz*(49140* &
      S_xx - 32130*S_yy) + (-M_xxyz - M_yyyz)*(-32130*S_xx - 24570*S_yy &
      ) + (-M_xxz - M_yyz)*(-32130*S_xxy - 20790*S_yyy)) - 1.0d0/11.0d0 &
      *(14*S_xyz*(-M_xxx - M_xyy) + 14*S_xz*(-M_xxxy - M_xyyy) + 7*S_yz &
      *(-M_xxxx - M_xxyy) + 3*S_yz*(-M_xxyy - M_yyyy) + y*(-M_xxyyz - &
      M_yyyyz) + 7*z*(-M_xxxxy - M_xxyyy) + z*(-M_xxyyy - M_yyyyy)) + ( &
      1.0d0/20790.0d0)*(M_xx*(-25830*S_xxyz + 18900*S_yyyz) + M_xxy*( &
      -25830*S_xxz + 47880*S_yyz) + M_xxyz*(-17010*S_xx + 56700*S_yy) + &
      M_xxz*(-17010*S_xxy + 27720*S_yyy) + M_yy*(45360*S_xxyz - 10710* &
      S_yyyz) + M_yyz*(49140*S_xxy - 6930*S_yyy) + (-M_xx - M_yy)*( &
      -19530*S_xxyz - 8190*S_yyyz) + (-M_xxy - M_yyy)*(-19530*S_xxz - &
      11970*S_yyz)) + (1.0d0/33.0d0)*(-32*M_xxx*S_xyz - 8*M_xxxx*S_yz - &
      8*M_xxxxy*z - M_xxxxyz - 8*M_xxxxz*y - 32*M_xxxy*S_xz - 32* &
      M_xxxyz*x - 32*M_xxxz*S_xy + 23*M_xxyyy*z + 31*M_xxyyyz - &
      M_xxyzzz + 46*M_xyyy*S_xz + 46*M_xyyyz*x - 10*M_yyyy*S_yz - 2* &
      M_yyyyy*z - M_yyyyyz - 10*M_yyyyz*y - M_yyyzzz - 14*S_xy*(-M_xxxz &
      - M_xyyz) + 5*S_yz*(-M_xxzz - M_yyzz) - 14*x*(-M_xxxyz - M_xyyyz &
      ) - 7*y*(-M_xxxxz - M_xxyyz) + y*(-M_xxzzz - M_yyzzz) + 5*z*( &
      -M_xxyzz - M_yyyzz))
    S_xyyyyy   = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x*y**3 + x*y**5
    Ms_xyyyyy  = M_0*S_xyyyyy - 60.0d0/11.0d0*M_xxyy*S_xy + (28.0d0/33.0d0)*M_xyyyyy + ( &
      100.0d0/33.0d0)*M_yyy*S_xyy + (8.0d0/33.0d0)*M_yyyyy*x - 30.0d0/ &
      11.0d0*S_yy*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_yyy*(-M_xxx - &
      M_xyy) + (10.0d0/33.0d0)*(-M_xxxyyy + y*(-M_xxxxx - M_xxxyy)) + ( &
      25.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x) - 40.0d0/11.0d0*(M_xyyz* &
      S_yz + M_yyz*S_xyz) + (140.0d0/33.0d0)*(M_yy*S_xyyy - M_yz*S_xyyz &
      ) + (10.0d0/11.0d0)*(S_xy*(-M_xxxx - M_xxyy) + x*(-M_xxxxy - &
      M_xxyyy)) + (1.0d0/62370.0d0)*(M_xxx*(75600*S_xxy - 56700*S_yyy) &
      + M_xxxy*(75600*S_xx - 132300*S_yy) + M_xyyy*(-75600*S_xx + &
      189000*S_yy)) + (1.0d0/10395.0d0)*(M_xy*(-1575*S_xxxx - 47250* &
      S_xxyy - 1575*S_xxzz + 31500*S_yyyy - 1575*S_yyzz) + M_xyz*(12600 &
      *S_xxz - 44100*S_yyz) + M_xz*(12600*S_xxyz - 18900*S_yyyz)) + ( &
      40.0d0/33.0d0)*(M_xyyyy*y - M_xyyyz*z + M_yyyy*S_xy - M_yyyz*S_xz &
      ) + (1.0d0/20790.0d0)*(M_xx*(12600*S_xxxy - 56700*S_xyyy) + M_xxy &
      *(12600*S_xxx - 132300*S_xyy) + M_xyy*(-75600*S_xxy + 88200*S_yyy &
      ) + (-M_xx - M_yy)*(-12600*S_xxxy - 31500*S_xyyy) + (-M_xxy - &
      M_yyy)*(-12600*S_xxx - 56700*S_xyy)) + (20.0d0/11.0d0)*(-M_xxxyy* &
      y - M_xxyyy*x + M_xxyz*S_xz + M_xxz*S_xyz - S_xy*(-M_xxyy - &
      M_yyyy) - y*(-M_xxxyy - M_xyyyy)) + (5.0d0/33.0d0)*(M_xxxxx*y - &
      M_xxxxxy - M_xxxyzz - M_xyyyzz + S_xy*(-M_xxzz - M_yyzz) + x*( &
      -M_xxyzz - M_yyyzz) + y*(-M_xxxzz - M_xyyzz)) + (20.0d0/33.0d0)*( &
      M_xxxyz*z + M_xxxz*S_yz + S_xyz*(-M_xxz - M_yyz) + S_xz*(-M_xxyz &
      - M_yyyz) + S_yz*(-M_xxxz - M_xyyz) - x*(-M_xxyyy - M_yyyyy) + z* &
      (-M_xxxyz - M_xyyyz))
    S_xyyyyz   = (1.0d0/33.0d0)*h**2*x*z - 6.0d0/11.0d0*h*x*y**2*z + x*y**4*z
    Ms_xyyyyz  = M_0*S_xyyyyz + (48.0d0/11.0d0)*M_xyyz*S_yy + (6.0d0/11.0d0)*S_xz*( &
      -M_xxxx - M_xxyy) + (2.0d0/11.0d0)*(x*(-M_xxxxz - M_xxyyz) + z*( &
      -M_xxxxx - M_xxxyy)) + (1.0d0/10395.0d0)*(M_xy*(-20160*S_xxyz + &
      30240*S_yyyz) + M_xz*(-4095*S_xxxx - 5670*S_xxyy - 1575*S_xxzz + &
      20160*S_yyyy - 1575*S_yyzz) + M_yz*(20160*S_xxxy + 50400*S_xyyy &
      )) + (1.0d0/62370.0d0)*(M_xxx*(15120*S_xxz - 34020*S_yyz) + &
      M_xxxz*(7560*S_xx - 41580*S_yy) + (-M_xxxz - M_xyyz)*(-7560*S_xx &
      - 49140*S_yy) + (-M_xxz - M_yyz)*(-15120*S_xxx - 49140*S_xyy)) - &
      32.0d0/11.0d0*(M_xxy*S_xyz + M_xxyz*S_xy + S_xyz*(-M_xxy - M_yyy &
      ) + S_yz*(-M_xxxy - M_xyyy)) - 16.0d0/11.0d0*(M_xxyy*S_xz + &
      M_xxyyz*x + S_xz*(-M_xxyy - M_yyyy) + z*(-M_xxxyy - M_xyyyy)) + ( &
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
    S_yyyyyy   = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*y**2 - 15.0d0/11.0d0*h*y**4 + &
      y**6
    Ms_yyyyyy  = M_0*S_yyyyyy + (10.0d0/231.0d0)*M_xxxxxx + (5.0d0/77.0d0)*M_xxxxzz + ( &
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
      z*(-M_xxxxz - M_xxyyz)) + (60.0d0/77.0d0)*(M_xxxxy*y - M_xxyyyy + &
      y*(-M_xxyzz - M_yyyzz)) - 10.0d0/77.0d0*(M_xxxxx*x + M_xxxxz*z + &
      x*(-M_xxxzz - M_xyyzz) + z*(-M_xxzzz - M_yyzzz)) + (240.0d0/ &
      77.0d0)*(M_xxxy*S_xy + M_xxyz*S_yz + M_xyyz*S_xz + S_xy*(-M_xxxy &
      - M_xyyy) + S_yz*(-M_xxyz - M_yyyz)) + (120.0d0/77.0d0)*(M_xxxyy* &
      x + M_xxyyz*z + M_yyyy*S_yy + x*(-M_xxxyy - M_xyyyy) + y*( &
      -M_xxxxy - M_xxyyy) + z*(-M_xxyyz - M_yyyyz)) + (1.0d0/20790.0d0) &
      *(M_xx*(1350*S_xxxx + 40500*S_xxyy + 1350*S_xxzz - 27000*S_yyyy + &
      1350*S_yyzz) + M_xxy*(64800*S_xxy - 75600*S_yyy) + M_xxz*(-10800* &
      S_xxz + 37800*S_yyz) + M_yy*(-8100*S_xxxx - 16200*S_xxyy - 8100* &
      S_xxzz + 86400*S_yyyy - 8100*S_yyzz) + (-M_xx - M_yy)*(6750* &
      S_xxxx - 24300*S_xxyy + 6750*S_xxzz - 59400*S_yyyy + 6750*S_yyzz &
      ) + (-M_xxx - M_xyy)*(10800*S_xxx + 48600*S_xyy) + (-M_xxy - &
      M_yyy)*(-64800*S_xxy - 140400*S_yyy))
    S_yyyyyz   = (5.0d0/33.0d0)*h**2*y*z - 10.0d0/11.0d0*h*y**3*z + y**5*z
    Ms_yyyyyz  = M_0*S_yyyyyz - 30.0d0/11.0d0*M_xxyz*S_yy - 50.0d0/33.0d0*M_xxz*S_yyy + ( &
      100.0d0/33.0d0)*M_yyy*S_yyz + (8.0d0/33.0d0)*M_yyyyy*z + (28.0d0/ &
      33.0d0)*M_yyyyyz - 60.0d0/11.0d0*S_yz*(-M_xxyy - M_yyyy) + ( &
      10.0d0/33.0d0)*(-M_xxyyyz + y*(-M_xxxxz - M_xxyyz)) + (140.0d0/ &
      33.0d0)*(-M_xy*S_xyyz + M_yy*S_yyyz) - 40.0d0/11.0d0*(M_xyy*S_xyz &
      + M_xyyz*S_xy) + (10.0d0/11.0d0)*(S_yz*(-M_xxxx - M_xxyy) + z*( &
      -M_xxxxy - M_xxyyy)) + (25.0d0/33.0d0)*(S_yz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxyzz - M_yyyzz)) + (1.0d0/10395.0d0)*(M_xyz*(-12600*S_xxx &
      - 56700*S_xyy) + M_xz*(-12600*S_xxxy - 31500*S_xyyy) + M_yz*( &
      -7875*S_xxxx + 28350*S_xxyy - 7875*S_xxzz + 69300*S_yyyy - 7875* &
      S_yyzz)) + (1.0d0/62370.0d0)*(M_yyyz*(75600*S_xx + 264600*S_yy) + &
      (-M_xxyz - M_yyyz)*(-75600*S_xx - 207900*S_yy) + (-M_xxz - M_yyz) &
      *(-75600*S_xxy - 132300*S_yyy)) + (40.0d0/33.0d0)*(-M_xyyy*S_xz - &
      M_xyyyz*x + M_yyyy*S_yz + M_yyyyz*y) + (1.0d0/20790.0d0)*(M_xx*( &
      12600*S_xxyz - 18900*S_yyyz) + M_xxy*(12600*S_xxz - 44100*S_yyz) &
      + M_yyz*(75600*S_xxy + 163800*S_yyy) + (-M_xx - M_yy)*(-12600* &
      S_xxyz - 69300*S_yyyz) + (-M_xxy - M_yyy)*(-12600*S_xxz - 144900* &
      S_yyz)) + (20.0d0/11.0d0)*(-M_xxyy*S_yz - M_xxyyz*y + S_xyz*( &
      -M_xxx - M_xyy) + S_xz*(-M_xxxy - M_xyyy) - y*(-M_xxyyz - M_yyyyz &
      ) - z*(-M_xxyyy - M_yyyyy)) + (20.0d0/33.0d0)*(M_xxx*S_xyz + &
      M_xxxy*S_xz + M_xxxyz*x + M_xxxz*S_xy - M_xxyyy*z + S_xy*(-M_xxxz &
      - M_xyyz) + x*(-M_xxxyz - M_xyyyz)) + (5.0d0/33.0d0)*(M_xxxx*S_yz &
      + M_xxxxy*z - M_xxxxyz + M_xxxxz*y - M_xxyzzz - M_yyyzzz + y*( &
      -M_xxzzz - M_yyzzz))
    S_xxxxxxx  = -35.0d0/429.0d0*h**3*x + (105.0d0/143.0d0)*h**2*x**3 - 21.0d0/13.0d0*h*x &
      **5 + x**7
    Ms_xxxxxxx = M_0*S_xxxxxxx + (1400.0d0/429.0d0)*M_xxxx*S_xxx + (168.0d0/143.0d0)* &
      M_xxxxx*S_xx + (112.0d0/429.0d0)*M_xxxxxx*x + (184.0d0/429.0d0)* &
      M_xxxxxxx + (1680.0d0/143.0d0)*M_xxyz*S_xyz + (70.0d0/429.0d0)* &
      M_xyyyyyy + (630.0d0/143.0d0)*S_xx*(-M_xxxyy - M_xyyyy) + ( &
      350.0d0/143.0d0)*S_xxx*(-M_xxyy - M_yyyy) + (420.0d0/143.0d0)*x*( &
      -M_xxxxyy - M_xxyyyy) - 112.0d0/143.0d0*(M_xxxxxy*y + M_xxxxxz*z &
      ) - 1400.0d0/143.0d0*(M_xxxy*S_xxy + M_xxxz*S_xxz) + (1.0d0/ &
      1621620.0d0)*(M_xxxyy*(-7938000*S_xx + 3175200*S_yy) + (-M_xxxxx &
      - M_xxxyy)*(-11113200*S_xx - 3175200*S_yy)) + (1.0d0/540540.0d0)* &
      (M_xxyy*(-3704400*S_xxx + 3175200*S_xyy) + (-M_xxxx - M_xxyy)*( &
      -6879600*S_xxx - 3175200*S_xyy)) + (210.0d0/143.0d0)*(M_xxyyyy*x &
      + x*(-M_xxxxzz - M_xxyyzz)) + (1.0d0/135135.0d0)*(M_xy*(-1323000* &
      S_xxxxy + 132300*S_xxyyy + 66150*S_xxyzz + 66150*S_yyyyy + 66150* &
      S_yyyzz) + M_xz*(-1323000*S_xxxxz + 132300*S_xxyyz + 66150* &
      S_xxzzz + 66150*S_yyyyz + 66150*S_yyzzz)) + (560.0d0/143.0d0)*( &
      -M_xxxxy*S_xy - M_xxxxz*S_xz + M_xxxyz*S_yz) + (1960.0d0/143.0d0) &
      *(-M_xxy*S_xxxy - M_xxz*S_xxxz + M_xyz*S_xxyz) + (35.0d0/429.0d0) &
      *(M_xxxzzzz + M_xyyzzzz - M_yyyyyy*x - x*(-M_xxzzzz - M_yyzzzz)) &
      + (1.0d0/3243240.0d0)*(M_xyyyy*(5556600*S_xx - 3175200*S_yy) + &
      M_yyyy*(2381400*S_xxx - 3175200*S_xyy) + (-M_xxxzz - M_xyyzz)*( &
      8731800*S_xx + 3175200*S_yy) + (-M_xxzz - M_yyzz)*(5556600*S_xxx &
      + 3175200*S_xyy)) - 140.0d0/143.0d0*(M_xxxxxyy + S_xy*(-M_xxyyy - &
      M_yyyyy) + S_xz*(-M_xxyyz - M_yyyyz) + y*(-M_xxxyyy - M_xyyyyy) + &
      z*(-M_xxxyyz - M_xyyyyz)) + (35.0d0/143.0d0)*(-M_xxxyyyy - &
      M_xxxyyzz + M_xyyyyzz - x*(-M_xxyyyy - M_yyyyyy) - x*(-M_xxyyzz - &
      M_yyyyzz)) + (1.0d0/810810.0d0)*(M_xxx*(4233600*S_xxxx - 793800* &
      S_xxyy - 396900*S_xxzz - 396900*S_yyyy - 396900*S_yyzz) + M_xyyy* &
      (5556600*S_xxy - 529200*S_yyy) + M_yyy*(2381400*S_xxxy - 529200* &
      S_xyyy) + (-M_xxxz - M_xyyz)*(6085800*S_xxz + 529200*S_yyz) + ( &
      -M_xxz - M_yyz)*(2910600*S_xxxz + 529200*S_xyyz)) + (840.0d0/ &
      143.0d0)*(M_xxyyy*S_xy + M_xxyyz*S_xz + M_yz*S_xxxyz + S_xy*( &
      -M_xxxxy - M_xxyyy) + S_xz*(-M_xxxxz - M_xxyyz)) - 70.0d0/143.0d0 &
      *(M_xxxxxzz + M_xyyyyy*y + M_xyyyyz*z + M_yyyyy*S_xy + M_yyyyz* &
      S_xz + S_xy*(-M_xxyzz - M_yyyzz) + S_xz*(-M_xxzzz - M_yyzzz) + y* &
      (-M_xxxyzz - M_xyyyzz) + z*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/ &
      270270.0d0)*(M_xx*(1270080*S_xxxxx - 793800*S_xxxyy - 396900* &
      S_xxxzz - 396900*S_xyyyy - 396900*S_xyyzz) + M_xyy*(-1323000* &
      S_xxxx + 1984500*S_xxyy + 66150*S_xxzz + 66150*S_yyyy + 66150* &
      S_yyzz) + M_xyyz*(1852200*S_xxz - 529200*S_yyz) + M_yy*(-370440* &
      S_xxxxx + 926100*S_xxxyy + 66150*S_xxxzz + 66150*S_xyyyy + 66150* &
      S_xyyzz) + M_yyz*(793800*S_xxxz - 529200*S_xyyz) + (-M_xx - M_yy) &
      *(-899640*S_xxxxx - 132300*S_xxxyy + 330750*S_xxxzz + 330750* &
      S_xyyyy + 330750*S_xyyzz) + (-M_xxx - M_xyy)*(-2910600*S_xxxx - &
      1190700*S_xxyy + 330750*S_xxzz + 330750*S_yyyy + 330750*S_yyzz) + &
      (-M_xxxy - M_xyyy)*(2381400*S_xxy + 529200*S_yyy) + (-M_xxy - &
      M_yyy)*(1323000*S_xxxy + 529200*S_xyyy)) + (280.0d0/143.0d0)*( &
      -M_xxxxyy*x + M_xxxyyy*y + M_xxxyyz*z - M_xyyyz*S_yz - M_yyyz* &
      S_xyz - S_xyz*(-M_xxyz - M_yyyz) - S_yz*(-M_xxxyz - M_xyyyz) - x* &
      (-M_xxxxxx - M_xxxxyy) + y*(-M_xxxxxy - M_xxxyyy) + z*(-M_xxxxxz &
      - M_xxxyyz))
    S_xxxxxxy  = -5.0d0/429.0d0*h**3*y + (45.0d0/143.0d0)*h**2*x**2*y - 15.0d0/13.0d0*h*x &
      **4*y + x**6*y
    Ms_xxxxxxy = M_0*S_xxxxxxy + (2240.0d0/429.0d0)*M_xxx*S_xxxy + (64.0d0/429.0d0)* &
      M_xxxxxx*y + (304.0d0/429.0d0)*M_xxxxxxy + (200.0d0/143.0d0)* &
      M_xxyyyy*y - 1120.0d0/143.0d0*M_xxz*S_xxyz + (1.0d0/16216200.0d0) &
      *M_yyyyy*(5103000*S_xx - 3402000*S_yy) - 35.0d0/429.0d0*M_yyyyyy* &
      y + (10.0d0/429.0d0)*M_yyyyyyy + (5.0d0/143.0d0)*M_yyyyyzz - &
      50.0d0/143.0d0*M_yyyyz*S_yz - 720.0d0/143.0d0*S_xx*(-M_xxxxy - &
      M_xxyyy) - 800.0d0/143.0d0*S_xxx*(-M_xxxy - M_xyyy) - 60.0d0/ &
      143.0d0*S_yz*(-M_xxyyz - M_yyyyz) - 25.0d0/143.0d0*y*(-M_xxyyyy - &
      M_yyyyyy) - 15.0d0/143.0d0*y*(-M_xxyyzz - M_yyyyzz) - 20.0d0/ &
      143.0d0*z*(-M_xxyyyz - M_yyyyyz) + (40.0d0/143.0d0)*(-M_xxxxyzz + &
      y*(-M_xxxxzz - M_xxyyzz)) - 35.0d0/143.0d0*(M_xxyyyyy + M_xxyyyzz &
      ) + (400.0d0/143.0d0)*(M_xxxx*S_xxy + M_xyyyy*S_xy) + (128.0d0/ &
      143.0d0)*(M_xxxxx*S_xy + M_xxxxxy*x) + (240.0d0/143.0d0)*( &
      -M_xxxxyy*y + y*(-M_xxxxyy - M_xxyyyy)) - 640.0d0/143.0d0*( &
      M_xxxyz*S_xz + M_xxxz*S_xyz) + (1.0d0/1621620.0d0)*(M_xxyyy*( &
      -6350400*S_xx + 3628800*S_yy) + (-M_xxyyy - M_yyyyy)*(1247400* &
      S_xx - 226800*S_yy)) + (480.0d0/143.0d0)*(M_xxyyz*S_yz + S_xy*( &
      -M_xxxyy - M_xyyyy)) + (5.0d0/429.0d0)*(M_xxyzzzz + M_yyyzzzz - y &
      *(-M_xxzzzz - M_yyzzzz)) + (960.0d0/143.0d0)*(-M_xxxyy*S_xy + &
      M_xyyz*S_xyz - M_xz*S_xxxyz) + (1.0d0/540540.0d0)*(M_xxyy*( &
      -6350400*S_xxy + 604800*S_yyy) + (-M_xxxx - M_xxyy)*(-2721600* &
      S_xxy - 604800*S_yyy) + (-M_xxyy - M_yyyy)*(1247400*S_xxy + &
      151200*S_yyy)) + (1.0d0/135135.0d0)*(M_xy*(423360*S_xxxxx - &
      1058400*S_xxxyy - 75600*S_xxxzz - 75600*S_xyyyy - 75600*S_xyyzz) &
      + M_xyz*(-907200*S_xxxz + 604800*S_xyyz) + M_yz*(-302400*S_xxxxz &
      + 359100*S_xxyyz + 9450*S_xxzzz + 9450*S_yyyyz + 9450*S_yyzzz)) - &
      10.0d0/143.0d0*(M_yyyyyz*z + S_yz*(-M_xxzzz - M_yyzzz) + z*( &
      -M_xxyzzz - M_yyyzzz)) + (1.0d0/3243240.0d0)*(M_xxxxy*(9072000* &
      S_xx - 3628800*S_yy) + M_yyyy*(5103000*S_xxy - 756000*S_yyy) + ( &
      -M_xxyzz - M_yyyzz)*(1474200*S_xx + 226800*S_yy) + (-M_xxzz - &
      M_yyzz)*(1474200*S_xxy + 453600*S_yyy)) + (80.0d0/143.0d0)*( &
      -M_xxxxyyy + M_xyyyyy*x + S_xy*(-M_xxxzz - M_xyyzz) + x*( &
      -M_xxxyzz - M_xyyyzz) - y*(-M_xxxxxx - M_xxxxyy)) + (160.0d0/ &
      143.0d0)*(-M_xxxxyz*z - M_xxxxz*S_yz + M_xxyyyz*z + S_yz*( &
      -M_xxxxz - M_xxyyz) + x*(-M_xxxyyy - M_xyyyyy) + z*(-M_xxxxyz - &
      M_xxyyyz)) + (1.0d0/810810.0d0)*(M_xxxy*(4233600*S_xxx - 3628800* &
      S_xyy) + M_xyyy*(-2721600*S_xxx + 3628800*S_xyy) + M_yyy*(-907200 &
      *S_xxxx + 2097900*S_xxyy + 28350*S_xxzz - 47250*S_yyyy + 28350* &
      S_yyzz) + M_yyyz*(1020600*S_xxz - 453600*S_yyz) + (-M_xxyz - &
      M_yyyz)*(1096200*S_xxz - 151200*S_yyz) + (-M_xxz - M_yyz)*( &
      1096200*S_xxyz + 75600*S_yyyz)) + (320.0d0/143.0d0)*(-M_xxxyyy*x &
      + M_xyyyz*S_xz - S_xy*(-M_xxxxx - M_xxxyy) + S_xyz*(-M_xxxz - &
      M_xyyz) + S_xz*(-M_xxxyz - M_xyyyz) - x*(-M_xxxxxy - M_xxxyyy)) + &
      (1.0d0/270270.0d0)*(M_xx*(1512000*S_xxxxy - 151200*S_xxyyy - &
      75600*S_xxyzz - 75600*S_yyyyy - 75600*S_yyyzz) + M_xxy*(1512000* &
      S_xxxx - 2268000*S_xxyy - 75600*S_xxzz - 75600*S_yyyy - 75600* &
      S_yyzz) + M_xxyz*(-2116800*S_xxz + 604800*S_yyz) + M_xyy*( &
      -2721600*S_xxxy + 604800*S_xyyy) + M_yy*(-907200*S_xxxxy + 396900 &
      *S_xxyyy + 28350*S_xxyzz + 28350*S_yyyyy + 28350*S_yyyzz) + M_yyz &
      *(1020600*S_xxyz - 75600*S_yyyz) + (-M_xx - M_yy)*(-604800* &
      S_xxxxy - 245700*S_xxyyy + 47250*S_xxyzz + 47250*S_yyyyy + 47250* &
      S_yyyzz) + (-M_xxx - M_xyy)*(-1512000*S_xxxy - 604800*S_xyyy) + ( &
      -M_xxy - M_yyy)*(-604800*S_xxxx + 170100*S_xxyy + 47250*S_xxzz + &
      122850*S_yyyy + 47250*S_yyzz))
    S_xxxxxxz  = -5.0d0/429.0d0*h**3*z + (45.0d0/143.0d0)*h**2*x**2*z - 15.0d0/13.0d0*h*x &
      **4*z + x**6*z
    Ms_xxxxxxz = M_0*S_xxxxxxz + (2240.0d0/429.0d0)*M_xxx*S_xxxz + (64.0d0/429.0d0)* &
      M_xxxxxx*z + (304.0d0/429.0d0)*M_xxxxxxz - 1120.0d0/143.0d0*M_xxy &
      *S_xxyz - 720.0d0/143.0d0*M_xxyyz*S_xx - 800.0d0/143.0d0*M_xyyz* &
      S_xxx + (10.0d0/429.0d0)*M_yyyyyyz + (5.0d0/143.0d0)*M_yyyyzzz - &
      60.0d0/143.0d0*S_yz*(-M_xxyyy - M_yyyyy) - 50.0d0/143.0d0*S_yz*( &
      -M_xxyzz - M_yyyzz) - 20.0d0/143.0d0*y*(-M_xxyyyz - M_yyyyyz) + ( &
      200.0d0/143.0d0)*z*(-M_xxxxzz - M_xxyyzz) - 15.0d0/143.0d0*z*( &
      -M_xxyyyy - M_yyyyyy) - 25.0d0/143.0d0*z*(-M_xxyyzz - M_yyyyzz) - &
      35.0d0/429.0d0*z*(-M_xxzzzz - M_yyzzzz) + (40.0d0/143.0d0)*( &
      -M_xxxxzzz + M_xxyyyy*z) - 35.0d0/143.0d0*(M_xxyyyyz + M_xxyyzzz &
      ) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz)*(8505000*S_xx + &
      3402000*S_yy) + (400.0d0/143.0d0)*(M_xxxx*S_xxz + S_xz*(-M_xxxzz &
      - M_xyyzz)) + (128.0d0/143.0d0)*(M_xxxxx*S_xz + M_xxxxxz*x) - &
      640.0d0/143.0d0*(M_xxxy*S_xyz + M_xxxyz*S_xy) + (480.0d0/143.0d0) &
      *(S_xz*(-M_xxxyy - M_xyyyy) + S_yz*(-M_xxxxy - M_xxyyy)) + ( &
      240.0d0/143.0d0)*(-z*(-M_xxxxxx - M_xxxxyy) + z*(-M_xxxxyy - &
      M_xxyyyy)) + (1.0d0/1621620.0d0)*((-M_xxxxz - M_xxyyz)*(-9979200* &
      S_xx - 3628800*S_yy) + (-M_xxyyz - M_yyyyz)*(1474200*S_xx + &
      226800*S_yy)) + (5.0d0/429.0d0)*(M_xxzzzzz - M_yyyyyy*z + &
      M_yyzzzzz) + (1.0d0/540540.0d0)*(M_xxyy*(-2116800*S_xxz + 604800* &
      S_yyz) + (-M_xxxx - M_xxyy)*(-6955200*S_xxz - 604800*S_yyz) + ( &
      -M_xxyy - M_yyyy)*(1096200*S_xxz - 151200*S_yyz)) + (960.0d0/ &
      143.0d0)*(-M_xy*S_xxxyz + S_xyz*(-M_xxxy - M_xyyy) - S_xz*( &
      -M_xxxxx - M_xxxyy)) + (1.0d0/135135.0d0)*(M_xyz*(-1512000*S_xxxy &
      - 604800*S_xyyy) + M_xz*(1028160*S_xxxxx + 151200*S_xxxyy - &
      378000*S_xxxzz - 378000*S_xyyyy - 378000*S_xyyzz) + M_yz*(-604800 &
      *S_xxxxy - 245700*S_xxyyy + 47250*S_xxyzz + 47250*S_yyyyy + 47250 &
      *S_yyyzz)) - 10.0d0/143.0d0*(M_yyyyy*S_yz + M_yyyyyz*y + y*( &
      -M_xxyzzz - M_yyyzzz)) + (1.0d0/3243240.0d0)*(M_xxxxz*(12700800* &
      S_xx + 3628800*S_yy) + M_yyyy*(1020600*S_xxz - 453600*S_yyz) + &
      M_yyyyz*(1247400*S_xx - 226800*S_yy) + (-M_xxzz - M_yyzz)*( &
      5859000*S_xxz + 756000*S_yyz)) + (80.0d0/143.0d0)*(-M_xxxxyy*z - &
      M_xxxxyyz + M_xyyyy*S_xz + M_xyyyyz*x + x*(-M_xxxzzz - M_xyyzzz &
      )) + (160.0d0/143.0d0)*(-M_xxxxy*S_yz - M_xxxxyz*y + M_xxyyy*S_yz &
      + M_xxyyyz*y + x*(-M_xxxyyz - M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz &
      )) + (320.0d0/143.0d0)*(-M_xxxyy*S_xz - M_xxxyyz*x + M_xyyy*S_xyz &
      + M_xyyyz*S_xy + S_xy*(-M_xxxyz - M_xyyyz) - x*(-M_xxxxxz - &
      M_xxxyyz)) + (1.0d0/810810.0d0)*(M_xxxz*(7862400*S_xxx + 3628800* &
      S_xyy) + M_yyy*(1020600*S_xxyz - 75600*S_yyyz) + M_yyyz*(1247400* &
      S_xxy + 151200*S_yyy) + (-M_xxxz - M_xyyz)*(-6350400*S_xxx - &
      3628800*S_xyy) + (-M_xxyz - M_yyyz)*(1474200*S_xxy + 453600*S_yyy &
      ) + (-M_xxz - M_yyz)*(-2721600*S_xxxx - 1530900*S_xxyy + 330750* &
      S_xxzz + 255150*S_yyyy + 330750*S_yyzz)) + (1.0d0/270270.0d0)*( &
      M_xx*(1512000*S_xxxxz - 151200*S_xxyyz - 75600*S_xxzzz - 75600* &
      S_yyyyz - 75600*S_yyzzz) + M_xxyz*(-2721600*S_xxy - 604800*S_yyy &
      ) + M_xxz*(3326400*S_xxxx + 1360800*S_xxyy - 378000*S_xxzz - &
      378000*S_yyyy - 378000*S_yyzz) + M_xyy*(-907200*S_xxxz + 604800* &
      S_xyyz) + M_yy*(-302400*S_xxxxz + 359100*S_xxyyz + 9450*S_xxzzz + &
      9450*S_yyyyz + 9450*S_yyzzz) + M_yyz*(-604800*S_xxxx + 170100* &
      S_xxyy + 47250*S_xxzz + 122850*S_yyyy + 47250*S_yyzz) + (-M_xx - &
      M_yy)*(-1209600*S_xxxxz - 207900*S_xxyyz + 66150*S_xxzzz + 66150* &
      S_yyyyz + 66150*S_yyzzz) + (-M_xxx - M_xyy)*(-3326400*S_xxxz - &
      604800*S_xyyz) + (-M_xxy - M_yyy)*(1096200*S_xxyz + 75600*S_yyyz &
      ))
    S_xxxxxyy  = -5.0d0/429.0d0*h**3*x + (10.0d0/143.0d0)*h**2*x**3 + (15.0d0/143.0d0)*h &
      **2*x*y**2 + x**5*y**2 - 1.0d0/13.0d0*(h*x**5 + 10*h*x**3*y**2)
    Ms_xxxxxyy = M_0*S_xxxxxyy + (1.0d0/16216200.0d0)*M_xxxxx*(-6804000*S_xx + 5443200* &
      S_yy) - 56.0d0/429.0d0*M_xxxxxx*x - 20.0d0/429.0d0*M_xxxxxxx + ( &
      8.0d0/11.0d0)*M_xxxxxy*y + (118.0d0/143.0d0)*M_xxxxxyy + (8.0d0/ &
      143.0d0)*M_xxxxxz*z - 5.0d0/143.0d0*M_xxxxxzz + (40.0d0/11.0d0)* &
      M_xxxxy*S_xy + (20.0d0/11.0d0)*M_xxxxyy*x - 300.0d0/143.0d0* &
      M_xxxyyy*y - 30.0d0/143.0d0*M_xxxyyyy - 280.0d0/143.0d0*M_xxxyz* &
      S_yz - 900.0d0/143.0d0*M_xxyyy*S_xy - 225.0d0/143.0d0*M_xxyyyy*x &
      - 840.0d0/143.0d0*M_xxyz*S_xyz - 35.0d0/429.0d0*M_xyyyyyy + ( &
      40.0d0/429.0d0)*M_yyyyyy*x + (60.0d0/143.0d0)*S_xz*(-M_xxxxz - &
      M_xxyyz) - 210.0d0/143.0d0*x*(-M_xxxxyy - M_xxyyyy) + (25.0d0/ &
      143.0d0)*x*(-M_xxyyyy - M_yyyyyy) + (15.0d0/143.0d0)*(-M_xxxyyzz &
      + x*(-M_xxxxzz - M_xxyyzz)) + (1.0d0/1621620.0d0)*(M_xxxyy*( &
      6690600*S_xx - 4309200*S_yy) + (-M_xxxxx - M_xxxyy)*(113400*S_xx &
      - 1134000*S_yy)) - 140.0d0/143.0d0*(M_xxxyyz*z + y*(-M_xxxxxy - &
      M_xxxyyy)) - 420.0d0/143.0d0*(M_xxyyz*S_xz + S_xy*(-M_xxxxy - &
      M_xxyyy)) + (50.0d0/143.0d0)*(M_xyyyyz*z + M_yyyyz*S_xz) + ( &
      200.0d0/143.0d0)*(M_xyyyz*S_yz + M_yyyz*S_xyz) + (100.0d0/143.0d0 &
      )*(S_xy*(-M_xxyyy - M_yyyyy) + y*(-M_xxxyyy - M_xyyyyy)) + (5.0d0 &
      /429.0d0)*(M_xxxzzzz + M_xyyzzzz - x*(-M_xxzzzz - M_yyzzzz)) + ( &
      40.0d0/143.0d0)*(M_xxxxz*S_xz + S_xz*(-M_xxyyz - M_yyyyz) + z*( &
      -M_xxxyyz - M_xyyyyz)) + (10.0d0/143.0d0)*(-M_xyyyyzz - S_xz*( &
      -M_xxzzz - M_yyzzz) + x*(-M_xxyyzz - M_yyyyzz) - z*(-M_xxxzzz - &
      M_xyyzzz)) + (1.0d0/540540.0d0)*(M_xxyy*(2759400*S_xxx - 4309200* &
      S_xyy) + (-M_xxxx - M_xxyy)*(-189000*S_xxx - 1134000*S_xyy) + ( &
      -M_xxxyy - M_xyyyy)*(-1020600*S_xx + 340200*S_yy) + (-M_xxyy - &
      M_yyyy)*(-491400*S_xxx + 340200*S_xyy)) + (1.0d0/135135.0d0)*( &
      M_xy*(888300*S_xxxxy - 548100*S_xxyyy - 18900*S_xxyzz - 18900* &
      S_yyyyy - 18900*S_yyyzz) + M_xyz*(-869400*S_xxyz + 113400*S_yyyz &
      ) + M_xz*(-18900*S_xxxxz - 491400*S_xxyyz + 9450*S_xxzzz + 9450* &
      S_yyyyz + 9450*S_yyzzz) + M_yz*(-340200*S_xxxyz + 113400*S_xyyyz &
      )) + (80.0d0/143.0d0)*(M_xyyyyy*y + M_yyyyy*S_xy + S_xyz*(-M_xxyz &
      - M_yyyz) + S_yz*(-M_xxxyz - M_xyyyz)) + (20.0d0/143.0d0)*(S_xy*( &
      -M_xxyzz - M_yyyzz) + x*(-M_xxxxxx - M_xxxxyy) + y*(-M_xxxyzz - &
      M_xyyyzz) + z*(-M_xxxxxz - M_xxxyyz)) + (1.0d0/3243240.0d0)*( &
      M_xxxx*(-2570400*S_xxx + 5443200*S_xyy) + M_xyyyy*(-5670000*S_xx &
      + 3969000*S_yy) + M_yyyy*(-2268000*S_xxx + 3969000*S_xyy) + ( &
      -M_xxxzz - M_xyyzz)*(907200*S_xx + 793800*S_yy) + (-M_xxzz - &
      M_yyzz)*(680400*S_xxx + 793800*S_xyy)) + (1.0d0/810810.0d0)*( &
      M_xxx*(-756000*S_xxxx + 3118500*S_xxyy - 28350*S_xxzz - 28350* &
      S_yyyy - 28350*S_yyzz) + M_xxxy*(6690600*S_xxy - 907200*S_yyy) + &
      M_xxxz*(340200*S_xxz - 907200*S_yyz) + M_xyyy*(-5670000*S_xxy + &
      945000*S_yyy) + M_yyy*(-2268000*S_xxxy + 945000*S_xyyy) + ( &
      -M_xxxz - M_xyyz)*(529200*S_xxz + 415800*S_yyz) + (-M_xxz - M_yyz &
      )*(302400*S_xxxz + 415800*S_xyyz)) + (1.0d0/270270.0d0)*(M_xx*( &
      -181440*S_xxxxx + 1304100*S_xxxyy - 28350*S_xxxzz - 28350*S_xyyyy &
      - 28350*S_xyyzz) + M_xxy*(2759400*S_xxxy - 907200*S_xyyy) + M_xxz &
      *(37800*S_xxxz - 907200*S_xyyz) + M_xyy*(888300*S_xxxx - 2438100* &
      S_xxyy - 18900*S_xxzz + 94500*S_yyyy - 18900*S_yyzz) + M_xyyz*( &
      -869400*S_xxz + 491400*S_yyz) + M_yy*(230580*S_xxxxx - 1001700* &
      S_xxxyy - 18900*S_xxxzz + 94500*S_xyyyy - 18900*S_xyyzz) + M_yyz* &
      (-340200*S_xxxz + 491400*S_xyyz) + (-M_xx - M_yy)*(-49140*S_xxxxx &
      - 302400*S_xxxyy + 47250*S_xxxzz - 66150*S_xyyyy + 47250*S_xyyzz &
      ) + (-M_xxx - M_xyy)*(-132300*S_xxxx - 680400*S_xxyy + 47250* &
      S_xxzz - 66150*S_yyyy + 47250*S_yyzz) + (-M_xxxy - M_xyyy)*( &
      -1020600*S_xxy - 37800*S_yyy) + (-M_xxy - M_yyy)*(-491400*S_xxxy &
      - 37800*S_xyyy))
    S_xxxxxyz  = (15.0d0/143.0d0)*h**2*x*y*z - 10.0d0/13.0d0*h*x**3*y*z + x**5*y*z
    Ms_xxxxxyz = M_0*S_xxxxxyz + (560.0d0/143.0d0)*M_xxx*S_xxyz + (128.0d0/143.0d0)* &
      M_xxxxxyz + (1200.0d0/143.0d0)*M_xxyz*S_xxx + (30.0d0/143.0d0)*( &
      -M_xxxyyyz + x*(-M_xxyyyz - M_yyyyyz)) - 80.0d0/143.0d0*(M_xxxyyy &
      *z + y*(-M_xxxxxz - M_xxxyyz)) + (270.0d0/143.0d0)*(S_xyz*( &
      -M_xxyy - M_yyyy) + S_yz*(-M_xxxyy - M_xyyyy)) + (48.0d0/143.0d0) &
      *(M_xxxxx*S_yz + M_xxxxxy*z + M_xxxxxz*y) + (1.0d0/135135.0d0)*( &
      M_xy*(453600*S_xxxxz - 538650*S_xxyyz - 14175*S_xxzzz - 14175* &
      S_yyyyz - 14175*S_yyzzz) + M_xyz*(907200*S_xxxx - 255150*S_xxyy - &
      70875*S_xxzz - 184275*S_yyyy - 70875*S_yyzz) + M_xz*(907200* &
      S_xxxxy + 368550*S_xxyyy - 70875*S_xxyzz - 70875*S_yyyyy - 70875* &
      S_yyyzz) + M_yz*(272160*S_xxxxx - 255150*S_xxxyy - 70875*S_xxxzz &
      - 184275*S_xyyyy - 70875*S_xyyzz)) + (90.0d0/143.0d0)*(S_xy*( &
      -M_xxyyz - M_yyyyz) + S_xz*(-M_xxyyy - M_yyyyy) + y*(-M_xxxyyz - &
      M_xyyyyz) + z*(-M_xxxyyy - M_xyyyyy)) + (720.0d0/143.0d0)*(M_xx* &
      S_xxxyz + M_xxxyz*S_xx - M_xxyy*S_xyz - M_xxyyz*S_xy - S_xyz*( &
      -M_xxxx - M_xxyy) - S_xz*(-M_xxxxy - M_xxyyy)) + (75.0d0/143.0d0) &
      *(M_xyyyy*S_yz + M_xyyyyz*y + M_yyyy*S_xyz + M_yyyyz*S_xy + S_xyz &
      *(-M_xxzz - M_yyzz) + S_xz*(-M_xxyzz - M_yyyzz) + S_yz*(-M_xxxzz &
      - M_xyyzz) + z*(-M_xxxyzz - M_xyyyzz)) + (15.0d0/143.0d0)*( &
      -M_xxxyzzz + M_xyyyyy*z - M_xyyyyyz - M_xyyyzzz + M_yyyyy*S_xz + &
      M_yyyyyz*x + S_xy*(-M_xxzzz - M_yyzzz) + x*(-M_xxyzzz - M_yyyzzz &
      ) + y*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/810810.0d0)*(M_xxxy*( &
      3175200*S_xxz - 907200*S_yyz) + M_xxxz*(4082400*S_xxy + 907200* &
      S_yyy) + M_xyyy*(-1530900*S_xxz + 680400*S_yyz) + M_xyyyz*( &
      -1871100*S_xx + 340200*S_yy) + M_yyy*(-623700*S_xxxz + 680400* &
      S_xyyz) + M_yyyz*(-963900*S_xxx + 340200*S_xyy) + (-M_xxxyz - &
      M_xyyyz)*(-2211300*S_xx - 340200*S_yy) + (-M_xxxz - M_xyyz)*( &
      -2211300*S_xxy - 680400*S_yyy) + (-M_xxyz - M_yyyz)*(-1304100* &
      S_xxx - 340200*S_xyy) + (-M_xxz - M_yyz)*(-1304100*S_xxxy - &
      680400*S_xyyy)) + (1.0d0/270270.0d0)*(M_xxy*(1360800*S_xxxz - &
      907200*S_xyyz) + M_xxz*(2268000*S_xxxy + 907200*S_xyyy) + M_xyy*( &
      -1530900*S_xxyz + 113400*S_yyyz) + M_xyyz*(-1871100*S_xxy - &
      226800*S_yyy) + M_yy*(-623700*S_xxxyz + 113400*S_xyyyz) + M_yyz*( &
      -963900*S_xxxy - 226800*S_xyyy) + (-M_xx - M_yy)*(-737100*S_xxxyz &
      - 113400*S_xyyyz) + (-M_xxx - M_xyy)*(-1644300*S_xxyz - 113400* &
      S_yyyz) + (-M_xxxy - M_xyyy)*(-1644300*S_xxz + 226800*S_yyz) + ( &
      -M_xxy - M_yyy)*(-737100*S_xxxz + 226800*S_xyyz)) + (240.0d0/ &
      143.0d0)*(M_xxxx*S_xyz + M_xxxxy*S_xz + M_xxxxyz*x + M_xxxxz*S_xy &
      - M_xxxyy*S_yz - M_xxxyyz*y - M_xxyyy*S_xz - M_xxyyyz*x - S_xy*( &
      -M_xxxxz - M_xxyyz) - S_yz*(-M_xxxxx - M_xxxyy) - x*(-M_xxxxyz - &
      M_xxyyyz) - z*(-M_xxxxxy - M_xxxyyy))
    S_xxxxyyy  = -1.0d0/143.0d0*h**3*y + (18.0d0/143.0d0)*h**2*x**2*y + (3.0d0/143.0d0)*h &
      **2*y**3 - 3.0d0/13.0d0*h*x**4*y - 6.0d0/13.0d0*h*x**2*y**3 + x** &
      4*y**3
    Ms_xxxxyyy = M_0*S_xxxxyyy + (10.0d0/13.0d0)*M_xxxxyyy + (1.0d0/16216200.0d0)*M_yyyyy &
      *(-5443200*S_xx + 4422600*S_yy) + (1.0d0/1621620.0d0)*(M_xxyyy*( &
      5783400*S_xx - 4762800*S_yy) + (-M_xxyyy - M_yyyyy)*(-340200*S_xx &
      + 340200*S_yy)) + (1.0d0/540540.0d0)*(M_xxyy*(5783400*S_xxy - &
      1360800*S_yyy) + (-M_xxxx - M_xxyy)*(-340200*S_xxy - 453600*S_yyy &
      ) + (-M_xxxxy - M_xxyyy)*(-340200*S_xx - 680400*S_yy) + (-M_xxyy &
      - M_yyyy)*(-340200*S_xxy + 113400*S_yyy)) + (1.0d0/135135.0d0)*( &
      M_xy*(-90720*S_xxxxx + 1077300*S_xxxyy - 28350*S_xxxzz - 255150* &
      S_xyyyy - 28350*S_xyyzz) + M_xyz*(-113400*S_xxxz - 453600*S_xyyz &
      ) + M_xz*(-113400*S_xxxyz - 226800*S_xyyyz) + M_yz*(-56700* &
      S_xxxxz - 226800*S_xxyyz + 5670*S_xxzzz + 28350*S_yyyyz + 5670* &
      S_yyzzz)) + (1.0d0/3243240.0d0)*(M_xxxx*(-5443200*S_xxy + 1814400 &
      *S_yyy) + M_xxxxy*(-5443200*S_xx + 5443200*S_yy) + M_yyyy*( &
      -5443200*S_xxy + 1247400*S_yyy) + (-M_xxyzz - M_yyyzz)*(680400* &
      S_xx + 340200*S_yy) + (-M_xxzz - M_yyzz)*(680400*S_xxy + 340200* &
      S_yyy)) + (1.0d0/810810.0d0)*(M_xxx*(-1814400*S_xxxy + 1814400* &
      S_xyyy) + M_xxxy*(-1814400*S_xxx + 5443200*S_xyy) + M_xyyy*( &
      2154600*S_xxx - 4762800*S_xyy) + M_yyy*(623700*S_xxxx - 2551500* &
      S_xxyy + 226800*S_yyyy) + M_yyyz*(-340200*S_xxz + 340200*S_yyz) + &
      (-M_xxyz - M_yyyz)*(453600*S_xxz + 113400*S_yyz) + (-M_xxz - &
      M_yyz)*(453600*S_xxyz + 113400*S_yyyz)) + (1.0d0/270270.0d0)*( &
      M_xx*(-453600*S_xxxxy + 963900*S_xxyyy - 28350*S_xxyzz - 28350* &
      S_yyyyy - 28350*S_yyyzz) + M_xxy*(-453600*S_xxxx + 2891700*S_xxyy &
      - 28350*S_xxzz - 255150*S_yyyy - 28350*S_yyzz) + M_xxyz*(-113400* &
      S_xxz - 453600*S_yyz) + M_xxz*(-113400*S_xxyz - 226800*S_yyyz) + &
      M_xyy*(2154600*S_xxxy - 1360800*S_xyyy) + M_yy*(623700*S_xxxxy - &
      737100*S_xxyyy + 22680*S_yyyyy) + M_yyz*(-340200*S_xxyz + 113400* &
      S_yyyz) + (-M_xx - M_yy)*(-170100*S_xxxxy - 226800*S_xxyyy + &
      28350*S_xxyzz + 5670*S_yyyyy + 28350*S_yyyzz) + (-M_xxx - M_xyy)* &
      (-340200*S_xxxy - 453600*S_xyyy) + (-M_xxxy - M_xyyy)*(-340200* &
      S_xxx - 680400*S_xyy) + (-M_xxy - M_yyy)*(-170100*S_xxxx - 340200 &
      *S_xxyy + 28350*S_xxzz + 28350*S_yyyy + 28350*S_yyzz)) + (1.0d0/ &
      143.0d0)*(-96*M_xxxxx*S_xy - 16*M_xxxxxx*y - 16*M_xxxxxxy - 96* &
      M_xxxxxy*x + 240*M_xxxxyy*y - 15*M_xxxxyzz + 960*M_xxxyy*S_xy + &
      320*M_xxxyyy*x - 225*M_xxyyyy*y - 18*M_xxyyyyy - 60*M_xxyyyz*z - &
      15*M_xxyyyzz - 180*M_xxyyz*S_yz + M_xxyzzzz - 450*M_xyyyy*S_xy - &
      90*M_xyyyyy*x - 120*M_xyyyz*S_xz - 360*M_xyyz*S_xyz + 14*M_yyyyyy &
      *y - M_yyyyyyy + 6*M_yyyyyz*z + 30*M_yyyyz*S_yz + M_yyyzzzz - 180 &
      *S_xy*(-M_xxxyy - M_xyyyy) + 30*S_xy*(-M_xxxzz - M_xyyzz) + 120* &
      S_xyz*(-M_xxxz - M_xyyz) + 120*S_xz*(-M_xxxyz - M_xyyyz) + 60* &
      S_yz*(-M_xxxxz - M_xxyyz) - 6*S_yz*(-M_xxzzz - M_yyzzz) - 60*x*( &
      -M_xxxyyy - M_xyyyyy) + 30*x*(-M_xxxyzz - M_xyyyzz) - 90*y*( &
      -M_xxxxyy - M_xxyyyy) + 15*y*(-M_xxxxzz - M_xxyyzz) + 15*y*( &
      -M_xxyyyy - M_yyyyyy) - y*(-M_xxzzzz - M_yyzzzz) + 60*z*( &
      -M_xxxxyz - M_xxyyyz) - 6*z*(-M_xxyzzz - M_yyyzzz))
    S_xxxxyyz  = -1.0d0/429.0d0*h**3*z + (6.0d0/143.0d0)*h**2*x**2*z + (3.0d0/143.0d0)*h &
      **2*y**2*z + x**4*y**2*z - 1.0d0/13.0d0*(h*x**4*z + 6*h*x**2*y**2 &
      *z)
    Ms_xxxxyyz = M_0*S_xxxxyyz + (80.0d0/143.0d0)*M_xxxxyy*z + (10.0d0/11.0d0)*M_xxxxyyz &
      - 5.0d0/143.0d0*M_xxxxzzz - 5.0d0/13.0d0*M_xxyyyy*z - 7.0d0/ &
      143.0d0*M_xxyyzzz - 2.0d0/143.0d0*M_yyyyzzz - 200.0d0/143.0d0* &
      S_xy*(-M_xxxyz - M_xyyyz) - 600.0d0/143.0d0*S_xyz*(-M_xxxy - &
      M_xyyy) + (50.0d0/143.0d0)*S_xz*(-M_xxxzz - M_xyyzz) + (60.0d0/ &
      143.0d0)*S_yz*(-M_xxyyy - M_yyyyy) + (4.0d0/143.0d0)*y*(-M_xxyzzz &
      - M_yyyzzz) - 150.0d0/143.0d0*z*(-M_xxxxyy - M_xxyyyy) + (25.0d0/ &
      143.0d0)*z*(-M_xxxxzz - M_xxyyzz) + (15.0d0/143.0d0)*z*(-M_xxyyyy &
      - M_yyyyyy) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz)*(1360800* &
      S_xx + 1020600*S_yy) - 32.0d0/143.0d0*(M_xxxxx*S_xz + M_xxxxxz*x &
      ) + (160.0d0/143.0d0)*(M_xxxxy*S_yz + M_xxxxyz*y) + (640.0d0/ &
      143.0d0)*(M_xxxy*S_xyz + M_xxxyz*S_xy) + (320.0d0/143.0d0)*( &
      M_xxxyy*S_xz + M_xxxyyz*x) - 20.0d0/13.0d0*(M_xxyyy*S_yz + &
      M_xxyyyz*y) - 40.0d0/13.0d0*(M_xyyy*S_xyz + M_xyyyz*S_xy) - &
      10.0d0/13.0d0*(M_xyyyy*S_xz + M_xyyyyz*x) + (16.0d0/143.0d0)*( &
      M_yyyyy*S_yz + M_yyyyyz*y) - 300.0d0/143.0d0*(S_xz*(-M_xxxyy - &
      M_xyyyy) + S_yz*(-M_xxxxy - M_xxyyy)) + (20.0d0/143.0d0)*(S_yz*( &
      -M_xxyzz - M_yyyzz) + y*(-M_xxyyyz - M_yyyyyz)) - 100.0d0/143.0d0 &
      *(x*(-M_xxxyyz - M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/ &
      1621620.0d0)*((-M_xxxxz - M_xxyyz)*(-567000*S_xx - 1134000*S_yy) &
      + (-M_xxyyz - M_yyyyz)*(-793800*S_xx + 113400*S_yy)) + (10.0d0/ &
      143.0d0)*(-M_xxyyyyz + x*(-M_xxxzzz - M_xyyzzz) + z*(-M_xxyyzz - &
      M_yyyyzz)) + (1.0d0/540540.0d0)*(M_xxyy*(2003400*S_xxz - 1058400* &
      S_yyz) + M_xxyyz*(2381400*S_xx - 680400*S_yy) + (-M_xxxx - M_xxyy &
      )*(-189000*S_xxz - 756000*S_yyz) + (-M_xxyy - M_yyyy)*(-642600* &
      S_xxz + 264600*S_yyz)) + (1.0d0/135135.0d0)*(M_xy*(793800*S_xxxyz &
      - 226800*S_xyyyz) + M_xyz*(1171800*S_xxxy + 151200*S_xyyy) + M_xz &
      *(-30240*S_xxxxx + 585900*S_xxxyy - 47250*S_xxxzz + 179550* &
      S_xyyyy - 47250*S_xyyzz) + M_yz*(434700*S_xxxxy + 18900*S_xxyyy - &
      18900*S_xxyzz - 41580*S_yyyyy - 18900*S_yyyzz)) + (1.0d0/ &
      3243240.0d0)*(M_xxxx*(-1814400*S_xxz + 1814400*S_yyz) + M_xxxxz*( &
      -1814400*S_xx + 1814400*S_yy) + M_yyyy*(-1360800*S_xxz + 793800* &
      S_yyz) + M_yyyyz*(-1587600*S_xx + 567000*S_yy) + (-M_xxzz - &
      M_yyzz)*(831600*S_xxz + 491400*S_yyz)) + (1.0d0/810810.0d0)*( &
      M_xxx*(-604800*S_xxxz + 1814400*S_xyyz) + M_xxxz*(-604800*S_xxx + &
      1814400*S_xyy) + M_yyy*(-1360800*S_xxyz + 189000*S_yyyz) + M_yyyz &
      *(-1587600*S_xxy - 37800*S_yyy) + (-M_xxxz - M_xyyz)*(-567000* &
      S_xxx - 1134000*S_xyy) + (-M_xxyz - M_yyyz)*(-793800*S_xxy - &
      113400*S_yyy) + (-M_xxz - M_yyz)*(-283500*S_xxxx - 680400*S_xxyy &
      + 66150*S_xxzz - 85050*S_yyyy + 66150*S_yyzz)) + (1.0d0/429.0d0)* &
      (-16*M_xxxxxx*z - 16*M_xxxxxxz + M_xxzzzzz + 8*M_yyyyyy*z - 7* &
      M_yyyyyyz + M_yyzzzzz - 7*z*(-M_xxzzzz - M_yyzzzz)) + (1.0d0/ &
      270270.0d0)*(M_xx*(-151200*S_xxxxz + 1001700*S_xxyyz - 9450* &
      S_xxzzz - 9450*S_yyyyz - 9450*S_yyzzz) + M_xxy*(2003400*S_xxyz - &
      226800*S_yyyz) + M_xxyz*(2381400*S_xxy + 151200*S_yyy) + M_xxz*( &
      -151200*S_xxxx + 1190700*S_xxyy - 47250*S_xxzz + 179550*S_yyyy - &
      47250*S_yyzz) + M_xyy*(793800*S_xxxz - 1058400*S_xyyz) + M_xyyz*( &
      1171800*S_xxx - 680400*S_xyy) + M_yy*(245700*S_xxxxz - 585900* &
      S_xxyyz - 3780*S_xxzzz + 18900*S_yyyyz - 3780*S_yyzzz) + M_yyz*( &
      434700*S_xxxx - 510300*S_xxyy - 18900*S_xxzz - 94500*S_yyyy - &
      18900*S_yyzz) + (-M_xx - M_yy)*(-94500*S_xxxxz - 415800*S_xxyyz + &
      13230*S_xxzzz - 9450*S_yyyyz + 13230*S_yyzzz) + (-M_xxx - M_xyy)* &
      (-189000*S_xxxz - 756000*S_xyyz) + (-M_xxy - M_yyy)*(-642600* &
      S_xxyz + 37800*S_yyyz))
    S_xxxyyyy  = -1.0d0/143.0d0*h**3*x + (3.0d0/143.0d0)*h**2*x**3 + (18.0d0/143.0d0)*h** &
      2*x*y**2 - 6.0d0/13.0d0*h*x**3*y**2 - 3.0d0/13.0d0*h*x*y**4 + x** &
      3*y**4
    Ms_xxxyyyy = M_0*S_xxxyyyy + (1.0d0/16216200.0d0)*M_xxxxx*(4422600*S_xx - 5443200* &
      S_yy) + (10.0d0/13.0d0)*M_xxxyyyy + (1.0d0/1621620.0d0)*(M_xxxyy* &
      (-4762800*S_xx + 5783400*S_yy) + (-M_xxxxx - M_xxxyy)*(340200* &
      S_xx - 340200*S_yy)) + (1.0d0/540540.0d0)*(M_xxyy*(-1360800*S_xxx &
      + 5783400*S_xyy) + (-M_xxxx - M_xxyy)*(113400*S_xxx - 340200* &
      S_xyy) + (-M_xxxyy - M_xyyyy)*(-680400*S_xx - 340200*S_yy) + ( &
      -M_xxyy - M_yyyy)*(-453600*S_xxx - 340200*S_xyy)) + (1.0d0/ &
      135135.0d0)*(M_xy*(-255150*S_xxxxy + 1077300*S_xxyyy - 28350* &
      S_xxyzz - 90720*S_yyyyy - 28350*S_yyyzz) + M_xyz*(-453600*S_xxyz &
      - 113400*S_yyyz) + M_xz*(28350*S_xxxxz - 226800*S_xxyyz + 5670* &
      S_xxzzz - 56700*S_yyyyz + 5670*S_yyzzz) + M_yz*(-226800*S_xxxyz - &
      113400*S_xyyyz)) + (1.0d0/3243240.0d0)*(M_xxxx*(1247400*S_xxx - &
      5443200*S_xyy) + M_xyyyy*(5443200*S_xx - 5443200*S_yy) + M_yyyy*( &
      1814400*S_xxx - 5443200*S_xyy) + (-M_xxxzz - M_xyyzz)*(340200* &
      S_xx + 680400*S_yy) + (-M_xxzz - M_yyzz)*(340200*S_xxx + 680400* &
      S_xyy)) + (1.0d0/810810.0d0)*(M_xxx*(226800*S_xxxx - 2551500* &
      S_xxyy + 623700*S_yyyy) + M_xxxy*(-4762800*S_xxy + 2154600*S_yyy &
      ) + M_xxxz*(340200*S_xxz - 340200*S_yyz) + M_xyyy*(5443200*S_xxy &
      - 1814400*S_yyy) + M_yyy*(1814400*S_xxxy - 1814400*S_xyyy) + ( &
      -M_xxxz - M_xyyz)*(113400*S_xxz + 453600*S_yyz) + (-M_xxz - M_yyz &
      )*(113400*S_xxxz + 453600*S_xyyz)) + (1.0d0/270270.0d0)*(M_xx*( &
      22680*S_xxxxx - 737100*S_xxxyy + 623700*S_xyyyy) + M_xxy*( &
      -1360800*S_xxxy + 2154600*S_xyyy) + M_xxz*(113400*S_xxxz - 340200 &
      *S_xyyz) + M_xyy*(-255150*S_xxxx + 2891700*S_xxyy - 28350*S_xxzz &
      - 453600*S_yyyy - 28350*S_yyzz) + M_xyyz*(-453600*S_xxz - 113400* &
      S_yyz) + M_yy*(-28350*S_xxxxx + 963900*S_xxxyy - 28350*S_xxxzz - &
      453600*S_xyyyy - 28350*S_xyyzz) + M_yyz*(-226800*S_xxxz - 113400* &
      S_xyyz) + (-M_xx - M_yy)*(5670*S_xxxxx - 226800*S_xxxyy + 28350* &
      S_xxxzz - 170100*S_xyyyy + 28350*S_xyyzz) + (-M_xxx - M_xyy)*( &
      28350*S_xxxx - 340200*S_xxyy + 28350*S_xxzz - 170100*S_yyyy + &
      28350*S_yyzz) + (-M_xxxy - M_xyyy)*(-680400*S_xxy - 340200*S_yyy &
      ) + (-M_xxy - M_yyy)*(-453600*S_xxxy - 340200*S_xyyy)) + (1.0d0/ &
      143.0d0)*(14*M_xxxxxx*x - M_xxxxxxx - 90*M_xxxxxy*y - 18* &
      M_xxxxxyy + 6*M_xxxxxz*z - 450*M_xxxxy*S_xy - 225*M_xxxxyy*x + 30 &
      *M_xxxxz*S_xz + 320*M_xxxyyy*y - 60*M_xxxyyz*z - 15*M_xxxyyzz - &
      120*M_xxxyz*S_yz + M_xxxzzzz + 960*M_xxyyy*S_xy + 240*M_xxyyyy*x &
      - 180*M_xxyyz*S_xz - 360*M_xxyz*S_xyz - 96*M_xyyyyy*y - 16* &
      M_xyyyyyy - 15*M_xyyyyzz + M_xyyzzzz - 96*M_yyyyy*S_xy - 16* &
      M_yyyyyy*x - 180*S_xy*(-M_xxxxy - M_xxyyy) + 30*S_xy*(-M_xxyzz - &
      M_yyyzz) + 120*S_xyz*(-M_xxyz - M_yyyz) + 60*S_xz*(-M_xxyyz - &
      M_yyyyz) - 6*S_xz*(-M_xxzzz - M_yyzzz) + 120*S_yz*(-M_xxxyz - &
      M_xyyyz) + 15*x*(-M_xxxxxx - M_xxxxyy) - 90*x*(-M_xxxxyy - &
      M_xxyyyy) + 15*x*(-M_xxyyzz - M_yyyyzz) - x*(-M_xxzzzz - M_yyzzzz &
      ) - 60*y*(-M_xxxxxy - M_xxxyyy) + 30*y*(-M_xxxyzz - M_xyyyzz) + &
      60*z*(-M_xxxyyz - M_xyyyyz) - 6*z*(-M_xxxzzz - M_xyyzzz))
    S_xxxyyyz  = (9.0d0/143.0d0)*h**2*x*y*z + x**3*y**3*z - 3.0d0/13.0d0*(h*x**3*y*z + h* &
      x*y**3*z)
    Ms_xxxyyyz = M_0*S_xxxyyyz + (95.0d0/143.0d0)*M_xxxyyy*z + (125.0d0/143.0d0)* &
      M_xxxyyyz + (855.0d0/143.0d0)*(M_xxyy*S_xyz + M_xxyyz*S_xy) - &
      15.0d0/143.0d0*(x*(-M_xxyyyz - M_yyyyyz) + y*(-M_xxxxxz - &
      M_xxxyyz)) + (285.0d0/143.0d0)*(M_xxxyy*S_yz + M_xxxyyz*y + &
      M_xxyyy*S_xz + M_xxyyyz*x) + (1.0d0/135135.0d0)*(M_xy*(-70875* &
      S_xxxxz + 893025*S_xxyyz - 8505*S_xxzzz - 70875*S_yyyyz - 8505* &
      S_yyzzz) + M_xyz*(14175*S_xxxx + 1063125*S_xxyy - 42525*S_xxzz + &
      14175*S_yyyy - 42525*S_yyzz) + M_xz*(14175*S_xxxxy + 439425* &
      S_xxyyy - 42525*S_xxyzz + 19845*S_yyyyy - 42525*S_yyyzz) + M_yz*( &
      19845*S_xxxxx + 439425*S_xxxyy - 42525*S_xxxzz + 14175*S_xyyyy - &
      42525*S_xyyzz)) - 135.0d0/143.0d0*(S_xyz*(-M_xxxx - M_xxyy) + &
      S_xyz*(-M_xxyy - M_yyyy) + S_xz*(-M_xxxxy - M_xxyyy) + S_yz*( &
      -M_xxxyy - M_xyyyy)) - 24.0d0/143.0d0*(M_xxxxx*S_yz + M_xxxxxy*z &
      + M_xxxxxz*y + M_xyyyyy*z + M_yyyyy*S_xz + M_yyyyyz*x) + (9.0d0/ &
      143.0d0)*(-M_xxxxxyz - M_xxxyzzz - M_xyyyyyz - M_xyyyzzz + S_xy*( &
      -M_xxzzz - M_yyzzz) + x*(-M_xxyzzz - M_yyyzzz) + y*(-M_xxxzzz - &
      M_xyyzzz)) - 120.0d0/143.0d0*(M_xxxx*S_xyz + M_xxxxy*S_xz + &
      M_xxxxyz*x + M_xxxxz*S_xy + M_xyyyy*S_yz + M_xyyyyz*y + M_yyyy* &
      S_xyz + M_yyyyz*S_xy) + (1.0d0/270270.0d0)*(M_xx*(-368550*S_xxxyz &
      + 623700*S_xyyyz) + M_xxy*(-368550*S_xxxz + 1701000*S_xyyz) + &
      M_xxyz*(-198450*S_xxx + 1871100*S_xyy) + M_xxz*(-198450*S_xxxy + &
      793800*S_xyyy) + M_xyy*(1701000*S_xxyz - 368550*S_yyyz) + M_xyyz* &
      (1871100*S_xxy - 198450*S_yyy) + M_yy*(623700*S_xxxyz - 368550* &
      S_xyyyz) + M_yyz*(793800*S_xxxy - 198450*S_xyyy) + (-M_xx - M_yy) &
      *(-255150*S_xxxyz - 255150*S_xyyyz) + (-M_xxx - M_xyy)*(-425250* &
      S_xxyz - 255150*S_yyyz) + (-M_xxxy - M_xyyy)*(-425250*S_xxz - &
      425250*S_yyz) + (-M_xxy - M_yyy)*(-255150*S_xxxz - 425250*S_xyyz &
      )) + (1.0d0/810810.0d0)*(M_xxx*(-1275750*S_xxyz + 623700*S_yyyz) &
      + M_xxxy*(-1275750*S_xxz + 1701000*S_yyz) + M_xxxyz*(-1105650* &
      S_xx + 1871100*S_yy) + M_xxxz*(-1105650*S_xxy + 793800*S_yyy) + &
      M_xyyy*(1701000*S_xxz - 1275750*S_yyz) + M_xyyyz*(1871100*S_xx - &
      1105650*S_yy) + M_yyy*(623700*S_xxxz - 1275750*S_xyyz) + M_yyyz*( &
      793800*S_xxx - 1105650*S_xyy) + (-M_xxxyz - M_xyyyz)*(-765450* &
      S_xx - 765450*S_yy) + (-M_xxxz - M_xyyz)*(-765450*S_xxy - 595350* &
      S_yyy) + (-M_xxyz - M_yyyz)*(-595350*S_xxx - 765450*S_xyy) + ( &
      -M_xxz - M_yyz)*(-595350*S_xxxy - 595350*S_xyyy)) + (45.0d0/ &
      143.0d0)*(-S_xy*(-M_xxxxz - M_xxyyz) - S_xy*(-M_xxyyz - M_yyyyz) &
      + S_xyz*(-M_xxzz - M_yyzz) - S_xz*(-M_xxyyy - M_yyyyy) + S_xz*( &
      -M_xxyzz - M_yyyzz) - S_yz*(-M_xxxxx - M_xxxyy) + S_yz*(-M_xxxzz &
      - M_xyyzz) - x*(-M_xxxxyz - M_xxyyyz) - y*(-M_xxxyyz - M_xyyyyz) &
      - z*(-M_xxxxxy - M_xxxyyy) - z*(-M_xxxyyy - M_xyyyyy) + z*( &
      -M_xxxyzz - M_xyyyzz))
    S_xxyyyyy  = -5.0d0/429.0d0*h**3*y + (15.0d0/143.0d0)*h**2*x**2*y + (10.0d0/143.0d0)* &
      h**2*y**3 + x**2*y**5 - 1.0d0/13.0d0*(10*h*x**2*y**3 + h*y**5)
    Ms_xxyyyyy = M_0*S_xxyyyyy + (40.0d0/429.0d0)*M_xxxxxx*y - 35.0d0/429.0d0*M_xxxxxxy - &
      225.0d0/143.0d0*M_xxxxyy*y - 30.0d0/143.0d0*M_xxxxyyy - 900.0d0/ &
      143.0d0*M_xxxyy*S_xy - 300.0d0/143.0d0*M_xxxyyy*x + (20.0d0/ &
      11.0d0)*M_xxyyyy*y + (118.0d0/143.0d0)*M_xxyyyyy + (40.0d0/11.0d0 &
      )*M_xyyyy*S_xy + (8.0d0/11.0d0)*M_xyyyyy*x - 280.0d0/143.0d0* &
      M_xyyyz*S_xz - 840.0d0/143.0d0*M_xyyz*S_xyz + (1.0d0/16216200.0d0 &
      )*M_yyyyy*(5443200*S_xx - 6804000*S_yy) - 56.0d0/429.0d0*M_yyyyyy &
      *y - 20.0d0/429.0d0*M_yyyyyyy + (8.0d0/143.0d0)*M_yyyyyz*z - &
      5.0d0/143.0d0*M_yyyyyzz + (60.0d0/143.0d0)*S_yz*(-M_xxyyz - &
      M_yyyyz) + (25.0d0/143.0d0)*y*(-M_xxxxxx - M_xxxxyy) - 210.0d0/ &
      143.0d0*y*(-M_xxxxyy - M_xxyyyy) + (15.0d0/143.0d0)*(-M_xxyyyzz + &
      y*(-M_xxyyzz - M_yyyyzz)) + (50.0d0/143.0d0)*(M_xxxxyz*z + &
      M_xxxxz*S_yz) + (200.0d0/143.0d0)*(M_xxxyz*S_xz + M_xxxz*S_xyz) + &
      (1.0d0/1621620.0d0)*(M_xxyyy*(-4309200*S_xx + 6690600*S_yy) + ( &
      -M_xxyyy - M_yyyyy)*(-1134000*S_xx + 113400*S_yy)) - 140.0d0/ &
      143.0d0*(M_xxyyyz*z + x*(-M_xxxyyy - M_xyyyyy)) - 420.0d0/143.0d0 &
      *(M_xxyyz*S_yz + S_xy*(-M_xxxyy - M_xyyyy)) + (100.0d0/143.0d0)*( &
      S_xy*(-M_xxxxx - M_xxxyy) + x*(-M_xxxxxy - M_xxxyyy)) + (5.0d0/ &
      429.0d0)*(M_xxyzzzz + M_yyyzzzz - y*(-M_xxzzzz - M_yyzzzz)) + ( &
      40.0d0/143.0d0)*(M_yyyyz*S_yz + S_yz*(-M_xxxxz - M_xxyyz) + z*( &
      -M_xxxxyz - M_xxyyyz)) + (10.0d0/143.0d0)*(-M_xxxxyzz - S_yz*( &
      -M_xxzzz - M_yyzzz) + y*(-M_xxxxzz - M_xxyyzz) - z*(-M_xxyzzz - &
      M_yyyzzz)) + (80.0d0/143.0d0)*(M_xxxxx*S_xy + M_xxxxxy*x + S_xyz* &
      (-M_xxxz - M_xyyz) + S_xz*(-M_xxxyz - M_xyyyz)) + (1.0d0/ &
      540540.0d0)*(M_xxyy*(-4309200*S_xxy + 2759400*S_yyy) + (-M_xxxx - &
      M_xxyy)*(340200*S_xxy - 491400*S_yyy) + (-M_xxxxy - M_xxyyy)*( &
      340200*S_xx - 1020600*S_yy) + (-M_xxyy - M_yyyy)*(-1134000*S_xxy &
      - 189000*S_yyy)) + (1.0d0/135135.0d0)*(M_xy*(-18900*S_xxxxx - &
      548100*S_xxxyy - 18900*S_xxxzz + 888300*S_xyyyy - 18900*S_xyyzz) &
      + M_xyz*(113400*S_xxxz - 869400*S_xyyz) + M_xz*(113400*S_xxxyz - &
      340200*S_xyyyz) + M_yz*(9450*S_xxxxz - 491400*S_xxyyz + 9450* &
      S_xxzzz - 18900*S_yyyyz + 9450*S_yyzzz)) + (20.0d0/143.0d0)*(S_xy &
      *(-M_xxxzz - M_xyyzz) + x*(-M_xxxyzz - M_xyyyzz) + y*(-M_xxyyyy - &
      M_yyyyyy) + z*(-M_xxyyyz - M_yyyyyz)) + (1.0d0/3243240.0d0)*( &
      M_xxxx*(3969000*S_xxy - 2268000*S_yyy) + M_xxxxy*(3969000*S_xx - &
      5670000*S_yy) + M_yyyy*(5443200*S_xxy - 2570400*S_yyy) + ( &
      -M_xxyzz - M_yyyzz)*(793800*S_xx + 907200*S_yy) + (-M_xxzz - &
      M_yyzz)*(793800*S_xxy + 680400*S_yyy)) + (1.0d0/810810.0d0)*( &
      M_xxx*(945000*S_xxxy - 2268000*S_xyyy) + M_xxxy*(945000*S_xxx - &
      5670000*S_xyy) + M_xyyy*(-907200*S_xxx + 6690600*S_xyy) + M_yyy*( &
      -28350*S_xxxx + 3118500*S_xxyy - 28350*S_xxzz - 756000*S_yyyy - &
      28350*S_yyzz) + M_yyyz*(-907200*S_xxz + 340200*S_yyz) + (-M_xxyz &
      - M_yyyz)*(415800*S_xxz + 529200*S_yyz) + (-M_xxz - M_yyz)*( &
      415800*S_xxyz + 302400*S_yyyz)) + (1.0d0/270270.0d0)*(M_xx*(94500 &
      *S_xxxxy - 1001700*S_xxyyy - 18900*S_xxyzz + 230580*S_yyyyy - &
      18900*S_yyyzz) + M_xxy*(94500*S_xxxx - 2438100*S_xxyy - 18900* &
      S_xxzz + 888300*S_yyyy - 18900*S_yyzz) + M_xxyz*(491400*S_xxz - &
      869400*S_yyz) + M_xxz*(491400*S_xxyz - 340200*S_yyyz) + M_xyy*( &
      -907200*S_xxxy + 2759400*S_xyyy) + M_yy*(-28350*S_xxxxy + 1304100 &
      *S_xxyyy - 28350*S_xxyzz - 181440*S_yyyyy - 28350*S_yyyzz) + &
      M_yyz*(-907200*S_xxyz + 37800*S_yyyz) + (-M_xx - M_yy)*(-66150* &
      S_xxxxy - 302400*S_xxyyy + 47250*S_xxyzz - 49140*S_yyyyy + 47250* &
      S_yyyzz) + (-M_xxx - M_xyy)*(-37800*S_xxxy - 491400*S_xyyy) + ( &
      -M_xxxy - M_xyyy)*(-37800*S_xxx - 1020600*S_xyy) + (-M_xxy - &
      M_yyy)*(-66150*S_xxxx - 680400*S_xxyy + 47250*S_xxzz - 132300* &
      S_yyyy + 47250*S_yyzz))
    S_xxyyyyz  = -1.0d0/429.0d0*h**3*z + (3.0d0/143.0d0)*h**2*x**2*z + (6.0d0/143.0d0)*h &
      **2*y**2*z + x**2*y**4*z - 1.0d0/13.0d0*(6*h*x**2*y**2*z + h*y**4 &
      *z)
    Ms_xxyyyyz = M_0*S_xxyyyyz - 5.0d0/13.0d0*M_xxxxyy*z - 2.0d0/143.0d0*M_xxxxzzz + ( &
      80.0d0/143.0d0)*M_xxyyyy*z + (10.0d0/11.0d0)*M_xxyyyyz - 7.0d0/ &
      143.0d0*M_xxyyzzz - 5.0d0/143.0d0*M_yyyyzzz - 200.0d0/143.0d0* &
      S_xy*(-M_xxxyz - M_xyyyz) - 600.0d0/143.0d0*S_xyz*(-M_xxxy - &
      M_xyyy) + (60.0d0/143.0d0)*S_xz*(-M_xxxxx - M_xxxyy) + (50.0d0/ &
      143.0d0)*S_yz*(-M_xxyzz - M_yyyzz) + (4.0d0/143.0d0)*x*(-M_xxxzzz &
      - M_xyyzzz) + (15.0d0/143.0d0)*z*(-M_xxxxxx - M_xxxxyy) - 150.0d0 &
      /143.0d0*z*(-M_xxxxyy - M_xxyyyy) + (25.0d0/143.0d0)*z*(-M_xxyyzz &
      - M_yyyyzz) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz)*(1020600* &
      S_xx + 1360800*S_yy) + (16.0d0/143.0d0)*(M_xxxxx*S_xz + M_xxxxxz* &
      x) - 10.0d0/13.0d0*(M_xxxxy*S_yz + M_xxxxyz*y) - 40.0d0/13.0d0*( &
      M_xxxy*S_xyz + M_xxxyz*S_xy) - 20.0d0/13.0d0*(M_xxxyy*S_xz + &
      M_xxxyyz*x) + (320.0d0/143.0d0)*(M_xxyyy*S_yz + M_xxyyyz*y) + ( &
      640.0d0/143.0d0)*(M_xyyy*S_xyz + M_xyyyz*S_xy) + (160.0d0/143.0d0 &
      )*(M_xyyyy*S_xz + M_xyyyyz*x) - 32.0d0/143.0d0*(M_yyyyy*S_yz + &
      M_yyyyyz*y) - 300.0d0/143.0d0*(S_xz*(-M_xxxyy - M_xyyyy) + S_yz*( &
      -M_xxxxy - M_xxyyy)) + (20.0d0/143.0d0)*(S_xz*(-M_xxxzz - M_xyyzz &
      ) + x*(-M_xxxxxz - M_xxxyyz)) - 100.0d0/143.0d0*(x*(-M_xxxyyz - &
      M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/1621620.0d0)*(( &
      -M_xxxxz - M_xxyyz)*(113400*S_xx - 793800*S_yy) + (-M_xxyyz - &
      M_yyyyz)*(-1134000*S_xx - 567000*S_yy)) + (10.0d0/143.0d0)*( &
      -M_xxxxyyz + y*(-M_xxyzzz - M_yyyzzz) + z*(-M_xxxxzz - M_xxyyzz &
      )) + (1.0d0/540540.0d0)*(M_xxyy*(-1058400*S_xxz + 2003400*S_yyz) &
      + M_xxyyz*(-680400*S_xx + 2381400*S_yy) + (-M_xxxx - M_xxyy)*( &
      264600*S_xxz - 642600*S_yyz) + (-M_xxyy - M_yyyy)*(-756000*S_xxz &
      - 189000*S_yyz)) + (1.0d0/135135.0d0)*(M_xy*(-226800*S_xxxyz + &
      793800*S_xyyyz) + M_xyz*(151200*S_xxxy + 1171800*S_xyyy) + M_xz*( &
      -41580*S_xxxxx + 18900*S_xxxyy - 18900*S_xxxzz + 434700*S_xyyyy - &
      18900*S_xyyzz) + M_yz*(179550*S_xxxxy + 585900*S_xxyyy - 47250* &
      S_xxyzz - 30240*S_yyyyy - 47250*S_yyyzz)) + (1.0d0/3243240.0d0)*( &
      M_xxxx*(793800*S_xxz - 1360800*S_yyz) + M_xxxxz*(567000*S_xx - &
      1587600*S_yy) + M_yyyy*(1814400*S_xxz - 1814400*S_yyz) + M_yyyyz* &
      (1814400*S_xx - 1814400*S_yy) + (-M_xxzz - M_yyzz)*(491400*S_xxz &
      + 831600*S_yyz)) + (1.0d0/810810.0d0)*(M_xxx*(189000*S_xxxz - &
      1360800*S_xyyz) + M_xxxz*(-37800*S_xxx - 1587600*S_xyy) + M_yyy*( &
      1814400*S_xxyz - 604800*S_yyyz) + M_yyyz*(1814400*S_xxy - 604800* &
      S_yyy) + (-M_xxxz - M_xyyz)*(-113400*S_xxx - 793800*S_xyy) + ( &
      -M_xxyz - M_yyyz)*(-1134000*S_xxy - 567000*S_yyy) + (-M_xxz - &
      M_yyz)*(-85050*S_xxxx - 680400*S_xxyy + 66150*S_xxzz - 283500* &
      S_yyyy + 66150*S_yyzz)) + (1.0d0/429.0d0)*(8*M_xxxxxx*z - 7* &
      M_xxxxxxz + M_xxzzzzz - 16*M_yyyyyy*z - 16*M_yyyyyyz + M_yyzzzzz &
      - 7*z*(-M_xxzzzz - M_yyzzzz)) + (1.0d0/270270.0d0)*(M_xx*(18900* &
      S_xxxxz - 585900*S_xxyyz - 3780*S_xxzzz + 245700*S_yyyyz - 3780* &
      S_yyzzz) + M_xxy*(-1058400*S_xxyz + 793800*S_yyyz) + M_xxyz*( &
      -680400*S_xxy + 1171800*S_yyy) + M_xxz*(-94500*S_xxxx - 510300* &
      S_xxyy - 18900*S_xxzz + 434700*S_yyyy - 18900*S_yyzz) + M_xyy*( &
      -226800*S_xxxz + 2003400*S_xyyz) + M_xyyz*(151200*S_xxx + 2381400 &
      *S_xyy) + M_yy*(-9450*S_xxxxz + 1001700*S_xxyyz - 9450*S_xxzzz - &
      151200*S_yyyyz - 9450*S_yyzzz) + M_yyz*(179550*S_xxxx + 1190700* &
      S_xxyy - 47250*S_xxzz - 151200*S_yyyy - 47250*S_yyzz) + (-M_xx - &
      M_yy)*(-9450*S_xxxxz - 415800*S_xxyyz + 13230*S_xxzzz - 94500* &
      S_yyyyz + 13230*S_yyzzz) + (-M_xxx - M_xyy)*(37800*S_xxxz - &
      642600*S_xyyz) + (-M_xxy - M_yyy)*(-756000*S_xxyz - 189000*S_yyyz &
      ))
    S_xyyyyyy  = -5.0d0/429.0d0*h**3*x + (45.0d0/143.0d0)*h**2*x*y**2 - 15.0d0/13.0d0*h*x &
      *y**4 + x*y**6
    Ms_xyyyyyy = M_0*S_xyyyyyy + (1.0d0/16216200.0d0)*M_xxxxx*(-3402000*S_xx + 5103000* &
      S_yy) - 35.0d0/429.0d0*M_xxxxxx*x + (10.0d0/429.0d0)*M_xxxxxxx + &
      (5.0d0/143.0d0)*M_xxxxxzz + (200.0d0/143.0d0)*M_xxxxyy*x - 50.0d0 &
      /143.0d0*M_xxxxz*S_xz + (304.0d0/429.0d0)*M_xyyyyyy + (2240.0d0/ &
      429.0d0)*M_yyy*S_xyyy + (64.0d0/429.0d0)*M_yyyyyy*x - 1120.0d0/ &
      143.0d0*M_yyz*S_xyyz - 60.0d0/143.0d0*S_xz*(-M_xxxxz - M_xxyyz) - &
      720.0d0/143.0d0*S_yy*(-M_xxxyy - M_xyyyy) - 800.0d0/143.0d0*S_yyy &
      *(-M_xxxy - M_xyyy) - 25.0d0/143.0d0*x*(-M_xxxxxx - M_xxxxyy) - &
      15.0d0/143.0d0*x*(-M_xxxxzz - M_xxyyzz) - 20.0d0/143.0d0*z*( &
      -M_xxxxxz - M_xxxyyz) - 35.0d0/143.0d0*(M_xxxxxyy + M_xxxyyzz) + &
      (40.0d0/143.0d0)*(-M_xyyyyzz + x*(-M_xxyyzz - M_yyyyzz)) + ( &
      400.0d0/143.0d0)*(M_xxxxy*S_xy + M_yyyy*S_xyy) + (1.0d0/ &
      1621620.0d0)*(M_xxxyy*(3628800*S_xx - 6350400*S_yy) + (-M_xxxxx - &
      M_xxxyy)*(-226800*S_xx + 1247400*S_yy)) + (240.0d0/143.0d0)*( &
      -M_xxyyyy*x + x*(-M_xxxxyy - M_xxyyyy)) + (480.0d0/143.0d0)*( &
      M_xxyyz*S_xz + S_xy*(-M_xxxxy - M_xxyyy)) + (128.0d0/143.0d0)*( &
      M_xyyyyy*y + M_yyyyy*S_xy) - 640.0d0/143.0d0*(M_xyyyz*S_yz + &
      M_yyyz*S_xyz) + (5.0d0/429.0d0)*(M_xxxzzzz + M_xyyzzzz - x*( &
      -M_xxzzzz - M_yyzzzz)) - 10.0d0/143.0d0*(M_xxxxxz*z + S_xz*( &
      -M_xxzzz - M_yyzzz) + z*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/ &
      540540.0d0)*(M_xxyy*(604800*S_xxx - 6350400*S_xyy) + (-M_xxxx - &
      M_xxyy)*(151200*S_xxx + 1247400*S_xyy) + (-M_xxyy - M_yyyy)*( &
      -604800*S_xxx - 2721600*S_xyy)) + (960.0d0/143.0d0)*(-M_xxyyy* &
      S_xy + M_xxyz*S_xyz - M_yz*S_xyyyz) + (1.0d0/135135.0d0)*(M_xy*( &
      -75600*S_xxxxy - 1058400*S_xxyyy - 75600*S_xxyzz + 423360*S_yyyyy &
      - 75600*S_yyyzz) + M_xyz*(604800*S_xxyz - 907200*S_yyyz) + M_xz*( &
      9450*S_xxxxz + 359100*S_xxyyz + 9450*S_xxzzz - 302400*S_yyyyz + &
      9450*S_yyzzz)) + (1.0d0/3243240.0d0)*(M_xxxx*(-756000*S_xxx + &
      5103000*S_xyy) + M_xyyyy*(-3628800*S_xx + 9072000*S_yy) + ( &
      -M_xxxzz - M_xyyzz)*(226800*S_xx + 1474200*S_yy) + (-M_xxzz - &
      M_yyzz)*(453600*S_xxx + 1474200*S_xyy)) + (80.0d0/143.0d0)*( &
      M_xxxxxy*y - M_xxxyyyy + S_xy*(-M_xxyzz - M_yyyzz) - x*(-M_xxyyyy &
      - M_yyyyyy) + y*(-M_xxxyzz - M_xyyyzz)) + (1.0d0/810810.0d0)*( &
      M_xxx*(-47250*S_xxxx + 2097900*S_xxyy + 28350*S_xxzz - 907200* &
      S_yyyy + 28350*S_yyzz) + M_xxxy*(3628800*S_xxy - 2721600*S_yyy) + &
      M_xxxz*(-453600*S_xxz + 1020600*S_yyz) + M_xyyy*(-3628800*S_xxy + &
      4233600*S_yyy) + (-M_xxxz - M_xyyz)*(-151200*S_xxz + 1096200* &
      S_yyz) + (-M_xxz - M_yyz)*(75600*S_xxxz + 1096200*S_xyyz)) + ( &
      320.0d0/143.0d0)*(-M_xxxyyy*y + M_xxxyz*S_yz - S_xy*(-M_xxyyy - &
      M_yyyyy) + S_xyz*(-M_xxyz - M_yyyz) + S_yz*(-M_xxxyz - M_xyyyz) - &
      y*(-M_xxxyyy - M_xyyyyy)) + (160.0d0/143.0d0)*(M_xxxyyz*z - &
      M_xyyyyz*z - M_yyyyz*S_xz + S_xz*(-M_xxyyz - M_yyyyz) + y*( &
      -M_xxxxxy - M_xxxyyy) + z*(-M_xxxyyz - M_xyyyyz)) + (1.0d0/ &
      270270.0d0)*(M_xx*(28350*S_xxxxx + 396900*S_xxxyy + 28350*S_xxxzz &
      - 907200*S_xyyyy + 28350*S_xyyzz) + M_xxy*(604800*S_xxxy - &
      2721600*S_xyyy) + M_xxz*(-75600*S_xxxz + 1020600*S_xyyz) + M_xyy* &
      (-75600*S_xxxx - 2268000*S_xxyy - 75600*S_xxzz + 1512000*S_yyyy - &
      75600*S_yyzz) + M_xyyz*(604800*S_xxz - 2116800*S_yyz) + M_yy*( &
      -75600*S_xxxxx - 151200*S_xxxyy - 75600*S_xxxzz + 1512000*S_xyyyy &
      - 75600*S_xyyzz) + (-M_xx - M_yy)*(47250*S_xxxxx - 245700*S_xxxyy &
      + 47250*S_xxxzz - 604800*S_xyyyy + 47250*S_xyyzz) + (-M_xxx - &
      M_xyy)*(122850*S_xxxx + 170100*S_xxyy + 47250*S_xxzz - 604800* &
      S_yyyy + 47250*S_yyzz) + (-M_xxy - M_yyy)*(-604800*S_xxxy - &
      1512000*S_xyyy))
    S_xyyyyyz  = (15.0d0/143.0d0)*h**2*x*y*z - 10.0d0/13.0d0*h*x*y**3*z + x*y**5*z
    Ms_xyyyyyz = M_0*S_xyyyyyz + (128.0d0/143.0d0)*M_xyyyyyz + (1200.0d0/143.0d0)*M_xyyz* &
      S_yyy + (560.0d0/143.0d0)*M_yyy*S_xyyz + (30.0d0/143.0d0)*( &
      -M_xxxyyyz + y*(-M_xxxxxz - M_xxxyyz)) - 80.0d0/143.0d0*(M_xxxyyy &
      *z + x*(-M_xxyyyz - M_yyyyyz)) + (270.0d0/143.0d0)*(S_xyz*( &
      -M_xxxx - M_xxyy) + S_xz*(-M_xxxxy - M_xxyyy)) + (48.0d0/143.0d0) &
      *(M_xyyyyy*z + M_yyyyy*S_xz + M_yyyyyz*x) + (1.0d0/135135.0d0)*( &
      M_xy*(-14175*S_xxxxz - 538650*S_xxyyz - 14175*S_xxzzz + 453600* &
      S_yyyyz - 14175*S_yyzzz) + M_xyz*(-184275*S_xxxx - 255150*S_xxyy &
      - 70875*S_xxzz + 907200*S_yyyy - 70875*S_yyzz) + M_xz*(-184275* &
      S_xxxxy - 255150*S_xxyyy - 70875*S_xxyzz + 272160*S_yyyyy - 70875 &
      *S_yyyzz) + M_yz*(-70875*S_xxxxx + 368550*S_xxxyy - 70875*S_xxxzz &
      + 907200*S_xyyyy - 70875*S_xyyzz)) + (90.0d0/143.0d0)*(S_xy*( &
      -M_xxxxz - M_xxyyz) + S_yz*(-M_xxxxx - M_xxxyy) + x*(-M_xxxxyz - &
      M_xxyyyz) + z*(-M_xxxxxy - M_xxxyyy)) + (720.0d0/143.0d0)*( &
      -M_xxyy*S_xyz - M_xxyyz*S_xy + M_xyyyz*S_yy + M_yy*S_xyyyz - &
      S_xyz*(-M_xxyy - M_yyyy) - S_yz*(-M_xxxyy - M_xyyyy)) + (75.0d0/ &
      143.0d0)*(M_xxxx*S_xyz + M_xxxxy*S_xz + M_xxxxyz*x + M_xxxxz*S_xy &
      + S_xyz*(-M_xxzz - M_yyzz) + S_xz*(-M_xxyzz - M_yyyzz) + S_yz*( &
      -M_xxxzz - M_xyyzz) + z*(-M_xxxyzz - M_xyyyzz)) + (15.0d0/143.0d0 &
      )*(M_xxxxx*S_yz + M_xxxxxy*z - M_xxxxxyz + M_xxxxxz*y - M_xxxyzzz &
      - M_xyyyzzz + S_xy*(-M_xxzzz - M_yyzzz) + x*(-M_xxyzzz - M_yyyzzz &
      ) + y*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/270270.0d0)*(M_xx*(113400* &
      S_xxxyz - 623700*S_xyyyz) + M_xxy*(113400*S_xxxz - 1530900*S_xyyz &
      ) + M_xxyz*(-226800*S_xxx - 1871100*S_xyy) + M_xxz*(-226800* &
      S_xxxy - 963900*S_xyyy) + M_xyy*(-907200*S_xxyz + 1360800*S_yyyz &
      ) + M_yyz*(907200*S_xxxy + 2268000*S_xyyy) + (-M_xx - M_yy)*( &
      -113400*S_xxxyz - 737100*S_xyyyz) + (-M_xxx - M_xyy)*(226800* &
      S_xxyz - 737100*S_yyyz) + (-M_xxxy - M_xyyy)*(226800*S_xxz - &
      1644300*S_yyz) + (-M_xxy - M_yyy)*(-113400*S_xxxz - 1644300* &
      S_xyyz)) + (1.0d0/810810.0d0)*(M_xxx*(680400*S_xxyz - 623700* &
      S_yyyz) + M_xxxy*(680400*S_xxz - 1530900*S_yyz) + M_xxxyz*(340200 &
      *S_xx - 1871100*S_yy) + M_xxxz*(340200*S_xxy - 963900*S_yyy) + &
      M_xyyy*(-907200*S_xxz + 3175200*S_yyz) + M_yyyz*(907200*S_xxx + &
      4082400*S_xyy) + (-M_xxxyz - M_xyyyz)*(-340200*S_xx - 2211300* &
      S_yy) + (-M_xxxz - M_xyyz)*(-340200*S_xxy - 1304100*S_yyy) + ( &
      -M_xxyz - M_yyyz)*(-680400*S_xxx - 2211300*S_xyy) + (-M_xxz - &
      M_yyz)*(-680400*S_xxxy - 1304100*S_xyyy)) + (240.0d0/143.0d0)*( &
      -M_xxxyy*S_yz - M_xxxyyz*y - M_xxyyy*S_xz - M_xxyyyz*x + M_xyyyy* &
      S_yz + M_xyyyyz*y + M_yyyy*S_xyz + M_yyyyz*S_xy - S_xy*(-M_xxyyz &
      - M_yyyyz) - S_xz*(-M_xxyyy - M_yyyyy) - y*(-M_xxxyyz - M_xyyyyz &
      ) - z*(-M_xxxyyy - M_xyyyyy))
    S_yyyyyyy  = -35.0d0/429.0d0*h**3*y + (105.0d0/143.0d0)*h**2*y**3 - 21.0d0/13.0d0*h*y &
      **5 + y**7
    Ms_yyyyyyy = M_0*S_yyyyyyy + (70.0d0/429.0d0)*M_xxxxxxy + (1680.0d0/143.0d0)*M_xyyz* &
      S_xyz + (1400.0d0/429.0d0)*M_yyyy*S_yyy + (168.0d0/143.0d0)* &
      M_yyyyy*S_yy + (112.0d0/429.0d0)*M_yyyyyy*y + (184.0d0/429.0d0)* &
      M_yyyyyyy + (630.0d0/143.0d0)*S_yy*(-M_xxxxy - M_xxyyy) + ( &
      350.0d0/143.0d0)*S_yyy*(-M_xxxx - M_xxyy) + (420.0d0/143.0d0)*y*( &
      -M_xxxxyy - M_xxyyyy) + (210.0d0/143.0d0)*(M_xxxxyy*y + y*( &
      -M_xxyyzz - M_yyyyzz)) + (1.0d0/540540.0d0)*(M_xxyy*(3175200* &
      S_xxy - 3704400*S_yyy) + (-M_xxyy - M_yyyy)*(-3175200*S_xxy - &
      6879600*S_yyy)) + (1.0d0/1621620.0d0)*(M_xxyyy*(3175200*S_xx - &
      7938000*S_yy) + (-M_xxyyy - M_yyyyy)*(-3175200*S_xx - 11113200* &
      S_yy)) + (1.0d0/135135.0d0)*(M_xy*(66150*S_xxxxx + 132300*S_xxxyy &
      + 66150*S_xxxzz - 1323000*S_xyyyy + 66150*S_xyyzz) + M_yz*(66150* &
      S_xxxxz + 132300*S_xxyyz + 66150*S_xxzzz - 1323000*S_yyyyz + &
      66150*S_yyzzz)) - 1400.0d0/143.0d0*(M_xyyy*S_xyy + M_yyyz*S_yyz) &
      - 112.0d0/143.0d0*(M_xyyyyy*x + M_yyyyyz*z) + (1960.0d0/143.0d0)* &
      (-M_xyy*S_xyyy + M_xyz*S_xyyz - M_yyz*S_yyyz) + (560.0d0/143.0d0) &
      *(-M_xyyyy*S_xy + M_xyyyz*S_xz - M_yyyyz*S_yz) + (1.0d0/ &
      3243240.0d0)*(M_xxxx*(-3175200*S_xxy + 2381400*S_yyy) + M_xxxxy*( &
      -3175200*S_xx + 5556600*S_yy) + (-M_xxyzz - M_yyyzz)*(3175200* &
      S_xx + 8731800*S_yy) + (-M_xxzz - M_yyzz)*(3175200*S_xxy + &
      5556600*S_yyy)) + (35.0d0/429.0d0)*(-M_xxxxxx*y + M_xxyzzzz + &
      M_yyyzzzz - y*(-M_xxzzzz - M_yyzzzz)) + (35.0d0/143.0d0)*( &
      -M_xxxxyyy + M_xxxxyzz - M_xxyyyzz - y*(-M_xxxxxx - M_xxxxyy) - y &
      *(-M_xxxxzz - M_xxyyzz)) - 140.0d0/143.0d0*(M_xxyyyyy + S_xy*( &
      -M_xxxxx - M_xxxyy) + S_yz*(-M_xxxxz - M_xxyyz) + x*(-M_xxxxxy - &
      M_xxxyyy) + z*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/810810.0d0)*(M_xxx &
      *(-529200*S_xxxy + 2381400*S_xyyy) + M_xxxy*(-529200*S_xxx + &
      5556600*S_xyy) + M_yyy*(-396900*S_xxxx - 793800*S_xxyy - 396900* &
      S_xxzz + 4233600*S_yyyy - 396900*S_yyzz) + (-M_xxyz - M_yyyz)*( &
      529200*S_xxz + 6085800*S_yyz) + (-M_xxz - M_yyz)*(529200*S_xxyz + &
      2910600*S_yyyz)) + (840.0d0/143.0d0)*(M_xxxyy*S_xy + M_xxyyz*S_yz &
      + M_xz*S_xyyyz + S_xy*(-M_xxxyy - M_xyyyy) + S_yz*(-M_xxyyz - &
      M_yyyyz)) + (1.0d0/270270.0d0)*(M_xx*(66150*S_xxxxy + 926100* &
      S_xxyyy + 66150*S_xxyzz - 370440*S_yyyyy + 66150*S_yyyzz) + M_xxy &
      *(66150*S_xxxx + 1984500*S_xxyy + 66150*S_xxzz - 1323000*S_yyyy + &
      66150*S_yyzz) + M_xxyz*(-529200*S_xxz + 1852200*S_yyz) + M_xxz*( &
      -529200*S_xxyz + 793800*S_yyyz) + M_yy*(-396900*S_xxxxy - 793800* &
      S_xxyyy - 396900*S_xxyzz + 1270080*S_yyyyy - 396900*S_yyyzz) + ( &
      -M_xx - M_yy)*(330750*S_xxxxy - 132300*S_xxyyy + 330750*S_xxyzz - &
      899640*S_yyyyy + 330750*S_yyyzz) + (-M_xxx - M_xyy)*(529200* &
      S_xxxy + 1323000*S_xyyy) + (-M_xxxy - M_xyyy)*(529200*S_xxx + &
      2381400*S_xyy) + (-M_xxy - M_yyy)*(330750*S_xxxx - 1190700*S_xxyy &
      + 330750*S_xxzz - 2910600*S_yyyy + 330750*S_yyzz)) - 70.0d0/ &
      143.0d0*(M_xxxxx*S_xy + M_xxxxxy*x + M_xxxxyz*z + M_xxxxz*S_yz + &
      M_yyyyyzz + S_xy*(-M_xxxzz - M_xyyzz) + S_yz*(-M_xxzzz - M_yyzzz &
      ) + x*(-M_xxxyzz - M_xyyyzz) + z*(-M_xxyzzz - M_yyyzzz)) + ( &
      280.0d0/143.0d0)*(M_xxxyyy*x - M_xxxyz*S_xz - M_xxxz*S_xyz - &
      M_xxyyyy*y + M_xxyyyz*z - S_xyz*(-M_xxxz - M_xyyz) - S_xz*( &
      -M_xxxyz - M_xyyyz) + x*(-M_xxxyyy - M_xyyyyy) - y*(-M_xxyyyy - &
      M_yyyyyy) + z*(-M_xxyyyz - M_yyyyyz))
    S_yyyyyyz  = -5.0d0/429.0d0*h**3*z + (45.0d0/143.0d0)*h**2*y**2*z - 15.0d0/13.0d0*h*y &
      **4*z + y**6*z
    Ms_yyyyyyz = M_0*S_yyyyyyz + (10.0d0/429.0d0)*M_xxxxxxz + (5.0d0/143.0d0)*M_xxxxzzz - &
      720.0d0/143.0d0*M_xxyyz*S_yy - 800.0d0/143.0d0*M_xxyz*S_yyy - &
      1120.0d0/143.0d0*M_xyy*S_xyyz + (2240.0d0/429.0d0)*M_yyy*S_yyyz + &
      (64.0d0/429.0d0)*M_yyyyyy*z + (304.0d0/429.0d0)*M_yyyyyyz - &
      60.0d0/143.0d0*S_xz*(-M_xxxxx - M_xxxyy) - 50.0d0/143.0d0*S_xz*( &
      -M_xxxzz - M_xyyzz) - 20.0d0/143.0d0*x*(-M_xxxxxz - M_xxxyyz) - &
      15.0d0/143.0d0*z*(-M_xxxxxx - M_xxxxyy) - 25.0d0/143.0d0*z*( &
      -M_xxxxzz - M_xxyyzz) + (200.0d0/143.0d0)*z*(-M_xxyyzz - M_yyyyzz &
      ) - 35.0d0/429.0d0*z*(-M_xxzzzz - M_yyzzzz) - 35.0d0/143.0d0*( &
      M_xxxxyyz + M_xxyyzzz) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz &
      )*(3402000*S_xx + 8505000*S_yy) + (40.0d0/143.0d0)*(M_xxxxyy*z - &
      M_yyyyzzz) - 640.0d0/143.0d0*(M_xyyy*S_xyz + M_xyyyz*S_xy) + ( &
      400.0d0/143.0d0)*(M_yyyy*S_yyz + S_yz*(-M_xxyzz - M_yyyzz)) + ( &
      128.0d0/143.0d0)*(M_yyyyy*S_yz + M_yyyyyz*y) + (480.0d0/143.0d0)* &
      (S_xz*(-M_xxxyy - M_xyyyy) + S_yz*(-M_xxxxy - M_xxyyy)) + ( &
      240.0d0/143.0d0)*(z*(-M_xxxxyy - M_xxyyyy) - z*(-M_xxyyyy - &
      M_yyyyyy)) + (1.0d0/1621620.0d0)*((-M_xxxxz - M_xxyyz)*(226800* &
      S_xx + 1474200*S_yy) + (-M_xxyyz - M_yyyyz)*(-3628800*S_xx - &
      9979200*S_yy)) - 10.0d0/143.0d0*(M_xxxxx*S_xz + M_xxxxxz*x + x*( &
      -M_xxxzzz - M_xyyzzz)) + (5.0d0/429.0d0)*(-M_xxxxxx*z + M_xxzzzzz &
      + M_yyzzzzz) + (1.0d0/540540.0d0)*(M_xxyy*(604800*S_xxz - 2116800 &
      *S_yyz) + (-M_xxxx - M_xxyy)*(-151200*S_xxz + 1096200*S_yyz) + ( &
      -M_xxyy - M_yyyy)*(-604800*S_xxz - 6955200*S_yyz)) + (960.0d0/ &
      143.0d0)*(-M_xy*S_xyyyz + S_xyz*(-M_xxxy - M_xyyy) - S_yz*( &
      -M_xxyyy - M_yyyyy)) + (1.0d0/135135.0d0)*(M_xyz*(-604800*S_xxxy &
      - 1512000*S_xyyy) + M_xz*(47250*S_xxxxx - 245700*S_xxxyy + 47250* &
      S_xxxzz - 604800*S_xyyyy + 47250*S_xyyzz) + M_yz*(-378000*S_xxxxy &
      + 151200*S_xxyyy - 378000*S_xxyzz + 1028160*S_yyyyy - 378000* &
      S_yyyzz)) + (1.0d0/3243240.0d0)*(M_xxxx*(-453600*S_xxz + 1020600* &
      S_yyz) + M_xxxxz*(-226800*S_xx + 1247400*S_yy) + M_yyyyz*(3628800 &
      *S_xx + 12700800*S_yy) + (-M_xxzz - M_yyzz)*(756000*S_xxz + &
      5859000*S_yyz)) + (80.0d0/143.0d0)*(M_xxxxy*S_yz + M_xxxxyz*y - &
      M_xxyyyy*z - M_xxyyyyz + y*(-M_xxyzzz - M_yyyzzz)) + (1.0d0/ &
      810810.0d0)*(M_xxx*(-75600*S_xxxz + 1020600*S_xyyz) + M_xxxz*( &
      151200*S_xxx + 1247400*S_xyy) + M_yyyz*(3628800*S_xxy + 7862400* &
      S_yyy) + (-M_xxxz - M_xyyz)*(453600*S_xxx + 1474200*S_xyy) + ( &
      -M_xxyz - M_yyyz)*(-3628800*S_xxy - 6350400*S_yyy) + (-M_xxz - &
      M_yyz)*(255150*S_xxxx - 1530900*S_xxyy + 330750*S_xxzz - 2721600* &
      S_yyyy + 330750*S_yyzz)) + (320.0d0/143.0d0)*(M_xxxy*S_xyz + &
      M_xxxyz*S_xy - M_xxyyy*S_yz - M_xxyyyz*y + S_xy*(-M_xxxyz - &
      M_xyyyz) - y*(-M_xxyyyz - M_yyyyyz)) + (160.0d0/143.0d0)*(M_xxxyy &
      *S_xz + M_xxxyyz*x - M_xyyyy*S_xz - M_xyyyyz*x + x*(-M_xxxyyz - &
      M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/270270.0d0)*(M_xx* &
      (9450*S_xxxxz + 359100*S_xxyyz + 9450*S_xxzzz - 302400*S_yyyyz + &
      9450*S_yyzzz) + M_xxy*(604800*S_xxyz - 907200*S_yyyz) + M_xxz*( &
      122850*S_xxxx + 170100*S_xxyy + 47250*S_xxzz - 604800*S_yyyy + &
      47250*S_yyzz) + M_xyyz*(-604800*S_xxx - 2721600*S_xyy) + M_yy*( &
      -75600*S_xxxxz - 151200*S_xxyyz - 75600*S_xxzzz + 1512000*S_yyyyz &
      - 75600*S_yyzzz) + M_yyz*(-378000*S_xxxx + 1360800*S_xxyy - &
      378000*S_xxzz + 3326400*S_yyyy - 378000*S_yyzz) + (-M_xx - M_yy)* &
      (66150*S_xxxxz - 207900*S_xxyyz + 66150*S_xxzzz - 1209600*S_yyyyz &
      + 66150*S_yyzzz) + (-M_xxx - M_xyy)*(75600*S_xxxz + 1096200* &
      S_xyyz) + (-M_xxy - M_yyy)*(-604800*S_xxyz - 3326400*S_yyyz))
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  x                   
#undef  z                   
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
    
! OPS  1723*ADD + 204*DIV + 2737*MUL + 144*NEG + 674*POW + 138*SUB = 5620  (7071 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, D_x, D_y,&
                D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
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
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy,&
                D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy,&
                D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz,&
                D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz,&
                D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy,&
                D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz,&
                D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz,&
                D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx,&
                D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz,&
                D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy,&
                D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy,&
                D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz,&
                D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz,&
                D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz,&
                D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz,&
                D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz,&
                D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz,&
                M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz,&
                M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz,&
                M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz,&
                M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz,&
                M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz,&
                M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz,&
                M_zzzzzzz
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
#define L_yy                 L(6)
#define M_xxx                M(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define L_xxx                L(8)
#define M_xxz                M(8)
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
#define L_xxxxyy             L(38)
#define M_xxxyyy             M(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define L_xxxyyy             L(40)
#define M_xxyyyy             M(40)
#define M_xxyyyz             M(41)
#define L_xxxyyz             L(41)
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
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    h          = x**2 + y**2 + z**2
    u2         = 1.0/h
    u          = sqrt(u2)
    D_x        = -u**3*x
    D_y        = -u**3*y
    D_z        = -u**3*z
    D_xx       = -h*u**5 + 3*u**5*x**2
    D_xy       = 3*u**5*x*y
    D_xz       = 3*u**5*x*z
    D_yy       = -h*u**5 + 3*u**5*y**2
    D_yz       = 3*u**5*y*z
    D_zz       = -(D_xx + D_yy)
    D_xxx      = 9*h*u**7*x - 15*u**7*x**3
    D_xxy      = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz      = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy      = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz      = -15*u**7*x*y*z
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = 9*h*u**7*y - 15*u**7*y**3
    D_yyz      = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    D_xxxx     = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy     = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz     = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy     = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz     = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz     = -(D_xxxx + D_xxyy)
    D_xyyy     = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz     = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz     = -(D_xxxy + D_xyyy)
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz     = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    D_xxxxx    = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy    = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz    = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy    = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz    = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    D_xxyyy    = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz    = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    D_xyyyy    = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz    = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    D_yyyyy    = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz    = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    D_xxxxxx   = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    D_xxxxxy   = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    D_xxxxxz   = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    D_xxxxyy   = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    D_xxxxyz   = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy   = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    D_xxxyyz   = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy   = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    D_xxyyyz   = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy   = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    D_xyyyyz   = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy   = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    D_yyyyyz   = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    D_xxxxxxx  = 11025*h**3*u**15*x - 99225*h**2*u**15*x**3 + 218295*h*u**15*x**5 - &
      135135*u**15*x**7
    L_xxxxxxx  = D_xxxxxxx*M_0
    D_xxxxxxy  = 1575*h**3*u**15*y - 42525*h**2*u**15*x**2*y + 155925*h*u**15*x**4*y - &
      135135*u**15*x**6*y
    L_xxxxxxy  = D_xxxxxxy*M_0
    D_xxxxxxz  = 1575*h**3*u**15*z - 42525*h**2*u**15*x**2*z + 155925*h*u**15*x**4*z - &
      135135*u**15*x**6*z
    L_xxxxxxz  = D_xxxxxxz*M_0
    D_xxxxxyy  = 1575*h**3*u**15*x - 9450*h**2*u**15*x**3 - 14175*h**2*u**15*x*y**2 + &
      10395*h*u**15*x**5 + 103950*h*u**15*x**3*y**2 - 135135*u**15*x**5 &
      *y**2
    L_xxxxxyy  = D_xxxxxyy*M_0
    D_xxxxxyz  = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x**3*y*z - 135135*u**15*x**5*y* &
      z
    L_xxxxxyz  = D_xxxxxyz*M_0
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy  = 945*h**3*u**15*y - 17010*h**2*u**15*x**2*y - 2835*h**2*u**15*y**3 + &
      31185*h*u**15*x**4*y + 62370*h*u**15*x**2*y**3 - 135135*u**15*x** &
      4*y**3
    L_xxxxyyy  = D_xxxxyyy*M_0
    D_xxxxyyz  = 315*h**3*u**15*z - 5670*h**2*u**15*x**2*z - 2835*h**2*u**15*y**2*z + &
      10395*h*u**15*x**4*z + 62370*h*u**15*x**2*y**2*z - 135135*u**15*x &
      **4*y**2*z
    L_xxxxyyz  = D_xxxxyyz*M_0
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy  = 945*h**3*u**15*x - 2835*h**2*u**15*x**3 - 17010*h**2*u**15*x*y**2 + &
      62370*h*u**15*x**3*y**2 + 31185*h*u**15*x*y**4 - 135135*u**15*x** &
      3*y**4
    L_xxxyyyy  = D_xxxyyyy*M_0
    D_xxxyyyz  = -8505*h**2*u**15*x*y*z - 135135*u**15*x**3*y**3*z + 31185*(h*u**15*x**3* &
      y*z + h*u**15*x*y**3*z)
    L_xxxyyyz  = D_xxxyyyz*M_0
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy  = 1575*h**3*u**15*y - 14175*h**2*u**15*x**2*y - 9450*h**2*u**15*y**3 + &
      103950*h*u**15*x**2*y**3 + 10395*h*u**15*y**5 - 135135*u**15*x**2 &
      *y**5
    L_xxyyyyy  = D_xxyyyyy*M_0
    D_xxyyyyz  = 315*h**3*u**15*z - 2835*h**2*u**15*x**2*z - 5670*h**2*u**15*y**2*z + &
      62370*h*u**15*x**2*y**2*z + 10395*h*u**15*y**4*z - 135135*u**15*x &
      **2*y**4*z
    L_xxyyyyz  = D_xxyyyyz*M_0
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy  = 1575*h**3*u**15*x - 42525*h**2*u**15*x*y**2 + 155925*h*u**15*x*y**4 - &
      135135*u**15*x*y**6
    L_xyyyyyy  = D_xyyyyyy*M_0
    D_xyyyyyz  = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x*y**3*z - 135135*u**15*x*y**5* &
      z
    L_xyyyyyz  = D_xyyyyyz*M_0
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = 11025*h**3*u**15*y - 99225*h**2*u**15*y**3 + 218295*h*u**15*y**5 - &
      135135*u**15*y**7
    L_yyyyyyy  = D_yyyyyyy*M_0
    D_yyyyyyz  = 1575*h**3*u**15*z - 42525*h**2*u**15*y**2*z + 155925*h*u**15*y**4*z - &
      135135*u**15*y**6*z
    L_yyyyyyz  = D_yyyyyyz*M_0
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    D_xxxxxxxx = 11025*h**4*u**17 - 396900*h**3*u**17*x**2 + 2182950*h**2*u**17*x**4 - &
      3783780*h*u**17*x**6 + 2027025*u**17*x**8
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = -99225*h**3*u**17*x*y + 1091475*h**2*u**17*x**3*y - 2837835*h*u**17*x**5 &
      *y + 2027025*u**17*x**7*y
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = -99225*h**3*u**17*x*z + 1091475*h**2*u**17*x**3*z - 2837835*h*u**17*x**5 &
      *z + 2027025*u**17*x**7*z
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = 1575*h**4*u**17 - 42525*h**3*u**17*x**2 - 14175*h**3*u**17*y**2 + 155925 &
      *h**2*u**17*x**4 + 467775*h**2*u**17*x**2*y**2 - 135135*h*u**17*x &
      **6 + 2027025*(-h*u**17*x**4*y**2 + u**17*x**6*y**2)
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = -14175*h**3*u**17*y*z + 467775*h**2*u**17*x**2*y*z + 2027025*(-h*u**17*x &
      **4*y*z + u**17*x**6*y*z)
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxxy*M_xy + D_xxxxxxxz*M_xz + D_xxxxxxyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxxx*M_xx + D_xxxxxxyy*M_yy + D_xxxxxxzz*M_zz &
      )
    D_xxxxxyyy = -42525*h**3*u**17*x*y + 311850*h**2*u**17*x**3*y + 155925*h**2*u**17*x*y &
      **3 - 405405*h*u**17*x**5*y - 1351350*h*u**17*x**3*y**3 + 2027025 &
      *u**17*x**5*y**3
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = -14175*h**3*u**17*x*z + 103950*h**2*u**17*x**3*z + 155925*h**2*u**17*x*y &
      **2*z - 135135*h*u**17*x**5*z - 1351350*h*u**17*x**3*y**2*z + &
      2027025*u**17*x**5*y**2*z
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    L_xxxxxy   = D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + D_xxxxxy*M_0 + D_xxxxxyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxxy*M_xx + D_xxxxxyyy*M_yy + D_xxxxxyzz*M_zz &
      )
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz*M_xz + &
      D_xxxxxyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxxx*M_xxx + D_xxxxxyyy* &
      M_yyy + D_xxxxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxx*M_xx + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxz*M_xxz + D_xxxxxxyy*M_xyy + &
      D_xxxxxxzz*M_xzz + D_xxxxxyy*M_yy + D_xxxxxyyz*M_yyz + D_xxxxxyzz &
      *M_yzz + D_xxxxxzz*M_zz)
    L_xxxxxz   = D_xxxxxxyz*M_xy + D_xxxxxxzz*M_xz + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxxxz*M_xx + D_xxxxxyyz*M_yy + D_xxxxxzzz*M_zz &
      )
    D_xxxxyyyy = 945*h**4*u**17 + 374220*h**2*u**17*x**2*y**2 + 2027025*u**17*x**4*y**4 + &
      31185*(h**2*u**17*x**4 + h**2*u**17*y**4) - 17010*(h**3*u**17*x** &
      2 + h**3*u**17*y**2) - 810810*(h*u**17*x**4*y**2 + h*u**17*x**2*y &
      **4)
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = -8505*h**3*u**17*y*z + 187110*h**2*u**17*x**2*y*z + 31185*h**2*u**17*y** &
      3*z - 405405*h*u**17*x**4*y*z - 810810*h*u**17*x**2*y**3*z + &
      2027025*u**17*x**4*y**3*z
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    L_xxxxyy   = D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + D_xxxxyy*M_0 + D_xxxxyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxyy*M_xx + D_xxxxyyyy*M_yy + D_xxxxyyzz*M_zz &
      )
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    L_xxxxy    = D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxxy*M_xxx + D_xxxxyyyy* &
      M_yyy + D_xxxxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxy*M_xx + &
      D_xxxxxxyy*M_xxy + D_xxxxxxyz*M_xxz + D_xxxxxyyy*M_xyy + &
      D_xxxxxyzz*M_xzz + D_xxxxyyy*M_yy + D_xxxxyyyz*M_yyz + D_xxxxyyzz &
      *M_yzz + D_xxxxyzz*M_zz)
    L_xxxxyz   = D_xxxxxyyz*M_xy + D_xxxxxyzz*M_xz + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxxyz*M_xx + D_xxxxyyyz*M_yy + D_xxxxyzzz*M_zz &
      )
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    L_xxxx     = D_xxxx*M_0 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxxx*M_xxxx + D_xxxxyyyy*M_yyyy + &
      D_xxxxzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxxyy*M_xxyy + &
      D_xxxxxxzz*M_xxzz + D_xxxxyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxxx &
      *M_xxx + D_xxxxxxxy*M_xxxy + D_xxxxxxxz*M_xxxz + D_xxxxxyyy* &
      M_xyyy + D_xxxxxzzz*M_xzzz + D_xxxxyyy*M_yyy + D_xxxxyyyz*M_yyyz &
      + D_xxxxyzzz*M_yzzz + D_xxxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxx* &
      M_xx + D_xxxxxxy*M_xxy + D_xxxxxxyz*M_xxyz + D_xxxxxxz*M_xxz + &
      D_xxxxxyy*M_xyy + D_xxxxxyyz*M_xyyz + D_xxxxxyzz*M_xyzz + &
      D_xxxxxzz*M_xzz + D_xxxxyy*M_yy + D_xxxxyyz*M_yyz + D_xxxxyzz* &
      M_yzz + D_xxxxzz*M_zz)
    L_xxxxz    = D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + (1.0d0/6.0d0)*(D_xxxxxxxz*M_xxx + D_xxxxyyyz*M_yyy &
      + D_xxxxzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxyz*M_xxy + D_xxxxxxz &
      *M_xx + D_xxxxxxzz*M_xxz + D_xxxxxyyz*M_xyy + D_xxxxxzzz*M_xzz + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyzzz*M_yzz + D_xxxxzzz* &
      M_zz)
    D_xxxyyyyy = -42525*h**3*u**17*x*y + 155925*h**2*u**17*x**3*y + 311850*h**2*u**17*x*y &
      **3 - 1351350*h*u**17*x**3*y**3 - 405405*h*u**17*x*y**5 + 2027025 &
      *u**17*x**3*y**5
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = -8505*h**3*u**17*x*z + 31185*h**2*u**17*x**3*z + 187110*h**2*u**17*x*y** &
      2*z - 810810*h*u**17*x**3*y**2*z - 405405*h*u**17*x*y**4*z + &
      2027025*u**17*x**3*y**4*z
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    L_xxxyyy   = D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + D_xxxyyy*M_0 + D_xxxyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxyyy*M_xx + D_xxxyyyyy*M_yy + D_xxxyyyzz*M_zz &
      )
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    L_xxxyy    = D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxyy*M_xxx + D_xxxyyyyy* &
      M_yyy + D_xxxyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxyy*M_xx + &
      D_xxxxxyyy*M_xxy + D_xxxxxyyz*M_xxz + D_xxxxyyyy*M_xyy + &
      D_xxxxyyzz*M_xzz + D_xxxyyyy*M_yy + D_xxxyyyyz*M_yyz + D_xxxyyyzz &
      *M_yzz + D_xxxyyzz*M_zz)
    L_xxxyyz   = D_xxxxyyyz*M_xy + D_xxxxyyzz*M_xz + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxyyz*M_xx + D_xxxyyyyz*M_yy + D_xxxyyzzz*M_zz &
      )
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    L_xxxy     = D_xxxxyy*M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxxy*M_xxxx + D_xxxyyyyy*M_yyyy + &
      D_xxxyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxyyy*M_xxyy + &
      D_xxxxxyzz*M_xxzz + D_xxxyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxxy &
      *M_xxx + D_xxxxxxyy*M_xxxy + D_xxxxxxyz*M_xxxz + D_xxxxyyyy* &
      M_xyyy + D_xxxxyzzz*M_xzzz + D_xxxyyyy*M_yyy + D_xxxyyyyz*M_yyyz &
      + D_xxxyyzzz*M_yzzz + D_xxxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxy* &
      M_xx + D_xxxxxyy*M_xxy + D_xxxxxyyz*M_xxyz + D_xxxxxyz*M_xxz + &
      D_xxxxyyy*M_xyy + D_xxxxyyyz*M_xyyz + D_xxxxyyzz*M_xyzz + &
      D_xxxxyzz*M_xzz + D_xxxyyy*M_yy + D_xxxyyyz*M_yyz + D_xxxyyzz* &
      M_yzz + D_xxxyzz*M_zz)
    L_xxxyz    = D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + (1.0d0/6.0d0)*(D_xxxxxxyz*M_xxx + D_xxxyyyyz*M_yyy &
      + D_xxxyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxyyz*M_xxy + D_xxxxxyz &
      *M_xx + D_xxxxxyzz*M_xxz + D_xxxxyyyz*M_xyy + D_xxxxyzzz*M_xzz + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyzzz*M_yzz + D_xxxyzzz* &
      M_zz)
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    L_xxx      = D_xxx*M_0 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxxx*M_xxxxx + D_xxxyyyyy*M_yyyyy + &
      D_xxxzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxxyy*M_xxxyy + &
      D_xxxxxxzz*M_xxxzz + D_xxxxxyyy*M_xxyyy + D_xxxxxzzz*M_xxzzz + &
      D_xxxyyyzz*M_yyyzz + D_xxxyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxxyy*M_xxyy + D_xxxxxyyz*M_xxyyz + D_xxxxxyzz*M_xxyzz + &
      D_xxxxxzz*M_xxzz + D_xxxxyyzz*M_xyyzz + D_xxxyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxx*M_xxxx + D_xxxxxxxy*M_xxxxy + D_xxxxxxxz &
      *M_xxxxz + D_xxxxyyyy*M_xyyyy + D_xxxxzzzz*M_xzzzz + D_xxxyyyy* &
      M_yyyy + D_xxxyyyyz*M_yyyyz + D_xxxyzzzz*M_yzzzz + D_xxxzzzz* &
      M_zzzz) + (1.0d0/2.0d0)*(D_xxxxx*M_xx + D_xxxxxy*M_xxy + &
      D_xxxxxyz*M_xxyz + D_xxxxxz*M_xxz + D_xxxxyy*M_xyy + D_xxxxyyz* &
      M_xyyz + D_xxxxyzz*M_xyzz + D_xxxxzz*M_xzz + D_xxxyy*M_yy + &
      D_xxxyyz*M_yyz + D_xxxyzz*M_yzz + D_xxxzz*M_zz) + (1.0d0/6.0d0)*( &
      D_xxxxxx*M_xxx + D_xxxxxxy*M_xxxy + D_xxxxxxyz*M_xxxyz + &
      D_xxxxxxz*M_xxxz + D_xxxxyyy*M_xyyy + D_xxxxyyyz*M_xyyyz + &
      D_xxxxyzzz*M_xyzzz + D_xxxxzzz*M_xzzz + D_xxxyyy*M_yyy + &
      D_xxxyyyz*M_yyyz + D_xxxyzzz*M_yzzz + D_xxxzzz*M_zzz)
    L_xxxz     = D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxxxz*M_xxxx + D_xxxyyyyz*M_yyyy + &
      D_xxxzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxyyz*M_xxyy + &
      D_xxxxxzzz*M_xxzz + D_xxxyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxxxyz*M_xxxy + D_xxxxxxz*M_xxx + D_xxxxxxzz*M_xxxz + &
      D_xxxxyyyz*M_xyyy + D_xxxxzzzz*M_xzzz + D_xxxyyyz*M_yyy + &
      D_xxxyyyzz*M_yyyz + D_xxxyzzzz*M_yzzz + D_xxxzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz + D_xxxxxz*M_xx + &
      D_xxxxxzz*M_xxz + D_xxxxyyz*M_xyy + D_xxxxyyzz*M_xyyz + &
      D_xxxxyzzz*M_xyzz + D_xxxxzzz*M_xzz + D_xxxyyz*M_yy + D_xxxyyzz* &
      M_yyz + D_xxxyzzz*M_yzz + D_xxxzzz*M_zz)
    D_xxyyyyyy = 1575*h**4*u**17 - 14175*h**3*u**17*x**2 - 42525*h**3*u**17*y**2 + 467775 &
      *h**2*u**17*x**2*y**2 + 155925*h**2*u**17*y**4 - 135135*h*u**17*y &
      **6 + 2027025*(-h*u**17*x**2*y**4 + u**17*x**2*y**6)
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = -14175*h**3*u**17*y*z + 155925*h**2*u**17*x**2*y*z + 103950*h**2*u**17*y &
      **3*z - 1351350*h*u**17*x**2*y**3*z - 135135*h*u**17*y**5*z + &
      2027025*u**17*x**2*y**5*z
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    L_xxyyyy   = D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + D_xxyyyy*M_0 + D_xxyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxyyyy*M_xx + D_xxyyyyyy*M_yy + D_xxyyyyzz*M_zz &
      )
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    L_xxyyy    = D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxyyy*M_xxx + D_xxyyyyyy* &
      M_yyy + D_xxyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyyy*M_xx + &
      D_xxxxyyyy*M_xxy + D_xxxxyyyz*M_xxz + D_xxxyyyyy*M_xyy + &
      D_xxxyyyzz*M_xzz + D_xxyyyyy*M_yy + D_xxyyyyyz*M_yyz + D_xxyyyyzz &
      *M_yzz + D_xxyyyzz*M_zz)
    L_xxyyyz   = D_xxxyyyyz*M_xy + D_xxxyyyzz*M_xz + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxyyyz*M_xx + D_xxyyyyyz*M_yy + D_xxyyyzzz*M_zz &
      )
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    L_xxyy     = D_xxxyyy*M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxyy*M_xxxx + D_xxyyyyyy*M_yyyy + &
      D_xxyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyyyy*M_xxyy + &
      D_xxxxyyzz*M_xxzz + D_xxyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxyy &
      *M_xxx + D_xxxxxyyy*M_xxxy + D_xxxxxyyz*M_xxxz + D_xxxyyyyy* &
      M_xyyy + D_xxxyyzzz*M_xzzz + D_xxyyyyy*M_yyy + D_xxyyyyyz*M_yyyz &
      + D_xxyyyzzz*M_yzzz + D_xxyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyy* &
      M_xx + D_xxxxyyy*M_xxy + D_xxxxyyyz*M_xxyz + D_xxxxyyz*M_xxz + &
      D_xxxyyyy*M_xyy + D_xxxyyyyz*M_xyyz + D_xxxyyyzz*M_xyzz + &
      D_xxxyyzz*M_xzz + D_xxyyyy*M_yy + D_xxyyyyz*M_yyz + D_xxyyyzz* &
      M_yzz + D_xxyyzz*M_zz)
    L_xxyyz    = D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + (1.0d0/6.0d0)*(D_xxxxxyyz*M_xxx + D_xxyyyyyz*M_yyy &
      + D_xxyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyyyz*M_xxy + D_xxxxyyz &
      *M_xx + D_xxxxyyzz*M_xxz + D_xxxyyyyz*M_xyy + D_xxxyyzzz*M_xzz + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyzzz*M_yzz + D_xxyyzzz* &
      M_zz)
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    L_xxy      = D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxxy*M_xxxxx + D_xxyyyyyy*M_yyyyy + &
      D_xxyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxyyy*M_xxxyy + &
      D_xxxxxyzz*M_xxxzz + D_xxxxyyyy*M_xxyyy + D_xxxxyzzz*M_xxzzz + &
      D_xxyyyyzz*M_yyyzz + D_xxyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxyyy*M_xxyy + D_xxxxyyyz*M_xxyyz + D_xxxxyyzz*M_xxyzz + &
      D_xxxxyzz*M_xxzz + D_xxxyyyzz*M_xyyzz + D_xxyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + D_xxxxxxyz &
      *M_xxxxz + D_xxxyyyyy*M_xyyyy + D_xxxyzzzz*M_xzzzz + D_xxyyyyy* &
      M_yyyy + D_xxyyyyyz*M_yyyyz + D_xxyyzzzz*M_yzzzz + D_xxyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + &
      D_xxxxxyyz*M_xxxyz + D_xxxxxyz*M_xxxz + D_xxxyyyy*M_xyyy + &
      D_xxxyyyyz*M_xyyyz + D_xxxyyzzz*M_xyzzz + D_xxxyzzz*M_xzzz + &
      D_xxyyyy*M_yyy + D_xxyyyyz*M_yyyz + D_xxyyzzz*M_yzzz + D_xxyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyz &
      *M_xxyz + D_xxxxyz*M_xxz + D_xxxyyy*M_xyy + D_xxxyyyz*M_xyyz + &
      D_xxxyyzz*M_xyzz + D_xxxyzz*M_xzz + D_xxyyy*M_yy + D_xxyyyz*M_yyz &
      + D_xxyyzz*M_yzz + D_xxyzz*M_zz)
    L_xxyz     = D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxxyz*M_xxxx + D_xxyyyyyz*M_yyyy + &
      D_xxyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyyyz*M_xxyy + &
      D_xxxxyzzz*M_xxzz + D_xxyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxxyyz*M_xxxy + D_xxxxxyz*M_xxx + D_xxxxxyzz*M_xxxz + &
      D_xxxyyyyz*M_xyyy + D_xxxyzzzz*M_xzzz + D_xxyyyyz*M_yyy + &
      D_xxyyyyzz*M_yyyz + D_xxyyzzzz*M_yzzz + D_xxyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz + D_xxxxyz*M_xx + &
      D_xxxxyzz*M_xxz + D_xxxyyyz*M_xyy + D_xxxyyyzz*M_xyyz + &
      D_xxxyyzzz*M_xyzz + D_xxxyzzz*M_xzz + D_xxyyyz*M_yy + D_xxyyyzz* &
      M_yyz + D_xxyyzzz*M_yzz + D_xxyzzz*M_zz)
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    L_xx       = D_xx*M_0 + (1.0d0/8.0d0)*D_xxxxyyzz*M_xxyyzz + D_xxxy*M_xy + D_xxxyz* &
      M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxxx* &
      M_xxxxxx + D_xxyyyyyy*M_yyyyyy + D_xxzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxxyyy*M_xxxyyy + D_xxxxxzzz*M_xxxzzz + D_xxyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxxyy*M_xxxxyy + D_xxxxxxzz* &
      M_xxxxzz + D_xxxxyyyy*M_xxyyyy + D_xxxxzzzz*M_xxzzzz + D_xxyyyyzz &
      *M_yyyyzz + D_xxyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxxyy*M_xxyy &
      + D_xxxxyyz*M_xxyyz + D_xxxxyzz*M_xxyzz + D_xxxxzz*M_xxzz + &
      D_xxxyyzz*M_xyyzz + D_xxyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxxx &
      *M_xxxxx + D_xxxxxxxy*M_xxxxxy + D_xxxxxxxz*M_xxxxxz + D_xxxyyyyy &
      *M_xyyyyy + D_xxxzzzzz*M_xzzzzz + D_xxyyyyy*M_yyyyy + D_xxyyyyyz* &
      M_yyyyyz + D_xxyzzzzz*M_yzzzzz + D_xxzzzzz*M_zzzzz) + (1.0d0/ &
      2.0d0)*(D_xxxx*M_xx + D_xxxxy*M_xxy + D_xxxxyz*M_xxyz + D_xxxxz* &
      M_xxz + D_xxxyy*M_xyy + D_xxxyyz*M_xyyz + D_xxxyzz*M_xyzz + &
      D_xxxzz*M_xzz + D_xxyy*M_yy + D_xxyyz*M_yyz + D_xxyzz*M_yzz + &
      D_xxzz*M_zz) + (1.0d0/6.0d0)*(D_xxxxx*M_xxx + D_xxxxxy*M_xxxy + &
      D_xxxxxyz*M_xxxyz + D_xxxxxz*M_xxxz + D_xxxyyy*M_xyyy + D_xxxyyyz &
      *M_xyyyz + D_xxxyzzz*M_xyzzz + D_xxxzzz*M_xzzz + D_xxyyy*M_yyy + &
      D_xxyyyz*M_yyyz + D_xxyzzz*M_yzzz + D_xxzzz*M_zzz) + (1.0d0/ &
      24.0d0)*(D_xxxxxx*M_xxxx + D_xxxxxxy*M_xxxxy + D_xxxxxxyz* &
      M_xxxxyz + D_xxxxxxz*M_xxxxz + D_xxxyyyy*M_xyyyy + D_xxxyyyyz* &
      M_xyyyyz + D_xxxyzzzz*M_xyzzzz + D_xxxzzzz*M_xzzzz + D_xxyyyy* &
      M_yyyy + D_xxyyyyz*M_yyyyz + D_xxyzzzz*M_yzzzz + D_xxzzzz*M_zzzz &
      ) + (1.0d0/12.0d0)*(D_xxxxxyy*M_xxxyy + D_xxxxxyyz*M_xxxyyz + &
      D_xxxxxyzz*M_xxxyzz + D_xxxxxzz*M_xxxzz + D_xxxxyyy*M_xxyyy + &
      D_xxxxyyyz*M_xxyyyz + D_xxxxyzzz*M_xxyzzz + D_xxxxzzz*M_xxzzz + &
      D_xxxyyyzz*M_xyyyzz + D_xxxyyzzz*M_xyyzzz + D_xxyyyzz*M_yyyzz + &
      D_xxyyzzz*M_yyzzz)
    L_xxz      = D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxxxz*M_xxxxx + D_xxyyyyyz*M_yyyyy + &
      D_xxzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxyyz*M_xxxyy + &
      D_xxxxxzzz*M_xxxzz + D_xxxxyyyz*M_xxyyy + D_xxxxzzzz*M_xxzzz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxyyz*M_xxyy + D_xxxxyyzz*M_xxyyz + D_xxxxyzzz*M_xxyzz + &
      D_xxxxzzz*M_xxzz + D_xxxyyzzz*M_xyyzz + D_xxyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxyz*M_xxxxy + D_xxxxxxz*M_xxxx + D_xxxxxxzz &
      *M_xxxxz + D_xxxyyyyz*M_xyyyy + D_xxxzzzzz*M_xzzzz + D_xxyyyyz* &
      M_yyyy + D_xxyyyyzz*M_yyyyz + D_xxyzzzzz*M_yzzzz + D_xxzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxxyz*M_xxxy + D_xxxxxyzz*M_xxxyz + &
      D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + D_xxxyyyz*M_xyyy + D_xxxyyyzz &
      *M_xyyyz + D_xxxyzzzz*M_xyzzz + D_xxxzzzz*M_xzzz + D_xxyyyz*M_yyy &
      + D_xxyyyzz*M_yyyz + D_xxyzzzz*M_yzzz + D_xxzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxz*M_xx + &
      D_xxxxzz*M_xxz + D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyzzz* &
      M_xyzz + D_xxxzzz*M_xzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + &
      D_xxyzzz*M_yzz + D_xxzzz*M_zz)
    D_xyyyyyyy = -99225*h**3*u**17*x*y + 1091475*h**2*u**17*x*y**3 - 2837835*h*u**17*x*y &
      **5 + 2027025*u**17*x*y**7
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = -14175*h**3*u**17*x*z + 467775*h**2*u**17*x*y**2*z + 2027025*(-h*u**17*x &
      *y**4*z + u**17*x*y**6*z)
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    L_xyyyyy   = D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + D_xyyyyy*M_0 + D_xyyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxyyyyy*M_xx + D_xyyyyyyy*M_yy + D_xyyyyyzz*M_zz &
      )
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    L_xyyyy    = D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxyyyy*M_xxx + D_xyyyyyyy* &
      M_yyy + D_xyyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyyy*M_xx + &
      D_xxxyyyyy*M_xxy + D_xxxyyyyz*M_xxz + D_xxyyyyyy*M_xyy + &
      D_xxyyyyzz*M_xzz + D_xyyyyyy*M_yy + D_xyyyyyyz*M_yyz + D_xyyyyyzz &
      *M_yzz + D_xyyyyzz*M_zz)
    L_xyyyyz   = D_xxyyyyyz*M_xy + D_xxyyyyzz*M_xz + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxyyyyz*M_xx + D_xyyyyyyz*M_yy + D_xyyyyzzz*M_zz &
      )
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    L_xyyy     = D_xxyyyy*M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxyyy*M_xxxx + D_xyyyyyyy*M_yyyy + &
      D_xyyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyyyy*M_xxyy + &
      D_xxxyyyzz*M_xxzz + D_xyyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxyyy &
      *M_xxx + D_xxxxyyyy*M_xxxy + D_xxxxyyyz*M_xxxz + D_xxyyyyyy* &
      M_xyyy + D_xxyyyzzz*M_xzzz + D_xyyyyyy*M_yyy + D_xyyyyyyz*M_yyyz &
      + D_xyyyyzzz*M_yzzz + D_xyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyy* &
      M_xx + D_xxxyyyy*M_xxy + D_xxxyyyyz*M_xxyz + D_xxxyyyz*M_xxz + &
      D_xxyyyyy*M_xyy + D_xxyyyyyz*M_xyyz + D_xxyyyyzz*M_xyzz + &
      D_xxyyyzz*M_xzz + D_xyyyyy*M_yy + D_xyyyyyz*M_yyz + D_xyyyyzz* &
      M_yzz + D_xyyyzz*M_zz)
    L_xyyyz    = D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyzz*M_yz + &
      D_xyyyz*M_0 + (1.0d0/6.0d0)*(D_xxxxyyyz*M_xxx + D_xyyyyyyz*M_yyy &
      + D_xyyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyyyz*M_xxy + D_xxxyyyz &
      *M_xx + D_xxxyyyzz*M_xxz + D_xxyyyyyz*M_xyy + D_xxyyyzzz*M_xzz + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyzzz*M_yzz + D_xyyyzzz* &
      M_zz)
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    L_xyy      = D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxyy*M_xxxxx + D_xyyyyyyy*M_yyyyy + &
      D_xyyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyyyy*M_xxxyy + &
      D_xxxxyyzz*M_xxxzz + D_xxxyyyyy*M_xxyyy + D_xxxyyzzz*M_xxzzz + &
      D_xyyyyyzz*M_yyyzz + D_xyyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyyy*M_xxyy + D_xxxyyyyz*M_xxyyz + D_xxxyyyzz*M_xxyzz + &
      D_xxxyyzz*M_xxzz + D_xxyyyyzz*M_xyyzz + D_xyyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + D_xxxxxyyz &
      *M_xxxxz + D_xxyyyyyy*M_xyyyy + D_xxyyzzzz*M_xzzzz + D_xyyyyyy* &
      M_yyyy + D_xyyyyyyz*M_yyyyz + D_xyyyzzzz*M_yzzzz + D_xyyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + &
      D_xxxxyyyz*M_xxxyz + D_xxxxyyz*M_xxxz + D_xxyyyyy*M_xyyy + &
      D_xxyyyyyz*M_xyyyz + D_xxyyyzzz*M_xyzzz + D_xxyyzzz*M_xzzz + &
      D_xyyyyy*M_yyy + D_xyyyyyz*M_yyyz + D_xyyyzzz*M_yzzz + D_xyyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyz &
      *M_xxyz + D_xxxyyz*M_xxz + D_xxyyyy*M_xyy + D_xxyyyyz*M_xyyz + &
      D_xxyyyzz*M_xyzz + D_xxyyzz*M_xzz + D_xyyyy*M_yy + D_xyyyyz*M_yyz &
      + D_xyyyzz*M_yzz + D_xyyzz*M_zz)
    L_xyyz     = D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyzz*M_yz + D_xyyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxyyz*M_xxxx + D_xyyyyyyz*M_yyyy + &
      D_xyyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyyyz*M_xxyy + &
      D_xxxyyzzz*M_xxzz + D_xyyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxyyyz*M_xxxy + D_xxxxyyz*M_xxx + D_xxxxyyzz*M_xxxz + &
      D_xxyyyyyz*M_xyyy + D_xxyyzzzz*M_xzzz + D_xyyyyyz*M_yyy + &
      D_xyyyyyzz*M_yyyz + D_xyyyzzzz*M_yzzz + D_xyyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz + D_xxxyyz*M_xx + &
      D_xxxyyzz*M_xxz + D_xxyyyyz*M_xyy + D_xxyyyyzz*M_xyyz + &
      D_xxyyyzzz*M_xyzz + D_xxyyzzz*M_xzz + D_xyyyyz*M_yy + D_xyyyyzz* &
      M_yyz + D_xyyyzzz*M_yzz + D_xyyzzz*M_zz)
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    L_xy       = (1.0d0/8.0d0)*D_xxxyyyzz*M_xxyyzz + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz &
      *M_xz + D_xy*M_0 + D_xyyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxxy* &
      M_xxxxxx + D_xyyyyyyy*M_yyyyyy + D_xyzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxyyyy*M_xxxyyy + D_xxxxyzzz*M_xxxzzz + D_xyyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxyyy*M_xxxxyy + D_xxxxxyzz* &
      M_xxxxzz + D_xxxyyyyy*M_xxyyyy + D_xxxyzzzz*M_xxzzzz + D_xyyyyyzz &
      *M_yyyyzz + D_xyyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxyyy*M_xxyy &
      + D_xxxyyyz*M_xxyyz + D_xxxyyzz*M_xxyzz + D_xxxyzz*M_xxzz + &
      D_xxyyyzz*M_xyyzz + D_xyyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxxy &
      *M_xxxxx + D_xxxxxxyy*M_xxxxxy + D_xxxxxxyz*M_xxxxxz + D_xxyyyyyy &
      *M_xyyyyy + D_xxyzzzzz*M_xzzzzz + D_xyyyyyy*M_yyyyy + D_xyyyyyyz* &
      M_yyyyyz + D_xyyzzzzz*M_yzzzzz + D_xyzzzzz*M_zzzzz) + (1.0d0/ &
      24.0d0)*(D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + D_xxxxxyyz* &
      M_xxxxyz + D_xxxxxyz*M_xxxxz + D_xxyyyyy*M_xyyyy + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyzzzz*M_xyzzzz + D_xxyzzzz*M_xzzzz + D_xyyyyy* &
      M_yyyy + D_xyyyyyz*M_yyyyz + D_xyyzzzz*M_yzzzz + D_xyzzzz*M_zzzz &
      ) + (1.0d0/6.0d0)*(D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyz* &
      M_xxxyz + D_xxxxyz*M_xxxz + D_xxyyyy*M_xyyy + D_xxyyyyz*M_xyyyz + &
      D_xxyyzzz*M_xyzzz + D_xxyzzz*M_xzzz + D_xyyyy*M_yyy + D_xyyyyz* &
      M_yyyz + D_xyyzzz*M_yzzz + D_xyzzz*M_zzz) + (1.0d0/12.0d0)*( &
      D_xxxxyyy*M_xxxyy + D_xxxxyyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyzz + &
      D_xxxxyzz*M_xxxzz + D_xxxyyyy*M_xxyyy + D_xxxyyyyz*M_xxyyyz + &
      D_xxxyyzzz*M_xxyzzz + D_xxxyzzz*M_xxzzz + D_xxyyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyzzz + D_xyyyyzz*M_yyyzz + D_xyyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyz*M_xxyz + &
      D_xxxyz*M_xxz + D_xxyyy*M_xyy + D_xxyyyz*M_xyyz + D_xxyyzz*M_xyzz &
      + D_xxyzz*M_xzz + D_xyyy*M_yy + D_xyyyz*M_yyz + D_xyyzz*M_yzz + &
      D_xyzz*M_zz)
    L_xyz      = D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyzz*M_yz + D_xyz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxxyz*M_xxxxx + D_xyyyyyyz*M_yyyyy + &
      D_xyzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyyyz*M_xxxyy + &
      D_xxxxyzzz*M_xxxzz + D_xxxyyyyz*M_xxyyy + D_xxxyzzzz*M_xxzzz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyyz*M_xxyy + D_xxxyyyzz*M_xxyyz + D_xxxyyzzz*M_xxyzz + &
      D_xxxyzzz*M_xxzz + D_xxyyyzzz*M_xyyzz + D_xyyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxyyz*M_xxxxy + D_xxxxxyz*M_xxxx + D_xxxxxyzz &
      *M_xxxxz + D_xxyyyyyz*M_xyyyy + D_xxyzzzzz*M_xzzzz + D_xyyyyyz* &
      M_yyyy + D_xyyyyyzz*M_yyyyz + D_xyyzzzzz*M_yzzzz + D_xyzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxyyz*M_xxxy + D_xxxxyyzz*M_xxxyz + &
      D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + D_xxyyyyz*M_xyyy + D_xxyyyyzz &
      *M_xyyyz + D_xxyyzzzz*M_xyzzz + D_xxyzzzz*M_xzzz + D_xyyyyz*M_yyy &
      + D_xyyyyzz*M_yyyz + D_xyyzzzz*M_yzzz + D_xyzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyz*M_xx + &
      D_xxxyzz*M_xxz + D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyzzz* &
      M_xyzz + D_xxyzzz*M_xzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + &
      D_xyyzzz*M_yzz + D_xyzzz*M_zz)
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = D_x*M_0 + (1.0d0/8.0d0)*D_xxxyyzz*M_xxyyzz + D_xxy*M_xy + D_xxyz*M_xyz + &
      D_xxz*M_xz + D_xyz*M_yz + (1.0d0/5040.0d0)*(D_xxxxxxxx*M_xxxxxxx &
      + D_xyyyyyyy*M_yyyyyyy + D_xzzzzzzz*M_zzzzzzz) + (1.0d0/240.0d0)* &
      (D_xxxxxxyy*M_xxxxxyy + D_xxxxxxzz*M_xxxxxzz + D_xxxyyyyy* &
      M_xxyyyyy + D_xxxzzzzz*M_xxzzzzz + D_xyyyyyzz*M_yyyyyzz + &
      D_xyyzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxxyyy*M_xxxxyyy + &
      D_xxxxxzzz*M_xxxxzzz + D_xxxxyyyy*M_xxxyyyy + D_xxxxzzzz* &
      M_xxxzzzz + D_xyyyyzzz*M_yyyyzzz + D_xyyyzzzz*M_yyyzzzz) + (1.0d0 &
      /36.0d0)*(D_xxxxyyy*M_xxxyyy + D_xxxxyyyz*M_xxxyyyz + D_xxxxyzzz* &
      M_xxxyzzz + D_xxxxzzz*M_xxxzzz + D_xxyyyzzz*M_xyyyzzz + D_xyyyzzz &
      *M_yyyzzz) + (1.0d0/4.0d0)*(D_xxxyy*M_xxyy + D_xxxyyz*M_xxyyz + &
      D_xxxyzz*M_xxyzz + D_xxxzz*M_xxzz + D_xxyyzz*M_xyyzz + D_xyyzz* &
      M_yyzz) + (1.0d0/720.0d0)*(D_xxxxxxx*M_xxxxxx + D_xxxxxxxy* &
      M_xxxxxxy + D_xxxxxxxz*M_xxxxxxz + D_xxyyyyyy*M_xyyyyyy + &
      D_xxzzzzzz*M_xzzzzzz + D_xyyyyyy*M_yyyyyy + D_xyyyyyyz*M_yyyyyyz &
      + D_xyzzzzzz*M_yzzzzzz + D_xzzzzzz*M_zzzzzz) + (1.0d0/2.0d0)*( &
      D_xxx*M_xx + D_xxxy*M_xxy + D_xxxyz*M_xxyz + D_xxxz*M_xxz + &
      D_xxyy*M_xyy + D_xxyyz*M_xyyz + D_xxyzz*M_xyzz + D_xxzz*M_xzz + &
      D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz*M_zz) + (1.0d0/ &
      6.0d0)*(D_xxxx*M_xxx + D_xxxxy*M_xxxy + D_xxxxyz*M_xxxyz + &
      D_xxxxz*M_xxxz + D_xxyyy*M_xyyy + D_xxyyyz*M_xyyyz + D_xxyzzz* &
      M_xyzzz + D_xxzzz*M_xzzz + D_xyyy*M_yyy + D_xyyyz*M_yyyz + &
      D_xyzzz*M_yzzz + D_xzzz*M_zzz) + (1.0d0/120.0d0)*(D_xxxxxx* &
      M_xxxxx + D_xxxxxxy*M_xxxxxy + D_xxxxxxyz*M_xxxxxyz + D_xxxxxxz* &
      M_xxxxxz + D_xxyyyyy*M_xyyyyy + D_xxyyyyyz*M_xyyyyyz + D_xxyzzzzz &
      *M_xyzzzzz + D_xxzzzzz*M_xzzzzz + D_xyyyyy*M_yyyyy + D_xyyyyyz* &
      M_yyyyyz + D_xyzzzzz*M_yzzzzz + D_xzzzzz*M_zzzzz) + (1.0d0/48.0d0 &
      )*(D_xxxxxyy*M_xxxxyy + D_xxxxxyyz*M_xxxxyyz + D_xxxxxyzz* &
      M_xxxxyzz + D_xxxxxzz*M_xxxxzz + D_xxxyyyy*M_xxyyyy + D_xxxyyyyz* &
      M_xxyyyyz + D_xxxyzzzz*M_xxyzzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxyyyyzz*M_xyyyyzz + D_xxyyzzzz*M_xyyzzzz + D_xyyyyzz*M_yyyyzz &
      + D_xyyzzzz*M_yyzzzz) + (1.0d0/12.0d0)*(D_xxxxyy*M_xxxyy + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyzz*M_xxxyzz + D_xxxxzz*M_xxxzz + &
      D_xxxyyy*M_xxyyy + D_xxxyyyz*M_xxyyyz + D_xxxyzzz*M_xxyzzz + &
      D_xxxzzz*M_xxzzz + D_xxyyyzz*M_xyyyzz + D_xxyyzzz*M_xyyzzz + &
      D_xyyyzz*M_yyyzz + D_xyyzzz*M_yyzzz) + (1.0d0/24.0d0)*(D_xxxxx* &
      M_xxxx + D_xxxxxy*M_xxxxy + D_xxxxxyz*M_xxxxyz + D_xxxxxz*M_xxxxz &
      + D_xxxxyyzz*M_xxxyyzz + D_xxxyyyzz*M_xxyyyzz + D_xxxyyzzz* &
      M_xxyyzzz + D_xxyyyy*M_xyyyy + D_xxyyyyz*M_xyyyyz + D_xxyzzzz* &
      M_xyzzzz + D_xxzzzz*M_xzzzz + D_xyyyy*M_yyyy + D_xyyyyz*M_yyyyz + &
      D_xyzzzz*M_yzzzz + D_xzzzz*M_zzzz)
    L_xz       = (1.0d0/8.0d0)*D_xxxyyzzz*M_xxyyzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz &
      *M_xz + D_xyzz*M_yz + D_xz*M_0 + (1.0d0/720.0d0)*(D_xxxxxxxz* &
      M_xxxxxx + D_xyyyyyyz*M_yyyyyy + D_xzzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxyyyz*M_xxxyyy + D_xxxxzzzz*M_xxxzzz + D_xyyyzzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxyyz*M_xxxxyy + D_xxxxxzzz* &
      M_xxxxzz + D_xxxyyyyz*M_xxyyyy + D_xxxzzzzz*M_xxzzzz + D_xyyyyzzz &
      *M_yyyyzz + D_xyyzzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxyyz*M_xxyy &
      + D_xxxyyzz*M_xxyyz + D_xxxyzzz*M_xxyzz + D_xxxzzz*M_xxzz + &
      D_xxyyzzz*M_xyyzz + D_xyyzzz*M_yyzz) + (1.0d0/120.0d0)*( &
      D_xxxxxxyz*M_xxxxxy + D_xxxxxxz*M_xxxxx + D_xxxxxxzz*M_xxxxxz + &
      D_xxyyyyyz*M_xyyyyy + D_xxzzzzzz*M_xzzzzz + D_xyyyyyz*M_yyyyy + &
      D_xyyyyyzz*M_yyyyyz + D_xyzzzzzz*M_yzzzzz + D_xzzzzzz*M_zzzzz) + &
      (1.0d0/24.0d0)*(D_xxxxxyz*M_xxxxy + D_xxxxxyzz*M_xxxxyz + &
      D_xxxxxz*M_xxxx + D_xxxxxzz*M_xxxxz + D_xxyyyyz*M_xyyyy + &
      D_xxyyyyzz*M_xyyyyz + D_xxyzzzzz*M_xyzzzz + D_xxzzzzz*M_xzzzz + &
      D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + D_xyzzzzz*M_yzzzz + &
      D_xzzzzz*M_zzzz) + (1.0d0/12.0d0)*(D_xxxxyyz*M_xxxyy + D_xxxxyyzz &
      *M_xxxyyz + D_xxxxyzzz*M_xxxyzz + D_xxxxzzz*M_xxxzz + D_xxxyyyz* &
      M_xxyyy + D_xxxyyyzz*M_xxyyyz + D_xxxyzzzz*M_xxyzzz + D_xxxzzzz* &
      M_xxzzz + D_xxyyyzzz*M_xyyyzz + D_xxyyzzzz*M_xyyzzz + D_xyyyzzz* &
      M_yyyzz + D_xyyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxxyz*M_xxxy + &
      D_xxxxyzz*M_xxxyz + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxyyyz* &
      M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyzzzz*M_xyzzz + D_xxzzzz*M_xzzz &
      + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyzzzz*M_yzzz + D_xzzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz* &
      M_xx + D_xxxzz*M_xxz + D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyzzz &
      *M_xyzz + D_xxzzz*M_xzz + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz* &
      M_yzz + D_xzzz*M_zz)
    D_yyyyyyyy = 11025*h**4*u**17 - 396900*h**3*u**17*y**2 + 2182950*h**2*u**17*y**4 - &
      3783780*h*u**17*y**6 + 2027025*u**17*y**8
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = -99225*h**3*u**17*y*z + 1091475*h**2*u**17*y**3*z - 2837835*h*u**17*y**5 &
      *z + 2027025*u**17*y**7*z
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + D_yyyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxyyyyyy*M_xx + D_yyyyyyyy*M_yy + D_yyyyyyzz*M_zz &
      )
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = D_xyyyyyy*M_xy + D_xyyyyyyz*M_xyz + D_xyyyyyz*M_xz + D_yyyyy*M_0 + &
      D_yyyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxyyyyy*M_xxx + D_yyyyyyyy* &
      M_yyy + D_yyyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyyy*M_xx + &
      D_xxyyyyyy*M_xxy + D_xxyyyyyz*M_xxz + D_xyyyyyyy*M_xyy + &
      D_xyyyyyzz*M_xzz + D_yyyyyyy*M_yy + D_yyyyyyyz*M_yyz + D_yyyyyyzz &
      *M_yzz + D_yyyyyzz*M_zz)
    L_yyyyyz   = D_xyyyyyyz*M_xy + D_xyyyyyzz*M_xz + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxyyyyyz*M_xx + D_yyyyyyyz*M_yy + D_yyyyyzzz*M_zz &
      )
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = D_xyyyyy*M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxyyyy*M_xxxx + D_yyyyyyyy*M_yyyy + &
      D_yyyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyyyy*M_xxyy + &
      D_xxyyyyzz*M_xxzz + D_yyyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxyyyy &
      *M_xxx + D_xxxyyyyy*M_xxxy + D_xxxyyyyz*M_xxxz + D_xyyyyyyy* &
      M_xyyy + D_xyyyyzzz*M_xzzz + D_yyyyyyy*M_yyy + D_yyyyyyyz*M_yyyz &
      + D_yyyyyzzz*M_yzzz + D_yyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyy* &
      M_xx + D_xxyyyyy*M_xxy + D_xxyyyyyz*M_xxyz + D_xxyyyyz*M_xxz + &
      D_xyyyyyy*M_xyy + D_xyyyyyyz*M_xyyz + D_xyyyyyzz*M_xyzz + &
      D_xyyyyzz*M_xzz + D_yyyyyy*M_yy + D_yyyyyyz*M_yyz + D_yyyyyzz* &
      M_yzz + D_yyyyzz*M_zz)
    L_yyyyz    = D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyzz*M_xz + D_yyyyyzz*M_yz + &
      D_yyyyz*M_0 + (1.0d0/6.0d0)*(D_xxxyyyyz*M_xxx + D_yyyyyyyz*M_yyy &
      + D_yyyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyyyz*M_xxy + D_xxyyyyz &
      *M_xx + D_xxyyyyzz*M_xxz + D_xyyyyyyz*M_xyy + D_xyyyyzzz*M_xzz + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyzzz*M_yzz + D_yyyyzzz* &
      M_zz)
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxyyy*M_xxxxx + D_yyyyyyyy*M_yyyyy + &
      D_yyyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyyyy*M_xxxyy + &
      D_xxxyyyzz*M_xxxzz + D_xxyyyyyy*M_xxyyy + D_xxyyyzzz*M_xxzzz + &
      D_yyyyyyzz*M_yyyzz + D_yyyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyyy*M_xxyy + D_xxyyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyzz + &
      D_xxyyyzz*M_xxzz + D_xyyyyyzz*M_xyyzz + D_yyyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + D_xxxxyyyz &
      *M_xxxxz + D_xyyyyyyy*M_xyyyy + D_xyyyzzzz*M_xzzzz + D_yyyyyyy* &
      M_yyyy + D_yyyyyyyz*M_yyyyz + D_yyyyzzzz*M_yzzzz + D_yyyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + &
      D_xxxyyyyz*M_xxxyz + D_xxxyyyz*M_xxxz + D_xyyyyyy*M_xyyy + &
      D_xyyyyyyz*M_xyyyz + D_xyyyyzzz*M_xyzzz + D_xyyyzzz*M_xzzz + &
      D_yyyyyy*M_yyy + D_yyyyyyz*M_yyyz + D_yyyyzzz*M_yzzz + D_yyyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyz &
      *M_xxyz + D_xxyyyz*M_xxz + D_xyyyyy*M_xyy + D_xyyyyyz*M_xyyz + &
      D_xyyyyzz*M_xyzz + D_xyyyzz*M_xzz + D_yyyyy*M_yy + D_yyyyyz*M_yyz &
      + D_yyyyzz*M_yzz + D_yyyzz*M_zz)
    L_yyyz     = D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz + D_yyyyzz*M_yz + D_yyyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxyyyz*M_xxxx + D_yyyyyyyz*M_yyyy + &
      D_yyyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyyyz*M_xxyy + &
      D_xxyyyzzz*M_xxzz + D_yyyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxyyyyz*M_xxxy + D_xxxyyyz*M_xxx + D_xxxyyyzz*M_xxxz + &
      D_xyyyyyyz*M_xyyy + D_xyyyzzzz*M_xzzz + D_yyyyyyz*M_yyy + &
      D_yyyyyyzz*M_yyyz + D_yyyyzzzz*M_yzzz + D_yyyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz + D_xxyyyz*M_xx + &
      D_xxyyyzz*M_xxz + D_xyyyyyz*M_xyy + D_xyyyyyzz*M_xyyz + &
      D_xyyyyzzz*M_xyzz + D_xyyyzzz*M_xzz + D_yyyyyz*M_yy + D_yyyyyzz* &
      M_yyz + D_yyyyzzz*M_yzz + D_yyyzzz*M_zz)
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = (1.0d0/8.0d0)*D_xxyyyyzz*M_xxyyzz + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz &
      *M_xz + D_yy*M_0 + D_yyyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxyy* &
      M_xxxxxx + D_yyyyyyyy*M_yyyyyy + D_yyzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxyyyyy*M_xxxyyy + D_xxxyyzzz*M_xxxzzz + D_yyyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyyyy*M_xxxxyy + D_xxxxyyzz* &
      M_xxxxzz + D_xxyyyyyy*M_xxyyyy + D_xxyyzzzz*M_xxzzzz + D_yyyyyyzz &
      *M_yyyyzz + D_yyyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyyyy*M_xxyy &
      + D_xxyyyyz*M_xxyyz + D_xxyyyzz*M_xxyzz + D_xxyyzz*M_xxzz + &
      D_xyyyyzz*M_xyyzz + D_yyyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxyy &
      *M_xxxxx + D_xxxxxyyy*M_xxxxxy + D_xxxxxyyz*M_xxxxxz + D_xyyyyyyy &
      *M_xyyyyy + D_xyyzzzzz*M_xzzzzz + D_yyyyyyy*M_yyyyy + D_yyyyyyyz* &
      M_yyyyyz + D_yyyzzzzz*M_yzzzzz + D_yyzzzzz*M_zzzzz) + (1.0d0/ &
      24.0d0)*(D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + D_xxxxyyyz* &
      M_xxxxyz + D_xxxxyyz*M_xxxxz + D_xyyyyyy*M_xyyyy + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyzzzz*M_xyzzzz + D_xyyzzzz*M_xzzzz + D_yyyyyy* &
      M_yyyy + D_yyyyyyz*M_yyyyz + D_yyyzzzz*M_yzzzz + D_yyzzzz*M_zzzz &
      ) + (1.0d0/6.0d0)*(D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyz* &
      M_xxxyz + D_xxxyyz*M_xxxz + D_xyyyyy*M_xyyy + D_xyyyyyz*M_xyyyz + &
      D_xyyyzzz*M_xyzzz + D_xyyzzz*M_xzzz + D_yyyyy*M_yyy + D_yyyyyz* &
      M_yyyz + D_yyyzzz*M_yzzz + D_yyzzz*M_zzz) + (1.0d0/12.0d0)*( &
      D_xxxyyyy*M_xxxyy + D_xxxyyyyz*M_xxxyyz + D_xxxyyyzz*M_xxxyzz + &
      D_xxxyyzz*M_xxxzz + D_xxyyyyy*M_xxyyy + D_xxyyyyyz*M_xxyyyz + &
      D_xxyyyzzz*M_xxyzzz + D_xxyyzzz*M_xxzzz + D_xyyyyyzz*M_xyyyzz + &
      D_xyyyyzzz*M_xyyzzz + D_yyyyyzz*M_yyyzz + D_yyyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyz*M_xxyz + &
      D_xxyyz*M_xxz + D_xyyyy*M_xyy + D_xyyyyz*M_xyyz + D_xyyyzz*M_xyzz &
      + D_xyyzz*M_xzz + D_yyyy*M_yy + D_yyyyz*M_yyz + D_yyyzz*M_yzz + &
      D_yyzz*M_zz)
    L_yyz      = D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyzz*M_yz + D_yyz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxyyz*M_xxxxx + D_yyyyyyyz*M_yyyyy + &
      D_yyzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyyyz*M_xxxyy + &
      D_xxxyyzzz*M_xxxzz + D_xxyyyyyz*M_xxyyy + D_xxyyzzzz*M_xxzzz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyyz*M_xxyy + D_xxyyyyzz*M_xxyyz + D_xxyyyzzz*M_xxyzz + &
      D_xxyyzzz*M_xxzz + D_xyyyyzzz*M_xyyzz + D_yyyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxyyyz*M_xxxxy + D_xxxxyyz*M_xxxx + D_xxxxyyzz &
      *M_xxxxz + D_xyyyyyyz*M_xyyyy + D_xyyzzzzz*M_xzzzz + D_yyyyyyz* &
      M_yyyy + D_yyyyyyzz*M_yyyyz + D_yyyzzzzz*M_yzzzz + D_yyzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxyyyz*M_xxxy + D_xxxyyyzz*M_xxxyz + &
      D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + D_xyyyyyz*M_xyyy + D_xyyyyyzz &
      *M_xyyyz + D_xyyyzzzz*M_xyzzz + D_xyyzzzz*M_xzzz + D_yyyyyz*M_yyy &
      + D_yyyyyzz*M_yyyz + D_yyyzzzz*M_yzzz + D_yyzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyz*M_xx + &
      D_xxyyzz*M_xxz + D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyzzz* &
      M_xyzz + D_xyyzzz*M_xzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + &
      D_yyyzzz*M_yzz + D_yyzzz*M_zz)
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = (1.0d0/8.0d0)*D_xxyyyzz*M_xxyyzz + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz* &
      M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/5040.0d0)*(D_xxxxxxxy* &
      M_xxxxxxx + D_yyyyyyyy*M_yyyyyyy + D_yzzzzzzz*M_zzzzzzz) + (1.0d0 &
      /240.0d0)*(D_xxxxxyyy*M_xxxxxyy + D_xxxxxyzz*M_xxxxxzz + &
      D_xxyyyyyy*M_xxyyyyy + D_xxyzzzzz*M_xxzzzzz + D_yyyyyyzz* &
      M_yyyyyzz + D_yyyzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxyyyy* &
      M_xxxxyyy + D_xxxxyzzz*M_xxxxzzz + D_xxxyyyyy*M_xxxyyyy + &
      D_xxxyzzzz*M_xxxzzzz + D_yyyyyzzz*M_yyyyzzz + D_yyyyzzzz* &
      M_yyyzzzz) + (1.0d0/36.0d0)*(D_xxxyyyy*M_xxxyyy + D_xxxyyyyz* &
      M_xxxyyyz + D_xxxyyzzz*M_xxxyzzz + D_xxxyzzz*M_xxxzzz + &
      D_xyyyyzzz*M_xyyyzzz + D_yyyyzzz*M_yyyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyy*M_xxyy + D_xxyyyz*M_xxyyz + D_xxyyzz*M_xxyzz + D_xxyzz* &
      M_xxzz + D_xyyyzz*M_xyyzz + D_yyyzz*M_yyzz) + (1.0d0/720.0d0)*( &
      D_xxxxxxy*M_xxxxxx + D_xxxxxxyy*M_xxxxxxy + D_xxxxxxyz*M_xxxxxxz &
      + D_xyyyyyyy*M_xyyyyyy + D_xyzzzzzz*M_xzzzzzz + D_yyyyyyy* &
      M_yyyyyy + D_yyyyyyyz*M_yyyyyyz + D_yyzzzzzz*M_yzzzzzz + &
      D_yzzzzzz*M_zzzzzz) + (1.0d0/120.0d0)*(D_xxxxxy*M_xxxxx + &
      D_xxxxxyy*M_xxxxxy + D_xxxxxyyz*M_xxxxxyz + D_xxxxxyz*M_xxxxxz + &
      D_xyyyyyy*M_xyyyyy + D_xyyyyyyz*M_xyyyyyz + D_xyyzzzzz*M_xyzzzzz &
      + D_xyzzzzz*M_xzzzzz + D_yyyyyy*M_yyyyy + D_yyyyyyz*M_yyyyyz + &
      D_yyzzzzz*M_yzzzzz + D_yzzzzz*M_zzzzz) + (1.0d0/48.0d0)*( &
      D_xxxxyyy*M_xxxxyy + D_xxxxyyyz*M_xxxxyyz + D_xxxxyyzz*M_xxxxyzz &
      + D_xxxxyzz*M_xxxxzz + D_xxyyyyy*M_xxyyyy + D_xxyyyyyz*M_xxyyyyz &
      + D_xxyyzzzz*M_xxyzzzz + D_xxyzzzz*M_xxzzzz + D_xyyyyyzz* &
      M_xyyyyzz + D_xyyyzzzz*M_xyyzzzz + D_yyyyyzz*M_yyyyzz + D_yyyzzzz &
      *M_yyzzzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + D_xxxyy*M_xxxy + &
      D_xxxyyz*M_xxxyz + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + D_xyyyyz* &
      M_xyyyz + D_xyyzzz*M_xyzzz + D_xyzzz*M_xzzz + D_yyyy*M_yyy + &
      D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) + (1.0d0/12.0d0)* &
      (D_xxxyyy*M_xxxyy + D_xxxyyyz*M_xxxyyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyzz*M_xxxzz + D_xxyyyy*M_xxyyy + D_xxyyyyz*M_xxyyyz + &
      D_xxyyzzz*M_xxyzzz + D_xxyzzz*M_xxzzz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyzzz*M_xyyzzz + D_yyyyzz*M_yyyzz + D_yyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + D_xxyz &
      *M_xxz + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + D_xyzz* &
      M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz*M_zz) + &
      (1.0d0/24.0d0)*(D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyyz* &
      M_xxxxyz + D_xxxxyz*M_xxxxz + D_xxxyyyzz*M_xxxyyzz + D_xxyyyyzz* &
      M_xxyyyzz + D_xxyyyzzz*M_xxyyzzz + D_xyyyyy*M_xyyyy + D_xyyyyyz* &
      M_xyyyyz + D_xyyzzzz*M_xyzzzz + D_xyzzzz*M_xzzzz + D_yyyyy*M_yyyy &
      + D_yyyyyz*M_yyyyz + D_yyzzzz*M_yzzzz + D_yzzzz*M_zzzz)
    L_yz       = (1.0d0/8.0d0)*D_xxyyyzzz*M_xxyyzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz &
      *M_xz + D_yyzz*M_yz + D_yz*M_0 + (1.0d0/720.0d0)*(D_xxxxxxyz* &
      M_xxxxxx + D_yyyyyyyz*M_yyyyyy + D_yzzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxyyyyz*M_xxxyyy + D_xxxyzzzz*M_xxxzzz + D_yyyyzzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyyyz*M_xxxxyy + D_xxxxyzzz* &
      M_xxxxzz + D_xxyyyyyz*M_xxyyyy + D_xxyzzzzz*M_xxzzzz + D_yyyyyzzz &
      *M_yyyyzz + D_yyyzzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyyyz*M_xxyy &
      + D_xxyyyzz*M_xxyyz + D_xxyyzzz*M_xxyzz + D_xxyzzz*M_xxzz + &
      D_xyyyzzz*M_xyyzz + D_yyyzzz*M_yyzz) + (1.0d0/120.0d0)*( &
      D_xxxxxyyz*M_xxxxxy + D_xxxxxyz*M_xxxxx + D_xxxxxyzz*M_xxxxxz + &
      D_xyyyyyyz*M_xyyyyy + D_xyzzzzzz*M_xzzzzz + D_yyyyyyz*M_yyyyy + &
      D_yyyyyyzz*M_yyyyyz + D_yyzzzzzz*M_yzzzzz + D_yzzzzzz*M_zzzzz) + &
      (1.0d0/24.0d0)*(D_xxxxyyz*M_xxxxy + D_xxxxyyzz*M_xxxxyz + &
      D_xxxxyz*M_xxxx + D_xxxxyzz*M_xxxxz + D_xyyyyyz*M_xyyyy + &
      D_xyyyyyzz*M_xyyyyz + D_xyyzzzzz*M_xyzzzz + D_xyzzzzz*M_xzzzz + &
      D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + D_yyzzzzz*M_yzzzz + &
      D_yzzzzz*M_zzzz) + (1.0d0/12.0d0)*(D_xxxyyyz*M_xxxyy + D_xxxyyyzz &
      *M_xxxyyz + D_xxxyyzzz*M_xxxyzz + D_xxxyzzz*M_xxxzz + D_xxyyyyz* &
      M_xxyyy + D_xxyyyyzz*M_xxyyyz + D_xxyyzzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxzzz + D_xyyyyzzz*M_xyyyzz + D_xyyyzzzz*M_xyyzzz + D_yyyyzzz* &
      M_yyyzz + D_yyyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxyyz*M_xxxy + &
      D_xxxyyzz*M_xxxyz + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xyyyyz* &
      M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyzzzz*M_xyzzz + D_xyzzzz*M_xzzz &
      + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyzzzz*M_yzzz + D_yzzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz* &
      M_xx + D_xxyzz*M_xxz + D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyzzz &
      *M_xyzz + D_xyzzz*M_xzz + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz* &
      M_yzz + D_yzzz*M_zz)
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_z        = (1.0d0/8.0d0)*D_xxyyzzz*M_xxyyzz + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/5040.0d0)*(D_xxxxxxxz* &
      M_xxxxxxx + D_yyyyyyyz*M_yyyyyyy + D_zzzzzzzz*M_zzzzzzz) + (1.0d0 &
      /240.0d0)*(D_xxxxxyyz*M_xxxxxyy + D_xxxxxzzz*M_xxxxxzz + &
      D_xxyyyyyz*M_xxyyyyy + D_xxzzzzzz*M_xxzzzzz + D_yyyyyzzz* &
      M_yyyyyzz + D_yyzzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxyyyz* &
      M_xxxxyyy + D_xxxxzzzz*M_xxxxzzz + D_xxxyyyyz*M_xxxyyyy + &
      D_xxxzzzzz*M_xxxzzzz + D_yyyyzzzz*M_yyyyzzz + D_yyyzzzzz* &
      M_yyyzzzz) + (1.0d0/36.0d0)*(D_xxxyyyz*M_xxxyyy + D_xxxyyyzz* &
      M_xxxyyyz + D_xxxyzzzz*M_xxxyzzz + D_xxxzzzz*M_xxxzzz + &
      D_xyyyzzzz*M_xyyyzzz + D_yyyzzzz*M_yyyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyzzz*M_xxyzz + D_xxzzz* &
      M_xxzz + D_xyyzzz*M_xyyzz + D_yyzzz*M_yyzz) + (1.0d0/720.0d0)*( &
      D_xxxxxxyz*M_xxxxxxy + D_xxxxxxz*M_xxxxxx + D_xxxxxxzz*M_xxxxxxz &
      + D_xyyyyyyz*M_xyyyyyy + D_xzzzzzzz*M_xzzzzzz + D_yyyyyyz* &
      M_yyyyyy + D_yyyyyyzz*M_yyyyyyz + D_yzzzzzzz*M_yzzzzzz + &
      D_zzzzzzz*M_zzzzzz) + (1.0d0/120.0d0)*(D_xxxxxyz*M_xxxxxy + &
      D_xxxxxyzz*M_xxxxxyz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + &
      D_xyyyyyz*M_xyyyyy + D_xyyyyyzz*M_xyyyyyz + D_xyzzzzzz*M_xyzzzzz &
      + D_xzzzzzz*M_xzzzzz + D_yyyyyz*M_yyyyy + D_yyyyyzz*M_yyyyyz + &
      D_yzzzzzz*M_yzzzzz + D_zzzzzz*M_zzzzz) + (1.0d0/48.0d0)*( &
      D_xxxxyyz*M_xxxxyy + D_xxxxyyzz*M_xxxxyyz + D_xxxxyzzz*M_xxxxyzz &
      + D_xxxxzzz*M_xxxxzz + D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz &
      + D_xxyzzzzz*M_xxyzzzz + D_xxzzzzz*M_xxzzzz + D_xyyyyzzz* &
      M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz + D_yyyyzzz*M_yyyyzz + D_yyzzzzz &
      *M_yyzzzz) + (1.0d0/12.0d0)*(D_xxxyyz*M_xxxyy + D_xxxyyzz* &
      M_xxxyyz + D_xxxyzzz*M_xxxyzz + D_xxxzzz*M_xxxzz + D_xxyyyz* &
      M_xxyyy + D_xxyyyzz*M_xxyyyz + D_xxyzzzz*M_xxyzzz + D_xxzzzz* &
      M_xxzzz + D_xyyyzzz*M_xyyyzz + D_xyyzzzz*M_xyyzzz + D_yyyzzz* &
      M_yyyzz + D_yyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy &
      + D_xyyyzz*M_xyyyz + D_xyzzzz*M_xyzzz + D_xzzzz*M_xzzz + D_yyyz* &
      M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + D_xxzz*M_xxz &
      + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz*M_xyzz + D_xzzz*M_xzz + &
      D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz*M_zz) + (1.0d0/ &
      24.0d0)*(D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + D_xxxxz*M_xxxx + &
      D_xxxxzz*M_xxxxz + D_xxxyyzzz*M_xxxyyzz + D_xxyyyzzz*M_xxyyyzz + &
      D_xxyyzzzz*M_xxyyzzz + D_xyyyyz*M_xyyyy + D_xyyyyzz*M_xyyyyz + &
      D_xyzzzzz*M_xyzzzz + D_xzzzzz*M_xzzzz + D_yyyyz*M_yyyy + D_yyyyzz &
      *M_yyyyz + D_yzzzzz*M_yzzzz + D_zzzzz*M_zzzz)
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
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  L_xxx               
#undef  M_xxz               
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
#undef  L_xxxxyy            
#undef  M_xxxyyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
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
    end subroutine mom_es_M2L
    
! OPS  1834*ADD + 202*DIV + 3402*MUL + 84*NEG + 1890*POW = 7412  (8804 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz,&
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
                L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define Ls_xy                Ls(4)
#define L_xy                 L(4)
#define Ls_xz                Ls(5)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define Ls_yy                Ls(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define Ls_xxz               Ls(10)
#define L_xxz                L(10)
#define Ls_xyy               Ls(11)
#define L_xyy                L(11)
#define Ls_xyz               Ls(12)
#define L_xyz                L(12)
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
#define L_xxyyy              L(29)
#define Ls_xxyyy             Ls(29)
#define L_xxyyz              L(30)
#define Ls_xxyyz             Ls(30)
#define Ls_xyyyy             Ls(31)
#define L_xyyyy              L(31)
#define Ls_xyyyz             Ls(32)
#define L_xyyyz              L(32)
#define L_yyyyy              L(33)
#define Ls_yyyyy             Ls(33)
#define L_yyyyz              L(34)
#define Ls_yyyyz             Ls(34)
#define Ls_xxxxxx            Ls(35)
#define L_xxxxxx             L(35)
#define L_xxxxxy             L(36)
#define Ls_xxxxxy            Ls(36)
#define Ls_xxxxxz            Ls(37)
#define L_xxxxxz             L(37)
#define Ls_xxxxyy            Ls(38)
#define L_xxxxyy             L(38)
#define Ls_xxxxyz            Ls(39)
#define L_xxxxyz             L(39)
#define Ls_xxxyyy            Ls(40)
#define L_xxxyyy             L(40)
#define L_xxxyyz             L(41)
#define Ls_xxxyyz            Ls(41)
#define Ls_xxyyyy            Ls(42)
#define L_xxyyyy             L(42)
#define Ls_xxyyyz            Ls(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define Ls_xyyyyy            Ls(44)
#define L_xyyyyz             L(45)
#define Ls_xyyyyz            Ls(45)
#define L_yyyyyy             L(46)
#define Ls_yyyyyy            Ls(46)
#define Ls_yyyyyz            Ls(47)
#define L_yyyyyz             L(47)
#define Ls_xxxxxxx           Ls(48)
#define L_xxxxxxx            L(48)
#define Ls_xxxxxxy           Ls(49)
#define L_xxxxxxy            L(49)
#define Ls_xxxxxxz           Ls(50)
#define L_xxxxxxz            L(50)
#define Ls_xxxxxyy           Ls(51)
#define L_xxxxxyy            L(51)
#define Ls_xxxxxyz           Ls(52)
#define L_xxxxxyz            L(52)
#define Ls_xxxxyyy           Ls(53)
#define L_xxxxyyy            L(53)
#define Ls_xxxxyyz           Ls(54)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define Ls_xxxyyyy           Ls(55)
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
#define Ls_yyyyyyz           Ls(62)
#define L_yyyyyyz            L(62)
#define L_xxxxxxxx           L(63)
#define Ls_xxxxxxxx          Ls(63)
#define Ls_xxxxxxxy          Ls(64)
#define L_xxxxxxxy           L(64)
#define Ls_xxxxxxxz          Ls(65)
#define L_xxxxxxxz           L(65)
#define Ls_xxxxxxyy          Ls(66)
#define L_xxxxxxyy           L(66)
#define Ls_xxxxxxyz          Ls(67)
#define L_xxxxxxyz           L(67)
#define Ls_xxxxxyyy          Ls(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define Ls_xxxxxyyz          Ls(69)
#define Ls_xxxxyyyy          Ls(70)
#define L_xxxxyyyy           L(70)
#define L_xxxxyyyz           L(71)
#define Ls_xxxxyyyz          Ls(71)
#define Ls_xxxyyyyy          Ls(72)
#define L_xxxyyyyy           L(72)
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
    Ls_xxxxxxx  = L_xxxxxxx + L_xxxxxxxx*x + L_xxxxxxxy*y + L_xxxxxxxz*z
    Ls_xxxxxxy  = L_xxxxxxxy*x + L_xxxxxxy + L_xxxxxxyy*y + L_xxxxxxyz*z
    Ls_xxxxxyy  = L_xxxxxxyy*x + L_xxxxxyy + L_xxxxxyyy*y + L_xxxxxyyz*z
    Ls_xxxxyyy  = L_xxxxxyyy*x + L_xxxxyyy + L_xxxxyyyy*y + L_xxxxyyyz*z
    Ls_xxxyyyy  = L_xxxxyyyy*x + L_xxxyyyy + L_xxxyyyyy*y + L_xxxyyyyz*z
    Ls_xxyyyyy  = L_xxxyyyyy*x + L_xxyyyyy + L_xxyyyyyy*y + L_xxyyyyyz*z
    Ls_xyyyyyy  = L_xxyyyyyy*x + L_xyyyyyy + L_xyyyyyyy*y + L_xyyyyyyz*z
    Ls_yyyyyyy  = L_xyyyyyyy*x + L_yyyyyyy + L_yyyyyyyy*y + L_yyyyyyyz*z
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
    Ls_xxxxxx   = L_xxxxxx + L_xxxxxxx*x + L_xxxxxxxy*x*y + L_xxxxxxxz*x*z + L_xxxxxxy*y + &
      L_xxxxxxyz*y*z + L_xxxxxxz*z + (1.0d0/2.0d0)*(L_xxxxxxxx*x**2 + &
      L_xxxxxxyy*y**2 + L_xxxxxxzz*z**2)
    Ls_xxxxxxz  = L_xxxxxxxz*x + L_xxxxxxyz*y + L_xxxxxxz + L_xxxxxxzz*z
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    Ls_xxxxxy   = L_xxxxxxy*x + L_xxxxxxyy*x*y + L_xxxxxxyz*x*z + L_xxxxxy + L_xxxxxyy*y + &
      L_xxxxxyyz*y*z + L_xxxxxyz*z + (1.0d0/2.0d0)*(L_xxxxxxxy*x**2 + &
      L_xxxxxyyy*y**2 + L_xxxxxyzz*z**2)
    Ls_xxxxxyz  = L_xxxxxxyz*x + L_xxxxxyyz*y + L_xxxxxyz + L_xxxxxyzz*z
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    Ls_xxxxx    = L_xxxxx + L_xxxxxx*x + L_xxxxxxy*x*y + L_xxxxxxyz*x*y*z + L_xxxxxxz*x*z &
      + L_xxxxxy*y + L_xxxxxyz*y*z + L_xxxxxz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxx*x**3 + L_xxxxxyyy*y**3 + L_xxxxxzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxx*x**2 + L_xxxxxxxy*x**2*y + L_xxxxxxxz*x**2*z + &
      L_xxxxxxyy*x*y**2 + L_xxxxxxzz*x*z**2 + L_xxxxxyy*y**2 + &
      L_xxxxxyyz*y**2*z + L_xxxxxyzz*y*z**2 + L_xxxxxzz*z**2)
    Ls_xxxxxz   = L_xxxxxxyz*x*y + L_xxxxxxz*x + L_xxxxxxzz*x*z + L_xxxxxyz*y + L_xxxxxyzz &
      *y*z + L_xxxxxz + L_xxxxxzz*z + (1.0d0/2.0d0)*(L_xxxxxxxz*x**2 + &
      L_xxxxxyyz*y**2 + L_xxxxxzzz*z**2)
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    Ls_xxxxyy   = L_xxxxxyy*x + L_xxxxxyyy*x*y + L_xxxxxyyz*x*z + L_xxxxyy + L_xxxxyyy*y + &
      L_xxxxyyyz*y*z + L_xxxxyyz*z + (1.0d0/2.0d0)*(L_xxxxxxyy*x**2 + &
      L_xxxxyyyy*y**2 + L_xxxxyyzz*z**2)
    Ls_xxxxyyz  = L_xxxxxyyz*x + L_xxxxyyyz*y + L_xxxxyyz + L_xxxxyyzz*z
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    Ls_xxxxy    = L_xxxxxy*x + L_xxxxxyy*x*y + L_xxxxxyyz*x*y*z + L_xxxxxyz*x*z + L_xxxxy &
      + L_xxxxyy*y + L_xxxxyyz*y*z + L_xxxxyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxy*x**3 + L_xxxxyyyy*y**3 + L_xxxxyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxy*x**2 + L_xxxxxxyy*x**2*y + L_xxxxxxyz*x**2*z + &
      L_xxxxxyyy*x*y**2 + L_xxxxxyzz*x*z**2 + L_xxxxyyy*y**2 + &
      L_xxxxyyyz*y**2*z + L_xxxxyyzz*y*z**2 + L_xxxxyzz*z**2)
    Ls_xxxxyz   = L_xxxxxyyz*x*y + L_xxxxxyz*x + L_xxxxxyzz*x*z + L_xxxxyyz*y + L_xxxxyyzz &
      *y*z + L_xxxxyz + L_xxxxyzz*z + (1.0d0/2.0d0)*(L_xxxxxxyz*x**2 + &
      L_xxxxyyyz*y**2 + L_xxxxyzzz*z**2)
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    Ls_xxxx     = L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxyz*x*y*z + L_xxxxxz*x*z + &
      L_xxxxy*y + L_xxxxyz*y*z + L_xxxxz*z + (1.0d0/24.0d0)*(L_xxxxxxxx &
      *x**4 + L_xxxxyyyy*y**4 + L_xxxxzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxxyy*x**2*y**2 + L_xxxxxxzz*x**2*z**2 + L_xxxxyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxx*x**3 + L_xxxxxxxy*x**3*y + &
      L_xxxxxxxz*x**3*z + L_xxxxxyyy*x*y**3 + L_xxxxxzzz*x*z**3 + &
      L_xxxxyyy*y**3 + L_xxxxyyyz*y**3*z + L_xxxxyzzz*y*z**3 + &
      L_xxxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxx*x**2 + L_xxxxxxy*x**2*y &
      + L_xxxxxxyz*x**2*y*z + L_xxxxxxz*x**2*z + L_xxxxxyy*x*y**2 + &
      L_xxxxxyyz*x*y**2*z + L_xxxxxyzz*x*y*z**2 + L_xxxxxzz*x*z**2 + &
      L_xxxxyy*y**2 + L_xxxxyyz*y**2*z + L_xxxxyzz*y*z**2 + L_xxxxzz*z &
      **2)
    Ls_xxxxz    = L_xxxxxyz*x*y + L_xxxxxyzz*x*y*z + L_xxxxxz*x + L_xxxxxzz*x*z + L_xxxxyz &
      *y + L_xxxxyzz*y*z + L_xxxxz + L_xxxxzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxz*x**3 + L_xxxxyyyz*y**3 + L_xxxxzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxyz*x**2*y + L_xxxxxxz*x**2 + L_xxxxxxzz*x**2*z + &
      L_xxxxxyyz*x*y**2 + L_xxxxxzzz*x*z**2 + L_xxxxyyz*y**2 + &
      L_xxxxyyzz*y**2*z + L_xxxxyzzz*y*z**2 + L_xxxxzzz*z**2)
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    Ls_xxxyyy   = L_xxxxyyy*x + L_xxxxyyyy*x*y + L_xxxxyyyz*x*z + L_xxxyyy + L_xxxyyyy*y + &
      L_xxxyyyyz*y*z + L_xxxyyyz*z + (1.0d0/2.0d0)*(L_xxxxxyyy*x**2 + &
      L_xxxyyyyy*y**2 + L_xxxyyyzz*z**2)
    Ls_xxxyyyz  = L_xxxxyyyz*x + L_xxxyyyyz*y + L_xxxyyyz + L_xxxyyyzz*z
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    Ls_xxxyy    = L_xxxxyy*x + L_xxxxyyy*x*y + L_xxxxyyyz*x*y*z + L_xxxxyyz*x*z + L_xxxyy &
      + L_xxxyyy*y + L_xxxyyyz*y*z + L_xxxyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxyy*x**3 + L_xxxyyyyy*y**3 + L_xxxyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxyy*x**2 + L_xxxxxyyy*x**2*y + L_xxxxxyyz*x**2*z + &
      L_xxxxyyyy*x*y**2 + L_xxxxyyzz*x*z**2 + L_xxxyyyy*y**2 + &
      L_xxxyyyyz*y**2*z + L_xxxyyyzz*y*z**2 + L_xxxyyzz*z**2)
    Ls_xxxyyz   = L_xxxxyyyz*x*y + L_xxxxyyz*x + L_xxxxyyzz*x*z + L_xxxyyyz*y + L_xxxyyyzz &
      *y*z + L_xxxyyz + L_xxxyyzz*z + (1.0d0/2.0d0)*(L_xxxxxyyz*x**2 + &
      L_xxxyyyyz*y**2 + L_xxxyyzzz*z**2)
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    Ls_xxxy     = L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyyz*x*y*z + L_xxxxyz*x*z + L_xxxy + &
      L_xxxyy*y + L_xxxyyz*y*z + L_xxxyz*z + (1.0d0/24.0d0)*(L_xxxxxxxy &
      *x**4 + L_xxxyyyyy*y**4 + L_xxxyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxyyy*x**2*y**2 + L_xxxxxyzz*x**2*z**2 + L_xxxyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxy*x**3 + L_xxxxxxyy*x**3*y + &
      L_xxxxxxyz*x**3*z + L_xxxxyyyy*x*y**3 + L_xxxxyzzz*x*z**3 + &
      L_xxxyyyy*y**3 + L_xxxyyyyz*y**3*z + L_xxxyyzzz*y*z**3 + &
      L_xxxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxy*x**2 + L_xxxxxyy*x**2*y &
      + L_xxxxxyyz*x**2*y*z + L_xxxxxyz*x**2*z + L_xxxxyyy*x*y**2 + &
      L_xxxxyyyz*x*y**2*z + L_xxxxyyzz*x*y*z**2 + L_xxxxyzz*x*z**2 + &
      L_xxxyyy*y**2 + L_xxxyyyz*y**2*z + L_xxxyyzz*y*z**2 + L_xxxyzz*z &
      **2)
    Ls_xxxyz    = L_xxxxyyz*x*y + L_xxxxyyzz*x*y*z + L_xxxxyz*x + L_xxxxyzz*x*z + L_xxxyyz &
      *y + L_xxxyyzz*y*z + L_xxxyz + L_xxxyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxyz*x**3 + L_xxxyyyyz*y**3 + L_xxxyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxyyz*x**2*y + L_xxxxxyz*x**2 + L_xxxxxyzz*x**2*z + &
      L_xxxxyyyz*x*y**2 + L_xxxxyzzz*x*z**2 + L_xxxyyyz*y**2 + &
      L_xxxyyyzz*y**2*z + L_xxxyyzzz*y*z**2 + L_xxxyzzz*z**2)
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    Ls_xxx      = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/120.0d0)*(L_xxxxxxxx*x**5 + &
      L_xxxyyyyy*y**5 + L_xxxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxxyy*x &
      **3*y**2 + L_xxxxxxzz*x**3*z**2 + L_xxxxxyyy*x**2*y**3 + &
      L_xxxxxzzz*x**2*z**3 + L_xxxyyyzz*y**3*z**2 + L_xxxyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxxyy*x**2*y**2 + L_xxxxxyyz*x**2*y**2*z &
      + L_xxxxxyzz*x**2*y*z**2 + L_xxxxxzz*x**2*z**2 + L_xxxxyyzz*x*y** &
      2*z**2 + L_xxxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxx*x**4 + &
      L_xxxxxxxy*x**4*y + L_xxxxxxxz*x**4*z + L_xxxxyyyy*x*y**4 + &
      L_xxxxzzzz*x*z**4 + L_xxxyyyy*y**4 + L_xxxyyyyz*y**4*z + &
      L_xxxyzzzz*y*z**4 + L_xxxzzzz*z**4) + (1.0d0/2.0d0)*(L_xxxxx*x**2 &
      + L_xxxxxy*x**2*y + L_xxxxxyz*x**2*y*z + L_xxxxxz*x**2*z + &
      L_xxxxyy*x*y**2 + L_xxxxyyz*x*y**2*z + L_xxxxyzz*x*y*z**2 + &
      L_xxxxzz*x*z**2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z** &
      2 + L_xxxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxxx*x**3 + L_xxxxxxy*x**3 &
      *y + L_xxxxxxyz*x**3*y*z + L_xxxxxxz*x**3*z + L_xxxxyyy*x*y**3 + &
      L_xxxxyyyz*x*y**3*z + L_xxxxyzzz*x*y*z**3 + L_xxxxzzz*x*z**3 + &
      L_xxxyyy*y**3 + L_xxxyyyz*y**3*z + L_xxxyzzz*y*z**3 + L_xxxzzz*z &
      **3)
    Ls_xxxz     = L_xxxxyz*x*y + L_xxxxyzz*x*y*z + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + &
      L_xxxyzz*y*z + L_xxxz + L_xxxzz*z + (1.0d0/24.0d0)*(L_xxxxxxxz*x &
      **4 + L_xxxyyyyz*y**4 + L_xxxzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxyyz*x**2*y**2 + L_xxxxxzzz*x**2*z**2 + L_xxxyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxyz*x**3*y + L_xxxxxxz*x**3 + &
      L_xxxxxxzz*x**3*z + L_xxxxyyyz*x*y**3 + L_xxxxzzzz*x*z**3 + &
      L_xxxyyyz*y**3 + L_xxxyyyzz*y**3*z + L_xxxyzzzz*y*z**3 + &
      L_xxxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxyz*x**2*y + L_xxxxxyzz*x &
      **2*y*z + L_xxxxxz*x**2 + L_xxxxxzz*x**2*z + L_xxxxyyz*x*y**2 + &
      L_xxxxyyzz*x*y**2*z + L_xxxxyzzz*x*y*z**2 + L_xxxxzzz*x*z**2 + &
      L_xxxyyz*y**2 + L_xxxyyzz*y**2*z + L_xxxyzzz*y*z**2 + L_xxxzzz*z &
      **2)
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    Ls_xxyyyy   = L_xxxyyyy*x + L_xxxyyyyy*x*y + L_xxxyyyyz*x*z + L_xxyyyy + L_xxyyyyy*y + &
      L_xxyyyyyz*y*z + L_xxyyyyz*z + (1.0d0/2.0d0)*(L_xxxxyyyy*x**2 + &
      L_xxyyyyyy*y**2 + L_xxyyyyzz*z**2)
    Ls_xxyyyyz  = L_xxxyyyyz*x + L_xxyyyyyz*y + L_xxyyyyz + L_xxyyyyzz*z
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    Ls_xxyyy    = L_xxxyyy*x + L_xxxyyyy*x*y + L_xxxyyyyz*x*y*z + L_xxxyyyz*x*z + L_xxyyy &
      + L_xxyyyy*y + L_xxyyyyz*y*z + L_xxyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxyyy*x**3 + L_xxyyyyyy*y**3 + L_xxyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxyyy*x**2 + L_xxxxyyyy*x**2*y + L_xxxxyyyz*x**2*z + &
      L_xxxyyyyy*x*y**2 + L_xxxyyyzz*x*z**2 + L_xxyyyyy*y**2 + &
      L_xxyyyyyz*y**2*z + L_xxyyyyzz*y*z**2 + L_xxyyyzz*z**2)
    Ls_xxyyyz   = L_xxxyyyyz*x*y + L_xxxyyyz*x + L_xxxyyyzz*x*z + L_xxyyyyz*y + L_xxyyyyzz &
      *y*z + L_xxyyyz + L_xxyyyzz*z + (1.0d0/2.0d0)*(L_xxxxyyyz*x**2 + &
      L_xxyyyyyz*y**2 + L_xxyyyzzz*z**2)
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    Ls_xxyy     = L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyyz*x*y*z + L_xxxyyz*x*z + L_xxyy + &
      L_xxyyy*y + L_xxyyyz*y*z + L_xxyyz*z + (1.0d0/24.0d0)*(L_xxxxxxyy &
      *x**4 + L_xxyyyyyy*y**4 + L_xxyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxyyyy*x**2*y**2 + L_xxxxyyzz*x**2*z**2 + L_xxyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxyy*x**3 + L_xxxxxyyy*x**3*y + &
      L_xxxxxyyz*x**3*z + L_xxxyyyyy*x*y**3 + L_xxxyyzzz*x*z**3 + &
      L_xxyyyyy*y**3 + L_xxyyyyyz*y**3*z + L_xxyyyzzz*y*z**3 + &
      L_xxyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyy*x**2 + L_xxxxyyy*x**2*y &
      + L_xxxxyyyz*x**2*y*z + L_xxxxyyz*x**2*z + L_xxxyyyy*x*y**2 + &
      L_xxxyyyyz*x*y**2*z + L_xxxyyyzz*x*y*z**2 + L_xxxyyzz*x*z**2 + &
      L_xxyyyy*y**2 + L_xxyyyyz*y**2*z + L_xxyyyzz*y*z**2 + L_xxyyzz*z &
      **2)
    Ls_xxyyz    = L_xxxyyyz*x*y + L_xxxyyyzz*x*y*z + L_xxxyyz*x + L_xxxyyzz*x*z + L_xxyyyz &
      *y + L_xxyyyzz*y*z + L_xxyyz + L_xxyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxyyz*x**3 + L_xxyyyyyz*y**3 + L_xxyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxyyyz*x**2*y + L_xxxxyyz*x**2 + L_xxxxyyzz*x**2*z + &
      L_xxxyyyyz*x*y**2 + L_xxxyyzzz*x*z**2 + L_xxyyyyz*y**2 + &
      L_xxyyyyzz*y**2*z + L_xxyyyzzz*y*z**2 + L_xxyyzzz*z**2)
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    Ls_xxy      = L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/120.0d0)*(L_xxxxxxxy*x**5 + &
      L_xxyyyyyy*y**5 + L_xxyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyyy*x &
      **3*y**2 + L_xxxxxyzz*x**3*z**2 + L_xxxxyyyy*x**2*y**3 + &
      L_xxxxyzzz*x**2*z**3 + L_xxyyyyzz*y**3*z**2 + L_xxyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxyyy*x**2*y**2 + L_xxxxyyyz*x**2*y**2*z &
      + L_xxxxyyzz*x**2*y*z**2 + L_xxxxyzz*x**2*z**2 + L_xxxyyyzz*x*y** &
      2*z**2 + L_xxyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxy*x**4 + &
      L_xxxxxxyy*x**4*y + L_xxxxxxyz*x**4*z + L_xxxyyyyy*x*y**4 + &
      L_xxxyzzzz*x*z**4 + L_xxyyyyy*y**4 + L_xxyyyyyz*y**4*z + &
      L_xxyyzzzz*y*z**4 + L_xxyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxxy*x** &
      3 + L_xxxxxyy*x**3*y + L_xxxxxyyz*x**3*y*z + L_xxxxxyz*x**3*z + &
      L_xxxyyyy*x*y**3 + L_xxxyyyyz*x*y**3*z + L_xxxyyzzz*x*y*z**3 + &
      L_xxxyzzz*x*z**3 + L_xxyyyy*y**3 + L_xxyyyyz*y**3*z + L_xxyyzzz*y &
      *z**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + L_xxxxyy*x &
      **2*y + L_xxxxyyz*x**2*y*z + L_xxxxyz*x**2*z + L_xxxyyy*x*y**2 + &
      L_xxxyyyz*x*y**2*z + L_xxxyyzz*x*y*z**2 + L_xxxyzz*x*z**2 + &
      L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz*z**2)
    Ls_xxyz     = L_xxxyyz*x*y + L_xxxyyzz*x*y*z + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + &
      L_xxyyzz*y*z + L_xxyz + L_xxyzz*z + (1.0d0/24.0d0)*(L_xxxxxxyz*x &
      **4 + L_xxyyyyyz*y**4 + L_xxyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxyyyz*x**2*y**2 + L_xxxxyzzz*x**2*z**2 + L_xxyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxyyz*x**3*y + L_xxxxxyz*x**3 + &
      L_xxxxxyzz*x**3*z + L_xxxyyyyz*x*y**3 + L_xxxyzzzz*x*z**3 + &
      L_xxyyyyz*y**3 + L_xxyyyyzz*y**3*z + L_xxyyzzzz*y*z**3 + &
      L_xxyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyyz*x**2*y + L_xxxxyyzz*x &
      **2*y*z + L_xxxxyz*x**2 + L_xxxxyzz*x**2*z + L_xxxyyyz*x*y**2 + &
      L_xxxyyyzz*x*y**2*z + L_xxxyyzzz*x*y*z**2 + L_xxxyzzz*x*z**2 + &
      L_xxyyyz*y**2 + L_xxyyyzz*y**2*z + L_xxyyzzz*y*z**2 + L_xxyzzz*z &
      **2)
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    Ls_xx       = L_xx + L_xxx*x + (1.0d0/8.0d0)*L_xxxxyyzz*x**2*y**2*z**2 + L_xxxy*x*y + &
      L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxx*x**6 + L_xxyyyyyy*y**6 + L_xxzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxxyyy*x**3*y**3 + L_xxxxxzzz*x**3*z** &
      3 + L_xxyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxxyy*x**4*y**2 &
      + L_xxxxxxzz*x**4*z**2 + L_xxxxyyyy*x**2*y**4 + L_xxxxzzzz*x**2*z &
      **4 + L_xxyyyyzz*y**4*z**2 + L_xxyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x**2*y* &
      z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + L_xxyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + L_xxxxxxxy*x**5*y + &
      L_xxxxxxxz*x**5*z + L_xxxyyyyy*x*y**5 + L_xxxzzzzz*x*z**5 + &
      L_xxyyyyy*y**5 + L_xxyyyyyz*y**5*z + L_xxyzzzzz*y*z**5 + &
      L_xxzzzzz*z**5) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*( &
      L_xxxxx*x**3 + L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x &
      **3*z + L_xxxyyy*x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 &
      + L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z &
      **3 + L_xxzzz*z**3) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxyz*x**4*y*z + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 &
      + L_xxxyyyyz*x*y**4*z + L_xxxyzzzz*x*y*z**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3*y**2 + L_xxxxxyyz*x**3*y**2 &
      *z + L_xxxxxyzz*x**3*y*z**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x** &
      2*y**3 + L_xxxxyyyz*x**2*y**3*z + L_xxxxyzzz*x**2*y*z**3 + &
      L_xxxxzzz*x**2*z**3 + L_xxxyyyzz*x*y**3*z**2 + L_xxxyyzzz*x*y**2* &
      z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3)
    Ls_xxz      = L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/120.0d0)*(L_xxxxxxxz*x**5 &
      + L_xxyyyyyz*y**5 + L_xxzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyyz &
      *x**3*y**2 + L_xxxxxzzz*x**3*z**2 + L_xxxxyyyz*x**2*y**3 + &
      L_xxxxzzzz*x**2*z**3 + L_xxyyyzzz*y**3*z**2 + L_xxyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxyyz*x**2*y**2 + L_xxxxyyzz*x**2*y**2*z &
      + L_xxxxyzzz*x**2*y*z**2 + L_xxxxzzz*x**2*z**2 + L_xxxyyzzz*x*y** &
      2*z**2 + L_xxyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxyz*x**4*y &
      + L_xxxxxxz*x**4 + L_xxxxxxzz*x**4*z + L_xxxyyyyz*x*y**4 + &
      L_xxxzzzzz*x*z**4 + L_xxyyyyz*y**4 + L_xxyyyyzz*y**4*z + &
      L_xxyzzzzz*y*z**4 + L_xxzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxxyz*x &
      **3*y + L_xxxxxyzz*x**3*y*z + L_xxxxxz*x**3 + L_xxxxxzz*x**3*z + &
      L_xxxyyyz*x*y**3 + L_xxxyyyzz*x*y**3*z + L_xxxyzzzz*x*y*z**3 + &
      L_xxxzzzz*x*z**3 + L_xxyyyz*y**3 + L_xxyyyzz*y**3*z + L_xxyzzzz*y &
      *z**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2*y + &
      L_xxxxyzz*x**2*y*z + L_xxxxz*x**2 + L_xxxxzz*x**2*z + L_xxxyyz*x* &
      y**2 + L_xxxyyzz*x*y**2*z + L_xxxyzzz*x*y*z**2 + L_xxxzzz*x*z**2 &
      + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z**2 + L_xxzzz*z**2 &
      )
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    Ls_xyyyyy   = L_xxyyyyy*x + L_xxyyyyyy*x*y + L_xxyyyyyz*x*z + L_xyyyyy + L_xyyyyyy*y + &
      L_xyyyyyyz*y*z + L_xyyyyyz*z + (1.0d0/2.0d0)*(L_xxxyyyyy*x**2 + &
      L_xyyyyyyy*y**2 + L_xyyyyyzz*z**2)
    Ls_xyyyyyz  = L_xxyyyyyz*x + L_xyyyyyyz*y + L_xyyyyyz + L_xyyyyyzz*z
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    Ls_xyyyy    = L_xxyyyy*x + L_xxyyyyy*x*y + L_xxyyyyyz*x*y*z + L_xxyyyyz*x*z + L_xyyyy &
      + L_xyyyyy*y + L_xyyyyyz*y*z + L_xyyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxyyyy*x**3 + L_xyyyyyyy*y**3 + L_xyyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxyyyy*x**2 + L_xxxyyyyy*x**2*y + L_xxxyyyyz*x**2*z + &
      L_xxyyyyyy*x*y**2 + L_xxyyyyzz*x*z**2 + L_xyyyyyy*y**2 + &
      L_xyyyyyyz*y**2*z + L_xyyyyyzz*y*z**2 + L_xyyyyzz*z**2)
    Ls_xyyyyz   = L_xxyyyyyz*x*y + L_xxyyyyz*x + L_xxyyyyzz*x*z + L_xyyyyyz*y + L_xyyyyyzz &
      *y*z + L_xyyyyz + L_xyyyyzz*z + (1.0d0/2.0d0)*(L_xxxyyyyz*x**2 + &
      L_xyyyyyyz*y**2 + L_xyyyyzzz*z**2)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    Ls_xyyy     = L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyyz*x*y*z + L_xxyyyz*x*z + L_xyyy + &
      L_xyyyy*y + L_xyyyyz*y*z + L_xyyyz*z + (1.0d0/24.0d0)*(L_xxxxxyyy &
      *x**4 + L_xyyyyyyy*y**4 + L_xyyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyyyyy*x**2*y**2 + L_xxxyyyzz*x**2*z**2 + L_xyyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxyyy*x**3 + L_xxxxyyyy*x**3*y + &
      L_xxxxyyyz*x**3*z + L_xxyyyyyy*x*y**3 + L_xxyyyzzz*x*z**3 + &
      L_xyyyyyy*y**3 + L_xyyyyyyz*y**3*z + L_xyyyyzzz*y*z**3 + &
      L_xyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyy*x**2 + L_xxxyyyy*x**2*y &
      + L_xxxyyyyz*x**2*y*z + L_xxxyyyz*x**2*z + L_xxyyyyy*x*y**2 + &
      L_xxyyyyyz*x*y**2*z + L_xxyyyyzz*x*y*z**2 + L_xxyyyzz*x*z**2 + &
      L_xyyyyy*y**2 + L_xyyyyyz*y**2*z + L_xyyyyzz*y*z**2 + L_xyyyzz*z &
      **2)
    Ls_xyyyz    = L_xxyyyyz*x*y + L_xxyyyyzz*x*y*z + L_xxyyyz*x + L_xxyyyzz*x*z + L_xyyyyz &
      *y + L_xyyyyzz*y*z + L_xyyyz + L_xyyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxyyyz*x**3 + L_xyyyyyyz*y**3 + L_xyyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxyyyyz*x**2*y + L_xxxyyyz*x**2 + L_xxxyyyzz*x**2*z + &
      L_xxyyyyyz*x*y**2 + L_xxyyyzzz*x*z**2 + L_xyyyyyz*y**2 + &
      L_xyyyyyzz*y**2*z + L_xyyyyzzz*y*z**2 + L_xyyyzzz*z**2)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    Ls_xyy      = L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/120.0d0)*(L_xxxxxxyy*x**5 + &
      L_xyyyyyyy*y**5 + L_xyyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyyy*x &
      **3*y**2 + L_xxxxyyzz*x**3*z**2 + L_xxxyyyyy*x**2*y**3 + &
      L_xxxyyzzz*x**2*z**3 + L_xyyyyyzz*y**3*z**2 + L_xyyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxyyyy*x**2*y**2 + L_xxxyyyyz*x**2*y**2*z &
      + L_xxxyyyzz*x**2*y*z**2 + L_xxxyyzz*x**2*z**2 + L_xxyyyyzz*x*y** &
      2*z**2 + L_xyyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxyy*x**4 + &
      L_xxxxxyyy*x**4*y + L_xxxxxyyz*x**4*z + L_xxyyyyyy*x*y**4 + &
      L_xxyyzzzz*x*z**4 + L_xyyyyyy*y**4 + L_xyyyyyyz*y**4*z + &
      L_xyyyzzzz*y*z**4 + L_xyyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxyy*x** &
      3 + L_xxxxyyy*x**3*y + L_xxxxyyyz*x**3*y*z + L_xxxxyyz*x**3*z + &
      L_xxyyyyy*x*y**3 + L_xxyyyyyz*x*y**3*z + L_xxyyyzzz*x*y*z**3 + &
      L_xxyyzzz*x*z**3 + L_xyyyyy*y**3 + L_xyyyyyz*y**3*z + L_xyyyzzz*y &
      *z**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + L_xxxyyy*x &
      **2*y + L_xxxyyyz*x**2*y*z + L_xxxyyz*x**2*z + L_xxyyyy*x*y**2 + &
      L_xxyyyyz*x*y**2*z + L_xxyyyzz*x*y*z**2 + L_xxyyzz*x*z**2 + &
      L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz*z**2)
    Ls_xyyz     = L_xxyyyz*x*y + L_xxyyyzz*x*y*z + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + &
      L_xyyyzz*y*z + L_xyyz + L_xyyzz*z + (1.0d0/24.0d0)*(L_xxxxxyyz*x &
      **4 + L_xyyyyyyz*y**4 + L_xyyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyyyyz*x**2*y**2 + L_xxxyyzzz*x**2*z**2 + L_xyyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxyyyz*x**3*y + L_xxxxyyz*x**3 + &
      L_xxxxyyzz*x**3*z + L_xxyyyyyz*x*y**3 + L_xxyyzzzz*x*z**3 + &
      L_xyyyyyz*y**3 + L_xyyyyyzz*y**3*z + L_xyyyzzzz*y*z**3 + &
      L_xyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyyz*x**2*y + L_xxxyyyzz*x &
      **2*y*z + L_xxxyyz*x**2 + L_xxxyyzz*x**2*z + L_xxyyyyz*x*y**2 + &
      L_xxyyyyzz*x*y**2*z + L_xxyyyzzz*x*y*z**2 + L_xxyyzzz*x*z**2 + &
      L_xyyyyz*y**2 + L_xyyyyzz*y**2*z + L_xyyyzzz*y*z**2 + L_xyyzzz*z &
      **2)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    Ls_xy       = (1.0d0/8.0d0)*L_xxxyyyzz*x**2*y**2*z**2 + L_xxy*x + L_xxyy*x*y + L_xxyyz &
      *x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxy*x**6 + L_xyyyyyyy*y**6 + L_xyzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxyyyy*x**3*y**3 + L_xxxxyzzz*x**3*z** &
      3 + L_xyyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyyy*x**4*y**2 &
      + L_xxxxxyzz*x**4*z**2 + L_xxxyyyyy*x**2*y**4 + L_xxxyzzzz*x**2*z &
      **4 + L_xyyyyyzz*y**4*z**2 + L_xyyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x**2*y* &
      z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + L_xyyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + L_xxxxxxyy*x**5*y + &
      L_xxxxxxyz*x**5*z + L_xxyyyyyy*x*y**5 + L_xxyzzzzz*x*z**5 + &
      L_xyyyyyy*y**5 + L_xyyyyyyz*y**5*z + L_xyyzzzzz*y*z**5 + &
      L_xyzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x**4* &
      y + L_xxxxxyyz*x**4*y*z + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + &
      L_xxyyyyyz*x*y**4*z + L_xxyyzzzz*x*y*z**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3*y**2 + L_xxxxyyyz*x**3*y**2 &
      *z + L_xxxxyyzz*x**3*y*z**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x** &
      2*y**3 + L_xxxyyyyz*x**2*y**3*z + L_xxxyyzzz*x**2*y*z**3 + &
      L_xxxyzzz*x**2*z**3 + L_xxyyyyzz*x*y**3*z**2 + L_xxyyyzzz*x*y**2* &
      z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3)
    Ls_xyz      = L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/120.0d0)*(L_xxxxxxyz*x**5 &
      + L_xyyyyyyz*y**5 + L_xyzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyyz &
      *x**3*y**2 + L_xxxxyzzz*x**3*z**2 + L_xxxyyyyz*x**2*y**3 + &
      L_xxxyzzzz*x**2*z**3 + L_xyyyyzzz*y**3*z**2 + L_xyyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxyyyz*x**2*y**2 + L_xxxyyyzz*x**2*y**2*z &
      + L_xxxyyzzz*x**2*y*z**2 + L_xxxyzzz*x**2*z**2 + L_xxyyyzzz*x*y** &
      2*z**2 + L_xyyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxyyz*x**4*y &
      + L_xxxxxyz*x**4 + L_xxxxxyzz*x**4*z + L_xxyyyyyz*x*y**4 + &
      L_xxyzzzzz*x*z**4 + L_xyyyyyz*y**4 + L_xyyyyyzz*y**4*z + &
      L_xyyzzzzz*y*z**4 + L_xyzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxyyz*x &
      **3*y + L_xxxxyyzz*x**3*y*z + L_xxxxyz*x**3 + L_xxxxyzz*x**3*z + &
      L_xxyyyyz*x*y**3 + L_xxyyyyzz*x*y**3*z + L_xxyyzzzz*x*y*z**3 + &
      L_xxyzzzz*x*z**3 + L_xyyyyz*y**3 + L_xyyyyzz*y**3*z + L_xyyzzzz*y &
      *z**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2*y + &
      L_xxxyyzz*x**2*y*z + L_xxxyz*x**2 + L_xxxyzz*x**2*z + L_xxyyyz*x* &
      y**2 + L_xxyyyzz*x*y**2*z + L_xxyyzzz*x*y*z**2 + L_xxyzzz*x*z**2 &
      + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z**2 + L_xyzzz*z**2 &
      )
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    Ls_x        = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxx*x**7 + L_xyyyyyyy*y**7 + L_xzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxxyy*x**5*y**2 + L_xxxxxxzz*x**5*z**2 + &
      L_xxxyyyyy*x**2*y**5 + L_xxxzzzzz*x**2*z**5 + L_xyyyyyzz*y**5*z** &
      2 + L_xyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxxyyy*x**4*y**3 &
      + L_xxxxxzzz*x**4*z**3 + L_xxxxyyyy*x**3*y**4 + L_xxxxzzzz*x**3*z &
      **4 + L_xyyyyzzz*y**4*z**3 + L_xyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxyyyz*x**3*y**3*z + &
      L_xxxxyzzz*x**3*y*z**3 + L_xxxxzzz*x**3*z**3 + L_xxyyyzzz*x*y**3* &
      z**3 + L_xyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxx*x**6 + L_xxxxxxxy*x**6*y + L_xxxxxxxz*x**6*z + &
      L_xxyyyyyy*x*y**6 + L_xxzzzzzz*x*z**6 + L_xyyyyyy*y**6 + &
      L_xyyyyyyz*y**6*z + L_xyzzzzzz*y*z**6 + L_xzzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/120.0d0)* &
      (L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxyz*x**5*y*z + &
      L_xxxxxxz*x**5*z + L_xxyyyyy*x*y**5 + L_xxyyyyyz*x*y**5*z + &
      L_xxyzzzzz*x*y*z**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxxyy*x**4*y**2 + L_xxxxxyyz*x**4*y**2*z + &
      L_xxxxxyzz*x**4*y*z**2 + L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y** &
      4 + L_xxxyyyyz*x**2*y**4*z + L_xxxyzzzz*x**2*y*z**4 + L_xxxzzzz*x &
      **2*z**4 + L_xxyyyyzz*x*y**4*z**2 + L_xxyyzzzz*x*y**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
      L_xxxxyy*x**3*y**2 + L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z** &
      2 + L_xxxxzz*x**3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3 &
      *z + L_xxxyzzz*x**2*y*z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y** &
      3*z**2 + L_xxyyzzz*x*y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y &
      **2*z**3) + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xxxxxy*x**4*y + &
      L_xxxxxyz*x**4*y*z + L_xxxxxz*x**4*z + L_xxxxyyzz*x**3*y**2*z**2 &
      + L_xxxyyyzz*x**2*y**3*z**2 + L_xxxyyzzz*x**2*y**2*z**3 + &
      L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 + &
      L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z** &
      4 + L_xzzzz*z**4)
    Ls_xz       = (1.0d0/8.0d0)*L_xxxyyzzz*x**2*y**2*z**2 + L_xxyz*x*y + L_xxyzz*x*y*z + &
      L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxz*x**6 + L_xyyyyyyz*y**6 + L_xzzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxyyyz*x**3*y**3 + L_xxxxzzzz*x**3*z** &
      3 + L_xyyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyyz*x**4*y**2 &
      + L_xxxxxzzz*x**4*z**2 + L_xxxyyyyz*x**2*y**4 + L_xxxzzzzz*x**2*z &
      **4 + L_xyyyyzzz*y**4*z**2 + L_xyyzzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y* &
      z**2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxyz*x**5*y + L_xxxxxxz*x**5 + &
      L_xxxxxxzz*x**5*z + L_xxyyyyyz*x*y**5 + L_xxzzzzzz*x*z**5 + &
      L_xyyyyyz*y**5 + L_xyyyyyzz*y**5*z + L_xyzzzzzz*y*z**5 + &
      L_xzzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxyzz*x &
      **4*y*z + L_xxxxxz*x**4 + L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + &
      L_xxyyyyzz*x*y**4*z + L_xxyzzzzz*x*y*z**4 + L_xxzzzzz*x*z**4 + &
      L_xyyyyz*y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + L_xxxxyyzz*x**3*y**2 &
      *z + L_xxxxyzzz*x**3*y*z**2 + L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x** &
      2*y**3 + L_xxxyyyzz*x**2*y**3*z + L_xxxyzzzz*x**2*y*z**3 + &
      L_xxxzzzz*x**2*z**3 + L_xxyyyzzz*x*y**3*z**2 + L_xxyyzzzz*x*y**2* &
      z**3 + L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/6.0d0) &
      *(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 + L_xxxxzz* &
      x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + L_xxyzzzz*x*y*z** &
      3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y &
      *z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz* &
      x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + &
      L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y &
      **2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    Ls_yyyyyy   = L_xyyyyyy*x + L_xyyyyyyy*x*y + L_xyyyyyyz*x*z + L_yyyyyy + L_yyyyyyy*y + &
      L_yyyyyyyz*y*z + L_yyyyyyz*z + (1.0d0/2.0d0)*(L_xxyyyyyy*x**2 + &
      L_yyyyyyyy*y**2 + L_yyyyyyzz*z**2)
    Ls_yyyyyyz  = L_xyyyyyyz*x + L_yyyyyyyz*y + L_yyyyyyz + L_yyyyyyzz*z
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    Ls_yyyyy    = L_xyyyyy*x + L_xyyyyyy*x*y + L_xyyyyyyz*x*y*z + L_xyyyyyz*x*z + L_yyyyy &
      + L_yyyyyy*y + L_yyyyyyz*y*z + L_yyyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxyyyyy*x**3 + L_yyyyyyyy*y**3 + L_yyyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyyyyy*x**2 + L_xxyyyyyy*x**2*y + L_xxyyyyyz*x**2*z + &
      L_xyyyyyyy*x*y**2 + L_xyyyyyzz*x*z**2 + L_yyyyyyy*y**2 + &
      L_yyyyyyyz*y**2*z + L_yyyyyyzz*y*z**2 + L_yyyyyzz*z**2)
    Ls_yyyyyz   = L_xyyyyyyz*x*y + L_xyyyyyz*x + L_xyyyyyzz*x*z + L_yyyyyyz*y + L_yyyyyyzz &
      *y*z + L_yyyyyz + L_yyyyyzz*z + (1.0d0/2.0d0)*(L_xxyyyyyz*x**2 + &
      L_yyyyyyyz*y**2 + L_yyyyyzzz*z**2)
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    Ls_yyyy     = L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyyz*x*y*z + L_xyyyyz*x*z + L_yyyy + &
      L_yyyyy*y + L_yyyyyz*y*z + L_yyyyz*z + (1.0d0/24.0d0)*(L_xxxxyyyy &
      *x**4 + L_yyyyyyyy*y**4 + L_yyyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyyyyy*x**2*y**2 + L_xxyyyyzz*x**2*z**2 + L_yyyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxyyyy*x**3 + L_xxxyyyyy*x**3*y + &
      L_xxxyyyyz*x**3*z + L_xyyyyyyy*x*y**3 + L_xyyyyzzz*x*z**3 + &
      L_yyyyyyy*y**3 + L_yyyyyyyz*y**3*z + L_yyyyyzzz*y*z**3 + &
      L_yyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyy*x**2 + L_xxyyyyy*x**2*y &
      + L_xxyyyyyz*x**2*y*z + L_xxyyyyz*x**2*z + L_xyyyyyy*x*y**2 + &
      L_xyyyyyyz*x*y**2*z + L_xyyyyyzz*x*y*z**2 + L_xyyyyzz*x*z**2 + &
      L_yyyyyy*y**2 + L_yyyyyyz*y**2*z + L_yyyyyzz*y*z**2 + L_yyyyzz*z &
      **2)
    Ls_yyyyz    = L_xyyyyyz*x*y + L_xyyyyyzz*x*y*z + L_xyyyyz*x + L_xyyyyzz*x*z + L_yyyyyz &
      *y + L_yyyyyzz*y*z + L_yyyyz + L_yyyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxyyyyz*x**3 + L_yyyyyyyz*y**3 + L_yyyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyyyyyz*x**2*y + L_xxyyyyz*x**2 + L_xxyyyyzz*x**2*z + &
      L_xyyyyyyz*x*y**2 + L_xyyyyzzz*x*z**2 + L_yyyyyyz*y**2 + &
      L_yyyyyyzz*y**2*z + L_yyyyyzzz*y*z**2 + L_yyyyzzz*z**2)
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    Ls_yyy      = L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/120.0d0)*(L_xxxxxyyy*x**5 + &
      L_yyyyyyyy*y**5 + L_yyyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyyy*x &
      **3*y**2 + L_xxxyyyzz*x**3*z**2 + L_xxyyyyyy*x**2*y**3 + &
      L_xxyyyzzz*x**2*z**3 + L_yyyyyyzz*y**3*z**2 + L_yyyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxyyyyy*x**2*y**2 + L_xxyyyyyz*x**2*y**2*z &
      + L_xxyyyyzz*x**2*y*z**2 + L_xxyyyzz*x**2*z**2 + L_xyyyyyzz*x*y** &
      2*z**2 + L_yyyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyyy*x**4 + &
      L_xxxxyyyy*x**4*y + L_xxxxyyyz*x**4*z + L_xyyyyyyy*x*y**4 + &
      L_xyyyzzzz*x*z**4 + L_yyyyyyy*y**4 + L_yyyyyyyz*y**4*z + &
      L_yyyyzzzz*y*z**4 + L_yyyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyyy*x** &
      3 + L_xxxyyyy*x**3*y + L_xxxyyyyz*x**3*y*z + L_xxxyyyz*x**3*z + &
      L_xyyyyyy*x*y**3 + L_xyyyyyyz*x*y**3*z + L_xyyyyzzz*x*y*z**3 + &
      L_xyyyzzz*x*z**3 + L_yyyyyy*y**3 + L_yyyyyyz*y**3*z + L_yyyyzzz*y &
      *z**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + L_xxyyyy*x &
      **2*y + L_xxyyyyz*x**2*y*z + L_xxyyyz*x**2*z + L_xyyyyy*x*y**2 + &
      L_xyyyyyz*x*y**2*z + L_xyyyyzz*x*y*z**2 + L_xyyyzz*x*z**2 + &
      L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz*z**2)
    Ls_yyyz     = L_xyyyyz*x*y + L_xyyyyzz*x*y*z + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + &
      L_yyyyzz*y*z + L_yyyz + L_yyyzz*z + (1.0d0/24.0d0)*(L_xxxxyyyz*x &
      **4 + L_yyyyyyyz*y**4 + L_yyyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyyyyz*x**2*y**2 + L_xxyyyzzz*x**2*z**2 + L_yyyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxyyyyz*x**3*y + L_xxxyyyz*x**3 + &
      L_xxxyyyzz*x**3*z + L_xyyyyyyz*x*y**3 + L_xyyyzzzz*x*z**3 + &
      L_yyyyyyz*y**3 + L_yyyyyyzz*y**3*z + L_yyyyzzzz*y*z**3 + &
      L_yyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyyz*x**2*y + L_xxyyyyzz*x &
      **2*y*z + L_xxyyyz*x**2 + L_xxyyyzz*x**2*z + L_xyyyyyz*x*y**2 + &
      L_xyyyyyzz*x*y**2*z + L_xyyyyzzz*x*y*z**2 + L_xyyyzzz*x*z**2 + &
      L_yyyyyz*y**2 + L_yyyyyzz*y**2*z + L_yyyyzzz*y*z**2 + L_yyyzzz*z &
      **2)
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    Ls_yy       = (1.0d0/8.0d0)*L_xxyyyyzz*x**2*y**2*z**2 + L_xyy*x + L_xyyy*x*y + L_xyyyz &
      *x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxyy*x**6 + L_yyyyyyyy*y**6 + L_yyzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxyyyyy*x**3*y**3 + L_xxxyyzzz*x**3*z** &
      3 + L_yyyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyyy*x**4*y**2 &
      + L_xxxxyyzz*x**4*z**2 + L_xxyyyyyy*x**2*y**4 + L_xxyyzzzz*x**2*z &
      **4 + L_yyyyyyzz*y**4*z**2 + L_yyyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x**2*y* &
      z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + L_yyyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + L_xxxxxyyy*x**5*y + &
      L_xxxxxyyz*x**5*z + L_xyyyyyyy*x*y**5 + L_xyyzzzzz*x*z**5 + &
      L_yyyyyyy*y**5 + L_yyyyyyyz*y**5*z + L_yyyzzzzz*y*z**5 + &
      L_yyzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x**4* &
      y + L_xxxxyyyz*x**4*y*z + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + &
      L_xyyyyyyz*x*y**4*z + L_xyyyzzzz*x*y*z**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3*y**2 + L_xxxyyyyz*x**3*y**2 &
      *z + L_xxxyyyzz*x**3*y*z**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x** &
      2*y**3 + L_xxyyyyyz*x**2*y**3*z + L_xxyyyzzz*x**2*y*z**3 + &
      L_xxyyzzz*x**2*z**3 + L_xyyyyyzz*x*y**3*z**2 + L_xyyyyzzz*x*y**2* &
      z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3)
    Ls_yyz      = L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/120.0d0)*(L_xxxxxyyz*x**5 &
      + L_yyyyyyyz*y**5 + L_yyzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyyz &
      *x**3*y**2 + L_xxxyyzzz*x**3*z**2 + L_xxyyyyyz*x**2*y**3 + &
      L_xxyyzzzz*x**2*z**3 + L_yyyyyzzz*y**3*z**2 + L_yyyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxyyyyz*x**2*y**2 + L_xxyyyyzz*x**2*y**2*z &
      + L_xxyyyzzz*x**2*y*z**2 + L_xxyyzzz*x**2*z**2 + L_xyyyyzzz*x*y** &
      2*z**2 + L_yyyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyyyz*x**4*y &
      + L_xxxxyyz*x**4 + L_xxxxyyzz*x**4*z + L_xyyyyyyz*x*y**4 + &
      L_xyyzzzzz*x*z**4 + L_yyyyyyz*y**4 + L_yyyyyyzz*y**4*z + &
      L_yyyzzzzz*y*z**4 + L_yyzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyyyz*x &
      **3*y + L_xxxyyyzz*x**3*y*z + L_xxxyyz*x**3 + L_xxxyyzz*x**3*z + &
      L_xyyyyyz*x*y**3 + L_xyyyyyzz*x*y**3*z + L_xyyyzzzz*x*y*z**3 + &
      L_xyyzzzz*x*z**3 + L_yyyyyz*y**3 + L_yyyyyzz*y**3*z + L_yyyzzzz*y &
      *z**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2*y + &
      L_xxyyyzz*x**2*y*z + L_xxyyz*x**2 + L_xxyyzz*x**2*z + L_xyyyyz*x* &
      y**2 + L_xyyyyzz*x*y**2*z + L_xyyyzzz*x*y*z**2 + L_xyyzzz*x*z**2 &
      + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z**2 + L_yyzzz*z**2 &
      )
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    Ls_y        = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxy*x**7 + L_yyyyyyyy*y**7 + L_yzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyy*x**5*y**2 + L_xxxxxyzz*x**5*z**2 + &
      L_xxyyyyyy*x**2*y**5 + L_xxyzzzzz*x**2*z**5 + L_yyyyyyzz*y**5*z** &
      2 + L_yyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyy*x**4*y**3 &
      + L_xxxxyzzz*x**4*z**3 + L_xxxyyyyy*x**3*y**4 + L_xxxyzzzz*x**3*z &
      **4 + L_yyyyyzzz*y**4*z**3 + L_yyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyyyyz*x**3*y**3*z + &
      L_xxxyyzzz*x**3*y*z**3 + L_xxxyzzz*x**3*z**3 + L_xyyyyzzz*x*y**3* &
      z**3 + L_yyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxy*x**6 + L_xxxxxxyy*x**6*y + L_xxxxxxyz*x**6*z + &
      L_xyyyyyyy*x*y**6 + L_xyzzzzzz*x*z**6 + L_yyyyyyy*y**6 + &
      L_yyyyyyyz*y**6*z + L_yyzzzzzz*y*z**6 + L_yzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyyz*x**5*y*z &
      + L_xxxxxyz*x**5*z + L_xyyyyyy*x*y**5 + L_xyyyyyyz*x*y**5*z + &
      L_xyyzzzzz*x*y*z**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + &
      L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x* &
      y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz* &
      y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y &
      + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y &
      **2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y &
      **2*z + L_yyzz*y*z**2 + L_yzz*z**2) + (1.0d0/48.0d0)*(L_xxxxyyy*x &
      **4*y**2 + L_xxxxyyyz*x**4*y**2*z + L_xxxxyyzz*x**4*y*z**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyyyyyz*x**2*y**4* &
      z + L_xxyyzzzz*x**2*y*z**4 + L_xxyzzzz*x**2*z**4 + L_xyyyyyzz*x*y &
      **4*z**2 + L_xyyyzzzz*x*y**2*z**4 + L_yyyyyzz*y**4*z**2 + &
      L_yyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xxxyyyzz*x**3*y**2*z**2 + L_xxyyyyzz*x**2*y** &
      3*z**2 + L_xxyyyzzz*x**2*y**2*z**3 + L_xyyyyy*x*y**4 + L_xyyyyyz* &
      x*y**4*z + L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + &
      L_yyyyyz*y**4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4)
    Ls_yz       = (1.0d0/8.0d0)*L_xxyyyzzz*x**2*y**2*z**2 + L_xyyz*x*y + L_xyyzz*x*y*z + &
      L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxyz*x**6 + L_yyyyyyyz*y**6 + L_yzzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxyyyyz*x**3*y**3 + L_xxxyzzzz*x**3*z** &
      3 + L_yyyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyyz*x**4*y**2 &
      + L_xxxxyzzz*x**4*z**2 + L_xxyyyyyz*x**2*y**4 + L_xxyzzzzz*x**2*z &
      **4 + L_yyyyyzzz*y**4*z**2 + L_yyyzzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y* &
      z**2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxyyz*x**5*y + L_xxxxxyz*x**5 + &
      L_xxxxxyzz*x**5*z + L_xyyyyyyz*x*y**5 + L_xyzzzzzz*x*z**5 + &
      L_yyyyyyz*y**5 + L_yyyyyyzz*y**5*z + L_yyzzzzzz*y*z**5 + &
      L_yzzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyyzz*x &
      **4*y*z + L_xxxxyz*x**4 + L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + &
      L_xyyyyyzz*x*y**4*z + L_xyyzzzzz*x*y*z**4 + L_xyzzzzz*x*z**4 + &
      L_yyyyyz*y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + L_xxxyyyzz*x**3*y**2 &
      *z + L_xxxyyzzz*x**3*y*z**2 + L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x** &
      2*y**3 + L_xxyyyyzz*x**2*y**3*z + L_xxyyzzzz*x**2*y*z**3 + &
      L_xxyzzzz*x**2*z**3 + L_xyyyyzzz*x*y**3*z**2 + L_xyyyzzzz*x*y**2* &
      z**3 + L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/6.0d0) &
      *(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 + L_xxxyzz* &
      x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + L_xyyzzzz*x*y*z** &
      3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y &
      *z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz* &
      x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + &
      L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y &
      **2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    Ls_z        = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxz*x**7 + L_yyyyyyyz*y**7 + L_zzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyz*x**5*y**2 + L_xxxxxzzz*x**5*z**2 + &
      L_xxyyyyyz*x**2*y**5 + L_xxzzzzzz*x**2*z**5 + L_yyyyyzzz*y**5*z** &
      2 + L_yyzzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyz*x**4*y**3 &
      + L_xxxxzzzz*x**4*z**3 + L_xxxyyyyz*x**3*y**4 + L_xxxzzzzz*x**3*z &
      **4 + L_yyyyzzzz*y**4*z**3 + L_yyyzzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxyyyzz*x**3*y**3*z + &
      L_xxxyzzzz*x**3*y*z**3 + L_xxxzzzz*x**3*z**3 + L_xyyyzzzz*x*y**3* &
      z**3 + L_yyyzzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxyz*x**6*y + L_xxxxxxz*x**6 + L_xxxxxxzz*x**6*z + &
      L_xyyyyyyz*x*y**6 + L_xzzzzzzz*x*z**6 + L_yyyyyyz*y**6 + &
      L_yyyyyyzz*y**6*z + L_yzzzzzzz*y*z**6 + L_zzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxyzz*x**5*y*z + L_xxxxxz*x**5 &
      + L_xxxxxzz*x**5*z + L_xyyyyyz*x*y**5 + L_xyyyyyzz*x*y**5*z + &
      L_xyzzzzzz*x*y*z**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxyyz*x**4*y**2 + L_xxxxyyzz*x**4*y**2*z + &
      L_xxxxyzzz*x**4*y*z**2 + L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y** &
      4 + L_xxyyyyzz*x**2*y**4*z + L_xxyzzzzz*x**2*y*z**4 + L_xxzzzzz*x &
      **2*z**4 + L_xyyyyzzz*x*y**4*z**2 + L_xyyzzzzz*x*y**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
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
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + L_xxxxzz*x &
      **4*z + L_xxxyyzzz*x**3*y**2*z**2 + L_xxyyyzzz*x**2*y**3*z**2 + &
      L_xxyyzzzz*x**2*y**2*z**3 + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z &
      + L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz* &
      y**4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
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
#undef  L_yyyyy             
#undef  Ls_yyyyy            
#undef  L_yyyyz             
#undef  Ls_yyyyz            
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
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
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
#undef  Ls_xyyyyyyz         
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L
    
! OPS  357*ADD + 39*DIV + 756*MUL + 84*NEG + 504*POW = 1740  (2165 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz,&
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
                L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
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
    L_xxxxxyzz = -(L_xxxxxxxy + L_xxxxxyyy)
    L_xxxxxzzz = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz = -(L_xxxxxxyy + L_xxxxyyyy)
    L_xxxxyzzz = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz = -(L_xxxxxyyy + L_xxxyyyyy)
    L_xxxyyzzz = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz = -(L_xxxxyyyy + L_xxyyyyyy)
    L_xxyyyzzz = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz = -(L_xxxyyyyy + L_xyyyyyyy)
    L_xyyyyzzz = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz = -(L_xxxzzzzz + L_xyyzzzzz)
    Phi_x      = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxx*x**7 + L_xyyyyyyy*y**7 + L_xzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxxyy*x**5*y**2 + L_xxxxxxzz*x**5*z**2 + &
      L_xxxyyyyy*x**2*y**5 + L_xxxzzzzz*x**2*z**5 + L_xyyyyyzz*y**5*z** &
      2 + L_xyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxxyyy*x**4*y**3 &
      + L_xxxxxzzz*x**4*z**3 + L_xxxxyyyy*x**3*y**4 + L_xxxxzzzz*x**3*z &
      **4 + L_xyyyyzzz*y**4*z**3 + L_xyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxyyyz*x**3*y**3*z + &
      L_xxxxyzzz*x**3*y*z**3 + L_xxxxzzz*x**3*z**3 + L_xxyyyzzz*x*y**3* &
      z**3 + L_xyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxx*x**6 + L_xxxxxxxy*x**6*y + L_xxxxxxxz*x**6*z + &
      L_xxyyyyyy*x*y**6 + L_xxzzzzzz*x*z**6 + L_xyyyyyy*y**6 + &
      L_xyyyyyyz*y**6*z + L_xyzzzzzz*y*z**6 + L_xzzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/120.0d0)* &
      (L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxyz*x**5*y*z + &
      L_xxxxxxz*x**5*z + L_xxyyyyy*x*y**5 + L_xxyyyyyz*x*y**5*z + &
      L_xxyzzzzz*x*y*z**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxxyy*x**4*y**2 + L_xxxxxyyz*x**4*y**2*z + &
      L_xxxxxyzz*x**4*y*z**2 + L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y** &
      4 + L_xxxyyyyz*x**2*y**4*z + L_xxxyzzzz*x**2*y*z**4 + L_xxxzzzz*x &
      **2*z**4 + L_xxyyyyzz*x*y**4*z**2 + L_xxyyzzzz*x*y**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
      L_xxxxyy*x**3*y**2 + L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z** &
      2 + L_xxxxzz*x**3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3 &
      *z + L_xxxyzzz*x**2*y*z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y** &
      3*z**2 + L_xxyyzzz*x*y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y &
      **2*z**3) + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xxxxxy*x**4*y + &
      L_xxxxxyz*x**4*y*z + L_xxxxxz*x**4*z + L_xxxxyyzz*x**3*y**2*z**2 &
      + L_xxxyyyzz*x**2*y**3*z**2 + L_xxxyyzzz*x**2*y**2*z**3 + &
      L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 + &
      L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z** &
      4 + L_xzzzz*z**4)
    L_yyyyyyzz = -(L_xxyyyyyy + L_yyyyyyyy)
    L_yyyyyzzz = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz = -(L_xxyzzzzz + L_yyyzzzzz)
    Phi_y      = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxy*x**7 + L_yyyyyyyy*y**7 + L_yzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyy*x**5*y**2 + L_xxxxxyzz*x**5*z**2 + &
      L_xxyyyyyy*x**2*y**5 + L_xxyzzzzz*x**2*z**5 + L_yyyyyyzz*y**5*z** &
      2 + L_yyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyy*x**4*y**3 &
      + L_xxxxyzzz*x**4*z**3 + L_xxxyyyyy*x**3*y**4 + L_xxxyzzzz*x**3*z &
      **4 + L_yyyyyzzz*y**4*z**3 + L_yyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyyyyz*x**3*y**3*z + &
      L_xxxyyzzz*x**3*y*z**3 + L_xxxyzzz*x**3*z**3 + L_xyyyyzzz*x*y**3* &
      z**3 + L_yyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxy*x**6 + L_xxxxxxyy*x**6*y + L_xxxxxxyz*x**6*z + &
      L_xyyyyyyy*x*y**6 + L_xyzzzzzz*x*z**6 + L_yyyyyyy*y**6 + &
      L_yyyyyyyz*y**6*z + L_yyzzzzzz*y*z**6 + L_yzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyyz*x**5*y*z &
      + L_xxxxxyz*x**5*z + L_xyyyyyy*x*y**5 + L_xyyyyyyz*x*y**5*z + &
      L_xyyzzzzz*x*y*z**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + &
      L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x* &
      y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz* &
      y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y &
      + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y &
      **2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y &
      **2*z + L_yyzz*y*z**2 + L_yzz*z**2) + (1.0d0/48.0d0)*(L_xxxxyyy*x &
      **4*y**2 + L_xxxxyyyz*x**4*y**2*z + L_xxxxyyzz*x**4*y*z**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyyyyyz*x**2*y**4* &
      z + L_xxyyzzzz*x**2*y*z**4 + L_xxyzzzz*x**2*z**4 + L_xyyyyyzz*x*y &
      **4*z**2 + L_xyyyzzzz*x*y**2*z**4 + L_yyyyyzz*y**4*z**2 + &
      L_yyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xxxyyyzz*x**3*y**2*z**2 + L_xxyyyyzz*x**2*y** &
      3*z**2 + L_xxyyyzzz*x**2*y**2*z**3 + L_xyyyyy*x*y**4 + L_xyyyyyz* &
      x*y**4*z + L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + &
      L_yyyyyz*y**4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4)
    L_zzzzzzzz = -(L_xxzzzzzz + L_yyzzzzzz)
    Phi_z      = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxz*x**7 + L_yyyyyyyz*y**7 + L_zzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyz*x**5*y**2 + L_xxxxxzzz*x**5*z**2 + &
      L_xxyyyyyz*x**2*y**5 + L_xxzzzzzz*x**2*z**5 + L_yyyyyzzz*y**5*z** &
      2 + L_yyzzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyz*x**4*y**3 &
      + L_xxxxzzzz*x**4*z**3 + L_xxxyyyyz*x**3*y**4 + L_xxxzzzzz*x**3*z &
      **4 + L_yyyyzzzz*y**4*z**3 + L_yyyzzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxyyyzz*x**3*y**3*z + &
      L_xxxyzzzz*x**3*y*z**3 + L_xxxzzzz*x**3*z**3 + L_xyyyzzzz*x*y**3* &
      z**3 + L_yyyzzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxyz*x**6*y + L_xxxxxxz*x**6 + L_xxxxxxzz*x**6*z + &
      L_xyyyyyyz*x*y**6 + L_xzzzzzzz*x*z**6 + L_yyyyyyz*y**6 + &
      L_yyyyyyzz*y**6*z + L_yzzzzzzz*y*z**6 + L_zzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxyzz*x**5*y*z + L_xxxxxz*x**5 &
      + L_xxxxxzz*x**5*z + L_xyyyyyz*x*y**5 + L_xyyyyyzz*x*y**5*z + &
      L_xyzzzzzz*x*y*z**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxyyz*x**4*y**2 + L_xxxxyyzz*x**4*y**2*z + &
      L_xxxxyzzz*x**4*y*z**2 + L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y** &
      4 + L_xxyyyyzz*x**2*y**4*z + L_xxyzzzzz*x**2*y*z**4 + L_xxzzzzz*x &
      **2*z**4 + L_xyyyyzzz*x*y**4*z**2 + L_xyyzzzzz*x*y**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
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
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + L_xxxxzz*x &
      **4*z + L_xxxyyzzz*x**3*y**2*z**2 + L_xxyyyzzz*x**2*y**3*z**2 + &
      L_xxyyzzzz*x**2*y**2*z**3 + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z &
      + L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz* &
      y**4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4)
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
    end subroutine mom_es_L2P
    
! OPS  2103*ADD + 889*DIV + 5924*MUL + 1041*NEG + 227*POW + 2346*SUB = 12530  (14259 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, M_zz,&
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
                S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy, S_xxxyyz, S_xxyyyy,&
                S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy, S_yyyyyz, S_xxxxxxx,&
                S_xxxxxxy, S_xxxxxxz, S_xxxxxyy, S_xxxxxyz, S_xxxxyyy,&
                S_xxxxyyz, S_xxxyyyy, S_xxxyyyz, S_xxyyyyy, S_xxyyyyz,&
                S_xyyyyyy, S_xyyyyyz, S_yyyyyyy, S_yyyyyyz
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define z                    r(3)
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
#define Ms_xyy               Ms(9)
#define M_xyy                M(9)
#define M_xyz                M(10)
#define Ms_xyz               Ms(10)
#define Ms_yyy               Ms(11)
#define M_yyy                M(11)
#define M_yyz                M(12)
#define Ms_yyz               Ms(12)
#define M_xxxx               M(13)
#define Ms_xxxx              Ms(13)
#define M_xxxy               M(14)
#define Ms_xxxy              Ms(14)
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
#define M_yyyy               M(20)
#define Ms_yyyy              Ms(20)
#define M_yyyz               M(21)
#define Ms_yyyz              Ms(21)
#define Ms_xxxxx             Ms(22)
#define M_xxxxx              M(22)
#define Ms_xxxxy             Ms(23)
#define M_xxxxy              M(23)
#define Ms_xxxxz             Ms(24)
#define M_xxxxz              M(24)
#define Ms_xxxyy             Ms(25)
#define M_xxxyy              M(25)
#define M_xxxyz              M(26)
#define Ms_xxxyz             Ms(26)
#define Ms_xxyyy             Ms(27)
#define M_xxyyy              M(27)
#define Ms_xxyyz             Ms(28)
#define M_xxyyz              M(28)
#define Ms_xyyyy             Ms(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define Ms_xyyyz             Ms(30)
#define M_yyyyy              M(31)
#define Ms_yyyyy             Ms(31)
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
#define M_xxyyyz             M(41)
#define Ms_xxyyyz            Ms(41)
#define Ms_xyyyyy            Ms(42)
#define M_xyyyyy             M(42)
#define Ms_xyyyyz            Ms(43)
#define M_xyyyyz             M(43)
#define Ms_yyyyyy            Ms(44)
#define M_yyyyyy             M(44)
#define M_yyyyyz             M(45)
#define Ms_yyyyyz            Ms(45)
#define Ms_xxxxxxx           Ms(46)
#define M_xxxxxxx            M(46)
#define Ms_xxxxxxy           Ms(47)
#define M_xxxxxxy            M(47)
#define Ms_xxxxxxz           Ms(48)
#define M_xxxxxxz            M(48)
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
#define Ms_xxyyyyz           Ms(56)
#define M_xxyyyyz            M(56)
#define M_xyyyyyy            M(57)
#define Ms_xyyyyyy           Ms(57)
#define M_xyyyyyz            M(58)
#define Ms_xyyyyyz           Ms(58)
#define Ms_yyyyyyy           Ms(59)
#define M_yyyyyyy            M(59)
#define M_yyyyyyz            M(60)
#define Ms_yyyyyyz           Ms(60)
    Ms_0       = Ms_0 + (M_0)
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    S_0        = 1
    S_x        = x
    S_y        = y
    S_z        = z
    S_xy       = x*y
    Ms_xy      = Ms_xy + (M_0*S_xy + M_xy)
    S_xz       = x*z
    Ms_xz      = Ms_xz + (M_0*S_xz + M_xz)
    S_yz       = y*z
    Ms_yz      = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz      = x*y*z
    Ms_xyz     = Ms_xyz + (M_0*S_xyz + M_xy*z + M_xyz + M_xz*y + M_yz*x)
    h          = x**2 + y**2 + z**2
    S_xx       = -1.0d0/3.0d0*h + x**2
    Ms_xx      = Ms_xx + (M_0*S_xx + M_xx)
    S_yy       = -1.0d0/3.0d0*h + y**2
    Ms_yy      = Ms_yy + (M_0*S_yy + M_yy)
    S_zz       = -(S_xx + S_yy)
    S_xxx      = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx     = Ms_xxx + (M_0*S_xxx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(M_xx*x - M_xy*y - M_xz*z))
    S_xxy      = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy     = Ms_xxy + (M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (8.0d0/5.0d0)*M_xy*x - 1.0d0/ &
      5.0d0*(3*M_yy*y + 2*M_yz*z + y*(-M_xx - M_yy)))
    S_xxz      = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz     = Ms_xxz + (M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (8.0d0/5.0d0)*M_xz*x - 1.0d0/ &
      5.0d0*(M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy)))
    S_xyy      = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy     = Ms_xyy + (M_0*S_xyy + (8.0d0/5.0d0)*M_xy*y + M_xyy + (4.0d0/5.0d0)*M_yy*x - 1.0d0/ &
      5.0d0*(3*M_xx*x + 2*M_xz*z + x*(-M_xx - M_yy)))
    S_xzz      = -(S_xxx + S_xyy)
    S_yyy      = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy     = Ms_yyy + (M_0*S_yyy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(-M_xy*x + M_yy*y - M_yz*z))
    S_yyz      = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz     = Ms_yyz + (M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (8.0d0/5.0d0)*M_yz*y - 1.0d0/ &
      5.0d0*(M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy)))
    S_yzz      = -(S_xxy + S_yyy)
    S_zzz      = -(S_xxz + S_yyz)
    S_xxxx     = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4
    Ms_xxxx    = Ms_xxxx + (M_0*S_xxxx + (72.0d0/35.0d0)*M_xx*S_xx - 6.0d0/35.0d0*M_xxyy + (24.0d0/ &
      35.0d0)*M_yz*S_yz + (32.0d0/35.0d0)*(M_xxx*x + M_xxxx) - 96.0d0/ &
      35.0d0*(M_xy*S_xy + M_xz*S_xz) + (1.0d0/210.0d0)*(M_yy*(-180*S_xx &
      + 72*S_yy) + (-M_xx - M_yy)*(-252*S_xx - 72*S_yy)) - 3.0d0/35.0d0 &
      *(M_xxzz + M_yyyy + M_yyzz) - 48.0d0/35.0d0*(M_xxy*y + M_xxz*z + &
      M_xyy*x + x*(-M_xxx - M_xyy)) + (12.0d0/35.0d0)*(M_yyy*y + M_yyz* &
      z + y*(-M_xxy - M_yyy) + z*(-M_xxz - M_yyz)))
    S_xxxy     = -3.0d0/7.0d0*h*x*y + x**3*y
    Ms_xxxy    = Ms_xxxy + (M_0*S_xxxy + (4.0d0/7.0d0)*M_xxx*y + M_xxxy + (1.0d0/105.0d0)*M_xy*(225* &
      S_xx - 90*S_yy) + (12.0d0/7.0d0)*(M_xx*S_xy + M_xxy*x) - 9.0d0/ &
      7.0d0*(M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz*S_yz + &
      M_yz*S_xz) - 3.0d0/7.0d0*(M_yyy*x + S_xy*(-M_xx - M_yy) + x*( &
      -M_xxy - M_yyy) + y*(-M_xxx - M_xyy)))
    S_xxxz     = -3.0d0/7.0d0*h*x*z + x**3*z
    Ms_xxxz    = Ms_xxxz + (M_0*S_xxxz + (4.0d0/7.0d0)*M_xxx*z + M_xxxz + (1.0d0/105.0d0)*M_xz*(315* &
      S_xx + 90*S_yy) + (12.0d0/7.0d0)*(M_xx*S_xz + M_xxz*x) - 9.0d0/ &
      7.0d0*(S_xz*(-M_xx - M_yy) + z*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*( &
      M_xy*S_yz + M_xyz*y + M_yz*S_xy) - 3.0d0/7.0d0*(M_xyy*z + M_yy* &
      S_xz + M_yyz*x + x*(-M_xxz - M_yyz)))
    S_xxyy     = (1.0d0/35.0d0)*h**2 + x**2*y**2 - 1.0d0/7.0d0*(h*x**2 + h*y**2)
    Ms_xxyy    = Ms_xxyy + (M_0*S_xxyy + (33.0d0/35.0d0)*M_xxyy + (108.0d0/35.0d0)*M_xy*S_xy + ( &
      4.0d0/35.0d0)*z*(-M_xxz - M_yyz) + (54.0d0/35.0d0)*(M_xxy*y + &
      M_xyy*x) + (1.0d0/210.0d0)*(M_xx*(-126*S_xx + 180*S_yy) + M_yy*( &
      180*S_xx - 126*S_yy) + (-M_xx - M_yy)*(-54*S_xx - 54*S_yy)) - &
      1.0d0/35.0d0*(16*M_xxx*x + M_xxxx + 6*M_xxz*z + M_xxzz + 12*M_xz* &
      S_xz + 16*M_yyy*y + M_yyyy + 6*M_yyz*z + M_yyzz + 12*M_yz*S_yz + &
      6*x*(-M_xxx - M_xyy) + 6*y*(-M_xxy - M_yyy)))
    S_xxyz     = -1.0d0/7.0d0*h*y*z + x**2*y*z
    Ms_xxyz    = Ms_xxyz + (M_0*S_xxyz + M_xxyz + (9.0d0/7.0d0)*M_yz*S_xx + (6.0d0/7.0d0)*(M_xx*S_yz &
      + M_xxy*z + M_xxz*y) + (12.0d0/7.0d0)*(M_xy*S_xz + M_xyz*x + M_xz &
      *S_xy) - 1.0d0/7.0d0*(3*M_yy*S_yz + M_yyy*z + 3*M_yyz*y + 3*S_yz* &
      (-M_xx - M_yy) + y*(-M_xxz - M_yyz) + 3*z*(-M_xxy - M_yyy)))
    S_xxzz     = -(S_xxxx + S_xxyy)
    S_xyyy     = -3.0d0/7.0d0*h*x*y + x*y**3
    Ms_xyyy    = Ms_xyyy + (M_0*S_xyyy + (1.0d0/105.0d0)*M_xy*(-90*S_xx + 225*S_yy) + M_xyyy + ( &
      4.0d0/7.0d0)*M_yyy*x - 9.0d0/7.0d0*(M_xx*S_xy + M_xxy*x) + ( &
      12.0d0/7.0d0)*(M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz &
      *S_yz + M_yz*S_xz) - 3.0d0/7.0d0*(M_xxx*y + S_xy*(-M_xx - M_yy) + &
      x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy)))
    S_xyyz     = -1.0d0/7.0d0*h*x*z + x*y**2*z
    Ms_xyyz    = Ms_xyyz + (M_0*S_xyyz + M_xyyz + (9.0d0/7.0d0)*M_xz*S_yy + (12.0d0/7.0d0)*(M_xy* &
      S_yz + M_xyz*y + M_yz*S_xy) + (6.0d0/7.0d0)*(M_xyy*z + M_yy*S_xz &
      + M_yyz*x) - 1.0d0/7.0d0*(3*M_xx*S_xz + M_xxx*z + 3*M_xxz*x + 3* &
      S_xz*(-M_xx - M_yy) + x*(-M_xxz - M_yyz) + 3*z*(-M_xxx - M_xyy)))
    S_xyzz     = -(S_xxxy + S_xyyy)
    S_xzzz     = -(S_xxxz + S_xyyz)
    S_yyyy     = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4
    Ms_yyyy    = Ms_yyyy + (M_0*S_yyyy - 6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_xz*S_xz + (72.0d0/ &
      35.0d0)*M_yy*S_yy + (1.0d0/210.0d0)*(M_xx*(72*S_xx - 180*S_yy) + &
      (-M_xx - M_yy)*(-72*S_xx - 252*S_yy)) - 96.0d0/35.0d0*(M_xy*S_xy &
      + M_yz*S_yz) + (32.0d0/35.0d0)*(M_yyy*y + M_yyyy) - 3.0d0/35.0d0* &
      (M_xxxx + M_xxzz + M_yyzz) + (12.0d0/35.0d0)*(M_xxx*x + M_xxz*z + &
      x*(-M_xxx - M_xyy) + z*(-M_xxz - M_yyz)) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xyy*x + M_yyz*z + y*(-M_xxy - M_yyy)))
    S_yyyz     = -3.0d0/7.0d0*h*y*z + y**3*z
    Ms_yyyz    = Ms_yyyz + (M_0*S_yyyz + (4.0d0/7.0d0)*M_yyy*z + M_yyyz + (1.0d0/105.0d0)*M_yz*(90* &
      S_xx + 315*S_yy) + (12.0d0/7.0d0)*(M_yy*S_yz + M_yyz*y) - 9.0d0/ &
      7.0d0*(S_yz*(-M_xx - M_yy) + z*(-M_xxy - M_yyy)) - 6.0d0/7.0d0*( &
      M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 3.0d0/7.0d0*(M_xx*S_yz + M_xxy &
      *z + M_xxz*y + y*(-M_xxz - M_yyz)))
    S_yyzz     = -(S_xxyy + S_yyyy)
    S_yzzz     = -(S_xxyz + S_yyyz)
    S_zzzz     = -(S_xxzz + S_yyzz)
    S_xxxxx    = (5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5
    Ms_xxxxx   = Ms_xxxxx + (M_0*S_xxxxx + (200.0d0/63.0d0)*M_xx*S_xxx + (40.0d0/63.0d0)*M_xxxx*x + ( &
      16.0d0/21.0d0)*M_xxxxx + (10.0d0/21.0d0)*(-M_xxxyy + x*(-M_xxyy - &
      M_yyyy)) - 80.0d0/63.0d0*(M_xxxy*y + M_xxxz*z) - 80.0d0/21.0d0*( &
      M_xxy*S_xy + M_xxz*S_xz) - 100.0d0/21.0d0*(M_xy*S_xxy + M_xz* &
      S_xxz) + (1.0d0/1890.0d0)*(M_xyy*(-4500*S_xx + 1800*S_yy) + M_yy* &
      (-2100*S_xxx + 1800*S_xyy) + (-M_xx - M_yy)*(-3900*S_xxx - 1800* &
      S_xyy) + (-M_xxx - M_xyy)*(-6300*S_xx - 1800*S_yy)) + (5.0d0/ &
      21.0d0)*(-M_xxxzz - M_xyyyy - M_xyyzz + M_yyyy*x + x*(-M_xxzz - &
      M_yyzz)) + (40.0d0/21.0d0)*(M_xxx*S_xx - M_xxyy*x + M_xyz*S_yz + &
      M_yz*S_xyz - x*(-M_xxxx - M_xxyy)) + (20.0d0/21.0d0)*(M_xyyy*y + &
      M_xyyz*z + M_yyy*S_xy + M_yyz*S_xz + S_xy*(-M_xxy - M_yyy) + S_xz &
      *(-M_xxz - M_yyz) + y*(-M_xxxy - M_xyyy) + z*(-M_xxxz - M_xyyz)))
    S_xxxxy    = (1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y
    Ms_xxxxy   = Ms_xxxxy + (M_0*S_xxxxy + (20.0d0/7.0d0)*M_xx*S_xxy - 12.0d0/7.0d0*M_xxyy*y - 24.0d0 &
      /7.0d0*M_xyy*S_xy + (1.0d0/5670.0d0)*M_yyy*(-3780*S_xx + 2160* &
      S_yy) - 6.0d0/7.0d0*S_xx*(-M_xxy - M_yyy) + (2.0d0/7.0d0)*y*( &
      -M_xxyy - M_yyyy) + (1.0d0/945.0d0)*(M_xy*(2520*S_xxx - 2160* &
      S_xyy) + M_yz*(-1260*S_xxz + 360*S_yyz)) - 16.0d0/7.0d0*(M_xyz* &
      S_xz + M_xz*S_xyz) + (4.0d0/7.0d0)*(M_yyz*S_yz - y*(-M_xxxx - &
      M_xxyy)) + (1.0d0/1890.0d0)*(M_xxy*(5400*S_xx - 2160*S_yy) + M_yy &
      *(-3780*S_xxy + 360*S_yyy) + (-M_xx - M_yy)*(-1620*S_xxy - 360* &
      S_yyy)) - 8.0d0/7.0d0*(M_xxyz*z + M_xxz*S_yz + M_xyyy*x + S_xy*( &
      -M_xxx - M_xyy) + x*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(32* &
      M_xxx*S_xy + 8*M_xxxx*y + 20*M_xxxxy + 32*M_xxxy*x - 2*M_xxyyy - &
      M_xxyzz + 5*M_yyyy*y - M_yyyyy + 4*M_yyyz*z - M_yyyzz + 4*S_yz*( &
      -M_xxz - M_yyz) + y*(-M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz)))
    S_xxxxz    = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z
    Ms_xxxxz   = Ms_xxxxz + (M_0*S_xxxxz + (20.0d0/7.0d0)*M_xx*S_xxz - 6.0d0/7.0d0*M_yyz*S_xx - &
      24.0d0/7.0d0*S_xz*(-M_xxx - M_xyy) - 12.0d0/7.0d0*z*(-M_xxxx - &
      M_xxyy) + (2.0d0/7.0d0)*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*( &
      -M_xxz - M_yyz)*(-5940*S_xx - 2160*S_yy) + (4.0d0/7.0d0)*(-M_xxyy &
      *z + S_yz*(-M_xxy - M_yyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz* &
      S_xy) + (1.0d0/945.0d0)*(M_xz*(4680*S_xxx + 2160*S_xyy) + M_yz*( &
      -1620*S_xxy - 360*S_yyy)) + (1.0d0/1890.0d0)*(M_xxz*(7560*S_xx + &
      2160*S_yy) + M_yy*(-1260*S_xxz + 360*S_yyz) + (-M_xx - M_yy)*( &
      -4140*S_xxz - 360*S_yyz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + x*(-M_xxxz - M_xyyz)) + (1.0d0/21.0d0)*( &
      32*M_xxx*S_xz + 8*M_xxxx*z + 20*M_xxxxz + 32*M_xxxz*x - 2*M_xxyyz &
      - M_xxzzz + 4*M_yyy*S_yz + M_yyyy*z - M_yyyyz + 4*M_yyyz*y - &
      M_yyzzz + 4*y*(-M_xxyz - M_yyyz) + 5*z*(-M_xxzz - M_yyzz)))
    S_xxxyy    = (1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x**3 &
      *y**2
    Ms_xxxyy   = Ms_xxxyy + (M_0*S_xxxyy + (1.0d0/5670.0d0)*M_xxx*(-3510*S_xx + 3780*S_yy) - 20.0d0/ &
      63.0d0*M_xxxx*x + (82.0d0/63.0d0)*M_xxxy*y - 2.0d0/63.0d0*M_xxxz* &
      z - 2.0d0/7.0d0*M_yyyy*x + (1.0d0/945.0d0)*(M_xy*(4140*S_xxy - &
      630*S_yyy) + M_xz*(-270*S_xxz - 630*S_yyz)) - 8.0d0/7.0d0*(M_xyyy &
      *y + M_yyy*S_xy) + (1.0d0/1890.0d0)*(M_xx*(-1110*S_xxx + 3780* &
      S_xyy) + M_xyy*(4140*S_xx - 2790*S_yy) + M_yy*(1680*S_xxx - 2790* &
      S_xyy) + (-M_xx - M_yy)*(-570*S_xxx - 990*S_xyy) + (-M_xxx - &
      M_xyy)*(-630*S_xx - 990*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxx + 19* &
      M_xxxyy - M_xxxzz + 82*M_xxy*S_xy + 41*M_xxyy*x - 2*M_xxz*S_xz - &
      M_xyyyy - 10*M_xyyz*z - M_xyyzz - 20*M_xyz*S_yz - 10*M_yyz*S_xz - &
      20*M_yz*S_xyz - 10*S_xy*(-M_xxy - M_yyy) + 4*S_xz*(-M_xxz - M_yyz &
      ) - x*(-M_xxxx - M_xxyy) - 5*x*(-M_xxyy - M_yyyy) + x*(-M_xxzz - &
      M_yyzz) - 10*y*(-M_xxxy - M_xyyy) + 4*z*(-M_xxxz - M_xyyz)))
    S_xxxyz    = -1.0d0/3.0d0*h*x*y*z + x**3*y*z
    Ms_xxxyz   = Ms_xxxyz + (M_0*S_xxxyz + M_xxxyz + 3*M_xyz*S_xx + (5.0d0/3.0d0)*M_yz*S_xxx + (1.0d0 &
      /945.0d0)*(M_xy*(2205*S_xxz - 630*S_yyz) + M_xz*(2835*S_xxy + 630 &
      *S_yyy)) + 2*(M_xx*S_xyz + 3*M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz*y &
      + M_xxy*S_xz + M_xxyz*x + M_xxz*S_xy) - (M_xyy*S_yz + 3*M_xyyy*z &
      + M_xyyz*y + M_yy*S_xyz + 3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy &
      + 3*S_xy*(-M_xxz - M_yyz) + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - &
      M_yyy) + S_yz*(-M_xxx - M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*( &
      -M_xxxz - M_xyyz) + z*(-M_xxxy - M_xyyy)))
    S_xxxzz    = -(S_xxxxx + S_xxxyy)
    S_xxyyy    = (1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x**2 &
      *y**3
    Ms_xxyyy   = Ms_xxyyy + (M_0*S_xxyyy - 2.0d0/7.0d0*M_xxxx*y + (82.0d0/63.0d0)*M_xyyy*x + (1.0d0/ &
      5670.0d0)*M_yyy*(3780*S_xx - 3510*S_yy) - 20.0d0/63.0d0*M_yyyy*y &
      - 2.0d0/63.0d0*M_yyyz*z - 8.0d0/7.0d0*(M_xxx*S_xy + M_xxxy*x) + ( &
      1.0d0/945.0d0)*(M_xy*(-630*S_xxx + 4140*S_xyy) + M_yz*(-630*S_xxz &
      - 270*S_yyz)) + (1.0d0/1890.0d0)*(M_xx*(-2790*S_xxy + 1680*S_yyy &
      ) + M_xxy*(-2790*S_xx + 4140*S_yy) + M_yy*(3780*S_xxy - 1110* &
      S_yyy) + (-M_xx - M_yy)*(-990*S_xxy - 570*S_yyy) + (-M_xxy - &
      M_yyy)*(-990*S_xx - 630*S_yy)) + (1.0d0/21.0d0)*(-M_xxxxy + 41* &
      M_xxyy*y + 19*M_xxyyy - 10*M_xxyz*z - M_xxyzz - 10*M_xxz*S_yz + &
      82*M_xyy*S_xy - 20*M_xyz*S_xz - 20*M_xz*S_xyz - M_yyyyy - M_yyyzz &
      - 2*M_yyz*S_yz - 10*S_xy*(-M_xxx - M_xyy) + 4*S_yz*(-M_xxz - &
      M_yyz) - 10*x*(-M_xxxy - M_xyyy) - 5*y*(-M_xxxx - M_xxyy) - y*( &
      -M_xxyy - M_yyyy) + y*(-M_xxzz - M_yyzz) + 4*z*(-M_xxyz - M_yyyz &
      )))
    S_xxyyz    = (1.0d0/63.0d0)*h**2*z + x**2*y**2*z - 1.0d0/9.0d0*(h*x**2*z + h*y**2*z)
    Ms_xxyyz   = Ms_xxyyz + (M_0*S_xxyyz + (17.0d0/21.0d0)*M_xxyy*z + (61.0d0/63.0d0)*M_xxyyz + ( &
      5.0d0/63.0d0)*z*(-M_xxzz - M_yyzz) + (1.0d0/5670.0d0)*(-M_xxz - &
      M_yyz)*(-1350*S_xx - 1350*S_yy) - 2.0d0/21.0d0*(M_xxxx*z + M_yyyy &
      *z) + (68.0d0/21.0d0)*(M_xy*S_xyz + M_xyz*S_xy) + (1.0d0/945.0d0) &
      *(M_xz*(90*S_xxx + 1980*S_xyy) + M_yz*(1980*S_xxy + 90*S_yyy)) - &
      10.0d0/21.0d0*(S_xz*(-M_xxx - M_xyy) + S_yz*(-M_xxy - M_yyy)) - &
      5.0d0/21.0d0*(z*(-M_xxxx - M_xxyy) + z*(-M_xxyy - M_yyyy)) - &
      8.0d0/21.0d0*(M_xxx*S_xz + M_xxxz*x + M_yyy*S_yz + M_yyyz*y) + ( &
      34.0d0/21.0d0)*(M_xxy*S_yz + M_xxyz*y + M_xyy*S_xz + M_xyyz*x) + &
      (1.0d0/1890.0d0)*(M_xx*(-930*S_xxz + 1680*S_yyz) + M_xxz*(-630* &
      S_xx + 1980*S_yy) + M_yy*(1680*S_xxz - 930*S_yyz) + M_yyz*(1980* &
      S_xx - 630*S_yy) + (-M_xx - M_yy)*(-750*S_xxz - 750*S_yyz)) - &
      1.0d0/63.0d0*(M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + 10*x*( &
      -M_xxxz - M_xyyz) + 10*y*(-M_xxyz - M_yyyz)))
    S_xxyzz    = -(S_xxxxy + S_xxyyy)
    S_xxzzz    = -(S_xxxxz + S_xxyyz)
    S_xyyyy    = (1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4
    Ms_xyyyy   = Ms_xyyyy + (M_0*S_xyyyy + (1.0d0/5670.0d0)*M_xxx*(2160*S_xx - 3780*S_yy) - 24.0d0/ &
      7.0d0*M_xxy*S_xy - 12.0d0/7.0d0*M_xxyy*x + (20.0d0/7.0d0)*M_yy* &
      S_xyy - 6.0d0/7.0d0*S_yy*(-M_xxx - M_xyy) + (2.0d0/7.0d0)*x*( &
      -M_xxxx - M_xxyy) + (4.0d0/7.0d0)*(M_xxz*S_xz - x*(-M_xxyy - &
      M_yyyy)) + (1.0d0/945.0d0)*(M_xy*(-2160*S_xxy + 2520*S_yyy) + &
      M_xz*(360*S_xxz - 1260*S_yyz)) - 16.0d0/7.0d0*(M_xyz*S_yz + M_yz* &
      S_xyz) + (1.0d0/1890.0d0)*(M_xx*(360*S_xxx - 3780*S_xyy) + M_xyy* &
      (-2160*S_xx + 5400*S_yy) + (-M_xx - M_yy)*(-360*S_xxx - 1620* &
      S_xyy)) - 8.0d0/7.0d0*(M_xxxy*y + M_xyyz*z + M_yyz*S_xz + S_xy*( &
      -M_xxy - M_yyy) + y*(-M_xxxy - M_xyyy)) + (1.0d0/21.0d0)*(5* &
      M_xxxx*x - M_xxxxx - 2*M_xxxyy + 4*M_xxxz*z - M_xxxzz + 32*M_xyyy &
      *y + 20*M_xyyyy - M_xyyzz + 32*M_yyy*S_xy + 8*M_yyyy*x + 4*S_xz*( &
      -M_xxz - M_yyz) + x*(-M_xxzz - M_yyzz) + 4*z*(-M_xxxz - M_xyyz)))
    S_xyyyz    = -1.0d0/3.0d0*h*x*y*z + x*y**3*z
    Ms_xyyyz   = Ms_xyyyz + (M_0*S_xyyyz + M_xyyyz + 3*M_xyz*S_yy + (5.0d0/3.0d0)*M_xz*S_yyy + (1.0d0 &
      /945.0d0)*(M_xy*(-630*S_xxz + 2205*S_yyz) + M_yz*(630*S_xxx + &
      2835*S_xyy)) + 2*(M_xyy*S_yz + 3*M_xyyy*z + M_xyyz*y + M_yy*S_xyz &
      + 3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy) - (M_xx*S_xyz + 3*M_xxx &
      *S_yz + 3*M_xxxy*z + 3*M_xxxz*y + M_xxy*S_xz + M_xxyz*x + M_xxz* &
      S_xy + 3*S_xy*(-M_xxz - M_yyz) + S_xyz*(-M_xx - M_yy) + S_xz*( &
      -M_xxy - M_yyy) + S_yz*(-M_xxx - M_xyy) + 3*x*(-M_xxyz - M_yyyz) &
      + 3*y*(-M_xxxz - M_xyyz) + z*(-M_xxxy - M_xyyy)))
    S_xyyzz    = -(S_xxxyy + S_xyyyy)
    S_xyzzz    = -(S_xxxyz + S_xyyyz)
    S_xzzzz    = -(S_xxxzz + S_xyyzz)
    S_yyyyy    = (5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5
    Ms_yyyyy   = Ms_yyyyy + (M_0*S_yyyyy + (200.0d0/63.0d0)*M_yy*S_yyy + (40.0d0/63.0d0)*M_yyyy*y + ( &
      16.0d0/21.0d0)*M_yyyyy + (10.0d0/21.0d0)*(-M_xxyyy + y*(-M_xxxx - &
      M_xxyy)) - 100.0d0/21.0d0*(M_xy*S_xyy + M_yz*S_yyz) - 80.0d0/ &
      21.0d0*(M_xyy*S_xy + M_yyz*S_yz) - 80.0d0/63.0d0*(M_xyyy*x + &
      M_yyyz*z) + (1.0d0/1890.0d0)*(M_xx*(1800*S_xxy - 2100*S_yyy) + &
      M_xxy*(1800*S_xx - 4500*S_yy) + (-M_xx - M_yy)*(-1800*S_xxy - &
      3900*S_yyy) + (-M_xxy - M_yyy)*(-1800*S_xx - 6300*S_yy)) + (5.0d0 &
      /21.0d0)*(M_xxxx*y - M_xxxxy - M_xxyzz - M_yyyzz + y*(-M_xxzz - &
      M_yyzz)) + (40.0d0/21.0d0)*(-M_xxyy*y + M_xyz*S_xz + M_xz*S_xyz + &
      M_yyy*S_yy - y*(-M_xxyy - M_yyyy)) + (20.0d0/21.0d0)*(M_xxx*S_xy &
      + M_xxxy*x + M_xxyz*z + M_xxz*S_yz + S_xy*(-M_xxx - M_xyy) + S_yz &
      *(-M_xxz - M_yyz) + x*(-M_xxxy - M_xyyy) + z*(-M_xxyz - M_yyyz)))
    S_yyyyz    = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z
    Ms_yyyyz   = Ms_yyyyz + (M_0*S_yyyyz - 6.0d0/7.0d0*M_xxz*S_yy + (20.0d0/7.0d0)*M_yy*S_yyz - &
      24.0d0/7.0d0*S_yz*(-M_xxy - M_yyy) + (2.0d0/7.0d0)*z*(-M_xxxx - &
      M_xxyy) - 12.0d0/7.0d0*z*(-M_xxyy - M_yyyy) + (1.0d0/5670.0d0)*( &
      -M_xxz - M_yyz)*(-2160*S_xx - 5940*S_yy) + (4.0d0/7.0d0)*(-M_xxyy &
      *z + S_xz*(-M_xxx - M_xyy)) - 16.0d0/7.0d0*(M_xy*S_xyz + M_xyz* &
      S_xy) + (1.0d0/945.0d0)*(M_xz*(-360*S_xxx - 1620*S_xyy) + M_yz*( &
      2160*S_xxy + 4680*S_yyy)) + (1.0d0/1890.0d0)*(M_xx*(360*S_xxz - &
      1260*S_yyz) + M_yyz*(2160*S_xx + 7560*S_yy) + (-M_xx - M_yy)*( &
      -360*S_xxz - 4140*S_yyz)) - 8.0d0/7.0d0*(M_xxy*S_yz + M_xxyz*y + &
      M_xyy*S_xz + M_xyyz*x + y*(-M_xxyz - M_yyyz)) + (1.0d0/21.0d0)*(4 &
      *M_xxx*S_xz + M_xxxx*z - M_xxxxz + 4*M_xxxz*x - 2*M_xxyyz - &
      M_xxzzz + 32*M_yyy*S_yz + 8*M_yyyy*z + 20*M_yyyyz + 32*M_yyyz*y - &
      M_yyzzz + 4*x*(-M_xxxz - M_xyyz) + 5*z*(-M_xxzz - M_yyzz)))
    S_yyyzz    = -(S_xxyyy + S_yyyyy)
    S_yyzzz    = -(S_xxyyz + S_yyyyz)
    S_yzzzz    = -(S_xxyzz + S_yyyzz)
    S_zzzzz    = -(S_xxzzz + S_yyzzz)
    S_xxxxxx   = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*x**2 - 15.0d0/11.0d0*h*x**4 + &
      x**6
    Ms_xxxxxx  = Ms_xxxxxx + (M_0*S_xxxxxx + (800.0d0/231.0d0)*M_xxx*S_xxx + (32.0d0/77.0d0)*M_xxxxx*x &
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
      - M_xyyzz)) - 10.0d0/77.0d0*(M_yyyyy*y + M_yyyyz*z + y*(-M_xxyzz &
      - M_yyyzz) + z*(-M_xxzzz - M_yyzzz)) + (240.0d0/77.0d0)*(M_xxyz* &
      S_yz + M_xyyy*S_xy + M_xyyz*S_xz + S_xy*(-M_xxxy - M_xyyy) + S_xz &
      *(-M_xxxz - M_xyyz)) + (120.0d0/77.0d0)*(M_xxxx*S_xx + M_xxyyy*y &
      + M_xxyyz*z + x*(-M_xxxyy - M_xyyyy) + y*(-M_xxxxy - M_xxyyy) + z &
      *(-M_xxxxz - M_xxyyz)) + (1.0d0/20790.0d0)*(M_xx*(86400*S_xxxx - &
      16200*S_xxyy - 8100*S_xxzz - 8100*S_yyyy - 8100*S_yyzz) + M_xyy*( &
      -75600*S_xxx + 64800*S_xyy) + M_yy*(-27000*S_xxxx + 40500*S_xxyy &
      + 1350*S_xxzz + 1350*S_yyyy + 1350*S_yyzz) + M_yyz*(37800*S_xxz - &
      10800*S_yyz) + (-M_xx - M_yy)*(-59400*S_xxxx - 24300*S_xxyy + &
      6750*S_xxzz + 6750*S_yyyy + 6750*S_yyzz) + (-M_xxx - M_xyy)*( &
      -140400*S_xxx - 64800*S_xyy) + (-M_xxy - M_yyy)*(48600*S_xxy + &
      10800*S_yyy)))
    S_xxxxxy   = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x**3*y + x**5*y
    Ms_xxxxxy  = Ms_xxxxxy + (M_0*S_xxxxxy + (100.0d0/33.0d0)*M_xxx*S_xxy + (8.0d0/33.0d0)*M_xxxxx*y + &
      (28.0d0/33.0d0)*M_xxxxxy - 60.0d0/11.0d0*M_xxyy*S_xy - 30.0d0/ &
      11.0d0*S_xx*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_xxx*(-M_xxy - &
      M_yyy) + (10.0d0/33.0d0)*(-M_xxxyyy + x*(-M_xxyyy - M_yyyyy)) + ( &
      140.0d0/33.0d0)*(M_xx*S_xxxy - M_xz*S_xxyz) - 40.0d0/11.0d0*( &
      M_xxyz*S_xz + M_xxz*S_xyz) + (25.0d0/33.0d0)*(M_xyyyy*y + M_yyyy* &
      S_xy) + (10.0d0/11.0d0)*(S_xy*(-M_xxyy - M_yyyy) + y*(-M_xxxyy - &
      M_xyyyy)) + (1.0d0/62370.0d0)*(M_xxxy*(189000*S_xx - 75600*S_yy) &
      + M_xyyy*(-132300*S_xx + 75600*S_yy) + M_yyy*(-56700*S_xxx + &
      75600*S_xyy)) + (1.0d0/10395.0d0)*(M_xy*(31500*S_xxxx - 47250* &
      S_xxyy - 1575*S_xxzz - 1575*S_yyyy - 1575*S_yyzz) + M_xyz*(-44100 &
      *S_xxz + 12600*S_yyz) + M_yz*(-18900*S_xxxz + 12600*S_xyyz)) + ( &
      40.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x - M_xxxyz*z - M_xxxz*S_yz &
      ) + (1.0d0/20790.0d0)*(M_xxy*(88200*S_xxx - 75600*S_xyy) + M_xyy* &
      (-132300*S_xxy + 12600*S_yyy) + M_yy*(-56700*S_xxxy + 12600* &
      S_xyyy) + (-M_xx - M_yy)*(-31500*S_xxxy - 12600*S_xyyy) + (-M_xxx &
      - M_xyy)*(-56700*S_xxy - 12600*S_yyy)) + (20.0d0/11.0d0)*( &
      -M_xxxyy*y - M_xxyyy*x + M_xyyz*S_yz + M_yyz*S_xyz - S_xy*( &
      -M_xxxx - M_xxyy) - x*(-M_xxxxy - M_xxyyy)) + (5.0d0/33.0d0)*( &
      -M_xxxyzz - M_xyyyyy - M_xyyyzz + M_yyyyy*x + S_xy*(-M_xxzz - &
      M_yyzz) + x*(-M_xxyzz - M_yyyzz) + y*(-M_xxxzz - M_xyyzz)) + ( &
      20.0d0/33.0d0)*(M_xyyyz*z + M_yyyz*S_xz + S_xyz*(-M_xxz - M_yyz) &
      + S_xz*(-M_xxyz - M_yyyz) + S_yz*(-M_xxxz - M_xyyz) - y*(-M_xxxxx &
      - M_xxxyy) + z*(-M_xxxyz - M_xyyyz)))
    S_xxxxxz   = (5.0d0/33.0d0)*h**2*x*z - 10.0d0/11.0d0*h*x**3*z + x**5*z
    Ms_xxxxxz  = Ms_xxxxxz + (M_0*S_xxxxxz + (100.0d0/33.0d0)*M_xxx*S_xxz + (8.0d0/33.0d0)*M_xxxxx*z + &
      (28.0d0/33.0d0)*M_xxxxxz - 30.0d0/11.0d0*M_xyyz*S_xx - 50.0d0/ &
      33.0d0*M_yyz*S_xxx - 60.0d0/11.0d0*S_xz*(-M_xxxx - M_xxyy) + ( &
      10.0d0/33.0d0)*(-M_xxxyyz + x*(-M_xxyyz - M_yyyyz)) + (140.0d0/ &
      33.0d0)*(M_xx*S_xxxz - M_xy*S_xxyz) - 40.0d0/11.0d0*(M_xxy*S_xyz &
      + M_xxyz*S_xy) + (10.0d0/11.0d0)*(S_xz*(-M_xxyy - M_yyyy) + z*( &
      -M_xxxyy - M_xyyyy)) + (25.0d0/33.0d0)*(S_xz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxxzz - M_xyyzz)) + (1.0d0/62370.0d0)*(M_xxxz*(264600*S_xx &
      + 75600*S_yy) + (-M_xxxz - M_xyyz)*(-207900*S_xx - 75600*S_yy) + &
      (-M_xxz - M_yyz)*(-132300*S_xxx - 75600*S_xyy)) + (1.0d0/ &
      10395.0d0)*(M_xyz*(-56700*S_xxy - 12600*S_yyy) + M_xz*(69300* &
      S_xxxx + 28350*S_xxyy - 7875*S_xxzz - 7875*S_yyyy - 7875*S_yyzz) &
      + M_yz*(-31500*S_xxxy - 12600*S_xyyy)) + (40.0d0/33.0d0)*(M_xxxx* &
      S_xz + M_xxxxz*x - M_xxxy*S_yz - M_xxxyz*y) + (1.0d0/20790.0d0)*( &
      M_xxz*(163800*S_xxx + 75600*S_xyy) + M_xyy*(-44100*S_xxz + 12600* &
      S_yyz) + M_yy*(-18900*S_xxxz + 12600*S_xyyz) + (-M_xx - M_yy)*( &
      -69300*S_xxxz - 12600*S_xyyz) + (-M_xxx - M_xyy)*(-144900*S_xxz - &
      12600*S_yyz)) + (20.0d0/11.0d0)*(-M_xxyy*S_xz - M_xxyyz*x + S_xyz &
      *(-M_xxy - M_yyy) + S_yz*(-M_xxxy - M_xyyy) - x*(-M_xxxxz - &
      M_xxyyz) - z*(-M_xxxxx - M_xxxyy)) + (5.0d0/33.0d0)*(-M_xxxzzz + &
      M_xyyyy*z - M_xyyyyz - M_xyyzzz + M_yyyy*S_xz + M_yyyyz*x + x*( &
      -M_xxzzz - M_yyzzz)) + (20.0d0/33.0d0)*(-M_xxxyy*z + M_xyyy*S_yz &
      + M_xyyyz*y + M_yyy*S_xyz + M_yyyz*S_xy + S_xy*(-M_xxyz - M_yyyz &
      ) + y*(-M_xxxyz - M_xyyyz)))
    S_xxxxyy   = -1.0d0/231.0d0*h**3 + x**4*y**2 - 1.0d0/11.0d0*(h*x**4 + 6*h*x**2*y**2) &
      + (1.0d0/33.0d0)*(2*h**2*x**2 + h**2*y**2)
    Ms_xxxxyy  = Ms_xxxxyy + (M_0*S_xxxxyy - 16.0d0/77.0d0*M_xxxxx*x - 4.0d0/77.0d0*M_xxxxxx - 5.0d0/ &
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
      -M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_xy*(57960*S_xxxy - &
      20160*S_xyyy) + M_xz*(-2520*S_xxxz - 20160*S_xyyz) + M_yz*(-17640 &
      *S_xxyz + 2520*S_yyyz)) + (1.0d0/20790.0d0)*(M_xx*(-12960*S_xxxx &
      + 68580*S_xxyy - 990*S_xxzz - 990*S_yyyy - 990*S_yyzz) + M_xxy*( &
      141480*S_xxy - 20160*S_yyy) + M_xxz*(360*S_xxz - 20160*S_yyz) + &
      M_xyy*(57960*S_xxx - 92880*S_xyy) + M_yy*(18540*S_xxxx - 52380* &
      S_xxyy - 360*S_xxzz + 2160*S_yyyy - 360*S_yyzz) + M_yyz*(-17640* &
      S_xxz + 10440*S_yyz) + (-M_xx - M_yy)*(-5580*S_xxxx - 16200* &
      S_xxyy + 1350*S_xxzz - 1170*S_yyyy + 1350*S_yyzz) + (-M_xxx - &
      M_xyy)*(-10440*S_xxx - 28080*S_xyy) + (-M_xxy - M_yyy)*(-20520* &
      S_xxy - 360*S_yyy)) + (1.0d0/231.0d0)*(232*M_xxxxy*y + 202* &
      M_xxxxyy + 8*M_xxxxz*z + 928*M_xxxy*S_xy + 464*M_xxxyy*x + 32* &
      M_xxxz*S_xz - 404*M_xxyyy*y + M_xxzzzz - 808*M_xyyy*S_xy - 202* &
      M_xyyyy*x - 5*M_yyyyyy - 4*M_yyyyzz + M_yyzzzz + 32*S_yz*(-M_xxyz &
      - M_yyyz) + 16*x*(-M_xxxxx - M_xxxyy) + 8*y*(-M_xxyzz - M_yyyzz) &
      + 16*z*(-M_xxyyz - M_yyyyz)))
    S_xxxxyz   = (1.0d0/33.0d0)*h**2*y*z - 6.0d0/11.0d0*h*x**2*y*z + x**4*y*z
    Ms_xxxxyz  = Ms_xxxxyz + (M_0*S_xxxxyz + (48.0d0/11.0d0)*M_xxyz*S_xx + (6.0d0/11.0d0)*S_yz*( &
      -M_xxyy - M_yyyy) + (2.0d0/11.0d0)*(y*(-M_xxyyz - M_yyyyz) + z*( &
      -M_xxyyy - M_yyyyy)) + (1.0d0/10395.0d0)*(M_xy*(30240*S_xxxz - &
      20160*S_xyyz) + M_xz*(50400*S_xxxy + 20160*S_xyyy) + M_yz*(20160* &
      S_xxxx - 5670*S_xxyy - 1575*S_xxzz - 4095*S_yyyy - 1575*S_yyzz)) &
      - 16.0d0/11.0d0*(M_xxyy*S_yz + M_xxyyz*y + S_yz*(-M_xxxx - M_xxyy &
      ) + z*(-M_xxxxy - M_xxyyy)) - 32.0d0/11.0d0*(M_xyy*S_xyz + M_xyyz &
      *S_xy + S_xyz*(-M_xxx - M_xyy) + S_xz*(-M_xxxy - M_xyyy)) + ( &
      1.0d0/62370.0d0)*(M_yyy*(-34020*S_xxz + 15120*S_yyz) + M_yyyz*( &
      -41580*S_xx + 7560*S_yy) + (-M_xxyz - M_yyyz)*(-49140*S_xx - 7560 &
      *S_yy) + (-M_xxz - M_yyz)*(-49140*S_xxy - 15120*S_yyy)) + (1.0d0/ &
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
    S_xxxyyy   = x**3*y**3 + (1.0d0/11.0d0)*(h**2*x*y - 3*h*x**3*y - 3*h*x*y**3)
    Ms_xxxyyy  = Ms_xxxyyy + (M_0*S_xxxyyy + (1.0d0/62370.0d0)*(M_xxx*(-107730*S_xxy + 45360*S_yyy) + &
      M_xxxy*(-107730*S_xx + 124740*S_yy) + M_xyyy*(124740*S_xx - &
      107730*S_yy) + M_yyy*(45360*S_xxx - 107730*S_xyy)) + (1.0d0/ &
      10395.0d0)*(M_xy*(-6615*S_xxxx + 65205*S_xxyy - 945*S_xxzz - 6615 &
      *S_yyyy - 945*S_yyzz) + M_xyz*(-9450*S_xxz - 9450*S_yyz) + M_xz*( &
      -9450*S_xxyz - 5670*S_yyyz) + M_yz*(-5670*S_xxxz - 9450*S_xyyz)) &
      + (1.0d0/20790.0d0)*(M_xx*(-32130*S_xxxy + 45360*S_xyyy) + M_xxy* &
      (-32130*S_xxx + 124740*S_xyy) + M_xyy*(124740*S_xxy - 32130*S_yyy &
      ) + M_yy*(45360*S_xxxy - 32130*S_xyyy) + (-M_xx - M_yy)*(-13230* &
      S_xxxy - 13230*S_xyyy) + (-M_xxx - M_xyy)*(-17010*S_xxy - 13230* &
      S_yyy) + (-M_xxxy - M_xyyy)*(-17010*S_xx - 17010*S_yy) + (-M_xxy &
      - M_yyy)*(-13230*S_xxx - 17010*S_xyy)) + (1.0d0/11.0d0)*(-10* &
      M_xxxx*S_xy - 2*M_xxxxx*y - M_xxxxxy - 10*M_xxxxy*x + 21*M_xxxyy* &
      y + 9*M_xxxyyy - 2*M_xxxyz*z - M_xxxyzz - 2*M_xxxz*S_yz + 63* &
      M_xxyy*S_xy + 21*M_xxyyy*x - 6*M_xxyz*S_xz - 6*M_xxz*S_xyz - 10* &
      M_xyyyy*y - M_xyyyyy - 2*M_xyyyz*z - M_xyyyzz - 6*M_xyyz*S_yz - &
      10*M_yyyy*S_xy - 2*M_yyyyy*x - 2*M_yyyz*S_xz - 6*M_yyz*S_xyz - 3* &
      S_xy*(-M_xxxx - M_xxyy) - 3*S_xy*(-M_xxyy - M_yyyy) + S_xy*( &
      -M_xxzz - M_yyzz) + 4*S_xyz*(-M_xxz - M_yyz) + 4*S_xz*(-M_xxyz - &
      M_yyyz) + 4*S_yz*(-M_xxxz - M_xyyz) - 3*x*(-M_xxxxy - M_xxyyy) - &
      x*(-M_xxyyy - M_yyyyy) + x*(-M_xxyzz - M_yyyzz) - y*(-M_xxxxx - &
      M_xxxyy) - 3*y*(-M_xxxyy - M_xyyyy) + y*(-M_xxxzz - M_xyyzz) + 4* &
      z*(-M_xxxyz - M_xyyyz)))
    S_xxxyyz   = (1.0d0/33.0d0)*h**2*x*z + x**3*y**2*z - 1.0d0/11.0d0*(h*x**3*z + 3*h*x*y &
      **2*z)
    Ms_xxxyyz  = Ms_xxxyyz + (M_0*S_xxxyyz + (46.0d0/11.0d0)*(M_xxy*S_xyz + M_xxyz*S_xy) + (23.0d0/ &
      11.0d0)*(M_xxyy*S_xz + M_xxyyz*x) + (1.0d0/62370.0d0)*(M_xxx*( &
      -35910*S_xxz + 45360*S_yyz) + M_xxxz*(-32130*S_xx + 49140*S_yy) + &
      (-M_xxxz - M_xyyz)*(-24570*S_xx - 32130*S_yy) + (-M_xxz - M_yyz)* &
      (-20790*S_xxx - 32130*S_xyy)) + (1.0d0/10395.0d0)*(M_xy*(47880* &
      S_xxyz - 5670*S_yyyz) + M_xyz*(56700*S_xxy + 3150*S_yyy) + M_xz*( &
      -315*S_xxxx + 31185*S_xxyy - 1575*S_xxzz + 4095*S_yyyy - 1575* &
      S_yyzz) + M_yz*(27720*S_xxxy + 3150*S_xyyy)) - 1.0d0/11.0d0*(14* &
      S_xyz*(-M_xxy - M_yyy) + 3*S_xz*(-M_xxxx - M_xxyy) + 7*S_xz*( &
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
    S_xxyyyy   = -1.0d0/231.0d0*h**3 + x**2*y**4 + (1.0d0/33.0d0)*(h**2*x**2 + 2*h**2*y** &
      2) - 1.0d0/11.0d0*(6*h*x**2*y**2 + h*y**4)
    Ms_xxyyyy  = Ms_xxyyyy + (M_0*S_xxyyyy + (12.0d0/77.0d0)*M_xxxxx*x - 5.0d0/77.0d0*M_xxyyzz - &
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
      + S_xy*(-M_xxxy - M_xyyy)) + (1.0d0/10395.0d0)*(M_xy*(-20160* &
      S_xxxy + 57960*S_xyyy) + M_xz*(2520*S_xxxz - 17640*S_xyyz) + M_yz &
      *(-20160*S_xxyz - 2520*S_yyyz)) + (1.0d0/20790.0d0)*(M_xx*(2160* &
      S_xxxx - 52380*S_xxyy - 360*S_xxzz + 18540*S_yyyy - 360*S_yyzz) + &
      M_xxy*(-92880*S_xxy + 57960*S_yyy) + M_xxz*(10440*S_xxz - 17640* &
      S_yyz) + M_xyy*(-20160*S_xxx + 141480*S_xyy) + M_yy*(-990*S_xxxx &
      + 68580*S_xxyy - 990*S_xxzz - 12960*S_yyyy - 990*S_yyzz) + M_yyz* &
      (-20160*S_xxz + 360*S_yyz) + (-M_xx - M_yy)*(-1170*S_xxxx - 16200 &
      *S_xxyy + 1350*S_xxzz - 5580*S_yyyy + 1350*S_yyzz) + (-M_xxx - &
      M_xyy)*(-360*S_xxx - 20520*S_xyy) + (-M_xxy - M_yyy)*(-28080* &
      S_xxy - 10440*S_yyy)) + (1.0d0/231.0d0)*(-5*M_xxxxxx - 202* &
      M_xxxxy*y - 4*M_xxxxzz - 808*M_xxxy*S_xy - 404*M_xxxyy*x + 464* &
      M_xxyyy*y + 202*M_xxyyyy + M_xxzzzz + 928*M_xyyy*S_xy + 232* &
      M_xyyyy*x + 8*M_yyyyz*z + 32*M_yyyz*S_yz + M_yyzzzz + 32*S_xz*( &
      -M_xxxz - M_xyyz) + 8*x*(-M_xxxzz - M_xyyzz) + 16*y*(-M_xxyyy - &
      M_yyyyy) + 16*z*(-M_xxxxz - M_xxyyz)))
    S_xxyyyz   = (1.0d0/33.0d0)*h**2*y*z + x**2*y**3*z - 1.0d0/11.0d0*(3*h*x**2*y*z + h*y &
      **3*z)
    Ms_xxyyyz  = Ms_xxyyyz + (M_0*S_xxyyyz + (23.0d0/11.0d0)*(M_xxyy*S_yz + M_xxyyz*y) + (46.0d0/ &
      11.0d0)*(M_xyy*S_xyz + M_xyyz*S_xy) + (1.0d0/10395.0d0)*(M_xy*( &
      -5670*S_xxxz + 47880*S_xyyz) + M_xyz*(3150*S_xxx + 56700*S_xyy) + &
      M_xz*(3150*S_xxxy + 27720*S_xyyy) + M_yz*(4095*S_xxxx + 31185* &
      S_xxyy - 1575*S_xxzz - 315*S_yyyy - 1575*S_yyzz)) + (1.0d0/ &
      62370.0d0)*(M_yyy*(45360*S_xxz - 35910*S_yyz) + M_yyyz*(49140* &
      S_xx - 32130*S_yy) + (-M_xxyz - M_yyyz)*(-32130*S_xx - 24570*S_yy &
      ) + (-M_xxz - M_yyz)*(-32130*S_xxy - 20790*S_yyy)) - 1.0d0/11.0d0 &
      *(14*S_xyz*(-M_xxx - M_xyy) + 14*S_xz*(-M_xxxy - M_xyyy) + 7*S_yz &
      *(-M_xxxx - M_xxyy) + 3*S_yz*(-M_xxyy - M_yyyy) + y*(-M_xxyyz - &
      M_yyyyz) + 7*z*(-M_xxxxy - M_xxyyy) + z*(-M_xxyyy - M_yyyyy)) + ( &
      1.0d0/20790.0d0)*(M_xx*(-25830*S_xxyz + 18900*S_yyyz) + M_xxy*( &
      -25830*S_xxz + 47880*S_yyz) + M_xxyz*(-17010*S_xx + 56700*S_yy) + &
      M_xxz*(-17010*S_xxy + 27720*S_yyy) + M_yy*(45360*S_xxyz - 10710* &
      S_yyyz) + M_yyz*(49140*S_xxy - 6930*S_yyy) + (-M_xx - M_yy)*( &
      -19530*S_xxyz - 8190*S_yyyz) + (-M_xxy - M_yyy)*(-19530*S_xxz - &
      11970*S_yyz)) + (1.0d0/33.0d0)*(-32*M_xxx*S_xyz - 8*M_xxxx*S_yz - &
      8*M_xxxxy*z - M_xxxxyz - 8*M_xxxxz*y - 32*M_xxxy*S_xz - 32* &
      M_xxxyz*x - 32*M_xxxz*S_xy + 23*M_xxyyy*z + 31*M_xxyyyz - &
      M_xxyzzz + 46*M_xyyy*S_xz + 46*M_xyyyz*x - 10*M_yyyy*S_yz - 2* &
      M_yyyyy*z - M_yyyyyz - 10*M_yyyyz*y - M_yyyzzz - 14*S_xy*(-M_xxxz &
      - M_xyyz) + 5*S_yz*(-M_xxzz - M_yyzz) - 14*x*(-M_xxxyz - M_xyyyz &
      ) - 7*y*(-M_xxxxz - M_xxyyz) + y*(-M_xxzzz - M_yyzzz) + 5*z*( &
      -M_xxyzz - M_yyyzz)))
    S_xyyyyy   = (5.0d0/33.0d0)*h**2*x*y - 10.0d0/11.0d0*h*x*y**3 + x*y**5
    Ms_xyyyyy  = Ms_xyyyyy + (M_0*S_xyyyyy - 60.0d0/11.0d0*M_xxyy*S_xy + (28.0d0/33.0d0)*M_xyyyyy + ( &
      100.0d0/33.0d0)*M_yyy*S_xyy + (8.0d0/33.0d0)*M_yyyyy*x - 30.0d0/ &
      11.0d0*S_yy*(-M_xxxy - M_xyyy) - 50.0d0/33.0d0*S_yyy*(-M_xxx - &
      M_xyy) + (10.0d0/33.0d0)*(-M_xxxyyy + y*(-M_xxxxx - M_xxxyy)) + ( &
      25.0d0/33.0d0)*(M_xxxx*S_xy + M_xxxxy*x) - 40.0d0/11.0d0*(M_xyyz* &
      S_yz + M_yyz*S_xyz) + (140.0d0/33.0d0)*(M_yy*S_xyyy - M_yz*S_xyyz &
      ) + (10.0d0/11.0d0)*(S_xy*(-M_xxxx - M_xxyy) + x*(-M_xxxxy - &
      M_xxyyy)) + (1.0d0/62370.0d0)*(M_xxx*(75600*S_xxy - 56700*S_yyy) &
      + M_xxxy*(75600*S_xx - 132300*S_yy) + M_xyyy*(-75600*S_xx + &
      189000*S_yy)) + (1.0d0/10395.0d0)*(M_xy*(-1575*S_xxxx - 47250* &
      S_xxyy - 1575*S_xxzz + 31500*S_yyyy - 1575*S_yyzz) + M_xyz*(12600 &
      *S_xxz - 44100*S_yyz) + M_xz*(12600*S_xxyz - 18900*S_yyyz)) + ( &
      40.0d0/33.0d0)*(M_xyyyy*y - M_xyyyz*z + M_yyyy*S_xy - M_yyyz*S_xz &
      ) + (1.0d0/20790.0d0)*(M_xx*(12600*S_xxxy - 56700*S_xyyy) + M_xxy &
      *(12600*S_xxx - 132300*S_xyy) + M_xyy*(-75600*S_xxy + 88200*S_yyy &
      ) + (-M_xx - M_yy)*(-12600*S_xxxy - 31500*S_xyyy) + (-M_xxy - &
      M_yyy)*(-12600*S_xxx - 56700*S_xyy)) + (20.0d0/11.0d0)*(-M_xxxyy* &
      y - M_xxyyy*x + M_xxyz*S_xz + M_xxz*S_xyz - S_xy*(-M_xxyy - &
      M_yyyy) - y*(-M_xxxyy - M_xyyyy)) + (5.0d0/33.0d0)*(M_xxxxx*y - &
      M_xxxxxy - M_xxxyzz - M_xyyyzz + S_xy*(-M_xxzz - M_yyzz) + x*( &
      -M_xxyzz - M_yyyzz) + y*(-M_xxxzz - M_xyyzz)) + (20.0d0/33.0d0)*( &
      M_xxxyz*z + M_xxxz*S_yz + S_xyz*(-M_xxz - M_yyz) + S_xz*(-M_xxyz &
      - M_yyyz) + S_yz*(-M_xxxz - M_xyyz) - x*(-M_xxyyy - M_yyyyy) + z* &
      (-M_xxxyz - M_xyyyz)))
    S_xyyyyz   = (1.0d0/33.0d0)*h**2*x*z - 6.0d0/11.0d0*h*x*y**2*z + x*y**4*z
    Ms_xyyyyz  = Ms_xyyyyz + (M_0*S_xyyyyz + (48.0d0/11.0d0)*M_xyyz*S_yy + (6.0d0/11.0d0)*S_xz*( &
      -M_xxxx - M_xxyy) + (2.0d0/11.0d0)*(x*(-M_xxxxz - M_xxyyz) + z*( &
      -M_xxxxx - M_xxxyy)) + (1.0d0/10395.0d0)*(M_xy*(-20160*S_xxyz + &
      30240*S_yyyz) + M_xz*(-4095*S_xxxx - 5670*S_xxyy - 1575*S_xxzz + &
      20160*S_yyyy - 1575*S_yyzz) + M_yz*(20160*S_xxxy + 50400*S_xyyy &
      )) + (1.0d0/62370.0d0)*(M_xxx*(15120*S_xxz - 34020*S_yyz) + &
      M_xxxz*(7560*S_xx - 41580*S_yy) + (-M_xxxz - M_xyyz)*(-7560*S_xx &
      - 49140*S_yy) + (-M_xxz - M_yyz)*(-15120*S_xxx - 49140*S_xyy)) - &
      32.0d0/11.0d0*(M_xxy*S_xyz + M_xxyz*S_xy + S_xyz*(-M_xxy - M_yyy &
      ) + S_yz*(-M_xxxy - M_xyyy)) - 16.0d0/11.0d0*(M_xxyy*S_xz + &
      M_xxyyz*x + S_xz*(-M_xxyy - M_yyyy) + z*(-M_xxxyy - M_xyyyy)) + ( &
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
    S_yyyyyy   = -5.0d0/231.0d0*h**3 + (5.0d0/11.0d0)*h**2*y**2 - 15.0d0/11.0d0*h*y**4 + &
      y**6
    Ms_yyyyyy  = Ms_yyyyyy + (M_0*S_yyyyyy + (10.0d0/231.0d0)*M_xxxxxx + (5.0d0/77.0d0)*M_xxxxzz + ( &
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
      z*(-M_xxxxz - M_xxyyz)) + (60.0d0/77.0d0)*(M_xxxxy*y - M_xxyyyy + &
      y*(-M_xxyzz - M_yyyzz)) - 10.0d0/77.0d0*(M_xxxxx*x + M_xxxxz*z + &
      x*(-M_xxxzz - M_xyyzz) + z*(-M_xxzzz - M_yyzzz)) + (240.0d0/ &
      77.0d0)*(M_xxxy*S_xy + M_xxyz*S_yz + M_xyyz*S_xz + S_xy*(-M_xxxy &
      - M_xyyy) + S_yz*(-M_xxyz - M_yyyz)) + (120.0d0/77.0d0)*(M_xxxyy* &
      x + M_xxyyz*z + M_yyyy*S_yy + x*(-M_xxxyy - M_xyyyy) + y*( &
      -M_xxxxy - M_xxyyy) + z*(-M_xxyyz - M_yyyyz)) + (1.0d0/20790.0d0) &
      *(M_xx*(1350*S_xxxx + 40500*S_xxyy + 1350*S_xxzz - 27000*S_yyyy + &
      1350*S_yyzz) + M_xxy*(64800*S_xxy - 75600*S_yyy) + M_xxz*(-10800* &
      S_xxz + 37800*S_yyz) + M_yy*(-8100*S_xxxx - 16200*S_xxyy - 8100* &
      S_xxzz + 86400*S_yyyy - 8100*S_yyzz) + (-M_xx - M_yy)*(6750* &
      S_xxxx - 24300*S_xxyy + 6750*S_xxzz - 59400*S_yyyy + 6750*S_yyzz &
      ) + (-M_xxx - M_xyy)*(10800*S_xxx + 48600*S_xyy) + (-M_xxy - &
      M_yyy)*(-64800*S_xxy - 140400*S_yyy)))
    S_yyyyyz   = (5.0d0/33.0d0)*h**2*y*z - 10.0d0/11.0d0*h*y**3*z + y**5*z
    Ms_yyyyyz  = Ms_yyyyyz + (M_0*S_yyyyyz - 30.0d0/11.0d0*M_xxyz*S_yy - 50.0d0/33.0d0*M_xxz*S_yyy + ( &
      100.0d0/33.0d0)*M_yyy*S_yyz + (8.0d0/33.0d0)*M_yyyyy*z + (28.0d0/ &
      33.0d0)*M_yyyyyz - 60.0d0/11.0d0*S_yz*(-M_xxyy - M_yyyy) + ( &
      10.0d0/33.0d0)*(-M_xxyyyz + y*(-M_xxxxz - M_xxyyz)) + (140.0d0/ &
      33.0d0)*(-M_xy*S_xyyz + M_yy*S_yyyz) - 40.0d0/11.0d0*(M_xyy*S_xyz &
      + M_xyyz*S_xy) + (10.0d0/11.0d0)*(S_yz*(-M_xxxx - M_xxyy) + z*( &
      -M_xxxxy - M_xxyyy)) + (25.0d0/33.0d0)*(S_yz*(-M_xxzz - M_yyzz) + &
      z*(-M_xxyzz - M_yyyzz)) + (1.0d0/10395.0d0)*(M_xyz*(-12600*S_xxx &
      - 56700*S_xyy) + M_xz*(-12600*S_xxxy - 31500*S_xyyy) + M_yz*( &
      -7875*S_xxxx + 28350*S_xxyy - 7875*S_xxzz + 69300*S_yyyy - 7875* &
      S_yyzz)) + (1.0d0/62370.0d0)*(M_yyyz*(75600*S_xx + 264600*S_yy) + &
      (-M_xxyz - M_yyyz)*(-75600*S_xx - 207900*S_yy) + (-M_xxz - M_yyz) &
      *(-75600*S_xxy - 132300*S_yyy)) + (40.0d0/33.0d0)*(-M_xyyy*S_xz - &
      M_xyyyz*x + M_yyyy*S_yz + M_yyyyz*y) + (1.0d0/20790.0d0)*(M_xx*( &
      12600*S_xxyz - 18900*S_yyyz) + M_xxy*(12600*S_xxz - 44100*S_yyz) &
      + M_yyz*(75600*S_xxy + 163800*S_yyy) + (-M_xx - M_yy)*(-12600* &
      S_xxyz - 69300*S_yyyz) + (-M_xxy - M_yyy)*(-12600*S_xxz - 144900* &
      S_yyz)) + (20.0d0/11.0d0)*(-M_xxyy*S_yz - M_xxyyz*y + S_xyz*( &
      -M_xxx - M_xyy) + S_xz*(-M_xxxy - M_xyyy) - y*(-M_xxyyz - M_yyyyz &
      ) - z*(-M_xxyyy - M_yyyyy)) + (20.0d0/33.0d0)*(M_xxx*S_xyz + &
      M_xxxy*S_xz + M_xxxyz*x + M_xxxz*S_xy - M_xxyyy*z + S_xy*(-M_xxxz &
      - M_xyyz) + x*(-M_xxxyz - M_xyyyz)) + (5.0d0/33.0d0)*(M_xxxx*S_yz &
      + M_xxxxy*z - M_xxxxyz + M_xxxxz*y - M_xxyzzz - M_yyyzzz + y*( &
      -M_xxzzz - M_yyzzz)))
    S_xxxxxxx  = -35.0d0/429.0d0*h**3*x + (105.0d0/143.0d0)*h**2*x**3 - 21.0d0/13.0d0*h*x &
      **5 + x**7
    Ms_xxxxxxx = Ms_xxxxxxx + (M_0*S_xxxxxxx + (1400.0d0/429.0d0)*M_xxxx*S_xxx + (168.0d0/143.0d0)* &
      M_xxxxx*S_xx + (112.0d0/429.0d0)*M_xxxxxx*x + (184.0d0/429.0d0)* &
      M_xxxxxxx + (1680.0d0/143.0d0)*M_xxyz*S_xyz + (70.0d0/429.0d0)* &
      M_xyyyyyy + (630.0d0/143.0d0)*S_xx*(-M_xxxyy - M_xyyyy) + ( &
      350.0d0/143.0d0)*S_xxx*(-M_xxyy - M_yyyy) + (420.0d0/143.0d0)*x*( &
      -M_xxxxyy - M_xxyyyy) - 112.0d0/143.0d0*(M_xxxxxy*y + M_xxxxxz*z &
      ) - 1400.0d0/143.0d0*(M_xxxy*S_xxy + M_xxxz*S_xxz) + (1.0d0/ &
      1621620.0d0)*(M_xxxyy*(-7938000*S_xx + 3175200*S_yy) + (-M_xxxxx &
      - M_xxxyy)*(-11113200*S_xx - 3175200*S_yy)) + (1.0d0/540540.0d0)* &
      (M_xxyy*(-3704400*S_xxx + 3175200*S_xyy) + (-M_xxxx - M_xxyy)*( &
      -6879600*S_xxx - 3175200*S_xyy)) + (210.0d0/143.0d0)*(M_xxyyyy*x &
      + x*(-M_xxxxzz - M_xxyyzz)) + (1.0d0/135135.0d0)*(M_xy*(-1323000* &
      S_xxxxy + 132300*S_xxyyy + 66150*S_xxyzz + 66150*S_yyyyy + 66150* &
      S_yyyzz) + M_xz*(-1323000*S_xxxxz + 132300*S_xxyyz + 66150* &
      S_xxzzz + 66150*S_yyyyz + 66150*S_yyzzz)) + (560.0d0/143.0d0)*( &
      -M_xxxxy*S_xy - M_xxxxz*S_xz + M_xxxyz*S_yz) + (1960.0d0/143.0d0) &
      *(-M_xxy*S_xxxy - M_xxz*S_xxxz + M_xyz*S_xxyz) + (35.0d0/429.0d0) &
      *(M_xxxzzzz + M_xyyzzzz - M_yyyyyy*x - x*(-M_xxzzzz - M_yyzzzz)) &
      + (1.0d0/3243240.0d0)*(M_xyyyy*(5556600*S_xx - 3175200*S_yy) + &
      M_yyyy*(2381400*S_xxx - 3175200*S_xyy) + (-M_xxxzz - M_xyyzz)*( &
      8731800*S_xx + 3175200*S_yy) + (-M_xxzz - M_yyzz)*(5556600*S_xxx &
      + 3175200*S_xyy)) - 140.0d0/143.0d0*(M_xxxxxyy + S_xy*(-M_xxyyy - &
      M_yyyyy) + S_xz*(-M_xxyyz - M_yyyyz) + y*(-M_xxxyyy - M_xyyyyy) + &
      z*(-M_xxxyyz - M_xyyyyz)) + (35.0d0/143.0d0)*(-M_xxxyyyy - &
      M_xxxyyzz + M_xyyyyzz - x*(-M_xxyyyy - M_yyyyyy) - x*(-M_xxyyzz - &
      M_yyyyzz)) + (1.0d0/810810.0d0)*(M_xxx*(4233600*S_xxxx - 793800* &
      S_xxyy - 396900*S_xxzz - 396900*S_yyyy - 396900*S_yyzz) + M_xyyy* &
      (5556600*S_xxy - 529200*S_yyy) + M_yyy*(2381400*S_xxxy - 529200* &
      S_xyyy) + (-M_xxxz - M_xyyz)*(6085800*S_xxz + 529200*S_yyz) + ( &
      -M_xxz - M_yyz)*(2910600*S_xxxz + 529200*S_xyyz)) + (840.0d0/ &
      143.0d0)*(M_xxyyy*S_xy + M_xxyyz*S_xz + M_yz*S_xxxyz + S_xy*( &
      -M_xxxxy - M_xxyyy) + S_xz*(-M_xxxxz - M_xxyyz)) - 70.0d0/143.0d0 &
      *(M_xxxxxzz + M_xyyyyy*y + M_xyyyyz*z + M_yyyyy*S_xy + M_yyyyz* &
      S_xz + S_xy*(-M_xxyzz - M_yyyzz) + S_xz*(-M_xxzzz - M_yyzzz) + y* &
      (-M_xxxyzz - M_xyyyzz) + z*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/ &
      270270.0d0)*(M_xx*(1270080*S_xxxxx - 793800*S_xxxyy - 396900* &
      S_xxxzz - 396900*S_xyyyy - 396900*S_xyyzz) + M_xyy*(-1323000* &
      S_xxxx + 1984500*S_xxyy + 66150*S_xxzz + 66150*S_yyyy + 66150* &
      S_yyzz) + M_xyyz*(1852200*S_xxz - 529200*S_yyz) + M_yy*(-370440* &
      S_xxxxx + 926100*S_xxxyy + 66150*S_xxxzz + 66150*S_xyyyy + 66150* &
      S_xyyzz) + M_yyz*(793800*S_xxxz - 529200*S_xyyz) + (-M_xx - M_yy) &
      *(-899640*S_xxxxx - 132300*S_xxxyy + 330750*S_xxxzz + 330750* &
      S_xyyyy + 330750*S_xyyzz) + (-M_xxx - M_xyy)*(-2910600*S_xxxx - &
      1190700*S_xxyy + 330750*S_xxzz + 330750*S_yyyy + 330750*S_yyzz) + &
      (-M_xxxy - M_xyyy)*(2381400*S_xxy + 529200*S_yyy) + (-M_xxy - &
      M_yyy)*(1323000*S_xxxy + 529200*S_xyyy)) + (280.0d0/143.0d0)*( &
      -M_xxxxyy*x + M_xxxyyy*y + M_xxxyyz*z - M_xyyyz*S_yz - M_yyyz* &
      S_xyz - S_xyz*(-M_xxyz - M_yyyz) - S_yz*(-M_xxxyz - M_xyyyz) - x* &
      (-M_xxxxxx - M_xxxxyy) + y*(-M_xxxxxy - M_xxxyyy) + z*(-M_xxxxxz &
      - M_xxxyyz)))
    S_xxxxxxy  = -5.0d0/429.0d0*h**3*y + (45.0d0/143.0d0)*h**2*x**2*y - 15.0d0/13.0d0*h*x &
      **4*y + x**6*y
    Ms_xxxxxxy = Ms_xxxxxxy + (M_0*S_xxxxxxy + (2240.0d0/429.0d0)*M_xxx*S_xxxy + (64.0d0/429.0d0)* &
      M_xxxxxx*y + (304.0d0/429.0d0)*M_xxxxxxy + (200.0d0/143.0d0)* &
      M_xxyyyy*y - 1120.0d0/143.0d0*M_xxz*S_xxyz + (1.0d0/16216200.0d0) &
      *M_yyyyy*(5103000*S_xx - 3402000*S_yy) - 35.0d0/429.0d0*M_yyyyyy* &
      y + (10.0d0/429.0d0)*M_yyyyyyy + (5.0d0/143.0d0)*M_yyyyyzz - &
      50.0d0/143.0d0*M_yyyyz*S_yz - 720.0d0/143.0d0*S_xx*(-M_xxxxy - &
      M_xxyyy) - 800.0d0/143.0d0*S_xxx*(-M_xxxy - M_xyyy) - 60.0d0/ &
      143.0d0*S_yz*(-M_xxyyz - M_yyyyz) - 25.0d0/143.0d0*y*(-M_xxyyyy - &
      M_yyyyyy) - 15.0d0/143.0d0*y*(-M_xxyyzz - M_yyyyzz) - 20.0d0/ &
      143.0d0*z*(-M_xxyyyz - M_yyyyyz) + (40.0d0/143.0d0)*(-M_xxxxyzz + &
      y*(-M_xxxxzz - M_xxyyzz)) - 35.0d0/143.0d0*(M_xxyyyyy + M_xxyyyzz &
      ) + (400.0d0/143.0d0)*(M_xxxx*S_xxy + M_xyyyy*S_xy) + (128.0d0/ &
      143.0d0)*(M_xxxxx*S_xy + M_xxxxxy*x) + (240.0d0/143.0d0)*( &
      -M_xxxxyy*y + y*(-M_xxxxyy - M_xxyyyy)) - 640.0d0/143.0d0*( &
      M_xxxyz*S_xz + M_xxxz*S_xyz) + (1.0d0/1621620.0d0)*(M_xxyyy*( &
      -6350400*S_xx + 3628800*S_yy) + (-M_xxyyy - M_yyyyy)*(1247400* &
      S_xx - 226800*S_yy)) + (480.0d0/143.0d0)*(M_xxyyz*S_yz + S_xy*( &
      -M_xxxyy - M_xyyyy)) + (5.0d0/429.0d0)*(M_xxyzzzz + M_yyyzzzz - y &
      *(-M_xxzzzz - M_yyzzzz)) + (960.0d0/143.0d0)*(-M_xxxyy*S_xy + &
      M_xyyz*S_xyz - M_xz*S_xxxyz) + (1.0d0/540540.0d0)*(M_xxyy*( &
      -6350400*S_xxy + 604800*S_yyy) + (-M_xxxx - M_xxyy)*(-2721600* &
      S_xxy - 604800*S_yyy) + (-M_xxyy - M_yyyy)*(1247400*S_xxy + &
      151200*S_yyy)) + (1.0d0/135135.0d0)*(M_xy*(423360*S_xxxxx - &
      1058400*S_xxxyy - 75600*S_xxxzz - 75600*S_xyyyy - 75600*S_xyyzz) &
      + M_xyz*(-907200*S_xxxz + 604800*S_xyyz) + M_yz*(-302400*S_xxxxz &
      + 359100*S_xxyyz + 9450*S_xxzzz + 9450*S_yyyyz + 9450*S_yyzzz)) - &
      10.0d0/143.0d0*(M_yyyyyz*z + S_yz*(-M_xxzzz - M_yyzzz) + z*( &
      -M_xxyzzz - M_yyyzzz)) + (1.0d0/3243240.0d0)*(M_xxxxy*(9072000* &
      S_xx - 3628800*S_yy) + M_yyyy*(5103000*S_xxy - 756000*S_yyy) + ( &
      -M_xxyzz - M_yyyzz)*(1474200*S_xx + 226800*S_yy) + (-M_xxzz - &
      M_yyzz)*(1474200*S_xxy + 453600*S_yyy)) + (80.0d0/143.0d0)*( &
      -M_xxxxyyy + M_xyyyyy*x + S_xy*(-M_xxxzz - M_xyyzz) + x*( &
      -M_xxxyzz - M_xyyyzz) - y*(-M_xxxxxx - M_xxxxyy)) + (160.0d0/ &
      143.0d0)*(-M_xxxxyz*z - M_xxxxz*S_yz + M_xxyyyz*z + S_yz*( &
      -M_xxxxz - M_xxyyz) + x*(-M_xxxyyy - M_xyyyyy) + z*(-M_xxxxyz - &
      M_xxyyyz)) + (1.0d0/810810.0d0)*(M_xxxy*(4233600*S_xxx - 3628800* &
      S_xyy) + M_xyyy*(-2721600*S_xxx + 3628800*S_xyy) + M_yyy*(-907200 &
      *S_xxxx + 2097900*S_xxyy + 28350*S_xxzz - 47250*S_yyyy + 28350* &
      S_yyzz) + M_yyyz*(1020600*S_xxz - 453600*S_yyz) + (-M_xxyz - &
      M_yyyz)*(1096200*S_xxz - 151200*S_yyz) + (-M_xxz - M_yyz)*( &
      1096200*S_xxyz + 75600*S_yyyz)) + (320.0d0/143.0d0)*(-M_xxxyyy*x &
      + M_xyyyz*S_xz - S_xy*(-M_xxxxx - M_xxxyy) + S_xyz*(-M_xxxz - &
      M_xyyz) + S_xz*(-M_xxxyz - M_xyyyz) - x*(-M_xxxxxy - M_xxxyyy)) + &
      (1.0d0/270270.0d0)*(M_xx*(1512000*S_xxxxy - 151200*S_xxyyy - &
      75600*S_xxyzz - 75600*S_yyyyy - 75600*S_yyyzz) + M_xxy*(1512000* &
      S_xxxx - 2268000*S_xxyy - 75600*S_xxzz - 75600*S_yyyy - 75600* &
      S_yyzz) + M_xxyz*(-2116800*S_xxz + 604800*S_yyz) + M_xyy*( &
      -2721600*S_xxxy + 604800*S_xyyy) + M_yy*(-907200*S_xxxxy + 396900 &
      *S_xxyyy + 28350*S_xxyzz + 28350*S_yyyyy + 28350*S_yyyzz) + M_yyz &
      *(1020600*S_xxyz - 75600*S_yyyz) + (-M_xx - M_yy)*(-604800* &
      S_xxxxy - 245700*S_xxyyy + 47250*S_xxyzz + 47250*S_yyyyy + 47250* &
      S_yyyzz) + (-M_xxx - M_xyy)*(-1512000*S_xxxy - 604800*S_xyyy) + ( &
      -M_xxy - M_yyy)*(-604800*S_xxxx + 170100*S_xxyy + 47250*S_xxzz + &
      122850*S_yyyy + 47250*S_yyzz)))
    S_xxxxxxz  = -5.0d0/429.0d0*h**3*z + (45.0d0/143.0d0)*h**2*x**2*z - 15.0d0/13.0d0*h*x &
      **4*z + x**6*z
    Ms_xxxxxxz = Ms_xxxxxxz + (M_0*S_xxxxxxz + (2240.0d0/429.0d0)*M_xxx*S_xxxz + (64.0d0/429.0d0)* &
      M_xxxxxx*z + (304.0d0/429.0d0)*M_xxxxxxz - 1120.0d0/143.0d0*M_xxy &
      *S_xxyz - 720.0d0/143.0d0*M_xxyyz*S_xx - 800.0d0/143.0d0*M_xyyz* &
      S_xxx + (10.0d0/429.0d0)*M_yyyyyyz + (5.0d0/143.0d0)*M_yyyyzzz - &
      60.0d0/143.0d0*S_yz*(-M_xxyyy - M_yyyyy) - 50.0d0/143.0d0*S_yz*( &
      -M_xxyzz - M_yyyzz) - 20.0d0/143.0d0*y*(-M_xxyyyz - M_yyyyyz) + ( &
      200.0d0/143.0d0)*z*(-M_xxxxzz - M_xxyyzz) - 15.0d0/143.0d0*z*( &
      -M_xxyyyy - M_yyyyyy) - 25.0d0/143.0d0*z*(-M_xxyyzz - M_yyyyzz) - &
      35.0d0/429.0d0*z*(-M_xxzzzz - M_yyzzzz) + (40.0d0/143.0d0)*( &
      -M_xxxxzzz + M_xxyyyy*z) - 35.0d0/143.0d0*(M_xxyyyyz + M_xxyyzzz &
      ) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz)*(8505000*S_xx + &
      3402000*S_yy) + (400.0d0/143.0d0)*(M_xxxx*S_xxz + S_xz*(-M_xxxzz &
      - M_xyyzz)) + (128.0d0/143.0d0)*(M_xxxxx*S_xz + M_xxxxxz*x) - &
      640.0d0/143.0d0*(M_xxxy*S_xyz + M_xxxyz*S_xy) + (480.0d0/143.0d0) &
      *(S_xz*(-M_xxxyy - M_xyyyy) + S_yz*(-M_xxxxy - M_xxyyy)) + ( &
      240.0d0/143.0d0)*(-z*(-M_xxxxxx - M_xxxxyy) + z*(-M_xxxxyy - &
      M_xxyyyy)) + (1.0d0/1621620.0d0)*((-M_xxxxz - M_xxyyz)*(-9979200* &
      S_xx - 3628800*S_yy) + (-M_xxyyz - M_yyyyz)*(1474200*S_xx + &
      226800*S_yy)) + (5.0d0/429.0d0)*(M_xxzzzzz - M_yyyyyy*z + &
      M_yyzzzzz) + (1.0d0/540540.0d0)*(M_xxyy*(-2116800*S_xxz + 604800* &
      S_yyz) + (-M_xxxx - M_xxyy)*(-6955200*S_xxz - 604800*S_yyz) + ( &
      -M_xxyy - M_yyyy)*(1096200*S_xxz - 151200*S_yyz)) + (960.0d0/ &
      143.0d0)*(-M_xy*S_xxxyz + S_xyz*(-M_xxxy - M_xyyy) - S_xz*( &
      -M_xxxxx - M_xxxyy)) + (1.0d0/135135.0d0)*(M_xyz*(-1512000*S_xxxy &
      - 604800*S_xyyy) + M_xz*(1028160*S_xxxxx + 151200*S_xxxyy - &
      378000*S_xxxzz - 378000*S_xyyyy - 378000*S_xyyzz) + M_yz*(-604800 &
      *S_xxxxy - 245700*S_xxyyy + 47250*S_xxyzz + 47250*S_yyyyy + 47250 &
      *S_yyyzz)) - 10.0d0/143.0d0*(M_yyyyy*S_yz + M_yyyyyz*y + y*( &
      -M_xxyzzz - M_yyyzzz)) + (1.0d0/3243240.0d0)*(M_xxxxz*(12700800* &
      S_xx + 3628800*S_yy) + M_yyyy*(1020600*S_xxz - 453600*S_yyz) + &
      M_yyyyz*(1247400*S_xx - 226800*S_yy) + (-M_xxzz - M_yyzz)*( &
      5859000*S_xxz + 756000*S_yyz)) + (80.0d0/143.0d0)*(-M_xxxxyy*z - &
      M_xxxxyyz + M_xyyyy*S_xz + M_xyyyyz*x + x*(-M_xxxzzz - M_xyyzzz &
      )) + (160.0d0/143.0d0)*(-M_xxxxy*S_yz - M_xxxxyz*y + M_xxyyy*S_yz &
      + M_xxyyyz*y + x*(-M_xxxyyz - M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz &
      )) + (320.0d0/143.0d0)*(-M_xxxyy*S_xz - M_xxxyyz*x + M_xyyy*S_xyz &
      + M_xyyyz*S_xy + S_xy*(-M_xxxyz - M_xyyyz) - x*(-M_xxxxxz - &
      M_xxxyyz)) + (1.0d0/810810.0d0)*(M_xxxz*(7862400*S_xxx + 3628800* &
      S_xyy) + M_yyy*(1020600*S_xxyz - 75600*S_yyyz) + M_yyyz*(1247400* &
      S_xxy + 151200*S_yyy) + (-M_xxxz - M_xyyz)*(-6350400*S_xxx - &
      3628800*S_xyy) + (-M_xxyz - M_yyyz)*(1474200*S_xxy + 453600*S_yyy &
      ) + (-M_xxz - M_yyz)*(-2721600*S_xxxx - 1530900*S_xxyy + 330750* &
      S_xxzz + 255150*S_yyyy + 330750*S_yyzz)) + (1.0d0/270270.0d0)*( &
      M_xx*(1512000*S_xxxxz - 151200*S_xxyyz - 75600*S_xxzzz - 75600* &
      S_yyyyz - 75600*S_yyzzz) + M_xxyz*(-2721600*S_xxy - 604800*S_yyy &
      ) + M_xxz*(3326400*S_xxxx + 1360800*S_xxyy - 378000*S_xxzz - &
      378000*S_yyyy - 378000*S_yyzz) + M_xyy*(-907200*S_xxxz + 604800* &
      S_xyyz) + M_yy*(-302400*S_xxxxz + 359100*S_xxyyz + 9450*S_xxzzz + &
      9450*S_yyyyz + 9450*S_yyzzz) + M_yyz*(-604800*S_xxxx + 170100* &
      S_xxyy + 47250*S_xxzz + 122850*S_yyyy + 47250*S_yyzz) + (-M_xx - &
      M_yy)*(-1209600*S_xxxxz - 207900*S_xxyyz + 66150*S_xxzzz + 66150* &
      S_yyyyz + 66150*S_yyzzz) + (-M_xxx - M_xyy)*(-3326400*S_xxxz - &
      604800*S_xyyz) + (-M_xxy - M_yyy)*(1096200*S_xxyz + 75600*S_yyyz &
      )))
    S_xxxxxyy  = -5.0d0/429.0d0*h**3*x + (10.0d0/143.0d0)*h**2*x**3 + (15.0d0/143.0d0)*h &
      **2*x*y**2 + x**5*y**2 - 1.0d0/13.0d0*(h*x**5 + 10*h*x**3*y**2)
    Ms_xxxxxyy = Ms_xxxxxyy + (M_0*S_xxxxxyy + (1.0d0/16216200.0d0)*M_xxxxx*(-6804000*S_xx + 5443200* &
      S_yy) - 56.0d0/429.0d0*M_xxxxxx*x - 20.0d0/429.0d0*M_xxxxxxx + ( &
      8.0d0/11.0d0)*M_xxxxxy*y + (118.0d0/143.0d0)*M_xxxxxyy + (8.0d0/ &
      143.0d0)*M_xxxxxz*z - 5.0d0/143.0d0*M_xxxxxzz + (40.0d0/11.0d0)* &
      M_xxxxy*S_xy + (20.0d0/11.0d0)*M_xxxxyy*x - 300.0d0/143.0d0* &
      M_xxxyyy*y - 30.0d0/143.0d0*M_xxxyyyy - 280.0d0/143.0d0*M_xxxyz* &
      S_yz - 900.0d0/143.0d0*M_xxyyy*S_xy - 225.0d0/143.0d0*M_xxyyyy*x &
      - 840.0d0/143.0d0*M_xxyz*S_xyz - 35.0d0/429.0d0*M_xyyyyyy + ( &
      40.0d0/429.0d0)*M_yyyyyy*x + (60.0d0/143.0d0)*S_xz*(-M_xxxxz - &
      M_xxyyz) - 210.0d0/143.0d0*x*(-M_xxxxyy - M_xxyyyy) + (25.0d0/ &
      143.0d0)*x*(-M_xxyyyy - M_yyyyyy) + (15.0d0/143.0d0)*(-M_xxxyyzz &
      + x*(-M_xxxxzz - M_xxyyzz)) + (1.0d0/1621620.0d0)*(M_xxxyy*( &
      6690600*S_xx - 4309200*S_yy) + (-M_xxxxx - M_xxxyy)*(113400*S_xx &
      - 1134000*S_yy)) - 140.0d0/143.0d0*(M_xxxyyz*z + y*(-M_xxxxxy - &
      M_xxxyyy)) - 420.0d0/143.0d0*(M_xxyyz*S_xz + S_xy*(-M_xxxxy - &
      M_xxyyy)) + (50.0d0/143.0d0)*(M_xyyyyz*z + M_yyyyz*S_xz) + ( &
      200.0d0/143.0d0)*(M_xyyyz*S_yz + M_yyyz*S_xyz) + (100.0d0/143.0d0 &
      )*(S_xy*(-M_xxyyy - M_yyyyy) + y*(-M_xxxyyy - M_xyyyyy)) + (5.0d0 &
      /429.0d0)*(M_xxxzzzz + M_xyyzzzz - x*(-M_xxzzzz - M_yyzzzz)) + ( &
      40.0d0/143.0d0)*(M_xxxxz*S_xz + S_xz*(-M_xxyyz - M_yyyyz) + z*( &
      -M_xxxyyz - M_xyyyyz)) + (10.0d0/143.0d0)*(-M_xyyyyzz - S_xz*( &
      -M_xxzzz - M_yyzzz) + x*(-M_xxyyzz - M_yyyyzz) - z*(-M_xxxzzz - &
      M_xyyzzz)) + (1.0d0/540540.0d0)*(M_xxyy*(2759400*S_xxx - 4309200* &
      S_xyy) + (-M_xxxx - M_xxyy)*(-189000*S_xxx - 1134000*S_xyy) + ( &
      -M_xxxyy - M_xyyyy)*(-1020600*S_xx + 340200*S_yy) + (-M_xxyy - &
      M_yyyy)*(-491400*S_xxx + 340200*S_xyy)) + (1.0d0/135135.0d0)*( &
      M_xy*(888300*S_xxxxy - 548100*S_xxyyy - 18900*S_xxyzz - 18900* &
      S_yyyyy - 18900*S_yyyzz) + M_xyz*(-869400*S_xxyz + 113400*S_yyyz &
      ) + M_xz*(-18900*S_xxxxz - 491400*S_xxyyz + 9450*S_xxzzz + 9450* &
      S_yyyyz + 9450*S_yyzzz) + M_yz*(-340200*S_xxxyz + 113400*S_xyyyz &
      )) + (80.0d0/143.0d0)*(M_xyyyyy*y + M_yyyyy*S_xy + S_xyz*(-M_xxyz &
      - M_yyyz) + S_yz*(-M_xxxyz - M_xyyyz)) + (20.0d0/143.0d0)*(S_xy*( &
      -M_xxyzz - M_yyyzz) + x*(-M_xxxxxx - M_xxxxyy) + y*(-M_xxxyzz - &
      M_xyyyzz) + z*(-M_xxxxxz - M_xxxyyz)) + (1.0d0/3243240.0d0)*( &
      M_xxxx*(-2570400*S_xxx + 5443200*S_xyy) + M_xyyyy*(-5670000*S_xx &
      + 3969000*S_yy) + M_yyyy*(-2268000*S_xxx + 3969000*S_xyy) + ( &
      -M_xxxzz - M_xyyzz)*(907200*S_xx + 793800*S_yy) + (-M_xxzz - &
      M_yyzz)*(680400*S_xxx + 793800*S_xyy)) + (1.0d0/810810.0d0)*( &
      M_xxx*(-756000*S_xxxx + 3118500*S_xxyy - 28350*S_xxzz - 28350* &
      S_yyyy - 28350*S_yyzz) + M_xxxy*(6690600*S_xxy - 907200*S_yyy) + &
      M_xxxz*(340200*S_xxz - 907200*S_yyz) + M_xyyy*(-5670000*S_xxy + &
      945000*S_yyy) + M_yyy*(-2268000*S_xxxy + 945000*S_xyyy) + ( &
      -M_xxxz - M_xyyz)*(529200*S_xxz + 415800*S_yyz) + (-M_xxz - M_yyz &
      )*(302400*S_xxxz + 415800*S_xyyz)) + (1.0d0/270270.0d0)*(M_xx*( &
      -181440*S_xxxxx + 1304100*S_xxxyy - 28350*S_xxxzz - 28350*S_xyyyy &
      - 28350*S_xyyzz) + M_xxy*(2759400*S_xxxy - 907200*S_xyyy) + M_xxz &
      *(37800*S_xxxz - 907200*S_xyyz) + M_xyy*(888300*S_xxxx - 2438100* &
      S_xxyy - 18900*S_xxzz + 94500*S_yyyy - 18900*S_yyzz) + M_xyyz*( &
      -869400*S_xxz + 491400*S_yyz) + M_yy*(230580*S_xxxxx - 1001700* &
      S_xxxyy - 18900*S_xxxzz + 94500*S_xyyyy - 18900*S_xyyzz) + M_yyz* &
      (-340200*S_xxxz + 491400*S_xyyz) + (-M_xx - M_yy)*(-49140*S_xxxxx &
      - 302400*S_xxxyy + 47250*S_xxxzz - 66150*S_xyyyy + 47250*S_xyyzz &
      ) + (-M_xxx - M_xyy)*(-132300*S_xxxx - 680400*S_xxyy + 47250* &
      S_xxzz - 66150*S_yyyy + 47250*S_yyzz) + (-M_xxxy - M_xyyy)*( &
      -1020600*S_xxy - 37800*S_yyy) + (-M_xxy - M_yyy)*(-491400*S_xxxy &
      - 37800*S_xyyy)))
    S_xxxxxyz  = (15.0d0/143.0d0)*h**2*x*y*z - 10.0d0/13.0d0*h*x**3*y*z + x**5*y*z
    Ms_xxxxxyz = Ms_xxxxxyz + (M_0*S_xxxxxyz + (560.0d0/143.0d0)*M_xxx*S_xxyz + (128.0d0/143.0d0)* &
      M_xxxxxyz + (1200.0d0/143.0d0)*M_xxyz*S_xxx + (30.0d0/143.0d0)*( &
      -M_xxxyyyz + x*(-M_xxyyyz - M_yyyyyz)) - 80.0d0/143.0d0*(M_xxxyyy &
      *z + y*(-M_xxxxxz - M_xxxyyz)) + (270.0d0/143.0d0)*(S_xyz*( &
      -M_xxyy - M_yyyy) + S_yz*(-M_xxxyy - M_xyyyy)) + (48.0d0/143.0d0) &
      *(M_xxxxx*S_yz + M_xxxxxy*z + M_xxxxxz*y) + (1.0d0/135135.0d0)*( &
      M_xy*(453600*S_xxxxz - 538650*S_xxyyz - 14175*S_xxzzz - 14175* &
      S_yyyyz - 14175*S_yyzzz) + M_xyz*(907200*S_xxxx - 255150*S_xxyy - &
      70875*S_xxzz - 184275*S_yyyy - 70875*S_yyzz) + M_xz*(907200* &
      S_xxxxy + 368550*S_xxyyy - 70875*S_xxyzz - 70875*S_yyyyy - 70875* &
      S_yyyzz) + M_yz*(272160*S_xxxxx - 255150*S_xxxyy - 70875*S_xxxzz &
      - 184275*S_xyyyy - 70875*S_xyyzz)) + (90.0d0/143.0d0)*(S_xy*( &
      -M_xxyyz - M_yyyyz) + S_xz*(-M_xxyyy - M_yyyyy) + y*(-M_xxxyyz - &
      M_xyyyyz) + z*(-M_xxxyyy - M_xyyyyy)) + (720.0d0/143.0d0)*(M_xx* &
      S_xxxyz + M_xxxyz*S_xx - M_xxyy*S_xyz - M_xxyyz*S_xy - S_xyz*( &
      -M_xxxx - M_xxyy) - S_xz*(-M_xxxxy - M_xxyyy)) + (75.0d0/143.0d0) &
      *(M_xyyyy*S_yz + M_xyyyyz*y + M_yyyy*S_xyz + M_yyyyz*S_xy + S_xyz &
      *(-M_xxzz - M_yyzz) + S_xz*(-M_xxyzz - M_yyyzz) + S_yz*(-M_xxxzz &
      - M_xyyzz) + z*(-M_xxxyzz - M_xyyyzz)) + (15.0d0/143.0d0)*( &
      -M_xxxyzzz + M_xyyyyy*z - M_xyyyyyz - M_xyyyzzz + M_yyyyy*S_xz + &
      M_yyyyyz*x + S_xy*(-M_xxzzz - M_yyzzz) + x*(-M_xxyzzz - M_yyyzzz &
      ) + y*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/810810.0d0)*(M_xxxy*( &
      3175200*S_xxz - 907200*S_yyz) + M_xxxz*(4082400*S_xxy + 907200* &
      S_yyy) + M_xyyy*(-1530900*S_xxz + 680400*S_yyz) + M_xyyyz*( &
      -1871100*S_xx + 340200*S_yy) + M_yyy*(-623700*S_xxxz + 680400* &
      S_xyyz) + M_yyyz*(-963900*S_xxx + 340200*S_xyy) + (-M_xxxyz - &
      M_xyyyz)*(-2211300*S_xx - 340200*S_yy) + (-M_xxxz - M_xyyz)*( &
      -2211300*S_xxy - 680400*S_yyy) + (-M_xxyz - M_yyyz)*(-1304100* &
      S_xxx - 340200*S_xyy) + (-M_xxz - M_yyz)*(-1304100*S_xxxy - &
      680400*S_xyyy)) + (1.0d0/270270.0d0)*(M_xxy*(1360800*S_xxxz - &
      907200*S_xyyz) + M_xxz*(2268000*S_xxxy + 907200*S_xyyy) + M_xyy*( &
      -1530900*S_xxyz + 113400*S_yyyz) + M_xyyz*(-1871100*S_xxy - &
      226800*S_yyy) + M_yy*(-623700*S_xxxyz + 113400*S_xyyyz) + M_yyz*( &
      -963900*S_xxxy - 226800*S_xyyy) + (-M_xx - M_yy)*(-737100*S_xxxyz &
      - 113400*S_xyyyz) + (-M_xxx - M_xyy)*(-1644300*S_xxyz - 113400* &
      S_yyyz) + (-M_xxxy - M_xyyy)*(-1644300*S_xxz + 226800*S_yyz) + ( &
      -M_xxy - M_yyy)*(-737100*S_xxxz + 226800*S_xyyz)) + (240.0d0/ &
      143.0d0)*(M_xxxx*S_xyz + M_xxxxy*S_xz + M_xxxxyz*x + M_xxxxz*S_xy &
      - M_xxxyy*S_yz - M_xxxyyz*y - M_xxyyy*S_xz - M_xxyyyz*x - S_xy*( &
      -M_xxxxz - M_xxyyz) - S_yz*(-M_xxxxx - M_xxxyy) - x*(-M_xxxxyz - &
      M_xxyyyz) - z*(-M_xxxxxy - M_xxxyyy)))
    S_xxxxyyy  = -1.0d0/143.0d0*h**3*y + (18.0d0/143.0d0)*h**2*x**2*y + (3.0d0/143.0d0)*h &
      **2*y**3 - 3.0d0/13.0d0*h*x**4*y - 6.0d0/13.0d0*h*x**2*y**3 + x** &
      4*y**3
    Ms_xxxxyyy = Ms_xxxxyyy + (M_0*S_xxxxyyy + (10.0d0/13.0d0)*M_xxxxyyy + (1.0d0/16216200.0d0)*M_yyyyy &
      *(-5443200*S_xx + 4422600*S_yy) + (1.0d0/1621620.0d0)*(M_xxyyy*( &
      5783400*S_xx - 4762800*S_yy) + (-M_xxyyy - M_yyyyy)*(-340200*S_xx &
      + 340200*S_yy)) + (1.0d0/540540.0d0)*(M_xxyy*(5783400*S_xxy - &
      1360800*S_yyy) + (-M_xxxx - M_xxyy)*(-340200*S_xxy - 453600*S_yyy &
      ) + (-M_xxxxy - M_xxyyy)*(-340200*S_xx - 680400*S_yy) + (-M_xxyy &
      - M_yyyy)*(-340200*S_xxy + 113400*S_yyy)) + (1.0d0/135135.0d0)*( &
      M_xy*(-90720*S_xxxxx + 1077300*S_xxxyy - 28350*S_xxxzz - 255150* &
      S_xyyyy - 28350*S_xyyzz) + M_xyz*(-113400*S_xxxz - 453600*S_xyyz &
      ) + M_xz*(-113400*S_xxxyz - 226800*S_xyyyz) + M_yz*(-56700* &
      S_xxxxz - 226800*S_xxyyz + 5670*S_xxzzz + 28350*S_yyyyz + 5670* &
      S_yyzzz)) + (1.0d0/3243240.0d0)*(M_xxxx*(-5443200*S_xxy + 1814400 &
      *S_yyy) + M_xxxxy*(-5443200*S_xx + 5443200*S_yy) + M_yyyy*( &
      -5443200*S_xxy + 1247400*S_yyy) + (-M_xxyzz - M_yyyzz)*(680400* &
      S_xx + 340200*S_yy) + (-M_xxzz - M_yyzz)*(680400*S_xxy + 340200* &
      S_yyy)) + (1.0d0/810810.0d0)*(M_xxx*(-1814400*S_xxxy + 1814400* &
      S_xyyy) + M_xxxy*(-1814400*S_xxx + 5443200*S_xyy) + M_xyyy*( &
      2154600*S_xxx - 4762800*S_xyy) + M_yyy*(623700*S_xxxx - 2551500* &
      S_xxyy + 226800*S_yyyy) + M_yyyz*(-340200*S_xxz + 340200*S_yyz) + &
      (-M_xxyz - M_yyyz)*(453600*S_xxz + 113400*S_yyz) + (-M_xxz - &
      M_yyz)*(453600*S_xxyz + 113400*S_yyyz)) + (1.0d0/270270.0d0)*( &
      M_xx*(-453600*S_xxxxy + 963900*S_xxyyy - 28350*S_xxyzz - 28350* &
      S_yyyyy - 28350*S_yyyzz) + M_xxy*(-453600*S_xxxx + 2891700*S_xxyy &
      - 28350*S_xxzz - 255150*S_yyyy - 28350*S_yyzz) + M_xxyz*(-113400* &
      S_xxz - 453600*S_yyz) + M_xxz*(-113400*S_xxyz - 226800*S_yyyz) + &
      M_xyy*(2154600*S_xxxy - 1360800*S_xyyy) + M_yy*(623700*S_xxxxy - &
      737100*S_xxyyy + 22680*S_yyyyy) + M_yyz*(-340200*S_xxyz + 113400* &
      S_yyyz) + (-M_xx - M_yy)*(-170100*S_xxxxy - 226800*S_xxyyy + &
      28350*S_xxyzz + 5670*S_yyyyy + 28350*S_yyyzz) + (-M_xxx - M_xyy)* &
      (-340200*S_xxxy - 453600*S_xyyy) + (-M_xxxy - M_xyyy)*(-340200* &
      S_xxx - 680400*S_xyy) + (-M_xxy - M_yyy)*(-170100*S_xxxx - 340200 &
      *S_xxyy + 28350*S_xxzz + 28350*S_yyyy + 28350*S_yyzz)) + (1.0d0/ &
      143.0d0)*(-96*M_xxxxx*S_xy - 16*M_xxxxxx*y - 16*M_xxxxxxy - 96* &
      M_xxxxxy*x + 240*M_xxxxyy*y - 15*M_xxxxyzz + 960*M_xxxyy*S_xy + &
      320*M_xxxyyy*x - 225*M_xxyyyy*y - 18*M_xxyyyyy - 60*M_xxyyyz*z - &
      15*M_xxyyyzz - 180*M_xxyyz*S_yz + M_xxyzzzz - 450*M_xyyyy*S_xy - &
      90*M_xyyyyy*x - 120*M_xyyyz*S_xz - 360*M_xyyz*S_xyz + 14*M_yyyyyy &
      *y - M_yyyyyyy + 6*M_yyyyyz*z + 30*M_yyyyz*S_yz + M_yyyzzzz - 180 &
      *S_xy*(-M_xxxyy - M_xyyyy) + 30*S_xy*(-M_xxxzz - M_xyyzz) + 120* &
      S_xyz*(-M_xxxz - M_xyyz) + 120*S_xz*(-M_xxxyz - M_xyyyz) + 60* &
      S_yz*(-M_xxxxz - M_xxyyz) - 6*S_yz*(-M_xxzzz - M_yyzzz) - 60*x*( &
      -M_xxxyyy - M_xyyyyy) + 30*x*(-M_xxxyzz - M_xyyyzz) - 90*y*( &
      -M_xxxxyy - M_xxyyyy) + 15*y*(-M_xxxxzz - M_xxyyzz) + 15*y*( &
      -M_xxyyyy - M_yyyyyy) - y*(-M_xxzzzz - M_yyzzzz) + 60*z*( &
      -M_xxxxyz - M_xxyyyz) - 6*z*(-M_xxyzzz - M_yyyzzz)))
    S_xxxxyyz  = -1.0d0/429.0d0*h**3*z + (6.0d0/143.0d0)*h**2*x**2*z + (3.0d0/143.0d0)*h &
      **2*y**2*z + x**4*y**2*z - 1.0d0/13.0d0*(h*x**4*z + 6*h*x**2*y**2 &
      *z)
    Ms_xxxxyyz = Ms_xxxxyyz + (M_0*S_xxxxyyz + (80.0d0/143.0d0)*M_xxxxyy*z + (10.0d0/11.0d0)*M_xxxxyyz &
      - 5.0d0/143.0d0*M_xxxxzzz - 5.0d0/13.0d0*M_xxyyyy*z - 7.0d0/ &
      143.0d0*M_xxyyzzz - 2.0d0/143.0d0*M_yyyyzzz - 200.0d0/143.0d0* &
      S_xy*(-M_xxxyz - M_xyyyz) - 600.0d0/143.0d0*S_xyz*(-M_xxxy - &
      M_xyyy) + (50.0d0/143.0d0)*S_xz*(-M_xxxzz - M_xyyzz) + (60.0d0/ &
      143.0d0)*S_yz*(-M_xxyyy - M_yyyyy) + (4.0d0/143.0d0)*y*(-M_xxyzzz &
      - M_yyyzzz) - 150.0d0/143.0d0*z*(-M_xxxxyy - M_xxyyyy) + (25.0d0/ &
      143.0d0)*z*(-M_xxxxzz - M_xxyyzz) + (15.0d0/143.0d0)*z*(-M_xxyyyy &
      - M_yyyyyy) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz)*(1360800* &
      S_xx + 1020600*S_yy) - 32.0d0/143.0d0*(M_xxxxx*S_xz + M_xxxxxz*x &
      ) + (160.0d0/143.0d0)*(M_xxxxy*S_yz + M_xxxxyz*y) + (640.0d0/ &
      143.0d0)*(M_xxxy*S_xyz + M_xxxyz*S_xy) + (320.0d0/143.0d0)*( &
      M_xxxyy*S_xz + M_xxxyyz*x) - 20.0d0/13.0d0*(M_xxyyy*S_yz + &
      M_xxyyyz*y) - 40.0d0/13.0d0*(M_xyyy*S_xyz + M_xyyyz*S_xy) - &
      10.0d0/13.0d0*(M_xyyyy*S_xz + M_xyyyyz*x) + (16.0d0/143.0d0)*( &
      M_yyyyy*S_yz + M_yyyyyz*y) - 300.0d0/143.0d0*(S_xz*(-M_xxxyy - &
      M_xyyyy) + S_yz*(-M_xxxxy - M_xxyyy)) + (20.0d0/143.0d0)*(S_yz*( &
      -M_xxyzz - M_yyyzz) + y*(-M_xxyyyz - M_yyyyyz)) - 100.0d0/143.0d0 &
      *(x*(-M_xxxyyz - M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/ &
      1621620.0d0)*((-M_xxxxz - M_xxyyz)*(-567000*S_xx - 1134000*S_yy) &
      + (-M_xxyyz - M_yyyyz)*(-793800*S_xx + 113400*S_yy)) + (10.0d0/ &
      143.0d0)*(-M_xxyyyyz + x*(-M_xxxzzz - M_xyyzzz) + z*(-M_xxyyzz - &
      M_yyyyzz)) + (1.0d0/540540.0d0)*(M_xxyy*(2003400*S_xxz - 1058400* &
      S_yyz) + M_xxyyz*(2381400*S_xx - 680400*S_yy) + (-M_xxxx - M_xxyy &
      )*(-189000*S_xxz - 756000*S_yyz) + (-M_xxyy - M_yyyy)*(-642600* &
      S_xxz + 264600*S_yyz)) + (1.0d0/135135.0d0)*(M_xy*(793800*S_xxxyz &
      - 226800*S_xyyyz) + M_xyz*(1171800*S_xxxy + 151200*S_xyyy) + M_xz &
      *(-30240*S_xxxxx + 585900*S_xxxyy - 47250*S_xxxzz + 179550* &
      S_xyyyy - 47250*S_xyyzz) + M_yz*(434700*S_xxxxy + 18900*S_xxyyy - &
      18900*S_xxyzz - 41580*S_yyyyy - 18900*S_yyyzz)) + (1.0d0/ &
      3243240.0d0)*(M_xxxx*(-1814400*S_xxz + 1814400*S_yyz) + M_xxxxz*( &
      -1814400*S_xx + 1814400*S_yy) + M_yyyy*(-1360800*S_xxz + 793800* &
      S_yyz) + M_yyyyz*(-1587600*S_xx + 567000*S_yy) + (-M_xxzz - &
      M_yyzz)*(831600*S_xxz + 491400*S_yyz)) + (1.0d0/810810.0d0)*( &
      M_xxx*(-604800*S_xxxz + 1814400*S_xyyz) + M_xxxz*(-604800*S_xxx + &
      1814400*S_xyy) + M_yyy*(-1360800*S_xxyz + 189000*S_yyyz) + M_yyyz &
      *(-1587600*S_xxy - 37800*S_yyy) + (-M_xxxz - M_xyyz)*(-567000* &
      S_xxx - 1134000*S_xyy) + (-M_xxyz - M_yyyz)*(-793800*S_xxy - &
      113400*S_yyy) + (-M_xxz - M_yyz)*(-283500*S_xxxx - 680400*S_xxyy &
      + 66150*S_xxzz - 85050*S_yyyy + 66150*S_yyzz)) + (1.0d0/429.0d0)* &
      (-16*M_xxxxxx*z - 16*M_xxxxxxz + M_xxzzzzz + 8*M_yyyyyy*z - 7* &
      M_yyyyyyz + M_yyzzzzz - 7*z*(-M_xxzzzz - M_yyzzzz)) + (1.0d0/ &
      270270.0d0)*(M_xx*(-151200*S_xxxxz + 1001700*S_xxyyz - 9450* &
      S_xxzzz - 9450*S_yyyyz - 9450*S_yyzzz) + M_xxy*(2003400*S_xxyz - &
      226800*S_yyyz) + M_xxyz*(2381400*S_xxy + 151200*S_yyy) + M_xxz*( &
      -151200*S_xxxx + 1190700*S_xxyy - 47250*S_xxzz + 179550*S_yyyy - &
      47250*S_yyzz) + M_xyy*(793800*S_xxxz - 1058400*S_xyyz) + M_xyyz*( &
      1171800*S_xxx - 680400*S_xyy) + M_yy*(245700*S_xxxxz - 585900* &
      S_xxyyz - 3780*S_xxzzz + 18900*S_yyyyz - 3780*S_yyzzz) + M_yyz*( &
      434700*S_xxxx - 510300*S_xxyy - 18900*S_xxzz - 94500*S_yyyy - &
      18900*S_yyzz) + (-M_xx - M_yy)*(-94500*S_xxxxz - 415800*S_xxyyz + &
      13230*S_xxzzz - 9450*S_yyyyz + 13230*S_yyzzz) + (-M_xxx - M_xyy)* &
      (-189000*S_xxxz - 756000*S_xyyz) + (-M_xxy - M_yyy)*(-642600* &
      S_xxyz + 37800*S_yyyz)))
    S_xxxyyyy  = -1.0d0/143.0d0*h**3*x + (3.0d0/143.0d0)*h**2*x**3 + (18.0d0/143.0d0)*h** &
      2*x*y**2 - 6.0d0/13.0d0*h*x**3*y**2 - 3.0d0/13.0d0*h*x*y**4 + x** &
      3*y**4
    Ms_xxxyyyy = Ms_xxxyyyy + (M_0*S_xxxyyyy + (1.0d0/16216200.0d0)*M_xxxxx*(4422600*S_xx - 5443200* &
      S_yy) + (10.0d0/13.0d0)*M_xxxyyyy + (1.0d0/1621620.0d0)*(M_xxxyy* &
      (-4762800*S_xx + 5783400*S_yy) + (-M_xxxxx - M_xxxyy)*(340200* &
      S_xx - 340200*S_yy)) + (1.0d0/540540.0d0)*(M_xxyy*(-1360800*S_xxx &
      + 5783400*S_xyy) + (-M_xxxx - M_xxyy)*(113400*S_xxx - 340200* &
      S_xyy) + (-M_xxxyy - M_xyyyy)*(-680400*S_xx - 340200*S_yy) + ( &
      -M_xxyy - M_yyyy)*(-453600*S_xxx - 340200*S_xyy)) + (1.0d0/ &
      135135.0d0)*(M_xy*(-255150*S_xxxxy + 1077300*S_xxyyy - 28350* &
      S_xxyzz - 90720*S_yyyyy - 28350*S_yyyzz) + M_xyz*(-453600*S_xxyz &
      - 113400*S_yyyz) + M_xz*(28350*S_xxxxz - 226800*S_xxyyz + 5670* &
      S_xxzzz - 56700*S_yyyyz + 5670*S_yyzzz) + M_yz*(-226800*S_xxxyz - &
      113400*S_xyyyz)) + (1.0d0/3243240.0d0)*(M_xxxx*(1247400*S_xxx - &
      5443200*S_xyy) + M_xyyyy*(5443200*S_xx - 5443200*S_yy) + M_yyyy*( &
      1814400*S_xxx - 5443200*S_xyy) + (-M_xxxzz - M_xyyzz)*(340200* &
      S_xx + 680400*S_yy) + (-M_xxzz - M_yyzz)*(340200*S_xxx + 680400* &
      S_xyy)) + (1.0d0/810810.0d0)*(M_xxx*(226800*S_xxxx - 2551500* &
      S_xxyy + 623700*S_yyyy) + M_xxxy*(-4762800*S_xxy + 2154600*S_yyy &
      ) + M_xxxz*(340200*S_xxz - 340200*S_yyz) + M_xyyy*(5443200*S_xxy &
      - 1814400*S_yyy) + M_yyy*(1814400*S_xxxy - 1814400*S_xyyy) + ( &
      -M_xxxz - M_xyyz)*(113400*S_xxz + 453600*S_yyz) + (-M_xxz - M_yyz &
      )*(113400*S_xxxz + 453600*S_xyyz)) + (1.0d0/270270.0d0)*(M_xx*( &
      22680*S_xxxxx - 737100*S_xxxyy + 623700*S_xyyyy) + M_xxy*( &
      -1360800*S_xxxy + 2154600*S_xyyy) + M_xxz*(113400*S_xxxz - 340200 &
      *S_xyyz) + M_xyy*(-255150*S_xxxx + 2891700*S_xxyy - 28350*S_xxzz &
      - 453600*S_yyyy - 28350*S_yyzz) + M_xyyz*(-453600*S_xxz - 113400* &
      S_yyz) + M_yy*(-28350*S_xxxxx + 963900*S_xxxyy - 28350*S_xxxzz - &
      453600*S_xyyyy - 28350*S_xyyzz) + M_yyz*(-226800*S_xxxz - 113400* &
      S_xyyz) + (-M_xx - M_yy)*(5670*S_xxxxx - 226800*S_xxxyy + 28350* &
      S_xxxzz - 170100*S_xyyyy + 28350*S_xyyzz) + (-M_xxx - M_xyy)*( &
      28350*S_xxxx - 340200*S_xxyy + 28350*S_xxzz - 170100*S_yyyy + &
      28350*S_yyzz) + (-M_xxxy - M_xyyy)*(-680400*S_xxy - 340200*S_yyy &
      ) + (-M_xxy - M_yyy)*(-453600*S_xxxy - 340200*S_xyyy)) + (1.0d0/ &
      143.0d0)*(14*M_xxxxxx*x - M_xxxxxxx - 90*M_xxxxxy*y - 18* &
      M_xxxxxyy + 6*M_xxxxxz*z - 450*M_xxxxy*S_xy - 225*M_xxxxyy*x + 30 &
      *M_xxxxz*S_xz + 320*M_xxxyyy*y - 60*M_xxxyyz*z - 15*M_xxxyyzz - &
      120*M_xxxyz*S_yz + M_xxxzzzz + 960*M_xxyyy*S_xy + 240*M_xxyyyy*x &
      - 180*M_xxyyz*S_xz - 360*M_xxyz*S_xyz - 96*M_xyyyyy*y - 16* &
      M_xyyyyyy - 15*M_xyyyyzz + M_xyyzzzz - 96*M_yyyyy*S_xy - 16* &
      M_yyyyyy*x - 180*S_xy*(-M_xxxxy - M_xxyyy) + 30*S_xy*(-M_xxyzz - &
      M_yyyzz) + 120*S_xyz*(-M_xxyz - M_yyyz) + 60*S_xz*(-M_xxyyz - &
      M_yyyyz) - 6*S_xz*(-M_xxzzz - M_yyzzz) + 120*S_yz*(-M_xxxyz - &
      M_xyyyz) + 15*x*(-M_xxxxxx - M_xxxxyy) - 90*x*(-M_xxxxyy - &
      M_xxyyyy) + 15*x*(-M_xxyyzz - M_yyyyzz) - x*(-M_xxzzzz - M_yyzzzz &
      ) - 60*y*(-M_xxxxxy - M_xxxyyy) + 30*y*(-M_xxxyzz - M_xyyyzz) + &
      60*z*(-M_xxxyyz - M_xyyyyz) - 6*z*(-M_xxxzzz - M_xyyzzz)))
    S_xxxyyyz  = (9.0d0/143.0d0)*h**2*x*y*z + x**3*y**3*z - 3.0d0/13.0d0*(h*x**3*y*z + h* &
      x*y**3*z)
    Ms_xxxyyyz = Ms_xxxyyyz + (M_0*S_xxxyyyz + (95.0d0/143.0d0)*M_xxxyyy*z + (125.0d0/143.0d0)* &
      M_xxxyyyz + (855.0d0/143.0d0)*(M_xxyy*S_xyz + M_xxyyz*S_xy) - &
      15.0d0/143.0d0*(x*(-M_xxyyyz - M_yyyyyz) + y*(-M_xxxxxz - &
      M_xxxyyz)) + (285.0d0/143.0d0)*(M_xxxyy*S_yz + M_xxxyyz*y + &
      M_xxyyy*S_xz + M_xxyyyz*x) + (1.0d0/135135.0d0)*(M_xy*(-70875* &
      S_xxxxz + 893025*S_xxyyz - 8505*S_xxzzz - 70875*S_yyyyz - 8505* &
      S_yyzzz) + M_xyz*(14175*S_xxxx + 1063125*S_xxyy - 42525*S_xxzz + &
      14175*S_yyyy - 42525*S_yyzz) + M_xz*(14175*S_xxxxy + 439425* &
      S_xxyyy - 42525*S_xxyzz + 19845*S_yyyyy - 42525*S_yyyzz) + M_yz*( &
      19845*S_xxxxx + 439425*S_xxxyy - 42525*S_xxxzz + 14175*S_xyyyy - &
      42525*S_xyyzz)) - 135.0d0/143.0d0*(S_xyz*(-M_xxxx - M_xxyy) + &
      S_xyz*(-M_xxyy - M_yyyy) + S_xz*(-M_xxxxy - M_xxyyy) + S_yz*( &
      -M_xxxyy - M_xyyyy)) - 24.0d0/143.0d0*(M_xxxxx*S_yz + M_xxxxxy*z &
      + M_xxxxxz*y + M_xyyyyy*z + M_yyyyy*S_xz + M_yyyyyz*x) + (9.0d0/ &
      143.0d0)*(-M_xxxxxyz - M_xxxyzzz - M_xyyyyyz - M_xyyyzzz + S_xy*( &
      -M_xxzzz - M_yyzzz) + x*(-M_xxyzzz - M_yyyzzz) + y*(-M_xxxzzz - &
      M_xyyzzz)) - 120.0d0/143.0d0*(M_xxxx*S_xyz + M_xxxxy*S_xz + &
      M_xxxxyz*x + M_xxxxz*S_xy + M_xyyyy*S_yz + M_xyyyyz*y + M_yyyy* &
      S_xyz + M_yyyyz*S_xy) + (1.0d0/270270.0d0)*(M_xx*(-368550*S_xxxyz &
      + 623700*S_xyyyz) + M_xxy*(-368550*S_xxxz + 1701000*S_xyyz) + &
      M_xxyz*(-198450*S_xxx + 1871100*S_xyy) + M_xxz*(-198450*S_xxxy + &
      793800*S_xyyy) + M_xyy*(1701000*S_xxyz - 368550*S_yyyz) + M_xyyz* &
      (1871100*S_xxy - 198450*S_yyy) + M_yy*(623700*S_xxxyz - 368550* &
      S_xyyyz) + M_yyz*(793800*S_xxxy - 198450*S_xyyy) + (-M_xx - M_yy) &
      *(-255150*S_xxxyz - 255150*S_xyyyz) + (-M_xxx - M_xyy)*(-425250* &
      S_xxyz - 255150*S_yyyz) + (-M_xxxy - M_xyyy)*(-425250*S_xxz - &
      425250*S_yyz) + (-M_xxy - M_yyy)*(-255150*S_xxxz - 425250*S_xyyz &
      )) + (1.0d0/810810.0d0)*(M_xxx*(-1275750*S_xxyz + 623700*S_yyyz) &
      + M_xxxy*(-1275750*S_xxz + 1701000*S_yyz) + M_xxxyz*(-1105650* &
      S_xx + 1871100*S_yy) + M_xxxz*(-1105650*S_xxy + 793800*S_yyy) + &
      M_xyyy*(1701000*S_xxz - 1275750*S_yyz) + M_xyyyz*(1871100*S_xx - &
      1105650*S_yy) + M_yyy*(623700*S_xxxz - 1275750*S_xyyz) + M_yyyz*( &
      793800*S_xxx - 1105650*S_xyy) + (-M_xxxyz - M_xyyyz)*(-765450* &
      S_xx - 765450*S_yy) + (-M_xxxz - M_xyyz)*(-765450*S_xxy - 595350* &
      S_yyy) + (-M_xxyz - M_yyyz)*(-595350*S_xxx - 765450*S_xyy) + ( &
      -M_xxz - M_yyz)*(-595350*S_xxxy - 595350*S_xyyy)) + (45.0d0/ &
      143.0d0)*(-S_xy*(-M_xxxxz - M_xxyyz) - S_xy*(-M_xxyyz - M_yyyyz) &
      + S_xyz*(-M_xxzz - M_yyzz) - S_xz*(-M_xxyyy - M_yyyyy) + S_xz*( &
      -M_xxyzz - M_yyyzz) - S_yz*(-M_xxxxx - M_xxxyy) + S_yz*(-M_xxxzz &
      - M_xyyzz) - x*(-M_xxxxyz - M_xxyyyz) - y*(-M_xxxyyz - M_xyyyyz) &
      - z*(-M_xxxxxy - M_xxxyyy) - z*(-M_xxxyyy - M_xyyyyy) + z*( &
      -M_xxxyzz - M_xyyyzz)))
    S_xxyyyyy  = -5.0d0/429.0d0*h**3*y + (15.0d0/143.0d0)*h**2*x**2*y + (10.0d0/143.0d0)* &
      h**2*y**3 + x**2*y**5 - 1.0d0/13.0d0*(10*h*x**2*y**3 + h*y**5)
    Ms_xxyyyyy = Ms_xxyyyyy + (M_0*S_xxyyyyy + (40.0d0/429.0d0)*M_xxxxxx*y - 35.0d0/429.0d0*M_xxxxxxy - &
      225.0d0/143.0d0*M_xxxxyy*y - 30.0d0/143.0d0*M_xxxxyyy - 900.0d0/ &
      143.0d0*M_xxxyy*S_xy - 300.0d0/143.0d0*M_xxxyyy*x + (20.0d0/ &
      11.0d0)*M_xxyyyy*y + (118.0d0/143.0d0)*M_xxyyyyy + (40.0d0/11.0d0 &
      )*M_xyyyy*S_xy + (8.0d0/11.0d0)*M_xyyyyy*x - 280.0d0/143.0d0* &
      M_xyyyz*S_xz - 840.0d0/143.0d0*M_xyyz*S_xyz + (1.0d0/16216200.0d0 &
      )*M_yyyyy*(5443200*S_xx - 6804000*S_yy) - 56.0d0/429.0d0*M_yyyyyy &
      *y - 20.0d0/429.0d0*M_yyyyyyy + (8.0d0/143.0d0)*M_yyyyyz*z - &
      5.0d0/143.0d0*M_yyyyyzz + (60.0d0/143.0d0)*S_yz*(-M_xxyyz - &
      M_yyyyz) + (25.0d0/143.0d0)*y*(-M_xxxxxx - M_xxxxyy) - 210.0d0/ &
      143.0d0*y*(-M_xxxxyy - M_xxyyyy) + (15.0d0/143.0d0)*(-M_xxyyyzz + &
      y*(-M_xxyyzz - M_yyyyzz)) + (50.0d0/143.0d0)*(M_xxxxyz*z + &
      M_xxxxz*S_yz) + (200.0d0/143.0d0)*(M_xxxyz*S_xz + M_xxxz*S_xyz) + &
      (1.0d0/1621620.0d0)*(M_xxyyy*(-4309200*S_xx + 6690600*S_yy) + ( &
      -M_xxyyy - M_yyyyy)*(-1134000*S_xx + 113400*S_yy)) - 140.0d0/ &
      143.0d0*(M_xxyyyz*z + x*(-M_xxxyyy - M_xyyyyy)) - 420.0d0/143.0d0 &
      *(M_xxyyz*S_yz + S_xy*(-M_xxxyy - M_xyyyy)) + (100.0d0/143.0d0)*( &
      S_xy*(-M_xxxxx - M_xxxyy) + x*(-M_xxxxxy - M_xxxyyy)) + (5.0d0/ &
      429.0d0)*(M_xxyzzzz + M_yyyzzzz - y*(-M_xxzzzz - M_yyzzzz)) + ( &
      40.0d0/143.0d0)*(M_yyyyz*S_yz + S_yz*(-M_xxxxz - M_xxyyz) + z*( &
      -M_xxxxyz - M_xxyyyz)) + (10.0d0/143.0d0)*(-M_xxxxyzz - S_yz*( &
      -M_xxzzz - M_yyzzz) + y*(-M_xxxxzz - M_xxyyzz) - z*(-M_xxyzzz - &
      M_yyyzzz)) + (80.0d0/143.0d0)*(M_xxxxx*S_xy + M_xxxxxy*x + S_xyz* &
      (-M_xxxz - M_xyyz) + S_xz*(-M_xxxyz - M_xyyyz)) + (1.0d0/ &
      540540.0d0)*(M_xxyy*(-4309200*S_xxy + 2759400*S_yyy) + (-M_xxxx - &
      M_xxyy)*(340200*S_xxy - 491400*S_yyy) + (-M_xxxxy - M_xxyyy)*( &
      340200*S_xx - 1020600*S_yy) + (-M_xxyy - M_yyyy)*(-1134000*S_xxy &
      - 189000*S_yyy)) + (1.0d0/135135.0d0)*(M_xy*(-18900*S_xxxxx - &
      548100*S_xxxyy - 18900*S_xxxzz + 888300*S_xyyyy - 18900*S_xyyzz) &
      + M_xyz*(113400*S_xxxz - 869400*S_xyyz) + M_xz*(113400*S_xxxyz - &
      340200*S_xyyyz) + M_yz*(9450*S_xxxxz - 491400*S_xxyyz + 9450* &
      S_xxzzz - 18900*S_yyyyz + 9450*S_yyzzz)) + (20.0d0/143.0d0)*(S_xy &
      *(-M_xxxzz - M_xyyzz) + x*(-M_xxxyzz - M_xyyyzz) + y*(-M_xxyyyy - &
      M_yyyyyy) + z*(-M_xxyyyz - M_yyyyyz)) + (1.0d0/3243240.0d0)*( &
      M_xxxx*(3969000*S_xxy - 2268000*S_yyy) + M_xxxxy*(3969000*S_xx - &
      5670000*S_yy) + M_yyyy*(5443200*S_xxy - 2570400*S_yyy) + ( &
      -M_xxyzz - M_yyyzz)*(793800*S_xx + 907200*S_yy) + (-M_xxzz - &
      M_yyzz)*(793800*S_xxy + 680400*S_yyy)) + (1.0d0/810810.0d0)*( &
      M_xxx*(945000*S_xxxy - 2268000*S_xyyy) + M_xxxy*(945000*S_xxx - &
      5670000*S_xyy) + M_xyyy*(-907200*S_xxx + 6690600*S_xyy) + M_yyy*( &
      -28350*S_xxxx + 3118500*S_xxyy - 28350*S_xxzz - 756000*S_yyyy - &
      28350*S_yyzz) + M_yyyz*(-907200*S_xxz + 340200*S_yyz) + (-M_xxyz &
      - M_yyyz)*(415800*S_xxz + 529200*S_yyz) + (-M_xxz - M_yyz)*( &
      415800*S_xxyz + 302400*S_yyyz)) + (1.0d0/270270.0d0)*(M_xx*(94500 &
      *S_xxxxy - 1001700*S_xxyyy - 18900*S_xxyzz + 230580*S_yyyyy - &
      18900*S_yyyzz) + M_xxy*(94500*S_xxxx - 2438100*S_xxyy - 18900* &
      S_xxzz + 888300*S_yyyy - 18900*S_yyzz) + M_xxyz*(491400*S_xxz - &
      869400*S_yyz) + M_xxz*(491400*S_xxyz - 340200*S_yyyz) + M_xyy*( &
      -907200*S_xxxy + 2759400*S_xyyy) + M_yy*(-28350*S_xxxxy + 1304100 &
      *S_xxyyy - 28350*S_xxyzz - 181440*S_yyyyy - 28350*S_yyyzz) + &
      M_yyz*(-907200*S_xxyz + 37800*S_yyyz) + (-M_xx - M_yy)*(-66150* &
      S_xxxxy - 302400*S_xxyyy + 47250*S_xxyzz - 49140*S_yyyyy + 47250* &
      S_yyyzz) + (-M_xxx - M_xyy)*(-37800*S_xxxy - 491400*S_xyyy) + ( &
      -M_xxxy - M_xyyy)*(-37800*S_xxx - 1020600*S_xyy) + (-M_xxy - &
      M_yyy)*(-66150*S_xxxx - 680400*S_xxyy + 47250*S_xxzz - 132300* &
      S_yyyy + 47250*S_yyzz)))
    S_xxyyyyz  = -1.0d0/429.0d0*h**3*z + (3.0d0/143.0d0)*h**2*x**2*z + (6.0d0/143.0d0)*h &
      **2*y**2*z + x**2*y**4*z - 1.0d0/13.0d0*(6*h*x**2*y**2*z + h*y**4 &
      *z)
    Ms_xxyyyyz = Ms_xxyyyyz + (M_0*S_xxyyyyz - 5.0d0/13.0d0*M_xxxxyy*z - 2.0d0/143.0d0*M_xxxxzzz + ( &
      80.0d0/143.0d0)*M_xxyyyy*z + (10.0d0/11.0d0)*M_xxyyyyz - 7.0d0/ &
      143.0d0*M_xxyyzzz - 5.0d0/143.0d0*M_yyyyzzz - 200.0d0/143.0d0* &
      S_xy*(-M_xxxyz - M_xyyyz) - 600.0d0/143.0d0*S_xyz*(-M_xxxy - &
      M_xyyy) + (60.0d0/143.0d0)*S_xz*(-M_xxxxx - M_xxxyy) + (50.0d0/ &
      143.0d0)*S_yz*(-M_xxyzz - M_yyyzz) + (4.0d0/143.0d0)*x*(-M_xxxzzz &
      - M_xyyzzz) + (15.0d0/143.0d0)*z*(-M_xxxxxx - M_xxxxyy) - 150.0d0 &
      /143.0d0*z*(-M_xxxxyy - M_xxyyyy) + (25.0d0/143.0d0)*z*(-M_xxyyzz &
      - M_yyyyzz) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz)*(1020600* &
      S_xx + 1360800*S_yy) + (16.0d0/143.0d0)*(M_xxxxx*S_xz + M_xxxxxz* &
      x) - 10.0d0/13.0d0*(M_xxxxy*S_yz + M_xxxxyz*y) - 40.0d0/13.0d0*( &
      M_xxxy*S_xyz + M_xxxyz*S_xy) - 20.0d0/13.0d0*(M_xxxyy*S_xz + &
      M_xxxyyz*x) + (320.0d0/143.0d0)*(M_xxyyy*S_yz + M_xxyyyz*y) + ( &
      640.0d0/143.0d0)*(M_xyyy*S_xyz + M_xyyyz*S_xy) + (160.0d0/143.0d0 &
      )*(M_xyyyy*S_xz + M_xyyyyz*x) - 32.0d0/143.0d0*(M_yyyyy*S_yz + &
      M_yyyyyz*y) - 300.0d0/143.0d0*(S_xz*(-M_xxxyy - M_xyyyy) + S_yz*( &
      -M_xxxxy - M_xxyyy)) + (20.0d0/143.0d0)*(S_xz*(-M_xxxzz - M_xyyzz &
      ) + x*(-M_xxxxxz - M_xxxyyz)) - 100.0d0/143.0d0*(x*(-M_xxxyyz - &
      M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/1621620.0d0)*(( &
      -M_xxxxz - M_xxyyz)*(113400*S_xx - 793800*S_yy) + (-M_xxyyz - &
      M_yyyyz)*(-1134000*S_xx - 567000*S_yy)) + (10.0d0/143.0d0)*( &
      -M_xxxxyyz + y*(-M_xxyzzz - M_yyyzzz) + z*(-M_xxxxzz - M_xxyyzz &
      )) + (1.0d0/540540.0d0)*(M_xxyy*(-1058400*S_xxz + 2003400*S_yyz) &
      + M_xxyyz*(-680400*S_xx + 2381400*S_yy) + (-M_xxxx - M_xxyy)*( &
      264600*S_xxz - 642600*S_yyz) + (-M_xxyy - M_yyyy)*(-756000*S_xxz &
      - 189000*S_yyz)) + (1.0d0/135135.0d0)*(M_xy*(-226800*S_xxxyz + &
      793800*S_xyyyz) + M_xyz*(151200*S_xxxy + 1171800*S_xyyy) + M_xz*( &
      -41580*S_xxxxx + 18900*S_xxxyy - 18900*S_xxxzz + 434700*S_xyyyy - &
      18900*S_xyyzz) + M_yz*(179550*S_xxxxy + 585900*S_xxyyy - 47250* &
      S_xxyzz - 30240*S_yyyyy - 47250*S_yyyzz)) + (1.0d0/3243240.0d0)*( &
      M_xxxx*(793800*S_xxz - 1360800*S_yyz) + M_xxxxz*(567000*S_xx - &
      1587600*S_yy) + M_yyyy*(1814400*S_xxz - 1814400*S_yyz) + M_yyyyz* &
      (1814400*S_xx - 1814400*S_yy) + (-M_xxzz - M_yyzz)*(491400*S_xxz &
      + 831600*S_yyz)) + (1.0d0/810810.0d0)*(M_xxx*(189000*S_xxxz - &
      1360800*S_xyyz) + M_xxxz*(-37800*S_xxx - 1587600*S_xyy) + M_yyy*( &
      1814400*S_xxyz - 604800*S_yyyz) + M_yyyz*(1814400*S_xxy - 604800* &
      S_yyy) + (-M_xxxz - M_xyyz)*(-113400*S_xxx - 793800*S_xyy) + ( &
      -M_xxyz - M_yyyz)*(-1134000*S_xxy - 567000*S_yyy) + (-M_xxz - &
      M_yyz)*(-85050*S_xxxx - 680400*S_xxyy + 66150*S_xxzz - 283500* &
      S_yyyy + 66150*S_yyzz)) + (1.0d0/429.0d0)*(8*M_xxxxxx*z - 7* &
      M_xxxxxxz + M_xxzzzzz - 16*M_yyyyyy*z - 16*M_yyyyyyz + M_yyzzzzz &
      - 7*z*(-M_xxzzzz - M_yyzzzz)) + (1.0d0/270270.0d0)*(M_xx*(18900* &
      S_xxxxz - 585900*S_xxyyz - 3780*S_xxzzz + 245700*S_yyyyz - 3780* &
      S_yyzzz) + M_xxy*(-1058400*S_xxyz + 793800*S_yyyz) + M_xxyz*( &
      -680400*S_xxy + 1171800*S_yyy) + M_xxz*(-94500*S_xxxx - 510300* &
      S_xxyy - 18900*S_xxzz + 434700*S_yyyy - 18900*S_yyzz) + M_xyy*( &
      -226800*S_xxxz + 2003400*S_xyyz) + M_xyyz*(151200*S_xxx + 2381400 &
      *S_xyy) + M_yy*(-9450*S_xxxxz + 1001700*S_xxyyz - 9450*S_xxzzz - &
      151200*S_yyyyz - 9450*S_yyzzz) + M_yyz*(179550*S_xxxx + 1190700* &
      S_xxyy - 47250*S_xxzz - 151200*S_yyyy - 47250*S_yyzz) + (-M_xx - &
      M_yy)*(-9450*S_xxxxz - 415800*S_xxyyz + 13230*S_xxzzz - 94500* &
      S_yyyyz + 13230*S_yyzzz) + (-M_xxx - M_xyy)*(37800*S_xxxz - &
      642600*S_xyyz) + (-M_xxy - M_yyy)*(-756000*S_xxyz - 189000*S_yyyz &
      )))
    S_xyyyyyy  = -5.0d0/429.0d0*h**3*x + (45.0d0/143.0d0)*h**2*x*y**2 - 15.0d0/13.0d0*h*x &
      *y**4 + x*y**6
    Ms_xyyyyyy = Ms_xyyyyyy + (M_0*S_xyyyyyy + (1.0d0/16216200.0d0)*M_xxxxx*(-3402000*S_xx + 5103000* &
      S_yy) - 35.0d0/429.0d0*M_xxxxxx*x + (10.0d0/429.0d0)*M_xxxxxxx + &
      (5.0d0/143.0d0)*M_xxxxxzz + (200.0d0/143.0d0)*M_xxxxyy*x - 50.0d0 &
      /143.0d0*M_xxxxz*S_xz + (304.0d0/429.0d0)*M_xyyyyyy + (2240.0d0/ &
      429.0d0)*M_yyy*S_xyyy + (64.0d0/429.0d0)*M_yyyyyy*x - 1120.0d0/ &
      143.0d0*M_yyz*S_xyyz - 60.0d0/143.0d0*S_xz*(-M_xxxxz - M_xxyyz) - &
      720.0d0/143.0d0*S_yy*(-M_xxxyy - M_xyyyy) - 800.0d0/143.0d0*S_yyy &
      *(-M_xxxy - M_xyyy) - 25.0d0/143.0d0*x*(-M_xxxxxx - M_xxxxyy) - &
      15.0d0/143.0d0*x*(-M_xxxxzz - M_xxyyzz) - 20.0d0/143.0d0*z*( &
      -M_xxxxxz - M_xxxyyz) - 35.0d0/143.0d0*(M_xxxxxyy + M_xxxyyzz) + &
      (40.0d0/143.0d0)*(-M_xyyyyzz + x*(-M_xxyyzz - M_yyyyzz)) + ( &
      400.0d0/143.0d0)*(M_xxxxy*S_xy + M_yyyy*S_xyy) + (1.0d0/ &
      1621620.0d0)*(M_xxxyy*(3628800*S_xx - 6350400*S_yy) + (-M_xxxxx - &
      M_xxxyy)*(-226800*S_xx + 1247400*S_yy)) + (240.0d0/143.0d0)*( &
      -M_xxyyyy*x + x*(-M_xxxxyy - M_xxyyyy)) + (480.0d0/143.0d0)*( &
      M_xxyyz*S_xz + S_xy*(-M_xxxxy - M_xxyyy)) + (128.0d0/143.0d0)*( &
      M_xyyyyy*y + M_yyyyy*S_xy) - 640.0d0/143.0d0*(M_xyyyz*S_yz + &
      M_yyyz*S_xyz) + (5.0d0/429.0d0)*(M_xxxzzzz + M_xyyzzzz - x*( &
      -M_xxzzzz - M_yyzzzz)) - 10.0d0/143.0d0*(M_xxxxxz*z + S_xz*( &
      -M_xxzzz - M_yyzzz) + z*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/ &
      540540.0d0)*(M_xxyy*(604800*S_xxx - 6350400*S_xyy) + (-M_xxxx - &
      M_xxyy)*(151200*S_xxx + 1247400*S_xyy) + (-M_xxyy - M_yyyy)*( &
      -604800*S_xxx - 2721600*S_xyy)) + (960.0d0/143.0d0)*(-M_xxyyy* &
      S_xy + M_xxyz*S_xyz - M_yz*S_xyyyz) + (1.0d0/135135.0d0)*(M_xy*( &
      -75600*S_xxxxy - 1058400*S_xxyyy - 75600*S_xxyzz + 423360*S_yyyyy &
      - 75600*S_yyyzz) + M_xyz*(604800*S_xxyz - 907200*S_yyyz) + M_xz*( &
      9450*S_xxxxz + 359100*S_xxyyz + 9450*S_xxzzz - 302400*S_yyyyz + &
      9450*S_yyzzz)) + (1.0d0/3243240.0d0)*(M_xxxx*(-756000*S_xxx + &
      5103000*S_xyy) + M_xyyyy*(-3628800*S_xx + 9072000*S_yy) + ( &
      -M_xxxzz - M_xyyzz)*(226800*S_xx + 1474200*S_yy) + (-M_xxzz - &
      M_yyzz)*(453600*S_xxx + 1474200*S_xyy)) + (80.0d0/143.0d0)*( &
      M_xxxxxy*y - M_xxxyyyy + S_xy*(-M_xxyzz - M_yyyzz) - x*(-M_xxyyyy &
      - M_yyyyyy) + y*(-M_xxxyzz - M_xyyyzz)) + (1.0d0/810810.0d0)*( &
      M_xxx*(-47250*S_xxxx + 2097900*S_xxyy + 28350*S_xxzz - 907200* &
      S_yyyy + 28350*S_yyzz) + M_xxxy*(3628800*S_xxy - 2721600*S_yyy) + &
      M_xxxz*(-453600*S_xxz + 1020600*S_yyz) + M_xyyy*(-3628800*S_xxy + &
      4233600*S_yyy) + (-M_xxxz - M_xyyz)*(-151200*S_xxz + 1096200* &
      S_yyz) + (-M_xxz - M_yyz)*(75600*S_xxxz + 1096200*S_xyyz)) + ( &
      320.0d0/143.0d0)*(-M_xxxyyy*y + M_xxxyz*S_yz - S_xy*(-M_xxyyy - &
      M_yyyyy) + S_xyz*(-M_xxyz - M_yyyz) + S_yz*(-M_xxxyz - M_xyyyz) - &
      y*(-M_xxxyyy - M_xyyyyy)) + (160.0d0/143.0d0)*(M_xxxyyz*z - &
      M_xyyyyz*z - M_yyyyz*S_xz + S_xz*(-M_xxyyz - M_yyyyz) + y*( &
      -M_xxxxxy - M_xxxyyy) + z*(-M_xxxyyz - M_xyyyyz)) + (1.0d0/ &
      270270.0d0)*(M_xx*(28350*S_xxxxx + 396900*S_xxxyy + 28350*S_xxxzz &
      - 907200*S_xyyyy + 28350*S_xyyzz) + M_xxy*(604800*S_xxxy - &
      2721600*S_xyyy) + M_xxz*(-75600*S_xxxz + 1020600*S_xyyz) + M_xyy* &
      (-75600*S_xxxx - 2268000*S_xxyy - 75600*S_xxzz + 1512000*S_yyyy - &
      75600*S_yyzz) + M_xyyz*(604800*S_xxz - 2116800*S_yyz) + M_yy*( &
      -75600*S_xxxxx - 151200*S_xxxyy - 75600*S_xxxzz + 1512000*S_xyyyy &
      - 75600*S_xyyzz) + (-M_xx - M_yy)*(47250*S_xxxxx - 245700*S_xxxyy &
      + 47250*S_xxxzz - 604800*S_xyyyy + 47250*S_xyyzz) + (-M_xxx - &
      M_xyy)*(122850*S_xxxx + 170100*S_xxyy + 47250*S_xxzz - 604800* &
      S_yyyy + 47250*S_yyzz) + (-M_xxy - M_yyy)*(-604800*S_xxxy - &
      1512000*S_xyyy)))
    S_xyyyyyz  = (15.0d0/143.0d0)*h**2*x*y*z - 10.0d0/13.0d0*h*x*y**3*z + x*y**5*z
    Ms_xyyyyyz = Ms_xyyyyyz + (M_0*S_xyyyyyz + (128.0d0/143.0d0)*M_xyyyyyz + (1200.0d0/143.0d0)*M_xyyz* &
      S_yyy + (560.0d0/143.0d0)*M_yyy*S_xyyz + (30.0d0/143.0d0)*( &
      -M_xxxyyyz + y*(-M_xxxxxz - M_xxxyyz)) - 80.0d0/143.0d0*(M_xxxyyy &
      *z + x*(-M_xxyyyz - M_yyyyyz)) + (270.0d0/143.0d0)*(S_xyz*( &
      -M_xxxx - M_xxyy) + S_xz*(-M_xxxxy - M_xxyyy)) + (48.0d0/143.0d0) &
      *(M_xyyyyy*z + M_yyyyy*S_xz + M_yyyyyz*x) + (1.0d0/135135.0d0)*( &
      M_xy*(-14175*S_xxxxz - 538650*S_xxyyz - 14175*S_xxzzz + 453600* &
      S_yyyyz - 14175*S_yyzzz) + M_xyz*(-184275*S_xxxx - 255150*S_xxyy &
      - 70875*S_xxzz + 907200*S_yyyy - 70875*S_yyzz) + M_xz*(-184275* &
      S_xxxxy - 255150*S_xxyyy - 70875*S_xxyzz + 272160*S_yyyyy - 70875 &
      *S_yyyzz) + M_yz*(-70875*S_xxxxx + 368550*S_xxxyy - 70875*S_xxxzz &
      + 907200*S_xyyyy - 70875*S_xyyzz)) + (90.0d0/143.0d0)*(S_xy*( &
      -M_xxxxz - M_xxyyz) + S_yz*(-M_xxxxx - M_xxxyy) + x*(-M_xxxxyz - &
      M_xxyyyz) + z*(-M_xxxxxy - M_xxxyyy)) + (720.0d0/143.0d0)*( &
      -M_xxyy*S_xyz - M_xxyyz*S_xy + M_xyyyz*S_yy + M_yy*S_xyyyz - &
      S_xyz*(-M_xxyy - M_yyyy) - S_yz*(-M_xxxyy - M_xyyyy)) + (75.0d0/ &
      143.0d0)*(M_xxxx*S_xyz + M_xxxxy*S_xz + M_xxxxyz*x + M_xxxxz*S_xy &
      + S_xyz*(-M_xxzz - M_yyzz) + S_xz*(-M_xxyzz - M_yyyzz) + S_yz*( &
      -M_xxxzz - M_xyyzz) + z*(-M_xxxyzz - M_xyyyzz)) + (15.0d0/143.0d0 &
      )*(M_xxxxx*S_yz + M_xxxxxy*z - M_xxxxxyz + M_xxxxxz*y - M_xxxyzzz &
      - M_xyyyzzz + S_xy*(-M_xxzzz - M_yyzzz) + x*(-M_xxyzzz - M_yyyzzz &
      ) + y*(-M_xxxzzz - M_xyyzzz)) + (1.0d0/270270.0d0)*(M_xx*(113400* &
      S_xxxyz - 623700*S_xyyyz) + M_xxy*(113400*S_xxxz - 1530900*S_xyyz &
      ) + M_xxyz*(-226800*S_xxx - 1871100*S_xyy) + M_xxz*(-226800* &
      S_xxxy - 963900*S_xyyy) + M_xyy*(-907200*S_xxyz + 1360800*S_yyyz &
      ) + M_yyz*(907200*S_xxxy + 2268000*S_xyyy) + (-M_xx - M_yy)*( &
      -113400*S_xxxyz - 737100*S_xyyyz) + (-M_xxx - M_xyy)*(226800* &
      S_xxyz - 737100*S_yyyz) + (-M_xxxy - M_xyyy)*(226800*S_xxz - &
      1644300*S_yyz) + (-M_xxy - M_yyy)*(-113400*S_xxxz - 1644300* &
      S_xyyz)) + (1.0d0/810810.0d0)*(M_xxx*(680400*S_xxyz - 623700* &
      S_yyyz) + M_xxxy*(680400*S_xxz - 1530900*S_yyz) + M_xxxyz*(340200 &
      *S_xx - 1871100*S_yy) + M_xxxz*(340200*S_xxy - 963900*S_yyy) + &
      M_xyyy*(-907200*S_xxz + 3175200*S_yyz) + M_yyyz*(907200*S_xxx + &
      4082400*S_xyy) + (-M_xxxyz - M_xyyyz)*(-340200*S_xx - 2211300* &
      S_yy) + (-M_xxxz - M_xyyz)*(-340200*S_xxy - 1304100*S_yyy) + ( &
      -M_xxyz - M_yyyz)*(-680400*S_xxx - 2211300*S_xyy) + (-M_xxz - &
      M_yyz)*(-680400*S_xxxy - 1304100*S_xyyy)) + (240.0d0/143.0d0)*( &
      -M_xxxyy*S_yz - M_xxxyyz*y - M_xxyyy*S_xz - M_xxyyyz*x + M_xyyyy* &
      S_yz + M_xyyyyz*y + M_yyyy*S_xyz + M_yyyyz*S_xy - S_xy*(-M_xxyyz &
      - M_yyyyz) - S_xz*(-M_xxyyy - M_yyyyy) - y*(-M_xxxyyz - M_xyyyyz &
      ) - z*(-M_xxxyyy - M_xyyyyy)))
    S_yyyyyyy  = -35.0d0/429.0d0*h**3*y + (105.0d0/143.0d0)*h**2*y**3 - 21.0d0/13.0d0*h*y &
      **5 + y**7
    Ms_yyyyyyy = Ms_yyyyyyy + (M_0*S_yyyyyyy + (70.0d0/429.0d0)*M_xxxxxxy + (1680.0d0/143.0d0)*M_xyyz* &
      S_xyz + (1400.0d0/429.0d0)*M_yyyy*S_yyy + (168.0d0/143.0d0)* &
      M_yyyyy*S_yy + (112.0d0/429.0d0)*M_yyyyyy*y + (184.0d0/429.0d0)* &
      M_yyyyyyy + (630.0d0/143.0d0)*S_yy*(-M_xxxxy - M_xxyyy) + ( &
      350.0d0/143.0d0)*S_yyy*(-M_xxxx - M_xxyy) + (420.0d0/143.0d0)*y*( &
      -M_xxxxyy - M_xxyyyy) + (210.0d0/143.0d0)*(M_xxxxyy*y + y*( &
      -M_xxyyzz - M_yyyyzz)) + (1.0d0/540540.0d0)*(M_xxyy*(3175200* &
      S_xxy - 3704400*S_yyy) + (-M_xxyy - M_yyyy)*(-3175200*S_xxy - &
      6879600*S_yyy)) + (1.0d0/1621620.0d0)*(M_xxyyy*(3175200*S_xx - &
      7938000*S_yy) + (-M_xxyyy - M_yyyyy)*(-3175200*S_xx - 11113200* &
      S_yy)) + (1.0d0/135135.0d0)*(M_xy*(66150*S_xxxxx + 132300*S_xxxyy &
      + 66150*S_xxxzz - 1323000*S_xyyyy + 66150*S_xyyzz) + M_yz*(66150* &
      S_xxxxz + 132300*S_xxyyz + 66150*S_xxzzz - 1323000*S_yyyyz + &
      66150*S_yyzzz)) - 1400.0d0/143.0d0*(M_xyyy*S_xyy + M_yyyz*S_yyz) &
      - 112.0d0/143.0d0*(M_xyyyyy*x + M_yyyyyz*z) + (1960.0d0/143.0d0)* &
      (-M_xyy*S_xyyy + M_xyz*S_xyyz - M_yyz*S_yyyz) + (560.0d0/143.0d0) &
      *(-M_xyyyy*S_xy + M_xyyyz*S_xz - M_yyyyz*S_yz) + (1.0d0/ &
      3243240.0d0)*(M_xxxx*(-3175200*S_xxy + 2381400*S_yyy) + M_xxxxy*( &
      -3175200*S_xx + 5556600*S_yy) + (-M_xxyzz - M_yyyzz)*(3175200* &
      S_xx + 8731800*S_yy) + (-M_xxzz - M_yyzz)*(3175200*S_xxy + &
      5556600*S_yyy)) + (35.0d0/429.0d0)*(-M_xxxxxx*y + M_xxyzzzz + &
      M_yyyzzzz - y*(-M_xxzzzz - M_yyzzzz)) + (35.0d0/143.0d0)*( &
      -M_xxxxyyy + M_xxxxyzz - M_xxyyyzz - y*(-M_xxxxxx - M_xxxxyy) - y &
      *(-M_xxxxzz - M_xxyyzz)) - 140.0d0/143.0d0*(M_xxyyyyy + S_xy*( &
      -M_xxxxx - M_xxxyy) + S_yz*(-M_xxxxz - M_xxyyz) + x*(-M_xxxxxy - &
      M_xxxyyy) + z*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/810810.0d0)*(M_xxx &
      *(-529200*S_xxxy + 2381400*S_xyyy) + M_xxxy*(-529200*S_xxx + &
      5556600*S_xyy) + M_yyy*(-396900*S_xxxx - 793800*S_xxyy - 396900* &
      S_xxzz + 4233600*S_yyyy - 396900*S_yyzz) + (-M_xxyz - M_yyyz)*( &
      529200*S_xxz + 6085800*S_yyz) + (-M_xxz - M_yyz)*(529200*S_xxyz + &
      2910600*S_yyyz)) + (840.0d0/143.0d0)*(M_xxxyy*S_xy + M_xxyyz*S_yz &
      + M_xz*S_xyyyz + S_xy*(-M_xxxyy - M_xyyyy) + S_yz*(-M_xxyyz - &
      M_yyyyz)) + (1.0d0/270270.0d0)*(M_xx*(66150*S_xxxxy + 926100* &
      S_xxyyy + 66150*S_xxyzz - 370440*S_yyyyy + 66150*S_yyyzz) + M_xxy &
      *(66150*S_xxxx + 1984500*S_xxyy + 66150*S_xxzz - 1323000*S_yyyy + &
      66150*S_yyzz) + M_xxyz*(-529200*S_xxz + 1852200*S_yyz) + M_xxz*( &
      -529200*S_xxyz + 793800*S_yyyz) + M_yy*(-396900*S_xxxxy - 793800* &
      S_xxyyy - 396900*S_xxyzz + 1270080*S_yyyyy - 396900*S_yyyzz) + ( &
      -M_xx - M_yy)*(330750*S_xxxxy - 132300*S_xxyyy + 330750*S_xxyzz - &
      899640*S_yyyyy + 330750*S_yyyzz) + (-M_xxx - M_xyy)*(529200* &
      S_xxxy + 1323000*S_xyyy) + (-M_xxxy - M_xyyy)*(529200*S_xxx + &
      2381400*S_xyy) + (-M_xxy - M_yyy)*(330750*S_xxxx - 1190700*S_xxyy &
      + 330750*S_xxzz - 2910600*S_yyyy + 330750*S_yyzz)) - 70.0d0/ &
      143.0d0*(M_xxxxx*S_xy + M_xxxxxy*x + M_xxxxyz*z + M_xxxxz*S_yz + &
      M_yyyyyzz + S_xy*(-M_xxxzz - M_xyyzz) + S_yz*(-M_xxzzz - M_yyzzz &
      ) + x*(-M_xxxyzz - M_xyyyzz) + z*(-M_xxyzzz - M_yyyzzz)) + ( &
      280.0d0/143.0d0)*(M_xxxyyy*x - M_xxxyz*S_xz - M_xxxz*S_xyz - &
      M_xxyyyy*y + M_xxyyyz*z - S_xyz*(-M_xxxz - M_xyyz) - S_xz*( &
      -M_xxxyz - M_xyyyz) + x*(-M_xxxyyy - M_xyyyyy) - y*(-M_xxyyyy - &
      M_yyyyyy) + z*(-M_xxyyyz - M_yyyyyz)))
    S_yyyyyyz  = -5.0d0/429.0d0*h**3*z + (45.0d0/143.0d0)*h**2*y**2*z - 15.0d0/13.0d0*h*y &
      **4*z + y**6*z
    Ms_yyyyyyz = Ms_yyyyyyz + (M_0*S_yyyyyyz + (10.0d0/429.0d0)*M_xxxxxxz + (5.0d0/143.0d0)*M_xxxxzzz - &
      720.0d0/143.0d0*M_xxyyz*S_yy - 800.0d0/143.0d0*M_xxyz*S_yyy - &
      1120.0d0/143.0d0*M_xyy*S_xyyz + (2240.0d0/429.0d0)*M_yyy*S_yyyz + &
      (64.0d0/429.0d0)*M_yyyyyy*z + (304.0d0/429.0d0)*M_yyyyyyz - &
      60.0d0/143.0d0*S_xz*(-M_xxxxx - M_xxxyy) - 50.0d0/143.0d0*S_xz*( &
      -M_xxxzz - M_xyyzz) - 20.0d0/143.0d0*x*(-M_xxxxxz - M_xxxyyz) - &
      15.0d0/143.0d0*z*(-M_xxxxxx - M_xxxxyy) - 25.0d0/143.0d0*z*( &
      -M_xxxxzz - M_xxyyzz) + (200.0d0/143.0d0)*z*(-M_xxyyzz - M_yyyyzz &
      ) - 35.0d0/429.0d0*z*(-M_xxzzzz - M_yyzzzz) - 35.0d0/143.0d0*( &
      M_xxxxyyz + M_xxyyzzz) + (1.0d0/16216200.0d0)*(-M_xxzzz - M_yyzzz &
      )*(3402000*S_xx + 8505000*S_yy) + (40.0d0/143.0d0)*(M_xxxxyy*z - &
      M_yyyyzzz) - 640.0d0/143.0d0*(M_xyyy*S_xyz + M_xyyyz*S_xy) + ( &
      400.0d0/143.0d0)*(M_yyyy*S_yyz + S_yz*(-M_xxyzz - M_yyyzz)) + ( &
      128.0d0/143.0d0)*(M_yyyyy*S_yz + M_yyyyyz*y) + (480.0d0/143.0d0)* &
      (S_xz*(-M_xxxyy - M_xyyyy) + S_yz*(-M_xxxxy - M_xxyyy)) + ( &
      240.0d0/143.0d0)*(z*(-M_xxxxyy - M_xxyyyy) - z*(-M_xxyyyy - &
      M_yyyyyy)) + (1.0d0/1621620.0d0)*((-M_xxxxz - M_xxyyz)*(226800* &
      S_xx + 1474200*S_yy) + (-M_xxyyz - M_yyyyz)*(-3628800*S_xx - &
      9979200*S_yy)) - 10.0d0/143.0d0*(M_xxxxx*S_xz + M_xxxxxz*x + x*( &
      -M_xxxzzz - M_xyyzzz)) + (5.0d0/429.0d0)*(-M_xxxxxx*z + M_xxzzzzz &
      + M_yyzzzzz) + (1.0d0/540540.0d0)*(M_xxyy*(604800*S_xxz - 2116800 &
      *S_yyz) + (-M_xxxx - M_xxyy)*(-151200*S_xxz + 1096200*S_yyz) + ( &
      -M_xxyy - M_yyyy)*(-604800*S_xxz - 6955200*S_yyz)) + (960.0d0/ &
      143.0d0)*(-M_xy*S_xyyyz + S_xyz*(-M_xxxy - M_xyyy) - S_yz*( &
      -M_xxyyy - M_yyyyy)) + (1.0d0/135135.0d0)*(M_xyz*(-604800*S_xxxy &
      - 1512000*S_xyyy) + M_xz*(47250*S_xxxxx - 245700*S_xxxyy + 47250* &
      S_xxxzz - 604800*S_xyyyy + 47250*S_xyyzz) + M_yz*(-378000*S_xxxxy &
      + 151200*S_xxyyy - 378000*S_xxyzz + 1028160*S_yyyyy - 378000* &
      S_yyyzz)) + (1.0d0/3243240.0d0)*(M_xxxx*(-453600*S_xxz + 1020600* &
      S_yyz) + M_xxxxz*(-226800*S_xx + 1247400*S_yy) + M_yyyyz*(3628800 &
      *S_xx + 12700800*S_yy) + (-M_xxzz - M_yyzz)*(756000*S_xxz + &
      5859000*S_yyz)) + (80.0d0/143.0d0)*(M_xxxxy*S_yz + M_xxxxyz*y - &
      M_xxyyyy*z - M_xxyyyyz + y*(-M_xxyzzz - M_yyyzzz)) + (1.0d0/ &
      810810.0d0)*(M_xxx*(-75600*S_xxxz + 1020600*S_xyyz) + M_xxxz*( &
      151200*S_xxx + 1247400*S_xyy) + M_yyyz*(3628800*S_xxy + 7862400* &
      S_yyy) + (-M_xxxz - M_xyyz)*(453600*S_xxx + 1474200*S_xyy) + ( &
      -M_xxyz - M_yyyz)*(-3628800*S_xxy - 6350400*S_yyy) + (-M_xxz - &
      M_yyz)*(255150*S_xxxx - 1530900*S_xxyy + 330750*S_xxzz - 2721600* &
      S_yyyy + 330750*S_yyzz)) + (320.0d0/143.0d0)*(M_xxxy*S_xyz + &
      M_xxxyz*S_xy - M_xxyyy*S_yz - M_xxyyyz*y + S_xy*(-M_xxxyz - &
      M_xyyyz) - y*(-M_xxyyyz - M_yyyyyz)) + (160.0d0/143.0d0)*(M_xxxyy &
      *S_xz + M_xxxyyz*x - M_xyyyy*S_xz - M_xyyyyz*x + x*(-M_xxxyyz - &
      M_xyyyyz) + y*(-M_xxxxyz - M_xxyyyz)) + (1.0d0/270270.0d0)*(M_xx* &
      (9450*S_xxxxz + 359100*S_xxyyz + 9450*S_xxzzz - 302400*S_yyyyz + &
      9450*S_yyzzz) + M_xxy*(604800*S_xxyz - 907200*S_yyyz) + M_xxz*( &
      122850*S_xxxx + 170100*S_xxyy + 47250*S_xxzz - 604800*S_yyyy + &
      47250*S_yyzz) + M_xyyz*(-604800*S_xxx - 2721600*S_xyy) + M_yy*( &
      -75600*S_xxxxz - 151200*S_xxyyz - 75600*S_xxzzz + 1512000*S_yyyyz &
      - 75600*S_yyzzz) + M_yyz*(-378000*S_xxxx + 1360800*S_xxyy - &
      378000*S_xxzz + 3326400*S_yyyy - 378000*S_yyzz) + (-M_xx - M_yy)* &
      (66150*S_xxxxz - 207900*S_xxyyz + 66150*S_xxzzz - 1209600*S_yyyyz &
      + 66150*S_yyzzz) + (-M_xxx - M_xyy)*(75600*S_xxxz + 1096200* &
      S_xyyz) + (-M_xxy - M_yyy)*(-604800*S_xxyz - 3326400*S_yyyz)))
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  x                   
#undef  z                   
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
    
! OPS  1723*ADD + 204*DIV + 2737*MUL + 144*NEG + 674*POW + 138*SUB = 5620  (7071 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, D_x, D_y,&
                D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
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
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy,&
                D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy,&
                D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz,&
                D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz,&
                D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy,&
                D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz,&
                D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz,&
                D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx,&
                D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz,&
                D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy,&
                D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy,&
                D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz,&
                D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz,&
                D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz,&
                D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz,&
                D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz,&
                D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz,&
                M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz,&
                M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz,&
                M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz,&
                M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz,&
                M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz,&
                M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz,&
                M_zzzzzzz
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
#define L_yy                 L(6)
#define M_xxx                M(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define L_xxx                L(8)
#define M_xxz                M(8)
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
#define L_xxxxyy             L(38)
#define M_xxxyyy             M(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define L_xxxyyy             L(40)
#define M_xxyyyy             M(40)
#define M_xxyyyz             M(41)
#define L_xxxyyz             L(41)
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
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    h          = x**2 + y**2 + z**2
    u2         = 1.0/h
    u          = sqrt(u2)
    D_x        = -u**3*x
    D_y        = -u**3*y
    D_z        = -u**3*z
    D_xx       = -h*u**5 + 3*u**5*x**2
    D_xy       = 3*u**5*x*y
    D_xz       = 3*u**5*x*z
    D_yy       = -h*u**5 + 3*u**5*y**2
    D_yz       = 3*u**5*y*z
    D_zz       = -(D_xx + D_yy)
    D_xxx      = 9*h*u**7*x - 15*u**7*x**3
    D_xxy      = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz      = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy      = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz      = -15*u**7*x*y*z
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = 9*h*u**7*y - 15*u**7*y**3
    D_yyz      = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    D_xxxx     = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy     = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz     = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy     = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz     = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz     = -(D_xxxx + D_xxyy)
    D_xyyy     = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz     = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz     = -(D_xxxy + D_xyyy)
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz     = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    D_xxxxx    = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy    = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz    = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy    = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz    = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    D_xxyyy    = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz    = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    D_xyyyy    = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz    = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    D_yyyyy    = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz    = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    D_xxxxxx   = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    D_xxxxxy   = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    D_xxxxxz   = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    D_xxxxyy   = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    D_xxxxyz   = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy   = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    D_xxxyyz   = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy   = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    D_xxyyyz   = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy   = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    D_xyyyyz   = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy   = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    D_yyyyyz   = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    D_xxxxxxx  = 11025*h**3*u**15*x - 99225*h**2*u**15*x**3 + 218295*h*u**15*x**5 - &
      135135*u**15*x**7
    L_xxxxxxx  = L_xxxxxxx + (D_xxxxxxx*M_0)
    D_xxxxxxy  = 1575*h**3*u**15*y - 42525*h**2*u**15*x**2*y + 155925*h*u**15*x**4*y - &
      135135*u**15*x**6*y
    L_xxxxxxy  = L_xxxxxxy + (D_xxxxxxy*M_0)
    D_xxxxxxz  = 1575*h**3*u**15*z - 42525*h**2*u**15*x**2*z + 155925*h*u**15*x**4*z - &
      135135*u**15*x**6*z
    L_xxxxxxz  = L_xxxxxxz + (D_xxxxxxz*M_0)
    D_xxxxxyy  = 1575*h**3*u**15*x - 9450*h**2*u**15*x**3 - 14175*h**2*u**15*x*y**2 + &
      10395*h*u**15*x**5 + 103950*h*u**15*x**3*y**2 - 135135*u**15*x**5 &
      *y**2
    L_xxxxxyy  = L_xxxxxyy + (D_xxxxxyy*M_0)
    D_xxxxxyz  = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x**3*y*z - 135135*u**15*x**5*y* &
      z
    L_xxxxxyz  = L_xxxxxyz + (D_xxxxxyz*M_0)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy  = 945*h**3*u**15*y - 17010*h**2*u**15*x**2*y - 2835*h**2*u**15*y**3 + &
      31185*h*u**15*x**4*y + 62370*h*u**15*x**2*y**3 - 135135*u**15*x** &
      4*y**3
    L_xxxxyyy  = L_xxxxyyy + (D_xxxxyyy*M_0)
    D_xxxxyyz  = 315*h**3*u**15*z - 5670*h**2*u**15*x**2*z - 2835*h**2*u**15*y**2*z + &
      10395*h*u**15*x**4*z + 62370*h*u**15*x**2*y**2*z - 135135*u**15*x &
      **4*y**2*z
    L_xxxxyyz  = L_xxxxyyz + (D_xxxxyyz*M_0)
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy  = 945*h**3*u**15*x - 2835*h**2*u**15*x**3 - 17010*h**2*u**15*x*y**2 + &
      62370*h*u**15*x**3*y**2 + 31185*h*u**15*x*y**4 - 135135*u**15*x** &
      3*y**4
    L_xxxyyyy  = L_xxxyyyy + (D_xxxyyyy*M_0)
    D_xxxyyyz  = -8505*h**2*u**15*x*y*z - 135135*u**15*x**3*y**3*z + 31185*(h*u**15*x**3* &
      y*z + h*u**15*x*y**3*z)
    L_xxxyyyz  = L_xxxyyyz + (D_xxxyyyz*M_0)
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy  = 1575*h**3*u**15*y - 14175*h**2*u**15*x**2*y - 9450*h**2*u**15*y**3 + &
      103950*h*u**15*x**2*y**3 + 10395*h*u**15*y**5 - 135135*u**15*x**2 &
      *y**5
    L_xxyyyyy  = L_xxyyyyy + (D_xxyyyyy*M_0)
    D_xxyyyyz  = 315*h**3*u**15*z - 2835*h**2*u**15*x**2*z - 5670*h**2*u**15*y**2*z + &
      62370*h*u**15*x**2*y**2*z + 10395*h*u**15*y**4*z - 135135*u**15*x &
      **2*y**4*z
    L_xxyyyyz  = L_xxyyyyz + (D_xxyyyyz*M_0)
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy  = 1575*h**3*u**15*x - 42525*h**2*u**15*x*y**2 + 155925*h*u**15*x*y**4 - &
      135135*u**15*x*y**6
    L_xyyyyyy  = L_xyyyyyy + (D_xyyyyyy*M_0)
    D_xyyyyyz  = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x*y**3*z - 135135*u**15*x*y**5* &
      z
    L_xyyyyyz  = L_xyyyyyz + (D_xyyyyyz*M_0)
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = 11025*h**3*u**15*y - 99225*h**2*u**15*y**3 + 218295*h*u**15*y**5 - &
      135135*u**15*y**7
    L_yyyyyyy  = L_yyyyyyy + (D_yyyyyyy*M_0)
    D_yyyyyyz  = 1575*h**3*u**15*z - 42525*h**2*u**15*y**2*z + 155925*h*u**15*y**4*z - &
      135135*u**15*y**6*z
    L_yyyyyyz  = L_yyyyyyz + (D_yyyyyyz*M_0)
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    D_xxxxxxxx = 11025*h**4*u**17 - 396900*h**3*u**17*x**2 + 2182950*h**2*u**17*x**4 - &
      3783780*h*u**17*x**6 + 2027025*u**17*x**8
    L_xxxxxxxx = L_xxxxxxxx + (D_xxxxxxxx*M_0)
    D_xxxxxxxy = -99225*h**3*u**17*x*y + 1091475*h**2*u**17*x**3*y - 2837835*h*u**17*x**5 &
      *y + 2027025*u**17*x**7*y
    L_xxxxxxxy = L_xxxxxxxy + (D_xxxxxxxy*M_0)
    D_xxxxxxxz = -99225*h**3*u**17*x*z + 1091475*h**2*u**17*x**3*z - 2837835*h*u**17*x**5 &
      *z + 2027025*u**17*x**7*z
    L_xxxxxxxz = L_xxxxxxxz + (D_xxxxxxxz*M_0)
    D_xxxxxxyy = 1575*h**4*u**17 - 42525*h**3*u**17*x**2 - 14175*h**3*u**17*y**2 + 155925 &
      *h**2*u**17*x**4 + 467775*h**2*u**17*x**2*y**2 - 135135*h*u**17*x &
      **6 + 2027025*(-h*u**17*x**4*y**2 + u**17*x**6*y**2)
    L_xxxxxxyy = L_xxxxxxyy + (D_xxxxxxyy*M_0)
    D_xxxxxxyz = -14175*h**3*u**17*y*z + 467775*h**2*u**17*x**2*y*z + 2027025*(-h*u**17*x &
      **4*y*z + u**17*x**6*y*z)
    L_xxxxxxyz = L_xxxxxxyz + (D_xxxxxxyz*M_0)
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    L_xxxxxx   = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxxy*M_xy + D_xxxxxxxz*M_xz + D_xxxxxxyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxxx*M_xx + D_xxxxxxyy*M_yy + D_xxxxxxzz*M_zz &
      ))
    D_xxxxxyyy = -42525*h**3*u**17*x*y + 311850*h**2*u**17*x**3*y + 155925*h**2*u**17*x*y &
      **3 - 405405*h*u**17*x**5*y - 1351350*h*u**17*x**3*y**3 + 2027025 &
      *u**17*x**5*y**3
    L_xxxxxyyy = L_xxxxxyyy + (D_xxxxxyyy*M_0)
    D_xxxxxyyz = -14175*h**3*u**17*x*z + 103950*h**2*u**17*x**3*z + 155925*h**2*u**17*x*y &
      **2*z - 135135*h*u**17*x**5*z - 1351350*h*u**17*x**3*y**2*z + &
      2027025*u**17*x**5*y**2*z
    L_xxxxxyyz = L_xxxxxyyz + (D_xxxxxyyz*M_0)
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    L_xxxxxy   = L_xxxxxy + (D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + D_xxxxxy*M_0 + D_xxxxxyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxxy*M_xx + D_xxxxxyyy*M_yy + D_xxxxxyzz*M_zz &
      ))
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    L_xxxxx    = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz*M_xz + &
      D_xxxxxyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxxx*M_xxx + D_xxxxxyyy* &
      M_yyy + D_xxxxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxx*M_xx + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxz*M_xxz + D_xxxxxxyy*M_xyy + &
      D_xxxxxxzz*M_xzz + D_xxxxxyy*M_yy + D_xxxxxyyz*M_yyz + D_xxxxxyzz &
      *M_yzz + D_xxxxxzz*M_zz))
    L_xxxxxz   = L_xxxxxz + (D_xxxxxxyz*M_xy + D_xxxxxxzz*M_xz + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxxxz*M_xx + D_xxxxxyyz*M_yy + D_xxxxxzzz*M_zz &
      ))
    D_xxxxyyyy = 945*h**4*u**17 + 374220*h**2*u**17*x**2*y**2 + 2027025*u**17*x**4*y**4 + &
      31185*(h**2*u**17*x**4 + h**2*u**17*y**4) - 17010*(h**3*u**17*x** &
      2 + h**3*u**17*y**2) - 810810*(h*u**17*x**4*y**2 + h*u**17*x**2*y &
      **4)
    L_xxxxyyyy = L_xxxxyyyy + (D_xxxxyyyy*M_0)
    D_xxxxyyyz = -8505*h**3*u**17*y*z + 187110*h**2*u**17*x**2*y*z + 31185*h**2*u**17*y** &
      3*z - 405405*h*u**17*x**4*y*z - 810810*h*u**17*x**2*y**3*z + &
      2027025*u**17*x**4*y**3*z
    L_xxxxyyyz = L_xxxxyyyz + (D_xxxxyyyz*M_0)
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    L_xxxxyy   = L_xxxxyy + (D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + D_xxxxyy*M_0 + D_xxxxyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxyy*M_xx + D_xxxxyyyy*M_yy + D_xxxxyyzz*M_zz &
      ))
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    L_xxxxy    = L_xxxxy + (D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxxy*M_xxx + D_xxxxyyyy* &
      M_yyy + D_xxxxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxy*M_xx + &
      D_xxxxxxyy*M_xxy + D_xxxxxxyz*M_xxz + D_xxxxxyyy*M_xyy + &
      D_xxxxxyzz*M_xzz + D_xxxxyyy*M_yy + D_xxxxyyyz*M_yyz + D_xxxxyyzz &
      *M_yzz + D_xxxxyzz*M_zz))
    L_xxxxyz   = L_xxxxyz + (D_xxxxxyyz*M_xy + D_xxxxxyzz*M_xz + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxxyz*M_xx + D_xxxxyyyz*M_yy + D_xxxxyzzz*M_zz &
      ))
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    L_xxxx     = L_xxxx + (D_xxxx*M_0 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxxx*M_xxxx + D_xxxxyyyy*M_yyyy + &
      D_xxxxzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxxyy*M_xxyy + &
      D_xxxxxxzz*M_xxzz + D_xxxxyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxxx &
      *M_xxx + D_xxxxxxxy*M_xxxy + D_xxxxxxxz*M_xxxz + D_xxxxxyyy* &
      M_xyyy + D_xxxxxzzz*M_xzzz + D_xxxxyyy*M_yyy + D_xxxxyyyz*M_yyyz &
      + D_xxxxyzzz*M_yzzz + D_xxxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxx* &
      M_xx + D_xxxxxxy*M_xxy + D_xxxxxxyz*M_xxyz + D_xxxxxxz*M_xxz + &
      D_xxxxxyy*M_xyy + D_xxxxxyyz*M_xyyz + D_xxxxxyzz*M_xyzz + &
      D_xxxxxzz*M_xzz + D_xxxxyy*M_yy + D_xxxxyyz*M_yyz + D_xxxxyzz* &
      M_yzz + D_xxxxzz*M_zz))
    L_xxxxz    = L_xxxxz + (D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + (1.0d0/6.0d0)*(D_xxxxxxxz*M_xxx + D_xxxxyyyz*M_yyy &
      + D_xxxxzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxyz*M_xxy + D_xxxxxxz &
      *M_xx + D_xxxxxxzz*M_xxz + D_xxxxxyyz*M_xyy + D_xxxxxzzz*M_xzz + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyzzz*M_yzz + D_xxxxzzz* &
      M_zz))
    D_xxxyyyyy = -42525*h**3*u**17*x*y + 155925*h**2*u**17*x**3*y + 311850*h**2*u**17*x*y &
      **3 - 1351350*h*u**17*x**3*y**3 - 405405*h*u**17*x*y**5 + 2027025 &
      *u**17*x**3*y**5
    L_xxxyyyyy = L_xxxyyyyy + (D_xxxyyyyy*M_0)
    D_xxxyyyyz = -8505*h**3*u**17*x*z + 31185*h**2*u**17*x**3*z + 187110*h**2*u**17*x*y** &
      2*z - 810810*h*u**17*x**3*y**2*z - 405405*h*u**17*x*y**4*z + &
      2027025*u**17*x**3*y**4*z
    L_xxxyyyyz = L_xxxyyyyz + (D_xxxyyyyz*M_0)
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    L_xxxyyy   = L_xxxyyy + (D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + D_xxxyyy*M_0 + D_xxxyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxyyy*M_xx + D_xxxyyyyy*M_yy + D_xxxyyyzz*M_zz &
      ))
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    L_xxxyy    = L_xxxyy + (D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxyy*M_xxx + D_xxxyyyyy* &
      M_yyy + D_xxxyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxyy*M_xx + &
      D_xxxxxyyy*M_xxy + D_xxxxxyyz*M_xxz + D_xxxxyyyy*M_xyy + &
      D_xxxxyyzz*M_xzz + D_xxxyyyy*M_yy + D_xxxyyyyz*M_yyz + D_xxxyyyzz &
      *M_yzz + D_xxxyyzz*M_zz))
    L_xxxyyz   = L_xxxyyz + (D_xxxxyyyz*M_xy + D_xxxxyyzz*M_xz + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxyyz*M_xx + D_xxxyyyyz*M_yy + D_xxxyyzzz*M_zz &
      ))
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    L_xxxy     = L_xxxy + (D_xxxxyy*M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxxy*M_xxxx + D_xxxyyyyy*M_yyyy + &
      D_xxxyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxyyy*M_xxyy + &
      D_xxxxxyzz*M_xxzz + D_xxxyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxxy &
      *M_xxx + D_xxxxxxyy*M_xxxy + D_xxxxxxyz*M_xxxz + D_xxxxyyyy* &
      M_xyyy + D_xxxxyzzz*M_xzzz + D_xxxyyyy*M_yyy + D_xxxyyyyz*M_yyyz &
      + D_xxxyyzzz*M_yzzz + D_xxxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxy* &
      M_xx + D_xxxxxyy*M_xxy + D_xxxxxyyz*M_xxyz + D_xxxxxyz*M_xxz + &
      D_xxxxyyy*M_xyy + D_xxxxyyyz*M_xyyz + D_xxxxyyzz*M_xyzz + &
      D_xxxxyzz*M_xzz + D_xxxyyy*M_yy + D_xxxyyyz*M_yyz + D_xxxyyzz* &
      M_yzz + D_xxxyzz*M_zz))
    L_xxxyz    = L_xxxyz + (D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + (1.0d0/6.0d0)*(D_xxxxxxyz*M_xxx + D_xxxyyyyz*M_yyy &
      + D_xxxyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxyyz*M_xxy + D_xxxxxyz &
      *M_xx + D_xxxxxyzz*M_xxz + D_xxxxyyyz*M_xyy + D_xxxxyzzz*M_xzz + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyzzz*M_yzz + D_xxxyzzz* &
      M_zz))
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    L_xxx      = L_xxx + (D_xxx*M_0 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxxx*M_xxxxx + D_xxxyyyyy*M_yyyyy + &
      D_xxxzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxxyy*M_xxxyy + &
      D_xxxxxxzz*M_xxxzz + D_xxxxxyyy*M_xxyyy + D_xxxxxzzz*M_xxzzz + &
      D_xxxyyyzz*M_yyyzz + D_xxxyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxxyy*M_xxyy + D_xxxxxyyz*M_xxyyz + D_xxxxxyzz*M_xxyzz + &
      D_xxxxxzz*M_xxzz + D_xxxxyyzz*M_xyyzz + D_xxxyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxx*M_xxxx + D_xxxxxxxy*M_xxxxy + D_xxxxxxxz &
      *M_xxxxz + D_xxxxyyyy*M_xyyyy + D_xxxxzzzz*M_xzzzz + D_xxxyyyy* &
      M_yyyy + D_xxxyyyyz*M_yyyyz + D_xxxyzzzz*M_yzzzz + D_xxxzzzz* &
      M_zzzz) + (1.0d0/2.0d0)*(D_xxxxx*M_xx + D_xxxxxy*M_xxy + &
      D_xxxxxyz*M_xxyz + D_xxxxxz*M_xxz + D_xxxxyy*M_xyy + D_xxxxyyz* &
      M_xyyz + D_xxxxyzz*M_xyzz + D_xxxxzz*M_xzz + D_xxxyy*M_yy + &
      D_xxxyyz*M_yyz + D_xxxyzz*M_yzz + D_xxxzz*M_zz) + (1.0d0/6.0d0)*( &
      D_xxxxxx*M_xxx + D_xxxxxxy*M_xxxy + D_xxxxxxyz*M_xxxyz + &
      D_xxxxxxz*M_xxxz + D_xxxxyyy*M_xyyy + D_xxxxyyyz*M_xyyyz + &
      D_xxxxyzzz*M_xyzzz + D_xxxxzzz*M_xzzz + D_xxxyyy*M_yyy + &
      D_xxxyyyz*M_yyyz + D_xxxyzzz*M_yzzz + D_xxxzzz*M_zzz))
    L_xxxz     = L_xxxz + (D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxxxz*M_xxxx + D_xxxyyyyz*M_yyyy + &
      D_xxxzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxyyz*M_xxyy + &
      D_xxxxxzzz*M_xxzz + D_xxxyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxxxyz*M_xxxy + D_xxxxxxz*M_xxx + D_xxxxxxzz*M_xxxz + &
      D_xxxxyyyz*M_xyyy + D_xxxxzzzz*M_xzzz + D_xxxyyyz*M_yyy + &
      D_xxxyyyzz*M_yyyz + D_xxxyzzzz*M_yzzz + D_xxxzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz + D_xxxxxz*M_xx + &
      D_xxxxxzz*M_xxz + D_xxxxyyz*M_xyy + D_xxxxyyzz*M_xyyz + &
      D_xxxxyzzz*M_xyzz + D_xxxxzzz*M_xzz + D_xxxyyz*M_yy + D_xxxyyzz* &
      M_yyz + D_xxxyzzz*M_yzz + D_xxxzzz*M_zz))
    D_xxyyyyyy = 1575*h**4*u**17 - 14175*h**3*u**17*x**2 - 42525*h**3*u**17*y**2 + 467775 &
      *h**2*u**17*x**2*y**2 + 155925*h**2*u**17*y**4 - 135135*h*u**17*y &
      **6 + 2027025*(-h*u**17*x**2*y**4 + u**17*x**2*y**6)
    L_xxyyyyyy = L_xxyyyyyy + (D_xxyyyyyy*M_0)
    D_xxyyyyyz = -14175*h**3*u**17*y*z + 155925*h**2*u**17*x**2*y*z + 103950*h**2*u**17*y &
      **3*z - 1351350*h*u**17*x**2*y**3*z - 135135*h*u**17*y**5*z + &
      2027025*u**17*x**2*y**5*z
    L_xxyyyyyz = L_xxyyyyyz + (D_xxyyyyyz*M_0)
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    L_xxyyyy   = L_xxyyyy + (D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + D_xxyyyy*M_0 + D_xxyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxyyyy*M_xx + D_xxyyyyyy*M_yy + D_xxyyyyzz*M_zz &
      ))
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    L_xxyyy    = L_xxyyy + (D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxyyy*M_xxx + D_xxyyyyyy* &
      M_yyy + D_xxyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyyy*M_xx + &
      D_xxxxyyyy*M_xxy + D_xxxxyyyz*M_xxz + D_xxxyyyyy*M_xyy + &
      D_xxxyyyzz*M_xzz + D_xxyyyyy*M_yy + D_xxyyyyyz*M_yyz + D_xxyyyyzz &
      *M_yzz + D_xxyyyzz*M_zz))
    L_xxyyyz   = L_xxyyyz + (D_xxxyyyyz*M_xy + D_xxxyyyzz*M_xz + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxyyyz*M_xx + D_xxyyyyyz*M_yy + D_xxyyyzzz*M_zz &
      ))
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    L_xxyy     = L_xxyy + (D_xxxyyy*M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxyy*M_xxxx + D_xxyyyyyy*M_yyyy + &
      D_xxyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyyyy*M_xxyy + &
      D_xxxxyyzz*M_xxzz + D_xxyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxyy &
      *M_xxx + D_xxxxxyyy*M_xxxy + D_xxxxxyyz*M_xxxz + D_xxxyyyyy* &
      M_xyyy + D_xxxyyzzz*M_xzzz + D_xxyyyyy*M_yyy + D_xxyyyyyz*M_yyyz &
      + D_xxyyyzzz*M_yzzz + D_xxyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyy* &
      M_xx + D_xxxxyyy*M_xxy + D_xxxxyyyz*M_xxyz + D_xxxxyyz*M_xxz + &
      D_xxxyyyy*M_xyy + D_xxxyyyyz*M_xyyz + D_xxxyyyzz*M_xyzz + &
      D_xxxyyzz*M_xzz + D_xxyyyy*M_yy + D_xxyyyyz*M_yyz + D_xxyyyzz* &
      M_yzz + D_xxyyzz*M_zz))
    L_xxyyz    = L_xxyyz + (D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + (1.0d0/6.0d0)*(D_xxxxxyyz*M_xxx + D_xxyyyyyz*M_yyy &
      + D_xxyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyyyz*M_xxy + D_xxxxyyz &
      *M_xx + D_xxxxyyzz*M_xxz + D_xxxyyyyz*M_xyy + D_xxxyyzzz*M_xzz + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyzzz*M_yzz + D_xxyyzzz* &
      M_zz))
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    L_xxy      = L_xxy + (D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxxy*M_xxxxx + D_xxyyyyyy*M_yyyyy + &
      D_xxyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxyyy*M_xxxyy + &
      D_xxxxxyzz*M_xxxzz + D_xxxxyyyy*M_xxyyy + D_xxxxyzzz*M_xxzzz + &
      D_xxyyyyzz*M_yyyzz + D_xxyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxyyy*M_xxyy + D_xxxxyyyz*M_xxyyz + D_xxxxyyzz*M_xxyzz + &
      D_xxxxyzz*M_xxzz + D_xxxyyyzz*M_xyyzz + D_xxyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + D_xxxxxxyz &
      *M_xxxxz + D_xxxyyyyy*M_xyyyy + D_xxxyzzzz*M_xzzzz + D_xxyyyyy* &
      M_yyyy + D_xxyyyyyz*M_yyyyz + D_xxyyzzzz*M_yzzzz + D_xxyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + &
      D_xxxxxyyz*M_xxxyz + D_xxxxxyz*M_xxxz + D_xxxyyyy*M_xyyy + &
      D_xxxyyyyz*M_xyyyz + D_xxxyyzzz*M_xyzzz + D_xxxyzzz*M_xzzz + &
      D_xxyyyy*M_yyy + D_xxyyyyz*M_yyyz + D_xxyyzzz*M_yzzz + D_xxyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyz &
      *M_xxyz + D_xxxxyz*M_xxz + D_xxxyyy*M_xyy + D_xxxyyyz*M_xyyz + &
      D_xxxyyzz*M_xyzz + D_xxxyzz*M_xzz + D_xxyyy*M_yy + D_xxyyyz*M_yyz &
      + D_xxyyzz*M_yzz + D_xxyzz*M_zz))
    L_xxyz     = L_xxyz + (D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxxyz*M_xxxx + D_xxyyyyyz*M_yyyy + &
      D_xxyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyyyz*M_xxyy + &
      D_xxxxyzzz*M_xxzz + D_xxyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxxyyz*M_xxxy + D_xxxxxyz*M_xxx + D_xxxxxyzz*M_xxxz + &
      D_xxxyyyyz*M_xyyy + D_xxxyzzzz*M_xzzz + D_xxyyyyz*M_yyy + &
      D_xxyyyyzz*M_yyyz + D_xxyyzzzz*M_yzzz + D_xxyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz + D_xxxxyz*M_xx + &
      D_xxxxyzz*M_xxz + D_xxxyyyz*M_xyy + D_xxxyyyzz*M_xyyz + &
      D_xxxyyzzz*M_xyzz + D_xxxyzzz*M_xzz + D_xxyyyz*M_yy + D_xxyyyzz* &
      M_yyz + D_xxyyzzz*M_yzz + D_xxyzzz*M_zz))
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    L_xx       = L_xx + (D_xx*M_0 + (1.0d0/8.0d0)*D_xxxxyyzz*M_xxyyzz + D_xxxy*M_xy + D_xxxyz* &
      M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxxx* &
      M_xxxxxx + D_xxyyyyyy*M_yyyyyy + D_xxzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxxyyy*M_xxxyyy + D_xxxxxzzz*M_xxxzzz + D_xxyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxxyy*M_xxxxyy + D_xxxxxxzz* &
      M_xxxxzz + D_xxxxyyyy*M_xxyyyy + D_xxxxzzzz*M_xxzzzz + D_xxyyyyzz &
      *M_yyyyzz + D_xxyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxxyy*M_xxyy &
      + D_xxxxyyz*M_xxyyz + D_xxxxyzz*M_xxyzz + D_xxxxzz*M_xxzz + &
      D_xxxyyzz*M_xyyzz + D_xxyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxxx &
      *M_xxxxx + D_xxxxxxxy*M_xxxxxy + D_xxxxxxxz*M_xxxxxz + D_xxxyyyyy &
      *M_xyyyyy + D_xxxzzzzz*M_xzzzzz + D_xxyyyyy*M_yyyyy + D_xxyyyyyz* &
      M_yyyyyz + D_xxyzzzzz*M_yzzzzz + D_xxzzzzz*M_zzzzz) + (1.0d0/ &
      2.0d0)*(D_xxxx*M_xx + D_xxxxy*M_xxy + D_xxxxyz*M_xxyz + D_xxxxz* &
      M_xxz + D_xxxyy*M_xyy + D_xxxyyz*M_xyyz + D_xxxyzz*M_xyzz + &
      D_xxxzz*M_xzz + D_xxyy*M_yy + D_xxyyz*M_yyz + D_xxyzz*M_yzz + &
      D_xxzz*M_zz) + (1.0d0/6.0d0)*(D_xxxxx*M_xxx + D_xxxxxy*M_xxxy + &
      D_xxxxxyz*M_xxxyz + D_xxxxxz*M_xxxz + D_xxxyyy*M_xyyy + D_xxxyyyz &
      *M_xyyyz + D_xxxyzzz*M_xyzzz + D_xxxzzz*M_xzzz + D_xxyyy*M_yyy + &
      D_xxyyyz*M_yyyz + D_xxyzzz*M_yzzz + D_xxzzz*M_zzz) + (1.0d0/ &
      24.0d0)*(D_xxxxxx*M_xxxx + D_xxxxxxy*M_xxxxy + D_xxxxxxyz* &
      M_xxxxyz + D_xxxxxxz*M_xxxxz + D_xxxyyyy*M_xyyyy + D_xxxyyyyz* &
      M_xyyyyz + D_xxxyzzzz*M_xyzzzz + D_xxxzzzz*M_xzzzz + D_xxyyyy* &
      M_yyyy + D_xxyyyyz*M_yyyyz + D_xxyzzzz*M_yzzzz + D_xxzzzz*M_zzzz &
      ) + (1.0d0/12.0d0)*(D_xxxxxyy*M_xxxyy + D_xxxxxyyz*M_xxxyyz + &
      D_xxxxxyzz*M_xxxyzz + D_xxxxxzz*M_xxxzz + D_xxxxyyy*M_xxyyy + &
      D_xxxxyyyz*M_xxyyyz + D_xxxxyzzz*M_xxyzzz + D_xxxxzzz*M_xxzzz + &
      D_xxxyyyzz*M_xyyyzz + D_xxxyyzzz*M_xyyzzz + D_xxyyyzz*M_yyyzz + &
      D_xxyyzzz*M_yyzzz))
    L_xxz      = L_xxz + (D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxxxz*M_xxxxx + D_xxyyyyyz*M_yyyyy + &
      D_xxzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxyyz*M_xxxyy + &
      D_xxxxxzzz*M_xxxzz + D_xxxxyyyz*M_xxyyy + D_xxxxzzzz*M_xxzzz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxyyz*M_xxyy + D_xxxxyyzz*M_xxyyz + D_xxxxyzzz*M_xxyzz + &
      D_xxxxzzz*M_xxzz + D_xxxyyzzz*M_xyyzz + D_xxyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxyz*M_xxxxy + D_xxxxxxz*M_xxxx + D_xxxxxxzz &
      *M_xxxxz + D_xxxyyyyz*M_xyyyy + D_xxxzzzzz*M_xzzzz + D_xxyyyyz* &
      M_yyyy + D_xxyyyyzz*M_yyyyz + D_xxyzzzzz*M_yzzzz + D_xxzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxxyz*M_xxxy + D_xxxxxyzz*M_xxxyz + &
      D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + D_xxxyyyz*M_xyyy + D_xxxyyyzz &
      *M_xyyyz + D_xxxyzzzz*M_xyzzz + D_xxxzzzz*M_xzzz + D_xxyyyz*M_yyy &
      + D_xxyyyzz*M_yyyz + D_xxyzzzz*M_yzzz + D_xxzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxz*M_xx + &
      D_xxxxzz*M_xxz + D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyzzz* &
      M_xyzz + D_xxxzzz*M_xzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + &
      D_xxyzzz*M_yzz + D_xxzzz*M_zz))
    D_xyyyyyyy = -99225*h**3*u**17*x*y + 1091475*h**2*u**17*x*y**3 - 2837835*h*u**17*x*y &
      **5 + 2027025*u**17*x*y**7
    L_xyyyyyyy = L_xyyyyyyy + (D_xyyyyyyy*M_0)
    D_xyyyyyyz = -14175*h**3*u**17*x*z + 467775*h**2*u**17*x*y**2*z + 2027025*(-h*u**17*x &
      *y**4*z + u**17*x*y**6*z)
    L_xyyyyyyz = L_xyyyyyyz + (D_xyyyyyyz*M_0)
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    L_xyyyyy   = L_xyyyyy + (D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + D_xyyyyy*M_0 + D_xyyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxyyyyy*M_xx + D_xyyyyyyy*M_yy + D_xyyyyyzz*M_zz &
      ))
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    L_xyyyy    = L_xyyyy + (D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxyyyy*M_xxx + D_xyyyyyyy* &
      M_yyy + D_xyyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyyy*M_xx + &
      D_xxxyyyyy*M_xxy + D_xxxyyyyz*M_xxz + D_xxyyyyyy*M_xyy + &
      D_xxyyyyzz*M_xzz + D_xyyyyyy*M_yy + D_xyyyyyyz*M_yyz + D_xyyyyyzz &
      *M_yzz + D_xyyyyzz*M_zz))
    L_xyyyyz   = L_xyyyyz + (D_xxyyyyyz*M_xy + D_xxyyyyzz*M_xz + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxyyyyz*M_xx + D_xyyyyyyz*M_yy + D_xyyyyzzz*M_zz &
      ))
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    L_xyyy     = L_xyyy + (D_xxyyyy*M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxyyy*M_xxxx + D_xyyyyyyy*M_yyyy + &
      D_xyyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyyyy*M_xxyy + &
      D_xxxyyyzz*M_xxzz + D_xyyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxyyy &
      *M_xxx + D_xxxxyyyy*M_xxxy + D_xxxxyyyz*M_xxxz + D_xxyyyyyy* &
      M_xyyy + D_xxyyyzzz*M_xzzz + D_xyyyyyy*M_yyy + D_xyyyyyyz*M_yyyz &
      + D_xyyyyzzz*M_yzzz + D_xyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyy* &
      M_xx + D_xxxyyyy*M_xxy + D_xxxyyyyz*M_xxyz + D_xxxyyyz*M_xxz + &
      D_xxyyyyy*M_xyy + D_xxyyyyyz*M_xyyz + D_xxyyyyzz*M_xyzz + &
      D_xxyyyzz*M_xzz + D_xyyyyy*M_yy + D_xyyyyyz*M_yyz + D_xyyyyzz* &
      M_yzz + D_xyyyzz*M_zz))
    L_xyyyz    = L_xyyyz + (D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyzz*M_yz + &
      D_xyyyz*M_0 + (1.0d0/6.0d0)*(D_xxxxyyyz*M_xxx + D_xyyyyyyz*M_yyy &
      + D_xyyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyyyz*M_xxy + D_xxxyyyz &
      *M_xx + D_xxxyyyzz*M_xxz + D_xxyyyyyz*M_xyy + D_xxyyyzzz*M_xzz + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyzzz*M_yzz + D_xyyyzzz* &
      M_zz))
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    L_xyy      = L_xyy + (D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxyy*M_xxxxx + D_xyyyyyyy*M_yyyyy + &
      D_xyyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyyyy*M_xxxyy + &
      D_xxxxyyzz*M_xxxzz + D_xxxyyyyy*M_xxyyy + D_xxxyyzzz*M_xxzzz + &
      D_xyyyyyzz*M_yyyzz + D_xyyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyyy*M_xxyy + D_xxxyyyyz*M_xxyyz + D_xxxyyyzz*M_xxyzz + &
      D_xxxyyzz*M_xxzz + D_xxyyyyzz*M_xyyzz + D_xyyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + D_xxxxxyyz &
      *M_xxxxz + D_xxyyyyyy*M_xyyyy + D_xxyyzzzz*M_xzzzz + D_xyyyyyy* &
      M_yyyy + D_xyyyyyyz*M_yyyyz + D_xyyyzzzz*M_yzzzz + D_xyyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + &
      D_xxxxyyyz*M_xxxyz + D_xxxxyyz*M_xxxz + D_xxyyyyy*M_xyyy + &
      D_xxyyyyyz*M_xyyyz + D_xxyyyzzz*M_xyzzz + D_xxyyzzz*M_xzzz + &
      D_xyyyyy*M_yyy + D_xyyyyyz*M_yyyz + D_xyyyzzz*M_yzzz + D_xyyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyz &
      *M_xxyz + D_xxxyyz*M_xxz + D_xxyyyy*M_xyy + D_xxyyyyz*M_xyyz + &
      D_xxyyyzz*M_xyzz + D_xxyyzz*M_xzz + D_xyyyy*M_yy + D_xyyyyz*M_yyz &
      + D_xyyyzz*M_yzz + D_xyyzz*M_zz))
    L_xyyz     = L_xyyz + (D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyzz*M_yz + D_xyyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxyyz*M_xxxx + D_xyyyyyyz*M_yyyy + &
      D_xyyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyyyz*M_xxyy + &
      D_xxxyyzzz*M_xxzz + D_xyyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxyyyz*M_xxxy + D_xxxxyyz*M_xxx + D_xxxxyyzz*M_xxxz + &
      D_xxyyyyyz*M_xyyy + D_xxyyzzzz*M_xzzz + D_xyyyyyz*M_yyy + &
      D_xyyyyyzz*M_yyyz + D_xyyyzzzz*M_yzzz + D_xyyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz + D_xxxyyz*M_xx + &
      D_xxxyyzz*M_xxz + D_xxyyyyz*M_xyy + D_xxyyyyzz*M_xyyz + &
      D_xxyyyzzz*M_xyzz + D_xxyyzzz*M_xzz + D_xyyyyz*M_yy + D_xyyyyzz* &
      M_yyz + D_xyyyzzz*M_yzz + D_xyyzzz*M_zz))
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    L_xy       = L_xy + ((1.0d0/8.0d0)*D_xxxyyyzz*M_xxyyzz + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz &
      *M_xz + D_xy*M_0 + D_xyyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxxy* &
      M_xxxxxx + D_xyyyyyyy*M_yyyyyy + D_xyzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxyyyy*M_xxxyyy + D_xxxxyzzz*M_xxxzzz + D_xyyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxyyy*M_xxxxyy + D_xxxxxyzz* &
      M_xxxxzz + D_xxxyyyyy*M_xxyyyy + D_xxxyzzzz*M_xxzzzz + D_xyyyyyzz &
      *M_yyyyzz + D_xyyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxyyy*M_xxyy &
      + D_xxxyyyz*M_xxyyz + D_xxxyyzz*M_xxyzz + D_xxxyzz*M_xxzz + &
      D_xxyyyzz*M_xyyzz + D_xyyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxxy &
      *M_xxxxx + D_xxxxxxyy*M_xxxxxy + D_xxxxxxyz*M_xxxxxz + D_xxyyyyyy &
      *M_xyyyyy + D_xxyzzzzz*M_xzzzzz + D_xyyyyyy*M_yyyyy + D_xyyyyyyz* &
      M_yyyyyz + D_xyyzzzzz*M_yzzzzz + D_xyzzzzz*M_zzzzz) + (1.0d0/ &
      24.0d0)*(D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + D_xxxxxyyz* &
      M_xxxxyz + D_xxxxxyz*M_xxxxz + D_xxyyyyy*M_xyyyy + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyzzzz*M_xyzzzz + D_xxyzzzz*M_xzzzz + D_xyyyyy* &
      M_yyyy + D_xyyyyyz*M_yyyyz + D_xyyzzzz*M_yzzzz + D_xyzzzz*M_zzzz &
      ) + (1.0d0/6.0d0)*(D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyz* &
      M_xxxyz + D_xxxxyz*M_xxxz + D_xxyyyy*M_xyyy + D_xxyyyyz*M_xyyyz + &
      D_xxyyzzz*M_xyzzz + D_xxyzzz*M_xzzz + D_xyyyy*M_yyy + D_xyyyyz* &
      M_yyyz + D_xyyzzz*M_yzzz + D_xyzzz*M_zzz) + (1.0d0/12.0d0)*( &
      D_xxxxyyy*M_xxxyy + D_xxxxyyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyzz + &
      D_xxxxyzz*M_xxxzz + D_xxxyyyy*M_xxyyy + D_xxxyyyyz*M_xxyyyz + &
      D_xxxyyzzz*M_xxyzzz + D_xxxyzzz*M_xxzzz + D_xxyyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyzzz + D_xyyyyzz*M_yyyzz + D_xyyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyz*M_xxyz + &
      D_xxxyz*M_xxz + D_xxyyy*M_xyy + D_xxyyyz*M_xyyz + D_xxyyzz*M_xyzz &
      + D_xxyzz*M_xzz + D_xyyy*M_yy + D_xyyyz*M_yyz + D_xyyzz*M_yzz + &
      D_xyzz*M_zz))
    L_xyz      = L_xyz + (D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyzz*M_yz + D_xyz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxxyz*M_xxxxx + D_xyyyyyyz*M_yyyyy + &
      D_xyzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyyyz*M_xxxyy + &
      D_xxxxyzzz*M_xxxzz + D_xxxyyyyz*M_xxyyy + D_xxxyzzzz*M_xxzzz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyyz*M_xxyy + D_xxxyyyzz*M_xxyyz + D_xxxyyzzz*M_xxyzz + &
      D_xxxyzzz*M_xxzz + D_xxyyyzzz*M_xyyzz + D_xyyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxyyz*M_xxxxy + D_xxxxxyz*M_xxxx + D_xxxxxyzz &
      *M_xxxxz + D_xxyyyyyz*M_xyyyy + D_xxyzzzzz*M_xzzzz + D_xyyyyyz* &
      M_yyyy + D_xyyyyyzz*M_yyyyz + D_xyyzzzzz*M_yzzzz + D_xyzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxyyz*M_xxxy + D_xxxxyyzz*M_xxxyz + &
      D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + D_xxyyyyz*M_xyyy + D_xxyyyyzz &
      *M_xyyyz + D_xxyyzzzz*M_xyzzz + D_xxyzzzz*M_xzzz + D_xyyyyz*M_yyy &
      + D_xyyyyzz*M_yyyz + D_xyyzzzz*M_yzzz + D_xyzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyz*M_xx + &
      D_xxxyzz*M_xxz + D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyzzz* &
      M_xyzz + D_xxyzzz*M_xzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + &
      D_xyyzzz*M_yzz + D_xyzzz*M_zz))
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = L_x + (D_x*M_0 + (1.0d0/8.0d0)*D_xxxyyzz*M_xxyyzz + D_xxy*M_xy + D_xxyz*M_xyz + &
      D_xxz*M_xz + D_xyz*M_yz + (1.0d0/5040.0d0)*(D_xxxxxxxx*M_xxxxxxx &
      + D_xyyyyyyy*M_yyyyyyy + D_xzzzzzzz*M_zzzzzzz) + (1.0d0/240.0d0)* &
      (D_xxxxxxyy*M_xxxxxyy + D_xxxxxxzz*M_xxxxxzz + D_xxxyyyyy* &
      M_xxyyyyy + D_xxxzzzzz*M_xxzzzzz + D_xyyyyyzz*M_yyyyyzz + &
      D_xyyzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxxyyy*M_xxxxyyy + &
      D_xxxxxzzz*M_xxxxzzz + D_xxxxyyyy*M_xxxyyyy + D_xxxxzzzz* &
      M_xxxzzzz + D_xyyyyzzz*M_yyyyzzz + D_xyyyzzzz*M_yyyzzzz) + (1.0d0 &
      /36.0d0)*(D_xxxxyyy*M_xxxyyy + D_xxxxyyyz*M_xxxyyyz + D_xxxxyzzz* &
      M_xxxyzzz + D_xxxxzzz*M_xxxzzz + D_xxyyyzzz*M_xyyyzzz + D_xyyyzzz &
      *M_yyyzzz) + (1.0d0/4.0d0)*(D_xxxyy*M_xxyy + D_xxxyyz*M_xxyyz + &
      D_xxxyzz*M_xxyzz + D_xxxzz*M_xxzz + D_xxyyzz*M_xyyzz + D_xyyzz* &
      M_yyzz) + (1.0d0/720.0d0)*(D_xxxxxxx*M_xxxxxx + D_xxxxxxxy* &
      M_xxxxxxy + D_xxxxxxxz*M_xxxxxxz + D_xxyyyyyy*M_xyyyyyy + &
      D_xxzzzzzz*M_xzzzzzz + D_xyyyyyy*M_yyyyyy + D_xyyyyyyz*M_yyyyyyz &
      + D_xyzzzzzz*M_yzzzzzz + D_xzzzzzz*M_zzzzzz) + (1.0d0/2.0d0)*( &
      D_xxx*M_xx + D_xxxy*M_xxy + D_xxxyz*M_xxyz + D_xxxz*M_xxz + &
      D_xxyy*M_xyy + D_xxyyz*M_xyyz + D_xxyzz*M_xyzz + D_xxzz*M_xzz + &
      D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz*M_zz) + (1.0d0/ &
      6.0d0)*(D_xxxx*M_xxx + D_xxxxy*M_xxxy + D_xxxxyz*M_xxxyz + &
      D_xxxxz*M_xxxz + D_xxyyy*M_xyyy + D_xxyyyz*M_xyyyz + D_xxyzzz* &
      M_xyzzz + D_xxzzz*M_xzzz + D_xyyy*M_yyy + D_xyyyz*M_yyyz + &
      D_xyzzz*M_yzzz + D_xzzz*M_zzz) + (1.0d0/120.0d0)*(D_xxxxxx* &
      M_xxxxx + D_xxxxxxy*M_xxxxxy + D_xxxxxxyz*M_xxxxxyz + D_xxxxxxz* &
      M_xxxxxz + D_xxyyyyy*M_xyyyyy + D_xxyyyyyz*M_xyyyyyz + D_xxyzzzzz &
      *M_xyzzzzz + D_xxzzzzz*M_xzzzzz + D_xyyyyy*M_yyyyy + D_xyyyyyz* &
      M_yyyyyz + D_xyzzzzz*M_yzzzzz + D_xzzzzz*M_zzzzz) + (1.0d0/48.0d0 &
      )*(D_xxxxxyy*M_xxxxyy + D_xxxxxyyz*M_xxxxyyz + D_xxxxxyzz* &
      M_xxxxyzz + D_xxxxxzz*M_xxxxzz + D_xxxyyyy*M_xxyyyy + D_xxxyyyyz* &
      M_xxyyyyz + D_xxxyzzzz*M_xxyzzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxyyyyzz*M_xyyyyzz + D_xxyyzzzz*M_xyyzzzz + D_xyyyyzz*M_yyyyzz &
      + D_xyyzzzz*M_yyzzzz) + (1.0d0/12.0d0)*(D_xxxxyy*M_xxxyy + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyzz*M_xxxyzz + D_xxxxzz*M_xxxzz + &
      D_xxxyyy*M_xxyyy + D_xxxyyyz*M_xxyyyz + D_xxxyzzz*M_xxyzzz + &
      D_xxxzzz*M_xxzzz + D_xxyyyzz*M_xyyyzz + D_xxyyzzz*M_xyyzzz + &
      D_xyyyzz*M_yyyzz + D_xyyzzz*M_yyzzz) + (1.0d0/24.0d0)*(D_xxxxx* &
      M_xxxx + D_xxxxxy*M_xxxxy + D_xxxxxyz*M_xxxxyz + D_xxxxxz*M_xxxxz &
      + D_xxxxyyzz*M_xxxyyzz + D_xxxyyyzz*M_xxyyyzz + D_xxxyyzzz* &
      M_xxyyzzz + D_xxyyyy*M_xyyyy + D_xxyyyyz*M_xyyyyz + D_xxyzzzz* &
      M_xyzzzz + D_xxzzzz*M_xzzzz + D_xyyyy*M_yyyy + D_xyyyyz*M_yyyyz + &
      D_xyzzzz*M_yzzzz + D_xzzzz*M_zzzz))
    L_xz       = L_xz + ((1.0d0/8.0d0)*D_xxxyyzzz*M_xxyyzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz &
      *M_xz + D_xyzz*M_yz + D_xz*M_0 + (1.0d0/720.0d0)*(D_xxxxxxxz* &
      M_xxxxxx + D_xyyyyyyz*M_yyyyyy + D_xzzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxyyyz*M_xxxyyy + D_xxxxzzzz*M_xxxzzz + D_xyyyzzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxyyz*M_xxxxyy + D_xxxxxzzz* &
      M_xxxxzz + D_xxxyyyyz*M_xxyyyy + D_xxxzzzzz*M_xxzzzz + D_xyyyyzzz &
      *M_yyyyzz + D_xyyzzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxyyz*M_xxyy &
      + D_xxxyyzz*M_xxyyz + D_xxxyzzz*M_xxyzz + D_xxxzzz*M_xxzz + &
      D_xxyyzzz*M_xyyzz + D_xyyzzz*M_yyzz) + (1.0d0/120.0d0)*( &
      D_xxxxxxyz*M_xxxxxy + D_xxxxxxz*M_xxxxx + D_xxxxxxzz*M_xxxxxz + &
      D_xxyyyyyz*M_xyyyyy + D_xxzzzzzz*M_xzzzzz + D_xyyyyyz*M_yyyyy + &
      D_xyyyyyzz*M_yyyyyz + D_xyzzzzzz*M_yzzzzz + D_xzzzzzz*M_zzzzz) + &
      (1.0d0/24.0d0)*(D_xxxxxyz*M_xxxxy + D_xxxxxyzz*M_xxxxyz + &
      D_xxxxxz*M_xxxx + D_xxxxxzz*M_xxxxz + D_xxyyyyz*M_xyyyy + &
      D_xxyyyyzz*M_xyyyyz + D_xxyzzzzz*M_xyzzzz + D_xxzzzzz*M_xzzzz + &
      D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + D_xyzzzzz*M_yzzzz + &
      D_xzzzzz*M_zzzz) + (1.0d0/12.0d0)*(D_xxxxyyz*M_xxxyy + D_xxxxyyzz &
      *M_xxxyyz + D_xxxxyzzz*M_xxxyzz + D_xxxxzzz*M_xxxzz + D_xxxyyyz* &
      M_xxyyy + D_xxxyyyzz*M_xxyyyz + D_xxxyzzzz*M_xxyzzz + D_xxxzzzz* &
      M_xxzzz + D_xxyyyzzz*M_xyyyzz + D_xxyyzzzz*M_xyyzzz + D_xyyyzzz* &
      M_yyyzz + D_xyyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxxyz*M_xxxy + &
      D_xxxxyzz*M_xxxyz + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxyyyz* &
      M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyzzzz*M_xyzzz + D_xxzzzz*M_xzzz &
      + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyzzzz*M_yzzz + D_xzzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz* &
      M_xx + D_xxxzz*M_xxz + D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyzzz &
      *M_xyzz + D_xxzzz*M_xzz + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz* &
      M_yzz + D_xzzz*M_zz))
    D_yyyyyyyy = 11025*h**4*u**17 - 396900*h**3*u**17*y**2 + 2182950*h**2*u**17*y**4 - &
      3783780*h*u**17*y**6 + 2027025*u**17*y**8
    L_yyyyyyyy = L_yyyyyyyy + (D_yyyyyyyy*M_0)
    D_yyyyyyyz = -99225*h**3*u**17*y*z + 1091475*h**2*u**17*y**3*z - 2837835*h*u**17*y**5 &
      *z + 2027025*u**17*y**7*z
    L_yyyyyyyz = L_yyyyyyyz + (D_yyyyyyyz*M_0)
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = L_yyyyyy + (D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + D_yyyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxyyyyyy*M_xx + D_yyyyyyyy*M_yy + D_yyyyyyzz*M_zz &
      ))
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = L_yyyyy + (D_xyyyyyy*M_xy + D_xyyyyyyz*M_xyz + D_xyyyyyz*M_xz + D_yyyyy*M_0 + &
      D_yyyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxyyyyy*M_xxx + D_yyyyyyyy* &
      M_yyy + D_yyyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyyy*M_xx + &
      D_xxyyyyyy*M_xxy + D_xxyyyyyz*M_xxz + D_xyyyyyyy*M_xyy + &
      D_xyyyyyzz*M_xzz + D_yyyyyyy*M_yy + D_yyyyyyyz*M_yyz + D_yyyyyyzz &
      *M_yzz + D_yyyyyzz*M_zz))
    L_yyyyyz   = L_yyyyyz + (D_xyyyyyyz*M_xy + D_xyyyyyzz*M_xz + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxyyyyyz*M_xx + D_yyyyyyyz*M_yy + D_yyyyyzzz*M_zz &
      ))
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = L_yyyy + (D_xyyyyy*M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxyyyy*M_xxxx + D_yyyyyyyy*M_yyyy + &
      D_yyyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyyyy*M_xxyy + &
      D_xxyyyyzz*M_xxzz + D_yyyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxyyyy &
      *M_xxx + D_xxxyyyyy*M_xxxy + D_xxxyyyyz*M_xxxz + D_xyyyyyyy* &
      M_xyyy + D_xyyyyzzz*M_xzzz + D_yyyyyyy*M_yyy + D_yyyyyyyz*M_yyyz &
      + D_yyyyyzzz*M_yzzz + D_yyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyy* &
      M_xx + D_xxyyyyy*M_xxy + D_xxyyyyyz*M_xxyz + D_xxyyyyz*M_xxz + &
      D_xyyyyyy*M_xyy + D_xyyyyyyz*M_xyyz + D_xyyyyyzz*M_xyzz + &
      D_xyyyyzz*M_xzz + D_yyyyyy*M_yy + D_yyyyyyz*M_yyz + D_yyyyyzz* &
      M_yzz + D_yyyyzz*M_zz))
    L_yyyyz    = L_yyyyz + (D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyzz*M_xz + D_yyyyyzz*M_yz + &
      D_yyyyz*M_0 + (1.0d0/6.0d0)*(D_xxxyyyyz*M_xxx + D_yyyyyyyz*M_yyy &
      + D_yyyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyyyz*M_xxy + D_xxyyyyz &
      *M_xx + D_xxyyyyzz*M_xxz + D_xyyyyyyz*M_xyy + D_xyyyyzzz*M_xzz + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyzzz*M_yzz + D_yyyyzzz* &
      M_zz))
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = L_yyy + (D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxyyy*M_xxxxx + D_yyyyyyyy*M_yyyyy + &
      D_yyyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyyyy*M_xxxyy + &
      D_xxxyyyzz*M_xxxzz + D_xxyyyyyy*M_xxyyy + D_xxyyyzzz*M_xxzzz + &
      D_yyyyyyzz*M_yyyzz + D_yyyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyyy*M_xxyy + D_xxyyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyzz + &
      D_xxyyyzz*M_xxzz + D_xyyyyyzz*M_xyyzz + D_yyyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + D_xxxxyyyz &
      *M_xxxxz + D_xyyyyyyy*M_xyyyy + D_xyyyzzzz*M_xzzzz + D_yyyyyyy* &
      M_yyyy + D_yyyyyyyz*M_yyyyz + D_yyyyzzzz*M_yzzzz + D_yyyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + &
      D_xxxyyyyz*M_xxxyz + D_xxxyyyz*M_xxxz + D_xyyyyyy*M_xyyy + &
      D_xyyyyyyz*M_xyyyz + D_xyyyyzzz*M_xyzzz + D_xyyyzzz*M_xzzz + &
      D_yyyyyy*M_yyy + D_yyyyyyz*M_yyyz + D_yyyyzzz*M_yzzz + D_yyyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyz &
      *M_xxyz + D_xxyyyz*M_xxz + D_xyyyyy*M_xyy + D_xyyyyyz*M_xyyz + &
      D_xyyyyzz*M_xyzz + D_xyyyzz*M_xzz + D_yyyyy*M_yy + D_yyyyyz*M_yyz &
      + D_yyyyzz*M_yzz + D_yyyzz*M_zz))
    L_yyyz     = L_yyyz + (D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz + D_yyyyzz*M_yz + D_yyyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxyyyz*M_xxxx + D_yyyyyyyz*M_yyyy + &
      D_yyyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyyyz*M_xxyy + &
      D_xxyyyzzz*M_xxzz + D_yyyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxyyyyz*M_xxxy + D_xxxyyyz*M_xxx + D_xxxyyyzz*M_xxxz + &
      D_xyyyyyyz*M_xyyy + D_xyyyzzzz*M_xzzz + D_yyyyyyz*M_yyy + &
      D_yyyyyyzz*M_yyyz + D_yyyyzzzz*M_yzzz + D_yyyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz + D_xxyyyz*M_xx + &
      D_xxyyyzz*M_xxz + D_xyyyyyz*M_xyy + D_xyyyyyzz*M_xyyz + &
      D_xyyyyzzz*M_xyzz + D_xyyyzzz*M_xzz + D_yyyyyz*M_yy + D_yyyyyzz* &
      M_yyz + D_yyyyzzz*M_yzz + D_yyyzzz*M_zz))
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = L_yy + ((1.0d0/8.0d0)*D_xxyyyyzz*M_xxyyzz + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz &
      *M_xz + D_yy*M_0 + D_yyyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxyy* &
      M_xxxxxx + D_yyyyyyyy*M_yyyyyy + D_yyzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxyyyyy*M_xxxyyy + D_xxxyyzzz*M_xxxzzz + D_yyyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyyyy*M_xxxxyy + D_xxxxyyzz* &
      M_xxxxzz + D_xxyyyyyy*M_xxyyyy + D_xxyyzzzz*M_xxzzzz + D_yyyyyyzz &
      *M_yyyyzz + D_yyyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyyyy*M_xxyy &
      + D_xxyyyyz*M_xxyyz + D_xxyyyzz*M_xxyzz + D_xxyyzz*M_xxzz + &
      D_xyyyyzz*M_xyyzz + D_yyyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxyy &
      *M_xxxxx + D_xxxxxyyy*M_xxxxxy + D_xxxxxyyz*M_xxxxxz + D_xyyyyyyy &
      *M_xyyyyy + D_xyyzzzzz*M_xzzzzz + D_yyyyyyy*M_yyyyy + D_yyyyyyyz* &
      M_yyyyyz + D_yyyzzzzz*M_yzzzzz + D_yyzzzzz*M_zzzzz) + (1.0d0/ &
      24.0d0)*(D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + D_xxxxyyyz* &
      M_xxxxyz + D_xxxxyyz*M_xxxxz + D_xyyyyyy*M_xyyyy + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyzzzz*M_xyzzzz + D_xyyzzzz*M_xzzzz + D_yyyyyy* &
      M_yyyy + D_yyyyyyz*M_yyyyz + D_yyyzzzz*M_yzzzz + D_yyzzzz*M_zzzz &
      ) + (1.0d0/6.0d0)*(D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyz* &
      M_xxxyz + D_xxxyyz*M_xxxz + D_xyyyyy*M_xyyy + D_xyyyyyz*M_xyyyz + &
      D_xyyyzzz*M_xyzzz + D_xyyzzz*M_xzzz + D_yyyyy*M_yyy + D_yyyyyz* &
      M_yyyz + D_yyyzzz*M_yzzz + D_yyzzz*M_zzz) + (1.0d0/12.0d0)*( &
      D_xxxyyyy*M_xxxyy + D_xxxyyyyz*M_xxxyyz + D_xxxyyyzz*M_xxxyzz + &
      D_xxxyyzz*M_xxxzz + D_xxyyyyy*M_xxyyy + D_xxyyyyyz*M_xxyyyz + &
      D_xxyyyzzz*M_xxyzzz + D_xxyyzzz*M_xxzzz + D_xyyyyyzz*M_xyyyzz + &
      D_xyyyyzzz*M_xyyzzz + D_yyyyyzz*M_yyyzz + D_yyyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyz*M_xxyz + &
      D_xxyyz*M_xxz + D_xyyyy*M_xyy + D_xyyyyz*M_xyyz + D_xyyyzz*M_xyzz &
      + D_xyyzz*M_xzz + D_yyyy*M_yy + D_yyyyz*M_yyz + D_yyyzz*M_yzz + &
      D_yyzz*M_zz))
    L_yyz      = L_yyz + (D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyzz*M_yz + D_yyz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxyyz*M_xxxxx + D_yyyyyyyz*M_yyyyy + &
      D_yyzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyyyz*M_xxxyy + &
      D_xxxyyzzz*M_xxxzz + D_xxyyyyyz*M_xxyyy + D_xxyyzzzz*M_xxzzz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyyz*M_xxyy + D_xxyyyyzz*M_xxyyz + D_xxyyyzzz*M_xxyzz + &
      D_xxyyzzz*M_xxzz + D_xyyyyzzz*M_xyyzz + D_yyyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxyyyz*M_xxxxy + D_xxxxyyz*M_xxxx + D_xxxxyyzz &
      *M_xxxxz + D_xyyyyyyz*M_xyyyy + D_xyyzzzzz*M_xzzzz + D_yyyyyyz* &
      M_yyyy + D_yyyyyyzz*M_yyyyz + D_yyyzzzzz*M_yzzzz + D_yyzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxyyyz*M_xxxy + D_xxxyyyzz*M_xxxyz + &
      D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + D_xyyyyyz*M_xyyy + D_xyyyyyzz &
      *M_xyyyz + D_xyyyzzzz*M_xyzzz + D_xyyzzzz*M_xzzz + D_yyyyyz*M_yyy &
      + D_yyyyyzz*M_yyyz + D_yyyzzzz*M_yzzz + D_yyzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyz*M_xx + &
      D_xxyyzz*M_xxz + D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyzzz* &
      M_xyzz + D_xyyzzz*M_xzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + &
      D_yyyzzz*M_yzz + D_yyzzz*M_zz))
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = L_y + ((1.0d0/8.0d0)*D_xxyyyzz*M_xxyyzz + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz* &
      M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/5040.0d0)*(D_xxxxxxxy* &
      M_xxxxxxx + D_yyyyyyyy*M_yyyyyyy + D_yzzzzzzz*M_zzzzzzz) + (1.0d0 &
      /240.0d0)*(D_xxxxxyyy*M_xxxxxyy + D_xxxxxyzz*M_xxxxxzz + &
      D_xxyyyyyy*M_xxyyyyy + D_xxyzzzzz*M_xxzzzzz + D_yyyyyyzz* &
      M_yyyyyzz + D_yyyzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxyyyy* &
      M_xxxxyyy + D_xxxxyzzz*M_xxxxzzz + D_xxxyyyyy*M_xxxyyyy + &
      D_xxxyzzzz*M_xxxzzzz + D_yyyyyzzz*M_yyyyzzz + D_yyyyzzzz* &
      M_yyyzzzz) + (1.0d0/36.0d0)*(D_xxxyyyy*M_xxxyyy + D_xxxyyyyz* &
      M_xxxyyyz + D_xxxyyzzz*M_xxxyzzz + D_xxxyzzz*M_xxxzzz + &
      D_xyyyyzzz*M_xyyyzzz + D_yyyyzzz*M_yyyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyy*M_xxyy + D_xxyyyz*M_xxyyz + D_xxyyzz*M_xxyzz + D_xxyzz* &
      M_xxzz + D_xyyyzz*M_xyyzz + D_yyyzz*M_yyzz) + (1.0d0/720.0d0)*( &
      D_xxxxxxy*M_xxxxxx + D_xxxxxxyy*M_xxxxxxy + D_xxxxxxyz*M_xxxxxxz &
      + D_xyyyyyyy*M_xyyyyyy + D_xyzzzzzz*M_xzzzzzz + D_yyyyyyy* &
      M_yyyyyy + D_yyyyyyyz*M_yyyyyyz + D_yyzzzzzz*M_yzzzzzz + &
      D_yzzzzzz*M_zzzzzz) + (1.0d0/120.0d0)*(D_xxxxxy*M_xxxxx + &
      D_xxxxxyy*M_xxxxxy + D_xxxxxyyz*M_xxxxxyz + D_xxxxxyz*M_xxxxxz + &
      D_xyyyyyy*M_xyyyyy + D_xyyyyyyz*M_xyyyyyz + D_xyyzzzzz*M_xyzzzzz &
      + D_xyzzzzz*M_xzzzzz + D_yyyyyy*M_yyyyy + D_yyyyyyz*M_yyyyyz + &
      D_yyzzzzz*M_yzzzzz + D_yzzzzz*M_zzzzz) + (1.0d0/48.0d0)*( &
      D_xxxxyyy*M_xxxxyy + D_xxxxyyyz*M_xxxxyyz + D_xxxxyyzz*M_xxxxyzz &
      + D_xxxxyzz*M_xxxxzz + D_xxyyyyy*M_xxyyyy + D_xxyyyyyz*M_xxyyyyz &
      + D_xxyyzzzz*M_xxyzzzz + D_xxyzzzz*M_xxzzzz + D_xyyyyyzz* &
      M_xyyyyzz + D_xyyyzzzz*M_xyyzzzz + D_yyyyyzz*M_yyyyzz + D_yyyzzzz &
      *M_yyzzzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + D_xxxyy*M_xxxy + &
      D_xxxyyz*M_xxxyz + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + D_xyyyyz* &
      M_xyyyz + D_xyyzzz*M_xyzzz + D_xyzzz*M_xzzz + D_yyyy*M_yyy + &
      D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) + (1.0d0/12.0d0)* &
      (D_xxxyyy*M_xxxyy + D_xxxyyyz*M_xxxyyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyzz*M_xxxzz + D_xxyyyy*M_xxyyy + D_xxyyyyz*M_xxyyyz + &
      D_xxyyzzz*M_xxyzzz + D_xxyzzz*M_xxzzz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyzzz*M_xyyzzz + D_yyyyzz*M_yyyzz + D_yyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + D_xxyz &
      *M_xxz + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + D_xyzz* &
      M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz*M_zz) + &
      (1.0d0/24.0d0)*(D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyyz* &
      M_xxxxyz + D_xxxxyz*M_xxxxz + D_xxxyyyzz*M_xxxyyzz + D_xxyyyyzz* &
      M_xxyyyzz + D_xxyyyzzz*M_xxyyzzz + D_xyyyyy*M_xyyyy + D_xyyyyyz* &
      M_xyyyyz + D_xyyzzzz*M_xyzzzz + D_xyzzzz*M_xzzzz + D_yyyyy*M_yyyy &
      + D_yyyyyz*M_yyyyz + D_yyzzzz*M_yzzzz + D_yzzzz*M_zzzz))
    L_yz       = L_yz + ((1.0d0/8.0d0)*D_xxyyyzzz*M_xxyyzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz &
      *M_xz + D_yyzz*M_yz + D_yz*M_0 + (1.0d0/720.0d0)*(D_xxxxxxyz* &
      M_xxxxxx + D_yyyyyyyz*M_yyyyyy + D_yzzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxyyyyz*M_xxxyyy + D_xxxyzzzz*M_xxxzzz + D_yyyyzzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyyyz*M_xxxxyy + D_xxxxyzzz* &
      M_xxxxzz + D_xxyyyyyz*M_xxyyyy + D_xxyzzzzz*M_xxzzzz + D_yyyyyzzz &
      *M_yyyyzz + D_yyyzzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyyyz*M_xxyy &
      + D_xxyyyzz*M_xxyyz + D_xxyyzzz*M_xxyzz + D_xxyzzz*M_xxzz + &
      D_xyyyzzz*M_xyyzz + D_yyyzzz*M_yyzz) + (1.0d0/120.0d0)*( &
      D_xxxxxyyz*M_xxxxxy + D_xxxxxyz*M_xxxxx + D_xxxxxyzz*M_xxxxxz + &
      D_xyyyyyyz*M_xyyyyy + D_xyzzzzzz*M_xzzzzz + D_yyyyyyz*M_yyyyy + &
      D_yyyyyyzz*M_yyyyyz + D_yyzzzzzz*M_yzzzzz + D_yzzzzzz*M_zzzzz) + &
      (1.0d0/24.0d0)*(D_xxxxyyz*M_xxxxy + D_xxxxyyzz*M_xxxxyz + &
      D_xxxxyz*M_xxxx + D_xxxxyzz*M_xxxxz + D_xyyyyyz*M_xyyyy + &
      D_xyyyyyzz*M_xyyyyz + D_xyyzzzzz*M_xyzzzz + D_xyzzzzz*M_xzzzz + &
      D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + D_yyzzzzz*M_yzzzz + &
      D_yzzzzz*M_zzzz) + (1.0d0/12.0d0)*(D_xxxyyyz*M_xxxyy + D_xxxyyyzz &
      *M_xxxyyz + D_xxxyyzzz*M_xxxyzz + D_xxxyzzz*M_xxxzz + D_xxyyyyz* &
      M_xxyyy + D_xxyyyyzz*M_xxyyyz + D_xxyyzzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxzzz + D_xyyyyzzz*M_xyyyzz + D_xyyyzzzz*M_xyyzzz + D_yyyyzzz* &
      M_yyyzz + D_yyyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxyyz*M_xxxy + &
      D_xxxyyzz*M_xxxyz + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xyyyyz* &
      M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyzzzz*M_xyzzz + D_xyzzzz*M_xzzz &
      + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyzzzz*M_yzzz + D_yzzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz* &
      M_xx + D_xxyzz*M_xxz + D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyzzz &
      *M_xyzz + D_xyzzz*M_xzz + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz* &
      M_yzz + D_yzzz*M_zz))
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_z        = L_z + ((1.0d0/8.0d0)*D_xxyyzzz*M_xxyyzz + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/5040.0d0)*(D_xxxxxxxz* &
      M_xxxxxxx + D_yyyyyyyz*M_yyyyyyy + D_zzzzzzzz*M_zzzzzzz) + (1.0d0 &
      /240.0d0)*(D_xxxxxyyz*M_xxxxxyy + D_xxxxxzzz*M_xxxxxzz + &
      D_xxyyyyyz*M_xxyyyyy + D_xxzzzzzz*M_xxzzzzz + D_yyyyyzzz* &
      M_yyyyyzz + D_yyzzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxyyyz* &
      M_xxxxyyy + D_xxxxzzzz*M_xxxxzzz + D_xxxyyyyz*M_xxxyyyy + &
      D_xxxzzzzz*M_xxxzzzz + D_yyyyzzzz*M_yyyyzzz + D_yyyzzzzz* &
      M_yyyzzzz) + (1.0d0/36.0d0)*(D_xxxyyyz*M_xxxyyy + D_xxxyyyzz* &
      M_xxxyyyz + D_xxxyzzzz*M_xxxyzzz + D_xxxzzzz*M_xxxzzz + &
      D_xyyyzzzz*M_xyyyzzz + D_yyyzzzz*M_yyyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyzzz*M_xxyzz + D_xxzzz* &
      M_xxzz + D_xyyzzz*M_xyyzz + D_yyzzz*M_yyzz) + (1.0d0/720.0d0)*( &
      D_xxxxxxyz*M_xxxxxxy + D_xxxxxxz*M_xxxxxx + D_xxxxxxzz*M_xxxxxxz &
      + D_xyyyyyyz*M_xyyyyyy + D_xzzzzzzz*M_xzzzzzz + D_yyyyyyz* &
      M_yyyyyy + D_yyyyyyzz*M_yyyyyyz + D_yzzzzzzz*M_yzzzzzz + &
      D_zzzzzzz*M_zzzzzz) + (1.0d0/120.0d0)*(D_xxxxxyz*M_xxxxxy + &
      D_xxxxxyzz*M_xxxxxyz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + &
      D_xyyyyyz*M_xyyyyy + D_xyyyyyzz*M_xyyyyyz + D_xyzzzzzz*M_xyzzzzz &
      + D_xzzzzzz*M_xzzzzz + D_yyyyyz*M_yyyyy + D_yyyyyzz*M_yyyyyz + &
      D_yzzzzzz*M_yzzzzz + D_zzzzzz*M_zzzzz) + (1.0d0/48.0d0)*( &
      D_xxxxyyz*M_xxxxyy + D_xxxxyyzz*M_xxxxyyz + D_xxxxyzzz*M_xxxxyzz &
      + D_xxxxzzz*M_xxxxzz + D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz &
      + D_xxyzzzzz*M_xxyzzzz + D_xxzzzzz*M_xxzzzz + D_xyyyyzzz* &
      M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz + D_yyyyzzz*M_yyyyzz + D_yyzzzzz &
      *M_yyzzzz) + (1.0d0/12.0d0)*(D_xxxyyz*M_xxxyy + D_xxxyyzz* &
      M_xxxyyz + D_xxxyzzz*M_xxxyzz + D_xxxzzz*M_xxxzz + D_xxyyyz* &
      M_xxyyy + D_xxyyyzz*M_xxyyyz + D_xxyzzzz*M_xxyzzz + D_xxzzzz* &
      M_xxzzz + D_xyyyzzz*M_xyyyzz + D_xyyzzzz*M_xyyzzz + D_yyyzzz* &
      M_yyyzz + D_yyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy &
      + D_xyyyzz*M_xyyyz + D_xyzzzz*M_xyzzz + D_xzzzz*M_xzzz + D_yyyz* &
      M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + D_xxzz*M_xxz &
      + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz*M_xyzz + D_xzzz*M_xzz + &
      D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz*M_zz) + (1.0d0/ &
      24.0d0)*(D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + D_xxxxz*M_xxxx + &
      D_xxxxzz*M_xxxxz + D_xxxyyzzz*M_xxxyyzz + D_xxyyyzzz*M_xxyyyzz + &
      D_xxyyzzzz*M_xxyyzzz + D_xyyyyz*M_xyyyy + D_xyyyyzz*M_xyyyyz + &
      D_xyzzzzz*M_xyzzzz + D_xzzzzz*M_xzzzz + D_yyyyz*M_yyyy + D_yyyyzz &
      *M_yyyyz + D_yzzzzz*M_yzzzz + D_zzzzz*M_zzzz))
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
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  L_xxx               
#undef  M_xxz               
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
#undef  L_xxxxyy            
#undef  M_xxxyyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
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
    end subroutine mom_es_M2L_add
    
! OPS  1834*ADD + 202*DIV + 3402*MUL + 84*NEG + 1890*POW = 7412  (8804 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz,&
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
                L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define Ls_xy                Ls(4)
#define L_xy                 L(4)
#define Ls_xz                Ls(5)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define Ls_yy                Ls(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define Ls_xxz               Ls(10)
#define L_xxz                L(10)
#define Ls_xyy               Ls(11)
#define L_xyy                L(11)
#define Ls_xyz               Ls(12)
#define L_xyz                L(12)
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
#define L_xxyyy              L(29)
#define Ls_xxyyy             Ls(29)
#define L_xxyyz              L(30)
#define Ls_xxyyz             Ls(30)
#define Ls_xyyyy             Ls(31)
#define L_xyyyy              L(31)
#define Ls_xyyyz             Ls(32)
#define L_xyyyz              L(32)
#define L_yyyyy              L(33)
#define Ls_yyyyy             Ls(33)
#define L_yyyyz              L(34)
#define Ls_yyyyz             Ls(34)
#define Ls_xxxxxx            Ls(35)
#define L_xxxxxx             L(35)
#define L_xxxxxy             L(36)
#define Ls_xxxxxy            Ls(36)
#define Ls_xxxxxz            Ls(37)
#define L_xxxxxz             L(37)
#define Ls_xxxxyy            Ls(38)
#define L_xxxxyy             L(38)
#define Ls_xxxxyz            Ls(39)
#define L_xxxxyz             L(39)
#define Ls_xxxyyy            Ls(40)
#define L_xxxyyy             L(40)
#define L_xxxyyz             L(41)
#define Ls_xxxyyz            Ls(41)
#define Ls_xxyyyy            Ls(42)
#define L_xxyyyy             L(42)
#define Ls_xxyyyz            Ls(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define Ls_xyyyyy            Ls(44)
#define L_xyyyyz             L(45)
#define Ls_xyyyyz            Ls(45)
#define L_yyyyyy             L(46)
#define Ls_yyyyyy            Ls(46)
#define Ls_yyyyyz            Ls(47)
#define L_yyyyyz             L(47)
#define Ls_xxxxxxx           Ls(48)
#define L_xxxxxxx            L(48)
#define Ls_xxxxxxy           Ls(49)
#define L_xxxxxxy            L(49)
#define Ls_xxxxxxz           Ls(50)
#define L_xxxxxxz            L(50)
#define Ls_xxxxxyy           Ls(51)
#define L_xxxxxyy            L(51)
#define Ls_xxxxxyz           Ls(52)
#define L_xxxxxyz            L(52)
#define Ls_xxxxyyy           Ls(53)
#define L_xxxxyyy            L(53)
#define Ls_xxxxyyz           Ls(54)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define Ls_xxxyyyy           Ls(55)
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
#define Ls_yyyyyyz           Ls(62)
#define L_yyyyyyz            L(62)
#define L_xxxxxxxx           L(63)
#define Ls_xxxxxxxx          Ls(63)
#define Ls_xxxxxxxy          Ls(64)
#define L_xxxxxxxy           L(64)
#define Ls_xxxxxxxz          Ls(65)
#define L_xxxxxxxz           L(65)
#define Ls_xxxxxxyy          Ls(66)
#define L_xxxxxxyy           L(66)
#define Ls_xxxxxxyz          Ls(67)
#define L_xxxxxxyz           L(67)
#define Ls_xxxxxyyy          Ls(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define Ls_xxxxxyyz          Ls(69)
#define Ls_xxxxyyyy          Ls(70)
#define L_xxxxyyyy           L(70)
#define L_xxxxyyyz           L(71)
#define Ls_xxxxyyyz          Ls(71)
#define Ls_xxxyyyyy          Ls(72)
#define L_xxxyyyyy           L(72)
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
    Ls_xxxxxxx  = Ls_xxxxxxx + (L_xxxxxxx + L_xxxxxxxx*x + L_xxxxxxxy*y + L_xxxxxxxz*z)
    Ls_xxxxxxy  = Ls_xxxxxxy + (L_xxxxxxxy*x + L_xxxxxxy + L_xxxxxxyy*y + L_xxxxxxyz*z)
    Ls_xxxxxyy  = Ls_xxxxxyy + (L_xxxxxxyy*x + L_xxxxxyy + L_xxxxxyyy*y + L_xxxxxyyz*z)
    Ls_xxxxyyy  = Ls_xxxxyyy + (L_xxxxxyyy*x + L_xxxxyyy + L_xxxxyyyy*y + L_xxxxyyyz*z)
    Ls_xxxyyyy  = Ls_xxxyyyy + (L_xxxxyyyy*x + L_xxxyyyy + L_xxxyyyyy*y + L_xxxyyyyz*z)
    Ls_xxyyyyy  = Ls_xxyyyyy + (L_xxxyyyyy*x + L_xxyyyyy + L_xxyyyyyy*y + L_xxyyyyyz*z)
    Ls_xyyyyyy  = Ls_xyyyyyy + (L_xxyyyyyy*x + L_xyyyyyy + L_xyyyyyyy*y + L_xyyyyyyz*z)
    Ls_yyyyyyy  = Ls_yyyyyyy + (L_xyyyyyyy*x + L_yyyyyyy + L_yyyyyyyy*y + L_yyyyyyyz*z)
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
    Ls_xxxxxx   = Ls_xxxxxx + (L_xxxxxx + L_xxxxxxx*x + L_xxxxxxxy*x*y + L_xxxxxxxz*x*z + L_xxxxxxy*y + &
      L_xxxxxxyz*y*z + L_xxxxxxz*z + (1.0d0/2.0d0)*(L_xxxxxxxx*x**2 + &
      L_xxxxxxyy*y**2 + L_xxxxxxzz*z**2))
    Ls_xxxxxxz  = Ls_xxxxxxz + (L_xxxxxxxz*x + L_xxxxxxyz*y + L_xxxxxxz + L_xxxxxxzz*z)
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    Ls_xxxxxy   = Ls_xxxxxy + (L_xxxxxxy*x + L_xxxxxxyy*x*y + L_xxxxxxyz*x*z + L_xxxxxy + L_xxxxxyy*y + &
      L_xxxxxyyz*y*z + L_xxxxxyz*z + (1.0d0/2.0d0)*(L_xxxxxxxy*x**2 + &
      L_xxxxxyyy*y**2 + L_xxxxxyzz*z**2))
    Ls_xxxxxyz  = Ls_xxxxxyz + (L_xxxxxxyz*x + L_xxxxxyyz*y + L_xxxxxyz + L_xxxxxyzz*z)
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    Ls_xxxxx    = Ls_xxxxx + (L_xxxxx + L_xxxxxx*x + L_xxxxxxy*x*y + L_xxxxxxyz*x*y*z + L_xxxxxxz*x*z &
      + L_xxxxxy*y + L_xxxxxyz*y*z + L_xxxxxz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxx*x**3 + L_xxxxxyyy*y**3 + L_xxxxxzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxx*x**2 + L_xxxxxxxy*x**2*y + L_xxxxxxxz*x**2*z + &
      L_xxxxxxyy*x*y**2 + L_xxxxxxzz*x*z**2 + L_xxxxxyy*y**2 + &
      L_xxxxxyyz*y**2*z + L_xxxxxyzz*y*z**2 + L_xxxxxzz*z**2))
    Ls_xxxxxz   = Ls_xxxxxz + (L_xxxxxxyz*x*y + L_xxxxxxz*x + L_xxxxxxzz*x*z + L_xxxxxyz*y + L_xxxxxyzz &
      *y*z + L_xxxxxz + L_xxxxxzz*z + (1.0d0/2.0d0)*(L_xxxxxxxz*x**2 + &
      L_xxxxxyyz*y**2 + L_xxxxxzzz*z**2))
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    Ls_xxxxyy   = Ls_xxxxyy + (L_xxxxxyy*x + L_xxxxxyyy*x*y + L_xxxxxyyz*x*z + L_xxxxyy + L_xxxxyyy*y + &
      L_xxxxyyyz*y*z + L_xxxxyyz*z + (1.0d0/2.0d0)*(L_xxxxxxyy*x**2 + &
      L_xxxxyyyy*y**2 + L_xxxxyyzz*z**2))
    Ls_xxxxyyz  = Ls_xxxxyyz + (L_xxxxxyyz*x + L_xxxxyyyz*y + L_xxxxyyz + L_xxxxyyzz*z)
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    Ls_xxxxy    = Ls_xxxxy + (L_xxxxxy*x + L_xxxxxyy*x*y + L_xxxxxyyz*x*y*z + L_xxxxxyz*x*z + L_xxxxy &
      + L_xxxxyy*y + L_xxxxyyz*y*z + L_xxxxyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxy*x**3 + L_xxxxyyyy*y**3 + L_xxxxyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxy*x**2 + L_xxxxxxyy*x**2*y + L_xxxxxxyz*x**2*z + &
      L_xxxxxyyy*x*y**2 + L_xxxxxyzz*x*z**2 + L_xxxxyyy*y**2 + &
      L_xxxxyyyz*y**2*z + L_xxxxyyzz*y*z**2 + L_xxxxyzz*z**2))
    Ls_xxxxyz   = Ls_xxxxyz + (L_xxxxxyyz*x*y + L_xxxxxyz*x + L_xxxxxyzz*x*z + L_xxxxyyz*y + L_xxxxyyzz &
      *y*z + L_xxxxyz + L_xxxxyzz*z + (1.0d0/2.0d0)*(L_xxxxxxyz*x**2 + &
      L_xxxxyyyz*y**2 + L_xxxxyzzz*z**2))
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    Ls_xxxx     = Ls_xxxx + (L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxyz*x*y*z + L_xxxxxz*x*z + &
      L_xxxxy*y + L_xxxxyz*y*z + L_xxxxz*z + (1.0d0/24.0d0)*(L_xxxxxxxx &
      *x**4 + L_xxxxyyyy*y**4 + L_xxxxzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxxyy*x**2*y**2 + L_xxxxxxzz*x**2*z**2 + L_xxxxyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxx*x**3 + L_xxxxxxxy*x**3*y + &
      L_xxxxxxxz*x**3*z + L_xxxxxyyy*x*y**3 + L_xxxxxzzz*x*z**3 + &
      L_xxxxyyy*y**3 + L_xxxxyyyz*y**3*z + L_xxxxyzzz*y*z**3 + &
      L_xxxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxx*x**2 + L_xxxxxxy*x**2*y &
      + L_xxxxxxyz*x**2*y*z + L_xxxxxxz*x**2*z + L_xxxxxyy*x*y**2 + &
      L_xxxxxyyz*x*y**2*z + L_xxxxxyzz*x*y*z**2 + L_xxxxxzz*x*z**2 + &
      L_xxxxyy*y**2 + L_xxxxyyz*y**2*z + L_xxxxyzz*y*z**2 + L_xxxxzz*z &
      **2))
    Ls_xxxxz    = Ls_xxxxz + (L_xxxxxyz*x*y + L_xxxxxyzz*x*y*z + L_xxxxxz*x + L_xxxxxzz*x*z + L_xxxxyz &
      *y + L_xxxxyzz*y*z + L_xxxxz + L_xxxxzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxz*x**3 + L_xxxxyyyz*y**3 + L_xxxxzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxyz*x**2*y + L_xxxxxxz*x**2 + L_xxxxxxzz*x**2*z + &
      L_xxxxxyyz*x*y**2 + L_xxxxxzzz*x*z**2 + L_xxxxyyz*y**2 + &
      L_xxxxyyzz*y**2*z + L_xxxxyzzz*y*z**2 + L_xxxxzzz*z**2))
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    Ls_xxxyyy   = Ls_xxxyyy + (L_xxxxyyy*x + L_xxxxyyyy*x*y + L_xxxxyyyz*x*z + L_xxxyyy + L_xxxyyyy*y + &
      L_xxxyyyyz*y*z + L_xxxyyyz*z + (1.0d0/2.0d0)*(L_xxxxxyyy*x**2 + &
      L_xxxyyyyy*y**2 + L_xxxyyyzz*z**2))
    Ls_xxxyyyz  = Ls_xxxyyyz + (L_xxxxyyyz*x + L_xxxyyyyz*y + L_xxxyyyz + L_xxxyyyzz*z)
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    Ls_xxxyy    = Ls_xxxyy + (L_xxxxyy*x + L_xxxxyyy*x*y + L_xxxxyyyz*x*y*z + L_xxxxyyz*x*z + L_xxxyy &
      + L_xxxyyy*y + L_xxxyyyz*y*z + L_xxxyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxyy*x**3 + L_xxxyyyyy*y**3 + L_xxxyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxyy*x**2 + L_xxxxxyyy*x**2*y + L_xxxxxyyz*x**2*z + &
      L_xxxxyyyy*x*y**2 + L_xxxxyyzz*x*z**2 + L_xxxyyyy*y**2 + &
      L_xxxyyyyz*y**2*z + L_xxxyyyzz*y*z**2 + L_xxxyyzz*z**2))
    Ls_xxxyyz   = Ls_xxxyyz + (L_xxxxyyyz*x*y + L_xxxxyyz*x + L_xxxxyyzz*x*z + L_xxxyyyz*y + L_xxxyyyzz &
      *y*z + L_xxxyyz + L_xxxyyzz*z + (1.0d0/2.0d0)*(L_xxxxxyyz*x**2 + &
      L_xxxyyyyz*y**2 + L_xxxyyzzz*z**2))
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    Ls_xxxy     = Ls_xxxy + (L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyyz*x*y*z + L_xxxxyz*x*z + L_xxxy + &
      L_xxxyy*y + L_xxxyyz*y*z + L_xxxyz*z + (1.0d0/24.0d0)*(L_xxxxxxxy &
      *x**4 + L_xxxyyyyy*y**4 + L_xxxyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxyyy*x**2*y**2 + L_xxxxxyzz*x**2*z**2 + L_xxxyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxy*x**3 + L_xxxxxxyy*x**3*y + &
      L_xxxxxxyz*x**3*z + L_xxxxyyyy*x*y**3 + L_xxxxyzzz*x*z**3 + &
      L_xxxyyyy*y**3 + L_xxxyyyyz*y**3*z + L_xxxyyzzz*y*z**3 + &
      L_xxxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxy*x**2 + L_xxxxxyy*x**2*y &
      + L_xxxxxyyz*x**2*y*z + L_xxxxxyz*x**2*z + L_xxxxyyy*x*y**2 + &
      L_xxxxyyyz*x*y**2*z + L_xxxxyyzz*x*y*z**2 + L_xxxxyzz*x*z**2 + &
      L_xxxyyy*y**2 + L_xxxyyyz*y**2*z + L_xxxyyzz*y*z**2 + L_xxxyzz*z &
      **2))
    Ls_xxxyz    = Ls_xxxyz + (L_xxxxyyz*x*y + L_xxxxyyzz*x*y*z + L_xxxxyz*x + L_xxxxyzz*x*z + L_xxxyyz &
      *y + L_xxxyyzz*y*z + L_xxxyz + L_xxxyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxyz*x**3 + L_xxxyyyyz*y**3 + L_xxxyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxyyz*x**2*y + L_xxxxxyz*x**2 + L_xxxxxyzz*x**2*z + &
      L_xxxxyyyz*x*y**2 + L_xxxxyzzz*x*z**2 + L_xxxyyyz*y**2 + &
      L_xxxyyyzz*y**2*z + L_xxxyyzzz*y*z**2 + L_xxxyzzz*z**2))
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    Ls_xxx      = Ls_xxx + (L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/120.0d0)*(L_xxxxxxxx*x**5 + &
      L_xxxyyyyy*y**5 + L_xxxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxxyy*x &
      **3*y**2 + L_xxxxxxzz*x**3*z**2 + L_xxxxxyyy*x**2*y**3 + &
      L_xxxxxzzz*x**2*z**3 + L_xxxyyyzz*y**3*z**2 + L_xxxyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxxyy*x**2*y**2 + L_xxxxxyyz*x**2*y**2*z &
      + L_xxxxxyzz*x**2*y*z**2 + L_xxxxxzz*x**2*z**2 + L_xxxxyyzz*x*y** &
      2*z**2 + L_xxxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxx*x**4 + &
      L_xxxxxxxy*x**4*y + L_xxxxxxxz*x**4*z + L_xxxxyyyy*x*y**4 + &
      L_xxxxzzzz*x*z**4 + L_xxxyyyy*y**4 + L_xxxyyyyz*y**4*z + &
      L_xxxyzzzz*y*z**4 + L_xxxzzzz*z**4) + (1.0d0/2.0d0)*(L_xxxxx*x**2 &
      + L_xxxxxy*x**2*y + L_xxxxxyz*x**2*y*z + L_xxxxxz*x**2*z + &
      L_xxxxyy*x*y**2 + L_xxxxyyz*x*y**2*z + L_xxxxyzz*x*y*z**2 + &
      L_xxxxzz*x*z**2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z** &
      2 + L_xxxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxxx*x**3 + L_xxxxxxy*x**3 &
      *y + L_xxxxxxyz*x**3*y*z + L_xxxxxxz*x**3*z + L_xxxxyyy*x*y**3 + &
      L_xxxxyyyz*x*y**3*z + L_xxxxyzzz*x*y*z**3 + L_xxxxzzz*x*z**3 + &
      L_xxxyyy*y**3 + L_xxxyyyz*y**3*z + L_xxxyzzz*y*z**3 + L_xxxzzz*z &
      **3))
    Ls_xxxz     = Ls_xxxz + (L_xxxxyz*x*y + L_xxxxyzz*x*y*z + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + &
      L_xxxyzz*y*z + L_xxxz + L_xxxzz*z + (1.0d0/24.0d0)*(L_xxxxxxxz*x &
      **4 + L_xxxyyyyz*y**4 + L_xxxzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxyyz*x**2*y**2 + L_xxxxxzzz*x**2*z**2 + L_xxxyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxyz*x**3*y + L_xxxxxxz*x**3 + &
      L_xxxxxxzz*x**3*z + L_xxxxyyyz*x*y**3 + L_xxxxzzzz*x*z**3 + &
      L_xxxyyyz*y**3 + L_xxxyyyzz*y**3*z + L_xxxyzzzz*y*z**3 + &
      L_xxxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxyz*x**2*y + L_xxxxxyzz*x &
      **2*y*z + L_xxxxxz*x**2 + L_xxxxxzz*x**2*z + L_xxxxyyz*x*y**2 + &
      L_xxxxyyzz*x*y**2*z + L_xxxxyzzz*x*y*z**2 + L_xxxxzzz*x*z**2 + &
      L_xxxyyz*y**2 + L_xxxyyzz*y**2*z + L_xxxyzzz*y*z**2 + L_xxxzzz*z &
      **2))
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    Ls_xxyyyy   = Ls_xxyyyy + (L_xxxyyyy*x + L_xxxyyyyy*x*y + L_xxxyyyyz*x*z + L_xxyyyy + L_xxyyyyy*y + &
      L_xxyyyyyz*y*z + L_xxyyyyz*z + (1.0d0/2.0d0)*(L_xxxxyyyy*x**2 + &
      L_xxyyyyyy*y**2 + L_xxyyyyzz*z**2))
    Ls_xxyyyyz  = Ls_xxyyyyz + (L_xxxyyyyz*x + L_xxyyyyyz*y + L_xxyyyyz + L_xxyyyyzz*z)
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    Ls_xxyyy    = Ls_xxyyy + (L_xxxyyy*x + L_xxxyyyy*x*y + L_xxxyyyyz*x*y*z + L_xxxyyyz*x*z + L_xxyyy &
      + L_xxyyyy*y + L_xxyyyyz*y*z + L_xxyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxyyy*x**3 + L_xxyyyyyy*y**3 + L_xxyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxyyy*x**2 + L_xxxxyyyy*x**2*y + L_xxxxyyyz*x**2*z + &
      L_xxxyyyyy*x*y**2 + L_xxxyyyzz*x*z**2 + L_xxyyyyy*y**2 + &
      L_xxyyyyyz*y**2*z + L_xxyyyyzz*y*z**2 + L_xxyyyzz*z**2))
    Ls_xxyyyz   = Ls_xxyyyz + (L_xxxyyyyz*x*y + L_xxxyyyz*x + L_xxxyyyzz*x*z + L_xxyyyyz*y + L_xxyyyyzz &
      *y*z + L_xxyyyz + L_xxyyyzz*z + (1.0d0/2.0d0)*(L_xxxxyyyz*x**2 + &
      L_xxyyyyyz*y**2 + L_xxyyyzzz*z**2))
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    Ls_xxyy     = Ls_xxyy + (L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyyz*x*y*z + L_xxxyyz*x*z + L_xxyy + &
      L_xxyyy*y + L_xxyyyz*y*z + L_xxyyz*z + (1.0d0/24.0d0)*(L_xxxxxxyy &
      *x**4 + L_xxyyyyyy*y**4 + L_xxyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxyyyy*x**2*y**2 + L_xxxxyyzz*x**2*z**2 + L_xxyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxyy*x**3 + L_xxxxxyyy*x**3*y + &
      L_xxxxxyyz*x**3*z + L_xxxyyyyy*x*y**3 + L_xxxyyzzz*x*z**3 + &
      L_xxyyyyy*y**3 + L_xxyyyyyz*y**3*z + L_xxyyyzzz*y*z**3 + &
      L_xxyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyy*x**2 + L_xxxxyyy*x**2*y &
      + L_xxxxyyyz*x**2*y*z + L_xxxxyyz*x**2*z + L_xxxyyyy*x*y**2 + &
      L_xxxyyyyz*x*y**2*z + L_xxxyyyzz*x*y*z**2 + L_xxxyyzz*x*z**2 + &
      L_xxyyyy*y**2 + L_xxyyyyz*y**2*z + L_xxyyyzz*y*z**2 + L_xxyyzz*z &
      **2))
    Ls_xxyyz    = Ls_xxyyz + (L_xxxyyyz*x*y + L_xxxyyyzz*x*y*z + L_xxxyyz*x + L_xxxyyzz*x*z + L_xxyyyz &
      *y + L_xxyyyzz*y*z + L_xxyyz + L_xxyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxyyz*x**3 + L_xxyyyyyz*y**3 + L_xxyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxyyyz*x**2*y + L_xxxxyyz*x**2 + L_xxxxyyzz*x**2*z + &
      L_xxxyyyyz*x*y**2 + L_xxxyyzzz*x*z**2 + L_xxyyyyz*y**2 + &
      L_xxyyyyzz*y**2*z + L_xxyyyzzz*y*z**2 + L_xxyyzzz*z**2))
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    Ls_xxy      = Ls_xxy + (L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/120.0d0)*(L_xxxxxxxy*x**5 + &
      L_xxyyyyyy*y**5 + L_xxyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyyy*x &
      **3*y**2 + L_xxxxxyzz*x**3*z**2 + L_xxxxyyyy*x**2*y**3 + &
      L_xxxxyzzz*x**2*z**3 + L_xxyyyyzz*y**3*z**2 + L_xxyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxyyy*x**2*y**2 + L_xxxxyyyz*x**2*y**2*z &
      + L_xxxxyyzz*x**2*y*z**2 + L_xxxxyzz*x**2*z**2 + L_xxxyyyzz*x*y** &
      2*z**2 + L_xxyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxy*x**4 + &
      L_xxxxxxyy*x**4*y + L_xxxxxxyz*x**4*z + L_xxxyyyyy*x*y**4 + &
      L_xxxyzzzz*x*z**4 + L_xxyyyyy*y**4 + L_xxyyyyyz*y**4*z + &
      L_xxyyzzzz*y*z**4 + L_xxyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxxy*x** &
      3 + L_xxxxxyy*x**3*y + L_xxxxxyyz*x**3*y*z + L_xxxxxyz*x**3*z + &
      L_xxxyyyy*x*y**3 + L_xxxyyyyz*x*y**3*z + L_xxxyyzzz*x*y*z**3 + &
      L_xxxyzzz*x*z**3 + L_xxyyyy*y**3 + L_xxyyyyz*y**3*z + L_xxyyzzz*y &
      *z**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + L_xxxxyy*x &
      **2*y + L_xxxxyyz*x**2*y*z + L_xxxxyz*x**2*z + L_xxxyyy*x*y**2 + &
      L_xxxyyyz*x*y**2*z + L_xxxyyzz*x*y*z**2 + L_xxxyzz*x*z**2 + &
      L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz*z**2))
    Ls_xxyz     = Ls_xxyz + (L_xxxyyz*x*y + L_xxxyyzz*x*y*z + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + &
      L_xxyyzz*y*z + L_xxyz + L_xxyzz*z + (1.0d0/24.0d0)*(L_xxxxxxyz*x &
      **4 + L_xxyyyyyz*y**4 + L_xxyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxyyyz*x**2*y**2 + L_xxxxyzzz*x**2*z**2 + L_xxyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxyyz*x**3*y + L_xxxxxyz*x**3 + &
      L_xxxxxyzz*x**3*z + L_xxxyyyyz*x*y**3 + L_xxxyzzzz*x*z**3 + &
      L_xxyyyyz*y**3 + L_xxyyyyzz*y**3*z + L_xxyyzzzz*y*z**3 + &
      L_xxyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyyz*x**2*y + L_xxxxyyzz*x &
      **2*y*z + L_xxxxyz*x**2 + L_xxxxyzz*x**2*z + L_xxxyyyz*x*y**2 + &
      L_xxxyyyzz*x*y**2*z + L_xxxyyzzz*x*y*z**2 + L_xxxyzzz*x*z**2 + &
      L_xxyyyz*y**2 + L_xxyyyzz*y**2*z + L_xxyyzzz*y*z**2 + L_xxyzzz*z &
      **2))
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    Ls_xx       = Ls_xx + (L_xx + L_xxx*x + (1.0d0/8.0d0)*L_xxxxyyzz*x**2*y**2*z**2 + L_xxxy*x*y + &
      L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxx*x**6 + L_xxyyyyyy*y**6 + L_xxzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxxyyy*x**3*y**3 + L_xxxxxzzz*x**3*z** &
      3 + L_xxyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxxyy*x**4*y**2 &
      + L_xxxxxxzz*x**4*z**2 + L_xxxxyyyy*x**2*y**4 + L_xxxxzzzz*x**2*z &
      **4 + L_xxyyyyzz*y**4*z**2 + L_xxyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x**2*y* &
      z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + L_xxyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + L_xxxxxxxy*x**5*y + &
      L_xxxxxxxz*x**5*z + L_xxxyyyyy*x*y**5 + L_xxxzzzzz*x*z**5 + &
      L_xxyyyyy*y**5 + L_xxyyyyyz*y**5*z + L_xxyzzzzz*y*z**5 + &
      L_xxzzzzz*z**5) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*( &
      L_xxxxx*x**3 + L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x &
      **3*z + L_xxxyyy*x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 &
      + L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z &
      **3 + L_xxzzz*z**3) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxyz*x**4*y*z + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 &
      + L_xxxyyyyz*x*y**4*z + L_xxxyzzzz*x*y*z**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3*y**2 + L_xxxxxyyz*x**3*y**2 &
      *z + L_xxxxxyzz*x**3*y*z**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x** &
      2*y**3 + L_xxxxyyyz*x**2*y**3*z + L_xxxxyzzz*x**2*y*z**3 + &
      L_xxxxzzz*x**2*z**3 + L_xxxyyyzz*x*y**3*z**2 + L_xxxyyzzz*x*y**2* &
      z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3))
    Ls_xxz      = Ls_xxz + (L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/120.0d0)*(L_xxxxxxxz*x**5 &
      + L_xxyyyyyz*y**5 + L_xxzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyyz &
      *x**3*y**2 + L_xxxxxzzz*x**3*z**2 + L_xxxxyyyz*x**2*y**3 + &
      L_xxxxzzzz*x**2*z**3 + L_xxyyyzzz*y**3*z**2 + L_xxyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxyyz*x**2*y**2 + L_xxxxyyzz*x**2*y**2*z &
      + L_xxxxyzzz*x**2*y*z**2 + L_xxxxzzz*x**2*z**2 + L_xxxyyzzz*x*y** &
      2*z**2 + L_xxyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxyz*x**4*y &
      + L_xxxxxxz*x**4 + L_xxxxxxzz*x**4*z + L_xxxyyyyz*x*y**4 + &
      L_xxxzzzzz*x*z**4 + L_xxyyyyz*y**4 + L_xxyyyyzz*y**4*z + &
      L_xxyzzzzz*y*z**4 + L_xxzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxxyz*x &
      **3*y + L_xxxxxyzz*x**3*y*z + L_xxxxxz*x**3 + L_xxxxxzz*x**3*z + &
      L_xxxyyyz*x*y**3 + L_xxxyyyzz*x*y**3*z + L_xxxyzzzz*x*y*z**3 + &
      L_xxxzzzz*x*z**3 + L_xxyyyz*y**3 + L_xxyyyzz*y**3*z + L_xxyzzzz*y &
      *z**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2*y + &
      L_xxxxyzz*x**2*y*z + L_xxxxz*x**2 + L_xxxxzz*x**2*z + L_xxxyyz*x* &
      y**2 + L_xxxyyzz*x*y**2*z + L_xxxyzzz*x*y*z**2 + L_xxxzzz*x*z**2 &
      + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z**2 + L_xxzzz*z**2 &
      ))
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    Ls_xyyyyy   = Ls_xyyyyy + (L_xxyyyyy*x + L_xxyyyyyy*x*y + L_xxyyyyyz*x*z + L_xyyyyy + L_xyyyyyy*y + &
      L_xyyyyyyz*y*z + L_xyyyyyz*z + (1.0d0/2.0d0)*(L_xxxyyyyy*x**2 + &
      L_xyyyyyyy*y**2 + L_xyyyyyzz*z**2))
    Ls_xyyyyyz  = Ls_xyyyyyz + (L_xxyyyyyz*x + L_xyyyyyyz*y + L_xyyyyyz + L_xyyyyyzz*z)
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    Ls_xyyyy    = Ls_xyyyy + (L_xxyyyy*x + L_xxyyyyy*x*y + L_xxyyyyyz*x*y*z + L_xxyyyyz*x*z + L_xyyyy &
      + L_xyyyyy*y + L_xyyyyyz*y*z + L_xyyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxyyyy*x**3 + L_xyyyyyyy*y**3 + L_xyyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxyyyy*x**2 + L_xxxyyyyy*x**2*y + L_xxxyyyyz*x**2*z + &
      L_xxyyyyyy*x*y**2 + L_xxyyyyzz*x*z**2 + L_xyyyyyy*y**2 + &
      L_xyyyyyyz*y**2*z + L_xyyyyyzz*y*z**2 + L_xyyyyzz*z**2))
    Ls_xyyyyz   = Ls_xyyyyz + (L_xxyyyyyz*x*y + L_xxyyyyz*x + L_xxyyyyzz*x*z + L_xyyyyyz*y + L_xyyyyyzz &
      *y*z + L_xyyyyz + L_xyyyyzz*z + (1.0d0/2.0d0)*(L_xxxyyyyz*x**2 + &
      L_xyyyyyyz*y**2 + L_xyyyyzzz*z**2))
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    Ls_xyyy     = Ls_xyyy + (L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyyz*x*y*z + L_xxyyyz*x*z + L_xyyy + &
      L_xyyyy*y + L_xyyyyz*y*z + L_xyyyz*z + (1.0d0/24.0d0)*(L_xxxxxyyy &
      *x**4 + L_xyyyyyyy*y**4 + L_xyyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyyyyy*x**2*y**2 + L_xxxyyyzz*x**2*z**2 + L_xyyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxyyy*x**3 + L_xxxxyyyy*x**3*y + &
      L_xxxxyyyz*x**3*z + L_xxyyyyyy*x*y**3 + L_xxyyyzzz*x*z**3 + &
      L_xyyyyyy*y**3 + L_xyyyyyyz*y**3*z + L_xyyyyzzz*y*z**3 + &
      L_xyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyy*x**2 + L_xxxyyyy*x**2*y &
      + L_xxxyyyyz*x**2*y*z + L_xxxyyyz*x**2*z + L_xxyyyyy*x*y**2 + &
      L_xxyyyyyz*x*y**2*z + L_xxyyyyzz*x*y*z**2 + L_xxyyyzz*x*z**2 + &
      L_xyyyyy*y**2 + L_xyyyyyz*y**2*z + L_xyyyyzz*y*z**2 + L_xyyyzz*z &
      **2))
    Ls_xyyyz    = Ls_xyyyz + (L_xxyyyyz*x*y + L_xxyyyyzz*x*y*z + L_xxyyyz*x + L_xxyyyzz*x*z + L_xyyyyz &
      *y + L_xyyyyzz*y*z + L_xyyyz + L_xyyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxyyyz*x**3 + L_xyyyyyyz*y**3 + L_xyyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxyyyyz*x**2*y + L_xxxyyyz*x**2 + L_xxxyyyzz*x**2*z + &
      L_xxyyyyyz*x*y**2 + L_xxyyyzzz*x*z**2 + L_xyyyyyz*y**2 + &
      L_xyyyyyzz*y**2*z + L_xyyyyzzz*y*z**2 + L_xyyyzzz*z**2))
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    Ls_xyy      = Ls_xyy + (L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/120.0d0)*(L_xxxxxxyy*x**5 + &
      L_xyyyyyyy*y**5 + L_xyyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyyy*x &
      **3*y**2 + L_xxxxyyzz*x**3*z**2 + L_xxxyyyyy*x**2*y**3 + &
      L_xxxyyzzz*x**2*z**3 + L_xyyyyyzz*y**3*z**2 + L_xyyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxyyyy*x**2*y**2 + L_xxxyyyyz*x**2*y**2*z &
      + L_xxxyyyzz*x**2*y*z**2 + L_xxxyyzz*x**2*z**2 + L_xxyyyyzz*x*y** &
      2*z**2 + L_xyyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxyy*x**4 + &
      L_xxxxxyyy*x**4*y + L_xxxxxyyz*x**4*z + L_xxyyyyyy*x*y**4 + &
      L_xxyyzzzz*x*z**4 + L_xyyyyyy*y**4 + L_xyyyyyyz*y**4*z + &
      L_xyyyzzzz*y*z**4 + L_xyyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxyy*x** &
      3 + L_xxxxyyy*x**3*y + L_xxxxyyyz*x**3*y*z + L_xxxxyyz*x**3*z + &
      L_xxyyyyy*x*y**3 + L_xxyyyyyz*x*y**3*z + L_xxyyyzzz*x*y*z**3 + &
      L_xxyyzzz*x*z**3 + L_xyyyyy*y**3 + L_xyyyyyz*y**3*z + L_xyyyzzz*y &
      *z**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + L_xxxyyy*x &
      **2*y + L_xxxyyyz*x**2*y*z + L_xxxyyz*x**2*z + L_xxyyyy*x*y**2 + &
      L_xxyyyyz*x*y**2*z + L_xxyyyzz*x*y*z**2 + L_xxyyzz*x*z**2 + &
      L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz*z**2))
    Ls_xyyz     = Ls_xyyz + (L_xxyyyz*x*y + L_xxyyyzz*x*y*z + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + &
      L_xyyyzz*y*z + L_xyyz + L_xyyzz*z + (1.0d0/24.0d0)*(L_xxxxxyyz*x &
      **4 + L_xyyyyyyz*y**4 + L_xyyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyyyyz*x**2*y**2 + L_xxxyyzzz*x**2*z**2 + L_xyyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxyyyz*x**3*y + L_xxxxyyz*x**3 + &
      L_xxxxyyzz*x**3*z + L_xxyyyyyz*x*y**3 + L_xxyyzzzz*x*z**3 + &
      L_xyyyyyz*y**3 + L_xyyyyyzz*y**3*z + L_xyyyzzzz*y*z**3 + &
      L_xyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyyz*x**2*y + L_xxxyyyzz*x &
      **2*y*z + L_xxxyyz*x**2 + L_xxxyyzz*x**2*z + L_xxyyyyz*x*y**2 + &
      L_xxyyyyzz*x*y**2*z + L_xxyyyzzz*x*y*z**2 + L_xxyyzzz*x*z**2 + &
      L_xyyyyz*y**2 + L_xyyyyzz*y**2*z + L_xyyyzzz*y*z**2 + L_xyyzzz*z &
      **2))
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    Ls_xy       = Ls_xy + ((1.0d0/8.0d0)*L_xxxyyyzz*x**2*y**2*z**2 + L_xxy*x + L_xxyy*x*y + L_xxyyz &
      *x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxy*x**6 + L_xyyyyyyy*y**6 + L_xyzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxyyyy*x**3*y**3 + L_xxxxyzzz*x**3*z** &
      3 + L_xyyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyyy*x**4*y**2 &
      + L_xxxxxyzz*x**4*z**2 + L_xxxyyyyy*x**2*y**4 + L_xxxyzzzz*x**2*z &
      **4 + L_xyyyyyzz*y**4*z**2 + L_xyyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x**2*y* &
      z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + L_xyyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + L_xxxxxxyy*x**5*y + &
      L_xxxxxxyz*x**5*z + L_xxyyyyyy*x*y**5 + L_xxyzzzzz*x*z**5 + &
      L_xyyyyyy*y**5 + L_xyyyyyyz*y**5*z + L_xyyzzzzz*y*z**5 + &
      L_xyzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x**4* &
      y + L_xxxxxyyz*x**4*y*z + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + &
      L_xxyyyyyz*x*y**4*z + L_xxyyzzzz*x*y*z**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3*y**2 + L_xxxxyyyz*x**3*y**2 &
      *z + L_xxxxyyzz*x**3*y*z**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x** &
      2*y**3 + L_xxxyyyyz*x**2*y**3*z + L_xxxyyzzz*x**2*y*z**3 + &
      L_xxxyzzz*x**2*z**3 + L_xxyyyyzz*x*y**3*z**2 + L_xxyyyzzz*x*y**2* &
      z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3))
    Ls_xyz      = Ls_xyz + (L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/120.0d0)*(L_xxxxxxyz*x**5 &
      + L_xyyyyyyz*y**5 + L_xyzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyyz &
      *x**3*y**2 + L_xxxxyzzz*x**3*z**2 + L_xxxyyyyz*x**2*y**3 + &
      L_xxxyzzzz*x**2*z**3 + L_xyyyyzzz*y**3*z**2 + L_xyyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxyyyz*x**2*y**2 + L_xxxyyyzz*x**2*y**2*z &
      + L_xxxyyzzz*x**2*y*z**2 + L_xxxyzzz*x**2*z**2 + L_xxyyyzzz*x*y** &
      2*z**2 + L_xyyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxyyz*x**4*y &
      + L_xxxxxyz*x**4 + L_xxxxxyzz*x**4*z + L_xxyyyyyz*x*y**4 + &
      L_xxyzzzzz*x*z**4 + L_xyyyyyz*y**4 + L_xyyyyyzz*y**4*z + &
      L_xyyzzzzz*y*z**4 + L_xyzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxyyz*x &
      **3*y + L_xxxxyyzz*x**3*y*z + L_xxxxyz*x**3 + L_xxxxyzz*x**3*z + &
      L_xxyyyyz*x*y**3 + L_xxyyyyzz*x*y**3*z + L_xxyyzzzz*x*y*z**3 + &
      L_xxyzzzz*x*z**3 + L_xyyyyz*y**3 + L_xyyyyzz*y**3*z + L_xyyzzzz*y &
      *z**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2*y + &
      L_xxxyyzz*x**2*y*z + L_xxxyz*x**2 + L_xxxyzz*x**2*z + L_xxyyyz*x* &
      y**2 + L_xxyyyzz*x*y**2*z + L_xxyyzzz*x*y*z**2 + L_xxyzzz*x*z**2 &
      + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z**2 + L_xyzzz*z**2 &
      ))
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    Ls_x        = Ls_x + (L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxx*x**7 + L_xyyyyyyy*y**7 + L_xzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxxyy*x**5*y**2 + L_xxxxxxzz*x**5*z**2 + &
      L_xxxyyyyy*x**2*y**5 + L_xxxzzzzz*x**2*z**5 + L_xyyyyyzz*y**5*z** &
      2 + L_xyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxxyyy*x**4*y**3 &
      + L_xxxxxzzz*x**4*z**3 + L_xxxxyyyy*x**3*y**4 + L_xxxxzzzz*x**3*z &
      **4 + L_xyyyyzzz*y**4*z**3 + L_xyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxyyyz*x**3*y**3*z + &
      L_xxxxyzzz*x**3*y*z**3 + L_xxxxzzz*x**3*z**3 + L_xxyyyzzz*x*y**3* &
      z**3 + L_xyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxx*x**6 + L_xxxxxxxy*x**6*y + L_xxxxxxxz*x**6*z + &
      L_xxyyyyyy*x*y**6 + L_xxzzzzzz*x*z**6 + L_xyyyyyy*y**6 + &
      L_xyyyyyyz*y**6*z + L_xyzzzzzz*y*z**6 + L_xzzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/120.0d0)* &
      (L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxyz*x**5*y*z + &
      L_xxxxxxz*x**5*z + L_xxyyyyy*x*y**5 + L_xxyyyyyz*x*y**5*z + &
      L_xxyzzzzz*x*y*z**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxxyy*x**4*y**2 + L_xxxxxyyz*x**4*y**2*z + &
      L_xxxxxyzz*x**4*y*z**2 + L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y** &
      4 + L_xxxyyyyz*x**2*y**4*z + L_xxxyzzzz*x**2*y*z**4 + L_xxxzzzz*x &
      **2*z**4 + L_xxyyyyzz*x*y**4*z**2 + L_xxyyzzzz*x*y**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
      L_xxxxyy*x**3*y**2 + L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z** &
      2 + L_xxxxzz*x**3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3 &
      *z + L_xxxyzzz*x**2*y*z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y** &
      3*z**2 + L_xxyyzzz*x*y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y &
      **2*z**3) + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xxxxxy*x**4*y + &
      L_xxxxxyz*x**4*y*z + L_xxxxxz*x**4*z + L_xxxxyyzz*x**3*y**2*z**2 &
      + L_xxxyyyzz*x**2*y**3*z**2 + L_xxxyyzzz*x**2*y**2*z**3 + &
      L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 + &
      L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z** &
      4 + L_xzzzz*z**4))
    Ls_xz       = Ls_xz + ((1.0d0/8.0d0)*L_xxxyyzzz*x**2*y**2*z**2 + L_xxyz*x*y + L_xxyzz*x*y*z + &
      L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxz*x**6 + L_xyyyyyyz*y**6 + L_xzzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxyyyz*x**3*y**3 + L_xxxxzzzz*x**3*z** &
      3 + L_xyyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyyz*x**4*y**2 &
      + L_xxxxxzzz*x**4*z**2 + L_xxxyyyyz*x**2*y**4 + L_xxxzzzzz*x**2*z &
      **4 + L_xyyyyzzz*y**4*z**2 + L_xyyzzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y* &
      z**2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxyz*x**5*y + L_xxxxxxz*x**5 + &
      L_xxxxxxzz*x**5*z + L_xxyyyyyz*x*y**5 + L_xxzzzzzz*x*z**5 + &
      L_xyyyyyz*y**5 + L_xyyyyyzz*y**5*z + L_xyzzzzzz*y*z**5 + &
      L_xzzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxyzz*x &
      **4*y*z + L_xxxxxz*x**4 + L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + &
      L_xxyyyyzz*x*y**4*z + L_xxyzzzzz*x*y*z**4 + L_xxzzzzz*x*z**4 + &
      L_xyyyyz*y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + L_xxxxyyzz*x**3*y**2 &
      *z + L_xxxxyzzz*x**3*y*z**2 + L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x** &
      2*y**3 + L_xxxyyyzz*x**2*y**3*z + L_xxxyzzzz*x**2*y*z**3 + &
      L_xxxzzzz*x**2*z**3 + L_xxyyyzzz*x*y**3*z**2 + L_xxyyzzzz*x*y**2* &
      z**3 + L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/6.0d0) &
      *(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 + L_xxxxzz* &
      x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + L_xxyzzzz*x*y*z** &
      3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y &
      *z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz* &
      x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + &
      L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y &
      **2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2))
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    Ls_yyyyyy   = Ls_yyyyyy + (L_xyyyyyy*x + L_xyyyyyyy*x*y + L_xyyyyyyz*x*z + L_yyyyyy + L_yyyyyyy*y + &
      L_yyyyyyyz*y*z + L_yyyyyyz*z + (1.0d0/2.0d0)*(L_xxyyyyyy*x**2 + &
      L_yyyyyyyy*y**2 + L_yyyyyyzz*z**2))
    Ls_yyyyyyz  = Ls_yyyyyyz + (L_xyyyyyyz*x + L_yyyyyyyz*y + L_yyyyyyz + L_yyyyyyzz*z)
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    Ls_yyyyy    = Ls_yyyyy + (L_xyyyyy*x + L_xyyyyyy*x*y + L_xyyyyyyz*x*y*z + L_xyyyyyz*x*z + L_yyyyy &
      + L_yyyyyy*y + L_yyyyyyz*y*z + L_yyyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxyyyyy*x**3 + L_yyyyyyyy*y**3 + L_yyyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyyyyy*x**2 + L_xxyyyyyy*x**2*y + L_xxyyyyyz*x**2*z + &
      L_xyyyyyyy*x*y**2 + L_xyyyyyzz*x*z**2 + L_yyyyyyy*y**2 + &
      L_yyyyyyyz*y**2*z + L_yyyyyyzz*y*z**2 + L_yyyyyzz*z**2))
    Ls_yyyyyz   = Ls_yyyyyz + (L_xyyyyyyz*x*y + L_xyyyyyz*x + L_xyyyyyzz*x*z + L_yyyyyyz*y + L_yyyyyyzz &
      *y*z + L_yyyyyz + L_yyyyyzz*z + (1.0d0/2.0d0)*(L_xxyyyyyz*x**2 + &
      L_yyyyyyyz*y**2 + L_yyyyyzzz*z**2))
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    Ls_yyyy     = Ls_yyyy + (L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyyz*x*y*z + L_xyyyyz*x*z + L_yyyy + &
      L_yyyyy*y + L_yyyyyz*y*z + L_yyyyz*z + (1.0d0/24.0d0)*(L_xxxxyyyy &
      *x**4 + L_yyyyyyyy*y**4 + L_yyyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyyyyy*x**2*y**2 + L_xxyyyyzz*x**2*z**2 + L_yyyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxyyyy*x**3 + L_xxxyyyyy*x**3*y + &
      L_xxxyyyyz*x**3*z + L_xyyyyyyy*x*y**3 + L_xyyyyzzz*x*z**3 + &
      L_yyyyyyy*y**3 + L_yyyyyyyz*y**3*z + L_yyyyyzzz*y*z**3 + &
      L_yyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyy*x**2 + L_xxyyyyy*x**2*y &
      + L_xxyyyyyz*x**2*y*z + L_xxyyyyz*x**2*z + L_xyyyyyy*x*y**2 + &
      L_xyyyyyyz*x*y**2*z + L_xyyyyyzz*x*y*z**2 + L_xyyyyzz*x*z**2 + &
      L_yyyyyy*y**2 + L_yyyyyyz*y**2*z + L_yyyyyzz*y*z**2 + L_yyyyzz*z &
      **2))
    Ls_yyyyz    = Ls_yyyyz + (L_xyyyyyz*x*y + L_xyyyyyzz*x*y*z + L_xyyyyz*x + L_xyyyyzz*x*z + L_yyyyyz &
      *y + L_yyyyyzz*y*z + L_yyyyz + L_yyyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxyyyyz*x**3 + L_yyyyyyyz*y**3 + L_yyyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyyyyyz*x**2*y + L_xxyyyyz*x**2 + L_xxyyyyzz*x**2*z + &
      L_xyyyyyyz*x*y**2 + L_xyyyyzzz*x*z**2 + L_yyyyyyz*y**2 + &
      L_yyyyyyzz*y**2*z + L_yyyyyzzz*y*z**2 + L_yyyyzzz*z**2))
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    Ls_yyy      = Ls_yyy + (L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/120.0d0)*(L_xxxxxyyy*x**5 + &
      L_yyyyyyyy*y**5 + L_yyyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyyy*x &
      **3*y**2 + L_xxxyyyzz*x**3*z**2 + L_xxyyyyyy*x**2*y**3 + &
      L_xxyyyzzz*x**2*z**3 + L_yyyyyyzz*y**3*z**2 + L_yyyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxyyyyy*x**2*y**2 + L_xxyyyyyz*x**2*y**2*z &
      + L_xxyyyyzz*x**2*y*z**2 + L_xxyyyzz*x**2*z**2 + L_xyyyyyzz*x*y** &
      2*z**2 + L_yyyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyyy*x**4 + &
      L_xxxxyyyy*x**4*y + L_xxxxyyyz*x**4*z + L_xyyyyyyy*x*y**4 + &
      L_xyyyzzzz*x*z**4 + L_yyyyyyy*y**4 + L_yyyyyyyz*y**4*z + &
      L_yyyyzzzz*y*z**4 + L_yyyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyyy*x** &
      3 + L_xxxyyyy*x**3*y + L_xxxyyyyz*x**3*y*z + L_xxxyyyz*x**3*z + &
      L_xyyyyyy*x*y**3 + L_xyyyyyyz*x*y**3*z + L_xyyyyzzz*x*y*z**3 + &
      L_xyyyzzz*x*z**3 + L_yyyyyy*y**3 + L_yyyyyyz*y**3*z + L_yyyyzzz*y &
      *z**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + L_xxyyyy*x &
      **2*y + L_xxyyyyz*x**2*y*z + L_xxyyyz*x**2*z + L_xyyyyy*x*y**2 + &
      L_xyyyyyz*x*y**2*z + L_xyyyyzz*x*y*z**2 + L_xyyyzz*x*z**2 + &
      L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz*z**2))
    Ls_yyyz     = Ls_yyyz + (L_xyyyyz*x*y + L_xyyyyzz*x*y*z + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + &
      L_yyyyzz*y*z + L_yyyz + L_yyyzz*z + (1.0d0/24.0d0)*(L_xxxxyyyz*x &
      **4 + L_yyyyyyyz*y**4 + L_yyyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyyyyz*x**2*y**2 + L_xxyyyzzz*x**2*z**2 + L_yyyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxyyyyz*x**3*y + L_xxxyyyz*x**3 + &
      L_xxxyyyzz*x**3*z + L_xyyyyyyz*x*y**3 + L_xyyyzzzz*x*z**3 + &
      L_yyyyyyz*y**3 + L_yyyyyyzz*y**3*z + L_yyyyzzzz*y*z**3 + &
      L_yyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyyz*x**2*y + L_xxyyyyzz*x &
      **2*y*z + L_xxyyyz*x**2 + L_xxyyyzz*x**2*z + L_xyyyyyz*x*y**2 + &
      L_xyyyyyzz*x*y**2*z + L_xyyyyzzz*x*y*z**2 + L_xyyyzzz*x*z**2 + &
      L_yyyyyz*y**2 + L_yyyyyzz*y**2*z + L_yyyyzzz*y*z**2 + L_yyyzzz*z &
      **2))
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    Ls_yy       = Ls_yy + ((1.0d0/8.0d0)*L_xxyyyyzz*x**2*y**2*z**2 + L_xyy*x + L_xyyy*x*y + L_xyyyz &
      *x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxyy*x**6 + L_yyyyyyyy*y**6 + L_yyzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxyyyyy*x**3*y**3 + L_xxxyyzzz*x**3*z** &
      3 + L_yyyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyyy*x**4*y**2 &
      + L_xxxxyyzz*x**4*z**2 + L_xxyyyyyy*x**2*y**4 + L_xxyyzzzz*x**2*z &
      **4 + L_yyyyyyzz*y**4*z**2 + L_yyyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x**2*y* &
      z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + L_yyyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + L_xxxxxyyy*x**5*y + &
      L_xxxxxyyz*x**5*z + L_xyyyyyyy*x*y**5 + L_xyyzzzzz*x*z**5 + &
      L_yyyyyyy*y**5 + L_yyyyyyyz*y**5*z + L_yyyzzzzz*y*z**5 + &
      L_yyzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x**4* &
      y + L_xxxxyyyz*x**4*y*z + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + &
      L_xyyyyyyz*x*y**4*z + L_xyyyzzzz*x*y*z**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3*y**2 + L_xxxyyyyz*x**3*y**2 &
      *z + L_xxxyyyzz*x**3*y*z**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x** &
      2*y**3 + L_xxyyyyyz*x**2*y**3*z + L_xxyyyzzz*x**2*y*z**3 + &
      L_xxyyzzz*x**2*z**3 + L_xyyyyyzz*x*y**3*z**2 + L_xyyyyzzz*x*y**2* &
      z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3))
    Ls_yyz      = Ls_yyz + (L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/120.0d0)*(L_xxxxxyyz*x**5 &
      + L_yyyyyyyz*y**5 + L_yyzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyyz &
      *x**3*y**2 + L_xxxyyzzz*x**3*z**2 + L_xxyyyyyz*x**2*y**3 + &
      L_xxyyzzzz*x**2*z**3 + L_yyyyyzzz*y**3*z**2 + L_yyyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxyyyyz*x**2*y**2 + L_xxyyyyzz*x**2*y**2*z &
      + L_xxyyyzzz*x**2*y*z**2 + L_xxyyzzz*x**2*z**2 + L_xyyyyzzz*x*y** &
      2*z**2 + L_yyyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyyyz*x**4*y &
      + L_xxxxyyz*x**4 + L_xxxxyyzz*x**4*z + L_xyyyyyyz*x*y**4 + &
      L_xyyzzzzz*x*z**4 + L_yyyyyyz*y**4 + L_yyyyyyzz*y**4*z + &
      L_yyyzzzzz*y*z**4 + L_yyzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyyyz*x &
      **3*y + L_xxxyyyzz*x**3*y*z + L_xxxyyz*x**3 + L_xxxyyzz*x**3*z + &
      L_xyyyyyz*x*y**3 + L_xyyyyyzz*x*y**3*z + L_xyyyzzzz*x*y*z**3 + &
      L_xyyzzzz*x*z**3 + L_yyyyyz*y**3 + L_yyyyyzz*y**3*z + L_yyyzzzz*y &
      *z**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2*y + &
      L_xxyyyzz*x**2*y*z + L_xxyyz*x**2 + L_xxyyzz*x**2*z + L_xyyyyz*x* &
      y**2 + L_xyyyyzz*x*y**2*z + L_xyyyzzz*x*y*z**2 + L_xyyzzz*x*z**2 &
      + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z**2 + L_yyzzz*z**2 &
      ))
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    Ls_y        = Ls_y + ((1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxy*x**7 + L_yyyyyyyy*y**7 + L_yzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyy*x**5*y**2 + L_xxxxxyzz*x**5*z**2 + &
      L_xxyyyyyy*x**2*y**5 + L_xxyzzzzz*x**2*z**5 + L_yyyyyyzz*y**5*z** &
      2 + L_yyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyy*x**4*y**3 &
      + L_xxxxyzzz*x**4*z**3 + L_xxxyyyyy*x**3*y**4 + L_xxxyzzzz*x**3*z &
      **4 + L_yyyyyzzz*y**4*z**3 + L_yyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyyyyz*x**3*y**3*z + &
      L_xxxyyzzz*x**3*y*z**3 + L_xxxyzzz*x**3*z**3 + L_xyyyyzzz*x*y**3* &
      z**3 + L_yyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxy*x**6 + L_xxxxxxyy*x**6*y + L_xxxxxxyz*x**6*z + &
      L_xyyyyyyy*x*y**6 + L_xyzzzzzz*x*z**6 + L_yyyyyyy*y**6 + &
      L_yyyyyyyz*y**6*z + L_yyzzzzzz*y*z**6 + L_yzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyyz*x**5*y*z &
      + L_xxxxxyz*x**5*z + L_xyyyyyy*x*y**5 + L_xyyyyyyz*x*y**5*z + &
      L_xyyzzzzz*x*y*z**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + &
      L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x* &
      y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz* &
      y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y &
      + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y &
      **2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y &
      **2*z + L_yyzz*y*z**2 + L_yzz*z**2) + (1.0d0/48.0d0)*(L_xxxxyyy*x &
      **4*y**2 + L_xxxxyyyz*x**4*y**2*z + L_xxxxyyzz*x**4*y*z**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyyyyyz*x**2*y**4* &
      z + L_xxyyzzzz*x**2*y*z**4 + L_xxyzzzz*x**2*z**4 + L_xyyyyyzz*x*y &
      **4*z**2 + L_xyyyzzzz*x*y**2*z**4 + L_yyyyyzz*y**4*z**2 + &
      L_yyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xxxyyyzz*x**3*y**2*z**2 + L_xxyyyyzz*x**2*y** &
      3*z**2 + L_xxyyyzzz*x**2*y**2*z**3 + L_xyyyyy*x*y**4 + L_xyyyyyz* &
      x*y**4*z + L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + &
      L_yyyyyz*y**4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4))
    Ls_yz       = Ls_yz + ((1.0d0/8.0d0)*L_xxyyyzzz*x**2*y**2*z**2 + L_xyyz*x*y + L_xyyzz*x*y*z + &
      L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxyz*x**6 + L_yyyyyyyz*y**6 + L_yzzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxyyyyz*x**3*y**3 + L_xxxyzzzz*x**3*z** &
      3 + L_yyyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyyz*x**4*y**2 &
      + L_xxxxyzzz*x**4*z**2 + L_xxyyyyyz*x**2*y**4 + L_xxyzzzzz*x**2*z &
      **4 + L_yyyyyzzz*y**4*z**2 + L_yyyzzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y* &
      z**2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxyyz*x**5*y + L_xxxxxyz*x**5 + &
      L_xxxxxyzz*x**5*z + L_xyyyyyyz*x*y**5 + L_xyzzzzzz*x*z**5 + &
      L_yyyyyyz*y**5 + L_yyyyyyzz*y**5*z + L_yyzzzzzz*y*z**5 + &
      L_yzzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyyzz*x &
      **4*y*z + L_xxxxyz*x**4 + L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + &
      L_xyyyyyzz*x*y**4*z + L_xyyzzzzz*x*y*z**4 + L_xyzzzzz*x*z**4 + &
      L_yyyyyz*y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + L_xxxyyyzz*x**3*y**2 &
      *z + L_xxxyyzzz*x**3*y*z**2 + L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x** &
      2*y**3 + L_xxyyyyzz*x**2*y**3*z + L_xxyyzzzz*x**2*y*z**3 + &
      L_xxyzzzz*x**2*z**3 + L_xyyyyzzz*x*y**3*z**2 + L_xyyyzzzz*x*y**2* &
      z**3 + L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/6.0d0) &
      *(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 + L_xxxyzz* &
      x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + L_xyyzzzz*x*y*z** &
      3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y &
      *z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz* &
      x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + &
      L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y &
      **2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2))
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    Ls_z        = Ls_z + ((1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxz*x**7 + L_yyyyyyyz*y**7 + L_zzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyz*x**5*y**2 + L_xxxxxzzz*x**5*z**2 + &
      L_xxyyyyyz*x**2*y**5 + L_xxzzzzzz*x**2*z**5 + L_yyyyyzzz*y**5*z** &
      2 + L_yyzzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyz*x**4*y**3 &
      + L_xxxxzzzz*x**4*z**3 + L_xxxyyyyz*x**3*y**4 + L_xxxzzzzz*x**3*z &
      **4 + L_yyyyzzzz*y**4*z**3 + L_yyyzzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxyyyzz*x**3*y**3*z + &
      L_xxxyzzzz*x**3*y*z**3 + L_xxxzzzz*x**3*z**3 + L_xyyyzzzz*x*y**3* &
      z**3 + L_yyyzzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxyz*x**6*y + L_xxxxxxz*x**6 + L_xxxxxxzz*x**6*z + &
      L_xyyyyyyz*x*y**6 + L_xzzzzzzz*x*z**6 + L_yyyyyyz*y**6 + &
      L_yyyyyyzz*y**6*z + L_yzzzzzzz*y*z**6 + L_zzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxyzz*x**5*y*z + L_xxxxxz*x**5 &
      + L_xxxxxzz*x**5*z + L_xyyyyyz*x*y**5 + L_xyyyyyzz*x*y**5*z + &
      L_xyzzzzzz*x*y*z**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxyyz*x**4*y**2 + L_xxxxyyzz*x**4*y**2*z + &
      L_xxxxyzzz*x**4*y*z**2 + L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y** &
      4 + L_xxyyyyzz*x**2*y**4*z + L_xxyzzzzz*x**2*y*z**4 + L_xxzzzzz*x &
      **2*z**4 + L_xyyyyzzz*x*y**4*z**2 + L_xyyzzzzz*x*y**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
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
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + L_xxxxzz*x &
      **4*z + L_xxxyyzzz*x**3*y**2*z**2 + L_xxyyyzzz*x**2*y**3*z**2 + &
      L_xxyyzzzz*x**2*y**2*z**3 + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z &
      + L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz* &
      y**4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4))
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
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
#undef  L_yyyyy             
#undef  Ls_yyyyy            
#undef  L_yyyyz             
#undef  Ls_yyyyz            
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
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
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
#undef  Ls_xyyyyyyz         
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L_add
    
! OPS  1723*ADD + 204*DIV + 2737*MUL + 144*NEG + 674*POW + 138*SUB = 5620  (7071 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, D_x, D_y,&
                D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
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
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy,&
                D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy,&
                D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz,&
                D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz,&
                D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy,&
                D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz,&
                D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz,&
                D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx,&
                D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz,&
                D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy,&
                D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy,&
                D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz,&
                D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz,&
                D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz,&
                D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz,&
                D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz,&
                D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz,&
                M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz,&
                M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz,&
                M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz,&
                M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz,&
                M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz,&
                M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz,&
                M_zzzzzzz
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
#define L_yy                 L(1:2,6)
#define M_xxx                M(1:2,6)
#define L_yz                 L(1:2,7)
#define M_xxy                M(1:2,7)
#define L_xxx                L(1:2,8)
#define M_xxz                M(1:2,8)
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
#define L_xxxxyy             L(1:2,38)
#define M_xxxyyy             M(1:2,38)
#define L_xxxxyz             L(1:2,39)
#define M_xxxyyz             M(1:2,39)
#define L_xxxyyy             L(1:2,40)
#define M_xxyyyy             M(1:2,40)
#define M_xxyyyz             M(1:2,41)
#define L_xxxyyz             L(1:2,41)
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
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    h          = x**2 + y**2 + z**2
    u2         = 1.0/h
    u          = sqrt(u2)
    D_x        = -u**3*x
    D_y        = -u**3*y
    D_z        = -u**3*z
    D_xx       = -h*u**5 + 3*u**5*x**2
    D_xy       = 3*u**5*x*y
    D_xz       = 3*u**5*x*z
    D_yy       = -h*u**5 + 3*u**5*y**2
    D_yz       = 3*u**5*y*z
    D_zz       = -(D_xx + D_yy)
    D_xxx      = 9*h*u**7*x - 15*u**7*x**3
    D_xxy      = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz      = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy      = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz      = -15*u**7*x*y*z
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = 9*h*u**7*y - 15*u**7*y**3
    D_yyz      = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    D_xxxx     = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy     = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz     = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy     = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz     = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz     = -(D_xxxx + D_xxyy)
    D_xyyy     = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz     = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz     = -(D_xxxy + D_xyyy)
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz     = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    D_xxxxx    = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    D_xxxxy    = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    D_xxxxz    = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    D_xxxyy    = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    D_xxxyz    = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    D_xxyyy    = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    D_xxyyz    = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    D_xyyyy    = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    D_xyyyz    = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    D_yyyyy    = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    D_yyyyz    = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    D_xxxxxx   = -225*h**3*u**13 + 4725*h**2*u**13*x**2 - 14175*h*u**13*x**4 + 10395*u** &
      13*x**6
    D_xxxxxy   = 1575*h**2*u**13*x*y - 9450*h*u**13*x**3*y + 10395*u**13*x**5*y
    D_xxxxxz   = 1575*h**2*u**13*x*z - 9450*h*u**13*x**3*z + 10395*u**13*x**5*z
    D_xxxxyy   = -45*h**3*u**13 + 630*h**2*u**13*x**2 + 315*h**2*u**13*y**2 - 945*h*u**13 &
      *x**4 - 5670*h*u**13*x**2*y**2 + 10395*u**13*x**4*y**2
    D_xxxxyz   = 315*h**2*u**13*y*z - 5670*h*u**13*x**2*y*z + 10395*u**13*x**4*y*z
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy   = 945*h**2*u**13*x*y + 10395*u**13*x**3*y**3 - 2835*(h*u**13*x**3*y + h*u &
      **13*x*y**3)
    D_xxxyyz   = 315*h**2*u**13*x*z - 945*h*u**13*x**3*z - 2835*h*u**13*x*y**2*z + 10395* &
      u**13*x**3*y**2*z
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy   = -45*h**3*u**13 + 315*h**2*u**13*x**2 + 630*h**2*u**13*y**2 - 5670*h*u** &
      13*x**2*y**2 - 945*h*u**13*y**4 + 10395*u**13*x**2*y**4
    D_xxyyyz   = 315*h**2*u**13*y*z - 2835*h*u**13*x**2*y*z - 945*h*u**13*y**3*z + 10395* &
      u**13*x**2*y**3*z
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy   = 1575*h**2*u**13*x*y - 9450*h*u**13*x*y**3 + 10395*u**13*x*y**5
    D_xyyyyz   = 315*h**2*u**13*x*z - 5670*h*u**13*x*y**2*z + 10395*u**13*x*y**4*z
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy   = -225*h**3*u**13 + 4725*h**2*u**13*y**2 - 14175*h*u**13*y**4 + 10395*u** &
      13*y**6
    D_yyyyyz   = 1575*h**2*u**13*y*z - 9450*h*u**13*y**3*z + 10395*u**13*y**5*z
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    D_xxxxxxx  = 11025*h**3*u**15*x - 99225*h**2*u**15*x**3 + 218295*h*u**15*x**5 - &
      135135*u**15*x**7
    L_xxxxxxx  = D_xxxxxxx*M_0
    D_xxxxxxy  = 1575*h**3*u**15*y - 42525*h**2*u**15*x**2*y + 155925*h*u**15*x**4*y - &
      135135*u**15*x**6*y
    L_xxxxxxy  = D_xxxxxxy*M_0
    D_xxxxxxz  = 1575*h**3*u**15*z - 42525*h**2*u**15*x**2*z + 155925*h*u**15*x**4*z - &
      135135*u**15*x**6*z
    L_xxxxxxz  = D_xxxxxxz*M_0
    D_xxxxxyy  = 1575*h**3*u**15*x - 9450*h**2*u**15*x**3 - 14175*h**2*u**15*x*y**2 + &
      10395*h*u**15*x**5 + 103950*h*u**15*x**3*y**2 - 135135*u**15*x**5 &
      *y**2
    L_xxxxxyy  = D_xxxxxyy*M_0
    D_xxxxxyz  = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x**3*y*z - 135135*u**15*x**5*y* &
      z
    L_xxxxxyz  = D_xxxxxyz*M_0
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy  = 945*h**3*u**15*y - 17010*h**2*u**15*x**2*y - 2835*h**2*u**15*y**3 + &
      31185*h*u**15*x**4*y + 62370*h*u**15*x**2*y**3 - 135135*u**15*x** &
      4*y**3
    L_xxxxyyy  = D_xxxxyyy*M_0
    D_xxxxyyz  = 315*h**3*u**15*z - 5670*h**2*u**15*x**2*z - 2835*h**2*u**15*y**2*z + &
      10395*h*u**15*x**4*z + 62370*h*u**15*x**2*y**2*z - 135135*u**15*x &
      **4*y**2*z
    L_xxxxyyz  = D_xxxxyyz*M_0
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy  = 945*h**3*u**15*x - 2835*h**2*u**15*x**3 - 17010*h**2*u**15*x*y**2 + &
      62370*h*u**15*x**3*y**2 + 31185*h*u**15*x*y**4 - 135135*u**15*x** &
      3*y**4
    L_xxxyyyy  = D_xxxyyyy*M_0
    D_xxxyyyz  = -8505*h**2*u**15*x*y*z - 135135*u**15*x**3*y**3*z + 31185*(h*u**15*x**3* &
      y*z + h*u**15*x*y**3*z)
    L_xxxyyyz  = D_xxxyyyz*M_0
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy  = 1575*h**3*u**15*y - 14175*h**2*u**15*x**2*y - 9450*h**2*u**15*y**3 + &
      103950*h*u**15*x**2*y**3 + 10395*h*u**15*y**5 - 135135*u**15*x**2 &
      *y**5
    L_xxyyyyy  = D_xxyyyyy*M_0
    D_xxyyyyz  = 315*h**3*u**15*z - 2835*h**2*u**15*x**2*z - 5670*h**2*u**15*y**2*z + &
      62370*h*u**15*x**2*y**2*z + 10395*h*u**15*y**4*z - 135135*u**15*x &
      **2*y**4*z
    L_xxyyyyz  = D_xxyyyyz*M_0
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy  = 1575*h**3*u**15*x - 42525*h**2*u**15*x*y**2 + 155925*h*u**15*x*y**4 - &
      135135*u**15*x*y**6
    L_xyyyyyy  = D_xyyyyyy*M_0
    D_xyyyyyz  = -14175*h**2*u**15*x*y*z + 103950*h*u**15*x*y**3*z - 135135*u**15*x*y**5* &
      z
    L_xyyyyyz  = D_xyyyyyz*M_0
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = 11025*h**3*u**15*y - 99225*h**2*u**15*y**3 + 218295*h*u**15*y**5 - &
      135135*u**15*y**7
    L_yyyyyyy  = D_yyyyyyy*M_0
    D_yyyyyyz  = 1575*h**3*u**15*z - 42525*h**2*u**15*y**2*z + 155925*h*u**15*y**4*z - &
      135135*u**15*y**6*z
    L_yyyyyyz  = D_yyyyyyz*M_0
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    D_xxxxxxxx = 11025*h**4*u**17 - 396900*h**3*u**17*x**2 + 2182950*h**2*u**17*x**4 - &
      3783780*h*u**17*x**6 + 2027025*u**17*x**8
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = -99225*h**3*u**17*x*y + 1091475*h**2*u**17*x**3*y - 2837835*h*u**17*x**5 &
      *y + 2027025*u**17*x**7*y
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = -99225*h**3*u**17*x*z + 1091475*h**2*u**17*x**3*z - 2837835*h*u**17*x**5 &
      *z + 2027025*u**17*x**7*z
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = 1575*h**4*u**17 - 42525*h**3*u**17*x**2 - 14175*h**3*u**17*y**2 + 155925 &
      *h**2*u**17*x**4 + 467775*h**2*u**17*x**2*y**2 - 135135*h*u**17*x &
      **6 + 2027025*(-h*u**17*x**4*y**2 + u**17*x**6*y**2)
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = -14175*h**3*u**17*y*z + 467775*h**2*u**17*x**2*y*z + 2027025*(-h*u**17*x &
      **4*y*z + u**17*x**6*y*z)
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxxy*M_xy + D_xxxxxxxz*M_xz + D_xxxxxxyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxxx*M_xx + D_xxxxxxyy*M_yy + D_xxxxxxzz*M_zz &
      )
    D_xxxxxyyy = -42525*h**3*u**17*x*y + 311850*h**2*u**17*x**3*y + 155925*h**2*u**17*x*y &
      **3 - 405405*h*u**17*x**5*y - 1351350*h*u**17*x**3*y**3 + 2027025 &
      *u**17*x**5*y**3
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = -14175*h**3*u**17*x*z + 103950*h**2*u**17*x**3*z + 155925*h**2*u**17*x*y &
      **2*z - 135135*h*u**17*x**5*z - 1351350*h*u**17*x**3*y**2*z + &
      2027025*u**17*x**5*y**2*z
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    L_xxxxxy   = D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + D_xxxxxy*M_0 + D_xxxxxyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxxy*M_xx + D_xxxxxyyy*M_yy + D_xxxxxyzz*M_zz &
      )
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz*M_xz + &
      D_xxxxxyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxxx*M_xxx + D_xxxxxyyy* &
      M_yyy + D_xxxxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxx*M_xx + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxz*M_xxz + D_xxxxxxyy*M_xyy + &
      D_xxxxxxzz*M_xzz + D_xxxxxyy*M_yy + D_xxxxxyyz*M_yyz + D_xxxxxyzz &
      *M_yzz + D_xxxxxzz*M_zz)
    L_xxxxxz   = D_xxxxxxyz*M_xy + D_xxxxxxzz*M_xz + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxxxz*M_xx + D_xxxxxyyz*M_yy + D_xxxxxzzz*M_zz &
      )
    D_xxxxyyyy = 945*h**4*u**17 + 374220*h**2*u**17*x**2*y**2 + 2027025*u**17*x**4*y**4 + &
      31185*(h**2*u**17*x**4 + h**2*u**17*y**4) - 17010*(h**3*u**17*x** &
      2 + h**3*u**17*y**2) - 810810*(h*u**17*x**4*y**2 + h*u**17*x**2*y &
      **4)
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = -8505*h**3*u**17*y*z + 187110*h**2*u**17*x**2*y*z + 31185*h**2*u**17*y** &
      3*z - 405405*h*u**17*x**4*y*z - 810810*h*u**17*x**2*y**3*z + &
      2027025*u**17*x**4*y**3*z
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    L_xxxxyy   = D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + D_xxxxyy*M_0 + D_xxxxyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxxyy*M_xx + D_xxxxyyyy*M_yy + D_xxxxyyzz*M_zz &
      )
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    L_xxxxy    = D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxxy*M_xxx + D_xxxxyyyy* &
      M_yyy + D_xxxxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxy*M_xx + &
      D_xxxxxxyy*M_xxy + D_xxxxxxyz*M_xxz + D_xxxxxyyy*M_xyy + &
      D_xxxxxyzz*M_xzz + D_xxxxyyy*M_yy + D_xxxxyyyz*M_yyz + D_xxxxyyzz &
      *M_yzz + D_xxxxyzz*M_zz)
    L_xxxxyz   = D_xxxxxyyz*M_xy + D_xxxxxyzz*M_xz + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxxyz*M_xx + D_xxxxyyyz*M_yy + D_xxxxyzzz*M_zz &
      )
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    L_xxxx     = D_xxxx*M_0 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxxx*M_xxxx + D_xxxxyyyy*M_yyyy + &
      D_xxxxzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxxyy*M_xxyy + &
      D_xxxxxxzz*M_xxzz + D_xxxxyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxxx &
      *M_xxx + D_xxxxxxxy*M_xxxy + D_xxxxxxxz*M_xxxz + D_xxxxxyyy* &
      M_xyyy + D_xxxxxzzz*M_xzzz + D_xxxxyyy*M_yyy + D_xxxxyyyz*M_yyyz &
      + D_xxxxyzzz*M_yzzz + D_xxxxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxx* &
      M_xx + D_xxxxxxy*M_xxy + D_xxxxxxyz*M_xxyz + D_xxxxxxz*M_xxz + &
      D_xxxxxyy*M_xyy + D_xxxxxyyz*M_xyyz + D_xxxxxyzz*M_xyzz + &
      D_xxxxxzz*M_xzz + D_xxxxyy*M_yy + D_xxxxyyz*M_yyz + D_xxxxyzz* &
      M_yzz + D_xxxxzz*M_zz)
    L_xxxxz    = D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + (1.0d0/6.0d0)*(D_xxxxxxxz*M_xxx + D_xxxxyyyz*M_yyy &
      + D_xxxxzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxxyz*M_xxy + D_xxxxxxz &
      *M_xx + D_xxxxxxzz*M_xxz + D_xxxxxyyz*M_xyy + D_xxxxxzzz*M_xzz + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyzzz*M_yzz + D_xxxxzzz* &
      M_zz)
    D_xxxyyyyy = -42525*h**3*u**17*x*y + 155925*h**2*u**17*x**3*y + 311850*h**2*u**17*x*y &
      **3 - 1351350*h*u**17*x**3*y**3 - 405405*h*u**17*x*y**5 + 2027025 &
      *u**17*x**3*y**5
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = -8505*h**3*u**17*x*z + 31185*h**2*u**17*x**3*z + 187110*h**2*u**17*x*y** &
      2*z - 810810*h*u**17*x**3*y**2*z - 405405*h*u**17*x*y**4*z + &
      2027025*u**17*x**3*y**4*z
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    L_xxxyyy   = D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + D_xxxyyy*M_0 + D_xxxyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxxyyy*M_xx + D_xxxyyyyy*M_yy + D_xxxyyyzz*M_zz &
      )
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    L_xxxyy    = D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxxyy*M_xxx + D_xxxyyyyy* &
      M_yyy + D_xxxyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxyy*M_xx + &
      D_xxxxxyyy*M_xxy + D_xxxxxyyz*M_xxz + D_xxxxyyyy*M_xyy + &
      D_xxxxyyzz*M_xzz + D_xxxyyyy*M_yy + D_xxxyyyyz*M_yyz + D_xxxyyyzz &
      *M_yzz + D_xxxyyzz*M_zz)
    L_xxxyyz   = D_xxxxyyyz*M_xy + D_xxxxyyzz*M_xz + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxxyyz*M_xx + D_xxxyyyyz*M_yy + D_xxxyyzzz*M_zz &
      )
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    L_xxxy     = D_xxxxyy*M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxxy*M_xxxx + D_xxxyyyyy*M_yyyy + &
      D_xxxyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxyyy*M_xxyy + &
      D_xxxxxyzz*M_xxzz + D_xxxyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxxy &
      *M_xxx + D_xxxxxxyy*M_xxxy + D_xxxxxxyz*M_xxxz + D_xxxxyyyy* &
      M_xyyy + D_xxxxyzzz*M_xzzz + D_xxxyyyy*M_yyy + D_xxxyyyyz*M_yyyz &
      + D_xxxyyzzz*M_yzzz + D_xxxyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxy* &
      M_xx + D_xxxxxyy*M_xxy + D_xxxxxyyz*M_xxyz + D_xxxxxyz*M_xxz + &
      D_xxxxyyy*M_xyy + D_xxxxyyyz*M_xyyz + D_xxxxyyzz*M_xyzz + &
      D_xxxxyzz*M_xzz + D_xxxyyy*M_yy + D_xxxyyyz*M_yyz + D_xxxyyzz* &
      M_yzz + D_xxxyzz*M_zz)
    L_xxxyz    = D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + (1.0d0/6.0d0)*(D_xxxxxxyz*M_xxx + D_xxxyyyyz*M_yyy &
      + D_xxxyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxxyyz*M_xxy + D_xxxxxyz &
      *M_xx + D_xxxxxyzz*M_xxz + D_xxxxyyyz*M_xyy + D_xxxxyzzz*M_xzz + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyzzz*M_yzz + D_xxxyzzz* &
      M_zz)
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    L_xxx      = D_xxx*M_0 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxxx*M_xxxxx + D_xxxyyyyy*M_yyyyy + &
      D_xxxzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxxyy*M_xxxyy + &
      D_xxxxxxzz*M_xxxzz + D_xxxxxyyy*M_xxyyy + D_xxxxxzzz*M_xxzzz + &
      D_xxxyyyzz*M_yyyzz + D_xxxyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxxyy*M_xxyy + D_xxxxxyyz*M_xxyyz + D_xxxxxyzz*M_xxyzz + &
      D_xxxxxzz*M_xxzz + D_xxxxyyzz*M_xyyzz + D_xxxyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxx*M_xxxx + D_xxxxxxxy*M_xxxxy + D_xxxxxxxz &
      *M_xxxxz + D_xxxxyyyy*M_xyyyy + D_xxxxzzzz*M_xzzzz + D_xxxyyyy* &
      M_yyyy + D_xxxyyyyz*M_yyyyz + D_xxxyzzzz*M_yzzzz + D_xxxzzzz* &
      M_zzzz) + (1.0d0/2.0d0)*(D_xxxxx*M_xx + D_xxxxxy*M_xxy + &
      D_xxxxxyz*M_xxyz + D_xxxxxz*M_xxz + D_xxxxyy*M_xyy + D_xxxxyyz* &
      M_xyyz + D_xxxxyzz*M_xyzz + D_xxxxzz*M_xzz + D_xxxyy*M_yy + &
      D_xxxyyz*M_yyz + D_xxxyzz*M_yzz + D_xxxzz*M_zz) + (1.0d0/6.0d0)*( &
      D_xxxxxx*M_xxx + D_xxxxxxy*M_xxxy + D_xxxxxxyz*M_xxxyz + &
      D_xxxxxxz*M_xxxz + D_xxxxyyy*M_xyyy + D_xxxxyyyz*M_xyyyz + &
      D_xxxxyzzz*M_xyzzz + D_xxxxzzz*M_xzzz + D_xxxyyy*M_yyy + &
      D_xxxyyyz*M_yyyz + D_xxxyzzz*M_yzzz + D_xxxzzz*M_zzz)
    L_xxxz     = D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxxxz*M_xxxx + D_xxxyyyyz*M_yyyy + &
      D_xxxzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxxyyz*M_xxyy + &
      D_xxxxxzzz*M_xxzz + D_xxxyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxxxyz*M_xxxy + D_xxxxxxz*M_xxx + D_xxxxxxzz*M_xxxz + &
      D_xxxxyyyz*M_xyyy + D_xxxxzzzz*M_xzzz + D_xxxyyyz*M_yyy + &
      D_xxxyyyzz*M_yyyz + D_xxxyzzzz*M_yzzz + D_xxxzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz + D_xxxxxz*M_xx + &
      D_xxxxxzz*M_xxz + D_xxxxyyz*M_xyy + D_xxxxyyzz*M_xyyz + &
      D_xxxxyzzz*M_xyzz + D_xxxxzzz*M_xzz + D_xxxyyz*M_yy + D_xxxyyzz* &
      M_yyz + D_xxxyzzz*M_yzz + D_xxxzzz*M_zz)
    D_xxyyyyyy = 1575*h**4*u**17 - 14175*h**3*u**17*x**2 - 42525*h**3*u**17*y**2 + 467775 &
      *h**2*u**17*x**2*y**2 + 155925*h**2*u**17*y**4 - 135135*h*u**17*y &
      **6 + 2027025*(-h*u**17*x**2*y**4 + u**17*x**2*y**6)
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = -14175*h**3*u**17*y*z + 155925*h**2*u**17*x**2*y*z + 103950*h**2*u**17*y &
      **3*z - 1351350*h*u**17*x**2*y**3*z - 135135*h*u**17*y**5*z + &
      2027025*u**17*x**2*y**5*z
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    L_xxyyyy   = D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + D_xxyyyy*M_0 + D_xxyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxxyyyy*M_xx + D_xxyyyyyy*M_yy + D_xxyyyyzz*M_zz &
      )
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    L_xxyyy    = D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxxyyy*M_xxx + D_xxyyyyyy* &
      M_yyy + D_xxyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyyy*M_xx + &
      D_xxxxyyyy*M_xxy + D_xxxxyyyz*M_xxz + D_xxxyyyyy*M_xyy + &
      D_xxxyyyzz*M_xzz + D_xxyyyyy*M_yy + D_xxyyyyyz*M_yyz + D_xxyyyyzz &
      *M_yzz + D_xxyyyzz*M_zz)
    L_xxyyyz   = D_xxxyyyyz*M_xy + D_xxxyyyzz*M_xz + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxxyyyz*M_xx + D_xxyyyyyz*M_yy + D_xxyyyzzz*M_zz &
      )
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    L_xxyy     = D_xxxyyy*M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxxyy*M_xxxx + D_xxyyyyyy*M_yyyy + &
      D_xxyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyyyy*M_xxyy + &
      D_xxxxyyzz*M_xxzz + D_xxyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxxyy &
      *M_xxx + D_xxxxxyyy*M_xxxy + D_xxxxxyyz*M_xxxz + D_xxxyyyyy* &
      M_xyyy + D_xxxyyzzz*M_xzzz + D_xxyyyyy*M_yyy + D_xxyyyyyz*M_yyyz &
      + D_xxyyyzzz*M_yzzz + D_xxyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyy* &
      M_xx + D_xxxxyyy*M_xxy + D_xxxxyyyz*M_xxyz + D_xxxxyyz*M_xxz + &
      D_xxxyyyy*M_xyy + D_xxxyyyyz*M_xyyz + D_xxxyyyzz*M_xyzz + &
      D_xxxyyzz*M_xzz + D_xxyyyy*M_yy + D_xxyyyyz*M_yyz + D_xxyyyzz* &
      M_yzz + D_xxyyzz*M_zz)
    L_xxyyz    = D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + (1.0d0/6.0d0)*(D_xxxxxyyz*M_xxx + D_xxyyyyyz*M_yyy &
      + D_xxyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxxyyyz*M_xxy + D_xxxxyyz &
      *M_xx + D_xxxxyyzz*M_xxz + D_xxxyyyyz*M_xyy + D_xxxyyzzz*M_xzz + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyzzz*M_yzz + D_xxyyzzz* &
      M_zz)
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    L_xxy      = D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxxy*M_xxxxx + D_xxyyyyyy*M_yyyyy + &
      D_xxyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxyyy*M_xxxyy + &
      D_xxxxxyzz*M_xxxzz + D_xxxxyyyy*M_xxyyy + D_xxxxyzzz*M_xxzzz + &
      D_xxyyyyzz*M_yyyzz + D_xxyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxyyy*M_xxyy + D_xxxxyyyz*M_xxyyz + D_xxxxyyzz*M_xxyzz + &
      D_xxxxyzz*M_xxzz + D_xxxyyyzz*M_xyyzz + D_xxyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + D_xxxxxxyz &
      *M_xxxxz + D_xxxyyyyy*M_xyyyy + D_xxxyzzzz*M_xzzzz + D_xxyyyyy* &
      M_yyyy + D_xxyyyyyz*M_yyyyz + D_xxyyzzzz*M_yzzzz + D_xxyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + &
      D_xxxxxyyz*M_xxxyz + D_xxxxxyz*M_xxxz + D_xxxyyyy*M_xyyy + &
      D_xxxyyyyz*M_xyyyz + D_xxxyyzzz*M_xyzzz + D_xxxyzzz*M_xzzz + &
      D_xxyyyy*M_yyy + D_xxyyyyz*M_yyyz + D_xxyyzzz*M_yzzz + D_xxyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyz &
      *M_xxyz + D_xxxxyz*M_xxz + D_xxxyyy*M_xyy + D_xxxyyyz*M_xyyz + &
      D_xxxyyzz*M_xyzz + D_xxxyzz*M_xzz + D_xxyyy*M_yy + D_xxyyyz*M_yyz &
      + D_xxyyzz*M_yzz + D_xxyzz*M_zz)
    L_xxyz     = D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxxyz*M_xxxx + D_xxyyyyyz*M_yyyy + &
      D_xxyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxxyyyz*M_xxyy + &
      D_xxxxyzzz*M_xxzz + D_xxyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxxyyz*M_xxxy + D_xxxxxyz*M_xxx + D_xxxxxyzz*M_xxxz + &
      D_xxxyyyyz*M_xyyy + D_xxxyzzzz*M_xzzz + D_xxyyyyz*M_yyy + &
      D_xxyyyyzz*M_yyyz + D_xxyyzzzz*M_yzzz + D_xxyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz + D_xxxxyz*M_xx + &
      D_xxxxyzz*M_xxz + D_xxxyyyz*M_xyy + D_xxxyyyzz*M_xyyz + &
      D_xxxyyzzz*M_xyzz + D_xxxyzzz*M_xzz + D_xxyyyz*M_yy + D_xxyyyzz* &
      M_yyz + D_xxyyzzz*M_yzz + D_xxyzzz*M_zz)
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    L_xx       = D_xx*M_0 + (1.0d0/8.0d0)*D_xxxxyyzz*M_xxyyzz + D_xxxy*M_xy + D_xxxyz* &
      M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxxx* &
      M_xxxxxx + D_xxyyyyyy*M_yyyyyy + D_xxzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxxyyy*M_xxxyyy + D_xxxxxzzz*M_xxxzzz + D_xxyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxxyy*M_xxxxyy + D_xxxxxxzz* &
      M_xxxxzz + D_xxxxyyyy*M_xxyyyy + D_xxxxzzzz*M_xxzzzz + D_xxyyyyzz &
      *M_yyyyzz + D_xxyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxxyy*M_xxyy &
      + D_xxxxyyz*M_xxyyz + D_xxxxyzz*M_xxyzz + D_xxxxzz*M_xxzz + &
      D_xxxyyzz*M_xyyzz + D_xxyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxxx &
      *M_xxxxx + D_xxxxxxxy*M_xxxxxy + D_xxxxxxxz*M_xxxxxz + D_xxxyyyyy &
      *M_xyyyyy + D_xxxzzzzz*M_xzzzzz + D_xxyyyyy*M_yyyyy + D_xxyyyyyz* &
      M_yyyyyz + D_xxyzzzzz*M_yzzzzz + D_xxzzzzz*M_zzzzz) + (1.0d0/ &
      2.0d0)*(D_xxxx*M_xx + D_xxxxy*M_xxy + D_xxxxyz*M_xxyz + D_xxxxz* &
      M_xxz + D_xxxyy*M_xyy + D_xxxyyz*M_xyyz + D_xxxyzz*M_xyzz + &
      D_xxxzz*M_xzz + D_xxyy*M_yy + D_xxyyz*M_yyz + D_xxyzz*M_yzz + &
      D_xxzz*M_zz) + (1.0d0/6.0d0)*(D_xxxxx*M_xxx + D_xxxxxy*M_xxxy + &
      D_xxxxxyz*M_xxxyz + D_xxxxxz*M_xxxz + D_xxxyyy*M_xyyy + D_xxxyyyz &
      *M_xyyyz + D_xxxyzzz*M_xyzzz + D_xxxzzz*M_xzzz + D_xxyyy*M_yyy + &
      D_xxyyyz*M_yyyz + D_xxyzzz*M_yzzz + D_xxzzz*M_zzz) + (1.0d0/ &
      24.0d0)*(D_xxxxxx*M_xxxx + D_xxxxxxy*M_xxxxy + D_xxxxxxyz* &
      M_xxxxyz + D_xxxxxxz*M_xxxxz + D_xxxyyyy*M_xyyyy + D_xxxyyyyz* &
      M_xyyyyz + D_xxxyzzzz*M_xyzzzz + D_xxxzzzz*M_xzzzz + D_xxyyyy* &
      M_yyyy + D_xxyyyyz*M_yyyyz + D_xxyzzzz*M_yzzzz + D_xxzzzz*M_zzzz &
      ) + (1.0d0/12.0d0)*(D_xxxxxyy*M_xxxyy + D_xxxxxyyz*M_xxxyyz + &
      D_xxxxxyzz*M_xxxyzz + D_xxxxxzz*M_xxxzz + D_xxxxyyy*M_xxyyy + &
      D_xxxxyyyz*M_xxyyyz + D_xxxxyzzz*M_xxyzzz + D_xxxxzzz*M_xxzzz + &
      D_xxxyyyzz*M_xyyyzz + D_xxxyyzzz*M_xyyzzz + D_xxyyyzz*M_yyyzz + &
      D_xxyyzzz*M_yyzzz)
    L_xxz      = D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxxxz*M_xxxxx + D_xxyyyyyz*M_yyyyy + &
      D_xxzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxxyyz*M_xxxyy + &
      D_xxxxxzzz*M_xxxzz + D_xxxxyyyz*M_xxyyy + D_xxxxzzzz*M_xxzzz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxxyyz*M_xxyy + D_xxxxyyzz*M_xxyyz + D_xxxxyzzz*M_xxyzz + &
      D_xxxxzzz*M_xxzz + D_xxxyyzzz*M_xyyzz + D_xxyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxxyz*M_xxxxy + D_xxxxxxz*M_xxxx + D_xxxxxxzz &
      *M_xxxxz + D_xxxyyyyz*M_xyyyy + D_xxxzzzzz*M_xzzzz + D_xxyyyyz* &
      M_yyyy + D_xxyyyyzz*M_yyyyz + D_xxyzzzzz*M_yzzzz + D_xxzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxxyz*M_xxxy + D_xxxxxyzz*M_xxxyz + &
      D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + D_xxxyyyz*M_xyyy + D_xxxyyyzz &
      *M_xyyyz + D_xxxyzzzz*M_xyzzz + D_xxxzzzz*M_xzzz + D_xxyyyz*M_yyy &
      + D_xxyyyzz*M_yyyz + D_xxyzzzz*M_yzzz + D_xxzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxz*M_xx + &
      D_xxxxzz*M_xxz + D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyzzz* &
      M_xyzz + D_xxxzzz*M_xzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + &
      D_xxyzzz*M_yzz + D_xxzzz*M_zz)
    D_xyyyyyyy = -99225*h**3*u**17*x*y + 1091475*h**2*u**17*x*y**3 - 2837835*h*u**17*x*y &
      **5 + 2027025*u**17*x*y**7
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = -14175*h**3*u**17*x*z + 467775*h**2*u**17*x*y**2*z + 2027025*(-h*u**17*x &
      *y**4*z + u**17*x*y**6*z)
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    L_xyyyyy   = D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + D_xyyyyy*M_0 + D_xyyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxxyyyyy*M_xx + D_xyyyyyyy*M_yy + D_xyyyyyzz*M_zz &
      )
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    L_xyyyy    = D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxxyyyy*M_xxx + D_xyyyyyyy* &
      M_yyy + D_xyyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyyy*M_xx + &
      D_xxxyyyyy*M_xxy + D_xxxyyyyz*M_xxz + D_xxyyyyyy*M_xyy + &
      D_xxyyyyzz*M_xzz + D_xyyyyyy*M_yy + D_xyyyyyyz*M_yyz + D_xyyyyyzz &
      *M_yzz + D_xyyyyzz*M_zz)
    L_xyyyyz   = D_xxyyyyyz*M_xy + D_xxyyyyzz*M_xz + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxxyyyyz*M_xx + D_xyyyyyyz*M_yy + D_xyyyyzzz*M_zz &
      )
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    L_xyyy     = D_xxyyyy*M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxxyyy*M_xxxx + D_xyyyyyyy*M_yyyy + &
      D_xyyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyyyy*M_xxyy + &
      D_xxxyyyzz*M_xxzz + D_xyyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxxyyy &
      *M_xxx + D_xxxxyyyy*M_xxxy + D_xxxxyyyz*M_xxxz + D_xxyyyyyy* &
      M_xyyy + D_xxyyyzzz*M_xzzz + D_xyyyyyy*M_yyy + D_xyyyyyyz*M_yyyz &
      + D_xyyyyzzz*M_yzzz + D_xyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyy* &
      M_xx + D_xxxyyyy*M_xxy + D_xxxyyyyz*M_xxyz + D_xxxyyyz*M_xxz + &
      D_xxyyyyy*M_xyy + D_xxyyyyyz*M_xyyz + D_xxyyyyzz*M_xyzz + &
      D_xxyyyzz*M_xzz + D_xyyyyy*M_yy + D_xyyyyyz*M_yyz + D_xyyyyzz* &
      M_yzz + D_xyyyzz*M_zz)
    L_xyyyz    = D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyzz*M_yz + &
      D_xyyyz*M_0 + (1.0d0/6.0d0)*(D_xxxxyyyz*M_xxx + D_xyyyyyyz*M_yyy &
      + D_xyyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyyyyz*M_xxy + D_xxxyyyz &
      *M_xx + D_xxxyyyzz*M_xxz + D_xxyyyyyz*M_xyy + D_xxyyyzzz*M_xzz + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyzzz*M_yzz + D_xyyyzzz* &
      M_zz)
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    L_xyy      = D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxxyy*M_xxxxx + D_xyyyyyyy*M_yyyyy + &
      D_xyyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyyyy*M_xxxyy + &
      D_xxxxyyzz*M_xxxzz + D_xxxyyyyy*M_xxyyy + D_xxxyyzzz*M_xxzzz + &
      D_xyyyyyzz*M_yyyzz + D_xyyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyyy*M_xxyy + D_xxxyyyyz*M_xxyyz + D_xxxyyyzz*M_xxyzz + &
      D_xxxyyzz*M_xxzz + D_xxyyyyzz*M_xyyzz + D_xyyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + D_xxxxxyyz &
      *M_xxxxz + D_xxyyyyyy*M_xyyyy + D_xxyyzzzz*M_xzzzz + D_xyyyyyy* &
      M_yyyy + D_xyyyyyyz*M_yyyyz + D_xyyyzzzz*M_yzzzz + D_xyyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + &
      D_xxxxyyyz*M_xxxyz + D_xxxxyyz*M_xxxz + D_xxyyyyy*M_xyyy + &
      D_xxyyyyyz*M_xyyyz + D_xxyyyzzz*M_xyzzz + D_xxyyzzz*M_xzzz + &
      D_xyyyyy*M_yyy + D_xyyyyyz*M_yyyz + D_xyyyzzz*M_yzzz + D_xyyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyz &
      *M_xxyz + D_xxxyyz*M_xxz + D_xxyyyy*M_xyy + D_xxyyyyz*M_xyyz + &
      D_xxyyyzz*M_xyzz + D_xxyyzz*M_xzz + D_xyyyy*M_yy + D_xyyyyz*M_yyz &
      + D_xyyyzz*M_yzz + D_xyyzz*M_zz)
    L_xyyz     = D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyzz*M_yz + D_xyyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxxyyz*M_xxxx + D_xyyyyyyz*M_yyyy + &
      D_xyyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyyyyz*M_xxyy + &
      D_xxxyyzzz*M_xxzz + D_xyyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxxyyyz*M_xxxy + D_xxxxyyz*M_xxx + D_xxxxyyzz*M_xxxz + &
      D_xxyyyyyz*M_xyyy + D_xxyyzzzz*M_xzzz + D_xyyyyyz*M_yyy + &
      D_xyyyyyzz*M_yyyz + D_xyyyzzzz*M_yzzz + D_xyyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz + D_xxxyyz*M_xx + &
      D_xxxyyzz*M_xxz + D_xxyyyyz*M_xyy + D_xxyyyyzz*M_xyyz + &
      D_xxyyyzzz*M_xyzz + D_xxyyzzz*M_xzz + D_xyyyyz*M_yy + D_xyyyyzz* &
      M_yyz + D_xyyyzzz*M_yzz + D_xyyzzz*M_zz)
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    L_xy       = (1.0d0/8.0d0)*D_xxxyyyzz*M_xxyyzz + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz &
      *M_xz + D_xy*M_0 + D_xyyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxxy* &
      M_xxxxxx + D_xyyyyyyy*M_yyyyyy + D_xyzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxyyyy*M_xxxyyy + D_xxxxyzzz*M_xxxzzz + D_xyyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxyyy*M_xxxxyy + D_xxxxxyzz* &
      M_xxxxzz + D_xxxyyyyy*M_xxyyyy + D_xxxyzzzz*M_xxzzzz + D_xyyyyyzz &
      *M_yyyyzz + D_xyyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxyyy*M_xxyy &
      + D_xxxyyyz*M_xxyyz + D_xxxyyzz*M_xxyzz + D_xxxyzz*M_xxzz + &
      D_xxyyyzz*M_xyyzz + D_xyyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxxy &
      *M_xxxxx + D_xxxxxxyy*M_xxxxxy + D_xxxxxxyz*M_xxxxxz + D_xxyyyyyy &
      *M_xyyyyy + D_xxyzzzzz*M_xzzzzz + D_xyyyyyy*M_yyyyy + D_xyyyyyyz* &
      M_yyyyyz + D_xyyzzzzz*M_yzzzzz + D_xyzzzzz*M_zzzzz) + (1.0d0/ &
      24.0d0)*(D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + D_xxxxxyyz* &
      M_xxxxyz + D_xxxxxyz*M_xxxxz + D_xxyyyyy*M_xyyyy + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyzzzz*M_xyzzzz + D_xxyzzzz*M_xzzzz + D_xyyyyy* &
      M_yyyy + D_xyyyyyz*M_yyyyz + D_xyyzzzz*M_yzzzz + D_xyzzzz*M_zzzz &
      ) + (1.0d0/6.0d0)*(D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyz* &
      M_xxxyz + D_xxxxyz*M_xxxz + D_xxyyyy*M_xyyy + D_xxyyyyz*M_xyyyz + &
      D_xxyyzzz*M_xyzzz + D_xxyzzz*M_xzzz + D_xyyyy*M_yyy + D_xyyyyz* &
      M_yyyz + D_xyyzzz*M_yzzz + D_xyzzz*M_zzz) + (1.0d0/12.0d0)*( &
      D_xxxxyyy*M_xxxyy + D_xxxxyyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyzz + &
      D_xxxxyzz*M_xxxzz + D_xxxyyyy*M_xxyyy + D_xxxyyyyz*M_xxyyyz + &
      D_xxxyyzzz*M_xxyzzz + D_xxxyzzz*M_xxzzz + D_xxyyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyzzz + D_xyyyyzz*M_yyyzz + D_xyyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyz*M_xxyz + &
      D_xxxyz*M_xxz + D_xxyyy*M_xyy + D_xxyyyz*M_xyyz + D_xxyyzz*M_xyzz &
      + D_xxyzz*M_xzz + D_xyyy*M_yy + D_xyyyz*M_yyz + D_xyyzz*M_yzz + &
      D_xyzz*M_zz)
    L_xyz      = D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyzz*M_yz + D_xyz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxxyz*M_xxxxx + D_xyyyyyyz*M_yyyyy + &
      D_xyzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxxyyyz*M_xxxyy + &
      D_xxxxyzzz*M_xxxzz + D_xxxyyyyz*M_xxyyy + D_xxxyzzzz*M_xxzzz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxxyyyz*M_xxyy + D_xxxyyyzz*M_xxyyz + D_xxxyyzzz*M_xxyzz + &
      D_xxxyzzz*M_xxzz + D_xxyyyzzz*M_xyyzz + D_xyyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxxyyz*M_xxxxy + D_xxxxxyz*M_xxxx + D_xxxxxyzz &
      *M_xxxxz + D_xxyyyyyz*M_xyyyy + D_xxyzzzzz*M_xzzzz + D_xyyyyyz* &
      M_yyyy + D_xyyyyyzz*M_yyyyz + D_xyyzzzzz*M_yzzzz + D_xyzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxxyyz*M_xxxy + D_xxxxyyzz*M_xxxyz + &
      D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + D_xxyyyyz*M_xyyy + D_xxyyyyzz &
      *M_xyyyz + D_xxyyzzzz*M_xyzzz + D_xxyzzzz*M_xzzz + D_xyyyyz*M_yyy &
      + D_xyyyyzz*M_yyyz + D_xyyzzzz*M_yzzz + D_xyzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyz*M_xx + &
      D_xxxyzz*M_xxz + D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyzzz* &
      M_xyzz + D_xxyzzz*M_xzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + &
      D_xyyzzz*M_yzz + D_xyzzz*M_zz)
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = D_x*M_0 + (1.0d0/8.0d0)*D_xxxyyzz*M_xxyyzz + D_xxy*M_xy + D_xxyz*M_xyz + &
      D_xxz*M_xz + D_xyz*M_yz + (1.0d0/5040.0d0)*(D_xxxxxxxx*M_xxxxxxx &
      + D_xyyyyyyy*M_yyyyyyy + D_xzzzzzzz*M_zzzzzzz) + (1.0d0/240.0d0)* &
      (D_xxxxxxyy*M_xxxxxyy + D_xxxxxxzz*M_xxxxxzz + D_xxxyyyyy* &
      M_xxyyyyy + D_xxxzzzzz*M_xxzzzzz + D_xyyyyyzz*M_yyyyyzz + &
      D_xyyzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxxyyy*M_xxxxyyy + &
      D_xxxxxzzz*M_xxxxzzz + D_xxxxyyyy*M_xxxyyyy + D_xxxxzzzz* &
      M_xxxzzzz + D_xyyyyzzz*M_yyyyzzz + D_xyyyzzzz*M_yyyzzzz) + (1.0d0 &
      /36.0d0)*(D_xxxxyyy*M_xxxyyy + D_xxxxyyyz*M_xxxyyyz + D_xxxxyzzz* &
      M_xxxyzzz + D_xxxxzzz*M_xxxzzz + D_xxyyyzzz*M_xyyyzzz + D_xyyyzzz &
      *M_yyyzzz) + (1.0d0/4.0d0)*(D_xxxyy*M_xxyy + D_xxxyyz*M_xxyyz + &
      D_xxxyzz*M_xxyzz + D_xxxzz*M_xxzz + D_xxyyzz*M_xyyzz + D_xyyzz* &
      M_yyzz) + (1.0d0/720.0d0)*(D_xxxxxxx*M_xxxxxx + D_xxxxxxxy* &
      M_xxxxxxy + D_xxxxxxxz*M_xxxxxxz + D_xxyyyyyy*M_xyyyyyy + &
      D_xxzzzzzz*M_xzzzzzz + D_xyyyyyy*M_yyyyyy + D_xyyyyyyz*M_yyyyyyz &
      + D_xyzzzzzz*M_yzzzzzz + D_xzzzzzz*M_zzzzzz) + (1.0d0/2.0d0)*( &
      D_xxx*M_xx + D_xxxy*M_xxy + D_xxxyz*M_xxyz + D_xxxz*M_xxz + &
      D_xxyy*M_xyy + D_xxyyz*M_xyyz + D_xxyzz*M_xyzz + D_xxzz*M_xzz + &
      D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz*M_zz) + (1.0d0/ &
      6.0d0)*(D_xxxx*M_xxx + D_xxxxy*M_xxxy + D_xxxxyz*M_xxxyz + &
      D_xxxxz*M_xxxz + D_xxyyy*M_xyyy + D_xxyyyz*M_xyyyz + D_xxyzzz* &
      M_xyzzz + D_xxzzz*M_xzzz + D_xyyy*M_yyy + D_xyyyz*M_yyyz + &
      D_xyzzz*M_yzzz + D_xzzz*M_zzz) + (1.0d0/120.0d0)*(D_xxxxxx* &
      M_xxxxx + D_xxxxxxy*M_xxxxxy + D_xxxxxxyz*M_xxxxxyz + D_xxxxxxz* &
      M_xxxxxz + D_xxyyyyy*M_xyyyyy + D_xxyyyyyz*M_xyyyyyz + D_xxyzzzzz &
      *M_xyzzzzz + D_xxzzzzz*M_xzzzzz + D_xyyyyy*M_yyyyy + D_xyyyyyz* &
      M_yyyyyz + D_xyzzzzz*M_yzzzzz + D_xzzzzz*M_zzzzz) + (1.0d0/48.0d0 &
      )*(D_xxxxxyy*M_xxxxyy + D_xxxxxyyz*M_xxxxyyz + D_xxxxxyzz* &
      M_xxxxyzz + D_xxxxxzz*M_xxxxzz + D_xxxyyyy*M_xxyyyy + D_xxxyyyyz* &
      M_xxyyyyz + D_xxxyzzzz*M_xxyzzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxyyyyzz*M_xyyyyzz + D_xxyyzzzz*M_xyyzzzz + D_xyyyyzz*M_yyyyzz &
      + D_xyyzzzz*M_yyzzzz) + (1.0d0/12.0d0)*(D_xxxxyy*M_xxxyy + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyzz*M_xxxyzz + D_xxxxzz*M_xxxzz + &
      D_xxxyyy*M_xxyyy + D_xxxyyyz*M_xxyyyz + D_xxxyzzz*M_xxyzzz + &
      D_xxxzzz*M_xxzzz + D_xxyyyzz*M_xyyyzz + D_xxyyzzz*M_xyyzzz + &
      D_xyyyzz*M_yyyzz + D_xyyzzz*M_yyzzz) + (1.0d0/24.0d0)*(D_xxxxx* &
      M_xxxx + D_xxxxxy*M_xxxxy + D_xxxxxyz*M_xxxxyz + D_xxxxxz*M_xxxxz &
      + D_xxxxyyzz*M_xxxyyzz + D_xxxyyyzz*M_xxyyyzz + D_xxxyyzzz* &
      M_xxyyzzz + D_xxyyyy*M_xyyyy + D_xxyyyyz*M_xyyyyz + D_xxyzzzz* &
      M_xyzzzz + D_xxzzzz*M_xzzzz + D_xyyyy*M_yyyy + D_xyyyyz*M_yyyyz + &
      D_xyzzzz*M_yzzzz + D_xzzzz*M_zzzz)
    L_xz       = (1.0d0/8.0d0)*D_xxxyyzzz*M_xxyyzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz &
      *M_xz + D_xyzz*M_yz + D_xz*M_0 + (1.0d0/720.0d0)*(D_xxxxxxxz* &
      M_xxxxxx + D_xyyyyyyz*M_yyyyyy + D_xzzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxxyyyz*M_xxxyyy + D_xxxxzzzz*M_xxxzzz + D_xyyyzzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxxyyz*M_xxxxyy + D_xxxxxzzz* &
      M_xxxxzz + D_xxxyyyyz*M_xxyyyy + D_xxxzzzzz*M_xxzzzz + D_xyyyyzzz &
      *M_yyyyzz + D_xyyzzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxxyyz*M_xxyy &
      + D_xxxyyzz*M_xxyyz + D_xxxyzzz*M_xxyzz + D_xxxzzz*M_xxzz + &
      D_xxyyzzz*M_xyyzz + D_xyyzzz*M_yyzz) + (1.0d0/120.0d0)*( &
      D_xxxxxxyz*M_xxxxxy + D_xxxxxxz*M_xxxxx + D_xxxxxxzz*M_xxxxxz + &
      D_xxyyyyyz*M_xyyyyy + D_xxzzzzzz*M_xzzzzz + D_xyyyyyz*M_yyyyy + &
      D_xyyyyyzz*M_yyyyyz + D_xyzzzzzz*M_yzzzzz + D_xzzzzzz*M_zzzzz) + &
      (1.0d0/24.0d0)*(D_xxxxxyz*M_xxxxy + D_xxxxxyzz*M_xxxxyz + &
      D_xxxxxz*M_xxxx + D_xxxxxzz*M_xxxxz + D_xxyyyyz*M_xyyyy + &
      D_xxyyyyzz*M_xyyyyz + D_xxyzzzzz*M_xyzzzz + D_xxzzzzz*M_xzzzz + &
      D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + D_xyzzzzz*M_yzzzz + &
      D_xzzzzz*M_zzzz) + (1.0d0/12.0d0)*(D_xxxxyyz*M_xxxyy + D_xxxxyyzz &
      *M_xxxyyz + D_xxxxyzzz*M_xxxyzz + D_xxxxzzz*M_xxxzz + D_xxxyyyz* &
      M_xxyyy + D_xxxyyyzz*M_xxyyyz + D_xxxyzzzz*M_xxyzzz + D_xxxzzzz* &
      M_xxzzz + D_xxyyyzzz*M_xyyyzz + D_xxyyzzzz*M_xyyzzz + D_xyyyzzz* &
      M_yyyzz + D_xyyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxxyz*M_xxxy + &
      D_xxxxyzz*M_xxxyz + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxyyyz* &
      M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyzzzz*M_xyzzz + D_xxzzzz*M_xzzz &
      + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyzzzz*M_yzzz + D_xzzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz* &
      M_xx + D_xxxzz*M_xxz + D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyzzz &
      *M_xyzz + D_xxzzz*M_xzz + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz* &
      M_yzz + D_xzzz*M_zz)
    D_yyyyyyyy = 11025*h**4*u**17 - 396900*h**3*u**17*y**2 + 2182950*h**2*u**17*y**4 - &
      3783780*h*u**17*y**6 + 2027025*u**17*y**8
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = -99225*h**3*u**17*y*z + 1091475*h**2*u**17*y**3*z - 2837835*h*u**17*y**5 &
      *z + 2027025*u**17*y**7*z
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + D_yyyyyyyz*M_yz + ( &
      1.0d0/2.0d0)*(D_xxyyyyyy*M_xx + D_yyyyyyyy*M_yy + D_yyyyyyzz*M_zz &
      )
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = D_xyyyyyy*M_xy + D_xyyyyyyz*M_xyz + D_xyyyyyz*M_xz + D_yyyyy*M_0 + &
      D_yyyyyyz*M_yz + (1.0d0/6.0d0)*(D_xxxyyyyy*M_xxx + D_yyyyyyyy* &
      M_yyy + D_yyyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyyy*M_xx + &
      D_xxyyyyyy*M_xxy + D_xxyyyyyz*M_xxz + D_xyyyyyyy*M_xyy + &
      D_xyyyyyzz*M_xzz + D_yyyyyyy*M_yy + D_yyyyyyyz*M_yyz + D_yyyyyyzz &
      *M_yzz + D_yyyyyzz*M_zz)
    L_yyyyyz   = D_xyyyyyyz*M_xy + D_xyyyyyzz*M_xz + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 + ( &
      1.0d0/2.0d0)*(D_xxyyyyyz*M_xx + D_yyyyyyyz*M_yy + D_yyyyyzzz*M_zz &
      )
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = D_xyyyyy*M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyz* &
      M_yz + (1.0d0/24.0d0)*(D_xxxxyyyy*M_xxxx + D_yyyyyyyy*M_yyyy + &
      D_yyyyzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyyyy*M_xxyy + &
      D_xxyyyyzz*M_xxzz + D_yyyyyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxyyyy &
      *M_xxx + D_xxxyyyyy*M_xxxy + D_xxxyyyyz*M_xxxz + D_xyyyyyyy* &
      M_xyyy + D_xyyyyzzz*M_xzzz + D_yyyyyyy*M_yyy + D_yyyyyyyz*M_yyyz &
      + D_yyyyyzzz*M_yzzz + D_yyyyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyy* &
      M_xx + D_xxyyyyy*M_xxy + D_xxyyyyyz*M_xxyz + D_xxyyyyz*M_xxz + &
      D_xyyyyyy*M_xyy + D_xyyyyyyz*M_xyyz + D_xyyyyyzz*M_xyzz + &
      D_xyyyyzz*M_xzz + D_yyyyyy*M_yy + D_yyyyyyz*M_yyz + D_yyyyyzz* &
      M_yzz + D_yyyyzz*M_zz)
    L_yyyyz    = D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyzz*M_xz + D_yyyyyzz*M_yz + &
      D_yyyyz*M_0 + (1.0d0/6.0d0)*(D_xxxyyyyz*M_xxx + D_yyyyyyyz*M_yyy &
      + D_yyyyzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyyyyz*M_xxy + D_xxyyyyz &
      *M_xx + D_xxyyyyzz*M_xxz + D_xyyyyyyz*M_xyy + D_xyyyyzzz*M_xzz + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyzzz*M_yzz + D_yyyyzzz* &
      M_zz)
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyyz*M_yz &
      + (1.0d0/120.0d0)*(D_xxxxxyyy*M_xxxxx + D_yyyyyyyy*M_yyyyy + &
      D_yyyzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyyyy*M_xxxyy + &
      D_xxxyyyzz*M_xxxzz + D_xxyyyyyy*M_xxyyy + D_xxyyyzzz*M_xxzzz + &
      D_yyyyyyzz*M_yyyzz + D_yyyyyzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyyy*M_xxyy + D_xxyyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyzz + &
      D_xxyyyzz*M_xxzz + D_xyyyyyzz*M_xyyzz + D_yyyyyzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + D_xxxxyyyz &
      *M_xxxxz + D_xyyyyyyy*M_xyyyy + D_xyyyzzzz*M_xzzzz + D_yyyyyyy* &
      M_yyyy + D_yyyyyyyz*M_yyyyz + D_yyyyzzzz*M_yzzzz + D_yyyzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + &
      D_xxxyyyyz*M_xxxyz + D_xxxyyyz*M_xxxz + D_xyyyyyy*M_xyyy + &
      D_xyyyyyyz*M_xyyyz + D_xyyyyzzz*M_xyzzz + D_xyyyzzz*M_xzzz + &
      D_yyyyyy*M_yyy + D_yyyyyyz*M_yyyz + D_yyyyzzz*M_yzzz + D_yyyzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyz &
      *M_xxyz + D_xxyyyz*M_xxz + D_xyyyyy*M_xyy + D_xyyyyyz*M_xyyz + &
      D_xyyyyzz*M_xyzz + D_xyyyzz*M_xzz + D_yyyyy*M_yy + D_yyyyyz*M_yyz &
      + D_yyyyzz*M_yzz + D_yyyzz*M_zz)
    L_yyyz     = D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz + D_yyyyzz*M_yz + D_yyyz &
      *M_0 + (1.0d0/24.0d0)*(D_xxxxyyyz*M_xxxx + D_yyyyyyyz*M_yyyy + &
      D_yyyzzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyyyyz*M_xxyy + &
      D_xxyyyzzz*M_xxzz + D_yyyyyzzz*M_yyzz) + (1.0d0/6.0d0)*( &
      D_xxxyyyyz*M_xxxy + D_xxxyyyz*M_xxx + D_xxxyyyzz*M_xxxz + &
      D_xyyyyyyz*M_xyyy + D_xyyyzzzz*M_xzzz + D_yyyyyyz*M_yyy + &
      D_yyyyyyzz*M_yyyz + D_yyyyzzzz*M_yzzz + D_yyyzzzz*M_zzz) + (1.0d0 &
      /2.0d0)*(D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz + D_xxyyyz*M_xx + &
      D_xxyyyzz*M_xxz + D_xyyyyyz*M_xyy + D_xyyyyyzz*M_xyyz + &
      D_xyyyyzzz*M_xyzz + D_xyyyzzz*M_xzz + D_yyyyyz*M_yy + D_yyyyyzz* &
      M_yyz + D_yyyyzzz*M_yzz + D_yyyzzz*M_zz)
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = (1.0d0/8.0d0)*D_xxyyyyzz*M_xxyyzz + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz &
      *M_xz + D_yy*M_0 + D_yyyz*M_yz + (1.0d0/720.0d0)*(D_xxxxxxyy* &
      M_xxxxxx + D_yyyyyyyy*M_yyyyyy + D_yyzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxyyyyy*M_xxxyyy + D_xxxyyzzz*M_xxxzzz + D_yyyyyzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyyyy*M_xxxxyy + D_xxxxyyzz* &
      M_xxxxzz + D_xxyyyyyy*M_xxyyyy + D_xxyyzzzz*M_xxzzzz + D_yyyyyyzz &
      *M_yyyyzz + D_yyyyzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyyyy*M_xxyy &
      + D_xxyyyyz*M_xxyyz + D_xxyyyzz*M_xxyzz + D_xxyyzz*M_xxzz + &
      D_xyyyyzz*M_xyyzz + D_yyyyzz*M_yyzz) + (1.0d0/120.0d0)*(D_xxxxxyy &
      *M_xxxxx + D_xxxxxyyy*M_xxxxxy + D_xxxxxyyz*M_xxxxxz + D_xyyyyyyy &
      *M_xyyyyy + D_xyyzzzzz*M_xzzzzz + D_yyyyyyy*M_yyyyy + D_yyyyyyyz* &
      M_yyyyyz + D_yyyzzzzz*M_yzzzzz + D_yyzzzzz*M_zzzzz) + (1.0d0/ &
      24.0d0)*(D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + D_xxxxyyyz* &
      M_xxxxyz + D_xxxxyyz*M_xxxxz + D_xyyyyyy*M_xyyyy + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyzzzz*M_xyzzzz + D_xyyzzzz*M_xzzzz + D_yyyyyy* &
      M_yyyy + D_yyyyyyz*M_yyyyz + D_yyyzzzz*M_yzzzz + D_yyzzzz*M_zzzz &
      ) + (1.0d0/6.0d0)*(D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyz* &
      M_xxxyz + D_xxxyyz*M_xxxz + D_xyyyyy*M_xyyy + D_xyyyyyz*M_xyyyz + &
      D_xyyyzzz*M_xyzzz + D_xyyzzz*M_xzzz + D_yyyyy*M_yyy + D_yyyyyz* &
      M_yyyz + D_yyyzzz*M_yzzz + D_yyzzz*M_zzz) + (1.0d0/12.0d0)*( &
      D_xxxyyyy*M_xxxyy + D_xxxyyyyz*M_xxxyyz + D_xxxyyyzz*M_xxxyzz + &
      D_xxxyyzz*M_xxxzz + D_xxyyyyy*M_xxyyy + D_xxyyyyyz*M_xxyyyz + &
      D_xxyyyzzz*M_xxyzzz + D_xxyyzzz*M_xxzzz + D_xyyyyyzz*M_xyyyzz + &
      D_xyyyyzzz*M_xyyzzz + D_yyyyyzz*M_yyyzz + D_yyyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyz*M_xxyz + &
      D_xxyyz*M_xxz + D_xyyyy*M_xyy + D_xyyyyz*M_xyyz + D_xyyyzz*M_xyzz &
      + D_xyyzz*M_xzz + D_yyyy*M_yy + D_yyyyz*M_yyz + D_yyyzz*M_yzz + &
      D_yyzz*M_zz)
    L_yyz      = D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyzz*M_yz + D_yyz*M_0 &
      + (1.0d0/120.0d0)*(D_xxxxxyyz*M_xxxxx + D_yyyyyyyz*M_yyyyy + &
      D_yyzzzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyyyyz*M_xxxyy + &
      D_xxxyyzzz*M_xxxzz + D_xxyyyyyz*M_xxyyy + D_xxyyzzzz*M_xxzzz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyzzzz*M_yyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyyyz*M_xxyy + D_xxyyyyzz*M_xxyyz + D_xxyyyzzz*M_xxyzz + &
      D_xxyyzzz*M_xxzz + D_xyyyyzzz*M_xyyzz + D_yyyyzzz*M_yyzz) + ( &
      1.0d0/24.0d0)*(D_xxxxyyyz*M_xxxxy + D_xxxxyyz*M_xxxx + D_xxxxyyzz &
      *M_xxxxz + D_xyyyyyyz*M_xyyyy + D_xyyzzzzz*M_xzzzz + D_yyyyyyz* &
      M_yyyy + D_yyyyyyzz*M_yyyyz + D_yyyzzzzz*M_yzzzz + D_yyzzzzz* &
      M_zzzz) + (1.0d0/6.0d0)*(D_xxxyyyz*M_xxxy + D_xxxyyyzz*M_xxxyz + &
      D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + D_xyyyyyz*M_xyyy + D_xyyyyyzz &
      *M_xyyyz + D_xyyyzzzz*M_xyzzz + D_xyyzzzz*M_xzzz + D_yyyyyz*M_yyy &
      + D_yyyyyzz*M_yyyz + D_yyyzzzz*M_yzzz + D_yyzzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyz*M_xx + &
      D_xxyyzz*M_xxz + D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyzzz* &
      M_xyzz + D_xyyzzz*M_xzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + &
      D_yyyzzz*M_yzz + D_yyzzz*M_zz)
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = (1.0d0/8.0d0)*D_xxyyyzz*M_xxyyzz + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz* &
      M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/5040.0d0)*(D_xxxxxxxy* &
      M_xxxxxxx + D_yyyyyyyy*M_yyyyyyy + D_yzzzzzzz*M_zzzzzzz) + (1.0d0 &
      /240.0d0)*(D_xxxxxyyy*M_xxxxxyy + D_xxxxxyzz*M_xxxxxzz + &
      D_xxyyyyyy*M_xxyyyyy + D_xxyzzzzz*M_xxzzzzz + D_yyyyyyzz* &
      M_yyyyyzz + D_yyyzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxyyyy* &
      M_xxxxyyy + D_xxxxyzzz*M_xxxxzzz + D_xxxyyyyy*M_xxxyyyy + &
      D_xxxyzzzz*M_xxxzzzz + D_yyyyyzzz*M_yyyyzzz + D_yyyyzzzz* &
      M_yyyzzzz) + (1.0d0/36.0d0)*(D_xxxyyyy*M_xxxyyy + D_xxxyyyyz* &
      M_xxxyyyz + D_xxxyyzzz*M_xxxyzzz + D_xxxyzzz*M_xxxzzz + &
      D_xyyyyzzz*M_xyyyzzz + D_yyyyzzz*M_yyyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyy*M_xxyy + D_xxyyyz*M_xxyyz + D_xxyyzz*M_xxyzz + D_xxyzz* &
      M_xxzz + D_xyyyzz*M_xyyzz + D_yyyzz*M_yyzz) + (1.0d0/720.0d0)*( &
      D_xxxxxxy*M_xxxxxx + D_xxxxxxyy*M_xxxxxxy + D_xxxxxxyz*M_xxxxxxz &
      + D_xyyyyyyy*M_xyyyyyy + D_xyzzzzzz*M_xzzzzzz + D_yyyyyyy* &
      M_yyyyyy + D_yyyyyyyz*M_yyyyyyz + D_yyzzzzzz*M_yzzzzzz + &
      D_yzzzzzz*M_zzzzzz) + (1.0d0/120.0d0)*(D_xxxxxy*M_xxxxx + &
      D_xxxxxyy*M_xxxxxy + D_xxxxxyyz*M_xxxxxyz + D_xxxxxyz*M_xxxxxz + &
      D_xyyyyyy*M_xyyyyy + D_xyyyyyyz*M_xyyyyyz + D_xyyzzzzz*M_xyzzzzz &
      + D_xyzzzzz*M_xzzzzz + D_yyyyyy*M_yyyyy + D_yyyyyyz*M_yyyyyz + &
      D_yyzzzzz*M_yzzzzz + D_yzzzzz*M_zzzzz) + (1.0d0/48.0d0)*( &
      D_xxxxyyy*M_xxxxyy + D_xxxxyyyz*M_xxxxyyz + D_xxxxyyzz*M_xxxxyzz &
      + D_xxxxyzz*M_xxxxzz + D_xxyyyyy*M_xxyyyy + D_xxyyyyyz*M_xxyyyyz &
      + D_xxyyzzzz*M_xxyzzzz + D_xxyzzzz*M_xxzzzz + D_xyyyyyzz* &
      M_xyyyyzz + D_xyyyzzzz*M_xyyzzzz + D_yyyyyzz*M_yyyyzz + D_yyyzzzz &
      *M_yyzzzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + D_xxxyy*M_xxxy + &
      D_xxxyyz*M_xxxyz + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + D_xyyyyz* &
      M_xyyyz + D_xyyzzz*M_xyzzz + D_xyzzz*M_xzzz + D_yyyy*M_yyy + &
      D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) + (1.0d0/12.0d0)* &
      (D_xxxyyy*M_xxxyy + D_xxxyyyz*M_xxxyyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyzz*M_xxxzz + D_xxyyyy*M_xxyyy + D_xxyyyyz*M_xxyyyz + &
      D_xxyyzzz*M_xxyzzz + D_xxyzzz*M_xxzzz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyzzz*M_xyyzzz + D_yyyyzz*M_yyyzz + D_yyyzzz*M_yyzzz) + ( &
      1.0d0/2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + D_xxyz &
      *M_xxz + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + D_xyzz* &
      M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz*M_zz) + &
      (1.0d0/24.0d0)*(D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyyz* &
      M_xxxxyz + D_xxxxyz*M_xxxxz + D_xxxyyyzz*M_xxxyyzz + D_xxyyyyzz* &
      M_xxyyyzz + D_xxyyyzzz*M_xxyyzzz + D_xyyyyy*M_xyyyy + D_xyyyyyz* &
      M_xyyyyz + D_xyyzzzz*M_xyzzzz + D_xyzzzz*M_xzzzz + D_yyyyy*M_yyyy &
      + D_yyyyyz*M_yyyyz + D_yyzzzz*M_yzzzz + D_yzzzz*M_zzzz)
    L_yz       = (1.0d0/8.0d0)*D_xxyyyzzz*M_xxyyzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz &
      *M_xz + D_yyzz*M_yz + D_yz*M_0 + (1.0d0/720.0d0)*(D_xxxxxxyz* &
      M_xxxxxx + D_yyyyyyyz*M_yyyyyy + D_yzzzzzzz*M_zzzzzz) + (1.0d0/ &
      36.0d0)*(D_xxxyyyyz*M_xxxyyy + D_xxxyzzzz*M_xxxzzz + D_yyyyzzzz* &
      M_yyyzzz) + (1.0d0/48.0d0)*(D_xxxxyyyz*M_xxxxyy + D_xxxxyzzz* &
      M_xxxxzz + D_xxyyyyyz*M_xxyyyy + D_xxyzzzzz*M_xxzzzz + D_yyyyyzzz &
      *M_yyyyzz + D_yyyzzzzz*M_yyzzzz) + (1.0d0/4.0d0)*(D_xxyyyz*M_xxyy &
      + D_xxyyyzz*M_xxyyz + D_xxyyzzz*M_xxyzz + D_xxyzzz*M_xxzz + &
      D_xyyyzzz*M_xyyzz + D_yyyzzz*M_yyzz) + (1.0d0/120.0d0)*( &
      D_xxxxxyyz*M_xxxxxy + D_xxxxxyz*M_xxxxx + D_xxxxxyzz*M_xxxxxz + &
      D_xyyyyyyz*M_xyyyyy + D_xyzzzzzz*M_xzzzzz + D_yyyyyyz*M_yyyyy + &
      D_yyyyyyzz*M_yyyyyz + D_yyzzzzzz*M_yzzzzz + D_yzzzzzz*M_zzzzz) + &
      (1.0d0/24.0d0)*(D_xxxxyyz*M_xxxxy + D_xxxxyyzz*M_xxxxyz + &
      D_xxxxyz*M_xxxx + D_xxxxyzz*M_xxxxz + D_xyyyyyz*M_xyyyy + &
      D_xyyyyyzz*M_xyyyyz + D_xyyzzzzz*M_xyzzzz + D_xyzzzzz*M_xzzzz + &
      D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + D_yyzzzzz*M_yzzzz + &
      D_yzzzzz*M_zzzz) + (1.0d0/12.0d0)*(D_xxxyyyz*M_xxxyy + D_xxxyyyzz &
      *M_xxxyyz + D_xxxyyzzz*M_xxxyzz + D_xxxyzzz*M_xxxzz + D_xxyyyyz* &
      M_xxyyy + D_xxyyyyzz*M_xxyyyz + D_xxyyzzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxzzz + D_xyyyyzzz*M_xyyyzz + D_xyyyzzzz*M_xyyzzz + D_yyyyzzz* &
      M_yyyzz + D_yyyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxyyz*M_xxxy + &
      D_xxxyyzz*M_xxxyz + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xyyyyz* &
      M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyzzzz*M_xyzzz + D_xyzzzz*M_xzzz &
      + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyzzzz*M_yzzz + D_yzzzz* &
      M_zzz) + (1.0d0/2.0d0)*(D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz* &
      M_xx + D_xxyzz*M_xxz + D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyzzz &
      *M_xyzz + D_xyzzz*M_xzz + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz* &
      M_yzz + D_yzzz*M_zz)
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_z        = (1.0d0/8.0d0)*D_xxyyzzz*M_xxyyzz + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/5040.0d0)*(D_xxxxxxxz* &
      M_xxxxxxx + D_yyyyyyyz*M_yyyyyyy + D_zzzzzzzz*M_zzzzzzz) + (1.0d0 &
      /240.0d0)*(D_xxxxxyyz*M_xxxxxyy + D_xxxxxzzz*M_xxxxxzz + &
      D_xxyyyyyz*M_xxyyyyy + D_xxzzzzzz*M_xxzzzzz + D_yyyyyzzz* &
      M_yyyyyzz + D_yyzzzzzz*M_yyzzzzz) + (1.0d0/144.0d0)*(D_xxxxyyyz* &
      M_xxxxyyy + D_xxxxzzzz*M_xxxxzzz + D_xxxyyyyz*M_xxxyyyy + &
      D_xxxzzzzz*M_xxxzzzz + D_yyyyzzzz*M_yyyyzzz + D_yyyzzzzz* &
      M_yyyzzzz) + (1.0d0/36.0d0)*(D_xxxyyyz*M_xxxyyy + D_xxxyyyzz* &
      M_xxxyyyz + D_xxxyzzzz*M_xxxyzzz + D_xxxzzzz*M_xxxzzz + &
      D_xyyyzzzz*M_xyyyzzz + D_yyyzzzz*M_yyyzzz) + (1.0d0/4.0d0)*( &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyzzz*M_xxyzz + D_xxzzz* &
      M_xxzz + D_xyyzzz*M_xyyzz + D_yyzzz*M_yyzz) + (1.0d0/720.0d0)*( &
      D_xxxxxxyz*M_xxxxxxy + D_xxxxxxz*M_xxxxxx + D_xxxxxxzz*M_xxxxxxz &
      + D_xyyyyyyz*M_xyyyyyy + D_xzzzzzzz*M_xzzzzzz + D_yyyyyyz* &
      M_yyyyyy + D_yyyyyyzz*M_yyyyyyz + D_yzzzzzzz*M_yzzzzzz + &
      D_zzzzzzz*M_zzzzzz) + (1.0d0/120.0d0)*(D_xxxxxyz*M_xxxxxy + &
      D_xxxxxyzz*M_xxxxxyz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + &
      D_xyyyyyz*M_xyyyyy + D_xyyyyyzz*M_xyyyyyz + D_xyzzzzzz*M_xyzzzzz &
      + D_xzzzzzz*M_xzzzzz + D_yyyyyz*M_yyyyy + D_yyyyyzz*M_yyyyyz + &
      D_yzzzzzz*M_yzzzzz + D_zzzzzz*M_zzzzz) + (1.0d0/48.0d0)*( &
      D_xxxxyyz*M_xxxxyy + D_xxxxyyzz*M_xxxxyyz + D_xxxxyzzz*M_xxxxyzz &
      + D_xxxxzzz*M_xxxxzz + D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz &
      + D_xxyzzzzz*M_xxyzzzz + D_xxzzzzz*M_xxzzzz + D_xyyyyzzz* &
      M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz + D_yyyyzzz*M_yyyyzz + D_yyzzzzz &
      *M_yyzzzz) + (1.0d0/12.0d0)*(D_xxxyyz*M_xxxyy + D_xxxyyzz* &
      M_xxxyyz + D_xxxyzzz*M_xxxyzz + D_xxxzzz*M_xxxzz + D_xxyyyz* &
      M_xxyyy + D_xxyyyzz*M_xxyyyz + D_xxyzzzz*M_xxyzzz + D_xxzzzz* &
      M_xxzzz + D_xyyyzzz*M_xyyyzz + D_xyyzzzz*M_xyyzzz + D_yyyzzz* &
      M_yyyzz + D_yyzzzz*M_yyzzz) + (1.0d0/6.0d0)*(D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy &
      + D_xyyyzz*M_xyyyz + D_xyzzzz*M_xyzzz + D_xzzzz*M_xzzz + D_yyyz* &
      M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + D_xxzz*M_xxz &
      + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz*M_xyzz + D_xzzz*M_xzz + &
      D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz*M_zz) + (1.0d0/ &
      24.0d0)*(D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + D_xxxxz*M_xxxx + &
      D_xxxxzz*M_xxxxz + D_xxxyyzzz*M_xxxyyzz + D_xxyyyzzz*M_xxyyyzz + &
      D_xxyyzzzz*M_xxyyzzz + D_xyyyyz*M_xyyyy + D_xyyyyzz*M_xyyyyz + &
      D_xyzzzzz*M_xyzzzz + D_xzzzzz*M_xzzzz + D_yyyyz*M_yyyy + D_yyyyzz &
      *M_yyyyz + D_yzzzzz*M_yzzzz + D_zzzzz*M_zzzz)
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
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  L_xxx               
#undef  M_xxz               
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
#undef  L_xxxxyy            
#undef  M_xxxyyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
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
    end subroutine mom_es_M2L2
    
! OPS  357*ADD + 39*DIV + 756*MUL + 84*NEG + 504*POW = 1740  (2165 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz,&
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
                L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
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
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
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
    L_xxxxxyzz = -(L_xxxxxxxy + L_xxxxxyyy)
    L_xxxxxzzz = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz = -(L_xxxxxxyy + L_xxxxyyyy)
    L_xxxxyzzz = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz = -(L_xxxxxyyy + L_xxxyyyyy)
    L_xxxyyzzz = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz = -(L_xxxxyyyy + L_xxyyyyyy)
    L_xxyyyzzz = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz = -(L_xxxyyyyy + L_xyyyyyyy)
    L_xyyyyzzz = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz = -(L_xxxzzzzz + L_xyyzzzzz)
    Phi_x      = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxx*x**7 + L_xyyyyyyy*y**7 + L_xzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxxyy*x**5*y**2 + L_xxxxxxzz*x**5*z**2 + &
      L_xxxyyyyy*x**2*y**5 + L_xxxzzzzz*x**2*z**5 + L_xyyyyyzz*y**5*z** &
      2 + L_xyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxxyyy*x**4*y**3 &
      + L_xxxxxzzz*x**4*z**3 + L_xxxxyyyy*x**3*y**4 + L_xxxxzzzz*x**3*z &
      **4 + L_xyyyyzzz*y**4*z**3 + L_xyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxyyyz*x**3*y**3*z + &
      L_xxxxyzzz*x**3*y*z**3 + L_xxxxzzz*x**3*z**3 + L_xxyyyzzz*x*y**3* &
      z**3 + L_xyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxx*x**6 + L_xxxxxxxy*x**6*y + L_xxxxxxxz*x**6*z + &
      L_xxyyyyyy*x*y**6 + L_xxzzzzzz*x*z**6 + L_xyyyyyy*y**6 + &
      L_xyyyyyyz*y**6*z + L_xyzzzzzz*y*z**6 + L_xzzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/120.0d0)* &
      (L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxyz*x**5*y*z + &
      L_xxxxxxz*x**5*z + L_xxyyyyy*x*y**5 + L_xxyyyyyz*x*y**5*z + &
      L_xxyzzzzz*x*y*z**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxxyy*x**4*y**2 + L_xxxxxyyz*x**4*y**2*z + &
      L_xxxxxyzz*x**4*y*z**2 + L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y** &
      4 + L_xxxyyyyz*x**2*y**4*z + L_xxxyzzzz*x**2*y*z**4 + L_xxxzzzz*x &
      **2*z**4 + L_xxyyyyzz*x*y**4*z**2 + L_xxyyzzzz*x*y**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
      L_xxxxyy*x**3*y**2 + L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z** &
      2 + L_xxxxzz*x**3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3 &
      *z + L_xxxyzzz*x**2*y*z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y** &
      3*z**2 + L_xxyyzzz*x*y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y &
      **2*z**3) + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xxxxxy*x**4*y + &
      L_xxxxxyz*x**4*y*z + L_xxxxxz*x**4*z + L_xxxxyyzz*x**3*y**2*z**2 &
      + L_xxxyyyzz*x**2*y**3*z**2 + L_xxxyyzzz*x**2*y**2*z**3 + &
      L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 + &
      L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z** &
      4 + L_xzzzz*z**4)
    L_yyyyyyzz = -(L_xxyyyyyy + L_yyyyyyyy)
    L_yyyyyzzz = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz = -(L_xxyzzzzz + L_yyyzzzzz)
    Phi_y      = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxy*x**7 + L_yyyyyyyy*y**7 + L_yzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyy*x**5*y**2 + L_xxxxxyzz*x**5*z**2 + &
      L_xxyyyyyy*x**2*y**5 + L_xxyzzzzz*x**2*z**5 + L_yyyyyyzz*y**5*z** &
      2 + L_yyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyy*x**4*y**3 &
      + L_xxxxyzzz*x**4*z**3 + L_xxxyyyyy*x**3*y**4 + L_xxxyzzzz*x**3*z &
      **4 + L_yyyyyzzz*y**4*z**3 + L_yyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyyyyz*x**3*y**3*z + &
      L_xxxyyzzz*x**3*y*z**3 + L_xxxyzzz*x**3*z**3 + L_xyyyyzzz*x*y**3* &
      z**3 + L_yyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxy*x**6 + L_xxxxxxyy*x**6*y + L_xxxxxxyz*x**6*z + &
      L_xyyyyyyy*x*y**6 + L_xyzzzzzz*x*z**6 + L_yyyyyyy*y**6 + &
      L_yyyyyyyz*y**6*z + L_yyzzzzzz*y*z**6 + L_yzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyyz*x**5*y*z &
      + L_xxxxxyz*x**5*z + L_xyyyyyy*x*y**5 + L_xyyyyyyz*x*y**5*z + &
      L_xyyzzzzz*x*y*z**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + &
      L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x* &
      y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz* &
      y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y &
      + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y &
      **2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y &
      **2*z + L_yyzz*y*z**2 + L_yzz*z**2) + (1.0d0/48.0d0)*(L_xxxxyyy*x &
      **4*y**2 + L_xxxxyyyz*x**4*y**2*z + L_xxxxyyzz*x**4*y*z**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyyyyyz*x**2*y**4* &
      z + L_xxyyzzzz*x**2*y*z**4 + L_xxyzzzz*x**2*z**4 + L_xyyyyyzz*x*y &
      **4*z**2 + L_xyyyzzzz*x*y**2*z**4 + L_yyyyyzz*y**4*z**2 + &
      L_yyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xxxyyyzz*x**3*y**2*z**2 + L_xxyyyyzz*x**2*y** &
      3*z**2 + L_xxyyyzzz*x**2*y**2*z**3 + L_xyyyyy*x*y**4 + L_xyyyyyz* &
      x*y**4*z + L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + &
      L_yyyyyz*y**4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4)
    L_zzzzzzzz = -(L_xxzzzzzz + L_yyzzzzzz)
    Phi_z      = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxz*x**7 + L_yyyyyyyz*y**7 + L_zzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyz*x**5*y**2 + L_xxxxxzzz*x**5*z**2 + &
      L_xxyyyyyz*x**2*y**5 + L_xxzzzzzz*x**2*z**5 + L_yyyyyzzz*y**5*z** &
      2 + L_yyzzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyz*x**4*y**3 &
      + L_xxxxzzzz*x**4*z**3 + L_xxxyyyyz*x**3*y**4 + L_xxxzzzzz*x**3*z &
      **4 + L_yyyyzzzz*y**4*z**3 + L_yyyzzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxyyyzz*x**3*y**3*z + &
      L_xxxyzzzz*x**3*y*z**3 + L_xxxzzzz*x**3*z**3 + L_xyyyzzzz*x*y**3* &
      z**3 + L_yyyzzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxyz*x**6*y + L_xxxxxxz*x**6 + L_xxxxxxzz*x**6*z + &
      L_xyyyyyyz*x*y**6 + L_xzzzzzzz*x*z**6 + L_yyyyyyz*y**6 + &
      L_yyyyyyzz*y**6*z + L_yzzzzzzz*y*z**6 + L_zzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxyzz*x**5*y*z + L_xxxxxz*x**5 &
      + L_xxxxxzz*x**5*z + L_xyyyyyz*x*y**5 + L_xyyyyyzz*x*y**5*z + &
      L_xyzzzzzz*x*y*z**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxyyz*x**4*y**2 + L_xxxxyyzz*x**4*y**2*z + &
      L_xxxxyzzz*x**4*y*z**2 + L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y** &
      4 + L_xxyyyyzz*x**2*y**4*z + L_xxyzzzzz*x**2*y*z**4 + L_xxzzzzz*x &
      **2*z**4 + L_xyyyyzzz*x*y**4*z**2 + L_xyyzzzzz*x*y**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
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
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + L_xxxxzz*x &
      **4*z + L_xxxyyzzz*x**3*y**2*z**2 + L_xxyyyzzz*x**2*y**3*z**2 + &
      L_xxyyzzzz*x**2*y**2*z**3 + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z &
      + L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz* &
      y**4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4)
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
    end subroutine mom_es_L2P2
    
! OPS  1834*ADD + 202*DIV + 3402*MUL + 84*NEG + 1890*POW = 7412  (8804 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz,&
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
                L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Ls_x                 Ls(1:2,0)
#define x                    r(1:2,1)
#define Ls_y                 Ls(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define Ls_z                 Ls(1:2,2)
#define L_xx                 L(1:2,3)
#define Ls_xx                Ls(1:2,3)
#define Ls_xy                Ls(1:2,4)
#define L_xy                 L(1:2,4)
#define Ls_xz                Ls(1:2,5)
#define L_xz                 L(1:2,5)
#define L_yy                 L(1:2,6)
#define Ls_yy                Ls(1:2,6)
#define Ls_yz                Ls(1:2,7)
#define L_yz                 L(1:2,7)
#define Ls_xxx               Ls(1:2,8)
#define L_xxx                L(1:2,8)
#define Ls_xxy               Ls(1:2,9)
#define L_xxy                L(1:2,9)
#define Ls_xxz               Ls(1:2,10)
#define L_xxz                L(1:2,10)
#define Ls_xyy               Ls(1:2,11)
#define L_xyy                L(1:2,11)
#define Ls_xyz               Ls(1:2,12)
#define L_xyz                L(1:2,12)
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
#define L_xxyyy              L(1:2,29)
#define Ls_xxyyy             Ls(1:2,29)
#define L_xxyyz              L(1:2,30)
#define Ls_xxyyz             Ls(1:2,30)
#define Ls_xyyyy             Ls(1:2,31)
#define L_xyyyy              L(1:2,31)
#define Ls_xyyyz             Ls(1:2,32)
#define L_xyyyz              L(1:2,32)
#define L_yyyyy              L(1:2,33)
#define Ls_yyyyy             Ls(1:2,33)
#define L_yyyyz              L(1:2,34)
#define Ls_yyyyz             Ls(1:2,34)
#define Ls_xxxxxx            Ls(1:2,35)
#define L_xxxxxx             L(1:2,35)
#define L_xxxxxy             L(1:2,36)
#define Ls_xxxxxy            Ls(1:2,36)
#define Ls_xxxxxz            Ls(1:2,37)
#define L_xxxxxz             L(1:2,37)
#define Ls_xxxxyy            Ls(1:2,38)
#define L_xxxxyy             L(1:2,38)
#define Ls_xxxxyz            Ls(1:2,39)
#define L_xxxxyz             L(1:2,39)
#define Ls_xxxyyy            Ls(1:2,40)
#define L_xxxyyy             L(1:2,40)
#define L_xxxyyz             L(1:2,41)
#define Ls_xxxyyz            Ls(1:2,41)
#define Ls_xxyyyy            Ls(1:2,42)
#define L_xxyyyy             L(1:2,42)
#define Ls_xxyyyz            Ls(1:2,43)
#define L_xxyyyz             L(1:2,43)
#define L_xyyyyy             L(1:2,44)
#define Ls_xyyyyy            Ls(1:2,44)
#define L_xyyyyz             L(1:2,45)
#define Ls_xyyyyz            Ls(1:2,45)
#define L_yyyyyy             L(1:2,46)
#define Ls_yyyyyy            Ls(1:2,46)
#define Ls_yyyyyz            Ls(1:2,47)
#define L_yyyyyz             L(1:2,47)
#define Ls_xxxxxxx           Ls(1:2,48)
#define L_xxxxxxx            L(1:2,48)
#define Ls_xxxxxxy           Ls(1:2,49)
#define L_xxxxxxy            L(1:2,49)
#define Ls_xxxxxxz           Ls(1:2,50)
#define L_xxxxxxz            L(1:2,50)
#define Ls_xxxxxyy           Ls(1:2,51)
#define L_xxxxxyy            L(1:2,51)
#define Ls_xxxxxyz           Ls(1:2,52)
#define L_xxxxxyz            L(1:2,52)
#define Ls_xxxxyyy           Ls(1:2,53)
#define L_xxxxyyy            L(1:2,53)
#define Ls_xxxxyyz           Ls(1:2,54)
#define L_xxxxyyz            L(1:2,54)
#define L_xxxyyyy            L(1:2,55)
#define Ls_xxxyyyy           Ls(1:2,55)
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
#define Ls_yyyyyyz           Ls(1:2,62)
#define L_yyyyyyz            L(1:2,62)
#define L_xxxxxxxx           L(1:2,63)
#define Ls_xxxxxxxx          Ls(1:2,63)
#define Ls_xxxxxxxy          Ls(1:2,64)
#define L_xxxxxxxy           L(1:2,64)
#define Ls_xxxxxxxz          Ls(1:2,65)
#define L_xxxxxxxz           L(1:2,65)
#define Ls_xxxxxxyy          Ls(1:2,66)
#define L_xxxxxxyy           L(1:2,66)
#define Ls_xxxxxxyz          Ls(1:2,67)
#define L_xxxxxxyz           L(1:2,67)
#define Ls_xxxxxyyy          Ls(1:2,68)
#define L_xxxxxyyy           L(1:2,68)
#define L_xxxxxyyz           L(1:2,69)
#define Ls_xxxxxyyz          Ls(1:2,69)
#define Ls_xxxxyyyy          Ls(1:2,70)
#define L_xxxxyyyy           L(1:2,70)
#define L_xxxxyyyz           L(1:2,71)
#define Ls_xxxxyyyz          Ls(1:2,71)
#define Ls_xxxyyyyy          Ls(1:2,72)
#define L_xxxyyyyy           L(1:2,72)
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
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    Ls_xxxxxxx  = L_xxxxxxx + L_xxxxxxxx*x + L_xxxxxxxy*y + L_xxxxxxxz*z
    Ls_xxxxxxy  = L_xxxxxxxy*x + L_xxxxxxy + L_xxxxxxyy*y + L_xxxxxxyz*z
    Ls_xxxxxyy  = L_xxxxxxyy*x + L_xxxxxyy + L_xxxxxyyy*y + L_xxxxxyyz*z
    Ls_xxxxyyy  = L_xxxxxyyy*x + L_xxxxyyy + L_xxxxyyyy*y + L_xxxxyyyz*z
    Ls_xxxyyyy  = L_xxxxyyyy*x + L_xxxyyyy + L_xxxyyyyy*y + L_xxxyyyyz*z
    Ls_xxyyyyy  = L_xxxyyyyy*x + L_xxyyyyy + L_xxyyyyyy*y + L_xxyyyyyz*z
    Ls_xyyyyyy  = L_xxyyyyyy*x + L_xyyyyyy + L_xyyyyyyy*y + L_xyyyyyyz*z
    Ls_yyyyyyy  = L_xyyyyyyy*x + L_yyyyyyy + L_yyyyyyyy*y + L_yyyyyyyz*z
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
    Ls_xxxxxx   = L_xxxxxx + L_xxxxxxx*x + L_xxxxxxxy*x*y + L_xxxxxxxz*x*z + L_xxxxxxy*y + &
      L_xxxxxxyz*y*z + L_xxxxxxz*z + (1.0d0/2.0d0)*(L_xxxxxxxx*x**2 + &
      L_xxxxxxyy*y**2 + L_xxxxxxzz*z**2)
    Ls_xxxxxxz  = L_xxxxxxxz*x + L_xxxxxxyz*y + L_xxxxxxz + L_xxxxxxzz*z
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    Ls_xxxxxy   = L_xxxxxxy*x + L_xxxxxxyy*x*y + L_xxxxxxyz*x*z + L_xxxxxy + L_xxxxxyy*y + &
      L_xxxxxyyz*y*z + L_xxxxxyz*z + (1.0d0/2.0d0)*(L_xxxxxxxy*x**2 + &
      L_xxxxxyyy*y**2 + L_xxxxxyzz*z**2)
    Ls_xxxxxyz  = L_xxxxxxyz*x + L_xxxxxyyz*y + L_xxxxxyz + L_xxxxxyzz*z
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    Ls_xxxxx    = L_xxxxx + L_xxxxxx*x + L_xxxxxxy*x*y + L_xxxxxxyz*x*y*z + L_xxxxxxz*x*z &
      + L_xxxxxy*y + L_xxxxxyz*y*z + L_xxxxxz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxx*x**3 + L_xxxxxyyy*y**3 + L_xxxxxzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxx*x**2 + L_xxxxxxxy*x**2*y + L_xxxxxxxz*x**2*z + &
      L_xxxxxxyy*x*y**2 + L_xxxxxxzz*x*z**2 + L_xxxxxyy*y**2 + &
      L_xxxxxyyz*y**2*z + L_xxxxxyzz*y*z**2 + L_xxxxxzz*z**2)
    Ls_xxxxxz   = L_xxxxxxyz*x*y + L_xxxxxxz*x + L_xxxxxxzz*x*z + L_xxxxxyz*y + L_xxxxxyzz &
      *y*z + L_xxxxxz + L_xxxxxzz*z + (1.0d0/2.0d0)*(L_xxxxxxxz*x**2 + &
      L_xxxxxyyz*y**2 + L_xxxxxzzz*z**2)
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    Ls_xxxxyy   = L_xxxxxyy*x + L_xxxxxyyy*x*y + L_xxxxxyyz*x*z + L_xxxxyy + L_xxxxyyy*y + &
      L_xxxxyyyz*y*z + L_xxxxyyz*z + (1.0d0/2.0d0)*(L_xxxxxxyy*x**2 + &
      L_xxxxyyyy*y**2 + L_xxxxyyzz*z**2)
    Ls_xxxxyyz  = L_xxxxxyyz*x + L_xxxxyyyz*y + L_xxxxyyz + L_xxxxyyzz*z
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    Ls_xxxxy    = L_xxxxxy*x + L_xxxxxyy*x*y + L_xxxxxyyz*x*y*z + L_xxxxxyz*x*z + L_xxxxy &
      + L_xxxxyy*y + L_xxxxyyz*y*z + L_xxxxyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxy*x**3 + L_xxxxyyyy*y**3 + L_xxxxyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxy*x**2 + L_xxxxxxyy*x**2*y + L_xxxxxxyz*x**2*z + &
      L_xxxxxyyy*x*y**2 + L_xxxxxyzz*x*z**2 + L_xxxxyyy*y**2 + &
      L_xxxxyyyz*y**2*z + L_xxxxyyzz*y*z**2 + L_xxxxyzz*z**2)
    Ls_xxxxyz   = L_xxxxxyyz*x*y + L_xxxxxyz*x + L_xxxxxyzz*x*z + L_xxxxyyz*y + L_xxxxyyzz &
      *y*z + L_xxxxyz + L_xxxxyzz*z + (1.0d0/2.0d0)*(L_xxxxxxyz*x**2 + &
      L_xxxxyyyz*y**2 + L_xxxxyzzz*z**2)
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    Ls_xxxx     = L_xxxx + L_xxxxx*x + L_xxxxxy*x*y + L_xxxxxyz*x*y*z + L_xxxxxz*x*z + &
      L_xxxxy*y + L_xxxxyz*y*z + L_xxxxz*z + (1.0d0/24.0d0)*(L_xxxxxxxx &
      *x**4 + L_xxxxyyyy*y**4 + L_xxxxzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxxyy*x**2*y**2 + L_xxxxxxzz*x**2*z**2 + L_xxxxyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxx*x**3 + L_xxxxxxxy*x**3*y + &
      L_xxxxxxxz*x**3*z + L_xxxxxyyy*x*y**3 + L_xxxxxzzz*x*z**3 + &
      L_xxxxyyy*y**3 + L_xxxxyyyz*y**3*z + L_xxxxyzzz*y*z**3 + &
      L_xxxxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxx*x**2 + L_xxxxxxy*x**2*y &
      + L_xxxxxxyz*x**2*y*z + L_xxxxxxz*x**2*z + L_xxxxxyy*x*y**2 + &
      L_xxxxxyyz*x*y**2*z + L_xxxxxyzz*x*y*z**2 + L_xxxxxzz*x*z**2 + &
      L_xxxxyy*y**2 + L_xxxxyyz*y**2*z + L_xxxxyzz*y*z**2 + L_xxxxzz*z &
      **2)
    Ls_xxxxz    = L_xxxxxyz*x*y + L_xxxxxyzz*x*y*z + L_xxxxxz*x + L_xxxxxzz*x*z + L_xxxxyz &
      *y + L_xxxxyzz*y*z + L_xxxxz + L_xxxxzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxxz*x**3 + L_xxxxyyyz*y**3 + L_xxxxzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxxyz*x**2*y + L_xxxxxxz*x**2 + L_xxxxxxzz*x**2*z + &
      L_xxxxxyyz*x*y**2 + L_xxxxxzzz*x*z**2 + L_xxxxyyz*y**2 + &
      L_xxxxyyzz*y**2*z + L_xxxxyzzz*y*z**2 + L_xxxxzzz*z**2)
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    Ls_xxxyyy   = L_xxxxyyy*x + L_xxxxyyyy*x*y + L_xxxxyyyz*x*z + L_xxxyyy + L_xxxyyyy*y + &
      L_xxxyyyyz*y*z + L_xxxyyyz*z + (1.0d0/2.0d0)*(L_xxxxxyyy*x**2 + &
      L_xxxyyyyy*y**2 + L_xxxyyyzz*z**2)
    Ls_xxxyyyz  = L_xxxxyyyz*x + L_xxxyyyyz*y + L_xxxyyyz + L_xxxyyyzz*z
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    Ls_xxxyy    = L_xxxxyy*x + L_xxxxyyy*x*y + L_xxxxyyyz*x*y*z + L_xxxxyyz*x*z + L_xxxyy &
      + L_xxxyyy*y + L_xxxyyyz*y*z + L_xxxyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxyy*x**3 + L_xxxyyyyy*y**3 + L_xxxyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxyy*x**2 + L_xxxxxyyy*x**2*y + L_xxxxxyyz*x**2*z + &
      L_xxxxyyyy*x*y**2 + L_xxxxyyzz*x*z**2 + L_xxxyyyy*y**2 + &
      L_xxxyyyyz*y**2*z + L_xxxyyyzz*y*z**2 + L_xxxyyzz*z**2)
    Ls_xxxyyz   = L_xxxxyyyz*x*y + L_xxxxyyz*x + L_xxxxyyzz*x*z + L_xxxyyyz*y + L_xxxyyyzz &
      *y*z + L_xxxyyz + L_xxxyyzz*z + (1.0d0/2.0d0)*(L_xxxxxyyz*x**2 + &
      L_xxxyyyyz*y**2 + L_xxxyyzzz*z**2)
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    Ls_xxxy     = L_xxxxy*x + L_xxxxyy*x*y + L_xxxxyyz*x*y*z + L_xxxxyz*x*z + L_xxxy + &
      L_xxxyy*y + L_xxxyyz*y*z + L_xxxyz*z + (1.0d0/24.0d0)*(L_xxxxxxxy &
      *x**4 + L_xxxyyyyy*y**4 + L_xxxyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxyyy*x**2*y**2 + L_xxxxxyzz*x**2*z**2 + L_xxxyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxy*x**3 + L_xxxxxxyy*x**3*y + &
      L_xxxxxxyz*x**3*z + L_xxxxyyyy*x*y**3 + L_xxxxyzzz*x*z**3 + &
      L_xxxyyyy*y**3 + L_xxxyyyyz*y**3*z + L_xxxyyzzz*y*z**3 + &
      L_xxxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxy*x**2 + L_xxxxxyy*x**2*y &
      + L_xxxxxyyz*x**2*y*z + L_xxxxxyz*x**2*z + L_xxxxyyy*x*y**2 + &
      L_xxxxyyyz*x*y**2*z + L_xxxxyyzz*x*y*z**2 + L_xxxxyzz*x*z**2 + &
      L_xxxyyy*y**2 + L_xxxyyyz*y**2*z + L_xxxyyzz*y*z**2 + L_xxxyzz*z &
      **2)
    Ls_xxxyz    = L_xxxxyyz*x*y + L_xxxxyyzz*x*y*z + L_xxxxyz*x + L_xxxxyzz*x*z + L_xxxyyz &
      *y + L_xxxyyzz*y*z + L_xxxyz + L_xxxyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxxyz*x**3 + L_xxxyyyyz*y**3 + L_xxxyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxxyyz*x**2*y + L_xxxxxyz*x**2 + L_xxxxxyzz*x**2*z + &
      L_xxxxyyyz*x*y**2 + L_xxxxyzzz*x*z**2 + L_xxxyyyz*y**2 + &
      L_xxxyyyzz*y**2*z + L_xxxyyzzz*y*z**2 + L_xxxyzzz*z**2)
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    Ls_xxx      = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxyz*x*y*z + L_xxxxz*x*z + L_xxxy*y &
      + L_xxxyz*y*z + L_xxxz*z + (1.0d0/120.0d0)*(L_xxxxxxxx*x**5 + &
      L_xxxyyyyy*y**5 + L_xxxzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxxyy*x &
      **3*y**2 + L_xxxxxxzz*x**3*z**2 + L_xxxxxyyy*x**2*y**3 + &
      L_xxxxxzzz*x**2*z**3 + L_xxxyyyzz*y**3*z**2 + L_xxxyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxxyy*x**2*y**2 + L_xxxxxyyz*x**2*y**2*z &
      + L_xxxxxyzz*x**2*y*z**2 + L_xxxxxzz*x**2*z**2 + L_xxxxyyzz*x*y** &
      2*z**2 + L_xxxyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxx*x**4 + &
      L_xxxxxxxy*x**4*y + L_xxxxxxxz*x**4*z + L_xxxxyyyy*x*y**4 + &
      L_xxxxzzzz*x*z**4 + L_xxxyyyy*y**4 + L_xxxyyyyz*y**4*z + &
      L_xxxyzzzz*y*z**4 + L_xxxzzzz*z**4) + (1.0d0/2.0d0)*(L_xxxxx*x**2 &
      + L_xxxxxy*x**2*y + L_xxxxxyz*x**2*y*z + L_xxxxxz*x**2*z + &
      L_xxxxyy*x*y**2 + L_xxxxyyz*x*y**2*z + L_xxxxyzz*x*y*z**2 + &
      L_xxxxzz*x*z**2 + L_xxxyy*y**2 + L_xxxyyz*y**2*z + L_xxxyzz*y*z** &
      2 + L_xxxzz*z**2) + (1.0d0/6.0d0)*(L_xxxxxx*x**3 + L_xxxxxxy*x**3 &
      *y + L_xxxxxxyz*x**3*y*z + L_xxxxxxz*x**3*z + L_xxxxyyy*x*y**3 + &
      L_xxxxyyyz*x*y**3*z + L_xxxxyzzz*x*y*z**3 + L_xxxxzzz*x*z**3 + &
      L_xxxyyy*y**3 + L_xxxyyyz*y**3*z + L_xxxyzzz*y*z**3 + L_xxxzzz*z &
      **3)
    Ls_xxxz     = L_xxxxyz*x*y + L_xxxxyzz*x*y*z + L_xxxxz*x + L_xxxxzz*x*z + L_xxxyz*y + &
      L_xxxyzz*y*z + L_xxxz + L_xxxzz*z + (1.0d0/24.0d0)*(L_xxxxxxxz*x &
      **4 + L_xxxyyyyz*y**4 + L_xxxzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxxyyz*x**2*y**2 + L_xxxxxzzz*x**2*z**2 + L_xxxyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxxyz*x**3*y + L_xxxxxxz*x**3 + &
      L_xxxxxxzz*x**3*z + L_xxxxyyyz*x*y**3 + L_xxxxzzzz*x*z**3 + &
      L_xxxyyyz*y**3 + L_xxxyyyzz*y**3*z + L_xxxyzzzz*y*z**3 + &
      L_xxxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxxyz*x**2*y + L_xxxxxyzz*x &
      **2*y*z + L_xxxxxz*x**2 + L_xxxxxzz*x**2*z + L_xxxxyyz*x*y**2 + &
      L_xxxxyyzz*x*y**2*z + L_xxxxyzzz*x*y*z**2 + L_xxxxzzz*x*z**2 + &
      L_xxxyyz*y**2 + L_xxxyyzz*y**2*z + L_xxxyzzz*y*z**2 + L_xxxzzz*z &
      **2)
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    Ls_xxyyyy   = L_xxxyyyy*x + L_xxxyyyyy*x*y + L_xxxyyyyz*x*z + L_xxyyyy + L_xxyyyyy*y + &
      L_xxyyyyyz*y*z + L_xxyyyyz*z + (1.0d0/2.0d0)*(L_xxxxyyyy*x**2 + &
      L_xxyyyyyy*y**2 + L_xxyyyyzz*z**2)
    Ls_xxyyyyz  = L_xxxyyyyz*x + L_xxyyyyyz*y + L_xxyyyyz + L_xxyyyyzz*z
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    Ls_xxyyy    = L_xxxyyy*x + L_xxxyyyy*x*y + L_xxxyyyyz*x*y*z + L_xxxyyyz*x*z + L_xxyyy &
      + L_xxyyyy*y + L_xxyyyyz*y*z + L_xxyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxxyyy*x**3 + L_xxyyyyyy*y**3 + L_xxyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxyyy*x**2 + L_xxxxyyyy*x**2*y + L_xxxxyyyz*x**2*z + &
      L_xxxyyyyy*x*y**2 + L_xxxyyyzz*x*z**2 + L_xxyyyyy*y**2 + &
      L_xxyyyyyz*y**2*z + L_xxyyyyzz*y*z**2 + L_xxyyyzz*z**2)
    Ls_xxyyyz   = L_xxxyyyyz*x*y + L_xxxyyyz*x + L_xxxyyyzz*x*z + L_xxyyyyz*y + L_xxyyyyzz &
      *y*z + L_xxyyyz + L_xxyyyzz*z + (1.0d0/2.0d0)*(L_xxxxyyyz*x**2 + &
      L_xxyyyyyz*y**2 + L_xxyyyzzz*z**2)
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    Ls_xxyy     = L_xxxyy*x + L_xxxyyy*x*y + L_xxxyyyz*x*y*z + L_xxxyyz*x*z + L_xxyy + &
      L_xxyyy*y + L_xxyyyz*y*z + L_xxyyz*z + (1.0d0/24.0d0)*(L_xxxxxxyy &
      *x**4 + L_xxyyyyyy*y**4 + L_xxyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxyyyy*x**2*y**2 + L_xxxxyyzz*x**2*z**2 + L_xxyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxyy*x**3 + L_xxxxxyyy*x**3*y + &
      L_xxxxxyyz*x**3*z + L_xxxyyyyy*x*y**3 + L_xxxyyzzz*x*z**3 + &
      L_xxyyyyy*y**3 + L_xxyyyyyz*y**3*z + L_xxyyyzzz*y*z**3 + &
      L_xxyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyy*x**2 + L_xxxxyyy*x**2*y &
      + L_xxxxyyyz*x**2*y*z + L_xxxxyyz*x**2*z + L_xxxyyyy*x*y**2 + &
      L_xxxyyyyz*x*y**2*z + L_xxxyyyzz*x*y*z**2 + L_xxxyyzz*x*z**2 + &
      L_xxyyyy*y**2 + L_xxyyyyz*y**2*z + L_xxyyyzz*y*z**2 + L_xxyyzz*z &
      **2)
    Ls_xxyyz    = L_xxxyyyz*x*y + L_xxxyyyzz*x*y*z + L_xxxyyz*x + L_xxxyyzz*x*z + L_xxyyyz &
      *y + L_xxyyyzz*y*z + L_xxyyz + L_xxyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxxyyz*x**3 + L_xxyyyyyz*y**3 + L_xxyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxxyyyz*x**2*y + L_xxxxyyz*x**2 + L_xxxxyyzz*x**2*z + &
      L_xxxyyyyz*x*y**2 + L_xxxyyzzz*x*z**2 + L_xxyyyyz*y**2 + &
      L_xxyyyyzz*y**2*z + L_xxyyyzzz*y*z**2 + L_xxyyzzz*z**2)
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    Ls_xxy      = L_xxxy*x + L_xxxyy*x*y + L_xxxyyz*x*y*z + L_xxxyz*x*z + L_xxy + L_xxyy*y &
      + L_xxyyz*y*z + L_xxyz*z + (1.0d0/120.0d0)*(L_xxxxxxxy*x**5 + &
      L_xxyyyyyy*y**5 + L_xxyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyyy*x &
      **3*y**2 + L_xxxxxyzz*x**3*z**2 + L_xxxxyyyy*x**2*y**3 + &
      L_xxxxyzzz*x**2*z**3 + L_xxyyyyzz*y**3*z**2 + L_xxyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxyyy*x**2*y**2 + L_xxxxyyyz*x**2*y**2*z &
      + L_xxxxyyzz*x**2*y*z**2 + L_xxxxyzz*x**2*z**2 + L_xxxyyyzz*x*y** &
      2*z**2 + L_xxyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxy*x**4 + &
      L_xxxxxxyy*x**4*y + L_xxxxxxyz*x**4*z + L_xxxyyyyy*x*y**4 + &
      L_xxxyzzzz*x*z**4 + L_xxyyyyy*y**4 + L_xxyyyyyz*y**4*z + &
      L_xxyyzzzz*y*z**4 + L_xxyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxxy*x** &
      3 + L_xxxxxyy*x**3*y + L_xxxxxyyz*x**3*y*z + L_xxxxxyz*x**3*z + &
      L_xxxyyyy*x*y**3 + L_xxxyyyyz*x*y**3*z + L_xxxyyzzz*x*y*z**3 + &
      L_xxxyzzz*x*z**3 + L_xxyyyy*y**3 + L_xxyyyyz*y**3*z + L_xxyyzzz*y &
      *z**3 + L_xxyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxy*x**2 + L_xxxxyy*x &
      **2*y + L_xxxxyyz*x**2*y*z + L_xxxxyz*x**2*z + L_xxxyyy*x*y**2 + &
      L_xxxyyyz*x*y**2*z + L_xxxyyzz*x*y*z**2 + L_xxxyzz*x*z**2 + &
      L_xxyyy*y**2 + L_xxyyyz*y**2*z + L_xxyyzz*y*z**2 + L_xxyzz*z**2)
    Ls_xxyz     = L_xxxyyz*x*y + L_xxxyyzz*x*y*z + L_xxxyz*x + L_xxxyzz*x*z + L_xxyyz*y + &
      L_xxyyzz*y*z + L_xxyz + L_xxyzz*z + (1.0d0/24.0d0)*(L_xxxxxxyz*x &
      **4 + L_xxyyyyyz*y**4 + L_xxyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxxyyyz*x**2*y**2 + L_xxxxyzzz*x**2*z**2 + L_xxyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxxyyz*x**3*y + L_xxxxxyz*x**3 + &
      L_xxxxxyzz*x**3*z + L_xxxyyyyz*x*y**3 + L_xxxyzzzz*x*z**3 + &
      L_xxyyyyz*y**3 + L_xxyyyyzz*y**3*z + L_xxyyzzzz*y*z**3 + &
      L_xxyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyyz*x**2*y + L_xxxxyyzz*x &
      **2*y*z + L_xxxxyz*x**2 + L_xxxxyzz*x**2*z + L_xxxyyyz*x*y**2 + &
      L_xxxyyyzz*x*y**2*z + L_xxxyyzzz*x*y*z**2 + L_xxxyzzz*x*z**2 + &
      L_xxyyyz*y**2 + L_xxyyyzz*y**2*z + L_xxyyzzz*y*z**2 + L_xxyzzz*z &
      **2)
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    Ls_xx       = L_xx + L_xxx*x + (1.0d0/8.0d0)*L_xxxxyyzz*x**2*y**2*z**2 + L_xxxy*x*y + &
      L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxx*x**6 + L_xxyyyyyy*y**6 + L_xxzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxxyyy*x**3*y**3 + L_xxxxxzzz*x**3*z** &
      3 + L_xxyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxxyy*x**4*y**2 &
      + L_xxxxxxzz*x**4*z**2 + L_xxxxyyyy*x**2*y**4 + L_xxxxzzzz*x**2*z &
      **4 + L_xxyyyyzz*y**4*z**2 + L_xxyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxxyy*x**2*y**2 + L_xxxxyyz*x**2*y**2*z + L_xxxxyzz*x**2*y* &
      z**2 + L_xxxxzz*x**2*z**2 + L_xxxyyzz*x*y**2*z**2 + L_xxyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxx*x**5 + L_xxxxxxxy*x**5*y + &
      L_xxxxxxxz*x**5*z + L_xxxyyyyy*x*y**5 + L_xxxzzzzz*x*z**5 + &
      L_xxyyyyy*y**5 + L_xxyyyyyz*y**5*z + L_xxyzzzzz*y*z**5 + &
      L_xxzzzzz*z**5) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxyz*x**2*y*z + L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxyyz*x* &
      y**2*z + L_xxxyzz*x*y*z**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2) + (1.0d0/6.0d0)*( &
      L_xxxxx*x**3 + L_xxxxxy*x**3*y + L_xxxxxyz*x**3*y*z + L_xxxxxz*x &
      **3*z + L_xxxyyy*x*y**3 + L_xxxyyyz*x*y**3*z + L_xxxyzzz*x*y*z**3 &
      + L_xxxzzz*x*z**3 + L_xxyyy*y**3 + L_xxyyyz*y**3*z + L_xxyzzz*y*z &
      **3 + L_xxzzz*z**3) + (1.0d0/24.0d0)*(L_xxxxxx*x**4 + L_xxxxxxy*x &
      **4*y + L_xxxxxxyz*x**4*y*z + L_xxxxxxz*x**4*z + L_xxxyyyy*x*y**4 &
      + L_xxxyyyyz*x*y**4*z + L_xxxyzzzz*x*y*z**4 + L_xxxzzzz*x*z**4 + &
      L_xxyyyy*y**4 + L_xxyyyyz*y**4*z + L_xxyzzzz*y*z**4 + L_xxzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxxxyy*x**3*y**2 + L_xxxxxyyz*x**3*y**2 &
      *z + L_xxxxxyzz*x**3*y*z**2 + L_xxxxxzz*x**3*z**2 + L_xxxxyyy*x** &
      2*y**3 + L_xxxxyyyz*x**2*y**3*z + L_xxxxyzzz*x**2*y*z**3 + &
      L_xxxxzzz*x**2*z**3 + L_xxxyyyzz*x*y**3*z**2 + L_xxxyyzzz*x*y**2* &
      z**3 + L_xxyyyzz*y**3*z**2 + L_xxyyzzz*y**2*z**3)
    Ls_xxz      = L_xxxyz*x*y + L_xxxyzz*x*y*z + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + &
      L_xxyzz*y*z + L_xxz + L_xxzz*z + (1.0d0/120.0d0)*(L_xxxxxxxz*x**5 &
      + L_xxyyyyyz*y**5 + L_xxzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxxyyz &
      *x**3*y**2 + L_xxxxxzzz*x**3*z**2 + L_xxxxyyyz*x**2*y**3 + &
      L_xxxxzzzz*x**2*z**3 + L_xxyyyzzz*y**3*z**2 + L_xxyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxxyyz*x**2*y**2 + L_xxxxyyzz*x**2*y**2*z &
      + L_xxxxyzzz*x**2*y*z**2 + L_xxxxzzz*x**2*z**2 + L_xxxyyzzz*x*y** &
      2*z**2 + L_xxyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxxyz*x**4*y &
      + L_xxxxxxz*x**4 + L_xxxxxxzz*x**4*z + L_xxxyyyyz*x*y**4 + &
      L_xxxzzzzz*x*z**4 + L_xxyyyyz*y**4 + L_xxyyyyzz*y**4*z + &
      L_xxyzzzzz*y*z**4 + L_xxzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxxyz*x &
      **3*y + L_xxxxxyzz*x**3*y*z + L_xxxxxz*x**3 + L_xxxxxzz*x**3*z + &
      L_xxxyyyz*x*y**3 + L_xxxyyyzz*x*y**3*z + L_xxxyzzzz*x*y*z**3 + &
      L_xxxzzzz*x*z**3 + L_xxyyyz*y**3 + L_xxyyyzz*y**3*z + L_xxyzzzz*y &
      *z**3 + L_xxzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxxyz*x**2*y + &
      L_xxxxyzz*x**2*y*z + L_xxxxz*x**2 + L_xxxxzz*x**2*z + L_xxxyyz*x* &
      y**2 + L_xxxyyzz*x*y**2*z + L_xxxyzzz*x*y*z**2 + L_xxxzzz*x*z**2 &
      + L_xxyyz*y**2 + L_xxyyzz*y**2*z + L_xxyzzz*y*z**2 + L_xxzzz*z**2 &
      )
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    Ls_xyyyyy   = L_xxyyyyy*x + L_xxyyyyyy*x*y + L_xxyyyyyz*x*z + L_xyyyyy + L_xyyyyyy*y + &
      L_xyyyyyyz*y*z + L_xyyyyyz*z + (1.0d0/2.0d0)*(L_xxxyyyyy*x**2 + &
      L_xyyyyyyy*y**2 + L_xyyyyyzz*z**2)
    Ls_xyyyyyz  = L_xxyyyyyz*x + L_xyyyyyyz*y + L_xyyyyyz + L_xyyyyyzz*z
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    Ls_xyyyy    = L_xxyyyy*x + L_xxyyyyy*x*y + L_xxyyyyyz*x*y*z + L_xxyyyyz*x*z + L_xyyyy &
      + L_xyyyyy*y + L_xyyyyyz*y*z + L_xyyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxxyyyy*x**3 + L_xyyyyyyy*y**3 + L_xyyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxyyyy*x**2 + L_xxxyyyyy*x**2*y + L_xxxyyyyz*x**2*z + &
      L_xxyyyyyy*x*y**2 + L_xxyyyyzz*x*z**2 + L_xyyyyyy*y**2 + &
      L_xyyyyyyz*y**2*z + L_xyyyyyzz*y*z**2 + L_xyyyyzz*z**2)
    Ls_xyyyyz   = L_xxyyyyyz*x*y + L_xxyyyyz*x + L_xxyyyyzz*x*z + L_xyyyyyz*y + L_xyyyyyzz &
      *y*z + L_xyyyyz + L_xyyyyzz*z + (1.0d0/2.0d0)*(L_xxxyyyyz*x**2 + &
      L_xyyyyyyz*y**2 + L_xyyyyzzz*z**2)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    Ls_xyyy     = L_xxyyy*x + L_xxyyyy*x*y + L_xxyyyyz*x*y*z + L_xxyyyz*x*z + L_xyyy + &
      L_xyyyy*y + L_xyyyyz*y*z + L_xyyyz*z + (1.0d0/24.0d0)*(L_xxxxxyyy &
      *x**4 + L_xyyyyyyy*y**4 + L_xyyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyyyyy*x**2*y**2 + L_xxxyyyzz*x**2*z**2 + L_xyyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxyyy*x**3 + L_xxxxyyyy*x**3*y + &
      L_xxxxyyyz*x**3*z + L_xxyyyyyy*x*y**3 + L_xxyyyzzz*x*z**3 + &
      L_xyyyyyy*y**3 + L_xyyyyyyz*y**3*z + L_xyyyyzzz*y*z**3 + &
      L_xyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyy*x**2 + L_xxxyyyy*x**2*y &
      + L_xxxyyyyz*x**2*y*z + L_xxxyyyz*x**2*z + L_xxyyyyy*x*y**2 + &
      L_xxyyyyyz*x*y**2*z + L_xxyyyyzz*x*y*z**2 + L_xxyyyzz*x*z**2 + &
      L_xyyyyy*y**2 + L_xyyyyyz*y**2*z + L_xyyyyzz*y*z**2 + L_xyyyzz*z &
      **2)
    Ls_xyyyz    = L_xxyyyyz*x*y + L_xxyyyyzz*x*y*z + L_xxyyyz*x + L_xxyyyzz*x*z + L_xyyyyz &
      *y + L_xyyyyzz*y*z + L_xyyyz + L_xyyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxxyyyz*x**3 + L_xyyyyyyz*y**3 + L_xyyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxxyyyyz*x**2*y + L_xxxyyyz*x**2 + L_xxxyyyzz*x**2*z + &
      L_xxyyyyyz*x*y**2 + L_xxyyyzzz*x*z**2 + L_xyyyyyz*y**2 + &
      L_xyyyyyzz*y**2*z + L_xyyyyzzz*y*z**2 + L_xyyyzzz*z**2)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    Ls_xyy      = L_xxyy*x + L_xxyyy*x*y + L_xxyyyz*x*y*z + L_xxyyz*x*z + L_xyy + L_xyyy*y &
      + L_xyyyz*y*z + L_xyyz*z + (1.0d0/120.0d0)*(L_xxxxxxyy*x**5 + &
      L_xyyyyyyy*y**5 + L_xyyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyyy*x &
      **3*y**2 + L_xxxxyyzz*x**3*z**2 + L_xxxyyyyy*x**2*y**3 + &
      L_xxxyyzzz*x**2*z**3 + L_xyyyyyzz*y**3*z**2 + L_xyyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxyyyy*x**2*y**2 + L_xxxyyyyz*x**2*y**2*z &
      + L_xxxyyyzz*x**2*y*z**2 + L_xxxyyzz*x**2*z**2 + L_xxyyyyzz*x*y** &
      2*z**2 + L_xyyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxyy*x**4 + &
      L_xxxxxyyy*x**4*y + L_xxxxxyyz*x**4*z + L_xxyyyyyy*x*y**4 + &
      L_xxyyzzzz*x*z**4 + L_xyyyyyy*y**4 + L_xyyyyyyz*y**4*z + &
      L_xyyyzzzz*y*z**4 + L_xyyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxyy*x** &
      3 + L_xxxxyyy*x**3*y + L_xxxxyyyz*x**3*y*z + L_xxxxyyz*x**3*z + &
      L_xxyyyyy*x*y**3 + L_xxyyyyyz*x*y**3*z + L_xxyyyzzz*x*y*z**3 + &
      L_xxyyzzz*x*z**3 + L_xyyyyy*y**3 + L_xyyyyyz*y**3*z + L_xyyyzzz*y &
      *z**3 + L_xyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyy*x**2 + L_xxxyyy*x &
      **2*y + L_xxxyyyz*x**2*y*z + L_xxxyyz*x**2*z + L_xxyyyy*x*y**2 + &
      L_xxyyyyz*x*y**2*z + L_xxyyyzz*x*y*z**2 + L_xxyyzz*x*z**2 + &
      L_xyyyy*y**2 + L_xyyyyz*y**2*z + L_xyyyzz*y*z**2 + L_xyyzz*z**2)
    Ls_xyyz     = L_xxyyyz*x*y + L_xxyyyzz*x*y*z + L_xxyyz*x + L_xxyyzz*x*z + L_xyyyz*y + &
      L_xyyyzz*y*z + L_xyyz + L_xyyzz*z + (1.0d0/24.0d0)*(L_xxxxxyyz*x &
      **4 + L_xyyyyyyz*y**4 + L_xyyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxxyyyyz*x**2*y**2 + L_xxxyyzzz*x**2*z**2 + L_xyyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxxyyyz*x**3*y + L_xxxxyyz*x**3 + &
      L_xxxxyyzz*x**3*z + L_xxyyyyyz*x*y**3 + L_xxyyzzzz*x*z**3 + &
      L_xyyyyyz*y**3 + L_xyyyyyzz*y**3*z + L_xyyyzzzz*y*z**3 + &
      L_xyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyyz*x**2*y + L_xxxyyyzz*x &
      **2*y*z + L_xxxyyz*x**2 + L_xxxyyzz*x**2*z + L_xxyyyyz*x*y**2 + &
      L_xxyyyyzz*x*y**2*z + L_xxyyyzzz*x*y*z**2 + L_xxyyzzz*x*z**2 + &
      L_xyyyyz*y**2 + L_xyyyyzz*y**2*z + L_xyyyzzz*y*z**2 + L_xyyzzz*z &
      **2)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    Ls_xy       = (1.0d0/8.0d0)*L_xxxyyyzz*x**2*y**2*z**2 + L_xxy*x + L_xxyy*x*y + L_xxyyz &
      *x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxy*x**6 + L_xyyyyyyy*y**6 + L_xyzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxyyyy*x**3*y**3 + L_xxxxyzzz*x**3*z** &
      3 + L_xyyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyyy*x**4*y**2 &
      + L_xxxxxyzz*x**4*z**2 + L_xxxyyyyy*x**2*y**4 + L_xxxyzzzz*x**2*z &
      **4 + L_xyyyyyzz*y**4*z**2 + L_xyyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxyyy*x**2*y**2 + L_xxxyyyz*x**2*y**2*z + L_xxxyyzz*x**2*y* &
      z**2 + L_xxxyzz*x**2*z**2 + L_xxyyyzz*x*y**2*z**2 + L_xyyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxy*x**5 + L_xxxxxxyy*x**5*y + &
      L_xxxxxxyz*x**5*z + L_xxyyyyyy*x*y**5 + L_xxyzzzzz*x*z**5 + &
      L_xyyyyyy*y**5 + L_xyyyyyyz*y**5*z + L_xyyzzzzz*y*z**5 + &
      L_xyzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxxy*x**4 + L_xxxxxyy*x**4* &
      y + L_xxxxxyyz*x**4*y*z + L_xxxxxyz*x**4*z + L_xxyyyyy*x*y**4 + &
      L_xxyyyyyz*x*y**4*z + L_xxyyzzzz*x*y*z**4 + L_xxyzzzz*x*z**4 + &
      L_xyyyyy*y**4 + L_xyyyyyz*y**4*z + L_xyyzzzz*y*z**4 + L_xyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xxxxyy*x**3*y + L_xxxxyyz* &
      x**3*y*z + L_xxxxyz*x**3*z + L_xxyyyy*x*y**3 + L_xxyyyyz*x*y**3*z &
      + L_xxyyzzz*x*y*z**3 + L_xxyzzz*x*z**3 + L_xyyyy*y**3 + L_xyyyyz* &
      y**3*z + L_xyyzzz*y*z**3 + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy* &
      x**2 + L_xxxyy*x**2*y + L_xxxyyz*x**2*y*z + L_xxxyz*x**2*z + &
      L_xxyyy*x*y**2 + L_xxyyyz*x*y**2*z + L_xxyyzz*x*y*z**2 + L_xxyzz* &
      x*z**2 + L_xyyy*y**2 + L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z &
      **2) + (1.0d0/12.0d0)*(L_xxxxyyy*x**3*y**2 + L_xxxxyyyz*x**3*y**2 &
      *z + L_xxxxyyzz*x**3*y*z**2 + L_xxxxyzz*x**3*z**2 + L_xxxyyyy*x** &
      2*y**3 + L_xxxyyyyz*x**2*y**3*z + L_xxxyyzzz*x**2*y*z**3 + &
      L_xxxyzzz*x**2*z**3 + L_xxyyyyzz*x*y**3*z**2 + L_xxyyyzzz*x*y**2* &
      z**3 + L_xyyyyzz*y**3*z**2 + L_xyyyzzz*y**2*z**3)
    Ls_xyz      = L_xxyyz*x*y + L_xxyyzz*x*y*z + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + &
      L_xyyzz*y*z + L_xyz + L_xyzz*z + (1.0d0/120.0d0)*(L_xxxxxxyz*x**5 &
      + L_xyyyyyyz*y**5 + L_xyzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxxyyyz &
      *x**3*y**2 + L_xxxxyzzz*x**3*z**2 + L_xxxyyyyz*x**2*y**3 + &
      L_xxxyzzzz*x**2*z**3 + L_xyyyyzzz*y**3*z**2 + L_xyyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxxyyyz*x**2*y**2 + L_xxxyyyzz*x**2*y**2*z &
      + L_xxxyyzzz*x**2*y*z**2 + L_xxxyzzz*x**2*z**2 + L_xxyyyzzz*x*y** &
      2*z**2 + L_xyyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxxyyz*x**4*y &
      + L_xxxxxyz*x**4 + L_xxxxxyzz*x**4*z + L_xxyyyyyz*x*y**4 + &
      L_xxyzzzzz*x*z**4 + L_xyyyyyz*y**4 + L_xyyyyyzz*y**4*z + &
      L_xyyzzzzz*y*z**4 + L_xyzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxxyyz*x &
      **3*y + L_xxxxyyzz*x**3*y*z + L_xxxxyz*x**3 + L_xxxxyzz*x**3*z + &
      L_xxyyyyz*x*y**3 + L_xxyyyyzz*x*y**3*z + L_xxyyzzzz*x*y*z**3 + &
      L_xxyzzzz*x*z**3 + L_xyyyyz*y**3 + L_xyyyyzz*y**3*z + L_xyyzzzz*y &
      *z**3 + L_xyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyyz*x**2*y + &
      L_xxxyyzz*x**2*y*z + L_xxxyz*x**2 + L_xxxyzz*x**2*z + L_xxyyyz*x* &
      y**2 + L_xxyyyzz*x*y**2*z + L_xxyyzzz*x*y*z**2 + L_xxyzzz*x*z**2 &
      + L_xyyyz*y**2 + L_xyyyzz*y**2*z + L_xyyzzz*y*z**2 + L_xyzzz*z**2 &
      )
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    Ls_x        = L_x + L_xx*x + (1.0d0/8.0d0)*L_xxxyyzz*x**2*y**2*z**2 + L_xxy*x*y + &
      L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxx*x**7 + L_xyyyyyyy*y**7 + L_xzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxxyy*x**5*y**2 + L_xxxxxxzz*x**5*z**2 + &
      L_xxxyyyyy*x**2*y**5 + L_xxxzzzzz*x**2*z**5 + L_xyyyyyzz*y**5*z** &
      2 + L_xyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxxyyy*x**4*y**3 &
      + L_xxxxxzzz*x**4*z**3 + L_xxxxyyyy*x**3*y**4 + L_xxxxzzzz*x**3*z &
      **4 + L_xyyyyzzz*y**4*z**3 + L_xyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxxyyy*x**3*y**3 + L_xxxxyyyz*x**3*y**3*z + &
      L_xxxxyzzz*x**3*y*z**3 + L_xxxxzzz*x**3*z**3 + L_xxyyyzzz*x*y**3* &
      z**3 + L_xyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + &
      L_xxxyyz*x**2*y**2*z + L_xxxyzz*x**2*y*z**2 + L_xxxzz*x**2*z**2 + &
      L_xxyyzz*x*y**2*z**2 + L_xyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxx*x**6 + L_xxxxxxxy*x**6*y + L_xxxxxxxz*x**6*z + &
      L_xxyyyyyy*x*y**6 + L_xxzzzzzz*x*z**6 + L_xyyyyyy*y**6 + &
      L_xyyyyyyz*y**6*z + L_xyzzzzzz*y*z**6 + L_xzzzzzz*z**6) + (1.0d0/ &
      2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x &
      **2*z + L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + &
      L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + &
      L_xzz*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y + &
      L_xxxxyz*x**3*y*z + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxyyyz*x* &
      y**3*z + L_xxyzzz*x*y*z**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 + &
      L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/120.0d0)* &
      (L_xxxxxx*x**5 + L_xxxxxxy*x**5*y + L_xxxxxxyz*x**5*y*z + &
      L_xxxxxxz*x**5*z + L_xxyyyyy*x*y**5 + L_xxyyyyyz*x*y**5*z + &
      L_xxyzzzzz*x*y*z**5 + L_xxzzzzz*x*z**5 + L_xyyyyy*y**5 + &
      L_xyyyyyz*y**5*z + L_xyzzzzz*y*z**5 + L_xzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxxyy*x**4*y**2 + L_xxxxxyyz*x**4*y**2*z + &
      L_xxxxxyzz*x**4*y*z**2 + L_xxxxxzz*x**4*z**2 + L_xxxyyyy*x**2*y** &
      4 + L_xxxyyyyz*x**2*y**4*z + L_xxxyzzzz*x**2*y*z**4 + L_xxxzzzz*x &
      **2*z**4 + L_xxyyyyzz*x*y**4*z**2 + L_xxyyzzzz*x*y**2*z**4 + &
      L_xyyyyzz*y**4*z**2 + L_xyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
      L_xxxxyy*x**3*y**2 + L_xxxxyyz*x**3*y**2*z + L_xxxxyzz*x**3*y*z** &
      2 + L_xxxxzz*x**3*z**2 + L_xxxyyy*x**2*y**3 + L_xxxyyyz*x**2*y**3 &
      *z + L_xxxyzzz*x**2*y*z**3 + L_xxxzzz*x**2*z**3 + L_xxyyyzz*x*y** &
      3*z**2 + L_xxyyzzz*x*y**2*z**3 + L_xyyyzz*y**3*z**2 + L_xyyzzz*y &
      **2*z**3) + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xxxxxy*x**4*y + &
      L_xxxxxyz*x**4*y*z + L_xxxxxz*x**4*z + L_xxxxyyzz*x**3*y**2*z**2 &
      + L_xxxyyyzz*x**2*y**3*z**2 + L_xxxyyzzz*x**2*y**2*z**3 + &
      L_xxyyyy*x*y**4 + L_xxyyyyz*x*y**4*z + L_xxyzzzz*x*y*z**4 + &
      L_xxzzzz*x*z**4 + L_xyyyy*y**4 + L_xyyyyz*y**4*z + L_xyzzzz*y*z** &
      4 + L_xzzzz*z**4)
    Ls_xz       = (1.0d0/8.0d0)*L_xxxyyzzz*x**2*y**2*z**2 + L_xxyz*x*y + L_xxyzz*x*y*z + &
      L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxxz*x**6 + L_xyyyyyyz*y**6 + L_xzzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxxyyyz*x**3*y**3 + L_xxxxzzzz*x**3*z** &
      3 + L_xyyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxxyyz*x**4*y**2 &
      + L_xxxxxzzz*x**4*z**2 + L_xxxyyyyz*x**2*y**4 + L_xxxzzzzz*x**2*z &
      **4 + L_xyyyyzzz*y**4*z**2 + L_xyyzzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxxyyz*x**2*y**2 + L_xxxyyzz*x**2*y**2*z + L_xxxyzzz*x**2*y* &
      z**2 + L_xxxzzz*x**2*z**2 + L_xxyyzzz*x*y**2*z**2 + L_xyyzzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxxyz*x**5*y + L_xxxxxxz*x**5 + &
      L_xxxxxxzz*x**5*z + L_xxyyyyyz*x*y**5 + L_xxzzzzzz*x*z**5 + &
      L_xyyyyyz*y**5 + L_xyyyyyzz*y**5*z + L_xyzzzzzz*y*z**5 + &
      L_xzzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxxyz*x**4*y + L_xxxxxyzz*x &
      **4*y*z + L_xxxxxz*x**4 + L_xxxxxzz*x**4*z + L_xxyyyyz*x*y**4 + &
      L_xxyyyyzz*x*y**4*z + L_xxyzzzzz*x*y*z**4 + L_xxzzzzz*x*z**4 + &
      L_xyyyyz*y**4 + L_xyyyyzz*y**4*z + L_xyzzzzz*y*z**4 + L_xzzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxxyyz*x**3*y**2 + L_xxxxyyzz*x**3*y**2 &
      *z + L_xxxxyzzz*x**3*y*z**2 + L_xxxxzzz*x**3*z**2 + L_xxxyyyz*x** &
      2*y**3 + L_xxxyyyzz*x**2*y**3*z + L_xxxyzzzz*x**2*y*z**3 + &
      L_xxxzzzz*x**2*z**3 + L_xxyyyzzz*x*y**3*z**2 + L_xxyyzzzz*x*y**2* &
      z**3 + L_xyyyzzz*y**3*z**2 + L_xyyzzzz*y**2*z**3) + (1.0d0/6.0d0) &
      *(L_xxxxyz*x**3*y + L_xxxxyzz*x**3*y*z + L_xxxxz*x**3 + L_xxxxzz* &
      x**3*z + L_xxyyyz*x*y**3 + L_xxyyyzz*x*y**3*z + L_xxyzzzz*x*y*z** &
      3 + L_xxzzzz*x*z**3 + L_xyyyz*y**3 + L_xyyyzz*y**3*z + L_xyzzzz*y &
      *z**3 + L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxyzz* &
      x**2*y*z + L_xxxz*x**2 + L_xxxzz*x**2*z + L_xxyyz*x*y**2 + &
      L_xxyyzz*x*y**2*z + L_xxyzzz*x*y*z**2 + L_xxzzz*x*z**2 + L_xyyz*y &
      **2 + L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    Ls_yyyyyy   = L_xyyyyyy*x + L_xyyyyyyy*x*y + L_xyyyyyyz*x*z + L_yyyyyy + L_yyyyyyy*y + &
      L_yyyyyyyz*y*z + L_yyyyyyz*z + (1.0d0/2.0d0)*(L_xxyyyyyy*x**2 + &
      L_yyyyyyyy*y**2 + L_yyyyyyzz*z**2)
    Ls_yyyyyyz  = L_xyyyyyyz*x + L_yyyyyyyz*y + L_yyyyyyz + L_yyyyyyzz*z
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    Ls_yyyyy    = L_xyyyyy*x + L_xyyyyyy*x*y + L_xyyyyyyz*x*y*z + L_xyyyyyz*x*z + L_yyyyy &
      + L_yyyyyy*y + L_yyyyyyz*y*z + L_yyyyyz*z + (1.0d0/6.0d0)*( &
      L_xxxyyyyy*x**3 + L_yyyyyyyy*y**3 + L_yyyyyzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyyyyy*x**2 + L_xxyyyyyy*x**2*y + L_xxyyyyyz*x**2*z + &
      L_xyyyyyyy*x*y**2 + L_xyyyyyzz*x*z**2 + L_yyyyyyy*y**2 + &
      L_yyyyyyyz*y**2*z + L_yyyyyyzz*y*z**2 + L_yyyyyzz*z**2)
    Ls_yyyyyz   = L_xyyyyyyz*x*y + L_xyyyyyz*x + L_xyyyyyzz*x*z + L_yyyyyyz*y + L_yyyyyyzz &
      *y*z + L_yyyyyz + L_yyyyyzz*z + (1.0d0/2.0d0)*(L_xxyyyyyz*x**2 + &
      L_yyyyyyyz*y**2 + L_yyyyyzzz*z**2)
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    Ls_yyyy     = L_xyyyy*x + L_xyyyyy*x*y + L_xyyyyyz*x*y*z + L_xyyyyz*x*z + L_yyyy + &
      L_yyyyy*y + L_yyyyyz*y*z + L_yyyyz*z + (1.0d0/24.0d0)*(L_xxxxyyyy &
      *x**4 + L_yyyyyyyy*y**4 + L_yyyyzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyyyyy*x**2*y**2 + L_xxyyyyzz*x**2*z**2 + L_yyyyyyzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxyyyy*x**3 + L_xxxyyyyy*x**3*y + &
      L_xxxyyyyz*x**3*z + L_xyyyyyyy*x*y**3 + L_xyyyyzzz*x*z**3 + &
      L_yyyyyyy*y**3 + L_yyyyyyyz*y**3*z + L_yyyyyzzz*y*z**3 + &
      L_yyyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyy*x**2 + L_xxyyyyy*x**2*y &
      + L_xxyyyyyz*x**2*y*z + L_xxyyyyz*x**2*z + L_xyyyyyy*x*y**2 + &
      L_xyyyyyyz*x*y**2*z + L_xyyyyyzz*x*y*z**2 + L_xyyyyzz*x*z**2 + &
      L_yyyyyy*y**2 + L_yyyyyyz*y**2*z + L_yyyyyzz*y*z**2 + L_yyyyzz*z &
      **2)
    Ls_yyyyz    = L_xyyyyyz*x*y + L_xyyyyyzz*x*y*z + L_xyyyyz*x + L_xyyyyzz*x*z + L_yyyyyz &
      *y + L_yyyyyzz*y*z + L_yyyyz + L_yyyyzz*z + (1.0d0/6.0d0)*( &
      L_xxxyyyyz*x**3 + L_yyyyyyyz*y**3 + L_yyyyzzzz*z**3) + (1.0d0/ &
      2.0d0)*(L_xxyyyyyz*x**2*y + L_xxyyyyz*x**2 + L_xxyyyyzz*x**2*z + &
      L_xyyyyyyz*x*y**2 + L_xyyyyzzz*x*z**2 + L_yyyyyyz*y**2 + &
      L_yyyyyyzz*y**2*z + L_yyyyyzzz*y*z**2 + L_yyyyzzz*z**2)
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    Ls_yyy      = L_xyyy*x + L_xyyyy*x*y + L_xyyyyz*x*y*z + L_xyyyz*x*z + L_yyy + L_yyyy*y &
      + L_yyyyz*y*z + L_yyyz*z + (1.0d0/120.0d0)*(L_xxxxxyyy*x**5 + &
      L_yyyyyyyy*y**5 + L_yyyzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyyy*x &
      **3*y**2 + L_xxxyyyzz*x**3*z**2 + L_xxyyyyyy*x**2*y**3 + &
      L_xxyyyzzz*x**2*z**3 + L_yyyyyyzz*y**3*z**2 + L_yyyyyzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxyyyyy*x**2*y**2 + L_xxyyyyyz*x**2*y**2*z &
      + L_xxyyyyzz*x**2*y*z**2 + L_xxyyyzz*x**2*z**2 + L_xyyyyyzz*x*y** &
      2*z**2 + L_yyyyyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyyy*x**4 + &
      L_xxxxyyyy*x**4*y + L_xxxxyyyz*x**4*z + L_xyyyyyyy*x*y**4 + &
      L_xyyyzzzz*x*z**4 + L_yyyyyyy*y**4 + L_yyyyyyyz*y**4*z + &
      L_yyyyzzzz*y*z**4 + L_yyyzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyyy*x** &
      3 + L_xxxyyyy*x**3*y + L_xxxyyyyz*x**3*y*z + L_xxxyyyz*x**3*z + &
      L_xyyyyyy*x*y**3 + L_xyyyyyyz*x*y**3*z + L_xyyyyzzz*x*y*z**3 + &
      L_xyyyzzz*x*z**3 + L_yyyyyy*y**3 + L_yyyyyyz*y**3*z + L_yyyyzzz*y &
      *z**3 + L_yyyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyy*x**2 + L_xxyyyy*x &
      **2*y + L_xxyyyyz*x**2*y*z + L_xxyyyz*x**2*z + L_xyyyyy*x*y**2 + &
      L_xyyyyyz*x*y**2*z + L_xyyyyzz*x*y*z**2 + L_xyyyzz*x*z**2 + &
      L_yyyyy*y**2 + L_yyyyyz*y**2*z + L_yyyyzz*y*z**2 + L_yyyzz*z**2)
    Ls_yyyz     = L_xyyyyz*x*y + L_xyyyyzz*x*y*z + L_xyyyz*x + L_xyyyzz*x*z + L_yyyyz*y + &
      L_yyyyzz*y*z + L_yyyz + L_yyyzz*z + (1.0d0/24.0d0)*(L_xxxxyyyz*x &
      **4 + L_yyyyyyyz*y**4 + L_yyyzzzzz*z**4) + (1.0d0/4.0d0)*( &
      L_xxyyyyyz*x**2*y**2 + L_xxyyyzzz*x**2*z**2 + L_yyyyyzzz*y**2*z** &
      2) + (1.0d0/6.0d0)*(L_xxxyyyyz*x**3*y + L_xxxyyyz*x**3 + &
      L_xxxyyyzz*x**3*z + L_xyyyyyyz*x*y**3 + L_xyyyzzzz*x*z**3 + &
      L_yyyyyyz*y**3 + L_yyyyyyzz*y**3*z + L_yyyyzzzz*y*z**3 + &
      L_yyyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyyz*x**2*y + L_xxyyyyzz*x &
      **2*y*z + L_xxyyyz*x**2 + L_xxyyyzz*x**2*z + L_xyyyyyz*x*y**2 + &
      L_xyyyyyzz*x*y**2*z + L_xyyyyzzz*x*y*z**2 + L_xyyyzzz*x*z**2 + &
      L_yyyyyz*y**2 + L_yyyyyzz*y**2*z + L_yyyyzzz*y*z**2 + L_yyyzzz*z &
      **2)
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    Ls_yy       = (1.0d0/8.0d0)*L_xxyyyyzz*x**2*y**2*z**2 + L_xyy*x + L_xyyy*x*y + L_xyyyz &
      *x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxyy*x**6 + L_yyyyyyyy*y**6 + L_yyzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxyyyyy*x**3*y**3 + L_xxxyyzzz*x**3*z** &
      3 + L_yyyyyzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyyy*x**4*y**2 &
      + L_xxxxyyzz*x**4*z**2 + L_xxyyyyyy*x**2*y**4 + L_xxyyzzzz*x**2*z &
      **4 + L_yyyyyyzz*y**4*z**2 + L_yyyyzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxyyyy*x**2*y**2 + L_xxyyyyz*x**2*y**2*z + L_xxyyyzz*x**2*y* &
      z**2 + L_xxyyzz*x**2*z**2 + L_xyyyyzz*x*y**2*z**2 + L_yyyyzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxyy*x**5 + L_xxxxxyyy*x**5*y + &
      L_xxxxxyyz*x**5*z + L_xyyyyyyy*x*y**5 + L_xyyzzzzz*x*z**5 + &
      L_yyyyyyy*y**5 + L_yyyyyyyz*y**5*z + L_yyyzzzzz*y*z**5 + &
      L_yyzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxyy*x**4 + L_xxxxyyy*x**4* &
      y + L_xxxxyyyz*x**4*y*z + L_xxxxyyz*x**4*z + L_xyyyyyy*x*y**4 + &
      L_xyyyyyyz*x*y**4*z + L_xyyyzzzz*x*y*z**4 + L_xyyzzzz*x*z**4 + &
      L_yyyyyy*y**4 + L_yyyyyyz*y**4*z + L_yyyzzzz*y*z**4 + L_yyzzzz*z &
      **4) + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_xxxyyy*x**3*y + L_xxxyyyz* &
      x**3*y*z + L_xxxyyz*x**3*z + L_xyyyyy*x*y**3 + L_xyyyyyz*x*y**3*z &
      + L_xyyyzzz*x*y*z**3 + L_xyyzzz*x*z**3 + L_yyyyy*y**3 + L_yyyyyz* &
      y**3*z + L_yyyzzz*y*z**3 + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy* &
      x**2 + L_xxyyy*x**2*y + L_xxyyyz*x**2*y*z + L_xxyyz*x**2*z + &
      L_xyyyy*x*y**2 + L_xyyyyz*x*y**2*z + L_xyyyzz*x*y*z**2 + L_xyyzz* &
      x*z**2 + L_yyyy*y**2 + L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z &
      **2) + (1.0d0/12.0d0)*(L_xxxyyyy*x**3*y**2 + L_xxxyyyyz*x**3*y**2 &
      *z + L_xxxyyyzz*x**3*y*z**2 + L_xxxyyzz*x**3*z**2 + L_xxyyyyy*x** &
      2*y**3 + L_xxyyyyyz*x**2*y**3*z + L_xxyyyzzz*x**2*y*z**3 + &
      L_xxyyzzz*x**2*z**3 + L_xyyyyyzz*x*y**3*z**2 + L_xyyyyzzz*x*y**2* &
      z**3 + L_yyyyyzz*y**3*z**2 + L_yyyyzzz*y**2*z**3)
    Ls_yyz      = L_xyyyz*x*y + L_xyyyzz*x*y*z + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + &
      L_yyyzz*y*z + L_yyz + L_yyzz*z + (1.0d0/120.0d0)*(L_xxxxxyyz*x**5 &
      + L_yyyyyyyz*y**5 + L_yyzzzzzz*z**5) + (1.0d0/12.0d0)*(L_xxxyyyyz &
      *x**3*y**2 + L_xxxyyzzz*x**3*z**2 + L_xxyyyyyz*x**2*y**3 + &
      L_xxyyzzzz*x**2*z**3 + L_yyyyyzzz*y**3*z**2 + L_yyyyzzzz*y**2*z** &
      3) + (1.0d0/4.0d0)*(L_xxyyyyz*x**2*y**2 + L_xxyyyyzz*x**2*y**2*z &
      + L_xxyyyzzz*x**2*y*z**2 + L_xxyyzzz*x**2*z**2 + L_xyyyyzzz*x*y** &
      2*z**2 + L_yyyyzzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxxyyyz*x**4*y &
      + L_xxxxyyz*x**4 + L_xxxxyyzz*x**4*z + L_xyyyyyyz*x*y**4 + &
      L_xyyzzzzz*x*z**4 + L_yyyyyyz*y**4 + L_yyyyyyzz*y**4*z + &
      L_yyyzzzzz*y*z**4 + L_yyzzzzz*z**4) + (1.0d0/6.0d0)*(L_xxxyyyz*x &
      **3*y + L_xxxyyyzz*x**3*y*z + L_xxxyyz*x**3 + L_xxxyyzz*x**3*z + &
      L_xyyyyyz*x*y**3 + L_xyyyyyzz*x*y**3*z + L_xyyyzzzz*x*y*z**3 + &
      L_xyyzzzz*x*z**3 + L_yyyyyz*y**3 + L_yyyyyzz*y**3*z + L_yyyzzzz*y &
      *z**3 + L_yyzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyyz*x**2*y + &
      L_xxyyyzz*x**2*y*z + L_xxyyz*x**2 + L_xxyyzz*x**2*z + L_xyyyyz*x* &
      y**2 + L_xyyyyzz*x*y**2*z + L_xyyyzzz*x*y*z**2 + L_xyyzzz*x*z**2 &
      + L_yyyyz*y**2 + L_yyyyzz*y**2*z + L_yyyzzz*y*z**2 + L_yyzzz*z**2 &
      )
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    Ls_y        = (1.0d0/8.0d0)*L_xxyyyzz*x**2*y**2*z**2 + L_xy*x + L_xyy*x*y + L_xyyz*x*y &
      *z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxy*x**7 + L_yyyyyyyy*y**7 + L_yzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyy*x**5*y**2 + L_xxxxxyzz*x**5*z**2 + &
      L_xxyyyyyy*x**2*y**5 + L_xxyzzzzz*x**2*z**5 + L_yyyyyyzz*y**5*z** &
      2 + L_yyyzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyy*x**4*y**3 &
      + L_xxxxyzzz*x**4*z**3 + L_xxxyyyyy*x**3*y**4 + L_xxxyzzzz*x**3*z &
      **4 + L_yyyyyzzz*y**4*z**3 + L_yyyyzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyy*x**3*y**3 + L_xxxyyyyz*x**3*y**3*z + &
      L_xxxyyzzz*x**3*y*z**3 + L_xxxyzzz*x**3*z**3 + L_xyyyyzzz*x*y**3* &
      z**3 + L_yyyyzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + &
      L_xxyyyz*x**2*y**2*z + L_xxyyzz*x**2*y*z**2 + L_xxyzz*x**2*z**2 + &
      L_xyyyzz*x*y**2*z**2 + L_yyyzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxy*x**6 + L_xxxxxxyy*x**6*y + L_xxxxxxyz*x**6*z + &
      L_xyyyyyyy*x*y**6 + L_xyzzzzzz*x*z**6 + L_yyyyyyy*y**6 + &
      L_yyyyyyyz*y**6*z + L_yyzzzzzz*y*z**6 + L_yzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxy*x**5 + L_xxxxxyy*x**5*y + L_xxxxxyyz*x**5*y*z &
      + L_xxxxxyz*x**5*z + L_xyyyyyy*x*y**5 + L_xyyyyyyz*x*y**5*z + &
      L_xyyzzzzz*x*y*z**5 + L_xyzzzzz*x*z**5 + L_yyyyyy*y**5 + &
      L_yyyyyyz*y**5*z + L_yyzzzzz*y*z**5 + L_yzzzzz*z**5) + (1.0d0/ &
      6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y + L_xxxyyz*x**3*y*z + &
      L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyyyyz*x*y**3*z + L_xyyzzz*x* &
      y*z**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 + L_yyyyz*y**3*z + L_yyzzz* &
      y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y &
      + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + L_xyyy*x*y**2 + L_xyyyz*x*y &
      **2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y &
      **2*z + L_yyzz*y*z**2 + L_yzz*z**2) + (1.0d0/48.0d0)*(L_xxxxyyy*x &
      **4*y**2 + L_xxxxyyyz*x**4*y**2*z + L_xxxxyyzz*x**4*y*z**2 + &
      L_xxxxyzz*x**4*z**2 + L_xxyyyyy*x**2*y**4 + L_xxyyyyyz*x**2*y**4* &
      z + L_xxyyzzzz*x**2*y*z**4 + L_xxyzzzz*x**2*z**4 + L_xyyyyyzz*x*y &
      **4*z**2 + L_xyyyzzzz*x*y**2*z**4 + L_yyyyyzz*y**4*z**2 + &
      L_yyyzzzz*y**2*z**4) + (1.0d0/12.0d0)*(L_xxxyyy*x**3*y**2 + &
      L_xxxyyyz*x**3*y**2*z + L_xxxyyzz*x**3*y*z**2 + L_xxxyzz*x**3*z** &
      2 + L_xxyyyy*x**2*y**3 + L_xxyyyyz*x**2*y**3*z + L_xxyyzzz*x**2*y &
      *z**3 + L_xxyzzz*x**2*z**3 + L_xyyyyzz*x*y**3*z**2 + L_xyyyzzz*x* &
      y**2*z**3 + L_yyyyzz*y**3*z**2 + L_yyyzzz*y**2*z**3) + (1.0d0/ &
      24.0d0)*(L_xxxxy*x**4 + L_xxxxyy*x**4*y + L_xxxxyyz*x**4*y*z + &
      L_xxxxyz*x**4*z + L_xxxyyyzz*x**3*y**2*z**2 + L_xxyyyyzz*x**2*y** &
      3*z**2 + L_xxyyyzzz*x**2*y**2*z**3 + L_xyyyyy*x*y**4 + L_xyyyyyz* &
      x*y**4*z + L_xyyzzzz*x*y*z**4 + L_xyzzzz*x*z**4 + L_yyyyy*y**4 + &
      L_yyyyyz*y**4*z + L_yyzzzz*y*z**4 + L_yzzzz*z**4)
    Ls_yz       = (1.0d0/8.0d0)*L_xxyyyzzz*x**2*y**2*z**2 + L_xyyz*x*y + L_xyyzz*x*y*z + &
      L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz*z + ( &
      1.0d0/720.0d0)*(L_xxxxxxyz*x**6 + L_yyyyyyyz*y**6 + L_yzzzzzzz*z &
      **6) + (1.0d0/36.0d0)*(L_xxxyyyyz*x**3*y**3 + L_xxxyzzzz*x**3*z** &
      3 + L_yyyyzzzz*y**3*z**3) + (1.0d0/48.0d0)*(L_xxxxyyyz*x**4*y**2 &
      + L_xxxxyzzz*x**4*z**2 + L_xxyyyyyz*x**2*y**4 + L_xxyzzzzz*x**2*z &
      **4 + L_yyyyyzzz*y**4*z**2 + L_yyyzzzzz*y**2*z**4) + (1.0d0/4.0d0 &
      )*(L_xxyyyz*x**2*y**2 + L_xxyyyzz*x**2*y**2*z + L_xxyyzzz*x**2*y* &
      z**2 + L_xxyzzz*x**2*z**2 + L_xyyyzzz*x*y**2*z**2 + L_yyyzzz*y**2 &
      *z**2) + (1.0d0/120.0d0)*(L_xxxxxyyz*x**5*y + L_xxxxxyz*x**5 + &
      L_xxxxxyzz*x**5*z + L_xyyyyyyz*x*y**5 + L_xyzzzzzz*x*z**5 + &
      L_yyyyyyz*y**5 + L_yyyyyyzz*y**5*z + L_yyzzzzzz*y*z**5 + &
      L_yzzzzzz*z**5) + (1.0d0/24.0d0)*(L_xxxxyyz*x**4*y + L_xxxxyyzz*x &
      **4*y*z + L_xxxxyz*x**4 + L_xxxxyzz*x**4*z + L_xyyyyyz*x*y**4 + &
      L_xyyyyyzz*x*y**4*z + L_xyyzzzzz*x*y*z**4 + L_xyzzzzz*x*z**4 + &
      L_yyyyyz*y**4 + L_yyyyyzz*y**4*z + L_yyzzzzz*y*z**4 + L_yzzzzz*z &
      **4) + (1.0d0/12.0d0)*(L_xxxyyyz*x**3*y**2 + L_xxxyyyzz*x**3*y**2 &
      *z + L_xxxyyzzz*x**3*y*z**2 + L_xxxyzzz*x**3*z**2 + L_xxyyyyz*x** &
      2*y**3 + L_xxyyyyzz*x**2*y**3*z + L_xxyyzzzz*x**2*y*z**3 + &
      L_xxyzzzz*x**2*z**3 + L_xyyyyzzz*x*y**3*z**2 + L_xyyyzzzz*x*y**2* &
      z**3 + L_yyyyzzz*y**3*z**2 + L_yyyzzzz*y**2*z**3) + (1.0d0/6.0d0) &
      *(L_xxxyyz*x**3*y + L_xxxyyzz*x**3*y*z + L_xxxyz*x**3 + L_xxxyzz* &
      x**3*z + L_xyyyyz*x*y**3 + L_xyyyyzz*x*y**3*z + L_xyyzzzz*x*y*z** &
      3 + L_xyzzzz*x*z**3 + L_yyyyz*y**3 + L_yyyyzz*y**3*z + L_yyzzzz*y &
      *z**3 + L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyyzz* &
      x**2*y*z + L_xxyz*x**2 + L_xxyzz*x**2*z + L_xyyyz*x*y**2 + &
      L_xyyyzz*x*y**2*z + L_xyyzzz*x*y*z**2 + L_xyzzz*x*z**2 + L_yyyz*y &
      **2 + L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    Ls_z        = (1.0d0/8.0d0)*L_xxyyzzz*x**2*y**2*z**2 + L_xyz*x*y + L_xyzz*x*y*z + L_xz &
      *x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + (1.0d0/ &
      5040.0d0)*(L_xxxxxxxz*x**7 + L_yyyyyyyz*y**7 + L_zzzzzzzz*z**7) + &
      (1.0d0/240.0d0)*(L_xxxxxyyz*x**5*y**2 + L_xxxxxzzz*x**5*z**2 + &
      L_xxyyyyyz*x**2*y**5 + L_xxzzzzzz*x**2*z**5 + L_yyyyyzzz*y**5*z** &
      2 + L_yyzzzzzz*y**2*z**5) + (1.0d0/144.0d0)*(L_xxxxyyyz*x**4*y**3 &
      + L_xxxxzzzz*x**4*z**3 + L_xxxyyyyz*x**3*y**4 + L_xxxzzzzz*x**3*z &
      **4 + L_yyyyzzzz*y**4*z**3 + L_yyyzzzzz*y**3*z**4) + (1.0d0/ &
      36.0d0)*(L_xxxyyyz*x**3*y**3 + L_xxxyyyzz*x**3*y**3*z + &
      L_xxxyzzzz*x**3*y*z**3 + L_xxxzzzz*x**3*z**3 + L_xyyyzzzz*x*y**3* &
      z**3 + L_yyyzzzz*y**3*z**3) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + &
      L_xxyyzz*x**2*y**2*z + L_xxyzzz*x**2*y*z**2 + L_xxzzz*x**2*z**2 + &
      L_xyyzzz*x*y**2*z**2 + L_yyzzz*y**2*z**2) + (1.0d0/720.0d0)*( &
      L_xxxxxxyz*x**6*y + L_xxxxxxz*x**6 + L_xxxxxxzz*x**6*z + &
      L_xyyyyyyz*x*y**6 + L_xzzzzzzz*x*z**6 + L_yyyyyyz*y**6 + &
      L_yyyyyyzz*y**6*z + L_yzzzzzzz*y*z**6 + L_zzzzzzz*z**6) + (1.0d0/ &
      120.0d0)*(L_xxxxxyz*x**5*y + L_xxxxxyzz*x**5*y*z + L_xxxxxz*x**5 &
      + L_xxxxxzz*x**5*z + L_xyyyyyz*x*y**5 + L_xyyyyyzz*x*y**5*z + &
      L_xyzzzzzz*x*y*z**5 + L_xzzzzzz*x*z**5 + L_yyyyyz*y**5 + &
      L_yyyyyzz*y**5*z + L_yzzzzzz*y*z**5 + L_zzzzzz*z**5) + (1.0d0/ &
      48.0d0)*(L_xxxxyyz*x**4*y**2 + L_xxxxyyzz*x**4*y**2*z + &
      L_xxxxyzzz*x**4*y*z**2 + L_xxxxzzz*x**4*z**2 + L_xxyyyyz*x**2*y** &
      4 + L_xxyyyyzz*x**2*y**4*z + L_xxyzzzzz*x**2*y*z**4 + L_xxzzzzz*x &
      **2*z**4 + L_xyyyyzzz*x*y**4*z**2 + L_xyyzzzzz*x*y**2*z**4 + &
      L_yyyyzzz*y**4*z**2 + L_yyzzzzz*y**2*z**4) + (1.0d0/12.0d0)*( &
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
      + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2) + (1.0d0/24.0d0)*( &
      L_xxxxyz*x**4*y + L_xxxxyzz*x**4*y*z + L_xxxxz*x**4 + L_xxxxzz*x &
      **4*z + L_xxxyyzzz*x**3*y**2*z**2 + L_xxyyyzzz*x**2*y**3*z**2 + &
      L_xxyyzzzz*x**2*y**2*z**3 + L_xyyyyz*x*y**4 + L_xyyyyzz*x*y**4*z &
      + L_xyzzzzz*x*y*z**4 + L_xzzzzz*x*z**4 + L_yyyyz*y**4 + L_yyyyzz* &
      y**4*z + L_yzzzzz*y*z**4 + L_zzzzz*z**4)
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
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
#undef  L_yyyyy             
#undef  Ls_yyyyy            
#undef  L_yyyyz             
#undef  Ls_yyyyz            
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
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
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
#undef  Ls_xyyyyyyz         
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L2_add
#endif
end module mom8
