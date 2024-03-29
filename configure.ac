AC_PREREQ(2.59)
AC_INIT([arpack-ng], [3.1.3], [http://forge.scilab.org/index.php/p/arpack-ng/issues/])
AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE

AC_CONFIG_MACRO_DIR([m4/])

dnl Checks for standard programs.
AC_PROG_F77

ifdef([LT_INIT], [], [
  errprint([error: you must have libtool 2.2.2 or a more recent version
])
  m4exit([1])])

LT_PREREQ([2.2.2])
LT_INIT([win32-dll])

dnl Check for BLAS libraries
sinclude(ax_blas.m4)
AX_BLAS
if test "$ax_blas_ok" = "no"; then
   AC_MSG_ERROR([Cannot find BLAS libraries])
fi

dnl Check for LAPACK libraries
sinclude(ax_lapack.m4)
AX_LAPACK
if test "$ax_lapack_ok" = "no"; then
   AC_MSG_ERROR([Cannot find LAPACK libraries])
fi

dnl See if compiling parpack
AC_MSG_CHECKING([for MPI mode])
AC_ARG_ENABLE(mpi,
	      AC_HELP_STRING([--enable-mpi],
			     [build parallel version of arpack with MPI]),
	      [enable_mpi=$enableval],
	      [enable_mpi=no])
if test x"$enable_mpi" != x"no"; then
  AC_LANG_PUSH([Fortran 77])
  AX_MPI([], AC_MSG_ERROR([could not compile a MPI test program]))
  AC_LANG_POP([Fortran 77])
fi

AM_CONDITIONAL(MPI, test x"$enable_mpi" = x"yes")


#	LAPACK/Makefile

AC_CONFIG_FILES([
	arpack.pc
	Makefile
	SRC/Makefile
	UTIL/Makefile
	TESTS/Makefile
	PARPACK/Makefile
	PARPACK/SRC/Makefile
	PARPACK/SRC/MPI/Makefile
	PARPACK/UTIL/Makefile
	PARPACK/UTIL/MPI/Makefile
	PARPACK/UTIL/BLACS/Makefile
    PARPACK/EXAMPLES/MPI/Makefile
    PARPACK/EXAMPLES/BLACS/Makefile
    PARPACK/SRC/BLACS/Makefile

    ])
AC_OUTPUT
