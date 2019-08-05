!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-03 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom5
use types
implicit none
#if FMM_EXPANSION_ORDER==5
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
        
    
! OPS  14*ADD + 44*DIV + 140*MUL + 63*POW + 32*SUB = 293  (317 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u
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
    M_0     = W
    M_x     = W*x
    M_y     = W*y
    M_z     = W*z
    M_xy    = W*x*y
    M_xz    = W*x*z
    M_yz    = W*y*z
    M_xyz   = W*x*y*z
    h       = x**2 + y**2 + z**2
    M_xx    = W*(-1.0d0/3.0d0*h + x**2)
    M_yy    = W*(-1.0d0/3.0d0*h + y**2)
    M_xxx   = W*(-3.0d0/5.0d0*h*x + x**3)
    M_xxy   = W*(-1.0d0/5.0d0*h*y + x**2*y)
    M_xxz   = W*(-1.0d0/5.0d0*h*z + x**2*z)
    M_xyy   = W*(-1.0d0/5.0d0*h*x + x*y**2)
    M_yyy   = W*(-3.0d0/5.0d0*h*y + y**3)
    M_yyz   = W*(-1.0d0/5.0d0*h*z + y**2*z)
    M_xxxx  = W*((3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4)
    M_xxxy  = W*(-3.0d0/7.0d0*h*x*y + x**3*y)
    M_xxxz  = W*(-3.0d0/7.0d0*h*x*z + x**3*z)
    M_xxyy  = W*((1.0d0/35.0d0)*h**2 - 1.0d0/7.0d0*h*x**2 - 1.0d0/7.0d0*h*y**2 + x**2* &
      y**2)
    M_xxyz  = W*(-1.0d0/7.0d0*h*y*z + x**2*y*z)
    M_xyyy  = W*(-3.0d0/7.0d0*h*x*y + x*y**3)
    M_xyyz  = W*(-1.0d0/7.0d0*h*x*z + x*y**2*z)
    M_yyyy  = W*((3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4)
    M_yyyz  = W*(-3.0d0/7.0d0*h*y*z + y**3*z)
    M_xxxxx = W*((5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5)
    M_xxxxy = W*((1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y)
    M_xxxxz = W*((1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z)
    M_xxxyy = W*((1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x &
      **3*y**2)
    M_xxxyz = W*(-1.0d0/3.0d0*h*x*y*z + x**3*y*z)
    M_xxyyy = W*((1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x &
      **2*y**3)
    M_xxyyz = W*((1.0d0/63.0d0)*h**2*z - 1.0d0/9.0d0*h*x**2*z - 1.0d0/9.0d0*h*y**2*z + &
      x**2*y**2*z)
    M_xyyyy = W*((1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4)
    M_xyyyz = W*(-1.0d0/3.0d0*h*x*y*z + x*y**3*z)
    M_yyyyy = W*((5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5)
    M_yyyyz = W*((1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z)
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
    end subroutine mom_es_P2M
    
! OPS  526*ADD + 254*DIV + 1356*MUL + 187*NEG + 63*POW + 417*SUB = 2803  (3214 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz,&
                S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy,&
                S_xxxxz, S_xxxyy, S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy, S_xyyyz,&
                S_yyyyy, S_yyyyz
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
    Ms_0     = M_0
    Ms_x     = M_0*x + M_x
    Ms_y     = M_0*y + M_y
    Ms_z     = M_0*z + M_z
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
    S_0      = 1
    S_x      = x
    S_y      = y
    S_z      = z
    S_xy     = x*y
    Ms_xy    = M_0*S_xy + M_x*y + M_xy + M_y*x
    S_xz     = x*z
    Ms_xz    = M_0*S_xz + M_x*z + M_xz + M_z*x
    S_yz     = y*z
    Ms_yz    = M_0*S_yz + M_y*z + M_yz + M_z*y
    S_xyz    = x*y*z
    Ms_xyz   = M_0*S_xyz + M_x*S_yz + M_xy*z + M_xyz + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy
    h        = x**2 + y**2 + z**2
    S_xx     = -1.0d0/3.0d0*h + x**2
    Ms_xx    = M_0*S_xx + (4.0d0/3.0d0)*M_x*x + M_xx - 2.0d0/3.0d0*(M_y*y + M_z*z)
    S_yy     = -1.0d0/3.0d0*h + y**2
    Ms_yy    = M_0*S_yy + (4.0d0/3.0d0)*M_y*y + M_yy - 2.0d0/3.0d0*(M_x*x + M_z*z)
    S_zz     = -(S_xx + S_yy)
    S_xxx    = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx   = M_0*S_xxx + (9.0d0/5.0d0)*M_x*S_xx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(M_xx*x - M_xy*y - M_xz*z - M_y* &
      S_xy - M_z*S_xz)
    S_xxy    = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy   = M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (1.0d0/15.0d0)*M_y*(15*S_xx - &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xy + M_xy*x) - 1.0d0/5.0d0*(3*M_yy &
      *y + 2*M_yz*z + 2*M_z*S_yz + y*(-M_xx - M_yy))
    S_xxz    = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz   = M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (1.0d0/15.0d0)*M_z*(21*S_xx + &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xz + M_xz*x) - 1.0d0/5.0d0*(2*M_y* &
      S_yz + M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy))
    S_xyy    = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy   = M_0*S_xyy + (1.0d0/15.0d0)*M_x*(-6*S_xx + 15*S_yy) + M_xyy + (4.0d0/ &
      5.0d0)*M_yy*x + (8.0d0/5.0d0)*(M_xy*y + M_y*S_xy) - 1.0d0/5.0d0*( &
      3*M_xx*x + 2*M_xz*z + 2*M_z*S_xz + x*(-M_xx - M_yy))
    S_xzz    = -(S_xxx + S_xyy)
    S_yyy    = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy   = M_0*S_yyy + (9.0d0/5.0d0)*M_y*S_yy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(-M_x*S_xy - M_xy*x + M_yy*y - &
      M_yz*z - M_z*S_yz)
    S_yyz    = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz   = M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (1.0d0/15.0d0)*M_z*(6*S_xx + &
      21*S_yy) + (8.0d0/5.0d0)*(M_y*S_yz + M_yz*y) - 1.0d0/5.0d0*(2*M_x &
      *S_xz + M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy))
    S_yzz    = -(S_xxy + S_yyy)
    S_zzz    = -(S_xxz + S_yyz)
    S_xxxx   = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4
    Ms_xxxx  = M_0*S_xxxx + (16.0d0/7.0d0)*M_x*S_xxx + (72.0d0/35.0d0)*M_xx*S_xx - &
      6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_yz*S_yz + (32.0d0/35.0d0) &
      *(M_xxx*x + M_xxxx) - 96.0d0/35.0d0*(M_xy*S_xy + M_xz*S_xz) - &
      12.0d0/7.0d0*(M_y*S_xxy + M_z*S_xxz) + (1.0d0/210.0d0)*(M_yy*( &
      -180*S_xx + 72*S_yy) + (-M_xx - M_yy)*(-252*S_xx - 72*S_yy)) - &
      3.0d0/35.0d0*(M_xxzz + M_yyyy + M_yyzz) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xxz*z + M_xyy*x + x*(-M_xxx - M_xyy)) + (12.0d0/35.0d0)*( &
      M_yyy*y + M_yyz*z + y*(-M_xxy - M_yyy) + z*(-M_xxz - M_yyz))
    S_xxxy   = -3.0d0/7.0d0*h*x*y + x**3*y
    Ms_xxxy  = M_0*S_xxxy + (15.0d0/7.0d0)*M_x*S_xxy + (4.0d0/7.0d0)*M_xxx*y + M_xxxy + &
      (12.0d0/7.0d0)*(M_xx*S_xy + M_xxy*x) + (1.0d0/105.0d0)*(M_xy*(225 &
      *S_xx - 90*S_yy) + M_y*(105*S_xxx - 90*S_xyy)) - 9.0d0/7.0d0*( &
      M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz*S_yz + M_yz* &
      S_xz + M_z*S_xyz) - 3.0d0/7.0d0*(M_yyy*x + S_xy*(-M_xx - M_yy) + &
      x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy))
    S_xxxz   = -3.0d0/7.0d0*h*x*z + x**3*z
    Ms_xxxz  = M_0*S_xxxz + (15.0d0/7.0d0)*M_x*S_xxz + (4.0d0/7.0d0)*M_xxx*z + M_xxxz + &
      (12.0d0/7.0d0)*(M_xx*S_xz + M_xxz*x) + (1.0d0/105.0d0)*(M_xz*(315 &
      *S_xx + 90*S_yy) + M_z*(195*S_xxx + 90*S_xyy)) - 9.0d0/7.0d0*( &
      S_xz*(-M_xx - M_yy) + z*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 3.0d0/7.0d0*(M_xyy*z + &
      M_yy*S_xz + M_yyz*x + x*(-M_xxz - M_yyz))
    S_xxyy   = (1.0d0/35.0d0)*h**2 + x**2*y**2 - 1.0d0/7.0d0*(h*x**2 + h*y**2)
    Ms_xxyy  = M_0*S_xxyy + (33.0d0/35.0d0)*M_xxyy + (108.0d0/35.0d0)*M_xy*S_xy + ( &
      4.0d0/35.0d0)*z*(-M_xxz - M_yyz) + (54.0d0/35.0d0)*(M_xxy*y + &
      M_xyy*x) + (1.0d0/105.0d0)*(M_x*(-30*S_xxx + 180*S_xyy) + M_y*( &
      180*S_xxy - 30*S_yyy) + M_z*(-30*S_xxz - 30*S_yyz)) + (1.0d0/ &
      210.0d0)*(M_xx*(-126*S_xx + 180*S_yy) + M_yy*(180*S_xx - 126*S_yy &
      ) + (-M_xx - M_yy)*(-54*S_xx - 54*S_yy)) - 1.0d0/35.0d0*(16*M_xxx &
      *x + M_xxxx + 6*M_xxz*z + M_xxzz + 12*M_xz*S_xz + 16*M_yyy*y + &
      M_yyyy + 6*M_yyz*z + M_yyzz + 12*M_yz*S_yz + 6*x*(-M_xxx - M_xyy &
      ) + 6*y*(-M_xxy - M_yyy))
    S_xxyz   = -1.0d0/7.0d0*h*y*z + x**2*y*z
    Ms_xxyz  = M_0*S_xxyz + M_xxyz + (9.0d0/7.0d0)*M_yz*S_xx + (1.0d0/105.0d0)*(M_y*( &
      105*S_xxz - 30*S_yyz) + M_z*(135*S_xxy + 30*S_yyy)) + (6.0d0/ &
      7.0d0)*(M_xx*S_yz + M_xxy*z + M_xxz*y) + (12.0d0/7.0d0)*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 1.0d0/7.0d0*(3*M_yy* &
      S_yz + M_yyy*z + 3*M_yyz*y + 3*S_yz*(-M_xx - M_yy) + y*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxy - M_yyy))
    S_xxzz   = -(S_xxxx + S_xxyy)
    S_xyyy   = -3.0d0/7.0d0*h*x*y + x*y**3
    Ms_xyyy  = M_0*S_xyyy + M_xyyy + (15.0d0/7.0d0)*M_y*S_xyy + (4.0d0/7.0d0)*M_yyy*x + &
      (1.0d0/105.0d0)*(M_x*(-90*S_xxy + 105*S_yyy) + M_xy*(-90*S_xx + &
      225*S_yy)) - 9.0d0/7.0d0*(M_xx*S_xy + M_xxy*x) + (12.0d0/7.0d0)*( &
      M_xyy*y + M_yy*S_xy) - 3.0d0/7.0d0*(M_xxx*y + S_xy*(-M_xx - M_yy &
      ) + x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xyz &
      *z + M_xz*S_yz + M_yz*S_xz + M_z*S_xyz)
    S_xyyz   = -1.0d0/7.0d0*h*x*z + x*y**2*z
    Ms_xyyz  = M_0*S_xyyz + M_xyyz + (9.0d0/7.0d0)*M_xz*S_yy + (1.0d0/105.0d0)*(M_x*( &
      -30*S_xxz + 105*S_yyz) + M_z*(30*S_xxx + 135*S_xyy)) + (6.0d0/ &
      7.0d0)*(M_xyy*z + M_yy*S_xz + M_yyz*x) + (12.0d0/7.0d0)*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 1.0d0/7.0d0*(3*M_xx* &
      S_xz + M_xxx*z + 3*M_xxz*x + 3*S_xz*(-M_xx - M_yy) + x*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxx - M_xyy))
    S_xyzz   = -(S_xxxy + S_xyyy)
    S_xzzz   = -(S_xxxz + S_xyyz)
    S_yyyy   = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4
    Ms_yyyy  = M_0*S_yyyy - 6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_xz*S_xz + (16.0d0/ &
      7.0d0)*M_y*S_yyy + (72.0d0/35.0d0)*M_yy*S_yy - 12.0d0/7.0d0*(M_x* &
      S_xyy + M_z*S_yyz) + (1.0d0/210.0d0)*(M_xx*(72*S_xx - 180*S_yy) + &
      (-M_xx - M_yy)*(-72*S_xx - 252*S_yy)) - 96.0d0/35.0d0*(M_xy*S_xy &
      + M_yz*S_yz) + (32.0d0/35.0d0)*(M_yyy*y + M_yyyy) - 3.0d0/35.0d0* &
      (M_xxxx + M_xxzz + M_yyzz) + (12.0d0/35.0d0)*(M_xxx*x + M_xxz*z + &
      x*(-M_xxx - M_xyy) + z*(-M_xxz - M_yyz)) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xyy*x + M_yyz*z + y*(-M_xxy - M_yyy))
    S_yyyz   = -3.0d0/7.0d0*h*y*z + y**3*z
    Ms_yyyz  = M_0*S_yyyz + (15.0d0/7.0d0)*M_y*S_yyz + (4.0d0/7.0d0)*M_yyy*z + M_yyyz + &
      (12.0d0/7.0d0)*(M_yy*S_yz + M_yyz*y) + (1.0d0/105.0d0)*(M_yz*(90* &
      S_xx + 315*S_yy) + M_z*(90*S_xxy + 195*S_yyy)) - 9.0d0/7.0d0*( &
      S_yz*(-M_xx - M_yy) + z*(-M_xxy - M_yyy)) - 6.0d0/7.0d0*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 3.0d0/7.0d0*(M_xx*S_yz &
      + M_xxy*z + M_xxz*y + y*(-M_xxz - M_yyz))
    S_yyzz   = -(S_xxyy + S_yyyy)
    S_yzzz   = -(S_xxyz + S_yyyz)
    S_zzzz   = -(S_xxzz + S_yyzz)
    S_xxxxx  = (5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5
    Ms_xxxxx = M_0*S_xxxxx + (1.0d0/945.0d0)*M_x*(2400*S_xxxx - 450*S_xxyy - 225*S_xxzz &
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
    S_xxxxy  = (1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y
    Ms_xxxxy = M_0*S_xxxxy + (8.0d0/3.0d0)*M_x*S_xxxy + (20.0d0/7.0d0)*M_xx*S_xxy - &
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
    S_xxxxz  = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z
    Ms_xxxxz = M_0*S_xxxxz + (8.0d0/3.0d0)*M_x*S_xxxz + (20.0d0/7.0d0)*M_xx*S_xxz - &
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
    S_xxxyy  = (1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x**3 &
      *y**2
    Ms_xxxyy = M_0*S_xxxyy + (1.0d0/5670.0d0)*M_xxx*(-3510*S_xx + 3780*S_yy) - 20.0d0/ &
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
    S_xxxyz  = -1.0d0/3.0d0*h*x*y*z + x**3*y*z
    Ms_xxxyz = M_0*S_xxxyz + (7.0d0/3.0d0)*M_x*S_xxyz + M_xxxyz + 3*M_xyz*S_xx + (5.0d0 &
      /3.0d0)*M_yz*S_xxx + (1.0d0/945.0d0)*(M_xy*(2205*S_xxz - 630* &
      S_yyz) + M_xz*(2835*S_xxy + 630*S_yyy) + M_y*(945*S_xxxz - 630* &
      S_xyyz) + M_z*(1575*S_xxxy + 630*S_xyyy)) + 2*(M_xx*S_xyz + 3* &
      M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz*y + M_xxy*S_xz + M_xxyz*x + &
      M_xxz*S_xy) - (M_xyy*S_yz + 3*M_xyyy*z + M_xyyz*y + M_yy*S_xyz + &
      3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy))
    S_xxyyy  = (1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x**2 &
      *y**3
    Ms_xxyyy = M_0*S_xxyyy - 2.0d0/7.0d0*M_xxxx*y + (82.0d0/63.0d0)*M_xyyy*x + (1.0d0/ &
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
    S_xxyyz  = (1.0d0/63.0d0)*h**2*z + x**2*y**2*z - 1.0d0/9.0d0*(h*x**2*z + h*y**2*z)
    Ms_xxyyz = M_0*S_xxyyz + (17.0d0/21.0d0)*M_xxyy*z + (61.0d0/63.0d0)*M_xxyyz + ( &
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
    S_xyyyy  = (1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4
    Ms_xyyyy = M_0*S_xyyyy + (1.0d0/5670.0d0)*M_xxx*(2160*S_xx - 3780*S_yy) - 24.0d0/ &
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
    S_xyyyz  = -1.0d0/3.0d0*h*x*y*z + x*y**3*z
    Ms_xyyyz = M_0*S_xyyyz + M_xyyyz + 3*M_xyz*S_yy + (5.0d0/3.0d0)*M_xz*S_yyy + (7.0d0 &
      /3.0d0)*M_y*S_xyyz + (1.0d0/945.0d0)*(M_x*(-630*S_xxyz + 945* &
      S_yyyz) + M_xy*(-630*S_xxz + 2205*S_yyz) + M_yz*(630*S_xxx + 2835 &
      *S_xyy) + M_z*(630*S_xxxy + 1575*S_xyyy)) + 2*(M_xyy*S_yz + 3* &
      M_xyyy*z + M_xyyz*y + M_yy*S_xyz + 3*M_yyy*S_xz + 3*M_yyyz*x + &
      M_yyz*S_xy) - (M_xx*S_xyz + 3*M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz* &
      y + M_xxy*S_xz + M_xxyz*x + M_xxz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy))
    S_yyyyy  = (5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5
    Ms_yyyyy = M_0*S_yyyyy + (1.0d0/945.0d0)*M_y*(-225*S_xxxx - 450*S_xxyy - 225*S_xxzz &
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
    S_yyyyz  = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z
    Ms_yyyyz = M_0*S_yyyyz - 4.0d0/3.0d0*M_x*S_xyyz - 6.0d0/7.0d0*M_xxz*S_yy + (8.0d0/ &
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
    end subroutine mom_es_M2M
    
! OPS  351*ADD + 37*DIV + 616*MUL + 44*NEG + 143*POW + 37*SUB = 1228  (1466 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y,&
                D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
                D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx,&
                D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz,&
                D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz,&
                D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy,&
                D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz,&
                D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define M_x                  M(1)
#define L_x                  L(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define L_xz                 L(6)
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
#define L_yyy                L(14)
#define M_yyy                M(14)
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
#define L_xxyz               L(20)
#define M_xxyz               M(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define L_xyyz               L(22)
#define M_xyyz               M(22)
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
    M_zz    = -(M_xx + M_yy)
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    M_xxzz  = -(M_xxxx + M_xxyy)
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    M_xxxzz = -(M_xxxxx + M_xxxyy)
    M_xxyzz = -(M_xxxxy + M_xxyyy)
    M_xxzzz = -(M_xxxxz + M_xxyyz)
    M_xyyzz = -(M_xxxyy + M_xyyyy)
    M_xyzzz = -(M_xxxyz + M_xyyyz)
    M_xzzzz = -(M_xxxzz + M_xyyzz)
    M_yyyzz = -(M_xxyyy + M_yyyyy)
    M_yyzzz = -(M_xxyyz + M_yyyyz)
    M_yzzzz = -(M_xxyzz + M_yyyzz)
    M_zzzzz = -(M_xxzzz + M_yyzzz)
    h       = x**2 + y**2 + z**2
    u2      = 1.0/h
    u       = sqrt(u2)
    D_0     = u
    D_x     = -u**3*x
    D_y     = -u**3*y
    D_z     = -u**3*z
    D_xx    = -h*u**5 + 3*u**5*x**2
    D_xy    = 3*u**5*x*y
    D_xz    = 3*u**5*x*z
    D_yy    = -h*u**5 + 3*u**5*y**2
    D_yz    = 3*u**5*y*z
    D_zz    = -(D_xx + D_yy)
    D_xxx   = 9*h*u**7*x - 15*u**7*x**3
    D_xxy   = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz   = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy   = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz   = -15*u**7*x*y*z
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = 9*h*u**7*y - 15*u**7*y**3
    D_yyz   = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    D_xxxx  = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy  = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz  = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy  = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz  = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz  = -(D_xxxx + D_xxyy)
    D_xyyy  = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz  = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz  = -(D_xxxy + D_xyyy)
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz  = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    D_xxxxx = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    L_xxxx  = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    L_xxxy  = D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    L_xxx   = D_xxx*M_0 + D_xxxx*M_x + D_xxxxy*M_xy + D_xxxxz*M_xz + D_xxxy*M_y + &
      D_xxxyz*M_yz + D_xxxz*M_z + (1.0d0/2.0d0)*(D_xxxxx*M_xx + D_xxxyy &
      *M_yy + D_xxxzz*M_zz)
    L_xxxz  = D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z
    D_xxyyy = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    L_xxyy  = D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    L_xxy   = D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + &
      D_xxyyz*M_yz + D_xxyz*M_z + (1.0d0/2.0d0)*(D_xxxxy*M_xx + D_xxyyy &
      *M_yy + D_xxyzz*M_zz)
    L_xxyz  = D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    L_xx    = D_xx*M_0 + D_xxx*M_x + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy &
      *M_y + D_xxyz*M_yz + D_xxz*M_z + (1.0d0/6.0d0)*(D_xxxxx*M_xxx + &
      D_xxyyy*M_yyy + D_xxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxx*M_xx + &
      D_xxxxy*M_xxy + D_xxxxz*M_xxz + D_xxxyy*M_xyy + D_xxxzz*M_xzz + &
      D_xxyy*M_yy + D_xxyyz*M_yyz + D_xxyzz*M_yzz + D_xxzz*M_zz)
    L_xxz   = D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + &
      D_xxz*M_0 + D_xxzz*M_z + (1.0d0/2.0d0)*(D_xxxxz*M_xx + D_xxyyz* &
      M_yy + D_xxzzz*M_zz)
    D_xyyyy = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    L_xyyy  = D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    L_xyy   = D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + &
      D_xyyyz*M_yz + D_xyyz*M_z + (1.0d0/2.0d0)*(D_xxxyy*M_xx + D_xyyyy &
      *M_yy + D_xyyzz*M_zz)
    L_xyyz  = D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    L_xy    = D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy &
      *M_y + D_xyyz*M_yz + D_xyz*M_z + (1.0d0/6.0d0)*(D_xxxxy*M_xxx + &
      D_xyyyy*M_yyy + D_xyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxy*M_xx + &
      D_xxxyy*M_xxy + D_xxxyz*M_xxz + D_xxyyy*M_xyy + D_xxyzz*M_xzz + &
      D_xyyy*M_yy + D_xyyyz*M_yyz + D_xyyzz*M_yzz + D_xyzz*M_zz)
    L_xyz   = D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + &
      D_xyz*M_0 + D_xyzz*M_z + (1.0d0/2.0d0)*(D_xxxyz*M_xx + D_xyyyz* &
      M_yy + D_xyzzz*M_zz)
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = D_x*M_0 + D_xx*M_x + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + &
      D_xyz*M_yz + D_xz*M_z + (1.0d0/24.0d0)*(D_xxxxx*M_xxxx + D_xyyyy* &
      M_yyyy + D_xzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyy*M_xxyy + &
      D_xxxzz*M_xxzz + D_xyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxx*M_xxx + &
      D_xxxxy*M_xxxy + D_xxxxz*M_xxxz + D_xxyyy*M_xyyy + D_xxzzz*M_xzzz &
      + D_xyyy*M_yyy + D_xyyyz*M_yyyz + D_xyzzz*M_yzzz + D_xzzz*M_zzz) &
      + (1.0d0/2.0d0)*(D_xxx*M_xx + D_xxxy*M_xxy + D_xxxyz*M_xxyz + &
      D_xxxz*M_xxz + D_xxyy*M_xyy + D_xxyyz*M_xyyz + D_xxyzz*M_xyzz + &
      D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz* &
      M_zz)
    L_xz    = D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + &
      D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + (1.0d0/6.0d0)*(D_xxxxz*M_xxx &
      + D_xyyyz*M_yyy + D_xzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyz*M_xxy + &
      D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxyyz*M_xyy + D_xxzzz*M_xzz + &
      D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz*M_yzz + D_xzzz*M_zz)
    D_yyyyy = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    L_yyyy  = D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + &
      D_yyyyz*M_yz + D_yyyz*M_z + (1.0d0/2.0d0)*(D_xxyyy*M_xx + D_yyyyy &
      *M_yy + D_yyyzz*M_zz)
    L_yyyz  = D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy &
      *M_y + D_yyyz*M_yz + D_yyz*M_z + (1.0d0/6.0d0)*(D_xxxyy*M_xxx + &
      D_yyyyy*M_yyy + D_yyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyy*M_xx + &
      D_xxyyy*M_xxy + D_xxyyz*M_xxz + D_xyyyy*M_xyy + D_xyyzz*M_xzz + &
      D_yyyy*M_yy + D_yyyyz*M_yyz + D_yyyzz*M_yzz + D_yyzz*M_zz)
    L_yyz   = D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyz*M_y + D_yyyzz*M_yz + &
      D_yyz*M_0 + D_yyzz*M_z + (1.0d0/2.0d0)*(D_xxyyz*M_xx + D_yyyyz* &
      M_yy + D_yyzzz*M_zz)
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyz*M_yz + D_yz*M_z + (1.0d0/24.0d0)*(D_xxxxy*M_xxxx + D_yyyyy* &
      M_yyyy + D_yzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyy*M_xxyy + &
      D_xxyzz*M_xxzz + D_yyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + &
      D_xxxyy*M_xxxy + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + D_xyzzz*M_xzzz &
      + D_yyyy*M_yyy + D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) &
      + (1.0d0/2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + &
      D_xxyz*M_xxz + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + &
      D_xyzz*M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz* &
      M_zz)
    L_yz    = D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyz*M_y + &
      D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + (1.0d0/6.0d0)*(D_xxxyz*M_xxx &
      + D_yyyyz*M_yyy + D_yzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyz*M_xxy + &
      D_xxyz*M_xx + D_xxyzz*M_xxz + D_xyyyz*M_xyy + D_xyzzz*M_xzz + &
      D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz*M_yzz + D_yzzz*M_zz)
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = D_0*M_0 + D_x*M_x + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + D_yz &
      *M_yz + D_z*M_z + (1.0d0/120.0d0)*(D_xxxxx*M_xxxxx + D_yyyyy* &
      M_yyyyy + D_zzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyy*M_xxxyy + &
      D_xxxzz*M_xxxzz + D_xxyyy*M_xxyyy + D_xxzzz*M_xxzzz + D_yyyzz* &
      M_yyyzz + D_yyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyy*M_xxyy + &
      D_xxyyz*M_xxyyz + D_xxyzz*M_xxyzz + D_xxzz*M_xxzz + D_xyyzz* &
      M_xyyzz + D_yyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxx*M_xxxx + &
      D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + D_xyyyy*M_xyyyy + D_xzzzz* &
      M_xzzzz + D_yyyy*M_yyyy + D_yyyyz*M_yyyyz + D_yzzzz*M_yzzzz + &
      D_zzzz*M_zzzz) + (1.0d0/2.0d0)*(D_xx*M_xx + D_xxy*M_xxy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xyy*M_xyy + D_xyyz*M_xyyz + D_xyzz* &
      M_xyzz + D_xzz*M_xzz + D_yy*M_yy + D_yyz*M_yyz + D_yzz*M_yzz + &
      D_zz*M_zz) + (1.0d0/6.0d0)*(D_xxx*M_xxx + D_xxxy*M_xxxy + D_xxxyz &
      *M_xxxyz + D_xxxz*M_xxxz + D_xyyy*M_xyyy + D_xyyyz*M_xyyyz + &
      D_xyzzz*M_xyzzz + D_xzzz*M_xzzz + D_yyy*M_yyy + D_yyyz*M_yyyz + &
      D_yzzz*M_yzzz + D_zzz*M_zzz)
    L_z     = D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yz*M_y + D_yzz* &
      M_yz + D_z*M_0 + D_zz*M_z + (1.0d0/24.0d0)*(D_xxxxz*M_xxxx + &
      D_yyyyz*M_yyyy + D_zzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyz*M_xxyy &
      + D_xxzzz*M_xxzz + D_yyzzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxyz* &
      M_xxxy + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy + D_xzzzz &
      *M_xzzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz &
      *M_zzz) + (1.0d0/2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz* &
      M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz* &
      M_xyzz + D_xzzz*M_xzz + D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz &
      + D_zzz*M_zz)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  L_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  M_xx                
#undef  L_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
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
#undef  L_yyy               
#undef  M_yyy               
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
#undef  L_xxyz              
#undef  M_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
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
    end subroutine mom_es_M2L
    
! OPS  342*ADD + 35*DIV + 546*MUL + 20*NEG + 231*POW = 1174  (1398 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz,&
                L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz,&
                L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz,&
                L_yyzzz, L_yzzzz, L_zzzzz
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
#define Ls_xxxyz             Ls(29)
#define L_xxxyz              L(29)
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
    Ls_xxxx  = L_xxxx + L_xxxxx*x + L_xxxxy*y + L_xxxxz*z
    Ls_xxxy  = L_xxxxy*x + L_xxxy + L_xxxyy*y + L_xxxyz*z
    Ls_xxyy  = L_xxxyy*x + L_xxyy + L_xxyyy*y + L_xxyyz*z
    Ls_xyyy  = L_xxyyy*x + L_xyyy + L_xyyyy*y + L_xyyyz*z
    Ls_yyyy  = L_xyyyy*x + L_yyyy + L_yyyyy*y + L_yyyyz*z
    Ls_xxxxx = L_xxxxx
    Ls_xxxxy = L_xxxxy
    Ls_xxxxz = L_xxxxz
    Ls_xxxyy = L_xxxyy
    Ls_xxxyz = L_xxxyz
    Ls_xxyyy = L_xxyyy
    Ls_xxyyz = L_xxyyz
    Ls_xyyyy = L_xyyyy
    Ls_xyyyz = L_xyyyz
    Ls_yyyyy = L_yyyyy
    Ls_yyyyz = L_yyyyz
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
    Ls_xxx   = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxz*x*z + L_xxxy*y + L_xxxyz*y*z + &
      L_xxxz*z + (1.0d0/2.0d0)*(L_xxxxx*x**2 + L_xxxyy*y**2 + L_xxxzz*z &
      **2)
    Ls_xxxz  = L_xxxxz*x + L_xxxyz*y + L_xxxz + L_xxxzz*z
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    Ls_xxy   = L_xxxy*x + L_xxxyy*x*y + L_xxxyz*x*z + L_xxy + L_xxyy*y + L_xxyyz*y*z + &
      L_xxyz*z + (1.0d0/2.0d0)*(L_xxxxy*x**2 + L_xxyyy*y**2 + L_xxyzz*z &
      **2)
    Ls_xxyz  = L_xxxyz*x + L_xxyyz*y + L_xxyz + L_xxyzz*z
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    Ls_xx    = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/6.0d0)*(L_xxxxx*x**3 + L_xxyyy*y**3 &
      + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    Ls_xxz   = L_xxxyz*x*y + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + L_xxyzz*y*z + L_xxz + &
      L_xxzz*z + (1.0d0/2.0d0)*(L_xxxxz*x**2 + L_xxyyz*y**2 + L_xxzzz*z &
      **2)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    Ls_xyy   = L_xxyy*x + L_xxyyy*x*y + L_xxyyz*x*z + L_xyy + L_xyyy*y + L_xyyyz*y*z + &
      L_xyyz*z + (1.0d0/2.0d0)*(L_xxxyy*x**2 + L_xyyyy*y**2 + L_xyyzz*z &
      **2)
    Ls_xyyz  = L_xxyyz*x + L_xyyyz*y + L_xyyz + L_xyyzz*z
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    Ls_xy    = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xyyyy*y**3 &
      + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    Ls_xyz   = L_xxyyz*x*y + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + L_xyyzz*y*z + L_xyz + &
      L_xyzz*z + (1.0d0/2.0d0)*(L_xxxyz*x**2 + L_xyyyz*y**2 + L_xyzzz*z &
      **2)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    Ls_x     = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xyyyy*y**4 + L_xzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + L_xxxzz*x**2*z**2 + &
      L_xyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y &
      + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 &
      + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z &
      **2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + L_xzz*z**2)
    Ls_xz    = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/6.0d0)*(L_xxxxz*x**3 + L_xyyyz*y**3 + &
      L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxz*x**2 + &
      L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + &
      L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    Ls_yyy   = L_xyyy*x + L_xyyyy*x*y + L_xyyyz*x*z + L_yyy + L_yyyy*y + L_yyyyz*y*z + &
      L_yyyz*z + (1.0d0/2.0d0)*(L_xxyyy*x**2 + L_yyyyy*y**2 + L_yyyzz*z &
      **2)
    Ls_yyyz  = L_xyyyz*x + L_yyyyz*y + L_yyyz + L_yyyzz*z
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    Ls_yy    = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_yyyyy*y**3 &
      + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Ls_yyz   = L_xyyyz*x*y + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + L_yyyzz*y*z + L_yyz + &
      L_yyzz*z + (1.0d0/2.0d0)*(L_xxyyz*x**2 + L_yyyyz*y**2 + L_yyzzz*z &
      **2)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    Ls_y     = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/24.0d0)*(L_xxxxy*x**4 + L_yyyyy*y**4 + L_yzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + L_xxyzz*x**2*z**2 + &
      L_yyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y &
      + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 &
      + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z &
      **2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + L_yzz*z**2)
    Ls_yz    = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/6.0d0)*(L_xxxyz*x**3 + L_yyyyz*y**3 + &
      L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyz*x**2 + &
      L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + &
      L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    Ls_0     = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_yyyyy*y**5 + L_zzzzz*z**5 &
      ) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxzzz*x**2*z**3 + L_yyyzz*y**3*z**2 + &
      L_yyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x &
      **2*y**2*z + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y &
      **2*z**2 + L_yyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxx*x**4 + &
      L_xxxxy*x**4*y + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xzzzz*x*z**4 &
      + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + &
      (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz &
      *x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3)
    Ls_z     = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/24.0d0)*(L_xxxxz*x**4 + L_yyyyz*y**4 + L_zzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + L_xxzzz*x**2*z**2 + &
      L_yyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxz*x**3 &
      + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 &
      + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z &
      **2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
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
#undef  Ls_xxxyz            
#undef  L_xxxyz             
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
    end subroutine mom_es_L2L
    
! OPS  252*ADD + 28*DIV + 435*MUL + 21*NEG + 210*POW = 946  (1157 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz,&
                L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz,&
                L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz,&
                L_yyzzz, L_yzzzz, L_zzzzz
#define Phi_0                Phi(0)
#define y                    r(2)
#define x                    r(1)
#define L_0                  L(0)
#define z                    r(3)
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
#define L_xz                 L(6)
#define Phi_xz               Phi(6)
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
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    L_yzz   = -(L_xxy + L_yyy)
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    L_xyzz  = -(L_xxxy + L_xyyy)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    L_xxxzz = -(L_xxxxx + L_xxxyy)
    L_xxyzz = -(L_xxxxy + L_xxyyy)
    L_xxzzz = -(L_xxxxz + L_xxyyz)
    Phi_xx  = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/6.0d0)*(L_xxxxx*x**3 + L_xxyyy*y**3 &
      + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    L_xyyzz = -(L_xxxyy + L_xyyyy)
    L_xyzzz = -(L_xxxyz + L_xyyyz)
    Phi_xy  = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xyyyy*y**3 &
      + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    L_xzzzz = -(L_xxxzz + L_xyyzz)
    Phi_x   = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xyyyy*y**4 + L_xzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + L_xxxzz*x**2*z**2 + &
      L_xyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y &
      + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 &
      + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z &
      **2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + L_xzz*z**2)
    Phi_xz  = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/6.0d0)*(L_xxxxz*x**3 + L_xyyyz*y**3 + &
      L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxz*x**2 + &
      L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + &
      L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyzz = -(L_xxyyy + L_yyyyy)
    L_yyzzz = -(L_xxyyz + L_yyyyz)
    Phi_yy  = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_yyyyy*y**3 &
      + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Phi_zz  = -(Phi_xx + Phi_yy)
    L_yzzzz = -(L_xxyzz + L_yyyzz)
    Phi_y   = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/24.0d0)*(L_xxxxy*x**4 + L_yyyyy*y**4 + L_yzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + L_xxyzz*x**2*z**2 + &
      L_yyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y &
      + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 &
      + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z &
      **2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + L_yzz*z**2)
    Phi_yz  = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/6.0d0)*(L_xxxyz*x**3 + L_yyyyz*y**3 + &
      L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyz*x**2 + &
      L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + &
      L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzz = -(L_xxzzz + L_yyzzz)
    Phi_0   = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_yyyyy*y**5 + L_zzzzz*z**5 &
      ) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxzzz*x**2*z**3 + L_yyyzz*y**3*z**2 + &
      L_yyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x &
      **2*y**2*z + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y &
      **2*z**2 + L_yyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxx*x**4 + &
      L_xxxxy*x**4*y + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xzzzz*x*z**4 &
      + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + &
      (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz &
      *x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3)
    Phi_z   = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/24.0d0)*(L_xxxxz*x**4 + L_yyyyz*y**4 + L_zzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + L_xxzzz*x**2*z**2 + &
      L_yyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxz*x**3 &
      + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 &
      + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z &
      **2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
#undef  Phi_0               
#undef  y                   
#undef  x                   
#undef  L_0                 
#undef  z                   
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
#undef  L_xz                
#undef  Phi_xz              
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
    end subroutine mom_es_L2P
    
! OPS  526*ADD + 254*DIV + 1356*MUL + 187*NEG + 63*POW + 417*SUB = 2803  (3214 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz,&
                S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy,&
                S_xxxxz, S_xxxyy, S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy, S_xyyyz,&
                S_yyyyy, S_yyyyz
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
    Ms_0     = Ms_0 + (M_0)
    Ms_x     = Ms_x + (M_0*x + M_x)
    Ms_y     = Ms_y + (M_0*y + M_y)
    Ms_z     = Ms_z + (M_0*z + M_z)
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
    S_0      = 1
    S_x      = x
    S_y      = y
    S_z      = z
    S_xy     = x*y
    Ms_xy    = Ms_xy + (M_0*S_xy + M_x*y + M_xy + M_y*x)
    S_xz     = x*z
    Ms_xz    = Ms_xz + (M_0*S_xz + M_x*z + M_xz + M_z*x)
    S_yz     = y*z
    Ms_yz    = Ms_yz + (M_0*S_yz + M_y*z + M_yz + M_z*y)
    S_xyz    = x*y*z
    Ms_xyz   = Ms_xyz + (M_0*S_xyz + M_x*S_yz + M_xy*z + M_xyz + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy)
    h        = x**2 + y**2 + z**2
    S_xx     = -1.0d0/3.0d0*h + x**2
    Ms_xx    = Ms_xx + (M_0*S_xx + (4.0d0/3.0d0)*M_x*x + M_xx - 2.0d0/3.0d0*(M_y*y + M_z*z))
    S_yy     = -1.0d0/3.0d0*h + y**2
    Ms_yy    = Ms_yy + (M_0*S_yy + (4.0d0/3.0d0)*M_y*y + M_yy - 2.0d0/3.0d0*(M_x*x + M_z*z))
    S_zz     = -(S_xx + S_yy)
    S_xxx    = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx   = Ms_xxx + (M_0*S_xxx + (9.0d0/5.0d0)*M_x*S_xx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(M_xx*x - M_xy*y - M_xz*z - M_y* &
      S_xy - M_z*S_xz))
    S_xxy    = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy   = Ms_xxy + (M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (1.0d0/15.0d0)*M_y*(15*S_xx - &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xy + M_xy*x) - 1.0d0/5.0d0*(3*M_yy &
      *y + 2*M_yz*z + 2*M_z*S_yz + y*(-M_xx - M_yy)))
    S_xxz    = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz   = Ms_xxz + (M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (1.0d0/15.0d0)*M_z*(21*S_xx + &
      6*S_yy) + (8.0d0/5.0d0)*(M_x*S_xz + M_xz*x) - 1.0d0/5.0d0*(2*M_y* &
      S_yz + M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy)))
    S_xyy    = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy   = Ms_xyy + (M_0*S_xyy + (1.0d0/15.0d0)*M_x*(-6*S_xx + 15*S_yy) + M_xyy + (4.0d0/ &
      5.0d0)*M_yy*x + (8.0d0/5.0d0)*(M_xy*y + M_y*S_xy) - 1.0d0/5.0d0*( &
      3*M_xx*x + 2*M_xz*z + 2*M_z*S_xz + x*(-M_xx - M_yy)))
    S_xzz    = -(S_xxx + S_xyy)
    S_yyy    = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy   = Ms_yyy + (M_0*S_yyy + (9.0d0/5.0d0)*M_y*S_yy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*( &
      -M_xx - M_yy)) + (6.0d0/5.0d0)*(-M_x*S_xy - M_xy*x + M_yy*y - &
      M_yz*z - M_z*S_yz))
    S_yyz    = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz   = Ms_yyz + (M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (1.0d0/15.0d0)*M_z*(6*S_xx + &
      21*S_yy) + (8.0d0/5.0d0)*(M_y*S_yz + M_yz*y) - 1.0d0/5.0d0*(2*M_x &
      *S_xz + M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy)))
    S_yzz    = -(S_xxy + S_yyy)
    S_zzz    = -(S_xxz + S_yyz)
    S_xxxx   = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*x**2 + x**4
    Ms_xxxx  = Ms_xxxx + (M_0*S_xxxx + (16.0d0/7.0d0)*M_x*S_xxx + (72.0d0/35.0d0)*M_xx*S_xx - &
      6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_yz*S_yz + (32.0d0/35.0d0) &
      *(M_xxx*x + M_xxxx) - 96.0d0/35.0d0*(M_xy*S_xy + M_xz*S_xz) - &
      12.0d0/7.0d0*(M_y*S_xxy + M_z*S_xxz) + (1.0d0/210.0d0)*(M_yy*( &
      -180*S_xx + 72*S_yy) + (-M_xx - M_yy)*(-252*S_xx - 72*S_yy)) - &
      3.0d0/35.0d0*(M_xxzz + M_yyyy + M_yyzz) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xxz*z + M_xyy*x + x*(-M_xxx - M_xyy)) + (12.0d0/35.0d0)*( &
      M_yyy*y + M_yyz*z + y*(-M_xxy - M_yyy) + z*(-M_xxz - M_yyz)))
    S_xxxy   = -3.0d0/7.0d0*h*x*y + x**3*y
    Ms_xxxy  = Ms_xxxy + (M_0*S_xxxy + (15.0d0/7.0d0)*M_x*S_xxy + (4.0d0/7.0d0)*M_xxx*y + M_xxxy + &
      (12.0d0/7.0d0)*(M_xx*S_xy + M_xxy*x) + (1.0d0/105.0d0)*(M_xy*(225 &
      *S_xx - 90*S_yy) + M_y*(105*S_xxx - 90*S_xyy)) - 9.0d0/7.0d0*( &
      M_xyy*y + M_yy*S_xy) - 6.0d0/7.0d0*(M_xyz*z + M_xz*S_yz + M_yz* &
      S_xz + M_z*S_xyz) - 3.0d0/7.0d0*(M_yyy*x + S_xy*(-M_xx - M_yy) + &
      x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy)))
    S_xxxz   = -3.0d0/7.0d0*h*x*z + x**3*z
    Ms_xxxz  = Ms_xxxz + (M_0*S_xxxz + (15.0d0/7.0d0)*M_x*S_xxz + (4.0d0/7.0d0)*M_xxx*z + M_xxxz + &
      (12.0d0/7.0d0)*(M_xx*S_xz + M_xxz*x) + (1.0d0/105.0d0)*(M_xz*(315 &
      *S_xx + 90*S_yy) + M_z*(195*S_xxx + 90*S_xyy)) - 9.0d0/7.0d0*( &
      S_xz*(-M_xx - M_yy) + z*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 3.0d0/7.0d0*(M_xyy*z + &
      M_yy*S_xz + M_yyz*x + x*(-M_xxz - M_yyz)))
    S_xxyy   = (1.0d0/35.0d0)*h**2 + x**2*y**2 - 1.0d0/7.0d0*(h*x**2 + h*y**2)
    Ms_xxyy  = Ms_xxyy + (M_0*S_xxyy + (33.0d0/35.0d0)*M_xxyy + (108.0d0/35.0d0)*M_xy*S_xy + ( &
      4.0d0/35.0d0)*z*(-M_xxz - M_yyz) + (54.0d0/35.0d0)*(M_xxy*y + &
      M_xyy*x) + (1.0d0/105.0d0)*(M_x*(-30*S_xxx + 180*S_xyy) + M_y*( &
      180*S_xxy - 30*S_yyy) + M_z*(-30*S_xxz - 30*S_yyz)) + (1.0d0/ &
      210.0d0)*(M_xx*(-126*S_xx + 180*S_yy) + M_yy*(180*S_xx - 126*S_yy &
      ) + (-M_xx - M_yy)*(-54*S_xx - 54*S_yy)) - 1.0d0/35.0d0*(16*M_xxx &
      *x + M_xxxx + 6*M_xxz*z + M_xxzz + 12*M_xz*S_xz + 16*M_yyy*y + &
      M_yyyy + 6*M_yyz*z + M_yyzz + 12*M_yz*S_yz + 6*x*(-M_xxx - M_xyy &
      ) + 6*y*(-M_xxy - M_yyy)))
    S_xxyz   = -1.0d0/7.0d0*h*y*z + x**2*y*z
    Ms_xxyz  = Ms_xxyz + (M_0*S_xxyz + M_xxyz + (9.0d0/7.0d0)*M_yz*S_xx + (1.0d0/105.0d0)*(M_y*( &
      105*S_xxz - 30*S_yyz) + M_z*(135*S_xxy + 30*S_yyy)) + (6.0d0/ &
      7.0d0)*(M_xx*S_yz + M_xxy*z + M_xxz*y) + (12.0d0/7.0d0)*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 1.0d0/7.0d0*(3*M_yy* &
      S_yz + M_yyy*z + 3*M_yyz*y + 3*S_yz*(-M_xx - M_yy) + y*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxy - M_yyy)))
    S_xxzz   = -(S_xxxx + S_xxyy)
    S_xyyy   = -3.0d0/7.0d0*h*x*y + x*y**3
    Ms_xyyy  = Ms_xyyy + (M_0*S_xyyy + M_xyyy + (15.0d0/7.0d0)*M_y*S_xyy + (4.0d0/7.0d0)*M_yyy*x + &
      (1.0d0/105.0d0)*(M_x*(-90*S_xxy + 105*S_yyy) + M_xy*(-90*S_xx + &
      225*S_yy)) - 9.0d0/7.0d0*(M_xx*S_xy + M_xxy*x) + (12.0d0/7.0d0)*( &
      M_xyy*y + M_yy*S_xy) - 3.0d0/7.0d0*(M_xxx*y + S_xy*(-M_xx - M_yy &
      ) + x*(-M_xxy - M_yyy) + y*(-M_xxx - M_xyy)) - 6.0d0/7.0d0*(M_xyz &
      *z + M_xz*S_yz + M_yz*S_xz + M_z*S_xyz))
    S_xyyz   = -1.0d0/7.0d0*h*x*z + x*y**2*z
    Ms_xyyz  = Ms_xyyz + (M_0*S_xyyz + M_xyyz + (9.0d0/7.0d0)*M_xz*S_yy + (1.0d0/105.0d0)*(M_x*( &
      -30*S_xxz + 105*S_yyz) + M_z*(30*S_xxx + 135*S_xyy)) + (6.0d0/ &
      7.0d0)*(M_xyy*z + M_yy*S_xz + M_yyz*x) + (12.0d0/7.0d0)*(M_xy* &
      S_yz + M_xyz*y + M_y*S_xyz + M_yz*S_xy) - 1.0d0/7.0d0*(3*M_xx* &
      S_xz + M_xxx*z + 3*M_xxz*x + 3*S_xz*(-M_xx - M_yy) + x*(-M_xxz - &
      M_yyz) + 3*z*(-M_xxx - M_xyy)))
    S_xyzz   = -(S_xxxy + S_xyyy)
    S_xzzz   = -(S_xxxz + S_xyyz)
    S_yyyy   = (3.0d0/35.0d0)*h**2 - 6.0d0/7.0d0*h*y**2 + y**4
    Ms_yyyy  = Ms_yyyy + (M_0*S_yyyy - 6.0d0/35.0d0*M_xxyy + (24.0d0/35.0d0)*M_xz*S_xz + (16.0d0/ &
      7.0d0)*M_y*S_yyy + (72.0d0/35.0d0)*M_yy*S_yy - 12.0d0/7.0d0*(M_x* &
      S_xyy + M_z*S_yyz) + (1.0d0/210.0d0)*(M_xx*(72*S_xx - 180*S_yy) + &
      (-M_xx - M_yy)*(-72*S_xx - 252*S_yy)) - 96.0d0/35.0d0*(M_xy*S_xy &
      + M_yz*S_yz) + (32.0d0/35.0d0)*(M_yyy*y + M_yyyy) - 3.0d0/35.0d0* &
      (M_xxxx + M_xxzz + M_yyzz) + (12.0d0/35.0d0)*(M_xxx*x + M_xxz*z + &
      x*(-M_xxx - M_xyy) + z*(-M_xxz - M_yyz)) - 48.0d0/35.0d0*(M_xxy*y &
      + M_xyy*x + M_yyz*z + y*(-M_xxy - M_yyy)))
    S_yyyz   = -3.0d0/7.0d0*h*y*z + y**3*z
    Ms_yyyz  = Ms_yyyz + (M_0*S_yyyz + (15.0d0/7.0d0)*M_y*S_yyz + (4.0d0/7.0d0)*M_yyy*z + M_yyyz + &
      (12.0d0/7.0d0)*(M_yy*S_yz + M_yyz*y) + (1.0d0/105.0d0)*(M_yz*(90* &
      S_xx + 315*S_yy) + M_z*(90*S_xxy + 195*S_yyy)) - 9.0d0/7.0d0*( &
      S_yz*(-M_xx - M_yy) + z*(-M_xxy - M_yyy)) - 6.0d0/7.0d0*(M_x* &
      S_xyz + M_xy*S_xz + M_xyz*x + M_xz*S_xy) - 3.0d0/7.0d0*(M_xx*S_yz &
      + M_xxy*z + M_xxz*y + y*(-M_xxz - M_yyz)))
    S_yyzz   = -(S_xxyy + S_yyyy)
    S_yzzz   = -(S_xxyz + S_yyyz)
    S_zzzz   = -(S_xxzz + S_yyzz)
    S_xxxxx  = (5.0d0/21.0d0)*h**2*x - 10.0d0/9.0d0*h*x**3 + x**5
    Ms_xxxxx = Ms_xxxxx + (M_0*S_xxxxx + (1.0d0/945.0d0)*M_x*(2400*S_xxxx - 450*S_xxyy - 225*S_xxzz &
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
    S_xxxxy  = (1.0d0/21.0d0)*h**2*y - 2.0d0/3.0d0*h*x**2*y + x**4*y
    Ms_xxxxy = Ms_xxxxy + (M_0*S_xxxxy + (8.0d0/3.0d0)*M_x*S_xxxy + (20.0d0/7.0d0)*M_xx*S_xxy - &
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
    S_xxxxz  = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*x**2*z + x**4*z
    Ms_xxxxz = Ms_xxxxz + (M_0*S_xxxxz + (8.0d0/3.0d0)*M_x*S_xxxz + (20.0d0/7.0d0)*M_xx*S_xxz - &
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
    S_xxxyy  = (1.0d0/21.0d0)*h**2*x - 1.0d0/9.0d0*h*x**3 - 1.0d0/3.0d0*h*x*y**2 + x**3 &
      *y**2
    Ms_xxxyy = Ms_xxxyy + (M_0*S_xxxyy + (1.0d0/5670.0d0)*M_xxx*(-3510*S_xx + 3780*S_yy) - 20.0d0/ &
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
    S_xxxyz  = -1.0d0/3.0d0*h*x*y*z + x**3*y*z
    Ms_xxxyz = Ms_xxxyz + (M_0*S_xxxyz + (7.0d0/3.0d0)*M_x*S_xxyz + M_xxxyz + 3*M_xyz*S_xx + (5.0d0 &
      /3.0d0)*M_yz*S_xxx + (1.0d0/945.0d0)*(M_xy*(2205*S_xxz - 630* &
      S_yyz) + M_xz*(2835*S_xxy + 630*S_yyy) + M_y*(945*S_xxxz - 630* &
      S_xyyz) + M_z*(1575*S_xxxy + 630*S_xyyy)) + 2*(M_xx*S_xyz + 3* &
      M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz*y + M_xxy*S_xz + M_xxyz*x + &
      M_xxz*S_xy) - (M_xyy*S_yz + 3*M_xyyy*z + M_xyyz*y + M_yy*S_xyz + &
      3*M_yyy*S_xz + 3*M_yyyz*x + M_yyz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy)))
    S_xxyyy  = (1.0d0/21.0d0)*h**2*y - 1.0d0/3.0d0*h*x**2*y - 1.0d0/9.0d0*h*y**3 + x**2 &
      *y**3
    Ms_xxyyy = Ms_xxyyy + (M_0*S_xxyyy - 2.0d0/7.0d0*M_xxxx*y + (82.0d0/63.0d0)*M_xyyy*x + (1.0d0/ &
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
    S_xxyyz  = (1.0d0/63.0d0)*h**2*z + x**2*y**2*z - 1.0d0/9.0d0*(h*x**2*z + h*y**2*z)
    Ms_xxyyz = Ms_xxyyz + (M_0*S_xxyyz + (17.0d0/21.0d0)*M_xxyy*z + (61.0d0/63.0d0)*M_xxyyz + ( &
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
    S_xyyyy  = (1.0d0/21.0d0)*h**2*x - 2.0d0/3.0d0*h*x*y**2 + x*y**4
    Ms_xyyyy = Ms_xyyyy + (M_0*S_xyyyy + (1.0d0/5670.0d0)*M_xxx*(2160*S_xx - 3780*S_yy) - 24.0d0/ &
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
    S_xyyyz  = -1.0d0/3.0d0*h*x*y*z + x*y**3*z
    Ms_xyyyz = Ms_xyyyz + (M_0*S_xyyyz + M_xyyyz + 3*M_xyz*S_yy + (5.0d0/3.0d0)*M_xz*S_yyy + (7.0d0 &
      /3.0d0)*M_y*S_xyyz + (1.0d0/945.0d0)*(M_x*(-630*S_xxyz + 945* &
      S_yyyz) + M_xy*(-630*S_xxz + 2205*S_yyz) + M_yz*(630*S_xxx + 2835 &
      *S_xyy) + M_z*(630*S_xxxy + 1575*S_xyyy)) + 2*(M_xyy*S_yz + 3* &
      M_xyyy*z + M_xyyz*y + M_yy*S_xyz + 3*M_yyy*S_xz + 3*M_yyyz*x + &
      M_yyz*S_xy) - (M_xx*S_xyz + 3*M_xxx*S_yz + 3*M_xxxy*z + 3*M_xxxz* &
      y + M_xxy*S_xz + M_xxyz*x + M_xxz*S_xy + 3*S_xy*(-M_xxz - M_yyz) &
      + S_xyz*(-M_xx - M_yy) + S_xz*(-M_xxy - M_yyy) + S_yz*(-M_xxx - &
      M_xyy) + 3*x*(-M_xxyz - M_yyyz) + 3*y*(-M_xxxz - M_xyyz) + z*( &
      -M_xxxy - M_xyyy)))
    S_yyyyy  = (5.0d0/21.0d0)*h**2*y - 10.0d0/9.0d0*h*y**3 + y**5
    Ms_yyyyy = Ms_yyyyy + (M_0*S_yyyyy + (1.0d0/945.0d0)*M_y*(-225*S_xxxx - 450*S_xxyy - 225*S_xxzz &
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
    S_yyyyz  = (1.0d0/21.0d0)*h**2*z - 2.0d0/3.0d0*h*y**2*z + y**4*z
    Ms_yyyyz = Ms_yyyyz + (M_0*S_yyyyz - 4.0d0/3.0d0*M_x*S_xyyz - 6.0d0/7.0d0*M_xxz*S_yy + (8.0d0/ &
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
    end subroutine mom_es_M2M_add
    
! OPS  351*ADD + 37*DIV + 616*MUL + 44*NEG + 143*POW + 37*SUB = 1228  (1466 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y,&
                D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
                D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx,&
                D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz,&
                D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz,&
                D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy,&
                D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz,&
                D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define M_x                  M(1)
#define L_x                  L(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define L_xz                 L(6)
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
#define L_yyy                L(14)
#define M_yyy                M(14)
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
#define L_xxyz               L(20)
#define M_xxyz               M(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define L_xyyz               L(22)
#define M_xyyz               M(22)
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
    M_zz    = -(M_xx + M_yy)
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    M_xxzz  = -(M_xxxx + M_xxyy)
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    M_xxxzz = -(M_xxxxx + M_xxxyy)
    M_xxyzz = -(M_xxxxy + M_xxyyy)
    M_xxzzz = -(M_xxxxz + M_xxyyz)
    M_xyyzz = -(M_xxxyy + M_xyyyy)
    M_xyzzz = -(M_xxxyz + M_xyyyz)
    M_xzzzz = -(M_xxxzz + M_xyyzz)
    M_yyyzz = -(M_xxyyy + M_yyyyy)
    M_yyzzz = -(M_xxyyz + M_yyyyz)
    M_yzzzz = -(M_xxyzz + M_yyyzz)
    M_zzzzz = -(M_xxzzz + M_yyzzz)
    h       = x**2 + y**2 + z**2
    u2      = 1.0/h
    u       = sqrt(u2)
    D_0     = u
    D_x     = -u**3*x
    D_y     = -u**3*y
    D_z     = -u**3*z
    D_xx    = -h*u**5 + 3*u**5*x**2
    D_xy    = 3*u**5*x*y
    D_xz    = 3*u**5*x*z
    D_yy    = -h*u**5 + 3*u**5*y**2
    D_yz    = 3*u**5*y*z
    D_zz    = -(D_xx + D_yy)
    D_xxx   = 9*h*u**7*x - 15*u**7*x**3
    D_xxy   = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz   = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy   = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz   = -15*u**7*x*y*z
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = 9*h*u**7*y - 15*u**7*y**3
    D_yyz   = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    D_xxxx  = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy  = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz  = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy  = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz  = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz  = -(D_xxxx + D_xxyy)
    D_xyyy  = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz  = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz  = -(D_xxxy + D_xyyy)
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz  = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    D_xxxxx = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    L_xxxxx = L_xxxxx + (D_xxxxx*M_0)
    D_xxxxy = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    L_xxxxy = L_xxxxy + (D_xxxxy*M_0)
    D_xxxxz = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    L_xxxx  = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z)
    L_xxxxz = L_xxxxz + (D_xxxxz*M_0)
    D_xxxyy = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    L_xxxyy = L_xxxyy + (D_xxxyy*M_0)
    D_xxxyz = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    L_xxxy  = L_xxxy + (D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z)
    L_xxxyz = L_xxxyz + (D_xxxyz*M_0)
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    L_xxx   = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxy*M_xy + D_xxxxz*M_xz + D_xxxy*M_y + &
      D_xxxyz*M_yz + D_xxxz*M_z + (1.0d0/2.0d0)*(D_xxxxx*M_xx + D_xxxyy &
      *M_yy + D_xxxzz*M_zz))
    L_xxxz  = L_xxxz + (D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z)
    D_xxyyy = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    L_xxyyy = L_xxyyy + (D_xxyyy*M_0)
    D_xxyyz = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    L_xxyy  = L_xxyy + (D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z)
    L_xxyyz = L_xxyyz + (D_xxyyz*M_0)
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    L_xxy   = L_xxy + (D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + &
      D_xxyyz*M_yz + D_xxyz*M_z + (1.0d0/2.0d0)*(D_xxxxy*M_xx + D_xxyyy &
      *M_yy + D_xxyzz*M_zz))
    L_xxyz  = L_xxyz + (D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z)
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    L_xx    = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy &
      *M_y + D_xxyz*M_yz + D_xxz*M_z + (1.0d0/6.0d0)*(D_xxxxx*M_xxx + &
      D_xxyyy*M_yyy + D_xxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxx*M_xx + &
      D_xxxxy*M_xxy + D_xxxxz*M_xxz + D_xxxyy*M_xyy + D_xxxzz*M_xzz + &
      D_xxyy*M_yy + D_xxyyz*M_yyz + D_xxyzz*M_yzz + D_xxzz*M_zz))
    L_xxz   = L_xxz + (D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + &
      D_xxz*M_0 + D_xxzz*M_z + (1.0d0/2.0d0)*(D_xxxxz*M_xx + D_xxyyz* &
      M_yy + D_xxzzz*M_zz))
    D_xyyyy = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    L_xyyyy = L_xyyyy + (D_xyyyy*M_0)
    D_xyyyz = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    L_xyyy  = L_xyyy + (D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z)
    L_xyyyz = L_xyyyz + (D_xyyyz*M_0)
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    L_xyy   = L_xyy + (D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + &
      D_xyyyz*M_yz + D_xyyz*M_z + (1.0d0/2.0d0)*(D_xxxyy*M_xx + D_xyyyy &
      *M_yy + D_xyyzz*M_zz))
    L_xyyz  = L_xyyz + (D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z)
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    L_xy    = L_xy + (D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy &
      *M_y + D_xyyz*M_yz + D_xyz*M_z + (1.0d0/6.0d0)*(D_xxxxy*M_xxx + &
      D_xyyyy*M_yyy + D_xyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxy*M_xx + &
      D_xxxyy*M_xxy + D_xxxyz*M_xxz + D_xxyyy*M_xyy + D_xxyzz*M_xzz + &
      D_xyyy*M_yy + D_xyyyz*M_yyz + D_xyyzz*M_yzz + D_xyzz*M_zz))
    L_xyz   = L_xyz + (D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + &
      D_xyz*M_0 + D_xyzz*M_z + (1.0d0/2.0d0)*(D_xxxyz*M_xx + D_xyyyz* &
      M_yy + D_xyzzz*M_zz))
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = L_x + (D_x*M_0 + D_xx*M_x + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + &
      D_xyz*M_yz + D_xz*M_z + (1.0d0/24.0d0)*(D_xxxxx*M_xxxx + D_xyyyy* &
      M_yyyy + D_xzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyy*M_xxyy + &
      D_xxxzz*M_xxzz + D_xyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxx*M_xxx + &
      D_xxxxy*M_xxxy + D_xxxxz*M_xxxz + D_xxyyy*M_xyyy + D_xxzzz*M_xzzz &
      + D_xyyy*M_yyy + D_xyyyz*M_yyyz + D_xyzzz*M_yzzz + D_xzzz*M_zzz) &
      + (1.0d0/2.0d0)*(D_xxx*M_xx + D_xxxy*M_xxy + D_xxxyz*M_xxyz + &
      D_xxxz*M_xxz + D_xxyy*M_xyy + D_xxyyz*M_xyyz + D_xxyzz*M_xyzz + &
      D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz* &
      M_zz))
    L_xz    = L_xz + (D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + &
      D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + (1.0d0/6.0d0)*(D_xxxxz*M_xxx &
      + D_xyyyz*M_yyy + D_xzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyz*M_xxy + &
      D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxyyz*M_xyy + D_xxzzz*M_xzz + &
      D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz*M_yzz + D_xzzz*M_zz))
    D_yyyyy = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    L_yyyyy = L_yyyyy + (D_yyyyy*M_0)
    D_yyyyz = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    L_yyyy  = L_yyyy + (D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z)
    L_yyyyz = L_yyyyz + (D_yyyyz*M_0)
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = L_yyy + (D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + &
      D_yyyyz*M_yz + D_yyyz*M_z + (1.0d0/2.0d0)*(D_xxyyy*M_xx + D_yyyyy &
      *M_yy + D_yyyzz*M_zz))
    L_yyyz  = L_yyyz + (D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z)
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = L_yy + (D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy &
      *M_y + D_yyyz*M_yz + D_yyz*M_z + (1.0d0/6.0d0)*(D_xxxyy*M_xxx + &
      D_yyyyy*M_yyy + D_yyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyy*M_xx + &
      D_xxyyy*M_xxy + D_xxyyz*M_xxz + D_xyyyy*M_xyy + D_xyyzz*M_xzz + &
      D_yyyy*M_yy + D_yyyyz*M_yyz + D_yyyzz*M_yzz + D_yyzz*M_zz))
    L_yyz   = L_yyz + (D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyz*M_y + D_yyyzz*M_yz + &
      D_yyz*M_0 + D_yyzz*M_z + (1.0d0/2.0d0)*(D_xxyyz*M_xx + D_yyyyz* &
      M_yy + D_yyzzz*M_zz))
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = L_y + (D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyz*M_yz + D_yz*M_z + (1.0d0/24.0d0)*(D_xxxxy*M_xxxx + D_yyyyy* &
      M_yyyy + D_yzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyy*M_xxyy + &
      D_xxyzz*M_xxzz + D_yyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + &
      D_xxxyy*M_xxxy + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + D_xyzzz*M_xzzz &
      + D_yyyy*M_yyy + D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) &
      + (1.0d0/2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + &
      D_xxyz*M_xxz + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + &
      D_xyzz*M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz* &
      M_zz))
    L_yz    = L_yz + (D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyz*M_y + &
      D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + (1.0d0/6.0d0)*(D_xxxyz*M_xxx &
      + D_yyyyz*M_yyy + D_yzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyz*M_xxy + &
      D_xxyz*M_xx + D_xxyzz*M_xxz + D_xyyyz*M_xyy + D_xyzzz*M_xzz + &
      D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz*M_yzz + D_yzzz*M_zz))
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = L_0 + (D_0*M_0 + D_x*M_x + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + D_yz &
      *M_yz + D_z*M_z + (1.0d0/120.0d0)*(D_xxxxx*M_xxxxx + D_yyyyy* &
      M_yyyyy + D_zzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyy*M_xxxyy + &
      D_xxxzz*M_xxxzz + D_xxyyy*M_xxyyy + D_xxzzz*M_xxzzz + D_yyyzz* &
      M_yyyzz + D_yyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyy*M_xxyy + &
      D_xxyyz*M_xxyyz + D_xxyzz*M_xxyzz + D_xxzz*M_xxzz + D_xyyzz* &
      M_xyyzz + D_yyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxx*M_xxxx + &
      D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + D_xyyyy*M_xyyyy + D_xzzzz* &
      M_xzzzz + D_yyyy*M_yyyy + D_yyyyz*M_yyyyz + D_yzzzz*M_yzzzz + &
      D_zzzz*M_zzzz) + (1.0d0/2.0d0)*(D_xx*M_xx + D_xxy*M_xxy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xyy*M_xyy + D_xyyz*M_xyyz + D_xyzz* &
      M_xyzz + D_xzz*M_xzz + D_yy*M_yy + D_yyz*M_yyz + D_yzz*M_yzz + &
      D_zz*M_zz) + (1.0d0/6.0d0)*(D_xxx*M_xxx + D_xxxy*M_xxxy + D_xxxyz &
      *M_xxxyz + D_xxxz*M_xxxz + D_xyyy*M_xyyy + D_xyyyz*M_xyyyz + &
      D_xyzzz*M_xyzzz + D_xzzz*M_xzzz + D_yyy*M_yyy + D_yyyz*M_yyyz + &
      D_yzzz*M_yzzz + D_zzz*M_zzz))
    L_z     = L_z + (D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yz*M_y + D_yzz* &
      M_yz + D_z*M_0 + D_zz*M_z + (1.0d0/24.0d0)*(D_xxxxz*M_xxxx + &
      D_yyyyz*M_yyyy + D_zzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyz*M_xxyy &
      + D_xxzzz*M_xxzz + D_yyzzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxyz* &
      M_xxxy + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy + D_xzzzz &
      *M_xzzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz &
      *M_zzz) + (1.0d0/2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz* &
      M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz* &
      M_xyzz + D_xzzz*M_xzz + D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz &
      + D_zzz*M_zz))
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  L_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  M_xx                
#undef  L_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
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
#undef  L_yyy               
#undef  M_yyy               
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
#undef  L_xxyz              
#undef  M_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
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
    end subroutine mom_es_M2L_add
    
! OPS  342*ADD + 35*DIV + 546*MUL + 20*NEG + 231*POW = 1174  (1398 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz,&
                L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz,&
                L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz,&
                L_yyzzz, L_yzzzz, L_zzzzz
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
#define Ls_xxxyz             Ls(29)
#define L_xxxyz              L(29)
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
    Ls_xxxx  = Ls_xxxx + (L_xxxx + L_xxxxx*x + L_xxxxy*y + L_xxxxz*z)
    Ls_xxxy  = Ls_xxxy + (L_xxxxy*x + L_xxxy + L_xxxyy*y + L_xxxyz*z)
    Ls_xxyy  = Ls_xxyy + (L_xxxyy*x + L_xxyy + L_xxyyy*y + L_xxyyz*z)
    Ls_xyyy  = Ls_xyyy + (L_xxyyy*x + L_xyyy + L_xyyyy*y + L_xyyyz*z)
    Ls_yyyy  = Ls_yyyy + (L_xyyyy*x + L_yyyy + L_yyyyy*y + L_yyyyz*z)
    Ls_xxxxx = Ls_xxxxx + (L_xxxxx)
    Ls_xxxxy = Ls_xxxxy + (L_xxxxy)
    Ls_xxxxz = Ls_xxxxz + (L_xxxxz)
    Ls_xxxyy = Ls_xxxyy + (L_xxxyy)
    Ls_xxxyz = Ls_xxxyz + (L_xxxyz)
    Ls_xxyyy = Ls_xxyyy + (L_xxyyy)
    Ls_xxyyz = Ls_xxyyz + (L_xxyyz)
    Ls_xyyyy = Ls_xyyyy + (L_xyyyy)
    Ls_xyyyz = Ls_xyyyz + (L_xyyyz)
    Ls_yyyyy = Ls_yyyyy + (L_yyyyy)
    Ls_yyyyz = Ls_yyyyz + (L_yyyyz)
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
    Ls_xxx   = Ls_xxx + (L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxz*x*z + L_xxxy*y + L_xxxyz*y*z + &
      L_xxxz*z + (1.0d0/2.0d0)*(L_xxxxx*x**2 + L_xxxyy*y**2 + L_xxxzz*z &
      **2))
    Ls_xxxz  = Ls_xxxz + (L_xxxxz*x + L_xxxyz*y + L_xxxz + L_xxxzz*z)
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    Ls_xxy   = Ls_xxy + (L_xxxy*x + L_xxxyy*x*y + L_xxxyz*x*z + L_xxy + L_xxyy*y + L_xxyyz*y*z + &
      L_xxyz*z + (1.0d0/2.0d0)*(L_xxxxy*x**2 + L_xxyyy*y**2 + L_xxyzz*z &
      **2))
    Ls_xxyz  = Ls_xxyz + (L_xxxyz*x + L_xxyyz*y + L_xxyz + L_xxyzz*z)
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    Ls_xx    = Ls_xx + (L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/6.0d0)*(L_xxxxx*x**3 + L_xxyyy*y**3 &
      + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2))
    Ls_xxz   = Ls_xxz + (L_xxxyz*x*y + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + L_xxyzz*y*z + L_xxz + &
      L_xxzz*z + (1.0d0/2.0d0)*(L_xxxxz*x**2 + L_xxyyz*y**2 + L_xxzzz*z &
      **2))
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    Ls_xyy   = Ls_xyy + (L_xxyy*x + L_xxyyy*x*y + L_xxyyz*x*z + L_xyy + L_xyyy*y + L_xyyyz*y*z + &
      L_xyyz*z + (1.0d0/2.0d0)*(L_xxxyy*x**2 + L_xyyyy*y**2 + L_xyyzz*z &
      **2))
    Ls_xyyz  = Ls_xyyz + (L_xxyyz*x + L_xyyyz*y + L_xyyz + L_xyyzz*z)
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    Ls_xy    = Ls_xy + (L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xyyyy*y**3 &
      + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2))
    Ls_xyz   = Ls_xyz + (L_xxyyz*x*y + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + L_xyyzz*y*z + L_xyz + &
      L_xyzz*z + (1.0d0/2.0d0)*(L_xxxyz*x**2 + L_xyyyz*y**2 + L_xyzzz*z &
      **2))
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    Ls_x     = Ls_x + (L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xyyyy*y**4 + L_xzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + L_xxxzz*x**2*z**2 + &
      L_xyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y &
      + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 &
      + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z &
      **2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + L_xzz*z**2))
    Ls_xz    = Ls_xz + (L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/6.0d0)*(L_xxxxz*x**3 + L_xyyyz*y**3 + &
      L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxz*x**2 + &
      L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + &
      L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2))
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    Ls_yyy   = Ls_yyy + (L_xyyy*x + L_xyyyy*x*y + L_xyyyz*x*z + L_yyy + L_yyyy*y + L_yyyyz*y*z + &
      L_yyyz*z + (1.0d0/2.0d0)*(L_xxyyy*x**2 + L_yyyyy*y**2 + L_yyyzz*z &
      **2))
    Ls_yyyz  = Ls_yyyz + (L_xyyyz*x + L_yyyyz*y + L_yyyz + L_yyyzz*z)
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    Ls_yy    = Ls_yy + (L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_yyyyy*y**3 &
      + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2))
    Ls_yyz   = Ls_yyz + (L_xyyyz*x*y + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + L_yyyzz*y*z + L_yyz + &
      L_yyzz*z + (1.0d0/2.0d0)*(L_xxyyz*x**2 + L_yyyyz*y**2 + L_yyzzz*z &
      **2))
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    Ls_y     = Ls_y + (L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/24.0d0)*(L_xxxxy*x**4 + L_yyyyy*y**4 + L_yzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + L_xxyzz*x**2*z**2 + &
      L_yyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y &
      + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 &
      + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z &
      **2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + L_yzz*z**2))
    Ls_yz    = Ls_yz + (L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/6.0d0)*(L_xxxyz*x**3 + L_yyyyz*y**3 + &
      L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyz*x**2 + &
      L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + &
      L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2))
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    Ls_0     = Ls_0 + (L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_yyyyy*y**5 + L_zzzzz*z**5 &
      ) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxzzz*x**2*z**3 + L_yyyzz*y**3*z**2 + &
      L_yyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x &
      **2*y**2*z + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y &
      **2*z**2 + L_yyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxx*x**4 + &
      L_xxxxy*x**4*y + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xzzzz*x*z**4 &
      + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + &
      (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz &
      *x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3))
    Ls_z     = Ls_z + (L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/24.0d0)*(L_xxxxz*x**4 + L_yyyyz*y**4 + L_zzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + L_xxzzz*x**2*z**2 + &
      L_yyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxz*x**3 &
      + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 &
      + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z &
      **2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2))
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
#undef  Ls_xxxyz            
#undef  L_xxxyz             
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
    end subroutine mom_es_L2L_add
    
! OPS  351*ADD + 37*DIV + 616*MUL + 44*NEG + 143*POW + 37*SUB = 1228  (1466 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y,&
                D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
                D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx,&
                D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz,&
                D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz,&
                D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy,&
                D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz,&
                D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define M_x                  M(1:2,1)
#define L_x                  L(1:2,1)
#define L_y                  L(1:2,2)
#define M_y                  M(1:2,2)
#define L_z                  L(1:2,3)
#define M_z                  M(1:2,3)
#define M_xx                 M(1:2,4)
#define L_xx                 L(1:2,4)
#define L_xy                 L(1:2,5)
#define M_xy                 M(1:2,5)
#define M_xz                 M(1:2,6)
#define L_xz                 L(1:2,6)
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
#define L_yyy                L(1:2,14)
#define M_yyy                M(1:2,14)
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
#define L_xxyz               L(1:2,20)
#define M_xxyz               M(1:2,20)
#define L_xyyy               L(1:2,21)
#define M_xyyy               M(1:2,21)
#define L_xyyz               L(1:2,22)
#define M_xyyz               M(1:2,22)
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
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    M_zz    = -(M_xx + M_yy)
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    M_xxzz  = -(M_xxxx + M_xxyy)
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    M_xxxzz = -(M_xxxxx + M_xxxyy)
    M_xxyzz = -(M_xxxxy + M_xxyyy)
    M_xxzzz = -(M_xxxxz + M_xxyyz)
    M_xyyzz = -(M_xxxyy + M_xyyyy)
    M_xyzzz = -(M_xxxyz + M_xyyyz)
    M_xzzzz = -(M_xxxzz + M_xyyzz)
    M_yyyzz = -(M_xxyyy + M_yyyyy)
    M_yyzzz = -(M_xxyyz + M_yyyyz)
    M_yzzzz = -(M_xxyzz + M_yyyzz)
    M_zzzzz = -(M_xxzzz + M_yyzzz)
    h       = x**2 + y**2 + z**2
    u2      = 1.0/h
    u       = sqrt(u2)
    D_0     = u
    D_x     = -u**3*x
    D_y     = -u**3*y
    D_z     = -u**3*z
    D_xx    = -h*u**5 + 3*u**5*x**2
    D_xy    = 3*u**5*x*y
    D_xz    = 3*u**5*x*z
    D_yy    = -h*u**5 + 3*u**5*y**2
    D_yz    = 3*u**5*y*z
    D_zz    = -(D_xx + D_yy)
    D_xxx   = 9*h*u**7*x - 15*u**7*x**3
    D_xxy   = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz   = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy   = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz   = -15*u**7*x*y*z
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = 9*h*u**7*y - 15*u**7*y**3
    D_yyz   = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    D_xxxx  = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    D_xxxy  = -45*h*u**9*x*y + 105*u**9*x**3*y
    D_xxxz  = -45*h*u**9*x*z + 105*u**9*x**3*z
    D_xxyy  = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    D_xxyz  = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    D_xxzz  = -(D_xxxx + D_xxyy)
    D_xyyy  = -45*h*u**9*x*y + 105*u**9*x*y**3
    D_xyyz  = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    D_xyzz  = -(D_xxxy + D_xyyy)
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    D_yyyz  = -45*h*u**9*y*z + 105*u**9*y**3*z
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    D_xxxxx = -225*h**2*u**11*x + 1050*h*u**11*x**3 - 945*u**11*x**5
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = -45*h**2*u**11*y + 630*h*u**11*x**2*y - 945*u**11*x**4*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = -45*h**2*u**11*z + 630*h*u**11*x**2*z - 945*u**11*x**4*z
    L_xxxx  = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = -45*h**2*u**11*x + 105*h*u**11*x**3 + 315*h*u**11*x*y**2 - 945*u**11*x** &
      3*y**2
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = 315*h*u**11*x*y*z - 945*u**11*x**3*y*z
    L_xxxy  = D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    L_xxx   = D_xxx*M_0 + D_xxxx*M_x + D_xxxxy*M_xy + D_xxxxz*M_xz + D_xxxy*M_y + &
      D_xxxyz*M_yz + D_xxxz*M_z + (1.0d0/2.0d0)*(D_xxxxx*M_xx + D_xxxyy &
      *M_yy + D_xxxzz*M_zz)
    L_xxxz  = D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z
    D_xxyyy = -45*h**2*u**11*y + 315*h*u**11*x**2*y + 105*h*u**11*y**3 - 945*u**11*x** &
      2*y**3
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = -15*h**2*u**11*z - 945*u**11*x**2*y**2*z + 105*(h*u**11*x**2*z + h*u**11 &
      *y**2*z)
    L_xxyy  = D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    L_xxy   = D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + &
      D_xxyyz*M_yz + D_xxyz*M_z + (1.0d0/2.0d0)*(D_xxxxy*M_xx + D_xxyyy &
      *M_yy + D_xxyzz*M_zz)
    L_xxyz  = D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    L_xx    = D_xx*M_0 + D_xxx*M_x + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy &
      *M_y + D_xxyz*M_yz + D_xxz*M_z + (1.0d0/6.0d0)*(D_xxxxx*M_xxx + &
      D_xxyyy*M_yyy + D_xxzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxx*M_xx + &
      D_xxxxy*M_xxy + D_xxxxz*M_xxz + D_xxxyy*M_xyy + D_xxxzz*M_xzz + &
      D_xxyy*M_yy + D_xxyyz*M_yyz + D_xxyzz*M_yzz + D_xxzz*M_zz)
    L_xxz   = D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + &
      D_xxz*M_0 + D_xxzz*M_z + (1.0d0/2.0d0)*(D_xxxxz*M_xx + D_xxyyz* &
      M_yy + D_xxzzz*M_zz)
    D_xyyyy = -45*h**2*u**11*x + 630*h*u**11*x*y**2 - 945*u**11*x*y**4
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = 315*h*u**11*x*y*z - 945*u**11*x*y**3*z
    L_xyyy  = D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    L_xyy   = D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + &
      D_xyyyz*M_yz + D_xyyz*M_z + (1.0d0/2.0d0)*(D_xxxyy*M_xx + D_xyyyy &
      *M_yy + D_xyyzz*M_zz)
    L_xyyz  = D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    L_xy    = D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy &
      *M_y + D_xyyz*M_yz + D_xyz*M_z + (1.0d0/6.0d0)*(D_xxxxy*M_xxx + &
      D_xyyyy*M_yyy + D_xyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxy*M_xx + &
      D_xxxyy*M_xxy + D_xxxyz*M_xxz + D_xxyyy*M_xyy + D_xxyzz*M_xzz + &
      D_xyyy*M_yy + D_xyyyz*M_yyz + D_xyyzz*M_yzz + D_xyzz*M_zz)
    L_xyz   = D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + &
      D_xyz*M_0 + D_xyzz*M_z + (1.0d0/2.0d0)*(D_xxxyz*M_xx + D_xyyyz* &
      M_yy + D_xyzzz*M_zz)
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = D_x*M_0 + D_xx*M_x + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + &
      D_xyz*M_yz + D_xz*M_z + (1.0d0/24.0d0)*(D_xxxxx*M_xxxx + D_xyyyy* &
      M_yyyy + D_xzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxxyy*M_xxyy + &
      D_xxxzz*M_xxzz + D_xyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxx*M_xxx + &
      D_xxxxy*M_xxxy + D_xxxxz*M_xxxz + D_xxyyy*M_xyyy + D_xxzzz*M_xzzz &
      + D_xyyy*M_yyy + D_xyyyz*M_yyyz + D_xyzzz*M_yzzz + D_xzzz*M_zzz) &
      + (1.0d0/2.0d0)*(D_xxx*M_xx + D_xxxy*M_xxy + D_xxxyz*M_xxyz + &
      D_xxxz*M_xxz + D_xxyy*M_xyy + D_xxyyz*M_xyyz + D_xxyzz*M_xyzz + &
      D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz* &
      M_zz)
    L_xz    = D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + &
      D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + (1.0d0/6.0d0)*(D_xxxxz*M_xxx &
      + D_xyyyz*M_yyy + D_xzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxxyz*M_xxy + &
      D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxyyz*M_xyy + D_xxzzz*M_xzz + &
      D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyzzz*M_yzz + D_xzzz*M_zz)
    D_yyyyy = -225*h**2*u**11*y + 1050*h*u**11*y**3 - 945*u**11*y**5
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = -45*h**2*u**11*z + 630*h*u**11*y**2*z - 945*u**11*y**4*z
    L_yyyy  = D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + &
      D_yyyyz*M_yz + D_yyyz*M_z + (1.0d0/2.0d0)*(D_xxyyy*M_xx + D_yyyyy &
      *M_yy + D_yyyzz*M_zz)
    L_yyyz  = D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy &
      *M_y + D_yyyz*M_yz + D_yyz*M_z + (1.0d0/6.0d0)*(D_xxxyy*M_xxx + &
      D_yyyyy*M_yyy + D_yyzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyy*M_xx + &
      D_xxyyy*M_xxy + D_xxyyz*M_xxz + D_xyyyy*M_xyy + D_xyyzz*M_xzz + &
      D_yyyy*M_yy + D_yyyyz*M_yyz + D_yyyzz*M_yzz + D_yyzz*M_zz)
    L_yyz   = D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyz*M_y + D_yyyzz*M_yz + &
      D_yyz*M_0 + D_yyzz*M_z + (1.0d0/2.0d0)*(D_xxyyz*M_xx + D_yyyyz* &
      M_yy + D_yyzzz*M_zz)
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyz*M_yz + D_yz*M_z + (1.0d0/24.0d0)*(D_xxxxy*M_xxxx + D_yyyyy* &
      M_yyyy + D_yzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyy*M_xxyy + &
      D_xxyzz*M_xxzz + D_yyyzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxy*M_xxx + &
      D_xxxyy*M_xxxy + D_xxxyz*M_xxxz + D_xyyyy*M_xyyy + D_xyzzz*M_xzzz &
      + D_yyyy*M_yyy + D_yyyyz*M_yyyz + D_yyzzz*M_yzzz + D_yzzz*M_zzz) &
      + (1.0d0/2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyz*M_xxyz + &
      D_xxyz*M_xxz + D_xyyy*M_xyy + D_xyyyz*M_xyyz + D_xyyzz*M_xyzz + &
      D_xyzz*M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz* &
      M_zz)
    L_yz    = D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyz*M_y + &
      D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + (1.0d0/6.0d0)*(D_xxxyz*M_xxx &
      + D_yyyyz*M_yyy + D_yzzzz*M_zzz) + (1.0d0/2.0d0)*(D_xxyyz*M_xxy + &
      D_xxyz*M_xx + D_xxyzz*M_xxz + D_xyyyz*M_xyy + D_xyzzz*M_xzz + &
      D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyzzz*M_yzz + D_yzzz*M_zz)
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = D_0*M_0 + D_x*M_x + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + D_yz &
      *M_yz + D_z*M_z + (1.0d0/120.0d0)*(D_xxxxx*M_xxxxx + D_yyyyy* &
      M_yyyyy + D_zzzzz*M_zzzzz) + (1.0d0/12.0d0)*(D_xxxyy*M_xxxyy + &
      D_xxxzz*M_xxxzz + D_xxyyy*M_xxyyy + D_xxzzz*M_xxzzz + D_yyyzz* &
      M_yyyzz + D_yyzzz*M_yyzzz) + (1.0d0/4.0d0)*(D_xxyy*M_xxyy + &
      D_xxyyz*M_xxyyz + D_xxyzz*M_xxyzz + D_xxzz*M_xxzz + D_xyyzz* &
      M_xyyzz + D_yyzz*M_yyzz) + (1.0d0/24.0d0)*(D_xxxx*M_xxxx + &
      D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + D_xyyyy*M_xyyyy + D_xzzzz* &
      M_xzzzz + D_yyyy*M_yyyy + D_yyyyz*M_yyyyz + D_yzzzz*M_yzzzz + &
      D_zzzz*M_zzzz) + (1.0d0/2.0d0)*(D_xx*M_xx + D_xxy*M_xxy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xyy*M_xyy + D_xyyz*M_xyyz + D_xyzz* &
      M_xyzz + D_xzz*M_xzz + D_yy*M_yy + D_yyz*M_yyz + D_yzz*M_yzz + &
      D_zz*M_zz) + (1.0d0/6.0d0)*(D_xxx*M_xxx + D_xxxy*M_xxxy + D_xxxyz &
      *M_xxxyz + D_xxxz*M_xxxz + D_xyyy*M_xyyy + D_xyyyz*M_xyyyz + &
      D_xyzzz*M_xyzzz + D_xzzz*M_xzzz + D_yyy*M_yyy + D_yyyz*M_yyyz + &
      D_yzzz*M_yzzz + D_zzz*M_zzz)
    L_z     = D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yz*M_y + D_yzz* &
      M_yz + D_z*M_0 + D_zz*M_z + (1.0d0/24.0d0)*(D_xxxxz*M_xxxx + &
      D_yyyyz*M_yyyy + D_zzzzz*M_zzzz) + (1.0d0/4.0d0)*(D_xxyyz*M_xxyy &
      + D_xxzzz*M_xxzz + D_yyzzz*M_yyzz) + (1.0d0/6.0d0)*(D_xxxyz* &
      M_xxxy + D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xyyyz*M_xyyy + D_xzzzz &
      *M_xzzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yzzzz*M_yzzz + D_zzzz &
      *M_zzz) + (1.0d0/2.0d0)*(D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz* &
      M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyzzz* &
      M_xyzz + D_xzzz*M_xzz + D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz &
      + D_zzz*M_zz)
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  L_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  M_xx                
#undef  L_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
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
#undef  L_yyy               
#undef  M_yyy               
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
#undef  L_xxyz              
#undef  M_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
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
    end subroutine mom_es_M2L2
    
! OPS  252*ADD + 28*DIV + 435*MUL + 21*NEG + 210*POW = 946  (1157 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz,&
                L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz,&
                L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz,&
                L_yyzzz, L_yzzzz, L_zzzzz
#define Phi_0                Phi(1:2,0)
#define y                    r(1:2,2)
#define x                    r(1:2,1)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
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
#define L_xz                 L(1:2,6)
#define Phi_xz               Phi(1:2,6)
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
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    L_yzz   = -(L_xxy + L_yyy)
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    L_xyzz  = -(L_xxxy + L_xyyy)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    L_xxxzz = -(L_xxxxx + L_xxxyy)
    L_xxyzz = -(L_xxxxy + L_xxyyy)
    L_xxzzz = -(L_xxxxz + L_xxyyz)
    Phi_xx  = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/6.0d0)*(L_xxxxx*x**3 + L_xxyyy*y**3 &
      + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    L_xyyzz = -(L_xxxyy + L_xyyyy)
    L_xyzzz = -(L_xxxyz + L_xyyyz)
    Phi_xy  = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xyyyy*y**3 &
      + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    L_xzzzz = -(L_xxxzz + L_xyyzz)
    Phi_x   = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xyyyy*y**4 + L_xzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + L_xxxzz*x**2*z**2 + &
      L_xyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y &
      + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 &
      + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z &
      **2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + L_xzz*z**2)
    Phi_xz  = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/6.0d0)*(L_xxxxz*x**3 + L_xyyyz*y**3 + &
      L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxz*x**2 + &
      L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + &
      L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyzz = -(L_xxyyy + L_yyyyy)
    L_yyzzz = -(L_xxyyz + L_yyyyz)
    Phi_yy  = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_yyyyy*y**3 &
      + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Phi_zz  = -(Phi_xx + Phi_yy)
    L_yzzzz = -(L_xxyzz + L_yyyzz)
    Phi_y   = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/24.0d0)*(L_xxxxy*x**4 + L_yyyyy*y**4 + L_yzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + L_xxyzz*x**2*z**2 + &
      L_yyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y &
      + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 &
      + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z &
      **2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + L_yzz*z**2)
    Phi_yz  = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/6.0d0)*(L_xxxyz*x**3 + L_yyyyz*y**3 + &
      L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyz*x**2 + &
      L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + &
      L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzz = -(L_xxzzz + L_yyzzz)
    Phi_0   = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_yyyyy*y**5 + L_zzzzz*z**5 &
      ) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxzzz*x**2*z**3 + L_yyyzz*y**3*z**2 + &
      L_yyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x &
      **2*y**2*z + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y &
      **2*z**2 + L_yyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxx*x**4 + &
      L_xxxxy*x**4*y + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xzzzz*x*z**4 &
      + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + &
      (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz &
      *x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3)
    Phi_z   = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/24.0d0)*(L_xxxxz*x**4 + L_yyyyz*y**4 + L_zzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + L_xxzzz*x**2*z**2 + &
      L_yyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxz*x**3 &
      + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 &
      + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z &
      **2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  Phi_0               
#undef  y                   
#undef  x                   
#undef  L_0                 
#undef  z                   
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
#undef  L_xz                
#undef  Phi_xz              
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
    end subroutine mom_es_L2P2
    
! OPS  342*ADD + 35*DIV + 546*MUL + 20*NEG + 231*POW = 1174  (1398 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, h, u, L_zz, L_xzz,&
                L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz,&
                L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz,&
                L_yyzzz, L_yzzzz, L_zzzzz
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
#define Ls_xxxyz             Ls(1:2,29)
#define L_xxxyz              L(1:2,29)
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
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    Ls_xxxx  = L_xxxx + L_xxxxx*x + L_xxxxy*y + L_xxxxz*z
    Ls_xxxy  = L_xxxxy*x + L_xxxy + L_xxxyy*y + L_xxxyz*z
    Ls_xxyy  = L_xxxyy*x + L_xxyy + L_xxyyy*y + L_xxyyz*z
    Ls_xyyy  = L_xxyyy*x + L_xyyy + L_xyyyy*y + L_xyyyz*z
    Ls_yyyy  = L_xyyyy*x + L_yyyy + L_yyyyy*y + L_yyyyz*z
    Ls_xxxxx = L_xxxxx
    Ls_xxxxy = L_xxxxy
    Ls_xxxxz = L_xxxxz
    Ls_xxxyy = L_xxxyy
    Ls_xxxyz = L_xxxyz
    Ls_xxyyy = L_xxyyy
    Ls_xxyyz = L_xxyyz
    Ls_xyyyy = L_xyyyy
    Ls_xyyyz = L_xyyyz
    Ls_yyyyy = L_yyyyy
    Ls_yyyyz = L_yyyyz
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
    Ls_xxx   = L_xxx + L_xxxx*x + L_xxxxy*x*y + L_xxxxz*x*z + L_xxxy*y + L_xxxyz*y*z + &
      L_xxxz*z + (1.0d0/2.0d0)*(L_xxxxx*x**2 + L_xxxyy*y**2 + L_xxxzz*z &
      **2)
    Ls_xxxz  = L_xxxxz*x + L_xxxyz*y + L_xxxz + L_xxxzz*z
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    Ls_xxy   = L_xxxy*x + L_xxxyy*x*y + L_xxxyz*x*z + L_xxy + L_xxyy*y + L_xxyyz*y*z + &
      L_xxyz*z + (1.0d0/2.0d0)*(L_xxxxy*x**2 + L_xxyyy*y**2 + L_xxyzz*z &
      **2)
    Ls_xxyz  = L_xxxyz*x + L_xxyyz*y + L_xxyz + L_xxyzz*z
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    Ls_xx    = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxyz*x*y*z + L_xxxz*x*z + L_xxy*y + &
      L_xxyz*y*z + L_xxz*z + (1.0d0/6.0d0)*(L_xxxxx*x**3 + L_xxyyy*y**3 &
      + L_xxzzz*z**3) + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxxxy*x**2*y + &
      L_xxxxz*x**2*z + L_xxxyy*x*y**2 + L_xxxzz*x*z**2 + L_xxyy*y**2 + &
      L_xxyyz*y**2*z + L_xxyzz*y*z**2 + L_xxzz*z**2)
    Ls_xxz   = L_xxxyz*x*y + L_xxxz*x + L_xxxzz*x*z + L_xxyz*y + L_xxyzz*y*z + L_xxz + &
      L_xxzz*z + (1.0d0/2.0d0)*(L_xxxxz*x**2 + L_xxyyz*y**2 + L_xxzzz*z &
      **2)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    Ls_xyy   = L_xxyy*x + L_xxyyy*x*y + L_xxyyz*x*z + L_xyy + L_xyyy*y + L_xyyyz*y*z + &
      L_xyyz*z + (1.0d0/2.0d0)*(L_xxxyy*x**2 + L_xyyyy*y**2 + L_xyyzz*z &
      **2)
    Ls_xyyz  = L_xxyyz*x + L_xyyyz*y + L_xyyz + L_xyyzz*z
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    Ls_xy    = L_xxy*x + L_xxyy*x*y + L_xxyyz*x*y*z + L_xxyz*x*z + L_xy + L_xyy*y + &
      L_xyyz*y*z + L_xyz*z + (1.0d0/6.0d0)*(L_xxxxy*x**3 + L_xyyyy*y**3 &
      + L_xyzzz*z**3) + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xxxyy*x**2*y + &
      L_xxxyz*x**2*z + L_xxyyy*x*y**2 + L_xxyzz*x*z**2 + L_xyyy*y**2 + &
      L_xyyyz*y**2*z + L_xyyzz*y*z**2 + L_xyzz*z**2)
    Ls_xyz   = L_xxyyz*x*y + L_xxyz*x + L_xxyzz*x*z + L_xyyz*y + L_xyyzz*y*z + L_xyz + &
      L_xyzz*z + (1.0d0/2.0d0)*(L_xxxyz*x**2 + L_xyyyz*y**2 + L_xyzzz*z &
      **2)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    Ls_x     = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/24.0d0)*(L_xxxxx*x**4 + L_xyyyy*y**4 + L_xzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxxyy*x**2*y**2 + L_xxxzz*x**2*z**2 + &
      L_xyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xxxxy*x**3*y &
      + L_xxxxz*x**3*z + L_xxyyy*x*y**3 + L_xxzzz*x*z**3 + L_xyyy*y**3 &
      + L_xyyyz*y**3*z + L_xyzzz*y*z**3 + L_xzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxx*x**2 + L_xxxy*x**2*y + L_xxxyz*x**2*y*z + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxyyz*x*y**2*z + L_xxyzz*x*y*z**2 + L_xxzz*x*z &
      **2 + L_xyy*y**2 + L_xyyz*y**2*z + L_xyzz*y*z**2 + L_xzz*z**2)
    Ls_xz    = L_xxyz*x*y + L_xxyzz*x*y*z + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z &
      + L_xz + L_xzz*z + (1.0d0/6.0d0)*(L_xxxxz*x**3 + L_xyyyz*y**3 + &
      L_xzzzz*z**3) + (1.0d0/2.0d0)*(L_xxxyz*x**2*y + L_xxxz*x**2 + &
      L_xxxzz*x**2*z + L_xxyyz*x*y**2 + L_xxzzz*x*z**2 + L_xyyz*y**2 + &
      L_xyyzz*y**2*z + L_xyzzz*y*z**2 + L_xzzz*z**2)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    Ls_yyy   = L_xyyy*x + L_xyyyy*x*y + L_xyyyz*x*z + L_yyy + L_yyyy*y + L_yyyyz*y*z + &
      L_yyyz*z + (1.0d0/2.0d0)*(L_xxyyy*x**2 + L_yyyyy*y**2 + L_yyyzz*z &
      **2)
    Ls_yyyz  = L_xyyyz*x + L_yyyyz*y + L_yyyz + L_yyyzz*z
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    Ls_yy    = L_xyy*x + L_xyyy*x*y + L_xyyyz*x*y*z + L_xyyz*x*z + L_yy + L_yyy*y + &
      L_yyyz*y*z + L_yyz*z + (1.0d0/6.0d0)*(L_xxxyy*x**3 + L_yyyyy*y**3 &
      + L_yyzzz*z**3) + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_xxyyy*x**2*y + &
      L_xxyyz*x**2*z + L_xyyyy*x*y**2 + L_xyyzz*x*z**2 + L_yyyy*y**2 + &
      L_yyyyz*y**2*z + L_yyyzz*y*z**2 + L_yyzz*z**2)
    Ls_yyz   = L_xyyyz*x*y + L_xyyz*x + L_xyyzz*x*z + L_yyyz*y + L_yyyzz*y*z + L_yyz + &
      L_yyzz*z + (1.0d0/2.0d0)*(L_xxyyz*x**2 + L_yyyyz*y**2 + L_yyzzz*z &
      **2)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    Ls_y     = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/24.0d0)*(L_xxxxy*x**4 + L_yyyyy*y**4 + L_yzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyy*x**2*y**2 + L_xxyzz*x**2*z**2 + &
      L_yyyzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_xxxyy*x**3*y &
      + L_xxxyz*x**3*z + L_xyyyy*x*y**3 + L_xyzzz*x*z**3 + L_yyyy*y**3 &
      + L_yyyyz*y**3*z + L_yyzzz*y*z**3 + L_yzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxy*x**2 + L_xxyy*x**2*y + L_xxyyz*x**2*y*z + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyyyz*x*y**2*z + L_xyyzz*x*y*z**2 + L_xyzz*x*z &
      **2 + L_yyy*y**2 + L_yyyz*y**2*z + L_yyzz*y*z**2 + L_yzz*z**2)
    Ls_yz    = L_xyyz*x*y + L_xyyzz*x*y*z + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z &
      + L_yz + L_yzz*z + (1.0d0/6.0d0)*(L_xxxyz*x**3 + L_yyyyz*y**3 + &
      L_yzzzz*z**3) + (1.0d0/2.0d0)*(L_xxyyz*x**2*y + L_xxyz*x**2 + &
      L_xxyzz*x**2*z + L_xyyyz*x*y**2 + L_xyzzz*x*z**2 + L_yyyz*y**2 + &
      L_yyyzz*y**2*z + L_yyzzz*y*z**2 + L_yzzz*z**2)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    Ls_0     = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/120.0d0)*(L_xxxxx*x**5 + L_yyyyy*y**5 + L_zzzzz*z**5 &
      ) + (1.0d0/12.0d0)*(L_xxxyy*x**3*y**2 + L_xxxzz*x**3*z**2 + &
      L_xxyyy*x**2*y**3 + L_xxzzz*x**2*z**3 + L_yyyzz*y**3*z**2 + &
      L_yyzzz*y**2*z**3) + (1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxyyz*x &
      **2*y**2*z + L_xxyzz*x**2*y*z**2 + L_xxzz*x**2*z**2 + L_xyyzz*x*y &
      **2*z**2 + L_yyzz*y**2*z**2) + (1.0d0/24.0d0)*(L_xxxx*x**4 + &
      L_xxxxy*x**4*y + L_xxxxz*x**4*z + L_xyyyy*x*y**4 + L_xzzzz*x*z**4 &
      + L_yyyy*y**4 + L_yyyyz*y**4*z + L_yzzzz*y*z**4 + L_zzzz*z**4) + &
      (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x**2*y + L_xxyz*x**2*y*z + L_xxz &
      *x**2*z + L_xyy*x*y**2 + L_xyyz*x*y**2*z + L_xyzz*x*y*z**2 + &
      L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2*z + L_yzz*y*z**2 + L_zz*z** &
      2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxyz*x**3*y*z &
      + L_xxxz*x**3*z + L_xyyy*x*y**3 + L_xyyyz*x*y**3*z + L_xyzzz*x*y* &
      z**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + L_yzzz*y*z**3 &
      + L_zzz*z**3)
    Ls_z     = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/24.0d0)*(L_xxxxz*x**4 + L_yyyyz*y**4 + L_zzzzz* &
      z**4) + (1.0d0/4.0d0)*(L_xxyyz*x**2*y**2 + L_xxzzz*x**2*z**2 + &
      L_yyzzz*y**2*z**2) + (1.0d0/6.0d0)*(L_xxxyz*x**3*y + L_xxxz*x**3 &
      + L_xxxzz*x**3*z + L_xyyyz*x*y**3 + L_xzzzz*x*z**3 + L_yyyz*y**3 &
      + L_yyyzz*y**3*z + L_yzzzz*y*z**3 + L_zzzz*z**3) + (1.0d0/2.0d0)* &
      (L_xxyz*x**2*y + L_xxyzz*x**2*y*z + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xyyzz*x*y**2*z + L_xyzzz*x*y*z**2 + L_xzzz*x*z &
      **2 + L_yyz*y**2 + L_yyzz*y**2*z + L_yzzz*y*z**2 + L_zzz*z**2)
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
#undef  Ls_xxxyz            
#undef  L_xxxyz             
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
    end subroutine mom_es_L2L2_add
#endif
end module mom5
