!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-04 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom4
use types
implicit none
#if FMM_EXPANSION_ORDER==4
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
        
    
! OPS  27*DIV + 60*MUL + 30*POW = 117  (141 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u
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
    M_0    = W
    M_x    = W*x
    M_y    = W*y
    M_z    = W*z
    M_xx   = (1.0d0/2.0d0)*W*x**2
    M_xy   = W*x*y
    M_xz   = W*x*z
    M_yy   = (1.0d0/2.0d0)*W*y**2
    M_yz   = W*y*z
    M_zz   = (1.0d0/2.0d0)*W*z**2
    M_xxx  = (1.0d0/6.0d0)*W*x**3
    M_xxy  = (1.0d0/2.0d0)*W*x**2*y
    M_xxz  = (1.0d0/2.0d0)*W*x**2*z
    M_xyy  = (1.0d0/2.0d0)*W*x*y**2
    M_xyz  = W*x*y*z
    M_xzz  = (1.0d0/2.0d0)*W*x*z**2
    M_yyy  = (1.0d0/6.0d0)*W*y**3
    M_yyz  = (1.0d0/2.0d0)*W*y**2*z
    M_yzz  = (1.0d0/2.0d0)*W*y*z**2
    M_zzz  = (1.0d0/6.0d0)*W*z**3
    M_xxxx = (1.0d0/24.0d0)*W*x**4
    M_xxxy = (1.0d0/6.0d0)*W*x**3*y
    M_xxxz = (1.0d0/6.0d0)*W*x**3*z
    M_xxyy = (1.0d0/4.0d0)*W*x**2*y**2
    M_xxyz = (1.0d0/2.0d0)*W*x**2*y*z
    M_xxzz = (1.0d0/4.0d0)*W*x**2*z**2
    M_xyyy = (1.0d0/6.0d0)*W*x*y**3
    M_xyyz = (1.0d0/2.0d0)*W*x*y**2*z
    M_xyzz = (1.0d0/2.0d0)*W*x*y*z**2
    M_xzzz = (1.0d0/6.0d0)*W*x*z**3
    M_yyyy = (1.0d0/24.0d0)*W*y**4
    M_yyyz = (1.0d0/6.0d0)*W*y**3*z
    M_yyzz = (1.0d0/4.0d0)*W*y**2*z**2
    M_yzzz = (1.0d0/6.0d0)*W*y*z**3
    M_zzzz = (1.0d0/24.0d0)*W*z**4
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
    end subroutine mom_es_P2M
    
! OPS  175*ADD + 45*DIV + 252*MUL + 84*POW = 556  (616 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define M_xy                 M(5)
#define Ms_xy                Ms(5)
#define M_xz                 M(6)
#define Ms_xz                Ms(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
#define M_zz                 M(9)
#define Ms_zz                Ms(9)
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
#define Ms_xxyy              Ms(23)
#define M_xxyy               M(23)
#define M_xxyz               M(24)
#define Ms_xxyz              Ms(24)
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
#define M_yyyy               M(30)
#define Ms_yyyy              Ms(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define M_yyzz               M(32)
#define Ms_yyzz              Ms(32)
#define M_yzzz               M(33)
#define Ms_yzzz              Ms(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
    Ms_0    = M_0
    Ms_x    = M_0*x + M_x
    Ms_y    = M_0*y + M_y
    Ms_z    = M_0*z + M_z
    Ms_xx   = (1.0d0/2.0d0)*M_0*x**2 + M_x*x + M_xx
    Ms_xy   = M_0*x*y + M_x*y + M_xy + M_y*x
    Ms_xz   = M_0*x*z + M_x*z + M_xz + M_z*x
    Ms_yy   = (1.0d0/2.0d0)*M_0*y**2 + M_y*y + M_yy
    Ms_yz   = M_0*y*z + M_y*z + M_yz + M_z*y
    Ms_zz   = (1.0d0/2.0d0)*M_0*z**2 + M_z*z + M_zz
    Ms_xxx  = (1.0d0/6.0d0)*M_0*x**3 + (1.0d0/2.0d0)*M_x*x**2 + M_xx*x + M_xxx
    Ms_xxy  = M_x*x*y + M_xx*y + M_xxy + M_xy*x + (1.0d0/2.0d0)*(M_0*x**2*y + M_y*x**2 &
      )
    Ms_xxz  = M_x*x*z + M_xx*z + M_xxz + M_xz*x + (1.0d0/2.0d0)*(M_0*x**2*z + M_z*x**2 &
      )
    Ms_xyy  = M_xy*y + M_xyy + M_y*x*y + M_yy*x + (1.0d0/2.0d0)*(M_0*x*y**2 + M_x*y**2 &
      )
    Ms_xyz  = M_0*x*y*z + M_x*y*z + M_xy*z + M_xyz + M_xz*y + M_y*x*z + M_yz*x + M_z*x &
      *y
    Ms_xzz  = M_xz*z + M_xzz + M_z*x*z + M_zz*x + (1.0d0/2.0d0)*(M_0*x*z**2 + M_x*z**2 &
      )
    Ms_yyy  = (1.0d0/6.0d0)*M_0*y**3 + (1.0d0/2.0d0)*M_y*y**2 + M_yy*y + M_yyy
    Ms_yyz  = M_y*y*z + M_yy*z + M_yyz + M_yz*y + (1.0d0/2.0d0)*(M_0*y**2*z + M_z*y**2 &
      )
    Ms_yzz  = M_yz*z + M_yzz + M_z*y*z + M_zz*y + (1.0d0/2.0d0)*(M_0*y*z**2 + M_y*z**2 &
      )
    Ms_zzz  = (1.0d0/6.0d0)*M_0*z**3 + (1.0d0/2.0d0)*M_z*z**2 + M_zz*z + M_zzz
    Ms_xxxx = (1.0d0/24.0d0)*M_0*x**4 + (1.0d0/6.0d0)*M_x*x**3 + (1.0d0/2.0d0)*M_xx*x &
      **2 + M_xxx*x + M_xxxx
    Ms_xxxy = M_xx*x*y + M_xxx*y + M_xxxy + M_xxy*x + (1.0d0/6.0d0)*(M_0*x**3*y + M_y* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*y + M_xy*x**2)
    Ms_xxxz = M_xx*x*z + M_xxx*z + M_xxxz + M_xxz*x + (1.0d0/6.0d0)*(M_0*x**3*z + M_z* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*z + M_xz*x**2)
    Ms_xxyy = (1.0d0/4.0d0)*M_0*x**2*y**2 + M_xxy*y + M_xxyy + M_xy*x*y + M_xyy*x + ( &
      1.0d0/2.0d0)*(M_x*x*y**2 + M_xx*y**2 + M_y*x**2*y + M_yy*x**2)
    Ms_xxyz = M_x*x*y*z + M_xx*y*z + M_xxy*z + M_xxyz + M_xxz*y + M_xy*x*z + M_xyz*x + &
      M_xz*x*y + (1.0d0/2.0d0)*(M_0*x**2*y*z + M_y*x**2*z + M_yz*x**2 + &
      M_z*x**2*y)
    Ms_xxzz = (1.0d0/4.0d0)*M_0*x**2*z**2 + M_xxz*z + M_xxzz + M_xz*x*z + M_xzz*x + ( &
      1.0d0/2.0d0)*(M_x*x*z**2 + M_xx*z**2 + M_z*x**2*z + M_zz*x**2)
    Ms_xyyy = M_xyy*y + M_xyyy + M_yy*x*y + M_yyy*x + (1.0d0/2.0d0)*(M_xy*y**2 + M_y*x &
      *y**2) + (1.0d0/6.0d0)*(M_0*x*y**3 + M_x*y**3)
    Ms_xyyz = M_xy*y*z + M_xyy*z + M_xyyz + M_xyz*y + M_y*x*y*z + M_yy*x*z + M_yyz*x + &
      M_yz*x*y + (1.0d0/2.0d0)*(M_0*x*y**2*z + M_x*y**2*z + M_xz*y**2 + &
      M_z*x*y**2)
    Ms_xyzz = M_xyz*z + M_xyzz + M_xz*y*z + M_xzz*y + M_yz*x*z + M_yzz*x + M_z*x*y*z + &
      M_zz*x*y + (1.0d0/2.0d0)*(M_0*x*y*z**2 + M_x*y*z**2 + M_xy*z**2 + &
      M_y*x*z**2)
    Ms_xzzz = M_xzz*z + M_xzzz + M_zz*x*z + M_zzz*x + (1.0d0/2.0d0)*(M_xz*z**2 + M_z*x &
      *z**2) + (1.0d0/6.0d0)*(M_0*x*z**3 + M_x*z**3)
    Ms_yyyy = (1.0d0/24.0d0)*M_0*y**4 + (1.0d0/6.0d0)*M_y*y**3 + (1.0d0/2.0d0)*M_yy*y &
      **2 + M_yyy*y + M_yyyy
    Ms_yyyz = M_yy*y*z + M_yyy*z + M_yyyz + M_yyz*y + (1.0d0/6.0d0)*(M_0*y**3*z + M_z* &
      y**3) + (1.0d0/2.0d0)*(M_y*y**2*z + M_yz*y**2)
    Ms_yyzz = (1.0d0/4.0d0)*M_0*y**2*z**2 + M_yyz*z + M_yyzz + M_yz*y*z + M_yzz*y + ( &
      1.0d0/2.0d0)*(M_y*y*z**2 + M_yy*z**2 + M_z*y**2*z + M_zz*y**2)
    Ms_yzzz = M_yzz*z + M_yzzz + M_zz*y*z + M_zzz*y + (1.0d0/2.0d0)*(M_yz*z**2 + M_z*y &
      *z**2) + (1.0d0/6.0d0)*(M_0*y*z**3 + M_y*z**3)
    Ms_zzzz = (1.0d0/24.0d0)*M_0*z**4 + (1.0d0/6.0d0)*M_z*z**3 + (1.0d0/2.0d0)*M_zz*z &
      **2 + M_zzz*z + M_zzzz
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  M_xz                
#undef  Ms_xz               
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
#undef  M_zz                
#undef  Ms_zz               
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
#undef  Ms_xxyy             
#undef  M_xxyy              
#undef  M_xxyz              
#undef  Ms_xxyz             
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
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  M_yyzz              
#undef  Ms_yyzz             
#undef  M_yzzz              
#undef  Ms_yzzz             
#undef  M_zzzz              
#undef  Ms_zzzz             
    end subroutine mom_es_M2M
    
! OPS  163*ADD + 2*DIV + 306*MUL + 14*NEG + 74*POW + 17*SUB = 576  (603 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
                D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz,&
                D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz,&
                D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz,&
                D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
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
    h      = x**2 + y**2 + z**2
    u2     = 1.0/h
    u      = sqrt(u2)
    D_0    = u
    D_x    = -u**3*x
    D_y    = -u**3*y
    D_z    = -u**3*z
    D_xx   = -h*u**5 + 3*u**5*x**2
    D_xy   = 3*u**5*x*y
    D_xz   = 3*u**5*x*z
    D_yy   = -h*u**5 + 3*u**5*y**2
    D_yz   = 3*u**5*y*z
    D_zz   = -(D_xx + D_yy)
    D_xxx  = 9*h*u**7*x - 15*u**7*x**3
    D_xxy  = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz  = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy  = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz  = -15*u**7*x*y*z
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = 9*h*u**7*y - 15*u**7*y**3
    D_yyz  = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    D_xxxx = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    L_xxxx = D_xxxx*M_0
    D_xxxy = -45*h*u**9*x*y + 105*u**9*x**3*y
    L_xxxy = D_xxxy*M_0
    D_xxxz = -45*h*u**9*x*z + 105*u**9*x**3*z
    L_xxx  = D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z
    L_xxxz = D_xxxz*M_0
    D_xxyy = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    L_xxyy = D_xxyy*M_0
    D_xxyz = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    L_xxy  = D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyy*M_yy + D_xxyz*M_yz + D_xxz*M_z + D_xxzz*M_zz
    L_xxz  = D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z
    D_xyyy = -45*h*u**9*x*y + 105*u**9*x*y**3
    L_xyyy = D_xyyy*M_0
    D_xyyz = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    L_xyy  = D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = D_xxxy*M_xx + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyy*M_yy + D_xyyz*M_yz + D_xyz*M_z + D_xyzz*M_zz
    L_xyz  = D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxy*M_xxy + D_xxxz* &
      M_xxz + D_xxy*M_xy + D_xxyy*M_xyy + D_xxyz*M_xyz + D_xxz*M_xz + &
      D_xxzz*M_xzz + D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyz* &
      M_yyz + D_xyz*M_yz + D_xyzz*M_yzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz
    L_xz   = D_xxxz*M_xx + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyyz*M_yy + &
      D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz
    D_yyyy = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    L_yyyy = D_yyyy*M_0
    D_yyyz = -45*h*u**9*y*z + 105*u**9*y**3*z
    L_yyy  = D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xxyy*M_xx + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*M_yy + D_yyyz*M_yz + D_yyz*M_z + D_yyzz*M_zz
    L_yyz  = D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xxxy*M_xxx + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xy*M_x + &
      D_xyy*M_xy + D_xyyy*M_xyy + D_xyyz*M_xyz + D_xyz*M_xz + D_xyzz* &
      M_xzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyz* &
      M_yyz + D_yyz*M_yz + D_yyzz*M_yzz + D_yz*M_z + D_yzz*M_zz + &
      D_yzzz*M_zzz
    L_yz   = D_xxyz*M_xx + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*M_yy + &
      D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxy* &
      M_xxxy + D_xxxz*M_xxxz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xy*M_xy + D_xyy*M_xyy + &
      D_xyyy*M_xyyy + D_xyyz*M_xyyz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_y*M_y + D_yy*M_yy + &
      D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyz*M_yyyz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + D_z*M_z &
      + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz
    L_z    = D_xxxz*M_xxx + D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz &
      + D_yyyz*M_yyy + D_yyz*M_yy + D_yyzz*M_yyz + D_yz*M_y + D_yzz* &
      M_yz + D_yzzz*M_yzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_x                 
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
    end subroutine mom_es_M2L
    
! OPS  157*ADD + 15*DIV + 231*MUL + 10*NEG + 81*POW = 494  (591 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Ls_0                 Ls(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_0                  L(0)
#define L_x                  L(1)
#define Ls_x                 Ls(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define Ls_xx                Ls(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define Ls_xy                Ls(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
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
#define Ls_xxxx              Ls(16)
#define L_xxxx               L(16)
#define Ls_xxxy              Ls(17)
#define L_xxxy               L(17)
#define Ls_xxxz              Ls(18)
#define L_xxxz               L(18)
#define L_xxyy               L(19)
#define Ls_xxyy              Ls(19)
#define L_xxyz               L(20)
#define Ls_xxyz              Ls(20)
#define L_xyyy               L(21)
#define Ls_xyyy              Ls(21)
#define L_xyyz               L(22)
#define Ls_xyyz              Ls(22)
#define Ls_yyyy              Ls(23)
#define L_yyyy               L(23)
#define L_yyyz               L(24)
#define Ls_yyyz              Ls(24)
    Ls_xxx  = L_xxx + L_xxxx*x + L_xxxy*y + L_xxxz*z
    Ls_xxy  = L_xxxy*x + L_xxy + L_xxyy*y + L_xxyz*z
    Ls_xyy  = L_xxyy*x + L_xyy + L_xyyy*y + L_xyyz*z
    Ls_yyy  = L_xyyy*x + L_yyy + L_yyyy*y + L_yyyz*z
    Ls_xxxx = L_xxxx
    Ls_xxxy = L_xxxy
    Ls_xxxz = L_xxxz
    Ls_xxyy = L_xxyy
    Ls_xxyz = L_xxyz
    Ls_xyyy = L_xyyy
    Ls_xyyz = L_xyyz
    Ls_yyyy = L_yyyy
    Ls_yyyz = L_yyyz
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    L_yzz   = -(L_xxy + L_yyy)
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    Ls_xx   = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz* &
      z + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxyy*y**2 + L_xxzz*z**2)
    Ls_xxz  = L_xxxz*x + L_xxyz*y + L_xxz + L_xxzz*z
    L_xyzz  = -(L_xxxy + L_xyyy)
    Ls_xy   = L_xxy*x + L_xxyy*x*y + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz* &
      z + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xyyy*y**2 + L_xyzz*z**2)
    Ls_xyz  = L_xxyz*x + L_xyyz*y + L_xyz + L_xyzz*z
    L_xzzz  = -(L_xxxz + L_xyyz)
    Ls_x    = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xyyy*y**3 + L_xzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + &
      L_xyzz*y*z**2 + L_xzz*z**2)
    Ls_xz   = L_xxyz*x*y + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz* &
      z + (1.0d0/2.0d0)*(L_xxxz*x**2 + L_xyyz*y**2 + L_xzzz*z**2)
    L_yyzz  = -(L_xxyy + L_yyyy)
    Ls_yy   = L_xyy*x + L_xyyy*x*y + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz* &
      z + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_yyyy*y**2 + L_yyzz*z**2)
    Ls_yyz  = L_xyyz*x + L_yyyz*y + L_yyz + L_yyzz*z
    L_yzzz  = -(L_xxyz + L_yyyz)
    Ls_y    = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_yyyy*y**3 + L_yzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + &
      L_yyzz*y*z**2 + L_yzz*z**2)
    Ls_yz   = L_xyyz*x*y + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz* &
      z + (1.0d0/2.0d0)*(L_xxyz*x**2 + L_yyyz*y**2 + L_yzzz*z**2)
    L_zzzz  = -(L_xxzz + L_yyzz)
    Ls_0    = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_yyyy*y**4 + L_zzzz*z**4) + ( &
      1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxzz*x**2*z**2 + L_yyzz*y**2*z &
      **2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxz*x**3*z &
      + L_xyyy*x*y**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + &
      L_yzzz*y*z**3 + L_zzz*z**3) + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x &
      **2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x* &
      y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2* &
      z + L_yzz*y*z**2 + L_zz*z**2)
    Ls_z    = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
#undef  Ls_0                
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_0                 
#undef  L_x                 
#undef  Ls_x                
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  L_xy                
#undef  Ls_xy               
#undef  L_xz                
#undef  Ls_xz               
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
#undef  Ls_xxxx             
#undef  L_xxxx              
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  Ls_xxxz             
#undef  L_xxxz              
#undef  L_xxyy              
#undef  Ls_xxyy             
#undef  L_xxyz              
#undef  Ls_xxyz             
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
    end subroutine mom_es_L2L
    
! OPS  136*ADD + 15*DIV + 210*MUL + 11*NEG + 81*POW = 453  (551 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Phi_0                Phi(0)
#define x                    r(1)
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define Phi_x                Phi(1)
#define L_x                  L(1)
#define Phi_y                Phi(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Phi_z                Phi(3)
#define Phi_xx               Phi(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define Phi_xy               Phi(5)
#define L_xz                 L(6)
#define Phi_xz               Phi(6)
#define Phi_yy               Phi(7)
#define L_yy                 L(7)
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
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    L_yzz  = -(L_xxy + L_yyy)
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    Phi_xx = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz* &
      z + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxyy*y**2 + L_xxzz*z**2)
    L_xyzz = -(L_xxxy + L_xyyy)
    Phi_xy = L_xxy*x + L_xxyy*x*y + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz* &
      z + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xyyy*y**2 + L_xyzz*z**2)
    L_xzzz = -(L_xxxz + L_xyyz)
    Phi_x  = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xyyy*y**3 + L_xzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + &
      L_xyzz*y*z**2 + L_xzz*z**2)
    Phi_xz = L_xxyz*x*y + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz* &
      z + (1.0d0/2.0d0)*(L_xxxz*x**2 + L_xyyz*y**2 + L_xzzz*z**2)
    L_yyzz = -(L_xxyy + L_yyyy)
    Phi_yy = L_xyy*x + L_xyyy*x*y + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz* &
      z + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_yyyy*y**2 + L_yyzz*z**2)
    Phi_zz = -(Phi_xx + Phi_yy)
    L_yzzz = -(L_xxyz + L_yyyz)
    Phi_y  = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_yyyy*y**3 + L_yzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + &
      L_yyzz*y*z**2 + L_yzz*z**2)
    Phi_yz = L_xyyz*x*y + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz* &
      z + (1.0d0/2.0d0)*(L_xxyz*x**2 + L_yyyz*y**2 + L_yzzz*z**2)
    L_zzzz = -(L_xxzz + L_yyzz)
    Phi_0  = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_yyyy*y**4 + L_zzzz*z**4) + ( &
      1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxzz*x**2*z**2 + L_yyzz*y**2*z &
      **2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxz*x**3*z &
      + L_xyyy*x*y**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + &
      L_yzzz*y*z**3 + L_zzz*z**3) + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x &
      **2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x* &
      y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2* &
      z + L_yzz*y*z**2 + L_zz*z**2)
    Phi_z  = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
#undef  Phi_0               
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Phi_x               
#undef  L_x                 
#undef  Phi_y               
#undef  L_y                 
#undef  L_z                 
#undef  Phi_z               
#undef  Phi_xx              
#undef  L_xx                
#undef  L_xy                
#undef  Phi_xy              
#undef  L_xz                
#undef  Phi_xz              
#undef  Phi_yy              
#undef  L_yy                
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
    end subroutine mom_es_L2P
    
! OPS  175*ADD + 45*DIV + 252*MUL + 84*POW = 556  (616 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define M_xy                 M(5)
#define Ms_xy                Ms(5)
#define M_xz                 M(6)
#define Ms_xz                Ms(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
#define M_zz                 M(9)
#define Ms_zz                Ms(9)
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
#define Ms_xxyy              Ms(23)
#define M_xxyy               M(23)
#define M_xxyz               M(24)
#define Ms_xxyz              Ms(24)
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
#define M_yyyy               M(30)
#define Ms_yyyy              Ms(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define M_yyzz               M(32)
#define Ms_yyzz              Ms(32)
#define M_yzzz               M(33)
#define Ms_yzzz              Ms(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
    Ms_0    = Ms_0 + (M_0)
    Ms_x    = Ms_x + (M_0*x + M_x)
    Ms_y    = Ms_y + (M_0*y + M_y)
    Ms_z    = Ms_z + (M_0*z + M_z)
    Ms_xx   = Ms_xx + ((1.0d0/2.0d0)*M_0*x**2 + M_x*x + M_xx)
    Ms_xy   = Ms_xy + (M_0*x*y + M_x*y + M_xy + M_y*x)
    Ms_xz   = Ms_xz + (M_0*x*z + M_x*z + M_xz + M_z*x)
    Ms_yy   = Ms_yy + ((1.0d0/2.0d0)*M_0*y**2 + M_y*y + M_yy)
    Ms_yz   = Ms_yz + (M_0*y*z + M_y*z + M_yz + M_z*y)
    Ms_zz   = Ms_zz + ((1.0d0/2.0d0)*M_0*z**2 + M_z*z + M_zz)
    Ms_xxx  = Ms_xxx + ((1.0d0/6.0d0)*M_0*x**3 + (1.0d0/2.0d0)*M_x*x**2 + M_xx*x + M_xxx)
    Ms_xxy  = Ms_xxy + (M_x*x*y + M_xx*y + M_xxy + M_xy*x + (1.0d0/2.0d0)*(M_0*x**2*y + M_y*x**2 &
      ))
    Ms_xxz  = Ms_xxz + (M_x*x*z + M_xx*z + M_xxz + M_xz*x + (1.0d0/2.0d0)*(M_0*x**2*z + M_z*x**2 &
      ))
    Ms_xyy  = Ms_xyy + (M_xy*y + M_xyy + M_y*x*y + M_yy*x + (1.0d0/2.0d0)*(M_0*x*y**2 + M_x*y**2 &
      ))
    Ms_xyz  = Ms_xyz + (M_0*x*y*z + M_x*y*z + M_xy*z + M_xyz + M_xz*y + M_y*x*z + M_yz*x + M_z*x &
      *y)
    Ms_xzz  = Ms_xzz + (M_xz*z + M_xzz + M_z*x*z + M_zz*x + (1.0d0/2.0d0)*(M_0*x*z**2 + M_x*z**2 &
      ))
    Ms_yyy  = Ms_yyy + ((1.0d0/6.0d0)*M_0*y**3 + (1.0d0/2.0d0)*M_y*y**2 + M_yy*y + M_yyy)
    Ms_yyz  = Ms_yyz + (M_y*y*z + M_yy*z + M_yyz + M_yz*y + (1.0d0/2.0d0)*(M_0*y**2*z + M_z*y**2 &
      ))
    Ms_yzz  = Ms_yzz + (M_yz*z + M_yzz + M_z*y*z + M_zz*y + (1.0d0/2.0d0)*(M_0*y*z**2 + M_y*z**2 &
      ))
    Ms_zzz  = Ms_zzz + ((1.0d0/6.0d0)*M_0*z**3 + (1.0d0/2.0d0)*M_z*z**2 + M_zz*z + M_zzz)
    Ms_xxxx = Ms_xxxx + ((1.0d0/24.0d0)*M_0*x**4 + (1.0d0/6.0d0)*M_x*x**3 + (1.0d0/2.0d0)*M_xx*x &
      **2 + M_xxx*x + M_xxxx)
    Ms_xxxy = Ms_xxxy + (M_xx*x*y + M_xxx*y + M_xxxy + M_xxy*x + (1.0d0/6.0d0)*(M_0*x**3*y + M_y* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*y + M_xy*x**2))
    Ms_xxxz = Ms_xxxz + (M_xx*x*z + M_xxx*z + M_xxxz + M_xxz*x + (1.0d0/6.0d0)*(M_0*x**3*z + M_z* &
      x**3) + (1.0d0/2.0d0)*(M_x*x**2*z + M_xz*x**2))
    Ms_xxyy = Ms_xxyy + ((1.0d0/4.0d0)*M_0*x**2*y**2 + M_xxy*y + M_xxyy + M_xy*x*y + M_xyy*x + ( &
      1.0d0/2.0d0)*(M_x*x*y**2 + M_xx*y**2 + M_y*x**2*y + M_yy*x**2))
    Ms_xxyz = Ms_xxyz + (M_x*x*y*z + M_xx*y*z + M_xxy*z + M_xxyz + M_xxz*y + M_xy*x*z + M_xyz*x + &
      M_xz*x*y + (1.0d0/2.0d0)*(M_0*x**2*y*z + M_y*x**2*z + M_yz*x**2 + &
      M_z*x**2*y))
    Ms_xxzz = Ms_xxzz + ((1.0d0/4.0d0)*M_0*x**2*z**2 + M_xxz*z + M_xxzz + M_xz*x*z + M_xzz*x + ( &
      1.0d0/2.0d0)*(M_x*x*z**2 + M_xx*z**2 + M_z*x**2*z + M_zz*x**2))
    Ms_xyyy = Ms_xyyy + (M_xyy*y + M_xyyy + M_yy*x*y + M_yyy*x + (1.0d0/2.0d0)*(M_xy*y**2 + M_y*x &
      *y**2) + (1.0d0/6.0d0)*(M_0*x*y**3 + M_x*y**3))
    Ms_xyyz = Ms_xyyz + (M_xy*y*z + M_xyy*z + M_xyyz + M_xyz*y + M_y*x*y*z + M_yy*x*z + M_yyz*x + &
      M_yz*x*y + (1.0d0/2.0d0)*(M_0*x*y**2*z + M_x*y**2*z + M_xz*y**2 + &
      M_z*x*y**2))
    Ms_xyzz = Ms_xyzz + (M_xyz*z + M_xyzz + M_xz*y*z + M_xzz*y + M_yz*x*z + M_yzz*x + M_z*x*y*z + &
      M_zz*x*y + (1.0d0/2.0d0)*(M_0*x*y*z**2 + M_x*y*z**2 + M_xy*z**2 + &
      M_y*x*z**2))
    Ms_xzzz = Ms_xzzz + (M_xzz*z + M_xzzz + M_zz*x*z + M_zzz*x + (1.0d0/2.0d0)*(M_xz*z**2 + M_z*x &
      *z**2) + (1.0d0/6.0d0)*(M_0*x*z**3 + M_x*z**3))
    Ms_yyyy = Ms_yyyy + ((1.0d0/24.0d0)*M_0*y**4 + (1.0d0/6.0d0)*M_y*y**3 + (1.0d0/2.0d0)*M_yy*y &
      **2 + M_yyy*y + M_yyyy)
    Ms_yyyz = Ms_yyyz + (M_yy*y*z + M_yyy*z + M_yyyz + M_yyz*y + (1.0d0/6.0d0)*(M_0*y**3*z + M_z* &
      y**3) + (1.0d0/2.0d0)*(M_y*y**2*z + M_yz*y**2))
    Ms_yyzz = Ms_yyzz + ((1.0d0/4.0d0)*M_0*y**2*z**2 + M_yyz*z + M_yyzz + M_yz*y*z + M_yzz*y + ( &
      1.0d0/2.0d0)*(M_y*y*z**2 + M_yy*z**2 + M_z*y**2*z + M_zz*y**2))
    Ms_yzzz = Ms_yzzz + (M_yzz*z + M_yzzz + M_zz*y*z + M_zzz*y + (1.0d0/2.0d0)*(M_yz*z**2 + M_z*y &
      *z**2) + (1.0d0/6.0d0)*(M_0*y*z**3 + M_y*z**3))
    Ms_zzzz = Ms_zzzz + ((1.0d0/24.0d0)*M_0*z**4 + (1.0d0/6.0d0)*M_z*z**3 + (1.0d0/2.0d0)*M_zz*z &
      **2 + M_zzz*z + M_zzzz)
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  M_xz                
#undef  Ms_xz               
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
#undef  M_zz                
#undef  Ms_zz               
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
#undef  Ms_xxyy             
#undef  M_xxyy              
#undef  M_xxyz              
#undef  Ms_xxyz             
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
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  M_yyzz              
#undef  Ms_yyzz             
#undef  M_yzzz              
#undef  Ms_yzzz             
#undef  M_zzzz              
#undef  Ms_zzzz             
    end subroutine mom_es_M2M_add
    
! OPS  163*ADD + 2*DIV + 306*MUL + 14*NEG + 74*POW + 17*SUB = 576  (603 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
                D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz,&
                D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz,&
                D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz,&
                D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
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
    h      = x**2 + y**2 + z**2
    u2     = 1.0/h
    u      = sqrt(u2)
    D_0    = u
    D_x    = -u**3*x
    D_y    = -u**3*y
    D_z    = -u**3*z
    D_xx   = -h*u**5 + 3*u**5*x**2
    D_xy   = 3*u**5*x*y
    D_xz   = 3*u**5*x*z
    D_yy   = -h*u**5 + 3*u**5*y**2
    D_yz   = 3*u**5*y*z
    D_zz   = -(D_xx + D_yy)
    D_xxx  = 9*h*u**7*x - 15*u**7*x**3
    D_xxy  = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz  = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy  = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz  = -15*u**7*x*y*z
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = 9*h*u**7*y - 15*u**7*y**3
    D_yyz  = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    D_xxxx = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    L_xxxx = L_xxxx + (D_xxxx*M_0)
    D_xxxy = -45*h*u**9*x*y + 105*u**9*x**3*y
    L_xxxy = L_xxxy + (D_xxxy*M_0)
    D_xxxz = -45*h*u**9*x*z + 105*u**9*x**3*z
    L_xxx  = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z)
    L_xxxz = L_xxxz + (D_xxxz*M_0)
    D_xxyy = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    L_xxyy = L_xxyy + (D_xxyy*M_0)
    D_xxyz = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    L_xxy  = L_xxy + (D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z)
    L_xxyz = L_xxyz + (D_xxyz*M_0)
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyy*M_yy + D_xxyz*M_yz + D_xxz*M_z + D_xxzz*M_zz)
    L_xxz  = L_xxz + (D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z)
    D_xyyy = -45*h*u**9*x*y + 105*u**9*x*y**3
    L_xyyy = L_xyyy + (D_xyyy*M_0)
    D_xyyz = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    L_xyy  = L_xyy + (D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z)
    L_xyyz = L_xyyz + (D_xyyz*M_0)
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = L_xy + (D_xxxy*M_xx + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyy*M_yy + D_xyyz*M_yz + D_xyz*M_z + D_xyzz*M_zz)
    L_xyz  = L_xyz + (D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z)
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxy*M_xxy + D_xxxz* &
      M_xxz + D_xxy*M_xy + D_xxyy*M_xyy + D_xxyz*M_xyz + D_xxz*M_xz + &
      D_xxzz*M_xzz + D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyz* &
      M_yyz + D_xyz*M_yz + D_xyzz*M_yzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz)
    L_xz   = L_xz + (D_xxxz*M_xx + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyyz*M_yy + &
      D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz)
    D_yyyy = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    L_yyyy = L_yyyy + (D_yyyy*M_0)
    D_yyyz = -45*h*u**9*y*z + 105*u**9*y**3*z
    L_yyy  = L_yyy + (D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z)
    L_yyyz = L_yyyz + (D_yyyz*M_0)
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = L_yy + (D_xxyy*M_xx + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*M_yy + D_yyyz*M_yz + D_yyz*M_z + D_yyzz*M_zz)
    L_yyz  = L_yyz + (D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z)
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = L_y + (D_xxxy*M_xxx + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xy*M_x + &
      D_xyy*M_xy + D_xyyy*M_xyy + D_xyyz*M_xyz + D_xyz*M_xz + D_xyzz* &
      M_xzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyz* &
      M_yyz + D_yyz*M_yz + D_yyzz*M_yzz + D_yz*M_z + D_yzz*M_zz + &
      D_yzzz*M_zzz)
    L_yz   = L_yz + (D_xxyz*M_xx + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*M_yy + &
      D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz)
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxy* &
      M_xxxy + D_xxxz*M_xxxz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xy*M_xy + D_xyy*M_xyy + &
      D_xyyy*M_xyyy + D_xyyz*M_xyyz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_y*M_y + D_yy*M_yy + &
      D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyz*M_yyyz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + D_z*M_z &
      + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz)
    L_z    = L_z + (D_xxxz*M_xxx + D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz &
      + D_yyyz*M_yyy + D_yyz*M_yy + D_yyzz*M_yyz + D_yz*M_y + D_yzz* &
      M_yz + D_yzzz*M_yzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_x                 
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
    end subroutine mom_es_M2L_add
    
! OPS  157*ADD + 15*DIV + 231*MUL + 10*NEG + 81*POW = 494  (591 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Ls_0                 Ls(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_0                  L(0)
#define L_x                  L(1)
#define Ls_x                 Ls(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define Ls_xx                Ls(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define Ls_xy                Ls(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
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
#define Ls_xxxx              Ls(16)
#define L_xxxx               L(16)
#define Ls_xxxy              Ls(17)
#define L_xxxy               L(17)
#define Ls_xxxz              Ls(18)
#define L_xxxz               L(18)
#define L_xxyy               L(19)
#define Ls_xxyy              Ls(19)
#define L_xxyz               L(20)
#define Ls_xxyz              Ls(20)
#define L_xyyy               L(21)
#define Ls_xyyy              Ls(21)
#define L_xyyz               L(22)
#define Ls_xyyz              Ls(22)
#define Ls_yyyy              Ls(23)
#define L_yyyy               L(23)
#define L_yyyz               L(24)
#define Ls_yyyz              Ls(24)
    Ls_xxx  = Ls_xxx + (L_xxx + L_xxxx*x + L_xxxy*y + L_xxxz*z)
    Ls_xxy  = Ls_xxy + (L_xxxy*x + L_xxy + L_xxyy*y + L_xxyz*z)
    Ls_xyy  = Ls_xyy + (L_xxyy*x + L_xyy + L_xyyy*y + L_xyyz*z)
    Ls_yyy  = Ls_yyy + (L_xyyy*x + L_yyy + L_yyyy*y + L_yyyz*z)
    Ls_xxxx = Ls_xxxx + (L_xxxx)
    Ls_xxxy = Ls_xxxy + (L_xxxy)
    Ls_xxxz = Ls_xxxz + (L_xxxz)
    Ls_xxyy = Ls_xxyy + (L_xxyy)
    Ls_xxyz = Ls_xxyz + (L_xxyz)
    Ls_xyyy = Ls_xyyy + (L_xyyy)
    Ls_xyyz = Ls_xyyz + (L_xyyz)
    Ls_yyyy = Ls_yyyy + (L_yyyy)
    Ls_yyyz = Ls_yyyz + (L_yyyz)
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    L_yzz   = -(L_xxy + L_yyy)
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    Ls_xx   = Ls_xx + (L_xx + L_xxx*x + L_xxxy*x*y + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz* &
      z + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxyy*y**2 + L_xxzz*z**2))
    Ls_xxz  = Ls_xxz + (L_xxxz*x + L_xxyz*y + L_xxz + L_xxzz*z)
    L_xyzz  = -(L_xxxy + L_xyyy)
    Ls_xy   = Ls_xy + (L_xxy*x + L_xxyy*x*y + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz* &
      z + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xyyy*y**2 + L_xyzz*z**2))
    Ls_xyz  = Ls_xyz + (L_xxyz*x + L_xyyz*y + L_xyz + L_xyzz*z)
    L_xzzz  = -(L_xxxz + L_xyyz)
    Ls_x    = Ls_x + (L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xyyy*y**3 + L_xzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + &
      L_xyzz*y*z**2 + L_xzz*z**2))
    Ls_xz   = Ls_xz + (L_xxyz*x*y + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz* &
      z + (1.0d0/2.0d0)*(L_xxxz*x**2 + L_xyyz*y**2 + L_xzzz*z**2))
    L_yyzz  = -(L_xxyy + L_yyyy)
    Ls_yy   = Ls_yy + (L_xyy*x + L_xyyy*x*y + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz* &
      z + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_yyyy*y**2 + L_yyzz*z**2))
    Ls_yyz  = Ls_yyz + (L_xyyz*x + L_yyyz*y + L_yyz + L_yyzz*z)
    L_yzzz  = -(L_xxyz + L_yyyz)
    Ls_y    = Ls_y + (L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_yyyy*y**3 + L_yzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + &
      L_yyzz*y*z**2 + L_yzz*z**2))
    Ls_yz   = Ls_yz + (L_xyyz*x*y + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz* &
      z + (1.0d0/2.0d0)*(L_xxyz*x**2 + L_yyyz*y**2 + L_yzzz*z**2))
    L_zzzz  = -(L_xxzz + L_yyzz)
    Ls_0    = Ls_0 + (L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_yyyy*y**4 + L_zzzz*z**4) + ( &
      1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxzz*x**2*z**2 + L_yyzz*y**2*z &
      **2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxz*x**3*z &
      + L_xyyy*x*y**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + &
      L_yzzz*y*z**3 + L_zzz*z**3) + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x &
      **2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x* &
      y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2* &
      z + L_yzz*y*z**2 + L_zz*z**2))
    Ls_z    = Ls_z + (L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2))
#undef  Ls_0                
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_0                 
#undef  L_x                 
#undef  Ls_x                
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  L_xy                
#undef  Ls_xy               
#undef  L_xz                
#undef  Ls_xz               
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
#undef  Ls_xxxx             
#undef  L_xxxx              
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  Ls_xxxz             
#undef  L_xxxz              
#undef  L_xxyy              
#undef  Ls_xxyy             
#undef  L_xxyz              
#undef  Ls_xxyz             
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
    end subroutine mom_es_L2L_add
    
! OPS  163*ADD + 2*DIV + 306*MUL + 14*NEG + 74*POW + 17*SUB = 576  (603 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
                D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz,&
                D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz,&
                D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz,&
                D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
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
#define M_xxzz               M(1:2,25)
#define M_xyyy               M(1:2,26)
#define M_xyyz               M(1:2,27)
#define M_xyzz               M(1:2,28)
#define M_xzzz               M(1:2,29)
#define M_yyyy               M(1:2,30)
#define M_yyyz               M(1:2,31)
#define M_yyzz               M(1:2,32)
#define M_yzzz               M(1:2,33)
#define M_zzzz               M(1:2,34)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    h      = x**2 + y**2 + z**2
    u2     = 1.0/h
    u      = sqrt(u2)
    D_0    = u
    D_x    = -u**3*x
    D_y    = -u**3*y
    D_z    = -u**3*z
    D_xx   = -h*u**5 + 3*u**5*x**2
    D_xy   = 3*u**5*x*y
    D_xz   = 3*u**5*x*z
    D_yy   = -h*u**5 + 3*u**5*y**2
    D_yz   = 3*u**5*y*z
    D_zz   = -(D_xx + D_yy)
    D_xxx  = 9*h*u**7*x - 15*u**7*x**3
    D_xxy  = 3*h*u**7*y - 15*u**7*x**2*y
    D_xxz  = 3*h*u**7*z - 15*u**7*x**2*z
    D_xyy  = 3*h*u**7*x - 15*u**7*x*y**2
    D_xyz  = -15*u**7*x*y*z
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = 9*h*u**7*y - 15*u**7*y**3
    D_yyz  = 3*h*u**7*z - 15*u**7*y**2*z
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    D_xxxx = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    L_xxxx = D_xxxx*M_0
    D_xxxy = -45*h*u**9*x*y + 105*u**9*x**3*y
    L_xxxy = D_xxxy*M_0
    D_xxxz = -45*h*u**9*x*z + 105*u**9*x**3*z
    L_xxx  = D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z
    L_xxxz = D_xxxz*M_0
    D_xxyy = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    L_xxyy = D_xxyy*M_0
    D_xxyz = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    L_xxy  = D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyy*M_yy + D_xxyz*M_yz + D_xxz*M_z + D_xxzz*M_zz
    L_xxz  = D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z
    D_xyyy = -45*h*u**9*x*y + 105*u**9*x*y**3
    L_xyyy = D_xyyy*M_0
    D_xyyz = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    L_xyy  = D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = D_xxxy*M_xx + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyy*M_yy + D_xyyz*M_yz + D_xyz*M_z + D_xyzz*M_zz
    L_xyz  = D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxy*M_xxy + D_xxxz* &
      M_xxz + D_xxy*M_xy + D_xxyy*M_xyy + D_xxyz*M_xyz + D_xxz*M_xz + &
      D_xxzz*M_xzz + D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyz* &
      M_yyz + D_xyz*M_yz + D_xyzz*M_yzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz
    L_xz   = D_xxxz*M_xx + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyyz*M_yy + &
      D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz
    D_yyyy = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    L_yyyy = D_yyyy*M_0
    D_yyyz = -45*h*u**9*y*z + 105*u**9*y**3*z
    L_yyy  = D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xxyy*M_xx + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*M_yy + D_yyyz*M_yz + D_yyz*M_z + D_yyzz*M_zz
    L_yyz  = D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xxxy*M_xxx + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xy*M_x + &
      D_xyy*M_xy + D_xyyy*M_xyy + D_xyyz*M_xyz + D_xyz*M_xz + D_xyzz* &
      M_xzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyz* &
      M_yyz + D_yyz*M_yz + D_yyzz*M_yzz + D_yz*M_z + D_yzz*M_zz + &
      D_yzzz*M_zzz
    L_yz   = D_xxyz*M_xx + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*M_yy + &
      D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxy* &
      M_xxxy + D_xxxz*M_xxxz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xy*M_xy + D_xyy*M_xyy + &
      D_xyyy*M_xyyy + D_xyyz*M_xyyz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_y*M_y + D_yy*M_yy + &
      D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyz*M_yyyz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + D_z*M_z &
      + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz
    L_z    = D_xxxz*M_xxx + D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz &
      + D_yyyz*M_yyy + D_yyz*M_yy + D_yyzz*M_yyz + D_yz*M_y + D_yzz* &
      M_yz + D_yzzz*M_yzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz
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
    end subroutine mom_es_M2L2
    
! OPS  136*ADD + 15*DIV + 210*MUL + 11*NEG + 81*POW = 453  (551 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Phi_0                Phi(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define Phi_x                Phi(1:2,1)
#define L_x                  L(1:2,1)
#define Phi_y                Phi(1:2,2)
#define L_y                  L(1:2,2)
#define L_z                  L(1:2,3)
#define Phi_z                Phi(1:2,3)
#define Phi_xx               Phi(1:2,4)
#define L_xx                 L(1:2,4)
#define L_xy                 L(1:2,5)
#define Phi_xy               Phi(1:2,5)
#define L_xz                 L(1:2,6)
#define Phi_xz               Phi(1:2,6)
#define Phi_yy               Phi(1:2,7)
#define L_yy                 L(1:2,7)
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
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    L_yzz  = -(L_xxy + L_yyy)
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    Phi_xx = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz* &
      z + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxyy*y**2 + L_xxzz*z**2)
    L_xyzz = -(L_xxxy + L_xyyy)
    Phi_xy = L_xxy*x + L_xxyy*x*y + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz* &
      z + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xyyy*y**2 + L_xyzz*z**2)
    L_xzzz = -(L_xxxz + L_xyyz)
    Phi_x  = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xyyy*y**3 + L_xzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + &
      L_xyzz*y*z**2 + L_xzz*z**2)
    Phi_xz = L_xxyz*x*y + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz* &
      z + (1.0d0/2.0d0)*(L_xxxz*x**2 + L_xyyz*y**2 + L_xzzz*z**2)
    L_yyzz = -(L_xxyy + L_yyyy)
    Phi_yy = L_xyy*x + L_xyyy*x*y + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz* &
      z + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_yyyy*y**2 + L_yyzz*z**2)
    Phi_zz = -(Phi_xx + Phi_yy)
    L_yzzz = -(L_xxyz + L_yyyz)
    Phi_y  = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_yyyy*y**3 + L_yzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + &
      L_yyzz*y*z**2 + L_yzz*z**2)
    Phi_yz = L_xyyz*x*y + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz* &
      z + (1.0d0/2.0d0)*(L_xxyz*x**2 + L_yyyz*y**2 + L_yzzz*z**2)
    L_zzzz = -(L_xxzz + L_yyzz)
    Phi_0  = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_yyyy*y**4 + L_zzzz*z**4) + ( &
      1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxzz*x**2*z**2 + L_yyzz*y**2*z &
      **2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxz*x**3*z &
      + L_xyyy*x*y**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + &
      L_yzzz*y*z**3 + L_zzz*z**3) + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x &
      **2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x* &
      y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2* &
      z + L_yzz*y*z**2 + L_zz*z**2)
    Phi_z  = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  Phi_0               
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Phi_x               
#undef  L_x                 
#undef  Phi_y               
#undef  L_y                 
#undef  L_z                 
#undef  Phi_z               
#undef  Phi_xx              
#undef  L_xx                
#undef  L_xy                
#undef  Phi_xy              
#undef  L_xz                
#undef  Phi_xz              
#undef  Phi_yy              
#undef  L_yy                
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
    end subroutine mom_es_L2P2
    
! OPS  157*ADD + 15*DIV + 231*MUL + 10*NEG + 81*POW = 494  (591 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Ls_0                 Ls(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_0                  L(1:2,0)
#define L_x                  L(1:2,1)
#define Ls_x                 Ls(1:2,1)
#define Ls_y                 Ls(1:2,2)
#define L_y                  L(1:2,2)
#define L_z                  L(1:2,3)
#define Ls_z                 Ls(1:2,3)
#define Ls_xx                Ls(1:2,4)
#define L_xx                 L(1:2,4)
#define L_xy                 L(1:2,5)
#define Ls_xy                Ls(1:2,5)
#define L_xz                 L(1:2,6)
#define Ls_xz                Ls(1:2,6)
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
#define Ls_xxxx              Ls(1:2,16)
#define L_xxxx               L(1:2,16)
#define Ls_xxxy              Ls(1:2,17)
#define L_xxxy               L(1:2,17)
#define Ls_xxxz              Ls(1:2,18)
#define L_xxxz               L(1:2,18)
#define L_xxyy               L(1:2,19)
#define Ls_xxyy              Ls(1:2,19)
#define L_xxyz               L(1:2,20)
#define Ls_xxyz              Ls(1:2,20)
#define L_xyyy               L(1:2,21)
#define Ls_xyyy              Ls(1:2,21)
#define L_xyyz               L(1:2,22)
#define Ls_xyyz              Ls(1:2,22)
#define Ls_yyyy              Ls(1:2,23)
#define L_yyyy               L(1:2,23)
#define L_yyyz               L(1:2,24)
#define Ls_yyyz              Ls(1:2,24)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    Ls_xxx  = L_xxx + L_xxxx*x + L_xxxy*y + L_xxxz*z
    Ls_xxy  = L_xxxy*x + L_xxy + L_xxyy*y + L_xxyz*z
    Ls_xyy  = L_xxyy*x + L_xyy + L_xyyy*y + L_xyyz*z
    Ls_yyy  = L_xyyy*x + L_yyy + L_yyyy*y + L_yyyz*z
    Ls_xxxx = L_xxxx
    Ls_xxxy = L_xxxy
    Ls_xxxz = L_xxxz
    Ls_xxyy = L_xxyy
    Ls_xxyz = L_xxyz
    Ls_xyyy = L_xyyy
    Ls_xyyz = L_xyyz
    Ls_yyyy = L_yyyy
    Ls_yyyz = L_yyyz
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    L_yzz   = -(L_xxy + L_yyy)
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    Ls_xx   = L_xx + L_xxx*x + L_xxxy*x*y + L_xxxz*x*z + L_xxy*y + L_xxyz*y*z + L_xxz* &
      z + (1.0d0/2.0d0)*(L_xxxx*x**2 + L_xxyy*y**2 + L_xxzz*z**2)
    Ls_xxz  = L_xxxz*x + L_xxyz*y + L_xxz + L_xxzz*z
    L_xyzz  = -(L_xxxy + L_xyyy)
    Ls_xy   = L_xxy*x + L_xxyy*x*y + L_xxyz*x*z + L_xy + L_xyy*y + L_xyyz*y*z + L_xyz* &
      z + (1.0d0/2.0d0)*(L_xxxy*x**2 + L_xyyy*y**2 + L_xyzz*z**2)
    Ls_xyz  = L_xxyz*x + L_xyyz*y + L_xyz + L_xyzz*z
    L_xzzz  = -(L_xxxz + L_xyyz)
    Ls_x    = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xyyy*y**3 + L_xzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + &
      L_xyzz*y*z**2 + L_xzz*z**2)
    Ls_xz   = L_xxyz*x*y + L_xxz*x + L_xxzz*x*z + L_xyz*y + L_xyzz*y*z + L_xz + L_xzz* &
      z + (1.0d0/2.0d0)*(L_xxxz*x**2 + L_xyyz*y**2 + L_xzzz*z**2)
    L_yyzz  = -(L_xxyy + L_yyyy)
    Ls_yy   = L_xyy*x + L_xyyy*x*y + L_xyyz*x*z + L_yy + L_yyy*y + L_yyyz*y*z + L_yyz* &
      z + (1.0d0/2.0d0)*(L_xxyy*x**2 + L_yyyy*y**2 + L_yyzz*z**2)
    Ls_yyz  = L_xyyz*x + L_yyyz*y + L_yyz + L_yyzz*z
    L_yzzz  = -(L_xxyz + L_yyyz)
    Ls_y    = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_yyyy*y**3 + L_yzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + &
      L_yyzz*y*z**2 + L_yzz*z**2)
    Ls_yz   = L_xyyz*x*y + L_xyz*x + L_xyzz*x*z + L_yyz*y + L_yyzz*y*z + L_yz + L_yzz* &
      z + (1.0d0/2.0d0)*(L_xxyz*x**2 + L_yyyz*y**2 + L_yzzz*z**2)
    L_zzzz  = -(L_xxzz + L_yyzz)
    Ls_0    = L_0 + L_x*x + L_xy*x*y + L_xyz*x*y*z + L_xz*x*z + L_y*y + L_yz*y*z + L_z &
      *z + (1.0d0/24.0d0)*(L_xxxx*x**4 + L_yyyy*y**4 + L_zzzz*z**4) + ( &
      1.0d0/4.0d0)*(L_xxyy*x**2*y**2 + L_xxzz*x**2*z**2 + L_yyzz*y**2*z &
      **2) + (1.0d0/6.0d0)*(L_xxx*x**3 + L_xxxy*x**3*y + L_xxxz*x**3*z &
      + L_xyyy*x*y**3 + L_xzzz*x*z**3 + L_yyy*y**3 + L_yyyz*y**3*z + &
      L_yzzz*y*z**3 + L_zzz*z**3) + (1.0d0/2.0d0)*(L_xx*x**2 + L_xxy*x &
      **2*y + L_xxyz*x**2*y*z + L_xxz*x**2*z + L_xyy*x*y**2 + L_xyyz*x* &
      y**2*z + L_xyzz*x*y*z**2 + L_xzz*x*z**2 + L_yy*y**2 + L_yyz*y**2* &
      z + L_yzz*y*z**2 + L_zz*z**2)
    Ls_z    = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  Ls_0                
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_0                 
#undef  L_x                 
#undef  Ls_x                
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  L_xy                
#undef  Ls_xy               
#undef  L_xz                
#undef  Ls_xz               
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
#undef  Ls_xxxx             
#undef  L_xxxx              
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  Ls_xxxz             
#undef  L_xxxz              
#undef  L_xxyy              
#undef  Ls_xxyy             
#undef  L_xxyz              
#undef  Ls_xxyz             
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
    end subroutine mom_es_L2L2_add
#endif
end module mom4
