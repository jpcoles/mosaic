#
# MOSAIC
# Multipole Operator Generator for FMM
# Copyright(c) 2013-2019 Jonathan Coles
#
# Tested using python 2.7 and sympy 1.1.1
#
from __future__ import division

import sys
import os.path
import platform
import numpy as np
import sympy as sp
import operator as op
from copy import deepcopy
from string import upper
from textwrap import wrap
from datetime import date
from operator import itemgetter, mul
from collections import defaultdict, OrderedDict
from itertools import product, starmap, chain, repeat, izip_longest, groupby
from sympy import Float, Number, Symbol, Pow, Matrix, Mul, S, Wild, default_sort_key
from sympy import Derivative, Function, Symbol, sqrt
from sympy.core.function import nfloat
from sympy.simplify.cse_main import cse_separate,reps_toposort
from sympy.utilities.iterables import numbered_symbols
from mpmath import *
mp.dps = 33

# ---------------
#output    = ''                     # write to stdout
#output    = 'latex'
output     = 'fortran'
output_dir = 'moments-FT'
exp_orders = [2,3,4,5,6,7,8,9,10]

# ---------------

Traceless  = True
TracelessD = True
optimize   = True

# ---------------

astro_version = False
astro_output_dir = 'moments-AP-NoOpt'
if astro_version: Traceless,TracelessD = True,True

# ---------------

test_symbolic_results = False

# ---------------


# ---------------------------------------------------------------------------
# - No Settings Below Here --------------------------------------------------
# ---------------------------------------------------------------------------

sp.init_printing(use_unicode=True)
version='1.0'
gen_info = '%s with Python %s and SymPy %s' % (date.today().strftime('%Y-%b-%d'), platform.python_version(), sp.__version__)


# ---------------
ndim = 3
ndim <= 3, "If you want ndim > 3 you need to modify the code."
# ---------------

def header_text(kind, order):
    comment = dict(latex='%%', fortran='!', cpp=('/*','*/')).get(kind, '')
                
    text = [ ''
           , ' DO NOT modify this file.'
           , ' This file was automatically generated with mosiac.py v%s' % version
           , ' on %s' % gen_info
           , ''
           , ' FMM_EXPANSION_ORDER  %s' % ('Unknown' if order is None else str(order))
           , ''
           ]

    if isinstance(comment, tuple):
        width = max(*map(len, text))
        return '\n'.join([comment[0] + (('%%-%is '%width) % t) + comment[1] for t in text])
    else:
        return '\n'.join([comment + t for t in text])

def main():
    global astro_version, exp_orders
    #test()

    argv = sys.argv[1:]

    if len(argv) > 0:
        if 'scaling' == argv[0]:
            run_scaling()
            exit(0)

    if len(argv) > 0:
        exp_orders = map(int, argv)

    print 'Running on %s' % gen_info

    for i in exp_orders:
        mod = 'mom%i'%i
        title = ' G E N E R A T I N G   p=%i' % i

        if astro_version: 
            title = ' G E N E R A T I N G   p=%i  astro version' % i
            dir = astro_output_dir
        else:
            dir = output_dir

        print 
        print '-'*80
        print title
        print '-'*80
        print 

        if not os.path.isdir(dir):
            print 'Output directory "%s" does not exist. Please create first. Skipping output.' % dir
            break

        if astro_version:
            es = dict(dir=dir, fname=mod, mod=mod, tag='mom_es', g=1/R, q=1, h=1, p=i)
        else:
            es = dict(dir=dir, fname=mod, mod=mod, tag='mom_es', g=1/R, q=0, h=2, p=i)

        gen_expansion(es)


def indices(*p0):
    if len(p0) == 2:
        min, p = p0
        if isinstance(p, tuple) and not hasattr(min, '__len__'):
            min = tuple([min] * len(p))
    else:
        min,p = p0[0],p0[0]
        #min = tuple([0] * len(p)) if isinstance(p, tuple) else 0

    if isinstance(p, tuple):
        return [ tuple(i) for i in product(*[ range(l, u+1) for l,u in zip(min,p) ]) ]
    else:
#       assert 0 <= min <= p, "Not valid: 0 <= %s <= %s" % (min,p)
        return [ tuple(i) for i in product(range(p+1), repeat=ndim) if min <= sum(i) <= p ]

def dt_indices(n):

    nh = tuple(map(lambda v: v//2, n))
    return indices(0,nh)

    
    n1,n2,n3=n
    ub = lambda v: range(0,v//2+1)
    return [tuple([m1,m2,m3]) 
            for m1 in ub(n1)
                for m2 in ub(n2)
                    for m3 in ub(n3)]

def fact(n):
    from math import factorial
    #return 1.0*(factorial(n))
    return sp.Integer(factorial(n))

def fact2(n):
    from scipy.misc import factorial2
    return sp.Integer(factorial2(n))

def midiff(f,n):
    return sp.diff(f,*mi_symbol(n)) if sum(n) != 0 else f

def midiff2(r,Txyz,n):
    return (-1)**sum(n) * r ** (-2*sum(n)-1) * Txyz[n]

def miadd(n,m):
    if hasattr(m, '__iter__'):
        return tuple([ i+j for i,j in zip(n,m) ])
    else:
        return tuple([ i+m for i in n ])

def misub(n,m):
    if hasattr(m, '__iter__'):
        return tuple([ i-j if i >= j else None for i,j in zip(n,m) ])
    else:
        return tuple([ i-m if i >= m else None for i in n ])

def miprod(n,m):
    if hasattr(m, '__iter__'):
        return tuple([ i*j for i,j in zip(n,m) ])
    else:
        return tuple([ i*m for i in n ])

def mineg(n):
    return tuple([ -i for i in n ])

def mifact(k):
    return sp.Mul(*map(sp.factorial, k))
def mipow(r,p):
    return sp.Mul(*starmap(sp.Pow, zip(r,p)))

def mi_symbol(idx, base_symbols='xyz'):
    """Convert a mi index into a combination of xyz's for readability."""
    if isinstance(base_symbols, basestring):
        return list(chain(*map(lambda s: list(s[0]*s[1]), zip(base_symbols, idx))))
    else:
        return list(chain(*map(lambda s: [str(s[0])]*s[1], zip(base_symbols, idx))))

def mi_symbols(idx, prefix):
    new = {}
    for i in idx:
        q = ''.join(mi_symbol(i))
        if not q: q = 0
        new[i] = RealSymbol('%s_%s' % (prefix,q))
    return new

def flatten(M):
    if M == []: return []
    if not hasattr(M, '__iter__'): return M
    res = []
    for m in M:
        if hasattr(m, '__iter__'): 
            res += flatten(m)
        else:
            res.append(m)
    return res

def vector_index(idx, vecform=None):
    return ','.join(filter(None, [vecform, str(idx)]))

def sym_to_var(sym, vecform=None):
    sym = str(sym)
    if '_' in sym:
        sym,idx = sym.split('_')
        return '%s(%s)' % (sym, vector_index(array_indices[sym][idx], vecform))
    else:
        return sym

def sym_to_var_index(sym, vecform=None):
    sym = str(sym)
    if '_' in sym:
        try:
            sym,idx = sym.split('_')
            return array_indices[sym][idx]
        except:
            print array_indices[sym]
            print 'Symbol: ', sym
            print 'Index: ', idx
            return 0
            raise e
            exit(1)
    else:
        return 0

def var_to_sym(var):
    var = str(var)
    if '_' in var:
        var,idx = var.split('_')
    else:
        idx = '0'
    sym = defaultdict(int, {k:len(list(g)) for k, g in groupby(idx)})
    return (sym['x'], sym['y'], sym['z'])

def split_sym(sym):
    sym = str(sym)
    if '_' in sym:
        sym,idx = sym.split('_')
        return sym,idx
    else:
        return sym,''

def my_measure(expr):
    POW = RealSymbol('POW')
    MUL = RealSymbol('POW')
    # Discourage powers by giving POW a weight of 10
    count = sp.count_ops(expr, visual=True).subs(POW, 10000)
    #count = count.subs(MUL, 100)
    # Every other operation gets a weight of 1 (the default)
    count = count.replace(Symbol, type(S.One))
    #count = count.replace(RealSymbol, type(S.One))
    return count

def get_symbols(M):
    return set(filter(lambda s: '_' in s.name, 
                      flatten(map(lambda e: e.atoms(Symbol), 
                                  M))))

def pow_to_mul(expr):
    """
    Convert integer powers in an expression to Muls, like a**2 => a*a.
    """
    pows = list(expr.atoms(Pow))
    with sp.evaluate(False):
        repl = []
        for i in pows:
            b,e = i.as_base_exp()
            if e.is_Integer:
                if e >= 0:
                    repl.append([i, (Mul(*[b]*e,evaluate=False))])
                else:
                    # Write a fraction this way so that the expansion is grouped in parenthesis
                    # and isn't corrupted by subsequent calls to pow_to_mul.
                    r = reduce(lambda a,b: (Mul(a,b,evaluate=False)), [1/b]*(-e))
                    repl.append([i,r])
            else:
                repl.append([b, pow_to_mul(b)])
        return expr.xreplace(dict(repl))

def make_code2(func, eq, with_cse=None, insym=False, do_rcollect=False):
    from sympy.simplify import cse_opts

    if with_cse is None:
        with_cse = optimize

    #eq = sorted(eq, key=lambda x: sp.count_ops(x[2]))

    if insym is not False:
        idx, Msym, M = map(list, zip(*eq)) #if eq else [],[],[]
        #lcl_idx, lcl_Msym, lcl_M = zip(*eq[1])
        lcl_idx, lcl_Msym, lcl_M = [],[],[]

        if type(insym) != type(True):
            tlcl,tMsym,tM = map(list,zip(*insym))
            lcl_Msym += tMsym
            lcl_M += tM
    else:
        idx, Msym, M = zip(*eq) #if eq else [],[],[]
        lcl_idx, lcl_Msym, lcl_M = [],[],[]



    print 
    print 'Generating code for %s...' % func
    print 

    cprio = {'x': map(RealSymbol,'xyz'),
             'y': map(RealSymbol,'yzx'),
             'z': map(RealSymbol,'zxy')}

    cprio = {'x': map(lambda v: RealSymbol(v),'xyz')}
    cprio = {'x': map(lambda v:v**2,xyz)}

    insyms = set()
    for sym,m in zip(Msym, M):
        for s in m.free_symbols: insyms.add(s)
        insyms.add(sym)

    defsyms = set()
    for sym,m in zip(Msym+lcl_Msym, M+lcl_M):
        defsyms.add(sym)

    extrasyms = set()
    for sym,m in zip(Msym+lcl_Msym, M+lcl_M):
        for s in m.free_symbols: 
            if s not in defsyms:
                extrasyms.add(s)

    insyms |= extrasyms

    if with_cse:

        def subit(expr):
            if expr.is_Add:
                expr = collect_constX(expr)
            elif expr.is_Mul or expr.is_Pow or (True and expr.args):
                return expr.func(*[subit(a) for a in expr.args])
            return expr

        for i,[sym,m] in enumerate(zip(Msym, M)):
            m = sp.expand(m)
            m = subit(m)
            if do_rcollect:
                m = collect_constX(m)
                m = sp.rcollect(m, 'x')
                m = sp.rcollect(m, 'y')
                m = sp.rcollect(m, 'z')
                m = sp.rcollect(m, [rsq]+xyz)

            #
            # Replace expressions like x**(-7/2) with 1/sqrt(x**7) evaluates faster (17%)
            #
            cond = lambda expr: expr.is_Pow and expr.args[1].p < 0 and expr.args[1].q==2
            m = m.replace(cond, lambda x:1/(sqrt(x.base**(x.exp*-2))))
            M[i] = m

    Msym = Msym + lcl_Msym
    M = M + lcl_M
    cse = zip(Msym, M)
    cse = reps_toposort(cse)


    rhs = map(lambda s: s[1], cse)
    ops = sum( sp.count_ops(e, visual=True) for e in rhs )
    pre_ops = Tops = sum( sp.count_ops(e) for e in rhs )
    ops_before = '! BEFORE CSE %s = %i' % (ops, Tops)
    print ops_before
    post_ops=pre_ops


    if with_cse:

        for i in range(1,4):

            exprT = map(lambda s: sp.Eq(s[0], s[1]), cse)
            cseT,_ = sp.cse(exprT,
                    optimizations='basic',
                    symbols=numbered_symbols('v'),
                    postprocess=cse_separate,
                    )

            cseT = map(lambda x: [x.lhs, x.rhs], _) + cseT
            cseT = reps_toposort(cseT)

            rhs = map(lambda s: s[1], cseT)
            post_opsT = sum( sp.count_ops(e) for e in rhs)
            opsT = sum( sp.count_ops(e, visual=True) for e in rhs)

            print '! PASS %i   %s = %i  (%i before optimization)' % (i, opsT, post_opsT, pre_ops)
            ops = opsT
            post_ops=post_opsT
            expr=exprT
            cse=cseT

    
    if with_cse:
        new_code = []

        def cond(x):
            #if x.is_Pow:
                #print 'Testing ', x, x.is_Pow, x.base, rrXi.keys(), (x.base in rrXi.keys())
            return x.is_Pow and x.base in rrXi.keys()
        def rep(x):
            print 'Replacing ', x, ' with ', x.base, x.exp, rrXi[x.base][x.exp-1][1]
            return rrXi[x.base][x.exp-1][1]

        for i,[lhs,rhs] in enumerate(cse):
            if not lhs.name[0] in [str(n)[0] for n in rrXi.keys()]:
                rhs = rhs.replace(cond, rep)
            new_code.append([lhs,rhs])

        cse = new_code

    #
    # Remove unused local variables that were passed in as additional arguments.
    # Toposort will push unused variables to the bottom, which we remove.
    #
    #cse = list(reversed(cse))
    cse = reps_toposort(cse)

    j=0
    for i,s in enumerate(reversed(cse)):
        if s[0] not in lcl_Msym:
            break
        j += 1
    if j: cse = cse[:-j]

#   if with_cse:
#       expr = map(lambda s: sp.Eq(*s), new_code)
#       expr.insert(0, sp.Eq(Symbol('w', nonnegative=True), 1/sp.sqrt(corrections[0][1]**2 + corrections[1][1]**2 + corrections[2][1]**2) ) )
#       cse,_ = sp.cse(expr, postprocess=cse_separate, optimizations='basic', symbols=numbered_symbols('x'))
#   else:
#       new_code.insert(0, [Symbol('w', nonnegative=True), 1/sp.sqrt(corrections[0][1]**2 + corrections[1][1]**2 + corrections[2][1]**2) ] )
#       cse = new_code


    #
    # Some final small modifications
    #

    def tofloat(expr):

        if expr.is_Add:
            terms = map(tofloat, expr.args)
            return expr.func(*terms, evaluate=False)

        elif expr.is_rational:
            if expr != 1 and expr != -1 and expr != 0 :
                return Float(nfloat(expr))
        elif expr.is_Mul:
            return expr.func(*[tofloat(a) for a in expr.args], evaluate=False)

        return expr


    def fixup(X):
	if X.is_Add:
	    n,d = X.as_numer_denom()
	    v = collect_constX(n) / d
	    z = sp.Add.make_args(v)
            #z = map(fixup, z)
	    terms = []
	    for g,it in groupby(z, lambda x: hasattr(x,'is_Mul') and x.is_Mul):
		Z = sp.Add(*list(it), evaluate=False)
		if g:
		    X,Y= Z.as_numer_denom()
		    X = collect_constX(X)
		    Z = sp.Mul(X, sp.Rational(1,Y), evaluate=False)
		terms.append(Z)

	    return sp.Add(*terms, evaluate=False)

	if X.is_Mul:
            #return X.func(*[nfloat(a) for a in X.make_args(X)])
	    return X.func(*[fixup(a) for a in X.make_args(X)], evaluate=False)

	return X


    new_code = []
    for i,[lhs,rhs] in enumerate(cse):
        if with_cse:
            rhs = pow_to_mul(rhs)
            rhs = fixup(rhs)
            rhs = tofloat(rhs) if output != 'latex' else rhs 
            rhs = collect_constX(rhs)
        else:
            rhs = collect_constX(rhs)
        new_code.append([lhs,rhs])
    cse = new_code

    rhs = map(lambda s: s[1], cse)

    post_ops = sum( sp.count_ops(e) for e in rhs )
    ops = sum( sp.count_ops(e, visual=True) for e in rhs )
    ops_after = '! OPS  %s = %i  (%i before optimization)' % (ops, post_ops, pre_ops)
    print ops_after
    SCALING.append([func, pre_ops, post_ops])

    undefsyms = set()
    for lhs,rhs in cse:
        if lhs not in insyms: undefsyms.add(lhs)
        for s in rhs.free_symbols: 
            if s not in insyms:
                undefsyms.add(s)


    vars = set(lcl_Msym) | undefsyms

    return {
            'vars'      : vars
          , 'eqs'       : new_code
          , 'info'      : ops_after
          , 'insyms'    : insyms
          , 'lcl_Msym'  : lcl_Msym
          }

def fortran(code):
    def flt(expr):
        return "%23.15f_dp" % str(expr)

    custom_functions = {
            "float" : flt
    }
    return sp.fcode(code, source_format='free', precision=35, standard=2003, user_functions=custom_functions) 

def write_latex(parts, module, file=sys.stdout, order=None):

    print header_text('latex', order)

    for p in parts:
        func,decl,vars,code,add,epilog,preamble,vecform = map(p.get, 
                ['func','decl','vars','code','add','epilog','preamble', 'vecform'])

        if code is None: continue

        info,vars,eqs,insyms,lcl_Msym = map(code.get, ['info','vars','eqs','insyms', 'lcl_Msym'])

        print '%%   '
        print '%%   '
        print '%% %s' % func
        print r'\begin{align*}'
        for lhs,rhs in eqs:
            #lhs = lhs.subs(R,Symbol('R')).subs(rsq,Symbol('R')**2)
            #rhs = rhs.subs(R,Symbol('R')).subs(rsq,Symbol('R')**2)
            rhs = rhs.subs(R,Symbol('R'))

            print '%s &= %s \\\\'% (sp.latex(lhs), sp.latex(rhs))
        print r'\end{align*}'

def write_fortran(parts, module, file=sys.stdout, order=None):
    print >>file, header_text('fortran', order)
    print >>file, '#include "polaris.h"'
    print >>file, 'module %s' % module
    print >>file, 'use types'
    print >>file, 'implicit none'
    if order is not None:
        print >>file, '#if FMM_EXPANSION_ORDER==%i' % order
    print >>file, '''contains
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
        '''

    for p in parts:
        func,decl,vars,code,add,epilog,preamble,vecform = map(p.get, 
                ['func','decl','vars','code','add','epilog','preamble', 'vecform'])
        if code is None: continue

        info,vars,eqs,insyms,lcl_Msym = map(code.get, ['info','vars','eqs','insyms', 'lcl_Msym'])

        corrections=[
            ('x',       RealSymbol('r(%s)'      % vector_index('1', vecform))),
            ('y',       RealSymbol('r(%s)'      % vector_index('2', vecform))),
            ('z',       RealSymbol('r(%s)'      % vector_index('3', vecform))),
            ('M',       RealSymbol('M(%s)'      % vector_index('0', vecform))),
            ('Ms',      RealSymbol('Ms(%s)'     % vector_index('0', vecform))),
            ('F',       RealSymbol('F(%s)'      % vector_index('0', vecform))),
            ('Fs',      RealSymbol('Fs(%s)'     % vector_index('0', vecform))),
            ('DelPhi',  RealSymbol('DelPhi(%s)' % vector_index('0', vecform)))]

        def getnum(x):
            import re
            v = sym_to_var_index(x,vecform)

            if '_' in x.name:
                return x.name.split('_')[0], v

            try:
                ns = re.split('(\d+)',x.name)
                return [ns,v,int(ns[1])]
            except:
                pass

            try:
                return ns,v
            except:
                return x.name

        vars = sorted(vars, key=lambda x: getnum(x))

        define = []
        for sym in insyms:
            if sym in lcl_Msym: continue

            name = sym.name
            for k,v in corrections:
                sym = sym.subs(k, v)
            try:
                sym = sym_to_var(sym,vecform=vecform)
            except:
                pass
            if name != sym: 
                define.append([name,sym])

        define = sorted(define, key=lambda x: sym_to_var_index(x[0],vecform))

        defs     = [ '#define %-20s %s' % (n,s) for n,s in define] 
        undefs   = [ '#undef  %-20s'    %  n    for n,s in define]
        tmp_vars = ('&\n%s'%(' '*16)).join(wrap(', '.join([ '%s' % v for v in vars]), width=78-16))

        c0 = map(lambda s: len(s.name), (lhs for lhs in vars))
        c1 = map(lambda s: len(s.name), (lhs for lhs,_ in eqs))
        colwidth = max(c0+c1) if c0 or c1 else 10
        fmt_vars = '%%(lhs)-%is = %%(rhs)s' % colwidth
        if add:
            fmt_code = '%%(lhs)-%is = %%(lhs)s + (%%(rhs)s)' % colwidth
        else:
            fmt_code = '%%(lhs)-%is = %%(rhs)s' % colwidth
        if tmp_vars:
            if vecform:
                tmp_vars = 'real(dp), dimension(%s) :: %s' % (vecform, tmp_vars)
            else:
                tmp_vars = 'real(dp) :: ' + tmp_vars

    
        def output(s='', indent_first=True, indent=True):
            if s is None: return 
            if indent and hasattr(s, '__iter__'): s = '\n    '.join( s )
            if not indent and hasattr(s, '__iter__'): s = '\n'.join( s )
            if indent and indent_first: print >>file, '   ',
            print >>file, s

        decl[0] = func + decl[0]

        output()
        output( info, indent=False )
        output( decl, indent_first=False )
        output( tmp_vars )
        output( defs, indent=False )
        output( preamble )
        output( [ (fmt_vars if lhs in vars else fmt_code)
                  % dict(lhs=lhs,rhs=fortran(rhs)) for lhs,rhs in eqs] )
        output( epilog )
        output( undefs, indent=False )

        output( 'end %s' % func )

    if order is not None:
        output( '#endif', indent = False )

    output( 'end module %s' % module, indent = False)

def print_dot(parts, module, file=sys.stdout, sym_to_var=None, only=None):

    quote = lambda s: '"%s"' % s
    for p in parts:
        tag,hdr,vars,code,add = map(p.get, ['tag','hdr','vars','code','add'])
        if only is not None and tag != only: continue
        print >>file, 'digraph "%s" {' % tag
        for lhs,rhs in vars + code:
            for s in rhs.atoms(Symbol):
                print >>file, '    %10s -> %s;' % (quote(s), quote(lhs))
                #print >>file, '    "%s" -> "%s"' % (''.join(filter(lambda x: x not in "()", s.name)), lhs)
                #print >>file, '    %s -> %s' % (lhs, ''.join(filter(lambda x: x not in "()", s.name)))
                #print >>file, '    %s_%s -> %s_%s' % (tag, lhs, tag,''.join(filter(lambda x: x not in "()", s.name)))

        print >>file, '}'

def write_header(name, d,file=sys.stdout, order=None):
    Midx,Lidx,Phiidx = d
    name = upper(name)

    print >>file, header_text('cpp', order)
    if order is not None:
        print >>file, '#if FMM_EXPANSION_ORDER==%i' % order
    print >>file, '#ifndef %s_H' % name
    print >>file, '#define %s_H' % name
    print >>file, '#define %s_M_END      %i' % (name, len(Midx) - 1)
    print >>file, '#define %s_M_LEN      %i' % (name, len(Midx))
    print >>file, '#define %s_L_END      %i' % (name, len(Lidx) - 1)
    print >>file, '#define %s_L_LEN      %i' % (name, len(Lidx))
    print >>file, '#define %s_PHI_END    %i' % (name, len(Phiidx) - 1)
    print >>file, '#define %s_PHI_LEN    %i' % (name, len(Phiidx))
    print >>file, '#endif'
    if order is not None:
        print >>file, '#endif'

def harmonic_replacement0(Z,n,Zsym,detrace,full):
    if n[2] >= 2:
        i = misub(n,(0,0,2))
        a = miadd(i,(2,0,0))
        b = miadd(i,(0,2,0))

        #ea = sp.expand(Z[a])
        #eb = sp.expand(Z[b])
        #en = sp.expand(Z[n])
        #assert en == -(ea + eb), [n, Z[n], Zsym[n], -(ea+eb),en]
#       if n == (0,3,4):
#           print Z[n]
#           print Zsym[a]
#           print Zsym[b]
#           exit(1)

        if detrace:
            Za = harmonic_replacement0(Z, a, Zsym, detrace)
            Zb = harmonic_replacement0(Z, b, Zsym, detrace)
            Z[n] = -(Za + Zb)
            return Z[n]
        else:
            if full:
                Z[n] = -(Z[a] + Z[b])
            else:
                Z[n] = -(Zsym[a] + Zsym[b])
        #Zsym[n] = -(Zsym[a] + Zsym[b])
#       if detrace: Zsym[n] = -(Zsym[a] + Zsym[b])

        #Z[n] = -(Za + Zb)
        #Zsym[n] = -(Za + Zb)

    return Zsym[n]

def harmonic_replacement(Z,Zsym, detrace=False,full=False):
    idx = sorted(Z.keys())
    for n in idx:
        harmonic_replacement0(Z,n,Zsym,detrace,full)

def harmonic_remove(A):
    idx = sorted(A.keys())
    return {n:A[n] for n in idx if n[2] < 2}

def harmonic_split_eq(A):
    return [[n for n in A if n[0][2] < 2],
            [n for n in A if n[0][2] >= 2]]

def check_traceless0(Z,n):
    if n[2] >= 2:
        i = misub(n,(0,0,2))
        a = miadd(i,(2,0,0))
        b = miadd(i,(0,2,0))
        #print Z[n], Z[a], Z[b]
        #print Z[n] + Z[a] + Z[b]
        #print n,a,b
        chk = sp.expand(Z[n] + Z[a] + Z[b])
        assert chk == 0, [n,a,b,Z[n] , Z[a] , Z[b], chk]
    return 

def check_traceless(Z):
    idx = sorted(Z.keys())
    for n in idx:
        check_traceless0(Z,n)

def gg(*args):
    if len(args) == 2:
        a,b = args
    else:
        b = args[0]
        a = sum(b)
    return sp.Integer(fact(a)) / mifact(b)

def detrace(A,scaled=True):
    def B(n,m):
        return mifact(n)/mifact(m) / 2**sum(m) / mifact(misub(n, miadd(m,m)))

    #dtA = defaultdict(int)
    dtA = {n: 0 for n in A.keys()}

    for n in A.keys():
        for m in dt_indices(n):
            assert 2*m[0] <= n[0]
            assert 2*m[1] <= n[1]
            assert 2*m[2] <= n[2]
            a = (-1)**sum(m) * fact2(2*(sum(n)-sum(m))-1)
            b = B(n,m)
            i = misub(n, miadd(m,m))
            Aii = 0
            for k in indices(sum(m)):
                assert sum(k) == sum(m)
                ii = miadd(i, miadd(k,k))
                assert ii in A, "%s %s" % (A[ii], ii)
                Aii += gg(sum(m),k) * A[ii]
            dtA[n] += a*b*Aii
#               print n, m, k, gg, A[ii], Aii, a, b, '   ==>  ', dtA[n]
            #print n, m, gg, Aii, a, b, '   += ', a*b* Aii
        if scaled: dtA[n] /= fact2(2*sum(n)-1)
    check_traceless(dtA)
    return dtA

def detraceR(r2,xyz,scaled=None):
    assert scaled is not None

    def B(n,m):
        return mifact(n)/mifact(m) / 2**sum(m) / mifact(misub(n, miadd(m,m)))

    #dtA = defaultdict(int)
    dtA = {n: 0 for n in xyz.keys()}

    for n in dtA.keys():

        for m in dt_indices(n):
            assert 2*m[0] <= n[0]
            assert 2*m[1] <= n[1]
            assert 2*m[2] <= n[2]
            a = (-1)**sum(m) * fact2(2*(sum(n)-sum(m))-1)
            b = B(n,m)
            i = misub(n, miadd(m,m))
            #Aii = r2m[2*sum(m)] * mipow(xyz, i)
            if sum(m) > 0:
                Aii = r2**(sum(m)) * xyz[i]
                #Aii = r2m[2*sum(m)] * mipow(xyz, i)
            else:
                Aii = xyz[i]
            dtA[n] += a*b*Aii
        #dtA[n] *= (-1)**sum(n) * Symbol('w')**(2*sum(n)+1)
        if scaled: dtA[n] /= fact2(2*sum(n)-1)
        #dtA[n] *= fact(sum(n))
#               print n, m, k, gg, A[ii], Aii, a, b, '   ==>  ', dtA[n]
            #print n, m, gg, Aii, a, b, '   += ', a*b* Aii

    return dtA

def detraceMs_new(M,M_sym,Ts,Ts_sym,scaled=True, tracelessR=True,remove_unused_S=True):
    def A(n,m):
        return (-1)**sum(m) * fact2(2*(sum(n)-sum(m))-1)
    def B(n,m):
        return mifact(n)/mifact(m) / 2**sum(m) / mifact(misub(n, miadd(m,m)))
    def f(n,m):
        return A(n,m) * B(n,m)

    badval = RealSymbol('badval')

    Tc = {n:0 for n in Ts}

#           h = np.dot(s,s)
    #dtM = {n: 0 for n in M.keys()}
    dtM = {}

    L = []

    for n in harmonic_remove(M):

        #if n[2] >= 2: continue

        q0 = 1
        dtM[n] = 0
        m = (0,0,0)
        ts = Ts_sym[n] if sum(n) >= 2 else Ts[n]
        ts = Ts[n] if n[2] >= 2 else ts
        dtM[n] = M_sym[m] * ts
        if sum(n) >= 2: 
            Tc[n] = 1
            for fs in Ts[n].free_symbols:
                Tc[var_to_sym(fs)] = 1

        dtM[n] *= f(n,m)

        for q in indices(q0,sum(n)):
            Mii = 0
            OK = False

            msym = M_sym[q] if q[2] < 2 else M[q]

            if msym != 0:
                for m in dt_indices(n):
                    assert 2*m[0] <= n[0]
                    assert 2*m[1] <= n[1]
                    assert 2*m[2] <= n[2]

                    mm=sp.S.Zero
                    for k in indices(sum(m)):
                        z = misub(miadd(n,miadd(k,k)), miadd(m,m))
                        assert None not in z

                        zq = misub(z,q)
                        if None in zq: continue

                        OK = True

                        #mm += mipow(s,zq) * mifact(z) / mifact(zq) / mifact(k) * fact(sum(m))
                        #ts = Ts[zq]
                        ts = Ts_sym[zq] if sum(zq) >= 2 else Ts[zq]
                        #ts = Ts[zq] if zq[2] >= 2 and tracelessR else ts
                        ts = Ts[zq] if zq[2] >= 2 else ts

                        #if ts==Ts_sym[zq]: Tc[zq] = 1

                        Tc[zq] = 1
                        for fs in Ts[zq].free_symbols:
                            Tc[var_to_sym(fs)] = 1

                        mm += (((ts * fact(sum(m)) * mifact(z)) ) / mifact(k)) / mifact(zq)

                    Mii += mm * f(n,m)

            t = (Mii * msym) / mifact(q)

            dtM[n] += t


        if scaled: dtM[n] /= fact2(2*sum(n)-1)

    cnt = 0
    if remove_unused_S:
        for k in Tc: 
            if Tc[k] == 0: # or k[2] >= 2:
                del Ts[k]
                if Ts is not Ts_sym: del Ts_sym[k]
                cnt += 1

#   print 'REMOVED %i from S' % cnt

#   for k in sorted(L, key=itemgetter(0,3)):
#       print k

#   for k in Ts: 
#       print k, Ts[k]

 #  for k in dtM: 
 #      print k, dtM[k]
 #  exit(1)

    #check_traceless(dtM) # This will fail because of the s2 substitution aboove
    return dtM


def gen_expansion(opts):

    global array_indices
    global rrXi

    outdir= opts.get('dir', '.')        # Output directory
    fname = opts.get('fname', None)     # Filename prefix
    g     = opts.get('g', None)         # Kernel function
    q     = opts.get('q', 0)            # Lowest tensor rank in output of L2P
    h     = opts.get('h', q)            # Highest tensor rank in output of L2P
    p     = opts.get('p', h)            # Expansion order
    tag   = opts.get('tag', None)       # Subroutine prefix in final code
    mod   = opts.get('mod', tag)        # Module name (if necessary)

    assert g   is not None, "No function g given."
    assert tag is not None, "No tag given."
    assert q<=h<=p, 'Lowest and highest output ranks (%i, %i) were badly specified for given expansion order of %i' % (q,h,p)

    if fname:
        filename=os.path.join(outdir, fname)
    else:
        filename = None

    F_begin   = ((1-ndim**q)/(1-ndim))
    Phi_begin = ((1-ndim**q)/(1-ndim)) if h else None

    xyz = map(Symbol, ['x', 'y', 'z'][:ndim])
    x,y,z = xyz
    r = map(Symbol, ['r(%i)' % (i+1) for i in range(ndim)])
    rr = Symbol('u')
    rrXi = defaultdict(list)

    #rr_eq = [(0,s,rr**i) for i,s in zip(range(1,2*p+1+1), numbered_symbols('u', start=1, assumptions=dict(positive=True)))]
    rs = [ Symbol('u%i' % i, assumptions=dict(nonnegative=True)) for i in range(1,max(2+1,2*p+1+1)) ]
    rs[0] = rr
    rr_eq = [(0,r,rs[(i+1)//2]*rs[(i+2)//2]) for i,[r,rp] in enumerate(zip(rs[2:],rs[0:]))]

    rrXi[rr] = [(i,s) for i,s in zip(range(1,2*p+1+1), rs)]
    rrXi[rr][0] = (1,rr)

    if 1:
        xs = [ Symbol('a%i' % i) for i in range(1,max(2+1,p+1)) ]
        ys = [ Symbol('b%i' % i) for i in range(1,max(2+1,p+1)) ]
        zs = [ Symbol('c%i' % i) for i in range(1,max(2+1,p+1)) ]
        rrXi[xyz[0]] = [(i,s) for i,s in zip(range(1,max(2+1,p+1)), xs)]
        rrXi[xyz[1]] = [(i,s) for i,s in zip(range(1,max(2+1,p+1)), ys)]
        rrXi[xyz[2]] = [(i,s) for i,s in zip(range(1,max(2+1,p+1)), zs)]
        rr_eq += [(0,r,xs[(i+0)//2]*xs[(i+1)//2]) for i,[r,rp] in enumerate(zip(xs[1:],xs[0:]))]
        rr_eq += [(0,r,ys[(i+0)//2]*ys[(i+1)//2]) for i,[r,rp] in enumerate(zip(ys[1:],ys[0:]))]
        rr_eq += [(0,r,zs[(i+0)//2]*zs[(i+1)//2]) for i,[r,rp] in enumerate(zip(zs[1:],zs[0:]))]

        #rr_eq += [(0,r,pow_to_mul(xyz[0]**(i+2))) for i,[r,rp] in enumerate(zip(xs[1:],xs[0:]))]
        #rr_eq += [(0,r,pow_to_mul(xyz[1]**(i+2))) for i,[r,rp] in enumerate(zip(ys[1:],ys[0:]))]
        #rr_eq += [(0,r,pow_to_mul(xyz[2]**(i+2))) for i,[r,rp] in enumerate(zip(zs[1:],zs[0:]))]
        rr_eq.insert(0, (0,xs[0],xyz[0]))
        rr_eq.insert(0, (0,ys[0],xyz[1]))
        rr_eq.insert(0, (0,zs[0],xyz[2]))



    #rr_eq.insert(0, (0,rr,sp.sqrt(rs[1])))
    #rr_eq.insert(0, (0,rs[1],sp.S.One/(np.dot(xyz,xyz))))

    rr_eq.insert(0, (0,rs[0],sp.sqrt(rs[1])))
    rr_eq.insert(0, (0,rs[1],sp.S.One/rsq))
    rr_eq.insert(0, (0,rsq,np.dot(xyz,xyz)))

#   print rr_eq
#   exit(1)


    Lidx    = indices(q,p)
    Diffidx = indices(q,p)
    Midx    = indices(0,p-q)
    Phiidx  = indices(q,h)

#   a=dict(izip_longest(indices(0,p),[], fillvalue=0))
#   b=dict(a)
#   #harmonic_remove(a,b)
#   a = sorted(harmonic_remove(b).keys())
#   #a = sorted(a.keys())


    array_indices = dict()

    def gen_array_indices(A, traceless=False):
        
        #A = sorted(A.items(), key=lambda x: (sum(x[0]) + (1000 if traceless and x[0][2] >= 2 else 0), x[0][2], x[0][1], x[0][0]))
        B = sorted(A.items(), 
                key=lambda x: (
                    sum(x[0]) + (1000 if traceless and x[0][2] >= 2 else 0), 
                    ''.join(mi_symbol(x[0]))))
        I = defaultdict( None, ((''.join(mi_symbol(v[0])), i) 
                for (i,v) in enumerate(B)))

        I['0'] = 0
        if I.has_key(''): del I[''] 
        return I


    # --------------------------------------------------------------------------
    # Derivatives
    # --------------------------------------------------------------------------

    print 
    print 'Generating derivatives...'

    #Qxyz = {n:mipow(xyz,n) for n in Midx}
    #Qxyz_sym = mi_symbols(Qxyz.keys(), 'Q')
    Qxyz_sym = {n:mipow(xyz,n) for n in indices(0,p)}

    if Traceless or TracelessD:

        #Txyz = detraceR(rsq, {n:mipow(xyz,n) for n in indices(0,p)}, scaled=False)
        Txyz = detraceR(rsq, {n:Qxyz_sym[n] for n in indices(0,p)}, scaled=False)
        Txyz_sym = mi_symbols(Txyz.keys(), 'Txyz')

        D = {n: midiff2(1/rr,Txyz,n) for n in Diffidx}
        D = {n: sp.expand(v) for n,v in D.iteritems()}
#       D = {n: sp.factor_terms(v) for n,v in D.iteritems()}

        Dsym = mi_symbols(D.keys(), 'D')
        harmonic_replacement(D, Dsym, detrace=False)
    else:
        D = {n: midiff(g,n) for n in Diffidx}
        D = {n: sp.powsimp(v.subs((x**2+y**2+z**2), rr**-2)) for n,v in D.iteritems()}
        D = {n: sp.expand(v) for n,v in D.iteritems()}
#       D = {n: sp.factor_terms(v) for n,v in D.iteritems()}
        Dsym = mi_symbols(D.keys(), 'D')
        #harmonic_replacement(D, Dsym, detrace=False)

#   Txyz = detraceR(rsq, {n:mipow(xyz,n) for n in indices(0,p)}, scaled=False)
#   Txyz_sym = mi_symbols(Txyz.keys(), 'Txyz')
#   D = {n: midiff2(rsq**(sp.S.One/2),Txyz,n) for n in Diffidx}
#   D = {n: sp.expand(v) for n,v in D.iteritems()}
#   D = {n: sp.factor_terms(v) for n,v in D.iteritems()}

#   for i in D: print i, sp.expand(D[i])
#   for i in D: D[i] = sp.expand(D[i])


    # --------------------------------------------------------------------------
    # Multipole expression
    # --------------------------------------------------------------------------
    print 'Generating P2M...'

    #Tr = detraceR_forM(rsq,{n:mipow(xyz,n) for n in Midx}, scaled=True) if not test_symbolic_results else detraceR_forM(np.dot(xyz,xyz),{n:mipow(xyz,n) for n in Midx}, scaled=True)

    if Traceless:
        #Tr = (detraceR(rsq,{n:mipow(xyz,n) for n in Midx}, scaled=True) 
        Tr = (detraceR(rsq,{n:Qxyz_sym[n] for n in Midx}, scaled=True) 
                if not test_symbolic_results 
                else detraceR(np.dot(xyz,xyz),{n:mipow(xyz,n) for n in Midx}, scaled=True))
        #Tr = detrace({n:mipow(xyz,n) for n in Midx}, scaled=True)
        Mt = {n: W * Tr[n] for n in Midx}
        Mt_sym = mi_symbols(Mt.keys(), 'M')
        #for i in Mt: print i, Mt[i]
        #exit(1)

        if astro_version:
            for i in indices(1):
                del Mt[i]
                del Mt_sym[i]
            Mt = defaultdict(int, Mt)
            Mt_sym = defaultdict(int, Mt_sym)

        harmonic_replacement(Mt, Mt_sym) if not test_symbolic_results else None 

    else:
        #M = {n: W / mifact(n) * mipow(xyz,n) for n in Midx}
        M = {n: W / mifact(n) * Qxyz_sym[n] for n in Midx}
        Msym = mi_symbols(M.keys(), 'M')

    # --------------------------------------------------------------------------
    # Multipole shift (M2M)
    # --------------------------------------------------------------------------
    print 'Generating M2M...'

    if test_symbolic_results and Traceless: 

        abc = map(RealSymbol, 'abc'[:ndim])
        Tr = detrace( {n: mipow(xyz,n) for n in Midx}, scaled=True)
        Mdr = {n: W * Tr[n] for n in Midx}
        Mdr_sym = mi_symbols(Mdr.keys(), 'Mdr')
        #harmonic_replacement(Mdr, Mdr_sym)
        for v in Mdr:
            Mdr[v] = Mdr[v].subs(xyz[0], xyz[0]+abc[0])
            Mdr[v] = Mdr[v].subs(xyz[1], xyz[1]+abc[1])
            Mdr[v] = Mdr[v].subs(xyz[2], xyz[2]+abc[2])
            Mdr[v] = Mdr[v].expand()

        Sxyz = detraceR(np.dot(abc,abc), {n:mipow(abc,n) for n in Midx}, scaled=True)
        M2M = detraceMs_new(Mt,Mt,Sxyz,Sxyz,scaled=True,tracelessR=True)

        def test_one(k, show_always=True):

            #Mshift = MshiftOLD
            for n,v in M2M.iteritems(): M2M[n] = sp.expand(M2M[n])
            for e,f in izip_longest(M2M[k].args, Mdr[k].args, fillvalue='.'*20):
                if e != f:
                    print
                    print 'FAILED for k=', k
                    print
                    print '%20s %20s' % ('??','correct')
                    for e,f in izip_longest(M2M[k].args, Mdr[k].args, fillvalue='.'*20):
                        #print '%20s %20s   %20s' % (e,f, e-f)
                        print '%20s %20s  %s' % (e,f, 'OK' if e==f else '')
                    exit(1)

            if show_always:
                print '%20s %20s' % ('??','correct')
                for e,f in izip_longest(M2M[k].args, Mdr[k].args, fillvalue='.'*20):
                    #print '%20s %20s   %20s' % (e,f, e-f)
                    print '%20s %20s  %s' % (e,f, 'OK' if e==f else '')

        if 0:
            #test_one((2,1,0))
            #test_one((2,1,1))
            #test_one((1,1,2))
            #test_one((2,0,0))
            #test_one((3,0,0))
            test_one((3,0,2))
            print 'PASSED'
        else:
            for k in M2M:
                test_one(k, show_always=False)
            print 'ALL M2M TESTS PASSED'

    if test_symbolic_results:
        return

    if Traceless:
        #Sxyz = detraceR(rsq, {n:mipow(xyz,n) for n in Midx}, scaled=True)
        Sxyz = detraceR(rsq, {n:Qxyz_sym[n] for n in Midx}, scaled=True)
        Sxyz_sym = mi_symbols(Sxyz.keys(), 'S')
        harmonic_replacement(Sxyz, Sxyz_sym)
        M2M = detraceMs_new(Mt,Mt_sym,Sxyz,Sxyz_sym,scaled=True,remove_unused_S=True,tracelessR=True)
    else:
        M2M = OrderedDict()
        for n in Midx:
            M2M[n] = 0
            for k in indices(0,n):
                M2M[n] += Qxyz_sym[k] / mifact(k) * Msym[misub(n,k)]


    M2M_sym = mi_symbols(M2M.keys(), 'Ms')

#   M2M_eq = equation(M2M_sym, M2M)

    # --------------------------------------------------------------------------
    # Field tensors
    # --------------------------------------------------------------------------
    print 'Generating M2L...'

#   Txyz = detraceR(np.dot(xyz,xyz), {n:mipow(xyz,n) for n in indices(0,p)}, scaled=False)
#   Txyz_sym = mi_symbols(Txyz.keys(), 'Txyz')
#   D = {n: midiff2(1/rr,Txyz,n) for n in Diffidx}
#   D = {n: sp.expand(v) for n,v in D.iteritems()}
#   Dsym = mi_symbols(D.keys(), 'D')
#   #harmonic_replacement(D, Dsym)
#   harmonic_replacement(D, Dsym, full=True)

    if Traceless:
        L = OrderedDict()
        for n in Lidx:
            L[n] = 0
            for m in indices(0,p-sum(n)):
                mn = miadd(m,n)
                L[n] += Dsym[mn] * Mt_sym[m] / mifact(m)
                #L[n] += D[mn] * Mt_sym[m] / mifact(m)
#       check_traceless(L)
    else:
        L = OrderedDict()
        for n in Lidx:
            L[n] = 0
            for m in indices(0,p-sum(n)):
                mn = miadd(m,n)
                L[n] += Msym[m] * Dsym[miadd(n,m)] 

#   print L[(1,0,0)]
#   exit(1)

    Lsym = mi_symbols(L.keys(), 'L')
    if Traceless or TracelessD:
        harmonic_replacement(L, Lsym)
        

    if 0 and test_symbolic_results:

        abc = map(RealSymbol, 'abc'[:ndim])
        Tr = detrace( {n: mipow(xyz,n) for n in Diffidx}, scaled=True)

        D = {n: midiff2(1/rr,Tr,n) for n in Diffidx}
        D = {n: sp.expand(v) for n,v in D.iteritems()}

        Dsym = mi_symbols(D.keys(), 'D')
        #harmonic_replacement(D, Dsym, detrace=False)

        p -= 1
        Lidx    = indices(q,p)
        Fdr = {}
        for n in Lidx:
            Fdr[n] = 0
            for m in indices(0,p-sum(n)):
                mn = miadd(m,n)
                f = D[mn] * Mt_sym[m] * fact(sum(m)) / fact(sum(n)) / mifact(m)
                Fdr[n] += f
        Fdr_sym = mi_symbols(Fdr.keys(), 'Fdr')
        #harmonic_replacement(Mdr, Mdr_sym)
        for v in Fdr:
            Fdr[v] = Fdr[v].expand()
#           Fdr[v] = Fdr[v].subs(xyz[0], xyz[0]+abc[0])
#           Fdr[v] = Fdr[v].subs(xyz[1], xyz[1]+abc[1])
#           Fdr[v] = Fdr[v].subs(xyz[2], xyz[2]+abc[2])
            #print v, Fdr[v]

        L = {}
        for n in Lidx:
            L[n] = 0
            for m in indices(0,p-sum(n)):
                mn = miadd(m,n)
                l = D[mn] * Mt_sym[m] * fact(sum(m)) / fact(sum(n)) / mifact(m)
                L[n] += l


        zero = (0,0,0)
        L2L = {}
        for n in harmonic_remove(F):
            L2L[n] = 0
            for k in indices(0,p-sum(n)):
                nk = miadd(n,k)
                L2L[n] += mipow(zero,k) * L[nk] * fact(sum(n)+sum(k)) / fact(sum(n)) / mifact(k)

        L2L_sym = mi_symbols(L2L, 'Fs')

        def test_oneX(k, show_always=True):

            for n,v in L2L.iteritems(): L2L[n] = sp.expand(L2L[n])
            for e,f in izip_longest(L2L[k].args, Fdr[k].args, fillvalue='.'*20):
                if e != f:
                    print
                    print 'FAILED for k=', k
                    print
                    print '%20s %20s' % ('??','correct')
                    print Fdr[k]
                    print L2L[k]
                    for e,f in izip_longest(L2L[k].args, Fdr[k].args, fillvalue='.'*20):
                        #print '%20s %20s   %20s' % (e,f, e-f)
                        #print '%20s' % (e,)
                        print '%40s %40s  %s' % (e,f, 'OK' if e==f else '')
                    exit(1)

            if show_always:
                print '%20s %20s' % ('??','correct')
                for e,f in izip_longest(L2L[k].args, Fdr[k].args, fillvalue='.'*20):
                    #print '%20s %20s   %20s' % (e,f, e-f)
                    print '%20s %20s  %s' % (e,f, 'OK' if e==f else '')

        if 0:
            #test_one((2,1,0))
            #test_one((2,1,1))
            #test_one((1,1,2))
            #test_one((2,0,0))
            #test_one((3,0,0))
            test_oneX((3,0,2))
            print 'PASSED'
        else:
            for k in L2L:
                test_oneX(k, show_always=False)
            print 'ALL PASSED'
        return


    # --------------------------------------------------------------------------
    # Field tensor shift
    # --------------------------------------------------------------------------
    print 'Generating L2L...'

    L2L = OrderedDict()
    for n in (harmonic_remove(L) if (Traceless or TracelessD) else Lidx):
        #for n in harmonic_remove(L):
        L2L[n] = 0
        for k in indices(0,p-sum(n)):
            ni,ki = sum(n),sum(k)
            nk = miadd(n,k)
            #L2L[n] += mipow(xyz,k) * Lsym[nk] / mifact(k)
            L2L[n] += Qxyz_sym[k] * Lsym[nk] / mifact(k)

    L2L_sym = mi_symbols(L2L, 'Ls')
#   if not Traceless:
#       harmonic_replacement(L2L, L2L_sym)

    # --------------------------------------------------------------------------
    # Potential (and derivatives)
    # --------------------------------------------------------------------------
    print 'Generating L2P...'

    out_idx = Phiidx

    L2P = {}
    for j in out_idx:
        L2P[j] = 0
        a,b=0,0
        for n in indices(0,p-sum(j)):
            nj = miadd(n,j)
            L2P[j] += Qxyz_sym[n] * Lsym[nj] / mifact(n)

    L2P_sym = mi_symbols(out_idx, 'Phi')
    if Traceless or TracelessD:
        harmonic_replacement(L2P, L2P_sym)

    if Traceless:
        array_indices['M']    = gen_array_indices(Mt,     traceless=True)
        array_indices['L']    = gen_array_indices(L,      traceless=True)
        array_indices['Ms']   = gen_array_indices(M2M,    traceless=True)
        array_indices['Ls']   = gen_array_indices(L2L,    traceless=True)
        array_indices['D']    = gen_array_indices(D,      traceless=False)
        array_indices['S']    = gen_array_indices(Sxyz,   traceless=False)
        #array_indices['Q']    = gen_array_indices(Qxyz,   traceless=False)
        array_indices['Phi']  = gen_array_indices(L2P,    traceless=False)
    else:
        array_indices['M']    = gen_array_indices(M,      traceless=False)
        array_indices['Ms']   = gen_array_indices(M2M,    traceless=False)
        array_indices['L']    = gen_array_indices(L,      traceless=TracelessD)
        array_indices['Ls']   = gen_array_indices(L2L,    traceless=TracelessD)
        array_indices['D']    = gen_array_indices(D,      traceless=False)
        #array_indices['S']    = gen_array_indices(Sxyz,   traceless=False)
        #array_indices['Q']    = gen_array_indices(Qxyz,   traceless=False)
        array_indices['Phi']  = gen_array_indices(L2P,    traceless=False)

    if not astro_version and Traceless:
        for k,v in array_indices['M'].iteritems():
            v2 = array_indices['L'][k]
            assert v2 == v, [k,v,v2]

    for k,v in array_indices['Ms'].iteritems():
        v2 = array_indices['M'][k]
        assert v2 == v, [k,v,v2]

    for k,v in array_indices['Ls'].iteritems():
        v2 = array_indices['L'][k]
        assert v2 == v, [k,v,v2]

    if astro_version:
        if h >= 1:
            assert array_indices['Phi'][ 'x'] == 0, array_indices['Phi'][ 'x']
            assert array_indices['Phi'][ 'y'] == 1, array_indices['Phi'][ 'y']
            assert array_indices['Phi'][ 'z'] == 2, array_indices['Phi'][ 'z']
    else:
        assert array_indices['Phi'][ '0'] == 0, array_indices['Phi'][ '0']
        if h >= 1:
            assert array_indices['Phi'][ 'x'] == 1, array_indices['Phi'][ 'x']
            assert array_indices['Phi'][ 'y'] == 2, array_indices['Phi'][ 'y']
            assert array_indices['Phi'][ 'z'] == 3, array_indices['Phi'][ 'z']
        if h >= 2:
            assert array_indices['Phi']['xx'] == 4, array_indices['Phi']['xx']
            assert array_indices['Phi']['xy'] == 5, array_indices['Phi']['xy']
            assert array_indices['Phi']['xz'] == 6, array_indices['Phi']['xz']
            assert array_indices['Phi']['yy'] == 7, array_indices['Phi']['yy']
            assert array_indices['Phi']['yz'] == 8, array_indices['Phi']['yz']
            assert array_indices['Phi']['zz'] == 9, array_indices['Phi']['zz']

    #print array_indices['M']
    #print array_indices['Ms']
    #exit(1)

#   print array_indices['S']
#   exit(1)

    def equation(sym, expr):
        return sorted( [ (i, sym[i], expr[i]) for i in expr.iterkeys() ], key=lambda x: array_indices[split_sym(x[1])[0]].get(split_sym(x[1])[1],0) )

    if not Traceless:
        Mt = M
        Mt_sym = Msym

    Mt_eq   = equation( Mt_sym,     Mt     )
    Leq     = equation( Lsym,       L      )

    Deq     = equation( Dsym,       D      )
    Sxyz_eq = equation( Sxyz_sym,   Sxyz   ) if Traceless else []
    #Sxyz_eq = equation( Sxyz_sym,   Sxyz   )
    #Qxyz_eq = equation( Qxyz_sym,   Qxyz   )
    Qxyz_eq = []
    M2M_eq  = equation( M2M_sym, M2M )
    L2L_eq  = equation( L2L_sym, L2L )
    L2P_eq  = equation( L2P_sym, L2P)

    # for writing the header files below
    L  = harmonic_remove(L)
    if Traceless:
        Mt = harmonic_remove(Mt)


    #for i in Qeq: print i
#   for d in Deq: print d
#   for i in Leq: print i
#    for i in Mt_eq: print i
#   for i in DelPhi_eq: print i
    #exit(1)

    if Traceless:
        P2M_code = make_code2('P2M', harmonic_split_eq( Mt_eq)[0],  insym=rr_eq + Qxyz_eq,                                          do_rcollect = False)
        M2M_code = make_code2('M2M', harmonic_split_eq(M2M_eq)[0],  insym=harmonic_split_eq(Mt_eq)[1] + Qxyz_eq + Sxyz_eq + rr_eq,  do_rcollect = False)
        M2L_code = make_code2('M2L', harmonic_split_eq(  Leq)[0],   insym=harmonic_split_eq(Mt_eq)[1] + Deq + rr_eq,      do_rcollect = False)
        #M2L_code = make_code2('M2L', harmonic_split_eq(  Leq)[0],   insym=harmonic_split_eq(Mt_eq)[1] + rr_eq,      do_rcollect = False)
        L2L_code = make_code2('L2L', harmonic_split_eq(L2L_eq)[0],  insym=harmonic_split_eq(  Leq)[1] + Qxyz_eq + rr_eq,            do_rcollect = True)
        L2P_code = make_code2('L2P', L2P_eq,                        insym=harmonic_split_eq(  Leq)[1] + Qxyz_eq + rr_eq,            do_rcollect = True)
    else:
        P2M_code = make_code2('P2M', Mt_eq,                         insym=Qxyz_eq + rr_eq,                                          do_rcollect = False)
        M2M_code = make_code2('M2M', M2M_eq,                        insym=Qxyz_eq + Sxyz_eq + rr_eq,                                do_rcollect = False)
        L2P_code = make_code2('L2P', L2P_eq,                        insym=harmonic_split_eq(  Leq)[1] + Qxyz_eq + rr_eq,            do_rcollect = True)

        if TracelessD:
            M2L_code = make_code2('M2L', harmonic_split_eq(  Leq)[0],   insym=Deq + Qxyz_eq + rr_eq,                                    do_rcollect = False)
            L2L_code = make_code2('L2L', harmonic_split_eq(L2L_eq)[0],  insym=harmonic_split_eq(  Leq)[1] + Qxyz_eq + rr_eq,            do_rcollect = True)
        else:
            M2L_code = make_code2('M2L',    Leq,  insym=Deq + Qxyz_eq + rr_eq,                                    do_rcollect = False)
            L2L_code = make_code2('L2L', L2L_eq,  insym=Qxyz_eq + rr_eq,            do_rcollect = True)

    # --------------------------------------------------------------------------
    # Output
    # --------------------------------------------------------------------------
    if output == 'fortran':
        print 'Generating fortran code...'
        code = [
                dict( func = 'subroutine %s_P2M' % tag
                    , decl = [ '(W, r, M)'
                             , 'real(dp), intent(in)  :: W, r(1:%i)' % ndim
                             , 'real(dp), intent(out) :: M(0:MOM_ES_M_END)']
                    , code = P2M_code) 

              , dict( func = 'subroutine %s_M2M' % tag
                    , decl = [ '(M, r, Ms)'
                             , 'real(dp), intent(in)  :: M(0:MOM_ES_M_END)'
                             , 'real(dp), intent(in)  :: r(1:%i)' % ndim
                             , 'real(dp), intent(out) :: Ms(0:MOM_ES_M_END)']
                    , code = M2M_code
                    )

              , dict( func = 'subroutine %s_M2L' % tag
                    , decl = [ '(M, r, L)'
                             , 'real(dp), intent(in)  :: M(0:MOM_ES_M_END)'
                             , 'real(dp), intent(in)  :: r(1:%i)' % ndim
                             , 'real(dp), intent(out) :: L(0:MOM_ES_L_END)']
                    , code = M2L_code)

              , dict( func = 'subroutine %s_L2L' % tag
                    , decl = [ '(L, r, Ls)'
                             , 'real(dp), intent(in)  :: L(0:MOM_ES_L_END)'
                             , 'real(dp), intent(in)  :: r(1:%i)' % ndim
                             , 'real(dp), intent(out) :: Ls(0:MOM_ES_L_END)']
                    , code = L2L_code) 

              , dict( func = 'subroutine %s_L2P' % tag
                    , decl = [ '(L, r, Phi)'
                             , 'real(dp), intent(in)  :: L(0:MOM_ES_L_END)'
                             , 'real(dp), intent(in)  :: r(1:%i)' % ndim
                             , 'real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)']
                    , code = L2P_code)

              , dict( func = 'subroutine %s_M2M_add' % tag
                    , decl = [ '(M, r, Ms)'
                             , 'real(dp), intent(in)    :: M(0:MOM_ES_M_END)'
                             , 'real(dp), intent(in)    :: r(1:%i)' % ndim
                             , 'real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)']
                    , code = M2M_code
                    , add=True)

              , dict( func = 'subroutine %s_M2L_add' % tag
                    , decl = [ '(M, r, L)'
                             , 'real(dp), intent(in)  :: M(0:MOM_ES_M_END)'
                             , 'real(dp), intent(in)  :: r(1:%i)' % ndim
                             , 'real(dp), intent(out) :: L(0:MOM_ES_L_END)']
                    , code = M2L_code
                    , add=True)

              , dict( func = 'subroutine %s_L2L_add' % tag
                    , decl = [ '(L, r, Ls)'
                             , 'real(dp), intent(in)    :: L(0:MOM_ES_L_END)'
                             , 'real(dp), intent(in)    :: r(1:%i)' % ndim
                             , 'real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)']
                    , code = L2L_code
                    , add=True) 

              , dict( func = 'subroutine %s_M2L2' % tag
                    , decl = [ '(M1, r1, L1, M2,r2,L2)'
                             , 'real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2'
                             , 'real(dp), intent(in),  dimension(1:%i)                :: r1,r2' % ndim
                             , 'real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2'
                             , 'real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M'
                             , 'real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L'
                             , 'real(dp),              dimension(1:2,1:%i)            :: r' % ndim ]
                    , code = M2L_code
                    , vecform = '1:2'
                    , preamble = [ 'call pack2(MOM_ES_M_LEN, M1,M2,M)'
                                 , 'call pack2(%i, r1,r2,r)' % ndim]
                    , epilog    = 'call unpack2(MOM_ES_L_LEN, L1,L2,L)')

              , dict( func = 'subroutine %s_L2P2' % tag
                    , decl = ['(L1,r1,Phi1, L2,r2,Phi2)'
                           , 'real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2'
                           , 'real(dp), intent(in),  dimension(1:%i)                :: r1,r2' % ndim
                           , 'real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2'
                           , 'real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L'
                           , 'real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi'
                           , 'real(dp),              dimension(1:2,1:%i)            :: r' % ndim ]
                    , code = L2P_code
                    , vecform = '1:2'
                    , preamble = [ 'call pack2(MOM_ES_L_LEN, L1,L2,L)'
                                 , 'call pack2(%i, r1,r2,r)' % ndim]
                    , epilog = 'call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)'
                    )

              , dict( func = 'subroutine %s_L2L2_add' % tag
                    , decl = [ '(L1, r1, L1s, L2, r2, L2s)'
                           , 'real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2'
                           , 'real(dp), intent(in),  dimension(1:%i)                :: r1,r2' % ndim
                           , 'real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s'
                           , 'real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls'
                           , 'real(dp),              dimension(1:2,1:%i)            :: r' % ndim ]
                    , code = L2L_code
                    , vecform='1:2'
                    , preamble = [ 'call pack2(MOM_ES_L_LEN, L1,L2,L)'
                                 , 'call pack2(%i, r1,r2,r)' % ndim]
                    , epilog = 'call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)'
                    , add=False) 
              ]

        if filename:
            print 'Writing fortran to %s.f90' % filename
            with open('%s.f90' % filename, 'wt') as fp:
                write_fortran(code, file=fp, module=mod, order=p)

            print 'Writing header to %s.h' % filename
            with open('%s.h' % filename, 'wt') as fp:
                write_header(tag, [Mt.keys(), L.keys(), L2P.keys()], file=fp, order=p)
        else:
            write_fortran(code, module=mod, order=p)
            write_header(tag, [Mt.keys(), L.keys(), L2P.keys()], order=p)

    if output == 'latex':
        lines = []

#       for n,s,eq in Mt_eq:
#           print r'\begin{dmath*}'
#           print '%s = %s' % tuple(map(sp.latex, [s, eq.subs(R,Symbol('R')).subs(rsq,Symbol('R')**2)]))
#           print r'\end{dmath*}'

#       print
#       print

#       M2M_sym = mi_symbols(M2M.keys(), 'M^s')
#       for n,s,eq in M2M_eq:
#           s = M2M_sym[n]
#           print r'\begin{dmath*}'
#           print '%s = %s' % tuple(map(sp.latex, [s, eq.subs(R,Symbol('R')).subs(rsq,Symbol('R')**2)]))
#           print r'\end{dmath*}'

#       print
#       print
        code = [
                dict( func = 'subroutine %s_P2M' % tag , code = P2M_code) 
              , dict( func = 'subroutine %s_M2M' % tag , code = M2M_code)
              , dict( func = 'subroutine %s_M2L' % tag , code = M2L_code)
              , dict( func = 'subroutine %s_L2L' % tag , code = L2L_code) 
              , dict( func = 'subroutine %s_L2P' % tag , code = L2P_code)
              ]

        write_latex(code, module=mod, order=p)


#       for n,s,eq in DelPhi_eq:
#           print r'\begin{dmath*}'
#           print r'\nabla^{%i}%s = %s' % (h, sp.latex(s), sp.latex(eq))
#           print r'\end{dmath*}'

def run_scaling():
    global SCALING
    for p in range(2,8):
        del SCALING[:]
        es     = dict(dir=dir,  tag='mom_es',     g=1/R, q=1, h=1, p=p)
        gen_expansion(es)
        for f,pre,post in SCALING:
            print 'ORDER', p, f, pre, post



def collect_constX(expr, *vars, **kwargs):
#
# This function is modified from SymPy v1.4
#
# Copyright (c) 2006-2019 SymPy Development Team
# 
# All rights reserved.
#
    """A non-greedy collection of terms with similar number coefficients in
    an Add expr. If ``vars`` is given then only those constants will be
    targeted. Although any Number can also be targeted, if this is not
    desired set ``Numbers=False`` and no Float or Rational will be collected.

    Parameters
    ==========

    expr : sympy expression
        This parameter defines the expression the expression from which
        terms with similar coefficients are to be collected. A non-Add
        expression is returned as it is.

    vars : variable length collection of Numbers, optional
        Specifies the constants to target for collection. Can be multiple in
        number.

    kwargs : ``Numbers`` is the only possible argument to pass.
        Numbers (default=True) specifies to target all instance of
        :class:`sympy.core.numbers.Number` class. If ``Numbers=False``, then
        no Float or Rational will be collected.

    Returns
    =======

    expr : Expr
        Returns an expression with similar coefficient terms collected.

    Examples
    ========

    >>> from sympy import sqrt
    >>> from sympy.abc import a, s, x, y, z
    >>> from sympy.simplify.radsimp import collect_const
    >>> collect_const(sqrt(3) + sqrt(3)*(1 + sqrt(2)))
    sqrt(3)*(sqrt(2) + 2)
    >>> collect_const(sqrt(3)*s + sqrt(7)*s + sqrt(3) + sqrt(7))
    (sqrt(3) + sqrt(7))*(s + 1)
    >>> s = sqrt(2) + 2
    >>> collect_const(sqrt(3)*s + sqrt(3) + sqrt(7)*s + sqrt(7))
    (sqrt(2) + 3)*(sqrt(3) + sqrt(7))
    >>> collect_const(sqrt(3)*s + sqrt(3) + sqrt(7)*s + sqrt(7), sqrt(3))
    sqrt(7) + sqrt(3)*(sqrt(2) + 3) + sqrt(7)*(sqrt(2) + 2)

    The collection is sign-sensitive, giving higher precedence to the
    unsigned values:

    >>> collect_const(x - y - z)
    x - (y + z)
    >>> collect_const(-y - z)
    -(y + z)
    >>> collect_const(2*x - 2*y - 2*z, 2)
    2*(x - y - z)
    >>> collect_const(2*x - 2*y - 2*z, -2)
    2*x - 2*(y + z)

    See Also
    ========

    collect, collect_sqrt, rcollect
    """

    from collections import defaultdict

    from sympy import SYMPY_DEBUG

    from sympy.core import expand_power_base, sympify, Add, S, Mul, Derivative, Pow, symbols, expand_mul
    from sympy.core.add import _unevaluated_Add
    from sympy.core.compatibility import iterable, ordered, default_sort_key
    from sympy.core.evaluate import global_evaluate
    from sympy.core.function import _mexpand
    from sympy.core.mul import _keep_coeff, _unevaluated_Mul
    from sympy.core.numbers import Rational
    from sympy.functions import exp, sqrt, log
    from sympy.polys import gcd
    from sympy.simplify.sqrtdenest import sqrtdenest

    from exprtools import Factors as FactorsX

    #return sp.collect_const(expr, *vars, **kwargs)

    if not expr.is_Add:
        return expr

    recurse = False
    Numbers = kwargs.get('Numbers', True)

    if not vars:
        recurse = True
        vars = set()
        for a in expr.args:
            for m in Mul.make_args(a):
                if m.is_number:
                    vars.add(m)
    else:
        vars = sympify(vars)
    if not Numbers:
        vars = [v for v in vars if not v.is_Number]

    vars = list(ordered(vars))
    for v in vars:
        terms = defaultdict(list)
        Fv = FactorsX(v)
        for m in Add.make_args(expr):
            f = FactorsX(m)
            q, r = f.div(Fv)
            if r.is_one:
                # only accept this as a true factor if
                # it didn't change an exponent from an Integer
                # to a non-Integer, e.g. 2/sqrt(2) -> sqrt(2)
                # -- we aren't looking for this sort of change
                fwas = f.factors.copy()
                fnow = q.factors
                if not any(k in fwas and fwas[k].is_Integer and not
                        fnow[k].is_Integer for k in fnow):
                    terms[v].append(q.as_expr())
                    continue
            terms[S.One].append(m)

        args = []
        hit = False
        uneval = False
        for k in ordered(terms):
            v = terms[k]
            if k is S.One:
                args.extend(v)
                continue

            if len(v) > 1:
                v = Add(*v)
                hit = True
                if recurse and v != expr:
                    vars.append(v)
            else:
                v = v[0]

            # be careful not to let uneval become True unless
            # it must be because it's going to be more expensive
            # to rebuild the expression as an unevaluated one
            if Numbers and k.is_Number and v.is_Add:
                args.append(_keep_coeff(k, v, sign=True))
                uneval = True
            else:
                args.append(k*v)

        if hit:
            if uneval:
                expr = _unevaluated_Add(*args)
            else:
                expr = Add(*args)
            if not expr.is_Add:
                break

    return expr


if __name__ == '__main__':

    RealSymbol = lambda x,**s: Symbol(x, real=True, finite=True, commutative=True,**s)
    RealSymbol = lambda x,**s: Symbol(x, commutative=True,**s)
    RealSymbol = lambda x,**s: Symbol(x, **s)
#RealSymbol = Symbol


    xyz = map(RealSymbol, 'xyz'[:ndim])
    R = RealSymbol('R')
    R2 = np.dot(xyz,xyz)
    rsq = Symbol('h', nonnegative=True)
    R = sp.sqrt(R2)
    W = RealSymbol('W')
    SCALING=[]
    rrXi = dict()

    if 1:
        main()
    else:

        #
        # Example configurations used in Coles & Bieri (2019)
        #

        test_symbolic_results = False
        exp_orders = [2,3,4,5,6,7,8,9,10]
        exp_orders = [2,4,6,8,9,10]

        output_dir = '-TG-NoOpt'
        Traceless, TracelessD, optimize = False, True, False
        main()
        sys.exit(1)

        output_dir = 'moments-TG-NoOpt'
        Traceless, TracelessD, optimize = False, True, False
        main()

        output_dir = 'moments-FT-NoOpt'
        Traceless, TracelessD, optimize = True, True, False
        main()

        output_dir = 'XXX'
        astro_version = True
        astro_output_dir = 'moments-AP-NoOpt'
        Traceless, TracelessD, optimize = True, True, False
        main()
        astro_version = False

        output_dir = 'moments-TG'
        Traceless, TracelessD, optimize = False, True, True
        main()

        output_dir = 'moments-FT'
        Traceless, TracelessD, optimize = True, True, True
        main()

        output_dir = 'XXX'
        astro_version = True
        astro_output_dir = 'moments-AP'
        Traceless, TracelessD, optimize = True, True, True
        main()
        astro_version = False

