/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define CSLIBDOCSTRING
"CSLib module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_cslib.html"
%enddef
%module (package="OCC.Core", docstring=CSLIBDOCSTRING) CSLib


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<CSLib_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<math_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColgp.i
%import gp.i
%import math.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum CSLib_DerivativeStatus {
	CSLib_Done = 0,
	CSLib_D1uIsNull = 1,
	CSLib_D1vIsNull = 2,
	CSLib_D1IsNull = 3,
	CSLib_D1uD1vRatioIsNull = 4,
	CSLib_D1vD1uRatioIsNull = 5,
	CSLib_D1uIsParallelD1v = 6,
};

enum CSLib_NormalStatus {
	CSLib_Singular = 0,
	CSLib_Defined = 1,
	CSLib_InfinityOfSolutions = 2,
	CSLib_D1NuIsNull = 3,
	CSLib_D1NvIsNull = 4,
	CSLib_D1NIsNull = 5,
	CSLib_D1NuNvRatioIsNull = 6,
	CSLib_D1NvNuRatioIsNull = 7,
	CSLib_D1NuIsParallelD1Nv = 8,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class CSLib_DerivativeStatus(IntEnum):
	CSLib_Done = 0
	CSLib_D1uIsNull = 1
	CSLib_D1vIsNull = 2
	CSLib_D1IsNull = 3
	CSLib_D1uD1vRatioIsNull = 4
	CSLib_D1vD1uRatioIsNull = 5
	CSLib_D1uIsParallelD1v = 6
CSLib_Done = CSLib_DerivativeStatus.CSLib_Done
CSLib_D1uIsNull = CSLib_DerivativeStatus.CSLib_D1uIsNull
CSLib_D1vIsNull = CSLib_DerivativeStatus.CSLib_D1vIsNull
CSLib_D1IsNull = CSLib_DerivativeStatus.CSLib_D1IsNull
CSLib_D1uD1vRatioIsNull = CSLib_DerivativeStatus.CSLib_D1uD1vRatioIsNull
CSLib_D1vD1uRatioIsNull = CSLib_DerivativeStatus.CSLib_D1vD1uRatioIsNull
CSLib_D1uIsParallelD1v = CSLib_DerivativeStatus.CSLib_D1uIsParallelD1v

class CSLib_NormalStatus(IntEnum):
	CSLib_Singular = 0
	CSLib_Defined = 1
	CSLib_InfinityOfSolutions = 2
	CSLib_D1NuIsNull = 3
	CSLib_D1NvIsNull = 4
	CSLib_D1NIsNull = 5
	CSLib_D1NuNvRatioIsNull = 6
	CSLib_D1NvNuRatioIsNull = 7
	CSLib_D1NuIsParallelD1Nv = 8
CSLib_Singular = CSLib_NormalStatus.CSLib_Singular
CSLib_Defined = CSLib_NormalStatus.CSLib_Defined
CSLib_InfinityOfSolutions = CSLib_NormalStatus.CSLib_InfinityOfSolutions
CSLib_D1NuIsNull = CSLib_NormalStatus.CSLib_D1NuIsNull
CSLib_D1NvIsNull = CSLib_NormalStatus.CSLib_D1NvIsNull
CSLib_D1NIsNull = CSLib_NormalStatus.CSLib_D1NIsNull
CSLib_D1NuNvRatioIsNull = CSLib_NormalStatus.CSLib_D1NuNvRatioIsNull
CSLib_D1NvNuRatioIsNull = CSLib_NormalStatus.CSLib_D1NvNuRatioIsNull
CSLib_D1NuIsParallelD1Nv = CSLib_NormalStatus.CSLib_D1NuIsParallelD1Nv
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class CSLib *
**************/
%rename(cslib) CSLib;
class CSLib {
	public:
		/****** CSLib::DNNUV ******/
		/****** md5 signature: f674d5bb3da7d5c8ec8964019c53fd6f ******/
		%feature("compactdefaultargs") DNNUV;
		%feature("autodoc", "
Parameters
----------
Nu: int
Nv: int
DerSurf: TColgp_Array2OfVec

Return
-------
gp_Vec

Description
-----------
-- computes the derivative of order nu in the -- direction u and nv in the direction v of the not -- normalized normal vector at the point p(u,v) the array dersurf contain the derivative (i,j) of the surface for i=0,nu+1 ; j=0,nv+1.
") DNNUV;
		static gp_Vec DNNUV(const Standard_Integer Nu, const Standard_Integer Nv, const TColgp_Array2OfVec & DerSurf);

		/****** CSLib::DNNUV ******/
		/****** md5 signature: b9480cb99392e18e493b1734f5a8bb7a ******/
		%feature("compactdefaultargs") DNNUV;
		%feature("autodoc", "
Parameters
----------
Nu: int
Nv: int
DerSurf1: TColgp_Array2OfVec
DerSurf2: TColgp_Array2OfVec

Return
-------
gp_Vec

Description
-----------
Computes the derivatives of order nu in the direction nu and nv in the direction nv of the not normalized vector n(u,v) = ds1/du * ds2/dv (cases where we use an osculating surface) dersurf1 are the derivatives of s1.
") DNNUV;
		static gp_Vec DNNUV(const Standard_Integer Nu, const Standard_Integer Nv, const TColgp_Array2OfVec & DerSurf1, const TColgp_Array2OfVec & DerSurf2);

		/****** CSLib::DNNormal ******/
		/****** md5 signature: 69065aef058eb5e08acc436add152f29 ******/
		%feature("compactdefaultargs") DNNormal;
		%feature("autodoc", "
Parameters
----------
Nu: int
Nv: int
DerNUV: TColgp_Array2OfVec
Iduref: int (optional, default to 0)
Idvref: int (optional, default to 0)

Return
-------
gp_Vec

Description
-----------
-- computes the derivative of order nu in the -- direction u and nv in the direction v of the normalized normal vector at the point p(u,v) array dernuv contain the derivative (i+iduref,j+idvref) of d1u ^ d1v for i=0,nu ; j=0,nv iduref and idvref correspond to a derivative of d1u ^ d1v which can be used to compute the normalized normal vector. in the regular cases , iduref=idvref=0.
") DNNormal;
		static gp_Vec DNNormal(const Standard_Integer Nu, const Standard_Integer Nv, const TColgp_Array2OfVec & DerNUV, const Standard_Integer Iduref = 0, const Standard_Integer Idvref = 0);

		/****** CSLib::Normal ******/
		/****** md5 signature: 981b761b520114039d71ca5786f4799c ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
D1U: gp_Vec
D1V: gp_Vec
SinTol: float
Normal: gp_Dir

Return
-------
theStatus: CSLib_DerivativeStatus

Description
-----------
The following functions computes the normal to a surface inherits functionwithderivative from math //! computes the normal direction of a surface as the cross product between d1u and d1v. if d1u has null length or d1v has null length or d1u and d1v are parallel the normal is undefined. to check that d1u and d1v are colinear the sinus of the angle between d1u and d1v is computed and compared with sintol. the normal is computed if thestatus == done else the thestatus gives the reason why the computation has failed.
") Normal;
		static void Normal(const gp_Vec & D1U, const gp_Vec & D1V, const Standard_Real SinTol, CSLib_DerivativeStatus &OutValue, gp_Dir & Normal);

		/****** CSLib::Normal ******/
		/****** md5 signature: c6f714a72df04467bcde57a861427ba8 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
SinTol: float
Normal: gp_Dir

Return
-------
Done: bool
theStatus: CSLib_NormalStatus

Description
-----------
If there is a singularity on the surface the previous method cannot compute the local normal. this method computes an approached normal direction of a surface. it does a limited development and needs the second derivatives on the surface as input data. it computes the normal as follow: n(u, v) = d1u ^ d1v n(u0+du,v0+dv) = n0 + dn/du(u0,v0) * du + dn/dv(u0,v0) * dv + eps with eps->0 so we can have the equivalence n ~ dn/du + dn/dv. dnu = ||dn/du|| and dnv = ||dn/dv|| //! . if dnu isnull (dnu <= resolution from gp) the answer done = true the normal direction is given by dn/dv . if dnv isnull (dnv <= resolution from gp) the answer done = true the normal direction is given by dn/du . if the two directions dn/du and dn/dv are parallel done = true the normal direction is given either by dn/du or dn/dv. to check that the two directions are colinear the sinus of the angle between these directions is computed and compared with sintol. . if dnu/dnv or dnv/dnu is lower or equal than real epsilon done = false, the normal is undefined . if dnu isnull and dnv is null done = false, there is an indetermination and we should do a limited development at order 2 (it means that we cannot omit eps). . if dnu is not null and dnv is not null done = false, there are an infinity of normals at the considered point on the surface.
") Normal;
		static void Normal(const gp_Vec & D1U, const gp_Vec & D1V, const gp_Vec & D2U, const gp_Vec & D2V, const gp_Vec & D2UV, const Standard_Real SinTol, Standard_Boolean &OutValue, CSLib_NormalStatus &OutValue, gp_Dir & Normal);

		/****** CSLib::Normal ******/
		/****** md5 signature: c279b71fb514c274c1c831d9fc8fe04b ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
D1U: gp_Vec
D1V: gp_Vec
MagTol: float
Normal: gp_Dir

Return
-------
theStatus: CSLib_NormalStatus

Description
-----------
Computes the normal direction of a surface as the cross product between d1u and d1v.
") Normal;
		static void Normal(const gp_Vec & D1U, const gp_Vec & D1V, const Standard_Real MagTol, CSLib_NormalStatus &OutValue, gp_Dir & Normal);

		/****** CSLib::Normal ******/
		/****** md5 signature: 88a6c5086247b570883b6e6a97c94c26 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
MaxOrder: int
DerNUV: TColgp_Array2OfVec
MagTol: float
U: float
V: float
Umin: float
Umax: float
Vmin: float
Vmax: float
Normal: gp_Dir

Return
-------
theStatus: CSLib_NormalStatus
OrderU: int
OrderV: int

Description
-----------
Find the first order k0 of deriviative of nuv where: foreach order < k0 all the derivatives of nuv are null all the derivatives of nuv corresponding to the order k0 are collinear and have the same sens. in this case, normal at u,v is unique.
") Normal;
		static void Normal(const Standard_Integer MaxOrder, const TColgp_Array2OfVec & DerNUV, const Standard_Real MagTol, const Standard_Real U, const Standard_Real V, const Standard_Real Umin, const Standard_Real Umax, const Standard_Real Vmin, const Standard_Real Vmax, CSLib_NormalStatus &OutValue, gp_Dir & Normal, Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend CSLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class CSLib_Class2d *
**********************/
class CSLib_Class2d {
	public:
		/****** CSLib_Class2d::CSLib_Class2d ******/
		/****** md5 signature: 58ef837df944717c9a99b4d352cbc9e8 ******/
		%feature("compactdefaultargs") CSLib_Class2d;
		%feature("autodoc", "
Parameters
----------
thePnts2d: TColgp_Array1OfPnt2d
theTolU: float
theTolV: float
theUMin: float
theVMin: float
theUMax: float
theVMax: float

Return
-------
None

Description
-----------
Constructs the 2d-polygon. thepnts2d is the set of the vertices (closed polygon will always be created inside of this constructor; consequently, there is no point in repeating first and last point in thepnts2d). thetolu and thetolv are tolerances. theumin, thevmin, theumax, thevmax are uv-bounds of the polygon.
") CSLib_Class2d;
		 CSLib_Class2d(const TColgp_Array1OfPnt2d & thePnts2d, const Standard_Real theTolU, const Standard_Real theTolV, const Standard_Real theUMin, const Standard_Real theVMin, const Standard_Real theUMax, const Standard_Real theVMax);

		/****** CSLib_Class2d::CSLib_Class2d ******/
		/****** md5 signature: 5f71d219685ae532f521ddc75d2d90b2 ******/
		%feature("compactdefaultargs") CSLib_Class2d;
		%feature("autodoc", "
Parameters
----------
thePnts2d: TColgp_SequenceOfPnt2d
theTolU: float
theTolV: float
theUMin: float
theVMin: float
theUMax: float
theVMax: float

Return
-------
None

Description
-----------
Constructs the 2d-polygon. thepnts2d is the set of the vertices (closed polygon will always be created inside of this constructor; consequently, there is no point in repeating first and last point in thepnts2d). thetolu and thetolv are tolerances. theumin, thevmin, theumax, thevmax are uv-bounds of the polygon.
") CSLib_Class2d;
		 CSLib_Class2d(const TColgp_SequenceOfPnt2d & thePnts2d, const Standard_Real theTolU, const Standard_Real theTolV, const Standard_Real theUMin, const Standard_Real theVMin, const Standard_Real theUMax, const Standard_Real theVMax);

		/****** CSLib_Class2d::InternalSiDans ******/
		/****** md5 signature: 6857130ec6a90b704692bb0184af3b71 ******/
		%feature("compactdefaultargs") InternalSiDans;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
int

Description
-----------
No available documentation.
") InternalSiDans;
		Standard_Integer InternalSiDans(const Standard_Real X, const Standard_Real Y);

		/****** CSLib_Class2d::InternalSiDansOuOn ******/
		/****** md5 signature: f60153c16f80cdf69aaea130d49abd02 ******/
		%feature("compactdefaultargs") InternalSiDansOuOn;
		%feature("autodoc", "
Parameters
----------
X: float
Y: float

Return
-------
int

Description
-----------
No available documentation.
") InternalSiDansOuOn;
		Standard_Integer InternalSiDansOuOn(const Standard_Real X, const Standard_Real Y);

		/****** CSLib_Class2d::SiDans ******/
		/****** md5 signature: 9b220e8bf6a2497107b0da19cdf5412c ******/
		%feature("compactdefaultargs") SiDans;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
int

Description
-----------
No available documentation.
") SiDans;
		Standard_Integer SiDans(const gp_Pnt2d & P);

		/****** CSLib_Class2d::SiDans_OnMode ******/
		/****** md5 signature: e555cb83d2160f5058edabf2250efcbf ******/
		%feature("compactdefaultargs") SiDans_OnMode;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Tol: float

Return
-------
int

Description
-----------
No available documentation.
") SiDans_OnMode;
		Standard_Integer SiDans_OnMode(const gp_Pnt2d & P, const Standard_Real Tol);

};


%extend CSLib_Class2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class CSLib_NormalPolyDef *
****************************/
class CSLib_NormalPolyDef : public math_FunctionWithDerivative {
	public:
		/****** CSLib_NormalPolyDef::CSLib_NormalPolyDef ******/
		/****** md5 signature: 7c0615f71d5d9d2b2644fff475bf64ce ******/
		%feature("compactdefaultargs") CSLib_NormalPolyDef;
		%feature("autodoc", "
Parameters
----------
k0: int
li: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") CSLib_NormalPolyDef;
		 CSLib_NormalPolyDef(const Standard_Integer k0, const TColStd_Array1OfReal & li);

		/****** CSLib_NormalPolyDef::Derivative ******/
		/****** md5 signature: 95e91729f1fb548d9a62f690b302c323 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
Computes the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****** CSLib_NormalPolyDef::Value ******/
		/****** md5 signature: 860bcc3da162e9f9f232f07518550196 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
Computes the value <f>of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****** CSLib_NormalPolyDef::Values ******/
		/****** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
Computes the value <f> and the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend CSLib_NormalPolyDef {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def cslib_DNNUV(*args):
	return cslib.DNNUV(*args)

@deprecated
def cslib_DNNUV(*args):
	return cslib.DNNUV(*args)

@deprecated
def cslib_DNNormal(*args):
	return cslib.DNNormal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

@deprecated
def cslib_Normal(*args):
	return cslib.Normal(*args)

}
