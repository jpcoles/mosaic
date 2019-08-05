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
        
    
! OPS  2*ADD + 8*DIV + 29*MUL + 11*POW + 8*SUB = 58  (77 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u
#define z                    r(3)
#define x                    r(1)
#define y                    r(2)
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
    M_0   = W
    M_xy  = W*x*y
    M_xz  = W*x*z
    M_yz  = W*y*z
    M_xyz = W*x*y*z
    h     = x**2 + y**2 + z**2
    M_xx  = W*(-1.0d0/3.0d0*h + x**2)
    M_yy  = W*(-1.0d0/3.0d0*h + y**2)
    M_xxx = W*(-3.0d0/5.0d0*h*x + x**3)
    M_xxy = W*(-1.0d0/5.0d0*h*y + x**2*y)
    M_xxz = W*(-1.0d0/5.0d0*h*z + x**2*z)
    M_xyy = W*(-1.0d0/5.0d0*h*x + x*y**2)
    M_yyy = W*(-3.0d0/5.0d0*h*y + y**3)
    M_yyz = W*(-1.0d0/5.0d0*h*z + y**2*z)
#undef  z                   
#undef  x                   
#undef  y                   
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
    end subroutine mom_es_P2M
    
! OPS  37*ADD + 24*DIV + 88*MUL + 10*NEG + 11*POW + 24*SUB = 194  (231 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, M_zz, M_xzz, M_yzz, M_zzz, S_0, S_x,&
                S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz, S_xxx, S_xxy, S_xxz,&
                S_xyy, S_xyz, S_yyy, S_yyz
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define M_xy                 M(2)
#define Ms_xy                Ms(2)
#define Ms_xz                Ms(3)
#define M_xz                 M(3)
#define Ms_yy                Ms(4)
#define M_yy                 M(4)
#define Ms_yz                Ms(5)
#define M_yz                 M(5)
#define M_xxx                M(6)
#define Ms_xxx               Ms(6)
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
#define Ms_yyz               Ms(12)
#define M_yyz                M(12)
    Ms_0   = M_0
    M_zz   = -(M_xx + M_yy)
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    S_0    = 1
    S_x    = x
    S_y    = y
    S_z    = z
    S_xy   = x*y
    Ms_xy  = M_0*S_xy + M_xy
    S_xz   = x*z
    Ms_xz  = M_0*S_xz + M_xz
    S_yz   = y*z
    Ms_yz  = M_0*S_yz + M_yz
    S_xyz  = x*y*z
    Ms_xyz = M_0*S_xyz + M_xy*z + M_xyz + M_xz*y + M_yz*x
    h      = x**2 + y**2 + z**2
    S_xx   = -1.0d0/3.0d0*h + x**2
    Ms_xx  = M_0*S_xx + M_xx
    S_yy   = -1.0d0/3.0d0*h + y**2
    Ms_yy  = M_0*S_yy + M_yy
    S_xxx  = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx = M_0*S_xxx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(M_xx*x - M_xy*y - M_xz*z)
    S_xxy  = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy = M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (8.0d0/5.0d0)*M_xy*x - 1.0d0/ &
      5.0d0*(3*M_yy*y + 2*M_yz*z + y*(-M_xx - M_yy))
    S_xxz  = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz = M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (8.0d0/5.0d0)*M_xz*x - 1.0d0/ &
      5.0d0*(M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy))
    S_xyy  = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy = M_0*S_xyy + (8.0d0/5.0d0)*M_xy*y + M_xyy + (4.0d0/5.0d0)*M_yy*x - 1.0d0/ &
      5.0d0*(3*M_xx*x + 2*M_xz*z + x*(-M_xx - M_yy))
    S_yyy  = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy = M_0*S_yyy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(-M_xy*x + M_yy*y - M_yz*z)
    S_yyz  = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz = M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (8.0d0/5.0d0)*M_yz*y - 1.0d0/ &
      5.0d0*(M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy))
#undef  x                   
#undef  y                   
#undef  M_0                 
#undef  z                   
#undef  Ms_0                
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  Ms_xz               
#undef  M_xz                
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
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
#undef  Ms_yyy              
#undef  M_yyy               
#undef  Ms_yyz              
#undef  M_yyz               
    end subroutine mom_es_M2M
    
! OPS  84*ADD + 13*DIV + 226*MUL + 18*NEG + 74*POW + 17*SUB = 432  (503 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, M_zz, M_xzz, M_yzz, M_zzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define L_xx                 L(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
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
#define L_xyz                L(12)
#define M_yyz                M(12)
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
    M_zz   = -(M_xx + M_yy)
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    h      = x**2 + y**2 + z**2
    u2     = 1.0/h
    u      = sqrt(u2)
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
    L_xxx  = D_xxx*M_0
    D_xxy  = 3*h*u**7*y - 15*u**7*x**2*y
    L_xxy  = D_xxy*M_0
    D_xxz  = 3*h*u**7*z - 15*u**7*x**2*z
    L_xxz  = D_xxz*M_0
    D_xyy  = 3*h*u**7*x - 15*u**7*x*y**2
    L_xyy  = D_xyy*M_0
    D_xyz  = -15*u**7*x*y*z
    L_xyz  = D_xyz*M_0
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = 9*h*u**7*y - 15*u**7*y**3
    L_yyy  = D_yyy*M_0
    D_yyz  = 3*h*u**7*z - 15*u**7*y**2*z
    L_yyz  = D_yyz*M_0
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    D_xxxx = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    L_xxxx = D_xxxx*M_0
    D_xxxy = -45*h*u**9*x*y + 105*u**9*x**3*y
    L_xxxy = D_xxxy*M_0
    D_xxxz = -45*h*u**9*x*z + 105*u**9*x**3*z
    L_xxxz = D_xxxz*M_0
    D_xxyy = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    L_xxyy = D_xxyy*M_0
    D_xxyz = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = D_xx*M_0 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxxx*M_xx + D_xxyy*M_yy + D_xxzz*M_zz)
    D_xyyy = -45*h*u**9*x*y + 105*u**9*x*y**3
    L_xyyy = D_xyyy*M_0
    D_xyyz = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxxy*M_xx + D_xyyy*M_yy + D_xyzz*M_zz)
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyz*M_yz + (1.0d0/ &
      6.0d0)*(D_xxxx*M_xxx + D_xyyy*M_yyy + D_xzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxx*M_xx + D_xxxy*M_xxy + D_xxxz*M_xxz + D_xxyy*M_xyy + &
      D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz* &
      M_zz)
    L_xz   = D_xxyz*M_xy + D_xxzz*M_xz + D_xyzz*M_yz + D_xz*M_0 + (1.0d0/2.0d0)*( &
      D_xxxz*M_xx + D_xyyz*M_yy + D_xzzz*M_zz)
    D_yyyy = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    L_yyyy = D_yyyy*M_0
    D_yyyz = -45*h*u**9*y*z + 105*u**9*y**3*z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxyy*M_xx + D_yyyy*M_yy + D_yyzz*M_zz)
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/ &
      6.0d0)*(D_xxxy*M_xxx + D_yyyy*M_yyy + D_yzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xyyy*M_xyy + &
      D_xyzz*M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz* &
      M_zz)
    L_yz   = D_xyyz*M_xy + D_xyzz*M_xz + D_yyzz*M_yz + D_yz*M_0 + (1.0d0/2.0d0)*( &
      D_xxyz*M_xx + D_yyyz*M_yy + D_yzzz*M_zz)
    D_zzzz = -(D_xxzz + D_yyzz)
    L_z    = D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/ &
      6.0d0)*(D_xxxz*M_xxx + D_yyyz*M_yyy + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xzzz*M_xzz + D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz* &
      M_zz)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
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
#undef  L_xyz               
#undef  M_yyz               
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
    end subroutine mom_es_M2L
    
! OPS  123*ADD + 11*DIV + 171*MUL + 10*NEG + 51*POW = 366  (440 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define Ls_xx                Ls(3)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define Ls_xy                Ls(4)
#define L_xz                 L(5)
#define Ls_xz                Ls(5)
#define Ls_yy                Ls(6)
#define L_yy                 L(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define Ls_xxy               Ls(9)
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
#define Ls_xxxx              Ls(15)
#define L_xxxx               L(15)
#define Ls_xxxy              Ls(16)
#define L_xxxy               L(16)
#define Ls_xxxz              Ls(17)
#define L_xxxz               L(17)
#define L_xxyy               L(18)
#define Ls_xxyy              Ls(18)
#define L_xxyz               L(19)
#define Ls_xxyz              Ls(19)
#define L_xyyy               L(20)
#define Ls_xyyy              Ls(20)
#define L_xyyz               L(21)
#define Ls_xyyz              Ls(21)
#define Ls_yyyy              Ls(22)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define Ls_yyyz              Ls(23)
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
    Ls_z    = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
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
    
! OPS  57*ADD + 6*DIV + 90*MUL + 10*NEG + 36*POW = 199  (263 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Phi_x                Phi(0)
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Phi_y                Phi(1)
#define L_y                  L(1)
#define Phi_z                Phi(2)
#define L_z                  L(2)
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
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    L_yzz  = -(L_xxy + L_yyy)
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    L_xyzz = -(L_xxxy + L_xyyy)
    L_xzzz = -(L_xxxz + L_xyyz)
    Phi_x  = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xyyy*y**3 + L_xzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + &
      L_xyzz*y*z**2 + L_xzz*z**2)
    L_yyzz = -(L_xxyy + L_yyyy)
    L_yzzz = -(L_xxyz + L_yyyz)
    Phi_y  = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_yyyy*y**3 + L_yzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + &
      L_yyzz*y*z**2 + L_yzz*z**2)
    L_zzzz = -(L_xxzz + L_yyzz)
    Phi_z  = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
#undef  Phi_x               
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_y               
#undef  L_y                 
#undef  Phi_z               
#undef  L_z                 
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
    end subroutine mom_es_L2P
    
! OPS  37*ADD + 24*DIV + 88*MUL + 10*NEG + 11*POW + 24*SUB = 194  (231 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, M_zz, M_xzz, M_yzz, M_zzz, S_0, S_x,&
                S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz, S_xxx, S_xxy, S_xxz,&
                S_xyy, S_xyz, S_yyy, S_yyz
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define M_xy                 M(2)
#define Ms_xy                Ms(2)
#define Ms_xz                Ms(3)
#define M_xz                 M(3)
#define Ms_yy                Ms(4)
#define M_yy                 M(4)
#define Ms_yz                Ms(5)
#define M_yz                 M(5)
#define M_xxx                M(6)
#define Ms_xxx               Ms(6)
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
#define Ms_yyz               Ms(12)
#define M_yyz                M(12)
    Ms_0   = Ms_0 + (M_0)
    M_zz   = -(M_xx + M_yy)
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    S_0    = 1
    S_x    = x
    S_y    = y
    S_z    = z
    S_xy   = x*y
    Ms_xy  = Ms_xy + (M_0*S_xy + M_xy)
    S_xz   = x*z
    Ms_xz  = Ms_xz + (M_0*S_xz + M_xz)
    S_yz   = y*z
    Ms_yz  = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz  = x*y*z
    Ms_xyz = Ms_xyz + (M_0*S_xyz + M_xy*z + M_xyz + M_xz*y + M_yz*x)
    h      = x**2 + y**2 + z**2
    S_xx   = -1.0d0/3.0d0*h + x**2
    Ms_xx  = Ms_xx + (M_0*S_xx + M_xx)
    S_yy   = -1.0d0/3.0d0*h + y**2
    Ms_yy  = Ms_yy + (M_0*S_yy + M_yy)
    S_xxx  = -3.0d0/5.0d0*h*x + x**3
    Ms_xxx = Ms_xxx + (M_0*S_xxx + M_xxx - 3.0d0/5.0d0*(M_yy*x + x*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(M_xx*x - M_xy*y - M_xz*z))
    S_xxy  = -1.0d0/5.0d0*h*y + x**2*y
    Ms_xxy = Ms_xxy + (M_0*S_xxy + (4.0d0/5.0d0)*M_xx*y + M_xxy + (8.0d0/5.0d0)*M_xy*x - 1.0d0/ &
      5.0d0*(3*M_yy*y + 2*M_yz*z + y*(-M_xx - M_yy)))
    S_xxz  = -1.0d0/5.0d0*h*z + x**2*z
    Ms_xxz = Ms_xxz + (M_0*S_xxz + (4.0d0/5.0d0)*M_xx*z + M_xxz + (8.0d0/5.0d0)*M_xz*x - 1.0d0/ &
      5.0d0*(M_yy*z + 2*M_yz*y + 3*z*(-M_xx - M_yy)))
    S_xyy  = -1.0d0/5.0d0*h*x + x*y**2
    Ms_xyy = Ms_xyy + (M_0*S_xyy + (8.0d0/5.0d0)*M_xy*y + M_xyy + (4.0d0/5.0d0)*M_yy*x - 1.0d0/ &
      5.0d0*(3*M_xx*x + 2*M_xz*z + x*(-M_xx - M_yy)))
    S_yyy  = -3.0d0/5.0d0*h*y + y**3
    Ms_yyy = Ms_yyy + (M_0*S_yyy + M_yyy - 3.0d0/5.0d0*(M_xx*y + y*(-M_xx - M_yy)) + (6.0d0/ &
      5.0d0)*(-M_xy*x + M_yy*y - M_yz*z))
    S_yyz  = -1.0d0/5.0d0*h*z + y**2*z
    Ms_yyz = Ms_yyz + (M_0*S_yyz + (4.0d0/5.0d0)*M_yy*z + M_yyz + (8.0d0/5.0d0)*M_yz*y - 1.0d0/ &
      5.0d0*(M_xx*z + 2*M_xz*x + 3*z*(-M_xx - M_yy)))
#undef  x                   
#undef  y                   
#undef  M_0                 
#undef  z                   
#undef  Ms_0                
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  Ms_xz               
#undef  M_xz                
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
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
#undef  Ms_yyy              
#undef  M_yyy               
#undef  Ms_yyz              
#undef  M_yyz               
    end subroutine mom_es_M2M_add
    
! OPS  84*ADD + 13*DIV + 226*MUL + 18*NEG + 74*POW + 17*SUB = 432  (503 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, M_zz, M_xzz, M_yzz, M_zzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define L_xx                 L(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
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
#define L_xyz                L(12)
#define M_yyz                M(12)
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
    M_zz   = -(M_xx + M_yy)
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    h      = x**2 + y**2 + z**2
    u2     = 1.0/h
    u      = sqrt(u2)
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
    L_xxx  = L_xxx + (D_xxx*M_0)
    D_xxy  = 3*h*u**7*y - 15*u**7*x**2*y
    L_xxy  = L_xxy + (D_xxy*M_0)
    D_xxz  = 3*h*u**7*z - 15*u**7*x**2*z
    L_xxz  = L_xxz + (D_xxz*M_0)
    D_xyy  = 3*h*u**7*x - 15*u**7*x*y**2
    L_xyy  = L_xyy + (D_xyy*M_0)
    D_xyz  = -15*u**7*x*y*z
    L_xyz  = L_xyz + (D_xyz*M_0)
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = 9*h*u**7*y - 15*u**7*y**3
    L_yyy  = L_yyy + (D_yyy*M_0)
    D_yyz  = 3*h*u**7*z - 15*u**7*y**2*z
    L_yyz  = L_yyz + (D_yyz*M_0)
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    D_xxxx = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    L_xxxx = L_xxxx + (D_xxxx*M_0)
    D_xxxy = -45*h*u**9*x*y + 105*u**9*x**3*y
    L_xxxy = L_xxxy + (D_xxxy*M_0)
    D_xxxz = -45*h*u**9*x*z + 105*u**9*x**3*z
    L_xxxz = L_xxxz + (D_xxxz*M_0)
    D_xxyy = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    L_xxyy = L_xxyy + (D_xxyy*M_0)
    D_xxyz = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    L_xxyz = L_xxyz + (D_xxyz*M_0)
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = L_xx + (D_xx*M_0 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxxx*M_xx + D_xxyy*M_yy + D_xxzz*M_zz))
    D_xyyy = -45*h*u**9*x*y + 105*u**9*x*y**3
    L_xyyy = L_xyyy + (D_xyyy*M_0)
    D_xyyz = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    L_xyyz = L_xyyz + (D_xyyz*M_0)
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = L_xy + (D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxxy*M_xx + D_xyyy*M_yy + D_xyzz*M_zz))
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = L_x + (D_x*M_0 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyz*M_yz + (1.0d0/ &
      6.0d0)*(D_xxxx*M_xxx + D_xyyy*M_yyy + D_xzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxx*M_xx + D_xxxy*M_xxy + D_xxxz*M_xxz + D_xxyy*M_xyy + &
      D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz* &
      M_zz))
    L_xz   = L_xz + (D_xxyz*M_xy + D_xxzz*M_xz + D_xyzz*M_yz + D_xz*M_0 + (1.0d0/2.0d0)*( &
      D_xxxz*M_xx + D_xyyz*M_yy + D_xzzz*M_zz))
    D_yyyy = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    L_yyyy = L_yyyy + (D_yyyy*M_0)
    D_yyyz = -45*h*u**9*y*z + 105*u**9*y**3*z
    L_yyyz = L_yyyz + (D_yyyz*M_0)
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = L_yy + (D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxyy*M_xx + D_yyyy*M_yy + D_yyzz*M_zz))
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = L_y + (D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/ &
      6.0d0)*(D_xxxy*M_xxx + D_yyyy*M_yyy + D_yzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xyyy*M_xyy + &
      D_xyzz*M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz* &
      M_zz))
    L_yz   = L_yz + (D_xyyz*M_xy + D_xyzz*M_xz + D_yyzz*M_yz + D_yz*M_0 + (1.0d0/2.0d0)*( &
      D_xxyz*M_xx + D_yyyz*M_yy + D_yzzz*M_zz))
    D_zzzz = -(D_xxzz + D_yyzz)
    L_z    = L_z + (D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/ &
      6.0d0)*(D_xxxz*M_xxx + D_yyyz*M_yyy + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xzzz*M_xzz + D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz* &
      M_zz))
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
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
#undef  L_xyz               
#undef  M_yyz               
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
    end subroutine mom_es_M2L_add
    
! OPS  123*ADD + 11*DIV + 171*MUL + 10*NEG + 51*POW = 366  (440 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define Ls_xx                Ls(3)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define Ls_xy                Ls(4)
#define L_xz                 L(5)
#define Ls_xz                Ls(5)
#define Ls_yy                Ls(6)
#define L_yy                 L(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define Ls_xxy               Ls(9)
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
#define Ls_xxxx              Ls(15)
#define L_xxxx               L(15)
#define Ls_xxxy              Ls(16)
#define L_xxxy               L(16)
#define Ls_xxxz              Ls(17)
#define L_xxxz               L(17)
#define L_xxyy               L(18)
#define Ls_xxyy              Ls(18)
#define L_xxyz               L(19)
#define Ls_xxyz              Ls(19)
#define L_xyyy               L(20)
#define Ls_xyyy              Ls(20)
#define L_xyyz               L(21)
#define Ls_xyyz              Ls(21)
#define Ls_yyyy              Ls(22)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define Ls_yyyz              Ls(23)
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
    Ls_z    = Ls_z + (L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2))
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
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
    
! OPS  84*ADD + 13*DIV + 226*MUL + 18*NEG + 74*POW + 17*SUB = 432  (503 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, M_zz, M_xzz, M_yzz, M_zzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define x                    r(1:2,1)
#define M_xx                 M(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define M_xy                 M(1:2,2)
#define M_xz                 M(1:2,3)
#define L_xx                 L(1:2,3)
#define M_yy                 M(1:2,4)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define M_yz                 M(1:2,5)
#define L_yy                 L(1:2,6)
#define M_xxx                M(1:2,6)
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
#define L_xyz                L(1:2,12)
#define M_yyz                M(1:2,12)
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
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    M_zz   = -(M_xx + M_yy)
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    h      = x**2 + y**2 + z**2
    u2     = 1.0/h
    u      = sqrt(u2)
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
    L_xxx  = D_xxx*M_0
    D_xxy  = 3*h*u**7*y - 15*u**7*x**2*y
    L_xxy  = D_xxy*M_0
    D_xxz  = 3*h*u**7*z - 15*u**7*x**2*z
    L_xxz  = D_xxz*M_0
    D_xyy  = 3*h*u**7*x - 15*u**7*x*y**2
    L_xyy  = D_xyy*M_0
    D_xyz  = -15*u**7*x*y*z
    L_xyz  = D_xyz*M_0
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = 9*h*u**7*y - 15*u**7*y**3
    L_yyy  = D_yyy*M_0
    D_yyz  = 3*h*u**7*z - 15*u**7*y**2*z
    L_yyz  = D_yyz*M_0
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    D_xxxx = 9*h**2*u**9 - 90*h*u**9*x**2 + 105*u**9*x**4
    L_xxxx = D_xxxx*M_0
    D_xxxy = -45*h*u**9*x*y + 105*u**9*x**3*y
    L_xxxy = D_xxxy*M_0
    D_xxxz = -45*h*u**9*x*z + 105*u**9*x**3*z
    L_xxxz = D_xxxz*M_0
    D_xxyy = 3*h**2*u**9 + 105*u**9*x**2*y**2 - 15*(h*u**9*x**2 + h*u**9*y**2)
    L_xxyy = D_xxyy*M_0
    D_xxyz = -15*h*u**9*y*z + 105*u**9*x**2*y*z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = D_xx*M_0 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxxx*M_xx + D_xxyy*M_yy + D_xxzz*M_zz)
    D_xyyy = -45*h*u**9*x*y + 105*u**9*x*y**3
    L_xyyy = D_xyyy*M_0
    D_xyyz = -15*h*u**9*x*z + 105*u**9*x*y**2*z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxxy*M_xx + D_xyyy*M_yy + D_xyzz*M_zz)
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyz*M_yz + (1.0d0/ &
      6.0d0)*(D_xxxx*M_xxx + D_xyyy*M_yyy + D_xzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxx*M_xx + D_xxxy*M_xxy + D_xxxz*M_xxz + D_xxyy*M_xyy + &
      D_xxzz*M_xzz + D_xyy*M_yy + D_xyyz*M_yyz + D_xyzz*M_yzz + D_xzz* &
      M_zz)
    L_xz   = D_xxyz*M_xy + D_xxzz*M_xz + D_xyzz*M_yz + D_xz*M_0 + (1.0d0/2.0d0)*( &
      D_xxxz*M_xx + D_xyyz*M_yy + D_xzzz*M_zz)
    D_yyyy = 9*h**2*u**9 - 90*h*u**9*y**2 + 105*u**9*y**4
    L_yyyy = D_yyyy*M_0
    D_yyyz = -45*h*u**9*y*z + 105*u**9*y**3*z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyyz*M_yz + (1.0d0/2.0d0)*( &
      D_xxyy*M_xx + D_yyyy*M_yy + D_yyzz*M_zz)
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/ &
      6.0d0)*(D_xxxy*M_xxx + D_yyyy*M_yyy + D_yzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xyyy*M_xyy + &
      D_xyzz*M_xzz + D_yyy*M_yy + D_yyyz*M_yyz + D_yyzz*M_yzz + D_yzz* &
      M_zz)
    L_yz   = D_xyyz*M_xy + D_xyzz*M_xz + D_yyzz*M_yz + D_yz*M_0 + (1.0d0/2.0d0)*( &
      D_xxyz*M_xx + D_yyyz*M_yy + D_yzzz*M_zz)
    D_zzzz = -(D_xxzz + D_yyzz)
    L_z    = D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/ &
      6.0d0)*(D_xxxz*M_xxx + D_yyyz*M_yyy + D_zzzz*M_zzz) + (1.0d0/ &
      2.0d0)*(D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xzzz*M_xzz + D_yyz*M_yy + D_yyzz*M_yyz + D_yzzz*M_yzz + D_zzz* &
      M_zz)
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
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
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
#undef  L_xyz               
#undef  M_yyz               
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
    end subroutine mom_es_M2L2
    
! OPS  57*ADD + 6*DIV + 90*MUL + 10*NEG + 36*POW = 199  (263 before optimization)
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
#define Phi_x                Phi(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Phi_y                Phi(1:2,1)
#define L_y                  L(1:2,1)
#define Phi_z                Phi(1:2,2)
#define L_z                  L(1:2,2)
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
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    L_yzz  = -(L_xxy + L_yyy)
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    L_xyzz = -(L_xxxy + L_xyyy)
    L_xzzz = -(L_xxxz + L_xyyz)
    Phi_x  = L_x + L_xx*x + L_xxy*x*y + L_xxyz*x*y*z + L_xxz*x*z + L_xy*y + L_xyz*y*z &
      + L_xz*z + (1.0d0/6.0d0)*(L_xxxx*x**3 + L_xyyy*y**3 + L_xzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxx*x**2 + L_xxxy*x**2*y + L_xxxz*x**2*z + &
      L_xxyy*x*y**2 + L_xxzz*x*z**2 + L_xyy*y**2 + L_xyyz*y**2*z + &
      L_xyzz*y*z**2 + L_xzz*z**2)
    L_yyzz = -(L_xxyy + L_yyyy)
    L_yzzz = -(L_xxyz + L_yyyz)
    Phi_y  = L_xy*x + L_xyy*x*y + L_xyyz*x*y*z + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z &
      + L_yz*z + (1.0d0/6.0d0)*(L_xxxy*x**3 + L_yyyy*y**3 + L_yzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxy*x**2 + L_xxyy*x**2*y + L_xxyz*x**2*z + &
      L_xyyy*x*y**2 + L_xyzz*x*z**2 + L_yyy*y**2 + L_yyyz*y**2*z + &
      L_yyzz*y*z**2 + L_yzz*z**2)
    L_zzzz = -(L_xxzz + L_yyzz)
    Phi_z  = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  Phi_x               
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_y               
#undef  L_y                 
#undef  Phi_z               
#undef  L_z                 
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
    end subroutine mom_es_L2P2
    
! OPS  123*ADD + 11*DIV + 171*MUL + 10*NEG + 51*POW = 366  (440 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Ls_x                 Ls(1:2,0)
#define x                    r(1:2,1)
#define Ls_y                 Ls(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define Ls_z                 Ls(1:2,2)
#define Ls_xx                Ls(1:2,3)
#define L_xx                 L(1:2,3)
#define L_xy                 L(1:2,4)
#define Ls_xy                Ls(1:2,4)
#define L_xz                 L(1:2,5)
#define Ls_xz                Ls(1:2,5)
#define Ls_yy                Ls(1:2,6)
#define L_yy                 L(1:2,6)
#define Ls_yz                Ls(1:2,7)
#define L_yz                 L(1:2,7)
#define Ls_xxx               Ls(1:2,8)
#define L_xxx                L(1:2,8)
#define L_xxy                L(1:2,9)
#define Ls_xxy               Ls(1:2,9)
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
#define Ls_xxxx              Ls(1:2,15)
#define L_xxxx               L(1:2,15)
#define Ls_xxxy              Ls(1:2,16)
#define L_xxxy               L(1:2,16)
#define Ls_xxxz              Ls(1:2,17)
#define L_xxxz               L(1:2,17)
#define L_xxyy               L(1:2,18)
#define Ls_xxyy              Ls(1:2,18)
#define L_xxyz               L(1:2,19)
#define Ls_xxyz              Ls(1:2,19)
#define L_xyyy               L(1:2,20)
#define Ls_xyyy              Ls(1:2,20)
#define L_xyyz               L(1:2,21)
#define Ls_xyyz              Ls(1:2,21)
#define Ls_yyyy              Ls(1:2,22)
#define L_yyyy               L(1:2,22)
#define L_yyyz               L(1:2,23)
#define Ls_yyyz              Ls(1:2,23)
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
    Ls_z    = L_xyz*x*y + L_xyzz*x*y*z + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z &
      + L_zz*z + (1.0d0/6.0d0)*(L_xxxz*x**3 + L_yyyz*y**3 + L_zzzz*z**3 &
      ) + (1.0d0/2.0d0)*(L_xxyz*x**2*y + L_xxz*x**2 + L_xxzz*x**2*z + &
      L_xyyz*x*y**2 + L_xzzz*x*z**2 + L_yyz*y**2 + L_yyzz*y**2*z + &
      L_yzzz*y*z**2 + L_zzz*z**2)
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
