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
%define GPDOCSTRING
"gp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_gp.html"
%enddef
%module (package="OCC.Core", docstring=GPDOCSTRING) gp


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
#include<gp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum gp_EulerSequence {
	gp_EulerAngles = 0,
	gp_YawPitchRoll = 1,
	gp_Extrinsic_XYZ = 2,
	gp_Extrinsic_XZY = 3,
	gp_Extrinsic_YZX = 4,
	gp_Extrinsic_YXZ = 5,
	gp_Extrinsic_ZXY = 6,
	gp_Extrinsic_ZYX = 7,
	gp_Intrinsic_XYZ = 8,
	gp_Intrinsic_XZY = 9,
	gp_Intrinsic_YZX = 10,
	gp_Intrinsic_YXZ = 11,
	gp_Intrinsic_ZXY = 12,
	gp_Intrinsic_ZYX = 13,
	gp_Extrinsic_XYX = 14,
	gp_Extrinsic_XZX = 15,
	gp_Extrinsic_YZY = 16,
	gp_Extrinsic_YXY = 17,
	gp_Extrinsic_ZYZ = 18,
	gp_Extrinsic_ZXZ = 19,
	gp_Intrinsic_XYX = 20,
	gp_Intrinsic_XZX = 21,
	gp_Intrinsic_YZY = 22,
	gp_Intrinsic_YXY = 23,
	gp_Intrinsic_ZXZ = 24,
	gp_Intrinsic_ZYZ = 25,
};

enum gp_TrsfForm {
	gp_Identity = 0,
	gp_Rotation = 1,
	gp_Translation = 2,
	gp_PntMirror = 3,
	gp_Ax1Mirror = 4,
	gp_Ax2Mirror = 5,
	gp_Scale = 6,
	gp_CompoundTrsf = 7,
	gp_Other = 8,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class gp_EulerSequence(IntEnum):
	gp_EulerAngles = 0
	gp_YawPitchRoll = 1
	gp_Extrinsic_XYZ = 2
	gp_Extrinsic_XZY = 3
	gp_Extrinsic_YZX = 4
	gp_Extrinsic_YXZ = 5
	gp_Extrinsic_ZXY = 6
	gp_Extrinsic_ZYX = 7
	gp_Intrinsic_XYZ = 8
	gp_Intrinsic_XZY = 9
	gp_Intrinsic_YZX = 10
	gp_Intrinsic_YXZ = 11
	gp_Intrinsic_ZXY = 12
	gp_Intrinsic_ZYX = 13
	gp_Extrinsic_XYX = 14
	gp_Extrinsic_XZX = 15
	gp_Extrinsic_YZY = 16
	gp_Extrinsic_YXY = 17
	gp_Extrinsic_ZYZ = 18
	gp_Extrinsic_ZXZ = 19
	gp_Intrinsic_XYX = 20
	gp_Intrinsic_XZX = 21
	gp_Intrinsic_YZY = 22
	gp_Intrinsic_YXY = 23
	gp_Intrinsic_ZXZ = 24
	gp_Intrinsic_ZYZ = 25
gp_EulerAngles = gp_EulerSequence.gp_EulerAngles
gp_YawPitchRoll = gp_EulerSequence.gp_YawPitchRoll
gp_Extrinsic_XYZ = gp_EulerSequence.gp_Extrinsic_XYZ
gp_Extrinsic_XZY = gp_EulerSequence.gp_Extrinsic_XZY
gp_Extrinsic_YZX = gp_EulerSequence.gp_Extrinsic_YZX
gp_Extrinsic_YXZ = gp_EulerSequence.gp_Extrinsic_YXZ
gp_Extrinsic_ZXY = gp_EulerSequence.gp_Extrinsic_ZXY
gp_Extrinsic_ZYX = gp_EulerSequence.gp_Extrinsic_ZYX
gp_Intrinsic_XYZ = gp_EulerSequence.gp_Intrinsic_XYZ
gp_Intrinsic_XZY = gp_EulerSequence.gp_Intrinsic_XZY
gp_Intrinsic_YZX = gp_EulerSequence.gp_Intrinsic_YZX
gp_Intrinsic_YXZ = gp_EulerSequence.gp_Intrinsic_YXZ
gp_Intrinsic_ZXY = gp_EulerSequence.gp_Intrinsic_ZXY
gp_Intrinsic_ZYX = gp_EulerSequence.gp_Intrinsic_ZYX
gp_Extrinsic_XYX = gp_EulerSequence.gp_Extrinsic_XYX
gp_Extrinsic_XZX = gp_EulerSequence.gp_Extrinsic_XZX
gp_Extrinsic_YZY = gp_EulerSequence.gp_Extrinsic_YZY
gp_Extrinsic_YXY = gp_EulerSequence.gp_Extrinsic_YXY
gp_Extrinsic_ZYZ = gp_EulerSequence.gp_Extrinsic_ZYZ
gp_Extrinsic_ZXZ = gp_EulerSequence.gp_Extrinsic_ZXZ
gp_Intrinsic_XYX = gp_EulerSequence.gp_Intrinsic_XYX
gp_Intrinsic_XZX = gp_EulerSequence.gp_Intrinsic_XZX
gp_Intrinsic_YZY = gp_EulerSequence.gp_Intrinsic_YZY
gp_Intrinsic_YXY = gp_EulerSequence.gp_Intrinsic_YXY
gp_Intrinsic_ZXZ = gp_EulerSequence.gp_Intrinsic_ZXZ
gp_Intrinsic_ZYZ = gp_EulerSequence.gp_Intrinsic_ZYZ

class gp_TrsfForm(IntEnum):
	gp_Identity = 0
	gp_Rotation = 1
	gp_Translation = 2
	gp_PntMirror = 3
	gp_Ax1Mirror = 4
	gp_Ax2Mirror = 5
	gp_Scale = 6
	gp_CompoundTrsf = 7
	gp_Other = 8
gp_Identity = gp_TrsfForm.gp_Identity
gp_Rotation = gp_TrsfForm.gp_Rotation
gp_Translation = gp_TrsfForm.gp_Translation
gp_PntMirror = gp_TrsfForm.gp_PntMirror
gp_Ax1Mirror = gp_TrsfForm.gp_Ax1Mirror
gp_Ax2Mirror = gp_TrsfForm.gp_Ax2Mirror
gp_Scale = gp_TrsfForm.gp_Scale
gp_CompoundTrsf = gp_TrsfForm.gp_CompoundTrsf
gp_Other = gp_TrsfForm.gp_Other
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(gp_Vec2f) NCollection_Vec2<Standard_ShortReal>;
%template(gp_Vec3f) NCollection_Vec3<Standard_ShortReal>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Vec2<Standard_ShortReal> gp_Vec2f;
typedef NCollection_Vec3<Standard_ShortReal> gp_Vec3f;
/* end typedefs declaration */

/**********************************
* class NCollection_Lerp<gp_Trsf> *
**********************************/
/*************************
* class equal_to<gp_Pnt> *
*************************/
/***********
* class gp *
***********/
%rename(gp) gp;
class gp {
	public:
		/****************** DX ******************/
		/**** md5 signature: 816685723183e6c0cd67bb85bd668cc0 ****/
		%feature("compactdefaultargs") DX;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns a unit vector with the combination (1,0,0).
") DX;
		static const gp_Dir DX();

		/****************** DX2d ******************/
		/**** md5 signature: 42a3e9a52aac0ab4f9f555873b03761d ****/
		%feature("compactdefaultargs") DX2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns a unit vector with the combinations (1,0).
") DX2d;
		static const gp_Dir2d DX2d();

		/****************** DY ******************/
		/**** md5 signature: 22c21f56763a0f94eac7a7ebba8e4912 ****/
		%feature("compactdefaultargs") DY;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns a unit vector with the combination (0,1,0).
") DY;
		static const gp_Dir DY();

		/****************** DY2d ******************/
		/**** md5 signature: 3b72c33d1d485657a3c41af2deac8e0b ****/
		%feature("compactdefaultargs") DY2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns a unit vector with the combinations (0,1).
") DY2d;
		static const gp_Dir2d DY2d();

		/****************** DZ ******************/
		/**** md5 signature: 524e2b6091c04479b30410a9eefaf13f ****/
		%feature("compactdefaultargs") DZ;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns a unit vector with the combination (0,0,1).
") DZ;
		static const gp_Dir DZ();

		/****************** OX ******************/
		/**** md5 signature: ef7894b9a0f57ea10751b5048e97a6b3 ****/
		%feature("compactdefaultargs") OX;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Identifies an axis where its origin is origin and its unit vector coordinates x = 1.0, y = z = 0.0.
") OX;
		static const gp_Ax1 OX();

		/****************** OX2d ******************/
		/**** md5 signature: 5557f5dffab0aa4f79204d2338d67b69 ****/
		%feature("compactdefaultargs") OX2d;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Identifies an axis where its origin is origin2d and its unit vector coordinates are: x = 1.0, y = 0.0.
") OX2d;
		static const gp_Ax2d OX2d();

		/****************** OY ******************/
		/**** md5 signature: e2227425c69bb05cd1623833078271d6 ****/
		%feature("compactdefaultargs") OY;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Identifies an axis where its origin is origin and its unit vector coordinates y = 1.0, x = z = 0.0.
") OY;
		static const gp_Ax1 OY();

		/****************** OY2d ******************/
		/**** md5 signature: f3223bd20bed7ec52129dc95cfe8db96 ****/
		%feature("compactdefaultargs") OY2d;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Identifies an axis where its origin is origin2d and its unit vector coordinates are y = 1.0, x = 0.0.
") OY2d;
		static const gp_Ax2d OY2d();

		/****************** OZ ******************/
		/**** md5 signature: c7060ea54c741b99561fce09b24fb584 ****/
		%feature("compactdefaultargs") OZ;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Identifies an axis where its origin is origin and its unit vector coordinates z = 1.0, y = x = 0.0.
") OZ;
		static const gp_Ax1 OZ();

		/****************** Origin ******************/
		/**** md5 signature: 613c484437712b0cad85038f630d1f47 ****/
		%feature("compactdefaultargs") Origin;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Identifies a cartesian point with coordinates x = y = z = 0.0.0.
") Origin;
		static const gp_Pnt Origin();

		/****************** Origin2d ******************/
		/**** md5 signature: 228cd463a58b7060457252e7c48a318d ****/
		%feature("compactdefaultargs") Origin2d;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Identifies a cartesian point with coordinates x = y = 0.0.
") Origin2d;
		static const gp_Pnt2d Origin2d();

		/****************** Resolution ******************/
		/**** md5 signature: 5173125f4bd2f5a0de03384322439ba5 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Return
-------
float

Description
-----------
Method of package gp //! in geometric computations, defines the tolerance criterion used to determine when two numbers can be considered equal. many class functions use this tolerance criterion, for example, to avoid division by zero in geometric computations. in the documentation, tolerance criterion is always referred to as gp::resolution().
") Resolution;
		static Standard_Real Resolution();

		/****************** XOY ******************/
		/**** md5 signature: 67760ba4d90b4d7fc19b9128ace5377a ****/
		%feature("compactdefaultargs") XOY;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates z = 1.0, x = y =0.0 and x direction coordinates x = 1.0, y = z = 0.0.
") XOY;
		static const gp_Ax2 XOY();

		/****************** YOZ ******************/
		/**** md5 signature: 171fcfda4bc6222118cb9b0c6d12c0bb ****/
		%feature("compactdefaultargs") YOZ;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates x = 1.0, z = y =0.0 and x direction coordinates y = 1.0, x = z = 0.0 in 2d space.
") YOZ;
		static const gp_Ax2 YOZ();

		/****************** ZOX ******************/
		/**** md5 signature: 0b3979b5fd5cfa33de1f0766fae7209c ****/
		%feature("compactdefaultargs") ZOX;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Identifies a coordinate system where its origin is origin, and its 'main direction' and 'x direction' coordinates y = 1.0, x = z =0.0 and x direction coordinates z = 1.0, x = y = 0.0.
") ZOX;
		static const gp_Ax2 ZOX();

};


%extend gp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax1 *
***************/
class gp_Ax1 {
	public:
		/****************** gp_Ax1 ******************/
		/**** md5 signature: dc734c45fe2453f5dcc6d4e8bbfa5752 ****/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an axis object representing z axis of the reference coordinate system.
") gp_Ax1;
		 gp_Ax1();

		/****************** gp_Ax1 ******************/
		/**** md5 signature: 39eebc94aa4423fae1dba0b302d9c6b2 ****/
		%feature("compactdefaultargs") gp_Ax1;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
P is the location point and v is the direction of <self>.
") gp_Ax1;
		 gp_Ax1(const gp_Pnt & theP, const gp_Dir & theV);

		/****************** Angle ******************/
		/**** md5 signature: cd40d9489bc7632e70fcaa5988645693 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1

Return
-------
float

Description
-----------
Computes the angular value, in radians, between this.direction() and theother.direction(). returns the angle between 0 and 2*pi radians.
") Angle;
		Standard_Real Angle(const gp_Ax1 & theOther);

		/****************** Direction ******************/
		/**** md5 signature: fe17f01a1a479d7628e85d427dbda641 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the direction of <self>.
") Direction;
		const gp_Dir Direction();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****************** IsCoaxial ******************/
		/**** md5 signature: 5a0f3aebace8af9610e7543d64eaa8a4 ****/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "
Parameters
----------
Other: gp_Ax1
AngularTolerance: float
LinearTolerance: float

Return
-------
bool

Description
-----------
Returns true if: . the angle between <self> and <other> is lower or equal to <angulartolerance> and . the distance between <self>.location() and <other> is lower or equal to <lineartolerance> and . the distance between <other>.location() and <self> is lower or equal to lineartolerance.
") IsCoaxial;
		Standard_Boolean IsCoaxial(const gp_Ax1 & Other, const Standard_Real AngularTolerance, const Standard_Real LinearTolerance);

		/****************** IsNormal ******************/
		/**** md5 signature: d55dc98362d7e4c9c352d34da98fab0c ****/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the direction of this and another axis are normal to each other. that is, if the angle between the two axes is equal to pi/2. note: the tolerance criterion is given by theangulartolerance.
") IsNormal;
		Standard_Boolean IsNormal(const gp_Ax1 & theOther, const Standard_Real theAngularTolerance);

		/****************** IsOpposite ******************/
		/**** md5 signature: 1bfe557536864c5597704eaf4aa3685b ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the direction of this and another axis are parallel with opposite orientation. that is, if the angle between the two axes is equal to pi. note: the tolerance criterion is given by theangulartolerance.
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Ax1 & theOther, const Standard_Real theAngularTolerance);

		/****************** IsParallel ******************/
		/**** md5 signature: 948158b876e4e87cff819f07706f7409 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax1
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the direction of this and another axis are parallel with same orientation or opposite orientation. that is, if the angle between the two axes is equal to 0 or pi. note: the tolerance criterion is given by theangulartolerance.
") IsParallel;
		Standard_Boolean IsParallel(const gp_Ax1 & theOther, const Standard_Real theAngularTolerance);

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point of <self>.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry and assigns the result to this axis.
") Mirror;
		void Mirror(const gp_Pnt & P);

		/****************** Mirror ******************/
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and assigns the result to this axis.
") Mirror;
		void Mirror(const gp_Ax1 & A1);

		/****************** Mirror ******************/
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
None

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to a plane. the axis placement <a2> locates the plane of the symmetry: (location, xdirection, ydirection) and assigns the result to this axis.
") Mirror;
		void Mirror(const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		/**** md5 signature: 08e715ccb378378a36498623a8bab732 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
gp_Ax1

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry and creates a new axis.
") Mirrored;
		gp_Ax1 Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		/**** md5 signature: 52da30597ff096d51b4173b021c3f9db ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
gp_Ax1

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry and creates a new axis.
") Mirrored;
		gp_Ax1 Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		/**** md5 signature: 2ecbe9f40d159da557ee86baef897f7d ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
gp_Ax1

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to a plane. the axis placement <a2> locates the plane of the symmetry: (location, xdirection, ydirection) and creates a new axis.
") Mirrored;
		gp_Ax1 Mirrored(const gp_Ax2 & A2);

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the unit vector of this axis and assigns the result to this axis.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 73e509cfdf72e111d2c0b2298b6c43d8 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Reverses the unit vector of this axis and creates a new one.
") Reversed;
		gp_Ax1 Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 4dd20960b9a6c320c95df152d2624133 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAngRad: float

Return
-------
None

Description
-----------
Rotates this axis at an angle theangrad (in radians) about the axis thea1 and assigns the result to this axis.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAngRad);

		/****************** Rotated ******************/
		/**** md5 signature: 140d5fe5aeaaa802ce89b0d95f8b23a0 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAngRad: float

Return
-------
gp_Ax1

Description
-----------
Rotates this axis at an angle theangrad (in radians) about the axis thea1 and creates a new one.
") Rotated;
		gp_Ax1 Rotated(const gp_Ax1 & theA1, const Standard_Real theAngRad);

		/****************** Scale ******************/
		/**** md5 signature: 2e3ad744b562b37602bc0d7050246d12 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
Applies a scaling transformation to this axis with: - scale factor thes, and - center thep and assigns the result to this axis.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: a4890b5e94e1b2507a9a015c3ffc82b8 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Ax1

Description
-----------
Applies a scaling transformation to this axis with: - scale factor thes, and - center thep and creates a new axis.
") Scaled;
		gp_Ax1 Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetDirection ******************/
		/**** md5 signature: 7bb25675dd4f12080d7759ff4dd0acc2 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Assigns v as the 'direction' of this axis.
") SetDirection;
		void SetDirection(const gp_Dir & theV);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Assigns p as the origin of this axis.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** Transform ******************/
		/**** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Applies the transformation thet to this axis and assigns the result to this axis.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 29ec1caee1c355de6e8ede6088d85cc5 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Ax1

Description
-----------
Applies the transformation thet to this axis and creates a new one. //! translates an axis plaxement in the direction of the vector <v>. the magnitude of the translation is the vector's magnitude.
") Transformed;
		gp_Ax1 Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Translates this axis by the vector thev, and assigns the result to this axis.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Translates this axis by: the vector (thep1, thep2) defined from point thep1 to point thep2. and assigns the result to this axis.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: c30ab621ad86406b54d890e35f656174 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Ax1

Description
-----------
Translates this axis by the vector thev, and creates a new one.
") Translated;
		gp_Ax1 Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: ec9902234aa7cbafd767b527aec418ed ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Ax1

Description
-----------
Translates this axis by: the vector (thep1, thep2) defined from point thep1 to point thep2. and creates a new one.
") Translated;
		gp_Ax1 Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

};



%extend gp_Ax1 {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax1 {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax1()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax1')
    }
};
%extend gp_Ax1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax2 *
***************/
class gp_Ax2 {
	public:
		/****************** gp_Ax2 ******************/
		/**** md5 signature: 3c7a2d75567725d80dd696424135bbde ****/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object corresponding to the reference coordinate system (oxyz).
") gp_Ax2;
		 gp_Ax2();

		/****************** gp_Ax2 ******************/
		/**** md5 signature: 4186a3383cec63c1de7a886d351d34ba ****/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
N: gp_Dir
Vx: gp_Dir

Return
-------
None

Description
-----------
Creates an axis placement with an origin p such that: - n is the direction, and - the 'x direction' is normal to n, in the plane defined by the vectors (n, vx): 'x direction' = (n ^ vx) ^ n, exception: raises constructionerror if n and vx are parallel (same or opposite orientation).
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & P, const gp_Dir & N, const gp_Dir & Vx);

		/****************** gp_Ax2 ******************/
		/**** md5 signature: 521894c3551259b470c23a56b917c3bc ****/
		%feature("compactdefaultargs") gp_Ax2;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V: gp_Dir

Return
-------
None

Description
-----------
Creates - a coordinate system with an origin p, where v gives the 'main direction' (here, 'x direction' and 'y direction' are defined automatically).
") gp_Ax2;
		 gp_Ax2(const gp_Pnt & P, const gp_Dir & V);

		/****************** Angle ******************/
		/**** md5 signature: a686fa9cba270924f166b8c1e6ed89d1 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2

Return
-------
float

Description
-----------
Computes the angular value, in radians, between the main direction of <self> and the main direction of <theother>. returns the angle between 0 and pi in radians.
") Angle;
		Standard_Real Angle(const gp_Ax2 & theOther);

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of <self>. it is the 'location' point and the main 'direction'.
") Axis;
		const gp_Ax1 Axis();

		/****************** Direction ******************/
		/**** md5 signature: fe17f01a1a479d7628e85d427dbda641 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the main direction of <self>.
") Direction;
		const gp_Dir Direction();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****************** IsCoplanar ******************/
		/**** md5 signature: b5afd6b5d22740e47c1cc2021bf5f05f ****/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
Other: gp_Ax2
LinearTolerance: float
AngularTolerance: float

Return
-------
bool

Description
-----------
No available documentation.
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax2 & Other, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** IsCoplanar ******************/
		/**** md5 signature: 9d017c24775b2c198dc6fae3ec6ac7e2 ****/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1
LinearTolerance: float
AngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if . the distance between <self> and the 'location' point of a1 is lower of equal to lineartolerance and . the main direction of <self> and the direction of a1 are normal. note: the tolerance criterion for angular equality is given by angulartolerance.
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax1 & A1, const Standard_Real LinearTolerance, const Standard_Real AngularTolerance);

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 'location' point (origin) of <self>.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: b133f2e6e1c74f672a216a0094bdfda6 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the point p, and assigns the result to this coordinate system. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.
") Mirror;
		void Mirror(const gp_Pnt & P);

		/****************** Mirror ******************/
		/**** md5 signature: d1a0189a98d756bd9e5b51b4ae49992a ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the axis a1, and assigns the result to this coordinate systeme. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.
") Mirror;
		void Mirror(const gp_Ax1 & A1);

		/****************** Mirror ******************/
		/**** md5 signature: 874cde0169043be133e205e960c3ca57 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
None

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'x direction' and 'y direction' of coordinate system a2 and assigns the result to this coordinate systeme. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.
") Mirror;
		void Mirror(const gp_Ax2 & A2);

		/****************** Mirrored ******************/
		/**** md5 signature: 0cc467f32eec1a08f583d07798a3bed4 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
gp_Ax2

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the point p, and creates a new one. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.
") Mirrored;
		gp_Ax2 Mirrored(const gp_Pnt & P);

		/****************** Mirrored ******************/
		/**** md5 signature: cd76323d08d1a74c97ae7accdafbe5ed ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
gp_Ax2

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the axis a1, and creates a new one. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.
") Mirrored;
		gp_Ax2 Mirrored(const gp_Ax1 & A1);

		/****************** Mirrored ******************/
		/**** md5 signature: be1595105fbb55ff06221b22fd36206f ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A2: gp_Ax2

Return
-------
gp_Ax2

Description
-----------
Performs a symmetrical transformation of this coordinate system with respect to: - the plane defined by the origin, 'x direction' and 'y direction' of coordinate system a2 and creates a new one. warning this transformation is always performed on the origin. in case of a reflection with respect to a point: - the main direction of the coordinate system is not changed, and - the 'x direction' and the 'y direction' are simply reversed in case of a reflection with respect to an axis or a plane: - the transformation is applied to the 'x direction' and the 'y direction', then - the 'main direction' is recomputed as the cross product 'x direction' ^ 'y direction'. this maintains the right-handed property of the coordinate system.
") Mirrored;
		gp_Ax2 Mirrored(const gp_Ax2 & A2);

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: ee3bea46a94fb224519c4b3be277bc76 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Ax2

Description
-----------
Rotates an axis placement. <thea1> is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Ax2 Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: 2e3ad744b562b37602bc0d7050246d12 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 385dfc6a71e06d5706b1c4b3d50647b8 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Ax2

Description
-----------
Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. warnings: if the scale <s> is negative: . the main direction of the axis placement is not changed. . the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.
") Scaled;
		gp_Ax2 Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 4f1ae44e92ff7b1da601b2ca71a3a58a ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
A1: gp_Ax1

Return
-------
None

Description
-----------
Assigns the origin and 'main direction' of the axis a1 to this coordinate system, then recomputes its 'x direction' and 'y direction'. note: the new 'x direction' is computed as follows: new 'x direction' = v1 ^(previous 'x direction' ^ v) where v is the 'direction' of a1. exceptions standard_constructionerror if a1 is parallel to the 'x direction' of this coordinate system.
") SetAxis;
		void SetAxis(const gp_Ax1 & A1);

		/****************** SetDirection ******************/
		/**** md5 signature: df8744d729e050a65ee65230eb199390 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
V: gp_Dir

Return
-------
None

Description
-----------
Changes the 'main direction' of this coordinate system, then recomputes its 'x direction' and 'y direction'. note: the new 'x direction' is computed as follows: new 'x direction' = v ^ (previous 'x direction' ^ v) exceptions standard_constructionerror if v is parallel to the 'x direction' of this coordinate system.
") SetDirection;
		void SetDirection(const gp_Dir & V);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Changes the 'location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** SetXDirection ******************/
		/**** md5 signature: 3d3bab20c677349ee7fa8a9102c91ae2 ****/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "
Parameters
----------
theVx: gp_Dir

Return
-------
None

Description
-----------
Changes the 'xdirection' of <self>. the main direction 'direction' is not modified, the 'ydirection' is modified. if <vx> is not normal to the main direction then <xdirection> is computed as follows xdirection = direction ^ (vx ^ direction). exceptions standard_constructionerror if vx or vy is parallel to the 'main direction' of this coordinate system.
") SetXDirection;
		void SetXDirection(const gp_Dir & theVx);

		/****************** SetYDirection ******************/
		/**** md5 signature: f2ed46b9eac8afb73a5e63e5efa3be13 ****/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "
Parameters
----------
theVy: gp_Dir

Return
-------
None

Description
-----------
Changes the 'ydirection' of <self>. the main direction is not modified but the 'xdirection' is changed. if <vy> is not normal to the main direction then 'ydirection' is computed as follows ydirection = direction ^ (<vy> ^ direction). exceptions standard_constructionerror if vx or vy is parallel to the 'main direction' of this coordinate system.
") SetYDirection;
		void SetYDirection(const gp_Dir & theVy);

		/****************** Transform ******************/
		/**** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: eab1930f7a063cb7876b93843ac8abf3 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Ax2

Description
-----------
Transforms an axis placement with a trsf. the 'location' point, the 'xdirection' and the 'ydirection' are transformed with thet. the resulting main 'direction' of <self> is the cross product between the 'xdirection' and the 'ydirection' after transformation.
") Transformed;
		gp_Ax2 Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: fe6f630d01df6ffff14aae81f837242a ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Ax2

Description
-----------
Translates an axis plaxement in the direction of the vector <thev>. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax2 Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: 34cdc425c0398b554eac045ed0add6bd ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Ax2

Description
-----------
Translates an axis placement from the point <thep1> to the point <thep2>.
") Translated;
		gp_Ax2 Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** XDirection ******************/
		/**** md5 signature: fcbbc9d6c74ef03a8434eacc59ccc564 ****/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'xdirection' of <self>.
") XDirection;
		const gp_Dir XDirection();

		/****************** YDirection ******************/
		/**** md5 signature: b77f77726206b24c16f5b9c836ddd524 ****/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'ydirection' of <self>.
") YDirection;
		const gp_Dir YDirection();

};



%extend gp_Ax2 {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax2 {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax2()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax2')
    }
};
%extend gp_Ax2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Ax22d *
*****************/
class gp_Ax22d {
	public:
		/****************** gp_Ax22d ******************/
		/**** md5 signature: 9bed5f419bc513220f68fc75e8231e2f ****/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object representing the reference coordinate system (oxy).
") gp_Ax22d;
		 gp_Ax22d();

		/****************** gp_Ax22d ******************/
		/**** md5 signature: c0497ebc3b83a8f54918c0f23fffe3f6 ****/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theVx: gp_Dir2d
theVy: gp_Dir2d

Return
-------
None

Description
-----------
Creates a coordinate system with origin thep and where: - thevx is the 'x direction', and - the 'y direction' is orthogonal to thevx and oriented so that the cross products thevx^'y direction' and thevx^thevy have the same sign. raises constructionerror if thevx and thevy are parallel (same or opposite orientation).
") gp_Ax22d;
		 gp_Ax22d(const gp_Pnt2d & theP, const gp_Dir2d & theVx, const gp_Dir2d & theVy);

		/****************** gp_Ax22d ******************/
		/**** md5 signature: 44bd40632efc3c538836ee1b5485d122 ****/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theV: gp_Dir2d
theIsSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates - a coordinate system with origin thep and 'x direction' thev, which is: - right-handed if theissense is true (default value), or - left-handed if theissense is false.
") gp_Ax22d;
		 gp_Ax22d(const gp_Pnt2d & theP, const gp_Dir2d & theV, const Standard_Boolean theIsSense = Standard_True);

		/****************** gp_Ax22d ******************/
		/**** md5 signature: 2d737b329d1aa62d15726e39c021bd2c ****/
		%feature("compactdefaultargs") gp_Ax22d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d
theIsSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates - a coordinate system where its origin is the origin of thea and its 'x direction' is the unit vector of thea, which is: - right-handed if theissense is true (default value), or - left-handed if theissense is false.
") gp_Ax22d;
		 gp_Ax22d(const gp_Ax2d & theA, const Standard_Boolean theIsSense = Standard_True);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** Location ******************/
		/**** md5 signature: 0e4556028ba61472400043e40317f1e2 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the 'location' point (origin) of <self>.
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5f85e7eebe220829e022319813e0b5b1 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** Mirrored ******************/
		/**** md5 signature: 7cc0d1da495c5596f7424f892cc48f76 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Ax22d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point thep which is the center of the symmetry. warnings: the main direction of the axis placement is not changed. the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.
") Mirrored;
		gp_Ax22d Mirrored(const gp_Pnt2d & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 4b14c2e8ee36135d3ea9d9738318d790 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Ax22d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. the transformation is performed on the 'location' point, on the 'xdirection' and 'ydirection'. the resulting main 'direction' is the cross product between the 'xdirection' and the 'ydirection' after transformation.
") Mirrored;
		gp_Ax22d Mirrored(const gp_Ax2d & theA);

		/****************** Rotate ******************/
		/**** md5 signature: 96011b42c3eec1be38fcc33efc511d13 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: b94fc5af9442aba6ccfc33dd68a9a842 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Ax22d

Description
-----------
Rotates an axis placement. <thea1> is the axis of the rotation . theang is the angular value of the rotation in radians.
") Rotated;
		gp_Ax22d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: c464bf78519bd3beeec5dd2bb7f74ab0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 51d604090499497c3b98f0e7a5bd670a ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Ax22d

Description
-----------
Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. warnings: if the scale <thes> is negative: . the main direction of the axis placement is not changed. . the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.
") Scaled;
		gp_Ax22d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: aaefe7e8d51f677bea1263443495357d ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax22d

Return
-------
None

Description
-----------
Assigns the origin and the two unit vectors of the coordinate system thea1 to this coordinate system.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: fea6486624f66c26e32103313f4d0c00 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the 'location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****************** SetXAxis ******************/
		/**** md5 signature: a050e9c9c396b60893148d45aff17a20 ****/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
None

Description
-----------
Changes the xaxis and yaxis ('location' point and 'direction') of <self>. the 'ydirection' is recomputed in the same sense as before.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA1);

		/****************** SetXDirection ******************/
		/**** md5 signature: 2721c831d756930a119b06c82ca020cf ****/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "
Parameters
----------
theVx: gp_Dir2d

Return
-------
None

Description
-----------
Assigns thevx to the 'x direction' of this coordinate system. the other unit vector of this coordinate system is recomputed, normal to thevx , without modifying the orientation (right-handed or left-handed) of this coordinate system.
") SetXDirection;
		void SetXDirection(const gp_Dir2d & theVx);

		/****************** SetYAxis ******************/
		/**** md5 signature: ce9c492ad0c33618cc9fd37e39394ce6 ****/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
None

Description
-----------
Changes the xaxis and yaxis ('location' point and 'direction') of <self>. the 'xdirection' is recomputed in the same sense as before.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA1);

		/****************** SetYDirection ******************/
		/**** md5 signature: 1e3e0df24b75a4682f230c858a419a8e ****/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "
Parameters
----------
theVy: gp_Dir2d

Return
-------
None

Description
-----------
Assignsr thevy to the 'y direction' of this coordinate system. the other unit vector of this coordinate system is recomputed, normal to thevy, without modifying the orientation (right-handed or left-handed) of this coordinate system.
") SetYDirection;
		void SetYDirection(const gp_Dir2d & theVy);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 533173274bc81be883d8e80dc324d48c ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Ax22d

Description
-----------
Transforms an axis placement with a trsf. the 'location' point, the 'xdirection' and the 'ydirection' are transformed with thet. the resulting main 'direction' of <self> is the cross product between the 'xdirection' and the 'ydirection' after transformation.
") Transformed;
		gp_Ax22d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: f3112504d8f922313d0ee62e8d9fc9ad ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 55b2d13fc32e036672b1e26354dbae21 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Ax22d

Description
-----------
Translates an axis plaxement in the direction of the vector <thev>. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax22d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: 1057d69fabf7bd8efb6604f2e49dc09e ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Ax22d

Description
-----------
Translates an axis placement from the point <thep1> to the point <thep2>.
") Translated;
		gp_Ax22d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 6a005542df14e10d67ac38644cf8c7ae ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'x direction' of this coordinate system. note: the result is the 'x axis' of this coordinate system.
") XAxis;
		gp_Ax2d XAxis();

		/****************** XDirection ******************/
		/**** md5 signature: 9e0f1401deef31c873b00713d7dfc2a9 ****/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the 'xdirection' of <self>.
") XDirection;
		const gp_Dir2d XDirection();

		/****************** YAxis ******************/
		/**** md5 signature: d49975ff0e9ed400148a36ac6e990919 ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns an axis, for which - the origin is that of this coordinate system, and - the unit vector is either the 'y direction' of this coordinate system. note: the result is the 'y axis' of this coordinate system.
") YAxis;
		gp_Ax2d YAxis();

		/****************** YDirection ******************/
		/**** md5 signature: caf7b770811dd6baeba0f0cd6c45209e ****/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the 'ydirection' of <self>.
") YDirection;
		const gp_Dir2d YDirection();

};



%extend gp_Ax22d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax22d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax22d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax22d')
    }
};
%extend gp_Ax22d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Ax2d *
****************/
class gp_Ax2d {
	public:
		/****************** gp_Ax2d ******************/
		/**** md5 signature: fbefef35a3253e0127a39f21f5149299 ****/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an axis object representing x axis of the reference co-ordinate system.
") gp_Ax2d;
		 gp_Ax2d();

		/****************** gp_Ax2d ******************/
		/**** md5 signature: 592b50727e5b4b614785f646b99e313f ****/
		%feature("compactdefaultargs") gp_Ax2d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theV: gp_Dir2d

Return
-------
None

Description
-----------
Creates an ax2d. <thep> is the 'location' point of the axis placement and thev is the 'direction' of the axis placement.
") gp_Ax2d;
		 gp_Ax2d(const gp_Pnt2d & theP, const gp_Dir2d & theV);

		/****************** Angle ******************/
		/**** md5 signature: 77962814c01abc7bd67512098b6e523d ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d

Return
-------
float

Description
-----------
Computes the angle, in radians, between this axis and the axis theother. the value of the angle is between -pi and pi.
") Angle;
		Standard_Real Angle(const gp_Ax2d & theOther);

		/****************** Direction ******************/
		/**** md5 signature: b48e56b9548c841e45989f4710a5ce8d ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the direction of <self>.
") Direction;
		const gp_Dir2d Direction();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** IsCoaxial ******************/
		/**** md5 signature: 75e748f680609f8e38c2264eb1a2db73 ****/
		%feature("compactdefaultargs") IsCoaxial;
		%feature("autodoc", "
Parameters
----------
Other: gp_Ax2d
AngularTolerance: float
LinearTolerance: float

Return
-------
bool

Description
-----------
Returns true if: . the angle between <self> and <other> is lower or equal to <angulartolerance> and . the distance between <self>.location() and <other> is lower or equal to <lineartolerance> and . the distance between <other>.location() and <self> is lower or equal to lineartolerance.
") IsCoaxial;
		Standard_Boolean IsCoaxial(const gp_Ax2d & Other, const Standard_Real AngularTolerance, const Standard_Real LinearTolerance);

		/****************** IsNormal ******************/
		/**** md5 signature: 26299667f880ffc51468f51e9adf3484 ****/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if this axis and the axis theother are normal to each other. that is, if the angle between the two axes is equal to pi/2 or -pi/2. note: the tolerance criterion is given by theangulartolerance.
") IsNormal;
		Standard_Boolean IsNormal(const gp_Ax2d & theOther, const Standard_Real theAngularTolerance);

		/****************** IsOpposite ******************/
		/**** md5 signature: 1faec1578a4c51cfe00ce93248f02600 ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if this axis and the axis theother are parallel, and have opposite orientations. that is, if the angle between the two axes is equal to pi or -pi. note: the tolerance criterion is given by theangulartolerance.
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Ax2d & theOther, const Standard_Real theAngularTolerance);

		/****************** IsParallel ******************/
		/**** md5 signature: 4128314a02b8bc06fd3a5cf1cc84505a ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if this axis and the axis theother are parallel, and have either the same or opposite orientations. that is, if the angle between the two axes is equal to 0, pi or -pi. note: the tolerance criterion is given by theangulartolerance.
") IsParallel;
		Standard_Boolean IsParallel(const gp_Ax2d & theOther, const Standard_Real theAngularTolerance);

		/****************** Location ******************/
		/**** md5 signature: 0e4556028ba61472400043e40317f1e2 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the origin of <self>.
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5a90a3ec4faf7909390bb0bfb4d9be0f ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		/**** md5 signature: 8b8d921c1e87f73e8278c4d42ae298f7 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		/**** md5 signature: 6fb036fc1f45fe9989030dfbdebac0ea ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
gp_Ax2d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point p which is the center of the symmetry.
") Mirrored;
		gp_Ax2d Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		/**** md5 signature: f3f6d2f09cb7c474ab9f0d93f8940599 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
A: gp_Ax2d

Return
-------
gp_Ax2d

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Ax2d Mirrored(const gp_Ax2d & A);

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of <self> and assigns the result to this axis.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 8db67ab424d85b2a6cf6219805ac51b5 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes a new axis placement with a direction opposite to the direction of <self>.
") Reversed;
		gp_Ax2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 4514855f978c37f3ce31a9851c5a1153 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 08e74980d551530a1fa9e78bd21edbad ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Ax2d

Description
-----------
Rotates an axis placement. <thep> is the center of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Ax2d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: 5b49a8aeffcacace07c66937f77f1e03 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
S: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & P, const Standard_Real S);

		/****************** Scaled ******************/
		/**** md5 signature: bdf3a4cb727620ef5449f9d4594237ab ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Ax2d

Description
-----------
Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. the 'direction' is reversed if the scale is negative.
") Scaled;
		gp_Ax2d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetDirection ******************/
		/**** md5 signature: c432d44a3a70de3dff1bf385189df5c4 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
Changes the direction of <self>.
") SetDirection;
		void SetDirection(const gp_Dir2d & theV);

		/****************** SetLocation ******************/
		/**** md5 signature: fea6486624f66c26e32103313f4d0c00 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the 'location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****************** Transform ******************/
		/**** md5 signature: 730ddba08a3831e8eddc8ca7a1e1a563 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: cf58c8d22f8204832226887d60a2abc8 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Ax2d

Description
-----------
Transforms an axis placement with a trsf.
") Transformed;
		gp_Ax2d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: f3112504d8f922313d0ee62e8d9fc9ad ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 2d6790088b94666a92b4d1f949eb9aaf ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Ax2d

Description
-----------
Translates an axis placement in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax2d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: bdeb5bc7b2e9ed70069261614f10ddd0 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Ax2d

Description
-----------
Translates an axis placement from the point thep1 to the point thep2.
") Translated;
		gp_Ax2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

};



%extend gp_Ax2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax2d')
    }
};
%extend gp_Ax2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Ax3 *
***************/
class gp_Ax3 {
	public:
		/****************** gp_Ax3 ******************/
		/**** md5 signature: 50158217200ccbb9ed316457b0e989a4 ****/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object corresponding to the reference coordinate system (oxyz).
") gp_Ax3;
		 gp_Ax3();

		/****************** gp_Ax3 ******************/
		/**** md5 signature: 9800ecb7325577d5aaff98252e57e898 ****/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2

Return
-------
None

Description
-----------
Creates a coordinate system from a right-handed coordinate system.
") gp_Ax3;
		 gp_Ax3(const gp_Ax2 & theA);

		/****************** gp_Ax3 ******************/
		/**** md5 signature: 377b87eb0622cdfcce4e27a9fafe4493 ****/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theN: gp_Dir
theVx: gp_Dir

Return
-------
None

Description
-----------
Creates a right handed axis placement with the 'location' point thep and two directions, then gives the 'direction' and thevx gives the 'xdirection'. raises constructionerror if then and thevx are parallel (same or opposite orientation).
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & theP, const gp_Dir & theN, const gp_Dir & theVx);

		/****************** gp_Ax3 ******************/
		/**** md5 signature: c4f0bf6274e2b9849997b0622ec82495 ****/
		%feature("compactdefaultargs") gp_Ax3;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates an axis placement with the 'location' point <thep> and the normal direction <thev>.
") gp_Ax3;
		 gp_Ax3(const gp_Pnt & theP, const gp_Dir & theV);

		/****************** Angle ******************/
		/**** md5 signature: 38e2c4a4cc50aa30351eadcd4fcb22c7 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax3

Return
-------
float

Description
-----------
Computes the angular value between the main direction of <self> and the main direction of <theother>. returns the angle between 0 and pi in radians.
") Angle;
		Standard_Real Angle(const gp_Ax3 & theOther);

		/****************** Ax2 ******************/
		/**** md5 signature: c9b4af4169eef4b21cfe015142d7278a ****/
		%feature("compactdefaultargs") Ax2;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Computes a right-handed coordinate system with the same 'x direction' and 'y direction' as those of this coordinate system, then recomputes the 'main direction'. if this coordinate system is right-handed, the result returned is the same coordinate system. if this coordinate system is left-handed, the result is reversed.
") Ax2;
		gp_Ax2 Ax2();

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of <self>. it is the 'location' point and the main 'direction'.
") Axis;
		const gp_Ax1 Axis();

		/****************** Direct ******************/
		/**** md5 signature: 2c90be540a5bf9418e7461f7f76c970a ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the coordinate system is right-handed. i.e. xdirection().crossed(ydirection()).dot(direction()) > 0.
") Direct;
		Standard_Boolean Direct();

		/****************** Direction ******************/
		/**** md5 signature: fe17f01a1a479d7628e85d427dbda641 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the main direction of <self>.
") Direction;
		const gp_Dir Direction();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****************** IsCoplanar ******************/
		/**** md5 signature: 839576f344c38c375debc9dad1060ac3 ****/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Ax3
theLinearTolerance: float
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if . the distance between the 'location' point of <self> and <theother> is lower or equal to thelineartolerance and . the distance between the 'location' point of <theother> and <self> is lower or equal to thelineartolerance and . the main direction of <self> and the main direction of <theother> are parallel (same or opposite orientation).
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax3 & theOther, const Standard_Real theLinearTolerance, const Standard_Real theAngularTolerance);

		/****************** IsCoplanar ******************/
		/**** md5 signature: 69116b679843481077391fbe3b5ae9bc ****/
		%feature("compactdefaultargs") IsCoplanar;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theLinearTolerance: float
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if . the distance between <self> and the 'location' point of thea1 is lower of equal to thelineartolerance and . the distance between thea1 and the 'location' point of <self> is lower or equal to thelineartolerance and . the main direction of <self> and the direction of thea1 are normal.
") IsCoplanar;
		Standard_Boolean IsCoplanar(const gp_Ax1 & theA1, const Standard_Real theLinearTolerance, const Standard_Real theAngularTolerance);

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 'location' point (origin) of <self>.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: 42d94d933f559095c36e8d1a0b5dba4f ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Ax3

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to the point thep which is the center of the symmetry. warnings: the main direction of the axis placement is not changed. the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.
") Mirrored;
		gp_Ax3 Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 33b89fb3a2c2a0176b162cd13cb59366 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Ax3

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to an axis placement which is the axis of the symmetry. the transformation is performed on the 'location' point, on the 'xdirection' and 'ydirection'. the resulting main 'direction' is the cross product between the 'xdirection' and the 'ydirection' after transformation.
") Mirrored;
		gp_Ax3 Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 9a9877d33697f8bf31b8222da16f0892 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Ax3

Description
-----------
Performs the symmetrical transformation of an axis placement with respect to a plane. the axis placement <thea2> locates the plane of the symmetry: (location, xdirection, ydirection). the transformation is performed on the 'location' point, on the 'xdirection' and 'ydirection'. the resulting main 'direction' is the cross product between the 'xdirection' and the 'ydirection' after transformation.
") Mirrored;
		gp_Ax3 Mirrored(const gp_Ax2 & theA2);

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 27b5e8b4b2b522de69bec13851b4ca71 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Ax3

Description
-----------
Rotates an axis placement. <thea1> is the axis of the rotation . theang is the angular value of the rotation in radians.
") Rotated;
		gp_Ax3 Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: 2e3ad744b562b37602bc0d7050246d12 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: beb24c1eccd986f33a6360ed9974d0f5 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Ax3

Description
-----------
Applies a scaling transformation on the axis placement. the 'location' point of the axisplacement is modified. warnings: if the scale <thes> is negative: . the main direction of the axis placement is not changed. . the 'xdirection' and the 'ydirection' are reversed. so the axis placement stay right handed.
") Scaled;
		gp_Ax3 Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 43324233139e9364ed0345f04485c556 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Assigns the origin and 'main direction' of the axis thea1 to this coordinate system, then recomputes its 'x direction' and 'y direction'. note: - the new 'x direction' is computed as follows: new 'x direction' = v1 ^(previous 'x direction' ^ v) where v is the 'direction' of thea1. - the orientation of this coordinate system (right-handed or left-handed) is not modified. raises constructionerror if the 'direction' of <thea1> and the 'xdirection' of <self> are parallel (same or opposite orientation) because it is impossible to calculate the new 'xdirection' and the new 'ydirection'.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetDirection ******************/
		/**** md5 signature: 8b5ca597f3afabbc57f16735908eb058 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Changes the main direction of this coordinate system, then recomputes its 'x direction' and 'y direction'. note: - the new 'x direction' is computed as follows: new 'x direction' = thev ^ (previous 'x direction' ^ thev). - the orientation of this coordinate system (left- or right-handed) is not modified. raises constructionerror if <thev> and the previous 'xdirection' are parallel because it is impossible to calculate the new 'xdirection' and the new 'ydirection'.
") SetDirection;
		void SetDirection(const gp_Dir & theV);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Changes the 'location' point (origin) of <self>.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** SetXDirection ******************/
		/**** md5 signature: 7c7709263c1f5e7e9b0cffdbb4ad187a ****/
		%feature("compactdefaultargs") SetXDirection;
		%feature("autodoc", "
Parameters
----------
theVx: gp_Dir

Return
-------
None

Description
-----------
Changes the 'xdirection' of <self>. the main direction 'direction' is not modified, the 'ydirection' is modified. if <thevx> is not normal to the main direction then <xdirection> is computed as follows xdirection = direction ^ (thevx ^ direction). raises constructionerror if <thevx> is parallel (same or opposite orientation) to the main direction of <self>.
") SetXDirection;
		void SetXDirection(const gp_Dir & theVx);

		/****************** SetYDirection ******************/
		/**** md5 signature: 899268beb5d91c4e317724e14fe72fd6 ****/
		%feature("compactdefaultargs") SetYDirection;
		%feature("autodoc", "
Parameters
----------
theVy: gp_Dir

Return
-------
None

Description
-----------
Changes the 'ydirection' of <self>. the main direction is not modified but the 'xdirection' is changed. if <thevy> is not normal to the main direction then 'ydirection' is computed as follows ydirection = direction ^ (<thevy> ^ direction). raises constructionerror if <thevy> is parallel to the main direction of <self>.
") SetYDirection;
		void SetYDirection(const gp_Dir & theVy);

		/****************** Transform ******************/
		/**** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: a19295588196b05ec78621a6dbf05e07 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Ax3

Description
-----------
Transforms an axis placement with a trsf. the 'location' point, the 'xdirection' and the 'ydirection' are transformed with thet. the resulting main 'direction' of <self> is the cross product between the 'xdirection' and the 'ydirection' after transformation.
") Transformed;
		gp_Ax3 Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 03f1709e137e55703b2d9c95973330eb ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Ax3

Description
-----------
Translates an axis plaxement in the direction of the vector <thev>. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Ax3 Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: 2d594100225a70f78f910bcbae6aed7d ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Ax3

Description
-----------
Translates an axis placement from the point <thep1> to the point <thep2>.
") Translated;
		gp_Ax3 Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** XDirection ******************/
		/**** md5 signature: fcbbc9d6c74ef03a8434eacc59ccc564 ****/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'xdirection' of <self>.
") XDirection;
		const gp_Dir XDirection();

		/****************** XReverse ******************/
		/**** md5 signature: fc535c1f8281e2db84b1e2650c881d9f ****/
		%feature("compactdefaultargs") XReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the x direction of <self>.
") XReverse;
		void XReverse();

		/****************** YDirection ******************/
		/**** md5 signature: b77f77726206b24c16f5b9c836ddd524 ****/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the 'ydirection' of <self>.
") YDirection;
		const gp_Dir YDirection();

		/****************** YReverse ******************/
		/**** md5 signature: cd584437f5849bcfad54a3e35179c992 ****/
		%feature("compactdefaultargs") YReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the y direction of <self>.
") YReverse;
		void YReverse();

		/****************** ZReverse ******************/
		/**** md5 signature: f545c0bd2a06cbf06f30ff2918446c43 ****/
		%feature("compactdefaultargs") ZReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the z direction of <self>.
") ZReverse;
		void ZReverse();

};



%extend gp_Ax3 {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Ax3 {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Ax3()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Ax3')
    }
};
%extend gp_Ax3 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Circ *
****************/
class gp_Circ {
	public:
		/****************** gp_Circ ******************/
		/**** md5 signature: 5f10d6909b85753006e6ebe03abc11d5 ****/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite circle.
") gp_Circ;
		 gp_Circ();

		/****************** gp_Circ ******************/
		/**** md5 signature: 739b08382fa8319dc2d01e46b8d831b7 ****/
		%feature("compactdefaultargs") gp_Circ;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theRadius: float

Return
-------
None

Description
-----------
A2 locates the circle and gives its orientation in 3d space. warnings: it is not forbidden to create a circle with theradius = 0.0 raises constructionerror if theradius < 0.0.
") gp_Circ;
		 gp_Circ(const gp_Ax2 & theA2, const Standard_Real theRadius);

		/****************** Area ******************/
		/**** md5 signature: c02bdde385c5c793a22800891df9b9cd ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the area of the circle.
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of the circle. it is the axis perpendicular to the plane of the circle, passing through the 'location' point (center) of the circle.
") Axis;
		const gp_Ax1 Axis();

		/****************** Contains ******************/
		/**** md5 signature: 505c74c81a15c8244323a9eb031db0f3 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theLinearTolerance: float

Return
-------
bool

Description
-----------
Returns true if the point thep is on the circumference. the distance between <self> and <thep> must be lower or equal to thelineartolerance.
") Contains;
		Standard_Boolean Contains(const gp_Pnt & theP, const Standard_Real theLinearTolerance);

		/****************** Distance ******************/
		/**** md5 signature: 2fc4b43cfa77ad16173f47474ea6d043 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
float

Description
-----------
Computes the minimum of distance between the point thep and any point on the circumference of the circle.
") Distance;
		Standard_Real Distance(const gp_Pnt & theP);

		/****************** Length ******************/
		/**** md5 signature: 1d863a710d06afea5559458878200357 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the circumference of the circle.
") Length;
		Standard_Real Length();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the center of the circle. it is the 'location' point of the local coordinate system of the circle.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: 0160e60b3524fb2280e9550ebe93648f ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Circ

Description
-----------
Performs the symmetrical transformation of a circle with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Circ Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: dca03722aa867dbbda201002c87da479 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Circ

Description
-----------
Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Circ Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: a328233c47d4c15b36f2b1518877c9fb ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Circ

Description
-----------
Performs the symmetrical transformation of a circle with respect to a plane. the axis placement thea2 locates the plane of the of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Circ Mirrored(const gp_Ax2 & theA2);

		/****************** Position ******************/
		/**** md5 signature: 0919c787263d4f8ff9c1e18688f5d16c ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the position of the circle. it is the local coordinate system of the circle.
") Position;
		const gp_Ax2 Position();

		/****************** Radius ******************/
		/**** md5 signature: e995997e31f334f223fb359fc7382a66 ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius of this circle.
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 0d1e53633a3ccb637477f608fa7c771d ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Circ

Description
-----------
Rotates a circle. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Circ Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 77e0a32946b6e54a126e51c621f3e989 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Circ

Description
-----------
Scales a circle. thes is the scaling value. warnings: if thes is negative the radius stay positive but the 'xaxis' and the 'yaxis' are reversed as for an ellipse.
") Scaled;
		gp_Circ Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Changes the main axis of the circle. it is the axis perpendicular to the plane of the circle. raises constructionerror if the direction of thea1 is parallel to the 'xaxis' of the circle.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Changes the 'location' point (center) of the circle.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** SetPosition ******************/
		/**** md5 signature: ebc7dd35ccc08a819f6ac865a49dfe89 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
Changes the position of the circle.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****************** SetRadius ******************/
		/**** md5 signature: ec1ecbc6b8d5250d29d2812fb870ef3b ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: float

Return
-------
None

Description
-----------
Modifies the radius of this circle. warning. this class does not prevent the creation of a circle where theradius is null. exceptions standard_constructionerror if theradius is negative.
") SetRadius;
		void SetRadius(const Standard_Real theRadius);

		/****************** SquareDistance ******************/
		/**** md5 signature: 7fbe88c31283387e08156a089bc874fa ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
float

Description
-----------
Computes the square distance between <self> and the point thep.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & theP);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: e1c6143ec0b0351694a5fc9bdee53f59 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Circ

Description
-----------
Transforms a circle with the transformation thet from class trsf.
") Transformed;
		gp_Circ Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 0b0dfc34e7d72c0aa19e557fa861bce9 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Circ

Description
-----------
Translates a circle in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Circ Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: 659e796883409e73c22027093eec1349 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Circ

Description
-----------
Translates a circle from the point thep1 to the point thep2.
") Translated;
		gp_Circ Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'xaxis' of the circle. this axis is perpendicular to the axis of the conic. this axis and the 'yaxis' define the plane of the conic.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'yaxis' of the circle. this axis and the 'xaxis' define the plane of the conic. the 'yaxis' is perpendicular to the 'xaxis'.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Circ {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Circ {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Circ()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Circ')
    }
};
%extend gp_Circ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Circ2d *
******************/
class gp_Circ2d {
	public:
		/****************** gp_Circ2d ******************/
		/**** md5 signature: 9abe96e635d4d5d4883afa39f2cc864d ****/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite circle.
") gp_Circ2d;
		 gp_Circ2d();

		/****************** gp_Circ2d ******************/
		/**** md5 signature: 157b4c77138fe2dd66aa66d0e802a45a ****/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "
Parameters
----------
theXAxis: gp_Ax2d
theRadius: float
theIsSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
The location point of thexaxis is the center of the circle. warnings: it is not forbidden to create a circle with theradius = 0.0 raises constructionerror if theradius < 0.0. raised if theradius < 0.0.
") gp_Circ2d;
		 gp_Circ2d(const gp_Ax2d & theXAxis, const Standard_Real theRadius, const Standard_Boolean theIsSense = Standard_True);

		/****************** gp_Circ2d ******************/
		/**** md5 signature: 3b0c3e71e00672bbab9e12940ef92b09 ****/
		%feature("compactdefaultargs") gp_Circ2d;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax22d
theRadius: float

Return
-------
None

Description
-----------
Theaxis defines the xaxis and yaxis of the circle which defines the origin and the sense of parametrization. the location point of theaxis is the center of the circle. warnings: it is not forbidden to create a circle with theradius = 0.0 raises constructionerror if theradius < 0.0. raised if theradius < 0.0.
") gp_Circ2d;
		 gp_Circ2d(const gp_Ax22d & theAxis, const Standard_Real theRadius);

		/****************** Area ******************/
		/**** md5 signature: c02bdde385c5c793a22800891df9b9cd ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the area of the circle.
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: 094e5176aca7cccfc018310a1bba741f ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the position of the circle.
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: cc309b22e72d7a2fa63d9f3b74f48eaa ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: float
theB: float
theC: float
theD: float
theE: float
theF: float

Description
-----------
Returns the normalized coefficients from the implicit equation of the circle: thea * (x**2) + theb * (y**2) + 2*thec*(x*y) + 2*thed*x + 2*thee*y + thef = 0.0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Contains ******************/
		/**** md5 signature: 48572605f35f0836d249aaf0f0a6926c ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theLinearTolerance: float

Return
-------
bool

Description
-----------
Does <self> contain thep ? returns true if the distance between thep and any point on the circumference of the circle is lower of equal to <thelineartolerance>.
") Contains;
		Standard_Boolean Contains(const gp_Pnt2d & theP, const Standard_Real theLinearTolerance);

		/****************** Distance ******************/
		/**** md5 signature: fb4d5768ba7911e98e8d6818bd11e896 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
float

Description
-----------
Computes the minimum of distance between the point thep and any point on the circumference of the circle.
") Distance;
		Standard_Real Distance(const gp_Pnt2d & theP);

		/****************** IsDirect ******************/
		/**** md5 signature: 218f7b7b68e34847c5868fa318c903a4 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Length ******************/
		/**** md5 signature: 1d863a710d06afea5559458878200357 ****/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the circumference of the circle.
") Length;
		Standard_Real Length();

		/****************** Location ******************/
		/**** md5 signature: 0e4556028ba61472400043e40317f1e2 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the location point (center) of the circle.
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5f85e7eebe220829e022319813e0b5b1 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** Mirrored ******************/
		/**** md5 signature: a8d9794b3dccce07942f165690ff1699 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Circ2d

Description
-----------
Performs the symmetrical transformation of a circle with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Circ2d Mirrored(const gp_Pnt2d & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 0e4e4066a4d70fa4e5b011b98d4536e8 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Circ2d

Description
-----------
Performs the symmetrical transformation of a circle with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Circ2d Mirrored(const gp_Ax2d & theA);

		/****************** Position ******************/
		/**** md5 signature: 8247b1efb09dc461f7d1cce90ebd0c14 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the position of the circle. idem axis(me).
") Position;
		const gp_Ax22d Position();

		/****************** Radius ******************/
		/**** md5 signature: e995997e31f334f223fb359fc7382a66 ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius value of the circle.
") Radius;
		Standard_Real Radius();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the orientation of the local coordinate system of this circle (the 'y direction' is reversed) and therefore changes the implicit orientation of this circle. reverse assigns the result to this circle,.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 03a7c5a065e85445047f4b8355bff9c3 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
Reverses the orientation of the local coordinate system of this circle (the 'y direction' is reversed) and therefore changes the implicit orientation of this circle. reversed creates a new circle.
") Reversed;
		gp_Circ2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 4514855f978c37f3ce31a9851c5a1153 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 143fa49312130d3153ab0e4e904866b3 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Circ2d

Description
-----------
Rotates a circle. thep is the center of the rotation. ang is the angular value of the rotation in radians.
") Rotated;
		gp_Circ2d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: c464bf78519bd3beeec5dd2bb7f74ab0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 138b9e4fb0971602c5b23217bb9b2e6b ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Circ2d

Description
-----------
Scales a circle. thes is the scaling value. warnings: if thes is negative the radius stay positive but the 'xaxis' and the 'yaxis' are reversed as for an ellipse.
") Scaled;
		gp_Circ2d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: fba67a5039095eddccca14c1039ad8be ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d

Return
-------
None

Description
-----------
Changes the x axis of the circle.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****************** SetLocation ******************/
		/**** md5 signature: fea6486624f66c26e32103313f4d0c00 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the location point (center) of the circle.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****************** SetRadius ******************/
		/**** md5 signature: ec1ecbc6b8d5250d29d2812fb870ef3b ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theRadius: float

Return
-------
None

Description
-----------
Modifies the radius of this circle. this class does not prevent the creation of a circle where theradius is null. exceptions standard_constructionerror if theradius is negative.
") SetRadius;
		void SetRadius(const Standard_Real theRadius);

		/****************** SetXAxis ******************/
		/**** md5 signature: 8cea815a914afe135b1603dc856a8a22 ****/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the x axis of the circle.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA);

		/****************** SetYAxis ******************/
		/**** md5 signature: f60887b297962c8ebfb061925ba2853e ****/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the y axis of the circle.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA);

		/****************** SquareDistance ******************/
		/**** md5 signature: 341b637f68b11ca63b87173eee241ab6 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
float

Description
-----------
Computes the square distance between <self> and the point thep.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt2d & theP);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 4ffec46b19544c4bcb8cdb29687ed3e7 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Circ2d

Description
-----------
Transforms a circle with the transformation thet from class trsf2d.
") Transformed;
		gp_Circ2d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: f3112504d8f922313d0ee62e8d9fc9ad ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: b5317eef8c5eb533a9d7cdf7ad125b30 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Circ2d

Description
-----------
Translates a circle in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Circ2d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: b4de9d59960a4e23f6ea867b8b322e72 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Circ2d

Description
-----------
Translates a circle from the point thep1 to the point thep2.
") Translated;
		gp_Circ2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 6a005542df14e10d67ac38644cf8c7ae ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the x axis of the circle.
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: d49975ff0e9ed400148a36ac6e990919 ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the y axis of the circle. reverses the direction of the circle.
") YAxis;
		gp_Ax2d YAxis();

};



%extend gp_Circ2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Circ2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Circ2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Circ2d')
    }
};
%extend gp_Circ2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Cone *
****************/
class gp_Cone {
	public:
		/****************** gp_Cone ******************/
		/**** md5 signature: b6d070bebbb32c502a61aa7801e0630c ****/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite cone.
") gp_Cone;
		 gp_Cone();

		/****************** gp_Cone ******************/
		/**** md5 signature: e700abf14ef2e84cdcce0763e3581c75 ****/
		%feature("compactdefaultargs") gp_Cone;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theAng: float
theRadius: float

Return
-------
None

Description
-----------
Creates an infinite conical surface. thea3 locates the cone in the space and defines the reference plane of the surface. ang is the conical surface semi-angle. its absolute value is in range ]0, pi/2[. theradius is the radius of the circle in the reference plane of the cone. theraises constructionerror * if theradius is lower than 0.0 * abs(theang) < resolution from gp or abs(theang) >= (pi/2) - resolution.
") gp_Cone;
		 gp_Cone(const gp_Ax3 & theA3, const Standard_Real theAng, const Standard_Real theRadius);

		/****************** Apex ******************/
		/**** md5 signature: d7b0902898975a89c9e2f9cefaec36ca ****/
		%feature("compactdefaultargs") Apex;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Computes the cone's top. the apex of the cone is on the negative side of the symmetry axis of the cone.
") Apex;
		gp_Pnt Apex();

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the symmetry axis of the cone.
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: d2a72c55029fd5590f0555c1570db109 ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA1: float
theA2: float
theA3: float
theB1: float
theB2: float
theB3: float
theC1: float
theC2: float
theC3: float
theD: float

Description
-----------
Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system: thea1.x**2 + thea2.y**2 + thea3.z**2 + 2.(theb1.x.y + theb2.x.z + theb3.y.z) + 2.(thec1.x + thec2.y + thec3.z) + thed = 0.0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Direct ******************/
		/**** md5 signature: 2c90be540a5bf9418e7461f7f76c970a ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system of this cone is right-handed.
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 'location' point of the cone.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: cbe5109203fad1d4c7807df720ae3510 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Cone

Description
-----------
Performs the symmetrical transformation of a cone with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Cone Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 9551461ab09657ac426ef14abbd8117b ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Cone

Description
-----------
Performs the symmetrical transformation of a cone with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Cone Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 31a71e6d703a6fb53a2efbdb704cfc97 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Cone

Description
-----------
Performs the symmetrical transformation of a cone with respect to a plane. the axis placement thea2 locates the plane of the of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Cone Mirrored(const gp_Ax2 & theA2);

		/****************** Position ******************/
		/**** md5 signature: c702d3a208cf0124b56544ef1f5c6ae7 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of the cone.
") Position;
		const gp_Ax3 Position();

		/****************** RefRadius ******************/
		/**** md5 signature: 7c760bbba04ecba04bee3f9befd3d472 ****/
		%feature("compactdefaultargs") RefRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius of the cone in the reference plane.
") RefRadius;
		Standard_Real RefRadius();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 18c02f2c6bb85f857eb307865ca7a3d4 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Cone

Description
-----------
Rotates a cone. thea1 is the axis of the rotation. ang is the angular value of the rotation in radians.
") Rotated;
		gp_Cone Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: ded95bf35e2eb0d348dd042d271e0482 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Cone

Description
-----------
Scales a cone. thes is the scaling value. the absolute value of thes is used to scale the cone.
") Scaled;
		gp_Cone Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SemiAngle ******************/
		/**** md5 signature: b90df3237e3eb63a39e33c25e40f20e9 ****/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the half-angle at the apex of this cone. attention! semi-angle can be negative.
") SemiAngle;
		Standard_Real SemiAngle();

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Changes the symmetry axis of the cone. raises constructionerror the direction of thea1 is parallel to the 'xdirection' of the coordinate system of the cone.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: 549208ae587d601427fb98d16d4de1b7 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLoc: gp_Pnt

Return
-------
None

Description
-----------
Changes the location of the cone.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****************** SetPosition ******************/
		/**** md5 signature: c788767c1fc0ca73bdf3541037626780 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the cone. this coordinate system defines the reference plane of the cone.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****************** SetRadius ******************/
		/**** md5 signature: be4d106826d464b8bee7d31497e6c4fa ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theR: float

Return
-------
None

Description
-----------
Changes the radius of the cone in the reference plane of the cone. raised if ther < 0.0.
") SetRadius;
		void SetRadius(const Standard_Real theR);

		/****************** SetSemiAngle ******************/
		/**** md5 signature: 7e6b2e1ab39586e091cc91fcaa278add ****/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "
Parameters
----------
theAng: float

Return
-------
None

Description
-----------
Changes the semi-angle of the cone. semi-angle can be negative. its absolute value abs(theang) is in range ]0,pi/2[. raises constructionerror if abs(theang) < resolution from gp or abs(theang) >= pi/2 - resolution.
") SetSemiAngle;
		void SetSemiAngle(const Standard_Real theAng);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: a28c96c0fbd26a3345e156db03a9a7d2 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Cone

Description
-----------
Transforms a cone with the transformation thet from class trsf.
") Transformed;
		gp_Cone Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: b640628e0df004294e8da330dd44eb12 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Cone

Description
-----------
Translates a cone in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Cone Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: e24f6e660c03450062ef9dd35bfdaea5 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Cone

Description
-----------
Translates a cone from the point p1 to the point p2.
") Translated;
		gp_Cone Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** UReverse ******************/
		/**** md5 signature: b0197b2ee987c6cd2138becb024e1db6 ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the u parametrization of the cone reversing the yaxis.
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 4d0389515240266be0c86e204c81b7a9 ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the v parametrization of the cone reversing the zaxis.
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the xaxis of the reference plane.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the yaxis of the reference plane.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Cone {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Cone {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Cone()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Cone')
    }
};
%extend gp_Cone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class gp_Cylinder *
********************/
class gp_Cylinder {
	public:
		/****************** gp_Cylinder ******************/
		/**** md5 signature: 8f1b607b62f4244dcadf7da8ee8a2e7b ****/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a indefinite cylinder.
") gp_Cylinder;
		 gp_Cylinder();

		/****************** gp_Cylinder ******************/
		/**** md5 signature: 3f1d461b918ce280d6f9acdf73d030ac ****/
		%feature("compactdefaultargs") gp_Cylinder;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theRadius: float

Return
-------
None

Description
-----------
Creates a cylinder of radius radius, whose axis is the 'main axis' of thea3. thea3 is the local coordinate system of the cylinder. raises constructionerrord if theradius < 0.0.
") gp_Cylinder;
		 gp_Cylinder(const gp_Ax3 & theA3, const Standard_Real theRadius);

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the symmetry axis of the cylinder.
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: d2a72c55029fd5590f0555c1570db109 ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA1: float
theA2: float
theA3: float
theB1: float
theB2: float
theB3: float
theC1: float
theC2: float
theC3: float
theD: float

Description
-----------
Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinate system: thea1.x**2 + thea2.y**2 + thea3.z**2 + 2.(theb1.x.y + theb2.x.z + theb3.y.z) + 2.(thec1.x + thec2.y + thec3.z) + thed = 0.0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Direct ******************/
		/**** md5 signature: 2c90be540a5bf9418e7461f7f76c970a ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system of this cylinder is right-handed.
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 'location' point of the cylinder.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: b3b8bcc8e52427f3840236aeb22c44d9 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Cylinder

Description
-----------
Performs the symmetrical transformation of a cylinder with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Cylinder Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: aa220f6db82262db8dbcaf4ed3251d82 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Cylinder

Description
-----------
Performs the symmetrical transformation of a cylinder with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Cylinder Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 772db048eb0ab1d9aa42de45967d7865 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Cylinder

Description
-----------
Performs the symmetrical transformation of a cylinder with respect to a plane. the axis placement thea2 locates the plane of the of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Cylinder Mirrored(const gp_Ax2 & theA2);

		/****************** Position ******************/
		/**** md5 signature: c702d3a208cf0124b56544ef1f5c6ae7 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinate system of the cylinder.
") Position;
		const gp_Ax3 Position();

		/****************** Radius ******************/
		/**** md5 signature: e995997e31f334f223fb359fc7382a66 ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius of the cylinder.
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 77a62e39043ccbf7a6eaf6f0a1d67a2d ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Cylinder

Description
-----------
Rotates a cylinder. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Cylinder Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 60e4667e42fa586095855a01ec38e3a4 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Cylinder

Description
-----------
Scales a cylinder. thes is the scaling value. the absolute value of thes is used to scale the cylinder.
") Scaled;
		gp_Cylinder Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Changes the symmetry axis of the cylinder. raises constructionerror if the direction of thea1 is parallel to the 'xdirection' of the coordinate system of the cylinder.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: 549208ae587d601427fb98d16d4de1b7 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLoc: gp_Pnt

Return
-------
None

Description
-----------
Changes the location of the surface.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****************** SetPosition ******************/
		/**** md5 signature: c788767c1fc0ca73bdf3541037626780 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Change the local coordinate system of the surface.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****************** SetRadius ******************/
		/**** md5 signature: be4d106826d464b8bee7d31497e6c4fa ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theR: float

Return
-------
None

Description
-----------
Modifies the radius of this cylinder. exceptions standard_constructionerror if ther is negative.
") SetRadius;
		void SetRadius(const Standard_Real theR);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: ce75d4fe0235f160e5dd4ce49f738d90 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Cylinder

Description
-----------
Transforms a cylinder with the transformation thet from class trsf.
") Transformed;
		gp_Cylinder Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 585dd25d02ec5ab603fd709d73f1a7e3 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Cylinder

Description
-----------
Translates a cylinder in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Cylinder Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: af59955cb26a3edcf60dd5d7c873cd2f ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Cylinder

Description
-----------
Translates a cylinder from the point thep1 to the point thep2.
") Translated;
		gp_Cylinder Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** UReverse ******************/
		/**** md5 signature: b0197b2ee987c6cd2138becb024e1db6 ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the u parametrization of the cylinder reversing the yaxis.
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 4d0389515240266be0c86e204c81b7a9 ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the v parametrization of the plane reversing the axis.
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis x of the cylinder.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis y of the cylinder.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Cylinder {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Cylinder {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Cylinder()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Cylinder')
    }
};
%extend gp_Cylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Dir *
***************/
class gp_Dir {
	public:
		/****************** gp_Dir ******************/
		/**** md5 signature: 1edbf324978bb50abc26edeb4b49cdba ****/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a direction corresponding to x axis.
") gp_Dir;
		 gp_Dir();

		/****************** gp_Dir ******************/
		/**** md5 signature: 21a714861e74ba99163abb85e249cce5 ****/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Normalizes the vector thev and creates a direction. raises constructionerror if thev.magnitude() <= resolution.
") gp_Dir;
		 gp_Dir(const gp_Vec & theV);

		/****************** gp_Dir ******************/
		/**** md5 signature: 56ce350128f2f593f7d9a56b5a2e9b43 ****/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Creates a direction from a triplet of coordinates. raises constructionerror if thecoord.modulus() <= resolution from gp.
") gp_Dir;
		 gp_Dir(const gp_XYZ & theCoord);

		/****************** gp_Dir ******************/
		/**** md5 signature: 202c475186ed9c8701fb5dc0fd25df4c ****/
		%feature("compactdefaultargs") gp_Dir;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float
theZv: float

Return
-------
None

Description
-----------
Creates a direction with its 3 cartesian coordinates. raises constructionerror if sqrt(thexv*thexv + theyv*theyv + thezv*thezv) <= resolution modification of the direction's coordinates if sqrt (thexv*thexv + theyv*theyv + thezv*thezv) <= resolution from gp where thexv, theyv ,thezv are the new coordinates it is not possible to construct the direction and the method raises the exception constructionerror.
") gp_Dir;
		 gp_Dir(const Standard_Real theXv, const Standard_Real theYv, const Standard_Real theZv);

		/****************** Angle ******************/
		/**** md5 signature: 3dfd4b61ad4ff6bee13db5f96bd876fa ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir

Return
-------
float

Description
-----------
Computes the angular value in radians between <self> and <theother>. this value is always positive in 3d space. returns the angle in the range [0, pi].
") Angle;
		Standard_Real Angle(const gp_Dir & theOther);

		/****************** AngleWithRef ******************/
		/**** md5 signature: 896d291c18b5687fde595bb723dd4f8c ****/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theVRef: gp_Dir

Return
-------
float

Description
-----------
Computes the angular value between <self> and <theother>. <thevref> is the direction of reference normal to <self> and <theother> and its orientation gives the positive sense of rotation. if the cross product <self> ^ <theother> has the same orientation as <thevref> the angular value is positive else negative. returns the angular value in the range -pi and pi (in radians). raises domainerror if <self> and <theother> are not parallel this exception is raised when <thevref> is in the same plane as <self> and <theother> the tolerance criterion is resolution from package gp.
") AngleWithRef;
		Standard_Real AngleWithRef(const gp_Dir & theOther, const gp_Dir & theVRef);

		/****************** Coord ******************/
		/**** md5 signature: 8be7c51c8cc2bc59521f97740b0be5d2 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns the coordinate of range theindex: theindex = 1 => x is returned ithendex = 2 => y is returned theindex = 3 => z is returned exceptions standard_outofrange if theindex is not 1, 2, or 3.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: 8826aee800a33929cf4796869323f263 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: float
theYv: float
theZv: float

Description
-----------
Returns for the unit vector its three coordinates thexv, theyv, and thezv.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Cross ******************/
		/**** md5 signature: 2b8aefee587854039c24451b2abf8fa4 ****/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Dir

Return
-------
None

Description
-----------
Computes the cross product between two directions raises the exception constructionerror if the two directions are parallel because the computed vector cannot be normalized to create a direction.
") Cross;
		void Cross(const gp_Dir & theRight);

		/****************** CrossCross ******************/
		/**** md5 signature: f6b6a9d2311fc43840795c9682393185 ****/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Dir
theV2: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") CrossCross;
		void CrossCross(const gp_Dir & theV1, const gp_Dir & theV2);

		/****************** CrossCrossed ******************/
		/**** md5 signature: 88aa8ae5ddc2c28e4915705a64f79263 ****/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Dir
theV2: gp_Dir

Return
-------
gp_Dir

Description
-----------
Computes the double vector product this ^ (thev1 ^ thev2). - crosscrossed creates a new unit vector. exceptions standard_constructionerror if: - thev1 and thev2 are parallel, or - this unit vector and (thev1 ^ thev2) are parallel. this is because, in these conditions, the computed vector is null and cannot be normalized.
") CrossCrossed;
		gp_Dir CrossCrossed(const gp_Dir & theV1, const gp_Dir & theV2);

		/****************** Crossed ******************/
		/**** md5 signature: 710977198ee7ef82dc6f345ad770e0b3 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Dir

Return
-------
gp_Dir

Description
-----------
Computes the triple vector product. <self> ^ (v1 ^ v2) raises the exception constructionerror if v1 and v2 are parallel or <self> and (v1^v2) are parallel because the computed vector can't be normalized to create a direction.
") Crossed;
		gp_Dir Crossed(const gp_Dir & theRight);

		/****************** Dot ******************/
		/**** md5 signature: a9634ba44292ef8c97d6b4f09f82b7c8 ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir

Return
-------
float

Description
-----------
Computes the scalar product.
") Dot;
		Standard_Real Dot(const gp_Dir & theOther);

		/****************** DotCross ******************/
		/**** md5 signature: 0f679ac2a7ff5b2252b6fa4ae496b723 ****/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Dir
theV2: gp_Dir

Return
-------
float

Description
-----------
Computes the triple scalar product <self> * (thev1 ^ thev2). warnings: the computed vector thev1' = thev1 ^ thev2 is not normalized to create a unitary vector. so this method never raises an exception even if thev1 and thev2 are parallel.
") DotCross;
		Standard_Real DotCross(const gp_Dir & theV1, const gp_Dir & theV2);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****************** IsEqual ******************/
		/**** md5 signature: 53cc72d7d7a896d7782050052620e1b5 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the angle between the two directions is lower or equal to theangulartolerance.
") IsEqual;
		Standard_Boolean IsEqual(const gp_Dir & theOther, const Standard_Real theAngularTolerance);

		/****************** IsNormal ******************/
		/**** md5 signature: 80f33349d6b58dd4c8e5bcbc811ebab0 ****/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the angle between this unit vector and the unit vector theother is equal to pi/2 (normal).
") IsNormal;
		Standard_Boolean IsNormal(const gp_Dir & theOther, const Standard_Real theAngularTolerance);

		/****************** IsOpposite ******************/
		/**** md5 signature: 755bfacd29e561350dc3c5bef35e03c2 ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the angle between this unit vector and the unit vector theother is equal to pi (opposite).
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Dir & theOther, const Standard_Real theAngularTolerance);

		/****************** IsParallel ******************/
		/**** md5 signature: 62de0b2d68bf3207fc745e91ead9c912 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the angle between this unit vector and the unit vector theother is equal to 0 or to pi. note: the tolerance criterion is given by theangulartolerance.
") IsParallel;
		Standard_Boolean IsParallel(const gp_Dir & theOther, const Standard_Real theAngularTolerance);

		/****************** Mirror ******************/
		/**** md5 signature: 6db0d30dcf5c1699a49bac7b1cb31b2f ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Dir & theV);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: af3aaed52fea7233ccac5f0e53b2d534 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
gp_Dir

Description
-----------
Performs the symmetrical transformation of a direction with respect to the direction thev which is the center of the symmetry.
") Mirrored;
		gp_Dir Mirrored(const gp_Dir & theV);

		/****************** Mirrored ******************/
		/**** md5 signature: b1dd77a457e84ff0204e984a466c1b36 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Dir

Description
-----------
Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Dir Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: e23940a2e9d428486047147084df4419 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Dir

Description
-----------
Performs the symmetrical transformation of a direction with respect to a plane. the axis placement thea2 locates the plane of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Dir Mirrored(const gp_Ax2 & theA2);

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 72546023e7c290588aa10d84513cf041 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Reverses the orientation of a direction geometric transformations performs the symmetrical transformation of a direction with respect to the direction v which is the center of the symmetry.].
") Reversed;
		gp_Dir Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: c26ecb0fe9ed773c4bd2ec6af298bfe8 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: c7021f15b6e1b7e84dc728c5e9691937 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Dir

Description
-----------
Rotates a direction. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Dir Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** SetCoord ******************/
		/**** md5 signature: 51dfb5414e684d5e3fb64936cddfe52a ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
For this unit vector, assigns the value xi to: - the x coordinate if theindex is 1, or - the y coordinate if theindex is 2, or - the z coordinate if theindex is 3, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_outofrange if theindex is not 1, 2, or 3. standard_constructionerror if either of the following is less than or equal to gp::resolution(): - sqrt(xv*xv + yv*yv + zv*zv), or - the modulus of the number triple formed by the new value thexi and the two other coordinates of this vector that were not directly modified.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetCoord ******************/
		/**** md5 signature: d8c01d5f045eb0ea7e7f7929aff413e1 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float
theZv: float

Return
-------
None

Description
-----------
For this unit vector, assigns the values thexv, theyv and thezv to its three coordinates. remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly.
") SetCoord;
		void SetCoord(const Standard_Real theXv, const Standard_Real theYv, const Standard_Real theZv);

		/****************** SetX ******************/
		/**** md5 signature: f3cd97f87d5040161e63868de7881e51 ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this unit vector.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetXYZ ******************/
		/**** md5 signature: c58ce5cf8961f1f4c1e0692fca105757 ****/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of thecoord to this unit vector.
") SetXYZ;
		void SetXYZ(const gp_XYZ & theCoord);

		/****************** SetY ******************/
		/**** md5 signature: 1b17264cab404d1d30abbb3bb23a94d1 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the y coordinate of this unit vector.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** SetZ ******************/
		/**** md5 signature: 439e9c9ff63136667248c6e20f0c8ab4 ****/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: float

Return
-------
None

Description
-----------
Assigns the given value to the z coordinate of this unit vector.
") SetZ;
		void SetZ(const Standard_Real theZ);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: d92ccaf5eb2d8f610be5c41a259fbbdd ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Dir

Description
-----------
Transforms a direction with a 'trsf' from gp. warnings: if the scale factor of the 'trsf' thet is negative then the direction <self> is reversed.
") Transformed;
		gp_Dir Transformed(const gp_Trsf & theT);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the x coordinate for a unit vector.
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		/**** md5 signature: 0648fd358f9622b8fa775d64dec0d0a4 ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
For this unit vector, returns its three coordinates as a number triplea.
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the y coordinate for a unit vector.
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 786e228d2eeaf64f99dd51d3ab338f77 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the z coordinate for a unit vector.
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: 5ed4c3cb5e90efe09abe02b91b30339e ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir

Return
-------
float

Description
-----------
No available documentation.
") operator *;
		Standard_Real operator *(const gp_Dir & theOther);

		/****************** operator - ******************/
		/**** md5 signature: edcd14a5e53746d4bdebf14f5cb01e64 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") operator -;
		gp_Dir operator -();

};



%extend gp_Dir {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Dir {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Dir()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Dir')
    }
};
%extend gp_Dir {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Dir2d *
*****************/
class gp_Dir2d {
	public:
		/****************** gp_Dir2d ******************/
		/**** md5 signature: 73646d5f15e04074cb632864bc85c116 ****/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a direction corresponding to x axis.
") gp_Dir2d;
		 gp_Dir2d();

		/****************** gp_Dir2d ******************/
		/**** md5 signature: 5d55d48c93f0c807eb2060d98865cef1 ****/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Normalizes the vector thev and creates a direction. raises constructionerror if thev.magnitude() <= resolution from gp.
") gp_Dir2d;
		 gp_Dir2d(const gp_Vec2d & theV);

		/****************** gp_Dir2d ******************/
		/**** md5 signature: 184d1480ee5b1f25817ed4519e0d0b88 ****/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Creates a direction from a doublet of coordinates. raises constructionerror if thecoord.modulus() <= resolution from gp.
") gp_Dir2d;
		 gp_Dir2d(const gp_XY & theCoord);

		/****************** gp_Dir2d ******************/
		/**** md5 signature: 175a9846209616dab97fe0a527452c57 ****/
		%feature("compactdefaultargs") gp_Dir2d;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float

Return
-------
None

Description
-----------
Creates a direction with its 2 cartesian coordinates. raises constructionerror if sqrt(thexv*thexv + theyv*theyv) <= resolution from gp.
") gp_Dir2d;
		 gp_Dir2d(const Standard_Real theXv, const Standard_Real theYv);

		/****************** Angle ******************/
		/**** md5 signature: 4d52d0c2519d785e1d839acb07eafefc ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d

Return
-------
float

Description
-----------
Computes the angular value in radians between <self> and <theother>. returns the angle in the range [-pi, pi].
") Angle;
		Standard_Real Angle(const gp_Dir2d & theOther);

		/****************** Coord ******************/
		/**** md5 signature: 8be7c51c8cc2bc59521f97740b0be5d2 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
For this unit vector returns the coordinate of range theindex: theindex = 1 => x is returned theindex = 2 => y is returned raises outofrange if theindex != {1, 2}.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: cd6b81aa323a641be1b7710b8f29c3b9 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: float
theYv: float

Description
-----------
For this unit vector returns its two coordinates thexv and theyv. raises outofrange if theindex != {1, 2}.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Crossed ******************/
		/**** md5 signature: f5c73aa81b0c0ca65d5a3bd21c7e3ff8 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Dir2d

Return
-------
float

Description
-----------
Computes the cross product between two directions.
") Crossed;
		Standard_Real Crossed(const gp_Dir2d & theRight);

		/****************** Dot ******************/
		/**** md5 signature: 40ac0213b71165dabcd2d3d5e8ebc34c ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d

Return
-------
float

Description
-----------
Computes the scalar product.
") Dot;
		Standard_Real Dot(const gp_Dir2d & theOther);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** IsEqual ******************/
		/**** md5 signature: b5427191c2417e466f0abc9501d51e95 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the two vectors have the same direction i.e. the angle between this unit vector and the unit vector theother is less than or equal to theangulartolerance.
") IsEqual;
		Standard_Boolean IsEqual(const gp_Dir2d & theOther, const Standard_Real theAngularTolerance);

		/****************** IsNormal ******************/
		/**** md5 signature: e01a0943735b085e40fa045a2516caec ****/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the angle between this unit vector and the unit vector theother is equal to pi/2 or -pi/2 (normal) i.e. abs(abs(<self>.angle(theother)) - pi/2.) <= theangulartolerance.
") IsNormal;
		Standard_Boolean IsNormal(const gp_Dir2d & theOther, const Standard_Real theAngularTolerance);

		/****************** IsOpposite ******************/
		/**** md5 signature: 23005c101f62e36293198b630fd624ea ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the angle between this unit vector and the unit vector theother is equal to pi or -pi (opposite). i.e. pi - abs(<self>.angle(theother)) <= theangulartolerance.
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Dir2d & theOther, const Standard_Real theAngularTolerance);

		/****************** IsParallel ******************/
		/**** md5 signature: 16e25d3a526d69046f65c2f97eb925e3 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the angle between this unit vector and unit vector theother is equal to 0, pi or -pi. i.e. abs(angle(<self>, theother)) <= theangulartolerance or pi - abs(angle(<self>, theother)) <= theangulartolerance.
") IsParallel;
		Standard_Boolean IsParallel(const gp_Dir2d & theOther, const Standard_Real theAngularTolerance);

		/****************** Mirror ******************/
		/**** md5 signature: 0de8d4517fd94a07dc6631a1a9f3fb0b ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Dir2d & theV);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** Mirrored ******************/
		/**** md5 signature: fc4b7047afb1c26df81e5bfda8d338ec ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
gp_Dir2d

Description
-----------
Performs the symmetrical transformation of a direction with respect to the direction thev which is the center of the symmetry.
") Mirrored;
		gp_Dir2d Mirrored(const gp_Dir2d & theV);

		/****************** Mirrored ******************/
		/**** md5 signature: cb8a6d4edeb1a778592299e887fc6808 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Dir2d

Description
-----------
Performs the symmetrical transformation of a direction with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Dir2d Mirrored(const gp_Ax2d & theA);

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: fccb82eb4718486351f38df82a035390 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Reverses the orientation of a direction.
") Reversed;
		gp_Dir2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 1f5728589a1f78e2418cd03d8bfa9e86 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
Ang: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const Standard_Real Ang);

		/****************** Rotated ******************/
		/**** md5 signature: 7dee3a6ed00152a0822a84c53542ff87 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theAng: float

Return
-------
gp_Dir2d

Description
-----------
Rotates a direction. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Dir2d Rotated(const Standard_Real theAng);

		/****************** SetCoord ******************/
		/**** md5 signature: 51dfb5414e684d5e3fb64936cddfe52a ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
For this unit vector, assigns: the value thexi to: - the x coordinate if theindex is 1, or - the y coordinate if theindex is 2, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_outofrange if theindex is not 1 or 2. standard_constructionerror if either of the following is less than or equal to gp::resolution(): - sqrt(thexv*thexv + theyv*theyv), or - the modulus of the number pair formed by the new value thexi and the other coordinate of this vector that was not directly modified. raises outofrange if theindex != {1, 2}.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetCoord ******************/
		/**** md5 signature: 5576a88d2236652db8a311240e872c92 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float

Return
-------
None

Description
-----------
For this unit vector, assigns: - the values thexv and theyv to its two coordinates, warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_outofrange if theindex is not 1 or 2. standard_constructionerror if either of the following is less than or equal to gp::resolution(): - sqrt(thexv*thexv + theyv*theyv), or - the modulus of the number pair formed by the new value xi and the other coordinate of this vector that was not directly modified. raises outofrange if theindex != {1, 2}.
") SetCoord;
		void SetCoord(const Standard_Real theXv, const Standard_Real theYv);

		/****************** SetX ******************/
		/**** md5 signature: f3cd97f87d5040161e63868de7881e51 ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this unit vector, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_constructionerror if either of the following is less than or equal to gp::resolution(): - the modulus of coord, or - the modulus of the number pair formed from the new x or y coordinate and the other coordinate of this vector that was not directly modified.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetXY ******************/
		/**** md5 signature: c3c2b54c737958a90a247fc8e9c50dc2 ****/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Assigns: - the two coordinates of thecoord to this unit vector, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_constructionerror if either of the following is less than or equal to gp::resolution(): - the modulus of thecoord, or - the modulus of the number pair formed from the new x or y coordinate and the other coordinate of this vector that was not directly modified.
") SetXY;
		void SetXY(const gp_XY & theCoord);

		/****************** SetY ******************/
		/**** md5 signature: 1b17264cab404d1d30abbb3bb23a94d1 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the y coordinate of this unit vector, and then normalizes it. warning remember that all the coordinates of a unit vector are implicitly modified when any single one is changed directly. exceptions standard_constructionerror if either of the following is less than or equal to gp::resolution(): - the modulus of coord, or - the modulus of the number pair formed from the new x or y coordinate and the other coordinate of this vector that was not directly modified.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: b7935945b3d8e1941fdf3aa2d19c19fd ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Dir2d

Description
-----------
Transforms a direction with the 'trsf' thet. warnings: if the scale factor of the 'trsf' thet is negative then the direction <self> is reversed.
") Transformed;
		gp_Dir2d Transformed(const gp_Trsf2d & theT);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this unit vector, returns its x coordinate.
") X;
		Standard_Real X();

		/****************** XY ******************/
		/**** md5 signature: 8129e296b053b8847fa5f009e7848507 ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this unit vector, returns its two coordinates as a number pair. comparison between directions the precision value is an input data.
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this unit vector, returns its y coordinate.
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		/**** md5 signature: 3adae3bbe9646320cbc1362f863f1031 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Dir2d

Return
-------
float

Description
-----------
No available documentation.
") operator *;
		Standard_Real operator *(const gp_Dir2d & theOther);

		/****************** operator - ******************/
		/**** md5 signature: d02d0251cfab53caf477f39aaaf94353 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") operator -;
		gp_Dir2d operator -();

};



%extend gp_Dir2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Dir2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Dir2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Dir2d')
    }
};
%extend gp_Dir2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Elips *
*****************/
class gp_Elips {
	public:
		/****************** gp_Elips ******************/
		/**** md5 signature: 4380d7ccbc733459a106a4ac839ca157 ****/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite ellipse.
") gp_Elips;
		 gp_Elips();

		/****************** gp_Elips ******************/
		/**** md5 signature: 7e0836115d9e0289c6f68a1e03b7539b ****/
		%feature("compactdefaultargs") gp_Elips;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theMajorRadius: float
theMinorRadius: float

Return
-------
None

Description
-----------
The major radius of the ellipse is on the 'xaxis' and the minor radius is on the 'yaxis' of the ellipse. the 'xaxis' is defined with the 'xdirection' of thea2 and the 'yaxis' is defined with the 'ydirection' of thea2. warnings: it is not forbidden to create an ellipse with themajorradius = theminorradius. raises constructionerror if themajorradius < theminorradius or theminorradius < 0.
") gp_Elips;
		 gp_Elips(const gp_Ax2 & theA2, const Standard_Real theMajorRadius, const Standard_Real theMinorRadius);

		/****************** Area ******************/
		/**** md5 signature: c02bdde385c5c793a22800891df9b9cd ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the area of the ellipse.
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes the axis normal to the plane of the ellipse.
") Axis;
		const gp_Ax1 Axis();

		/****************** Directrix1 ******************/
		/**** md5 signature: 10272c6052549861204070aa44f046a5 ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes the first or second directrix of this ellipse. these are the lines, in the plane of the ellipse, normal to the major axis, at a distance equal to majorradius/e from the center of the ellipse, where e is the eccentricity of the ellipse. the first directrix (directrix1) is on the positive side of the major axis. the second directrix (directrix2) is on the negative side. the directrix is returned as an axis (gp_ax1 object), the origin of which is situated on the 'x axis' of the local coordinate system of this ellipse. exceptions standard_constructionerror if the eccentricity is null (the ellipse has degenerated into a circle).
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 88339a214155f2a41d76691fd00c9167 ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the ellipse. exceptions standard_constructionerror if the eccentricity is null (the ellipse has degenerated into a circle).
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: 78de488c9cbac7c761a28f28e3d39522 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. raises constructionerror if majorradius = 0.0.
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: aeac7f567b991e94a3e75e9ed626f41a ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the focal distance. it is the distance between the two focus focus1 and focus2 of the ellipse.
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: 44668390e44007b6344ae1f20fcc3003 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the first focus of the ellipse. this focus is on the positive side of the 'xaxis' of the ellipse.
") Focus1;
		gp_Pnt Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: 19e89a037d2bd912a8348a9c245bd935 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the second focus of the ellipse. this focus is on the negative side of the 'xaxis' of the ellipse.
") Focus2;
		gp_Pnt Focus2();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the center of the ellipse. it is the 'location' point of the coordinate system of the ellipse.
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: 128082d838650d89e5451fc2ec2cdd95 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius of the ellipse.
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: 5a903e1e296cb85037297fddc27e2870 ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minor radius of the ellipse.
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: 8b24c40e2792cb5f3615b7b9c92093b0 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Elips

Description
-----------
Performs the symmetrical transformation of an ellipse with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Elips Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 7836cabf078d820a4b5e8716338e620d ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Elips

Description
-----------
Performs the symmetrical transformation of an ellipse with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Elips Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 70283daeaf7c826589fd28e3e212fd26 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Elips

Description
-----------
Performs the symmetrical transformation of an ellipse with respect to a plane. the axis placement thea2 locates the plane of the symmetry (location, xdirection, ydirection).
") Mirrored;
		gp_Elips Mirrored(const gp_Ax2 & theA2);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		/**** md5 signature: 0919c787263d4f8ff9c1e18688f5d16c ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the coordinate system of the ellipse.
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 0792359391f0755fefa2c1e576305ded ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Elips

Description
-----------
Rotates an ellipse. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Elips Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 236c98b0aac35efb67ced9e87538e03e ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Elips

Description
-----------
Scales an ellipse. thes is the scaling value.
") Scaled;
		gp_Elips Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Changes the axis normal to the plane of the ellipse. it modifies the definition of this plane. the 'xaxis' and the 'yaxis' are recomputed. the local coordinate system is redefined so that: - its origin and 'main direction' become those of the axis thea1 (the 'x direction' and 'y direction' are then recomputed in the same way as for any gp_ax2), or raises constructionerror if the direction of thea1 is parallel to the direction of the 'xaxis' of the ellipse.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate so that its origin becomes thep.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 847f370a77fa02a8bf45fa2b00b28b74 ****/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: float

Return
-------
None

Description
-----------
The major radius of the ellipse is on the 'xaxis' (major axis) of the ellipse. raises constructionerror if themajorradius < minorradius.
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real theMajorRadius);

		/****************** SetMinorRadius ******************/
		/**** md5 signature: 2bb295e6e4f7e9ad627ec256d511ddce ****/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: float

Return
-------
None

Description
-----------
The minor radius of the ellipse is on the 'yaxis' (minor axis) of the ellipse. raises constructionerror if theminorradius > majorradius or minorradius < 0.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real theMinorRadius);

		/****************** SetPosition ******************/
		/**** md5 signature: ebc7dd35ccc08a819f6ac865a49dfe89 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate so that it becomes thea2.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 7ef491940db1b91e1d267dca992ce77e ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Elips

Description
-----------
Transforms an ellipse with the transformation thet from class trsf.
") Transformed;
		gp_Elips Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 184afdc0a24b28efeda1945db1bfcf9a ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Elips

Description
-----------
Translates an ellipse in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Elips Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: a1c61fb631c7ccd675b602a1bb41ba88 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Elips

Description
-----------
Translates an ellipse from the point thep1 to the point thep2.
") Translated;
		gp_Elips Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'xaxis' of the ellipse whose origin is the center of this ellipse. it is the major axis of the ellipse.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the 'yaxis' of the ellipse whose unit vector is the 'x direction' or the 'y direction' of the local coordinate system of this ellipse. this is the minor axis of the ellipse.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Elips {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Elips {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Elips()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Elips')
    }
};
%extend gp_Elips {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_Elips2d *
*******************/
class gp_Elips2d {
	public:
		/****************** gp_Elips2d ******************/
		/**** md5 signature: 155a4b0babb698b6ce195f260509b0cf ****/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite ellipse.
") gp_Elips2d;
		 gp_Elips2d();

		/****************** gp_Elips2d ******************/
		/**** md5 signature: 104a95751748857ca6a90d8ee44b6ed6 ****/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "
Parameters
----------
theMajorAxis: gp_Ax2d
theMajorRadius: float
theMinorRadius: float
theIsSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates an ellipse with the major axis, the major and the minor radius. the location of the themajoraxis is the center of the ellipse. the sense of parametrization is given by theissense. warnings: it is possible to create an ellipse with themajorradius = theminorradius. raises constructionerror if themajorradius < theminorradius or theminorradius < 0.0.
") gp_Elips2d;
		 gp_Elips2d(const gp_Ax2d & theMajorAxis, const Standard_Real theMajorRadius, const Standard_Real theMinorRadius, const Standard_Boolean theIsSense = Standard_True);

		/****************** gp_Elips2d ******************/
		/**** md5 signature: 4733a3ea1ba6f34c3dbc9d79a612c381 ****/
		%feature("compactdefaultargs") gp_Elips2d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d
theMajorRadius: float
theMinorRadius: float

Return
-------
None

Description
-----------
Creates an ellipse with radii majorradius and minorradius, positioned in the plane by coordinate system thea where: - the origin of thea is the center of the ellipse, - the 'x direction' of thea defines the major axis of the ellipse, that is, the major radius majorradius is measured along this axis, and - the 'y direction' of thea defines the minor axis of the ellipse, that is, the minor radius theminorradius is measured along this axis, and - the orientation (direct or indirect sense) of thea gives the orientation of the ellipse. warnings: it is possible to create an ellipse with themajorradius = theminorradius. raises constructionerror if themajorradius < theminorradius or theminorradius < 0.0.
") gp_Elips2d;
		 gp_Elips2d(const gp_Ax22d & theA, const Standard_Real theMajorRadius, const Standard_Real theMinorRadius);

		/****************** Area ******************/
		/**** md5 signature: c02bdde385c5c793a22800891df9b9cd ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the area of the ellipse.
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: 094e5176aca7cccfc018310a1bba741f ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the major axis of the ellipse.
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: cc309b22e72d7a2fa63d9f3b74f48eaa ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: float
theB: float
theC: float
theD: float
theE: float
theF: float

Description
-----------
Returns the coefficients of the implicit equation of the ellipse. thea * (x**2) + theb * (y**2) + 2*thec*(x*y) + 2*thed*x + 2*thee*y + thef = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Directrix1 ******************/
		/**** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This directrix is the line normal to the xaxis of the ellipse in the local plane (z = 0) at a distance d = majorradius / e from the center of the ellipse, where e is the eccentricity of the ellipse. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the location point of the directrix1. this point is on the positive side of the 'xaxis'. //! raised if eccentricity = 0.0. (the ellipse degenerates into a circle).
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 6932241de7dde0eb204208e30fe6363c ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This line is obtained by the symmetrical transformation of 'directrix1' with respect to the minor axis of the ellipse. //! raised if eccentricity = 0.0. (the ellipse degenerates into a circle).
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: 78de488c9cbac7c761a28f28e3d39522 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. returns 0 if majorradius = 0.
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: aeac7f567b991e94a3e75e9ed626f41a ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance between the center of the ellipse and focus1 or focus2.
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: dccbe483b29092eb91431c64e1c5bcd9 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the first focus of the ellipse. this focus is on the positive side of the major axis of the ellipse.
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: ca24694273a9069fddac1db8a37c6c68 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the second focus of the ellipse. this focus is on the negative side of the major axis of the ellipse.
") Focus2;
		gp_Pnt2d Focus2();

		/****************** IsDirect ******************/
		/**** md5 signature: 218f7b7b68e34847c5868fa318c903a4 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		/**** md5 signature: 0e4556028ba61472400043e40317f1e2 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the center of the ellipse.
") Location;
		const gp_Pnt2d Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: 128082d838650d89e5451fc2ec2cdd95 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius of the ellipse.
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: 5a903e1e296cb85037297fddc27e2870 ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minor radius of the ellipse.
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: 5f85e7eebe220829e022319813e0b5b1 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** Mirrored ******************/
		/**** md5 signature: 60527efe18dbad27e008dbff9d91fc0e ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Elips2d

Description
-----------
Performs the symmetrical transformation of a ellipse with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Elips2d Mirrored(const gp_Pnt2d & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 8c54a1113521347fa4aaedb21c91a4b1 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Elips2d

Description
-----------
Performs the symmetrical transformation of a ellipse with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Elips2d Mirrored(const gp_Ax2d & theA);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.
") Parameter;
		Standard_Real Parameter();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 646a9705a5846951deabdef03f9d5f58 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Reversed;
		gp_Elips2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 4514855f978c37f3ce31a9851c5a1153 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 50cc3159fd8184ef67fb8bb98c7f123d ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Rotated;
		gp_Elips2d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: c464bf78519bd3beeec5dd2bb7f74ab0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 07ecda9fdba85d9ffde32019882c9e71 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Elips2d

Description
-----------
Scales a ellipse. thes is the scaling value.
") Scaled;
		gp_Elips2d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: fba67a5039095eddccca14c1039ad8be ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate system so that it becomes thea.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****************** SetLocation ******************/
		/**** md5 signature: fea6486624f66c26e32103313f4d0c00 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate system so that - its origin becomes thep.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 847f370a77fa02a8bf45fa2b00b28b74 ****/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: float

Return
-------
None

Description
-----------
Changes the value of the major radius. raises constructionerror if themajorradius < minorradius.
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real theMajorRadius);

		/****************** SetMinorRadius ******************/
		/**** md5 signature: 2bb295e6e4f7e9ad627ec256d511ddce ****/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: float

Return
-------
None

Description
-----------
Changes the value of the minor radius. raises constructionerror if majorradius < theminorradius or minorradius < 0.0.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real theMinorRadius);

		/****************** SetXAxis ******************/
		/**** md5 signature: 8cea815a914afe135b1603dc856a8a22 ****/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'x direction' become those of the axis thea. the 'y direction' is then recomputed. the orientation of the local coordinate system is not modified.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA);

		/****************** SetYAxis ******************/
		/**** md5 signature: f60887b297962c8ebfb061925ba2853e ****/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Modifies this ellipse, by redefining its local coordinate system so that its origin and its 'y direction' become those of the axis thea. the 'x direction' is then recomputed. the orientation of the local coordinate system is not modified.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: df82bc60f4eb101b33cd2eeff2197ace ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Elips2d

Description
-----------
Transforms an ellipse with the transformation thet from class trsf2d.
") Transformed;
		gp_Elips2d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: f3112504d8f922313d0ee62e8d9fc9ad ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 74f028e64963dcfec3021383f873b0dd ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Elips2d

Description
-----------
Translates a ellipse in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Elips2d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: 399c975e74ebf2699ade64b57c9f3507 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Elips2d

Description
-----------
Translates a ellipse from the point thep1 to the point thep2.
") Translated;
		gp_Elips2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 6a005542df14e10d67ac38644cf8c7ae ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the major axis of the ellipse.
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: d49975ff0e9ed400148a36ac6e990919 ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the minor axis of the ellipse. reverses the direction of the circle.
") YAxis;
		gp_Ax2d YAxis();

};



%extend gp_Elips2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Elips2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Elips2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Elips2d')
    }
};
%extend gp_Elips2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_GTrsf *
*****************/
class gp_GTrsf {
	public:
		/****************** gp_GTrsf ******************/
		/**** md5 signature: 95c0c38b9f03c9859a223bcf21fb9a43 ****/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns the identity transformation.
") gp_GTrsf;
		 gp_GTrsf();

		/****************** gp_GTrsf ******************/
		/**** md5 signature: ae237a5e098c311e31a76c1158b07cf5 ****/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Converts the gp_trsf transformation thet into a general transformation, i.e. returns a gtrsf with the same matrix of coefficients as the trsf thet.
") gp_GTrsf;
		 gp_GTrsf(const gp_Trsf & theT);

		/****************** gp_GTrsf ******************/
		/**** md5 signature: b996e6f23aebecad739973d50a34c7e1 ****/
		%feature("compactdefaultargs") gp_GTrsf;
		%feature("autodoc", "
Parameters
----------
theM: gp_Mat
theV: gp_XYZ

Return
-------
None

Description
-----------
Creates a transformation based on the matrix them and the vector thev where them defines the vectorial part of the transformation, and v the translation part, or.
") gp_GTrsf;
		 gp_GTrsf(const gp_Mat & theM, const gp_XYZ & theV);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** Form ******************/
		/**** md5 signature: f29bb1eb1523b456c279366338ab9947 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, a compound transformation or some other type of transformation.
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 20e104c1b972c0dc0ea5c50b20cfe6a4 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Computes the reverse transformation. raises an exception if the matrix of the transformation is not inversible.
") Inverted;
		gp_GTrsf Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 4a3d241c868ecfc4b59898855c5acee1 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative.
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** IsSingular ******************/
		/**** md5 signature: 03390e58a75dab9eea1f879d1c62f432 ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this transformation is singular (and therefore, cannot be inverted). note: the gauss lu decomposition is used to invert the transformation matrix. consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::resolution(). warning if this transformation is singular, it cannot be inverted.
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: 0412af175c722164d2eec0421acb3f6a ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
gp_GTrsf

Description
-----------
Computes the transformation composed from thet and <self>. in a c++ implementation you can also write tcomposed = <self> * thet. example: @code gp_gtrsf t1, t2, tcomp; ............... //composition: tcomp = t2.multiplied(t1); // or (tcomp = t2 * t1) // transformation of a point gp_xyz p(10.,3.,4.); gp_xyz p1(p); tcomp.transforms(p1); //using tcomp gp_xyz p2(p); t1.transforms(p2); //using t1 then t2 t2.transforms(p2); // p1 = p2 !!! @endcode.
") Multiplied;
		gp_GTrsf Multiplied(const gp_GTrsf & theT);

		/****************** Multiply ******************/
		/**** md5 signature: a247a1bee447b3badb823f0105999e27 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
None

Description
-----------
Computes the transformation composed with <self> and thet. <self> = <self> * thet.
") Multiply;
		void Multiply(const gp_GTrsf & theT);

		/****************** Power ******************/
		/**** md5 signature: fe226a66f073d604b8a0d81d41f1ca71 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const Standard_Integer theN);

		/****************** Powered ******************/
		/**** md5 signature: ef7ab5f78abe60a41c73c5f3c0373675 ****/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_GTrsf

Description
-----------
Computes: - the product of this transformation multiplied by itself then times, if then is positive, or - the product of the inverse of this transformation multiplied by itself |then| times, if then is negative. if then equals zero, the result is equal to the identity transformation. i.e.: <self> * <self> * .......* <self>, then time. if then =0 <self> = identity if then < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises an exception if n < 0 and if the matrix of the transformation not inversible.
") Powered;
		gp_GTrsf Powered(const Standard_Integer theN);

		/****************** PreMultiply ******************/
		/**** md5 signature: 520cdca00681b657332883d57c2939cb ****/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
None

Description
-----------
Computes the product of the transformation thet and this transformation and assigns the result to this transformation. this = thet * this.
") PreMultiply;
		void PreMultiply(const gp_GTrsf & theT);

		/****************** SetAffinity ******************/
		/**** md5 signature: 6915b232e91b960064122c1963417a26 ****/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theRatio: float

Return
-------
None

Description
-----------
Changes this transformation into an affinity of ratio theratio with respect to the axis thea1. note: an affinity is a point-by-point transformation that transforms any point p into a point p' such that if h is the orthogonal projection of p on the axis thea1 or the plane a2, the vectors hp and hp' satisfy: hp' = theratio * hp.
") SetAffinity;
		void SetAffinity(const gp_Ax1 & theA1, const Standard_Real theRatio);

		/****************** SetAffinity ******************/
		/**** md5 signature: c5a4fef9ce6c40c20a012d24f4a2fd07 ****/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theRatio: float

Return
-------
None

Description
-----------
Changes this transformation into an affinity of ratio theratio with respect to the plane defined by the origin, the 'x direction' and the 'y direction' of coordinate system thea2. note: an affinity is a point-by-point transformation that transforms any point p into a point p' such that if h is the orthogonal projection of p on the axis a1 or the plane thea2, the vectors hp and hp' satisfy: hp' = theratio * hp.
") SetAffinity;
		void SetAffinity(const gp_Ax2 & theA2, const Standard_Real theRatio);

		/****************** SetForm ******************/
		/**** md5 signature: 24aaa37eae60e1c6ddc89cc5799d3e54 ****/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "Return
-------
None

Description
-----------
Verify and set the shape of the gtrsf other or compoundtrsf ex: @code mygtrsf.setvalue(row1,col1,val1); mygtrsf.setvalue(row2,col2,val2); ... mygtrsf.setform(); @endcode.
") SetForm;
		void SetForm();

		/****************** SetTranslationPart ******************/
		/**** md5 signature: 9e742c7bbc3e725da5b9b0aea1596118 ****/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Replaces the translation part of this transformation by the coordinates of the number triple thecoord.
") SetTranslationPart;
		void SetTranslationPart(const gp_XYZ & theCoord);

		/****************** SetTrsf ******************/
		/**** md5 signature: 7b3bb649abbe2903c4caa00865e50f22 ****/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Assigns the vectorial and translation parts of thet to this transformation.
") SetTrsf;
		void SetTrsf(const gp_Trsf & theT);

		/****************** SetValue ******************/
		/**** md5 signature: 9b25ecd3fcd3222f2c456a9603298770 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: float

Return
-------
None

Description
-----------
Replaces the coefficient (therow, thecol) of the matrix representing this transformation by thevalue. raises outofrange if therow < 1 or therow > 3 or thecol < 1 or thecol > 4.
") SetValue;
		void SetValue(const Standard_Integer theRow, const Standard_Integer theCol, const Standard_Real theValue);

		/****************** SetVectorialPart ******************/
		/**** md5 signature: 68420e3dad92d19aecfa05791e26c65b ****/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
None

Description
-----------
Replaces the vectorial part of this transformation by thematrix.
") SetVectorialPart;
		void SetVectorialPart(const gp_Mat & theMatrix);

		/****************** Transforms ******************/
		/**** md5 signature: 8f9dd5cceda35c2463cf3d74007d1cb1 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") Transforms;
		void Transforms(gp_XYZ & theCoord);

		/****************** Transforms ******************/
		/**** md5 signature: ba26ab7aff72ff32856094b1e250c94f ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float
theZ: float

Description
-----------
Transforms a triplet xyz with a gtrsf.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TranslationPart ******************/
		/**** md5 signature: 6e19b500ee29d7f16325476cae8b6aaf ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the translation part of the gtrsf.
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****************** Trsf ******************/
		/**** md5 signature: b145fbbd7dcaa4f9903d5fe3c25b5982 ****/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Trsf;
		gp_Trsf Trsf();

		/****************** Value ******************/
		/**** md5 signature: de381dc023424482347f7e2b0c3a6975 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
float

Description
-----------
Returns the coefficients of the global matrix of transformation. raises outofrange if therow < 1 or therow > 3 or thecol < 1 or thecol > 4.
") Value;
		Standard_Real Value(const Standard_Integer theRow, const Standard_Integer theCol);

		/****************** VectorialPart ******************/
		/**** md5 signature: f8ab7f59550c0a8d789cf5be1062d9b5 ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Computes the vectorial part of the gtrsf. the returned matrix is a 3*3 matrix.
") VectorialPart;
		const gp_Mat VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: 10e76ac91d674cb7708c2608bca82889 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf

Return
-------
gp_GTrsf

Description
-----------
No available documentation.
") operator *;
		gp_GTrsf operator *(const gp_GTrsf & theT);


%extend{
    void __imul_wrapper__(const gp_GTrsf other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_GTrsf {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_GTrsf {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_GTrsf()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_GTrsf')
    }
};
%extend gp_GTrsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_GTrsf2d *
*******************/
class gp_GTrsf2d {
	public:
		/****************** gp_GTrsf2d ******************/
		/**** md5 signature: ef0c3ea857f0f9588cf44388e702f751 ****/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns identity transformation.
") gp_GTrsf2d;
		 gp_GTrsf2d();

		/****************** gp_GTrsf2d ******************/
		/**** md5 signature: 620ab410ff57eed20fe9970b6e41008a ****/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Converts the gp_trsf2d transformation thet into a general transformation.
") gp_GTrsf2d;
		 gp_GTrsf2d(const gp_Trsf2d & theT);

		/****************** gp_GTrsf2d ******************/
		/**** md5 signature: 7dad38427f6203b577e15fc404abca18 ****/
		%feature("compactdefaultargs") gp_GTrsf2d;
		%feature("autodoc", "
Parameters
----------
theM: gp_Mat2d
theV: gp_XY

Return
-------
None

Description
-----------
Creates a transformation based on the matrix them and the vector thev where them defines the vectorial part of the transformation, and thev the translation part.
") gp_GTrsf2d;
		 gp_GTrsf2d(const gp_Mat2d & theM, const gp_XY & theV);

		/****************** Form ******************/
		/**** md5 signature: f29bb1eb1523b456c279366338ab9947 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror transformation (relative to a point or axis), a scaling transformation, a compound transformation or some other type of transformation.
") Form;
		gp_TrsfForm Form();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: f60f0491416a0a0fd4ec062a70fe0cec ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_GTrsf2d

Description
-----------
Computes the reverse transformation. raised an exception if the matrix of the transformation is not inversible.
") Inverted;
		gp_GTrsf2d Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 4a3d241c868ecfc4b59898855c5acee1 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative.
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** IsSingular ******************/
		/**** md5 signature: 03390e58a75dab9eea1f879d1c62f432 ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this transformation is singular (and therefore, cannot be inverted). note: the gauss lu decomposition is used to invert the transformation matrix. consequently, the transformation is considered as singular if the largest pivot found is less than or equal to gp::resolution(). warning if this transformation is singular, it cannot be inverted.
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: e158daa87c6102719ad9ab942df8617c ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
gp_GTrsf2d

Description
-----------
Computes the transformation composed with thet and <self>. in a c++ implementation you can also write tcomposed = <self> * thet. example: @code gp_gtrsf2d t1, t2, tcomp; ............... //composition: tcomp = t2.multiplied(t1); // or (tcomp = t2 * t1) // transformation of a point gp_xy p(10.,3.); gp_xy p1(p); tcomp.transforms(p1); //using tcomp gp_xy p2(p); t1.transforms(p2); //using t1 then t2 t2.transforms(p2); // p1 = p2 !!! @endcode.
") Multiplied;
		gp_GTrsf2d Multiplied(const gp_GTrsf2d & theT);

		/****************** Multiply ******************/
		/**** md5 signature: 5070b8932341dd47405b05e8e355859b ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
None

Description
-----------
No available documentation.
") Multiply;
		void Multiply(const gp_GTrsf2d & theT);

		/****************** Power ******************/
		/**** md5 signature: fe226a66f073d604b8a0d81d41f1ca71 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const Standard_Integer theN);

		/****************** Powered ******************/
		/**** md5 signature: 22cfce75a781b5bb74f3cee7a6e592a3 ****/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_GTrsf2d

Description
-----------
Computes the following composition of transformations <self> * <self> * .......* <self>, then time. if then = 0 <self> = identity if then < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises an exception if then < 0 and if the matrix of the transformation is not inversible.
") Powered;
		gp_GTrsf2d Powered(const Standard_Integer theN);

		/****************** PreMultiply ******************/
		/**** md5 signature: 8be694d4d9a5049f2c986fa0b9cee8dd ****/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
None

Description
-----------
Computes the product of the transformation thet and this transformation, and assigns the result to this transformation: this = thet * this.
") PreMultiply;
		void PreMultiply(const gp_GTrsf2d & theT);

		/****************** SetAffinity ******************/
		/**** md5 signature: af4fa6ac41053560a1bc11131fea98f6 ****/
		%feature("compactdefaultargs") SetAffinity;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d
theRatio: float

Return
-------
None

Description
-----------
Changes this transformation into an affinity of ratio theratio with respect to the axis thea. note: an affinity is a point-by-point transformation that transforms any point p into a point p' such that if h is the orthogonal projection of p on the axis thea, the vectors hp and hp' satisfy: hp' = theratio * hp.
") SetAffinity;
		void SetAffinity(const gp_Ax2d & theA, const Standard_Real theRatio);

		/****************** SetTranslationPart ******************/
		/**** md5 signature: a41985f432639c55f93c33e4be3a3501 ****/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Replaces the translation part of this transformation by the coordinates of the number pair thecoord.
") SetTranslationPart;
		void SetTranslationPart(const gp_XY & theCoord);

		/****************** SetTrsf2d ******************/
		/**** md5 signature: 57bc6355283dbf478188695a15c97581 ****/
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Assigns the vectorial and translation parts of thet to this transformation.
") SetTrsf2d;
		void SetTrsf2d(const gp_Trsf2d & theT);

		/****************** SetValue ******************/
		/**** md5 signature: 9b25ecd3fcd3222f2c456a9603298770 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: float

Return
-------
None

Description
-----------
Replaces the coefficient (therow, thecol) of the matrix representing this transformation by thevalue, raises outofrange if therow < 1 or therow > 2 or thecol < 1 or thecol > 3.
") SetValue;
		void SetValue(const Standard_Integer theRow, const Standard_Integer theCol, const Standard_Real theValue);

		/****************** SetVectorialPart ******************/
		/**** md5 signature: bf8108eee66cc8e3ec56080a0691ec07 ****/
		%feature("compactdefaultargs") SetVectorialPart;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
None

Description
-----------
Replaces the vectorial part of this transformation by thematrix.
") SetVectorialPart;
		void SetVectorialPart(const gp_Mat2d & theMatrix);

		/****************** Transformed ******************/
		/**** md5 signature: cb46257f4e36242646ce6f48908a47e0 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
gp_XY

Description
-----------
No available documentation.
") Transformed;
		gp_XY Transformed(const gp_XY & theCoord);

		/****************** Transforms ******************/
		/**** md5 signature: 4dc62941ec30f61dd6f0de5964b8fff6 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
No available documentation.
") Transforms;
		void Transforms(gp_XY & theCoord);

		/****************** Transforms ******************/
		/**** md5 signature: fa7acb5c2b81cd7673049034fcddc957 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float

Description
-----------
Applies this transformation to the coordinates: - of the number pair coord, or - x and y. //! note: - transforms modifies thex, they, or the coordinate pair coord, while - transformed creates a new coordinate pair.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** TranslationPart ******************/
		/**** md5 signature: 6f19325c1730ba0fd4b588033c32e399 ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the translation part of the gtrsf2d.
") TranslationPart;
		const gp_XY TranslationPart();

		/****************** Trsf2d ******************/
		/**** md5 signature: 6ea70105baee17870344c337ed09ffe5 ****/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Converts this transformation into a gp_trsf2d transformation. exceptions standard_constructionerror if this transformation cannot be converted, i.e. if its form is gp_other.
") Trsf2d;
		gp_Trsf2d Trsf2d();

		/****************** Value ******************/
		/**** md5 signature: de381dc023424482347f7e2b0c3a6975 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
float

Description
-----------
Returns the coefficients of the global matrix of transformation. raised outofrange if therow < 1 or therow > 2 or thecol < 1 or thecol > 3.
") Value;
		Standard_Real Value(const Standard_Integer theRow, const Standard_Integer theCol);

		/****************** VectorialPart ******************/
		/**** md5 signature: e1b5fba87049094128662b7d5a9a7b59 ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Computes the vectorial part of the gtrsf2d. the returned matrix is a 2*2 matrix.
") VectorialPart;
		const gp_Mat2d VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: 64120fcb548b9133abe602a79f862b0c ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_GTrsf2d

Return
-------
gp_GTrsf2d

Description
-----------
No available documentation.
") operator *;
		gp_GTrsf2d operator *(const gp_GTrsf2d & theT);


%extend{
    void __imul_wrapper__(const gp_GTrsf2d other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_GTrsf2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_GTrsf2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_GTrsf2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_GTrsf2d')
    }
};
%extend gp_GTrsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Hypr *
****************/
class gp_Hypr {
	public:
		/****************** gp_Hypr ******************/
		/**** md5 signature: 094707d36c81c9ad4dd1b143111db4d9 ****/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates of an indefinite hyperbola.
") gp_Hypr;
		 gp_Hypr();

		/****************** gp_Hypr ******************/
		/**** md5 signature: a314918ce7be912306e8f820877a7ec0 ****/
		%feature("compactdefaultargs") gp_Hypr;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theMajorRadius: float
theMinorRadius: float

Return
-------
None

Description
-----------
Creates a hyperbola with radius themajorradius and theminorradius, positioned in the space by the coordinate system thea2 such that: - the origin of thea2 is the center of the hyperbola, - the 'x direction' of thea2 defines the major axis of the hyperbola, that is, the major radius themajorradius is measured along this axis, and - the 'y direction' of thea2 defines the minor axis of the hyperbola, that is, the minor radius theminorradius is measured along this axis. note: this class does not prevent the creation of a hyperbola where: - themajoraxis is equal to theminoraxis, or - themajoraxis is less than theminoraxis. exceptions standard_constructionerror if themajoraxis or theminoraxis is negative. raises constructionerror if themajorradius < 0.0 or theminorradius < 0.0 raised if themajorradius < 0.0 or theminorradius < 0.0.
") gp_Hypr;
		 gp_Hypr(const gp_Ax2 & theA2, const Standard_Real theMajorRadius, const Standard_Real theMinorRadius);

		/****************** Asymptote1 ******************/
		/**** md5 signature: de14135c1ce647b5a9f90af716eea7a8 ****/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius and b is the minor radius. raises constructionerror if majorradius = 0.0.
") Asymptote1;
		gp_Ax1 Asymptote1();

		/****************** Asymptote2 ******************/
		/**** md5 signature: 13c1b779412722927b3766066de238ea ****/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x. where a is the major radius and b is the minor radius. raises constructionerror if majorradius = 0.0.
") Asymptote2;
		gp_Ax1 Asymptote2();

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis passing through the center, and normal to the plane of this hyperbola.
") Axis;
		const gp_Ax1 Axis();

		/****************** ConjugateBranch1 ******************/
		/**** md5 signature: 8d402ac72b793f2be179c15291ced8b3 ****/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Computes the branch of hyperbola which is on the positive side of the 'yaxis' of <self>.
") ConjugateBranch1;
		gp_Hypr ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		/**** md5 signature: 95bbcdc59f58d488edbf1e4fbe248577 ****/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Computes the branch of hyperbola which is on the negative side of the 'yaxis' of <self>.
") ConjugateBranch2;
		gp_Hypr ConjugateBranch2();

		/****************** Directrix1 ******************/
		/**** md5 signature: 10272c6052549861204070aa44f046a5 ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This directrix is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between the directrix1 and the 'xaxis' is the 'location' point of the directrix1. this point is on the positive side of the 'xaxis'.
") Directrix1;
		gp_Ax1 Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 88339a214155f2a41d76691fd00c9167 ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the hyperbola.
") Directrix2;
		gp_Ax1 Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: f8ebdf3bb4cc750ce595707c9b56f4a6 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raises domainerror if majorradius = 0.0.
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: aeac7f567b991e94a3e75e9ed626f41a ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the focal distance. it is the distance between the the two focus of the hyperbola.
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: 44668390e44007b6344ae1f20fcc3003 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the first focus of the hyperbola. this focus is on the positive side of the 'xaxis' of the hyperbola.
") Focus1;
		gp_Pnt Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: 19e89a037d2bd912a8348a9c245bd935 ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the second focus of the hyperbola. this focus is on the negative side of the 'xaxis' of the hyperbola.
") Focus2;
		gp_Pnt Focus2();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point of the hyperbola. it is the intersection point between the 'xaxis' and the 'yaxis'.
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: 128082d838650d89e5451fc2ec2cdd95 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius of the hyperbola. it is the radius on the 'xaxis' of the hyperbola.
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: 5a903e1e296cb85037297fddc27e2870 ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minor radius of the hyperbola. it is the radius on the 'yaxis' of the hyperbola.
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: 975191201aa43315433880f1149271a4 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Hypr

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Hypr Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 5f3340cf49a65e5b62bd724427f653e0 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Hypr

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Hypr Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 4a71d42fda88802f3c62180283d07b33 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Hypr

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to a plane. the axis placement thea2 locates the plane of the symmetry (location, xdirection, ydirection).
") Mirrored;
		gp_Hypr Mirrored(const gp_Ax2 & theA2);

		/****************** OtherBranch ******************/
		/**** md5 signature: 627cb5f0a034c43843be9b8252852ca6 ****/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'yaxis' of <self>.
") OtherBranch;
		gp_Hypr OtherBranch();

		/****************** Parameter ******************/
		/**** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns p = (e * e - 1) * majorradius where e is the eccentricity of the hyperbola. raises domainerror if majorradius = 0.0.
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		/**** md5 signature: 0919c787263d4f8ff9c1e18688f5d16c ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the coordinate system of the hyperbola.
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 7b96ba1218ca86e533e4ec301fb77f88 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Hypr

Description
-----------
Rotates an hyperbola. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Hypr Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 3ec88ff8f706b08a62f4ff1cb400db89 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Hypr

Description
-----------
Scales an hyperbola. thes is the scaling value.
") Scaled;
		gp_Hypr Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Modifies this hyperbola, by redefining its local coordinate system so that: - its origin and 'main direction' become those of the axis thea1 (the 'x direction' and 'y direction' are then recomputed in the same way as for any gp_ax2). raises constructionerror if the direction of thea1 is parallel to the direction of the 'xaxis' of the hyperbola.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes thep.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 847f370a77fa02a8bf45fa2b00b28b74 ****/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: float

Return
-------
None

Description
-----------
Modifies the major radius of this hyperbola. exceptions standard_constructionerror if themajorradius is negative.
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real theMajorRadius);

		/****************** SetMinorRadius ******************/
		/**** md5 signature: 2bb295e6e4f7e9ad627ec256d511ddce ****/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: float

Return
-------
None

Description
-----------
Modifies the minor radius of this hyperbola. exceptions standard_constructionerror if theminorradius is negative.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real theMinorRadius);

		/****************** SetPosition ******************/
		/**** md5 signature: ebc7dd35ccc08a819f6ac865a49dfe89 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
Modifies this hyperbola, by redefining its local coordinate system so that it becomes a2.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 181db1af3d44e2dfa5decfaf031c0297 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Hypr

Description
-----------
Transforms an hyperbola with the transformation thet from class trsf.
") Transformed;
		gp_Hypr Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 3cdb567a6c8d70ba991d859dcb00ab33 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Hypr

Description
-----------
Translates an hyperbola in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Hypr Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: 5cff536ccef6a15b49fec3f7c871aca6 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Hypr

Description
-----------
Translates an hyperbola from the point thep1 to the point thep2.
") Translated;
		gp_Hypr Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' of the local coordinate system of this hyperbola. these axes are, the major axis (the 'x axis') and of this hyperboreturns the 'xaxis' of the hyperbola.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes an axis, whose - the origin is the center of this hyperbola, and - the unit vector is the 'y direction' of the local coordinate system of this hyperbola. these axes are the minor axis (the 'y axis') of this hyperbola.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Hypr {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Hypr {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Hypr()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Hypr')
    }
};
%extend gp_Hypr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Hypr2d *
******************/
class gp_Hypr2d {
	public:
		/****************** gp_Hypr2d ******************/
		/**** md5 signature: 79d79ae8ae2e362c68baae138de54ef3 ****/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates of an indefinite hyperbola.
") gp_Hypr2d;
		 gp_Hypr2d();

		/****************** gp_Hypr2d ******************/
		/**** md5 signature: 70edb425043f3488283d6bbb4e19fb1a ****/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "
Parameters
----------
theMajorAxis: gp_Ax2d
theMajorRadius: float
theMinorRadius: float
theIsSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a hyperbola with radii themajorradius and theminorradius, centered on the origin of themajoraxis and where the unit vector of themajoraxis is the 'x direction' of the local coordinate system of the hyperbola. this coordinate system is direct if theissense is true (the default value), and indirect if theissense is false. warnings: it is yet possible to create an hyperbola with themajorradius <= theminorradius. raises constructionerror if themajorradius < 0.0 or theminorradius < 0.0.
") gp_Hypr2d;
		 gp_Hypr2d(const gp_Ax2d & theMajorAxis, const Standard_Real theMajorRadius, const Standard_Real theMinorRadius, const Standard_Boolean theIsSense = Standard_True);

		/****************** gp_Hypr2d ******************/
		/**** md5 signature: 32331a653843a478c5b03450edf97a43 ****/
		%feature("compactdefaultargs") gp_Hypr2d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d
theMajorRadius: float
theMinorRadius: float

Return
-------
None

Description
-----------
A hyperbola with radii themajorradius and theminorradius, positioned in the plane by coordinate system thea where: - the origin of thea is the center of the hyperbola, - the 'x direction' of thea defines the major axis of the hyperbola, that is, the major radius themajorradius is measured along this axis, and - the 'y direction' of thea defines the minor axis of the hyperbola, that is, the minor radius theminorradius is measured along this axis, and - the orientation (direct or indirect sense) of thea gives the implicit orientation of the hyperbola. warnings: it is yet possible to create an hyperbola with themajorradius <= theminorradius. raises constructionerror if themajorradius < 0.0 or theminorradius < 0.0.
") gp_Hypr2d;
		 gp_Hypr2d(const gp_Ax22d & theA, const Standard_Real theMajorRadius, const Standard_Real theMinorRadius);

		/****************** Asymptote1 ******************/
		/**** md5 signature: f7602d62af48fa687b9c94102a074f0b ****/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius of the hyperbola and b the minor radius of the hyperbola. raises constructionerror if majorradius = 0.0.
") Asymptote1;
		gp_Ax2d Asymptote1();

		/****************** Asymptote2 ******************/
		/**** md5 signature: ae762c76c64b4be67fd988e980bd70ef ****/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x where a is the major radius of the hyperbola and b the minor radius of the hyperbola. raises constructionerror if majorradius = 0.0.
") Asymptote2;
		gp_Ax2d Asymptote2();

		/****************** Axis ******************/
		/**** md5 signature: 094e5176aca7cccfc018310a1bba741f ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the axisplacement of the hyperbola.
") Axis;
		const gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: cc309b22e72d7a2fa63d9f3b74f48eaa ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: float
theB: float
theC: float
theD: float
theE: float
theF: float

Description
-----------
Computes the coefficients of the implicit equation of the hyperbola: thea * (x**2) + theb * (y**2) + 2*thec*(x*y) + 2*thed*x + 2*thee*y + thef = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** ConjugateBranch1 ******************/
		/**** md5 signature: dded82d6eed44f39c634df0f7b8b767b ****/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Computes the branch of hyperbola which is on the positive side of the 'yaxis' of <self>.
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		/**** md5 signature: c6a9b57d6a1f8fa77a809e10141ec59c ****/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Computes the branch of hyperbola which is on the negative side of the 'yaxis' of <self>.
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2();

		/****************** Directrix1 ******************/
		/**** md5 signature: fcbef2c85b670a856d4882ec13ce9c6f ****/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes the directrix which is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between the 'directrix1' and the 'xaxis' is the 'location' point of the 'directrix1'. this point is on the positive side of the 'xaxis'.
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		/**** md5 signature: 6932241de7dde0eb204208e30fe6363c ****/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the hyperbola.
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		/**** md5 signature: f8ebdf3bb4cc750ce595707c9b56f4a6 ****/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the eccentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raises domainerror if majorradius = 0.0.
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Focal ******************/
		/**** md5 signature: aeac7f567b991e94a3e75e9ed626f41a ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the focal distance. it is the distance between the 'location' of the hyperbola and 'focus1' or 'focus2'.
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		/**** md5 signature: 099d1f04a11af323d2f8c631c0058139 ****/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the first focus of the hyperbola. this focus is on the positive side of the 'xaxis' of the hyperbola.
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		/**** md5 signature: aa5da921f715322c56108c33462a667c ****/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the second focus of the hyperbola. this focus is on the negative side of the 'xaxis' of the hyperbola.
") Focus2;
		gp_Pnt2d Focus2();

		/****************** IsDirect ******************/
		/**** md5 signature: 218f7b7b68e34847c5868fa318c903a4 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		/**** md5 signature: 0e4556028ba61472400043e40317f1e2 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the location point of the hyperbola. it is the intersection point between the 'xaxis' and the 'yaxis'.
") Location;
		const gp_Pnt2d Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: 128082d838650d89e5451fc2ec2cdd95 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius of the hyperbola (it is the radius corresponding to the 'xaxis' of the hyperbola).
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: 5a903e1e296cb85037297fddc27e2870 ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minor radius of the hyperbola (it is the radius corresponding to the 'yaxis' of the hyperbola).
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: 5f85e7eebe220829e022319813e0b5b1 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** Mirrored ******************/
		/**** md5 signature: 47945f09bb7a44995bb779c12929564e ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Hypr2d

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Hypr2d Mirrored(const gp_Pnt2d & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 34ad5317881177ff7e2944ed99a2d04e ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Hypr2d

Description
-----------
Performs the symmetrical transformation of an hyperbola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Hypr2d Mirrored(const gp_Ax2d & theA);

		/****************** OtherBranch ******************/
		/**** md5 signature: f1af22c66e798fd4572b0caa735b1f01 ****/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Returns the branch of hyperbola obtained by doing the symmetrical transformation of <self> with respect to the 'yaxis' of <self>.
") OtherBranch;
		gp_Hypr2d OtherBranch();

		/****************** Parameter ******************/
		/**** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns p = (e * e - 1) * majorradius where e is the eccentricity of the hyperbola. raises domainerror if majorradius = 0.0.
") Parameter;
		Standard_Real Parameter();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 0d9b975a843201c053f96b6da8f5ee68 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
Reverses the orientation of the local coordinate system of this hyperbola (the 'y axis' is reversed). therefore, the implicit orientation of this hyperbola is reversed. note: - reverse assigns the result to this hyperbola, while - reversed creates a new one.
") Reversed;
		gp_Hypr2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 4514855f978c37f3ce31a9851c5a1153 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 0e5a16956fda3847e218f61819484089 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Hypr2d

Description
-----------
Rotates an hyperbola. thep is the center of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Hypr2d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: c464bf78519bd3beeec5dd2bb7f74ab0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: bf7e855f6a03eeba2ebc190052d7759f ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Hypr2d

Description
-----------
Scales an hyperbola. <thes> is the scaling value. if <thes> is positive only the location point is modified. but if <thes> is negative the 'xaxis' is reversed and the 'yaxis' too.
") Scaled;
		gp_Hypr2d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: fba67a5039095eddccca14c1039ad8be ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d

Return
-------
None

Description
-----------
Modifies this hyperbola, by redefining its local coordinate system so that it becomes thea.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****************** SetLocation ******************/
		/**** md5 signature: fea6486624f66c26e32103313f4d0c00 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Modifies this hyperbola, by redefining its local coordinate system so that its origin becomes thep.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 847f370a77fa02a8bf45fa2b00b28b74 ****/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: float

Return
-------
None

Description
-----------
Modifies the major or minor radius of this hyperbola. exceptions standard_constructionerror if themajorradius or minorradius is negative.
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real theMajorRadius);

		/****************** SetMinorRadius ******************/
		/**** md5 signature: 2bb295e6e4f7e9ad627ec256d511ddce ****/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: float

Return
-------
None

Description
-----------
Modifies the major or minor radius of this hyperbola. exceptions standard_constructionerror if majorradius or theminorradius is negative.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real theMinorRadius);

		/****************** SetXAxis ******************/
		/**** md5 signature: 8cea815a914afe135b1603dc856a8a22 ****/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the major axis of the hyperbola. the minor axis is recomputed and the location of the hyperbola too.
") SetXAxis;
		void SetXAxis(const gp_Ax2d & theA);

		/****************** SetYAxis ******************/
		/**** md5 signature: f60887b297962c8ebfb061925ba2853e ****/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the minor axis of the hyperbola.the minor axis is recomputed and the location of the hyperbola too.
") SetYAxis;
		void SetYAxis(const gp_Ax2d & theA);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 878c2d6501db9a557516565338c992f7 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Hypr2d

Description
-----------
Transforms an hyperbola with the transformation thet from class trsf2d.
") Transformed;
		gp_Hypr2d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: f3112504d8f922313d0ee62e8d9fc9ad ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: e9a104e37a9109c8547796017216b658 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Hypr2d

Description
-----------
Translates an hyperbola in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Hypr2d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: 0a1311a22ff172013bef1655c691dc07 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Hypr2d

Description
-----------
Translates an hyperbola from the point thep1 to the point thep2.
") Translated;
		gp_Hypr2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 6a005542df14e10d67ac38644cf8c7ae ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' or 'y direction' respectively of the local coordinate system of this hyperbola returns the major axis of the hyperbola.
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: d49975ff0e9ed400148a36ac6e990919 ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes an axis whose - the origin is the center of this hyperbola, and - the unit vector is the 'x direction' or 'y direction' respectively of the local coordinate system of this hyperbola returns the minor axis of the hyperbola.
") YAxis;
		gp_Ax2d YAxis();

};



%extend gp_Hypr2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Hypr2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Hypr2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Hypr2d')
    }
};
%extend gp_Hypr2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Lin *
***************/
class gp_Lin {
	public:
		/****************** gp_Lin ******************/
		/**** md5 signature: 42a5f7ab2b458cb7be77a15faf7d8c5c ****/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a line corresponding to z axis of the reference coordinate system.
") gp_Lin;
		 gp_Lin();

		/****************** gp_Lin ******************/
		/**** md5 signature: dbccb350c307fd13d73d5eff540a1b3e ****/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Creates a line defined by axis thea1.
") gp_Lin;
		 gp_Lin(const gp_Ax1 & theA1);

		/****************** gp_Lin ******************/
		/**** md5 signature: a6c9131e9c0e9811cb6b48eb9cafc2ee ****/
		%feature("compactdefaultargs") gp_Lin;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a line passing through point thep and parallel to vector thev (thep and thev are, respectively, the origin and the unit vector of the positioning axis of the line).
") gp_Lin;
		 gp_Lin(const gp_Pnt & theP, const gp_Dir & theV);

		/****************** Angle ******************/
		/**** md5 signature: ada09c41fa404a04de8dc4a6f7563b58 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin

Return
-------
float

Description
-----------
Computes the angle between two lines in radians.
") Angle;
		Standard_Real Angle(const gp_Lin & theOther);

		/****************** Contains ******************/
		/**** md5 signature: 505c74c81a15c8244323a9eb031db0f3 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theLinearTolerance: float

Return
-------
bool

Description
-----------
Returns true if this line contains the point thep, that is, if the distance between point thep and this line is less than or equal to thelineartolerance..
") Contains;
		Standard_Boolean Contains(const gp_Pnt & theP, const Standard_Real theLinearTolerance);

		/****************** Direction ******************/
		/**** md5 signature: fe17f01a1a479d7628e85d427dbda641 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns the direction of the line.
") Direction;
		const gp_Dir Direction();

		/****************** Distance ******************/
		/**** md5 signature: 24964ab9dd1f6799bfd0455d7b81296d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
float

Description
-----------
Computes the distance between <self> and the point thep.
") Distance;
		Standard_Real Distance(const gp_Pnt & theP);

		/****************** Distance ******************/
		/**** md5 signature: 8262aac13896fd202d6e97d29a3ddc8e ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin

Return
-------
float

Description
-----------
Computes the distance between two lines.
") Distance;
		Standard_Real Distance(const gp_Lin & theOther);

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the location point (origin) of the line.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: 46991878575c5e88649d922cf1bc88e5 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Lin

Description
-----------
Performs the symmetrical transformation of a line with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Lin Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 2901bdf0dbbbeafb6eac90761e126ac5 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Lin

Description
-----------
Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Lin Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 903eb1322f5b0aa5d2707a8b5ba44d76 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Lin

Description
-----------
Performs the symmetrical transformation of a line with respect to a plane. the axis placement <thea2> locates the plane of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Lin Mirrored(const gp_Ax2 & theA2);

		/****************** Normal ******************/
		/**** md5 signature: 818fa3f581256ddc238570a0b3a2759c ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Lin

Description
-----------
Computes the line normal to the direction of <self>, passing through the point thep. raises constructionerror if the distance between <self> and the point thep is lower or equal to resolution from gp because there is an infinity of solutions in 3d space.
") Normal;
		gp_Lin Normal(const gp_Pnt & theP);

		/****************** Position ******************/
		/**** md5 signature: d26ac37297a553a63a101d752429410b ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis placement one axis with the same location and direction as <self>.
") Position;
		const gp_Ax1 Position();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: f4a9a6173ca942394b0c72757e8cc8aa ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Reverses the direction of the line. note: - reverse assigns the result to this line, while - reversed creates a new one.
") Reversed;
		gp_Lin Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: dc025401ecec9d4f2839602781b4ba94 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Lin

Description
-----------
Rotates a line. a1 is the axis of the rotation. ang is the angular value of the rotation in radians.
") Rotated;
		gp_Lin Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: 2e3ad744b562b37602bc0d7050246d12 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 5422c52c22b4894f519ff3e2cc09ceb8 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Lin

Description
-----------
Scales a line. thes is the scaling value. the 'location' point (origin) of the line is modified. the 'direction' is reversed if the scale is negative.
") Scaled;
		gp_Lin Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetDirection ******************/
		/**** md5 signature: 7bb25675dd4f12080d7759ff4dd0acc2 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Changes the direction of the line.
") SetDirection;
		void SetDirection(const gp_Dir & theV);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Changes the location point (origin) of the line.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** SetPosition ******************/
		/**** md5 signature: ea075dda815d39e8ce82603048447ddf ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Complete redefinition of the line. the 'location' point of <thea1> is the origin of the line. the 'direction' of <thea1> is the direction of the line.
") SetPosition;
		void SetPosition(const gp_Ax1 & theA1);

		/****************** SquareDistance ******************/
		/**** md5 signature: 64c8ffd3adb8396952be0195df56781e ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
float

Description
-----------
Computes the square distance between <self> and the point thep.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & theP);

		/****************** SquareDistance ******************/
		/**** md5 signature: 5ff0e420c73b356f3acbf07eed6c1525 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin

Return
-------
float

Description
-----------
Computes the square distance between two lines.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Lin & theOther);

		/****************** Transform ******************/
		/**** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 486f47c62db9cc58376c1983e5450c71 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Lin

Description
-----------
Transforms a line with the transformation thet from class trsf.
") Transformed;
		gp_Lin Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 9b4c089f05435398e6a7f622c805e458 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Lin

Description
-----------
Translates a line in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Lin Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: f154c122c00bb01ee8ab1ea942918911 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Lin

Description
-----------
Translates a line from the point thep1 to the point thep2.
") Translated;
		gp_Lin Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

};



%extend gp_Lin {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Lin {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Lin()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Lin')
    }
};
%extend gp_Lin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Lin2d *
*****************/
class gp_Lin2d {
	public:
		/****************** gp_Lin2d ******************/
		/**** md5 signature: 5e262dd8514e7dd33c5d207059f57e2b ****/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a line corresponding to x axis of the reference coordinate system.
") gp_Lin2d;
		 gp_Lin2d();

		/****************** gp_Lin2d ******************/
		/**** md5 signature: 51fad62c104e390fa7065fae9f719aed ****/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Creates a line located with thea.
") gp_Lin2d;
		 gp_Lin2d(const gp_Ax2d & theA);

		/****************** gp_Lin2d ******************/
		/**** md5 signature: 8c2bed35e809defd254acbb0f32bf4c7 ****/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theV: gp_Dir2d

Return
-------
None

Description
-----------
<thep> is the location point (origin) of the line and <thev> is the direction of the line.
") gp_Lin2d;
		 gp_Lin2d(const gp_Pnt2d & theP, const gp_Dir2d & theV);

		/****************** gp_Lin2d ******************/
		/**** md5 signature: 8dadd994833d54baa062ac1e776b3d7a ****/
		%feature("compactdefaultargs") gp_Lin2d;
		%feature("autodoc", "
Parameters
----------
theA: float
theB: float
theC: float

Return
-------
None

Description
-----------
Creates the line from the equation thea*x + theb*y + thec = 0.0 raises constructionerror if sqrt(thea*thea + theb*theb) <= resolution from gp. raised if sqrt(thea*thea + theb*theb) <= resolution from gp.
") gp_Lin2d;
		 gp_Lin2d(const Standard_Real theA, const Standard_Real theB, const Standard_Real theC);

		/****************** Angle ******************/
		/**** md5 signature: c0f50b5fcefdc66776b1ae809970c46d ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin2d

Return
-------
float

Description
-----------
Computes the angle between two lines in radians.
") Angle;
		Standard_Real Angle(const gp_Lin2d & theOther);

		/****************** Coefficients ******************/
		/**** md5 signature: 6e07266307e9ef486d002965f70f8a92 ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: float
theB: float
theC: float

Description
-----------
Returns the normalized coefficients of the line: thea * x + theb * y + thec = 0.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Contains ******************/
		/**** md5 signature: 48572605f35f0836d249aaf0f0a6926c ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theLinearTolerance: float

Return
-------
bool

Description
-----------
Returns true if this line contains the point thep, that is, if the distance between point thep and this line is less than or equal to thelineartolerance.
") Contains;
		Standard_Boolean Contains(const gp_Pnt2d & theP, const Standard_Real theLinearTolerance);

		/****************** Direction ******************/
		/**** md5 signature: b48e56b9548c841e45989f4710a5ce8d ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
Returns the direction of the line.
") Direction;
		const gp_Dir2d Direction();

		/****************** Distance ******************/
		/**** md5 signature: fb4d5768ba7911e98e8d6818bd11e896 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
float

Description
-----------
Computes the distance between <self> and the point <thep>.
") Distance;
		Standard_Real Distance(const gp_Pnt2d & theP);

		/****************** Distance ******************/
		/**** md5 signature: b9e74ac2acffe54bb414fccbc61f5b77 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin2d

Return
-------
float

Description
-----------
Computes the distance between two lines.
") Distance;
		Standard_Real Distance(const gp_Lin2d & theOther);

		/****************** Location ******************/
		/**** md5 signature: 0e4556028ba61472400043e40317f1e2 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the location point (origin) of the line.
") Location;
		const gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5f85e7eebe220829e022319813e0b5b1 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** Mirrored ******************/
		/**** md5 signature: e0a80ae94a5bcd2d5ea3dba770ecc3c5 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Lin2d

Description
-----------
Performs the symmetrical transformation of a line with respect to the point <thep> which is the center of the symmetry.
") Mirrored;
		gp_Lin2d Mirrored(const gp_Pnt2d & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 818441c62388be301f97e98886d122b5 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Lin2d

Description
-----------
Performs the symmetrical transformation of a line with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Lin2d Mirrored(const gp_Ax2d & theA);

		/****************** Normal ******************/
		/**** md5 signature: ca1e11647f957f08e8f27d07a3ea7a85 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Lin2d

Description
-----------
Computes the line normal to the direction of <self>, passing through the point <thep>.
") Normal;
		gp_Lin2d Normal(const gp_Pnt2d & theP);

		/****************** Position ******************/
		/**** md5 signature: 9c7381c3f255206fecf99e9de164cf02 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the axis placement one axis with the same location and direction as <self>.
") Position;
		const gp_Ax2d Position();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: f8bb9efd5c24fc9dde0126d9b0570b78 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
Reverses the positioning axis of this line. note: - reverse assigns the result to this line, while - reversed creates a new one.
") Reversed;
		gp_Lin2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 4514855f978c37f3ce31a9851c5a1153 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: d326eb9b280930e8ba8f60dff05be935 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Lin2d

Description
-----------
Rotates a line. thep is the center of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Lin2d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: f26515fb9209d4c6218b02703fde6a26 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 24600c6aa1e997141b31be9de98ac666 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Lin2d

Description
-----------
Scales a line. thes is the scaling value. only the origin of the line is modified.
") Scaled;
		gp_Lin2d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetDirection ******************/
		/**** md5 signature: c432d44a3a70de3dff1bf385189df5c4 ****/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
Changes the direction of the line.
") SetDirection;
		void SetDirection(const gp_Dir2d & theV);

		/****************** SetLocation ******************/
		/**** md5 signature: fea6486624f66c26e32103313f4d0c00 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the origin of the line.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****************** SetPosition ******************/
		/**** md5 signature: 1208b115b2aae8dfc2fb67ecae5d5265 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Complete redefinition of the line. the 'location' point of <thea> is the origin of the line. the 'direction' of <thea> is the direction of the line.
") SetPosition;
		void SetPosition(const gp_Ax2d & theA);

		/****************** SquareDistance ******************/
		/**** md5 signature: 341b637f68b11ca63b87173eee241ab6 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
float

Description
-----------
Computes the square distance between <self> and the point <thep>.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt2d & theP);

		/****************** SquareDistance ******************/
		/**** md5 signature: 31b79afe7c51e68a4dfbffbd870cc2f7 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Lin2d

Return
-------
float

Description
-----------
Computes the square distance between two lines.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Lin2d & theOther);

		/****************** Transform ******************/
		/**** md5 signature: 730ddba08a3831e8eddc8ca7a1e1a563 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 1adbde1812a39997c3d948ec41c0c4ee ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Lin2d

Description
-----------
Transforms a line with the transformation thet from class trsf2d.
") Transformed;
		gp_Lin2d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: f3112504d8f922313d0ee62e8d9fc9ad ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 416e67bfb72bca41a352891efad72e9a ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Lin2d

Description
-----------
Translates a line in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Lin2d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: 0c0fb43b2e1fc3a1eb84a7330c2325f8 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Lin2d

Description
-----------
Translates a line from the point thep1 to the point thep2.
") Translated;
		gp_Lin2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

};



%extend gp_Lin2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Lin2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Lin2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Lin2d')
    }
};
%extend gp_Lin2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Mat *
***************/
class gp_Mat {
	public:
		/****************** gp_Mat ******************/
		/**** md5 signature: a2d974607c58dd22db3c04191450e07e ****/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a matrix with null coefficients.
") gp_Mat;
		 gp_Mat();

		/****************** gp_Mat ******************/
		/**** md5 signature: 81abd7a0b36752ce0ea46916f4b51334 ****/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "
Parameters
----------
theA11: float
theA12: float
theA13: float
theA21: float
theA22: float
theA23: float
theA31: float
theA32: float
theA33: float

Return
-------
None

Description
-----------
No available documentation.
") gp_Mat;
		 gp_Mat(const Standard_Real theA11, const Standard_Real theA12, const Standard_Real theA13, const Standard_Real theA21, const Standard_Real theA22, const Standard_Real theA23, const Standard_Real theA31, const Standard_Real theA32, const Standard_Real theA33);

		/****************** gp_Mat ******************/
		/**** md5 signature: c70f7990345cd055920aa4ae17b89c18 ****/
		%feature("compactdefaultargs") gp_Mat;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XYZ
theCol2: gp_XYZ
theCol3: gp_XYZ

Return
-------
None

Description
-----------
Creates a matrix. thecol1, thecol2, thecol3 are the 3 columns of the matrix.
") gp_Mat;
		 gp_Mat(const gp_XYZ & theCol1, const gp_XYZ & theCol2, const gp_XYZ & theCol3);

		/****************** Add ******************/
		/**** md5 signature: 22de55156ca51c3313218220d0799795 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const gp_Mat & theOther);

		/****************** Added ******************/
		/**** md5 signature: aa750d8235f83bef51f8d0f73bf43071 ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
Computes the sum of this matrix and the matrix theother for each coefficient of the matrix: <self>.coef(i,j) + <theother>.coef(i,j).
") Added;
		gp_Mat Added(const gp_Mat & theOther);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer theRow,const Standard_Integer theCol) {
            return (Standard_Real) $self->ChangeValue(theRow,theCol);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer theRow,const Standard_Integer theCol,Standard_Real value) {
            $self->ChangeValue(theRow,theCol)=value;
            }
        };
		/****************** Column ******************/
		/**** md5 signature: 5395083624fdcd486fc1f447084ce762 ****/
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "
Parameters
----------
theCol: int

Return
-------
gp_XYZ

Description
-----------
Returns the column of thecol index. raises outofrange if thecol < 1 or thecol > 3.
") Column;
		gp_XYZ Column(const Standard_Integer theCol);

		/****************** Determinant ******************/
		/**** md5 signature: 2c651d1f91d91ef21c0622ab6d3444d4 ****/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the determinant of the matrix.
") Determinant;
		Standard_Real Determinant();

		/****************** Diagonal ******************/
		/**** md5 signature: 1f1fc2674e4c70afa35cc086a7d5dabb ****/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the main diagonal of the matrix.
") Diagonal;
		gp_XYZ Diagonal();

		/****************** Divide ******************/
		/**** md5 signature: a8e3d56303725be34900c9165505e38a ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
No available documentation.
") Divide;
		void Divide(const Standard_Real theScalar);

		/****************** Divided ******************/
		/**** md5 signature: 080d1ae1a93e0803489c20e0ffb85754 ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat

Description
-----------
Divides all the coefficients of the matrix by scalar.
") Divided;
		gp_Mat Divided(const Standard_Real theScalar);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 0fc8d68232f4accc4c200c6594a3c6f8 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Inverses the matrix and raises if the matrix is singular. - invert assigns the result to this matrix, while - inverted creates a new one. warning the gauss lu decomposition is used to invert the matrix. consequently, the matrix is considered as singular if the largest pivot found is less than or equal to gp::resolution(). exceptions standard_constructionerror if this matrix is singular, and therefore cannot be inverted.
") Inverted;
		gp_Mat Inverted();

		/****************** IsSingular ******************/
		/**** md5 signature: 03390e58a75dab9eea1f879d1c62f432 ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
The gauss lu decomposition is used to invert the matrix (see math package) so the matrix is considered as singular if the largest pivot found is lower or equal to resolution from gp.
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: abe747ed0d5d72378006c6255a1777ac ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
Computes the product of two matrices <self> * <other>.
") Multiplied;
		gp_Mat Multiplied(const gp_Mat & theOther);

		/****************** Multiplied ******************/
		/**** md5 signature: 4eb2a79421f42e3ebac319b7e6bad41d ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat

Description
-----------
No available documentation.
") Multiplied;
		gp_Mat Multiplied(const Standard_Real theScalar);

		/****************** Multiply ******************/
		/**** md5 signature: c2593545a2e5484de62a7cc15838404c ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
Computes the product of two matrices <self> = <other> * <self>.
") Multiply;
		void Multiply(const gp_Mat & theOther);

		/****************** Multiply ******************/
		/**** md5 signature: 5ec6e322b1914d47759b5051335ce8b1 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
Multiplies all the coefficients of the matrix by scalar.
") Multiply;
		void Multiply(const Standard_Real theScalar);

		/****************** Power ******************/
		/**** md5 signature: 269b25031ee3626d57e26795a85486bb ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const Standard_Integer N);

		/****************** Powered ******************/
		/**** md5 signature: afe9dfb507d129cea71a1fd111786f82 ****/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Mat

Description
-----------
Computes <self> = <self> * <self> * .......* <self>, then time. if then = 0 <self> = identity if then < 0 <self> = <self>.invert() *...........* <self>.invert(). if then < 0 an exception will be raised if the matrix is not inversible.
") Powered;
		gp_Mat Powered(const Standard_Integer theN);

		/****************** PreMultiply ******************/
		/**** md5 signature: 5928cf9374dbcddeb936035beace2886 ****/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") PreMultiply;
		void PreMultiply(const gp_Mat & theOther);

		/****************** Row ******************/
		/**** md5 signature: 7ef120d3c543f78ba32791672a05971c ****/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "
Parameters
----------
theRow: int

Return
-------
gp_XYZ

Description
-----------
Returns the row of therow index. raises outofrange if therow < 1 or therow > 3.
") Row;
		gp_XYZ Row(const Standard_Integer theRow);

		/****************** SetCol ******************/
		/**** md5 signature: 635888cb9f79cffcaaf54019cfe3bfad ****/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "
Parameters
----------
theCol: int
theValue: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of thevalue to the column of index thecol of this matrix. raises outofrange if thecol < 1 or thecol > 3.
") SetCol;
		void SetCol(const Standard_Integer theCol, const gp_XYZ & theValue);

		/****************** SetCols ******************/
		/**** md5 signature: 0bb5fe2880a0b326d0ee4be9a050e1fb ****/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XYZ
theCol2: gp_XYZ
theCol3: gp_XYZ

Return
-------
None

Description
-----------
Assigns the number triples thecol1, thecol2, thecol3 to the three columns of this matrix.
") SetCols;
		void SetCols(const gp_XYZ & theCol1, const gp_XYZ & theCol2, const gp_XYZ & theCol3);

		/****************** SetCross ******************/
		/**** md5 signature: 3b20c4391761c99e63da723474bf4093 ****/
		%feature("compactdefaultargs") SetCross;
		%feature("autodoc", "
Parameters
----------
theRef: gp_XYZ

Return
-------
None

Description
-----------
Modifies the matrix m so that applying it to any number triple (x, y, z) produces the same result as the cross product of theref and the number triple (x, y, z): i.e.: m * {x,y,z}t = theref.cross({x, y ,z}) this matrix is anti symmetric. to apply this matrix to the triplet {xyz} is the same as to do the cross product between the triplet theref and the triplet {xyz}. note: this matrix is anti-symmetric.
") SetCross;
		void SetCross(const gp_XYZ & theRef);

		/****************** SetDiagonal ******************/
		/**** md5 signature: b62138e3a32c5c1661e2dd1f586acf04 ****/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "
Parameters
----------
theX1: float
theX2: float
theX3: float

Return
-------
None

Description
-----------
Modifies the main diagonal of the matrix. @code <self>.value (1, 1) = thex1 <self>.value (2, 2) = thex2 <self>.value (3, 3) = thex3 @endcode the other coefficients of the matrix are not modified.
") SetDiagonal;
		void SetDiagonal(const Standard_Real theX1, const Standard_Real theX2, const Standard_Real theX3);

		/****************** SetDot ******************/
		/**** md5 signature: d0c52416cbbc69dc941e9814a04951d1 ****/
		%feature("compactdefaultargs") SetDot;
		%feature("autodoc", "
Parameters
----------
theRef: gp_XYZ

Return
-------
None

Description
-----------
Modifies this matrix so that applying it to any number triple (x, y, z) produces the same result as the scalar product of theref and the number triple (x, y, z): this * (x,y,z) = theref.(x,y,z) note: this matrix is symmetric.
") SetDot;
		void SetDot(const gp_XYZ & theRef);

		/****************** SetIdentity ******************/
		/**** md5 signature: 29bad7dbd58ceb28d41fd54bb77dccfa ****/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Modifies this matrix so that it represents the identity matrix.
") SetIdentity;
		void SetIdentity();

		/****************** SetRotation ******************/
		/**** md5 signature: 28df49a6aeffc72b437daba2983e98b1 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_XYZ
theAng: float

Return
-------
None

Description
-----------
Modifies this matrix so that it represents a rotation. theang is the angular value in radians and the xyz axis gives the direction of the rotation. raises constructionerror if xyz.modulus() <= resolution().
") SetRotation;
		void SetRotation(const gp_XYZ & theAxis, const Standard_Real theAng);

		/****************** SetRow ******************/
		/**** md5 signature: eaa069d684998a4b86ff2cff92480365 ****/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "
Parameters
----------
theRow: int
theValue: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of value to the row of index therow of this matrix. raises outofrange if therow < 1 or therow > 3.
") SetRow;
		void SetRow(const Standard_Integer theRow, const gp_XYZ & theValue);

		/****************** SetRows ******************/
		/**** md5 signature: 9f360a5cd262963fdb0a0e93568929ba ****/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "
Parameters
----------
theRow1: gp_XYZ
theRow2: gp_XYZ
theRow3: gp_XYZ

Return
-------
None

Description
-----------
Assigns the number triples therow1, therow2, therow3 to the three rows of this matrix.
") SetRows;
		void SetRows(const gp_XYZ & theRow1, const gp_XYZ & theRow2, const gp_XYZ & theRow3);

		/****************** SetScale ******************/
		/**** md5 signature: 39248edf6ba1a4f4f31956da18ba572a ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
None

Description
-----------
Modifies the matrix so that it represents a scaling transformation, where thes is the scale factor.: @code | thes 0.0 0.0 | <self> = | 0.0 thes 0.0 | | 0.0 0.0 thes | @endcode.
") SetScale;
		void SetScale(const Standard_Real theS);

		/****************** SetValue ******************/
		/**** md5 signature: 99a5a1dc4ea005a04a68da8d3f6274b3 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: float

Return
-------
None

Description
-----------
Assigns <thevalue> to the coefficient of row therow, column thecol of this matrix. raises outofrange if therow < 1 or therow > 3 or thecol < 1 or thecol > 3.
") SetValue;
		void SetValue(const Standard_Integer theRow, const Standard_Integer theCol, const Standard_Real theValue);

		/****************** Subtract ******************/
		/**** md5 signature: a9c0fcdea7a766ba54c3c109f2ec3eb6 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") Subtract;
		void Subtract(const gp_Mat & theOther);

		/****************** Subtracted ******************/
		/**** md5 signature: e6ceebd1febc31105fe0199def472bd7 ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
Computes for each coefficient of the matrix: <self>.coef(i,j) - <theother>.coef(i,j).
") Subtracted;
		gp_Mat Subtracted(const gp_Mat & theOther);

		/****************** Transpose ******************/
		/**** md5 signature: 70e27025c56428cd3bbca609f0f0cfbd ****/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transpose;
		void Transpose();

		/****************** Transposed ******************/
		/**** md5 signature: 6f431e17dac82c5511fba18a2280b8a0 ****/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Transposes the matrix. a(j, i) -> a (i, j).
") Transposed;
		gp_Mat Transposed();

		/****************** Value ******************/
		/**** md5 signature: 6a2c4a8c6e47ce057687c7f426792775 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
float

Description
-----------
Returns the coefficient of range (therow, thecol) raises outofrange if therow < 1 or therow > 3 or thecol < 1 or thecol > 3.
") Value;
		const Standard_Real & Value(const Standard_Integer theRow, const Standard_Integer theCol);

		/****************** operator * ******************/
		/**** md5 signature: 7db0ed1ace38f8bf1c113456a70f43f7 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator *;
		gp_Mat operator *(const gp_Mat & theOther);

		/****************** operator * ******************/
		/**** md5 signature: 111c858f76a112394f57e180fc6e7ea3 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator *;
		gp_Mat operator *(const Standard_Real theScalar);


%extend{
    void __imul_wrapper__(const gp_Mat other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****************** operator + ******************/
		/**** md5 signature: c2a4fbf1f0a086324496c01898bbe173 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator +;
		gp_Mat operator +(const gp_Mat & theOther);


%extend{
    void __iadd_wrapper__(const gp_Mat other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****************** operator - ******************/
		/**** md5 signature: 005d2557fc210ec6218060a310064329 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator -;
		gp_Mat operator -(const gp_Mat & theOther);


%extend{
    void __isub_wrapper__(const gp_Mat other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****************** operator / ******************/
		/**** md5 signature: 50cc92cc2a69d2e23a05248466cd8bca ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat

Description
-----------
No available documentation.
") operator /;
		gp_Mat operator /(const Standard_Real theScalar);


%extend{
    void __itruediv_wrapper__(const Standard_Real other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};



%extend gp_Mat {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Mat {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Mat()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Mat')
    }
};
%extend gp_Mat {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Mat2d *
*****************/
class gp_Mat2d {
	public:
		/****************** gp_Mat2d ******************/
		/**** md5 signature: 824d966688fb682caf2b1e9c529e1a44 ****/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a matrix with null coefficients.
") gp_Mat2d;
		 gp_Mat2d();

		/****************** gp_Mat2d ******************/
		/**** md5 signature: 8ee2088d64337c1d8317be4e5edc2cbc ****/
		%feature("compactdefaultargs") gp_Mat2d;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XY
theCol2: gp_XY

Return
-------
None

Description
-----------
Thecol1, thecol2 are the 2 columns of the matrix.
") gp_Mat2d;
		 gp_Mat2d(const gp_XY & theCol1, const gp_XY & theCol2);

		/****************** Add ******************/
		/**** md5 signature: 9f84026b13c61ba373b10330d3726faf ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: gp_Mat2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const gp_Mat2d & Other);

		/****************** Added ******************/
		/**** md5 signature: eee9fd4ef8b51dfcac2bc5bb7686fa3f ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
Computes the sum of this matrix and the matrix theother.for each coefficient of the matrix: @code <self>.coef(i,j) + <theother>.coef(i,j) @endcode note: - operator += assigns the result to this matrix, while - operator + creates a new one.
") Added;
		gp_Mat2d Added(const gp_Mat2d & theOther);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer theRow,const Standard_Integer theCol) {
            return (Standard_Real) $self->ChangeValue(theRow,theCol);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer theRow,const Standard_Integer theCol,Standard_Real value) {
            $self->ChangeValue(theRow,theCol)=value;
            }
        };
		/****************** Column ******************/
		/**** md5 signature: 72eddfffa8fb96e97f4ba890e948f029 ****/
		%feature("compactdefaultargs") Column;
		%feature("autodoc", "
Parameters
----------
theCol: int

Return
-------
gp_XY

Description
-----------
Returns the column of thecol index. raises outofrange if thecol < 1 or thecol > 2.
") Column;
		gp_XY Column(const Standard_Integer theCol);

		/****************** Determinant ******************/
		/**** md5 signature: 2c651d1f91d91ef21c0622ab6d3444d4 ****/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the determinant of the matrix.
") Determinant;
		Standard_Real Determinant();

		/****************** Diagonal ******************/
		/**** md5 signature: aece2ad385867950872716b830ca5dc0 ****/
		%feature("compactdefaultargs") Diagonal;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the main diagonal of the matrix.
") Diagonal;
		gp_XY Diagonal();

		/****************** Divide ******************/
		/**** md5 signature: a8e3d56303725be34900c9165505e38a ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
No available documentation.
") Divide;
		void Divide(const Standard_Real theScalar);

		/****************** Divided ******************/
		/**** md5 signature: d03d3fa2837e4ab5c9ccd511088b35e8 ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat2d

Description
-----------
Divides all the coefficients of the matrix by a scalar.
") Divided;
		gp_Mat2d Divided(const Standard_Real theScalar);

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: e25ae29335c96aa928e72866417e8ab1 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Inverses the matrix and raises exception if the matrix is singular.
") Inverted;
		gp_Mat2d Inverted();

		/****************** IsSingular ******************/
		/**** md5 signature: 03390e58a75dab9eea1f879d1c62f432 ****/
		%feature("compactdefaultargs") IsSingular;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this matrix is singular (and therefore, cannot be inverted). the gauss lu decomposition is used to invert the matrix so the matrix is considered as singular if the largest pivot found is lower or equal to resolution from gp.
") IsSingular;
		Standard_Boolean IsSingular();

		/****************** Multiplied ******************/
		/**** md5 signature: b9deb82837e4a5e91b08934edb6fe12d ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") Multiplied;
		gp_Mat2d Multiplied(const gp_Mat2d & theOther);

		/****************** Multiplied ******************/
		/**** md5 signature: 572d0fb590a5d3038f3701033c6276e5 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") Multiplied;
		gp_Mat2d Multiplied(const Standard_Real theScalar);

		/****************** Multiply ******************/
		/**** md5 signature: 6de2113f0d9321b382dc566d916d3f84 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
None

Description
-----------
Computes the product of two matrices <self> * <theother>.
") Multiply;
		void Multiply(const gp_Mat2d & theOther);

		/****************** Multiply ******************/
		/**** md5 signature: 5ec6e322b1914d47759b5051335ce8b1 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
Multiplies all the coefficients of the matrix by a scalar.
") Multiply;
		void Multiply(const Standard_Real theScalar);

		/****************** Power ******************/
		/**** md5 signature: fe226a66f073d604b8a0d81d41f1ca71 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const Standard_Integer theN);

		/****************** Powered ******************/
		/**** md5 signature: 22dd65f2a0a762f94aba7326b16b0478 ****/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Mat2d

Description
-----------
Computes <self> = <self> * <self> * .......* <self>, then time. if then = 0 <self> = identity if then < 0 <self> = <self>.invert() *...........* <self>.invert(). if then < 0 an exception can be raised if the matrix is not inversible.
") Powered;
		gp_Mat2d Powered(const Standard_Integer theN);

		/****************** PreMultiply ******************/
		/**** md5 signature: decff535039fc67179cb5ce42cb49a25 ****/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
None

Description
-----------
Modifies this matrix by premultiplying it by the matrix other <self> = theother * <self>.
") PreMultiply;
		void PreMultiply(const gp_Mat2d & theOther);

		/****************** Row ******************/
		/**** md5 signature: 8e69c85df59f4d010677ced22d751412 ****/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "
Parameters
----------
theRow: int

Return
-------
gp_XY

Description
-----------
Returns the row of index therow. raised if therow < 1 or therow > 2.
") Row;
		gp_XY Row(const Standard_Integer theRow);

		/****************** SetCol ******************/
		/**** md5 signature: 926c6f2bb1fe0c46d5509f7bec09b814 ****/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "
Parameters
----------
theCol: int
theValue: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of thevalue to the column of range thecol of this matrix raises outofrange if thecol < 1 or thecol > 2.
") SetCol;
		void SetCol(const Standard_Integer theCol, const gp_XY & theValue);

		/****************** SetCols ******************/
		/**** md5 signature: 6afcfbf6aea2dca97f97a69fe4b45e16 ****/
		%feature("compactdefaultargs") SetCols;
		%feature("autodoc", "
Parameters
----------
theCol1: gp_XY
theCol2: gp_XY

Return
-------
None

Description
-----------
Assigns the number pairs thecol1, thecol2 to the two columns of this matrix.
") SetCols;
		void SetCols(const gp_XY & theCol1, const gp_XY & theCol2);

		/****************** SetDiagonal ******************/
		/**** md5 signature: 831afb46d8f41e1485c14a145a5c397d ****/
		%feature("compactdefaultargs") SetDiagonal;
		%feature("autodoc", "
Parameters
----------
theX1: float
theX2: float

Return
-------
None

Description
-----------
Modifies the main diagonal of the matrix. @code <self>.value (1, 1) = thex1 <self>.value (2, 2) = thex2 @endcode the other coefficients of the matrix are not modified.
") SetDiagonal;
		void SetDiagonal(const Standard_Real theX1, const Standard_Real theX2);

		/****************** SetIdentity ******************/
		/**** md5 signature: 29bad7dbd58ceb28d41fd54bb77dccfa ****/
		%feature("compactdefaultargs") SetIdentity;
		%feature("autodoc", "Return
-------
None

Description
-----------
Modifies this matrix, so that it represents the identity matrix.
") SetIdentity;
		void SetIdentity();

		/****************** SetRotation ******************/
		/**** md5 signature: 6c56d0255926866da01100ccb4acc92a ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theAng: float

Return
-------
None

Description
-----------
Modifies this matrix, so that it represents a rotation. theang is the angular value in radian of the rotation.
") SetRotation;
		void SetRotation(const Standard_Real theAng);

		/****************** SetRow ******************/
		/**** md5 signature: d981650ea71a835a33d95434ad748603 ****/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "
Parameters
----------
theRow: int
theValue: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of thevalue to the row of index therow of this matrix. raises outofrange if therow < 1 or therow > 2.
") SetRow;
		void SetRow(const Standard_Integer theRow, const gp_XY & theValue);

		/****************** SetRows ******************/
		/**** md5 signature: da27ff36201d86cdab3c3e4eeb2fb37f ****/
		%feature("compactdefaultargs") SetRows;
		%feature("autodoc", "
Parameters
----------
theRow1: gp_XY
theRow2: gp_XY

Return
-------
None

Description
-----------
Assigns the number pairs therow1, therow2 to the two rows of this matrix.
") SetRows;
		void SetRows(const gp_XY & theRow1, const gp_XY & theRow2);

		/****************** SetScale ******************/
		/**** md5 signature: 39248edf6ba1a4f4f31956da18ba572a ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
None

Description
-----------
Modifies the matrix such that it represents a scaling transformation, where thes is the scale factor: @code | thes 0.0 | <self> = | 0.0 thes | @endcode.
") SetScale;
		void SetScale(const Standard_Real theS);

		/****************** SetValue ******************/
		/**** md5 signature: 99a5a1dc4ea005a04a68da8d3f6274b3 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int
theValue: float

Return
-------
None

Description
-----------
Assigns <thevalue> to the coefficient of row therow, column thecol of this matrix. raises outofrange if therow < 1 or therow > 2 or thecol < 1 or thecol > 2.
") SetValue;
		void SetValue(const Standard_Integer theRow, const Standard_Integer theCol, const Standard_Real theValue);

		/****************** Subtract ******************/
		/**** md5 signature: 295bef982476844ba964928199c2de6a ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
None

Description
-----------
No available documentation.
") Subtract;
		void Subtract(const gp_Mat2d & theOther);

		/****************** Subtracted ******************/
		/**** md5 signature: 59b108ee65cbc1f892518bd1bd722b1c ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
Computes for each coefficient of the matrix: @code <self>.coef(i,j) - <theother>.coef(i,j) @endcode.
") Subtracted;
		gp_Mat2d Subtracted(const gp_Mat2d & theOther);

		/****************** Transpose ******************/
		/**** md5 signature: 70e27025c56428cd3bbca609f0f0cfbd ****/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Transpose;
		void Transpose();

		/****************** Transposed ******************/
		/**** md5 signature: 5698591f2ae126b757ed3b0b79fd6ff0 ****/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Transposes the matrix. a(j, i) -> a (i, j).
") Transposed;
		gp_Mat2d Transposed();

		/****************** Value ******************/
		/**** md5 signature: 6a2c4a8c6e47ce057687c7f426792775 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
float

Description
-----------
Returns the coefficient of range (ttheherow, thecol) raises outofrange if therow < 1 or therow > 2 or thecol < 1 or thecol > 2.
") Value;
		const Standard_Real & Value(const Standard_Integer theRow, const Standard_Integer theCol);

		/****************** operator * ******************/
		/**** md5 signature: d0d0707b77bef9cb4901ef6eb0b2a834 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator *;
		gp_Mat2d operator *(const gp_Mat2d & theOther);

		/****************** operator * ******************/
		/**** md5 signature: ba4e0d9feaa003b6bc088764b87a781e ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator *;
		gp_Mat2d operator *(const Standard_Real theScalar);


%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****************** operator + ******************/
		/**** md5 signature: 54c36bc4369636c7afd7afc5c0751c62 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator +;
		gp_Mat2d operator +(const gp_Mat2d & theOther);


%extend{
    void __iadd_wrapper__(const gp_Mat2d other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****************** operator - ******************/
		/**** md5 signature: e647ff009fd603b513358596ee1840b5 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Mat2d

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator -;
		gp_Mat2d operator -(const gp_Mat2d & theOther);


%extend{
    void __isub_wrapper__(const gp_Mat2d other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****************** operator / ******************/
		/**** md5 signature: 5c63861d0b75195db183dc66c54cc61c ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Mat2d

Description
-----------
No available documentation.
") operator /;
		gp_Mat2d operator /(const Standard_Real theScalar);


%extend{
    void __itruediv_wrapper__(const Standard_Real other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};



%extend gp_Mat2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Mat2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Mat2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Mat2d')
    }
};
%extend gp_Mat2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Parab *
*****************/
class gp_Parab {
	public:
		/****************** gp_Parab ******************/
		/**** md5 signature: 0bbad0099bcf19a0551fc6097a511ddf ****/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite parabola.
") gp_Parab;
		 gp_Parab();

		/****************** gp_Parab ******************/
		/**** md5 signature: d18d67a44c54d6e79987bb27f5fc733a ****/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2
theFocal: float

Return
-------
None

Description
-----------
Creates a parabola with its local coordinate system 'thea2' and it's focal length 'focal'. the xdirection of thea2 defines the axis of symmetry of the parabola. the ydirection of thea2 is parallel to the directrix of the parabola. the location point of thea2 is the vertex of the parabola raises constructionerror if thefocal < 0.0 raised if thefocal < 0.0.
") gp_Parab;
		 gp_Parab(const gp_Ax2 & theA2, const Standard_Real theFocal);

		/****************** gp_Parab ******************/
		/**** md5 signature: 259f994397123b24ee9112e5db353e42 ****/
		%feature("compactdefaultargs") gp_Parab;
		%feature("autodoc", "
Parameters
----------
theD: gp_Ax1
theF: gp_Pnt

Return
-------
None

Description
-----------
Thed is the directrix of the parabola and thef the focus point. the symmetry axis (xaxis) of the parabola is normal to the directrix and pass through the focus point thef, but its location point is the vertex of the parabola. the yaxis of the parabola is parallel to thed and its location point is the vertex of the parabola. the normal to the plane of the parabola is the cross product between the xaxis and the yaxis.
") gp_Parab;
		 gp_Parab(const gp_Ax1 & theD, const gp_Pnt & theF);

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the main axis of the parabola. it is the axis normal to the plane of the parabola passing through the vertex of the parabola.
") Axis;
		const gp_Ax1 Axis();

		/****************** Directrix ******************/
		/**** md5 signature: 1608f5c20dd70d6d9961c85822ba9a57 ****/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Computes the directrix of this parabola. the directrix is: - a line parallel to the 'y direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. the directrix is returned as an axis (a gp_ax1 object), the origin of which is situated on the 'x axis' of this parabola.
") Directrix;
		gp_Ax1 Directrix();

		/****************** Focal ******************/
		/**** md5 signature: aeac7f567b991e94a3e75e9ed626f41a ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance between the vertex and the focus of the parabola.
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		/**** md5 signature: dfde257d151e75b4057f91980799f5e1 ****/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
- computes the focus of the parabola.
") Focus;
		gp_Pnt Focus();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the vertex of the parabola. it is the 'location' point of the coordinate system of the parabola.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: fe89f8112cf4d2a04ad7022b85359be4 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Parab

Description
-----------
Performs the symmetrical transformation of a parabola with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Parab Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 2287a4a60fa325b82c4201ceb939ee25 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Parab

Description
-----------
Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Parab Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 94f2e68fa437c1cf68ae0df536058e66 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Parab

Description
-----------
Performs the symmetrical transformation of a parabola with respect to a plane. the axis placement thea2 locates the plane of the symmetry (location, xdirection, ydirection).
") Mirrored;
		gp_Parab Mirrored(const gp_Ax2 & theA2);

		/****************** Parameter ******************/
		/**** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the parameter of the parabola. it is the distance between the focus and the directrix of the parabola. this distance is twice the focal length.
") Parameter;
		Standard_Real Parameter();

		/****************** Position ******************/
		/**** md5 signature: 0919c787263d4f8ff9c1e18688f5d16c ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax2

Description
-----------
Returns the local coordinate system of the parabola.
") Position;
		const gp_Ax2 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 4f1b34fa3b174848f1ddf29327ccbcaa ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Parab

Description
-----------
Rotates a parabola. thea1 is the axis of the rotation. ang is the angular value of the rotation in radians.
") Rotated;
		gp_Parab Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 66bfdce4a427cf5b2ef35eb1420cd948 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Parab

Description
-----------
Scales a parabola. thes is the scaling value. if thes is negative the direction of the symmetry axis xaxis is reversed and the direction of the yaxis too.
") Scaled;
		gp_Parab Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Modifies this parabola by redefining its local coordinate system so that - its origin and 'main direction' become those of the axis thea1 (the 'x direction' and 'y direction' are then recomputed in the same way as for any gp_ax2) raises constructionerror if the direction of thea1 is parallel to the previous xaxis of the parabola.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetFocal ******************/
		/**** md5 signature: 914118839d136348fff0bd2af4a9537c ****/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "
Parameters
----------
theFocal: float

Return
-------
None

Description
-----------
Changes the focal distance of the parabola. raises constructionerror if thefocal < 0.0.
") SetFocal;
		void SetFocal(const Standard_Real theFocal);

		/****************** SetLocation ******************/
		/**** md5 signature: c106a7d7c472c3f26d65a1d2a029717b ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Changes the location of the parabola. it is the vertex of the parabola.
") SetLocation;
		void SetLocation(const gp_Pnt & theP);

		/****************** SetPosition ******************/
		/**** md5 signature: ebc7dd35ccc08a819f6ac865a49dfe89 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
Changes the local coordinate system of the parabola.
") SetPosition;
		void SetPosition(const gp_Ax2 & theA2);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: a150aee383b2d87a574bfc8b6d5e892c ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Parab

Description
-----------
Transforms a parabola with the transformation thet from class trsf.
") Transformed;
		gp_Parab Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: bb486ea3364fd7ef78ec6d03b4df872e ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Parab

Description
-----------
Translates a parabola in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Parab Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: 6dc200926e032f7777347e7b92260031 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Parab

Description
-----------
Translates a parabola from the point thep1 to the point thep2.
") Translated;
		gp_Parab Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the symmetry axis of the parabola. the location point of the axis is the vertex of the parabola.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
It is an axis parallel to the directrix of the parabola. the location point of this axis is the vertex of the parabola.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Parab {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Parab {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Parab()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Parab')
    }
};
%extend gp_Parab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class gp_Parab2d *
*******************/
class gp_Parab2d {
	public:
		/****************** gp_Parab2d ******************/
		/**** md5 signature: 291962acfc5fd970ae287b879ec2aed8 ****/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite parabola.
") gp_Parab2d;
		 gp_Parab2d();

		/****************** gp_Parab2d ******************/
		/**** md5 signature: 405849b455cdb8b4e9138d65424b5567 ****/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "
Parameters
----------
theMirrorAxis: gp_Ax2d
theFocalLength: float
theSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a parabola with its vertex point, its axis of symmetry ('xaxis') and its focal length. the sense of parametrization is given by thesense. if thesense == true (by default) then right-handed coordinate system is used, otherwise - left-handed. warnings: it is possible to have focallength = 0. in this case, the parabola looks like a line, which is parallel to the symmetry-axis. raises constructionerror if focallength < 0.0.
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax2d & theMirrorAxis, const Standard_Real theFocalLength, const Standard_Boolean theSense = Standard_True);

		/****************** gp_Parab2d ******************/
		/**** md5 signature: a85e70f69dcfb89ddc8141630ff5979c ****/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "
Parameters
----------
theAxes: gp_Ax22d
theFocalLength: float

Return
-------
None

Description
-----------
Creates a parabola with its vertex point, its axis of symmetry ('xaxis'), correspond y-axis and its focal length. warnings: it is possible to have focallength = 0. in this case, the parabola looks like a line, which is parallel to the symmetry-axis. raises constructionerror if focal < 0.0.
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax22d & theAxes, const Standard_Real theFocalLength);

		/****************** gp_Parab2d ******************/
		/**** md5 signature: d56288c65f680683fc33ea0d498efa76 ****/
		%feature("compactdefaultargs") gp_Parab2d;
		%feature("autodoc", "
Parameters
----------
theDirectrix: gp_Ax2d
theFocus: gp_Pnt2d
theSense: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a parabola with the directrix and the focus point. y-axis of the parabola (in user coordinate system - ucs) is the direction of thedirectrix. x-axis always directs from thedirectrix to thefocus point and always comes through thefocus. apex of the parabola is a middle point between the thefocus and the intersection point of thedirectrix and the x-axis. warnings: it is possible to have focallength = 0 (when thefocus lies in thedirectrix). in this case, x-direction of the parabola is defined by thesense parameter. if thesense == true (by default) then right-handed coordinate system is used, otherwise - left-handed. result parabola will look like a line, which is perpendicular to the directrix.
") gp_Parab2d;
		 gp_Parab2d(const gp_Ax2d & theDirectrix, const gp_Pnt2d & theFocus, const Standard_Boolean theSense = Standard_True);

		/****************** Axis ******************/
		/**** md5 signature: bb6928287841d9c7a18f8a1ff601c637 ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax22d

Description
-----------
Returns the local coordinate system of the parabola. the 'location' point of this axis is the vertex of the parabola.
") Axis;
		gp_Ax22d Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: cc309b22e72d7a2fa63d9f3b74f48eaa ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: float
theB: float
theC: float
theD: float
theE: float
theF: float

Description
-----------
Computes the coefficients of the implicit equation of the parabola (in wcs - world coordinate system). @code thea * (x**2) + theb * (y**2) + 2*thec*(x*y) + 2*thed*x + 2*thee*y + thef = 0. @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Directrix ******************/
		/**** md5 signature: ace6e59edfa4fed38fc517abd7cec6ce ****/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Computes the directrix of the parabola. the directrix is: - a line parallel to the 'y direction' of the local coordinate system of this parabola, and - located on the negative side of the axis of symmetry, at a distance from the apex which is equal to the focal length of this parabola. the directrix is returned as an axis (a gp_ax2d object), the origin of which is situated on the 'x axis' of this parabola.
") Directrix;
		gp_Ax2d Directrix();

		/****************** Focal ******************/
		/**** md5 signature: aeac7f567b991e94a3e75e9ed626f41a ****/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance between the vertex and the focus of the parabola.
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		/**** md5 signature: 2ce52ee40e448c1b642e3a9bf8a3fbec ****/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the focus of the parabola.
") Focus;
		gp_Pnt2d Focus();

		/****************** IsDirect ******************/
		/**** md5 signature: 218f7b7b68e34847c5868fa318c903a4 ****/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system is direct and false in the other case.
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Location ******************/
		/**** md5 signature: 0ccfb15f39bdabe9af01f2b820a918f5 ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the vertex of the parabola.
") Location;
		gp_Pnt2d Location();

		/****************** Mirror ******************/
		/**** md5 signature: 5f85e7eebe220829e022319813e0b5b1 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** MirrorAxis ******************/
		/**** md5 signature: ce1fe7cd33c0fca4d7b8e7b672b5c2c7 ****/
		%feature("compactdefaultargs") MirrorAxis;
		%feature("autodoc", "Return
-------
gp_Ax2d

Description
-----------
Returns the symmetry axis of the parabola. the 'location' point of this axis is the vertex of the parabola.
") MirrorAxis;
		gp_Ax2d MirrorAxis();

		/****************** Mirrored ******************/
		/**** md5 signature: cea50d8fa8f76255f4ded39c85765866 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Parab2d

Description
-----------
Performs the symmetrical transformation of a parabola with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Parab2d Mirrored(const gp_Pnt2d & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: e37d521225c3b5550e609e90c32706d4 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Parab2d

Description
-----------
Performs the symmetrical transformation of a parabola with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Parab2d Mirrored(const gp_Ax2d & theA);

		/****************** Parameter ******************/
		/**** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the distance between the focus and the directrix of the parabola.
") Parameter;
		Standard_Real Parameter();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 6bf48843f087cae95361a7db862af02b ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
Reverses the orientation of the local coordinate system of this parabola (the 'y direction' is reversed). therefore, the implicit orientation of this parabola is reversed. note: - reverse assigns the result to this parabola, while - reversed creates a new one.
") Reversed;
		gp_Parab2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 4514855f978c37f3ce31a9851c5a1153 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 07b05b09ee490ccc0dcf9bfeb8aeff28 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Parab2d

Description
-----------
Rotates a parabola. thep is the center of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Parab2d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: c464bf78519bd3beeec5dd2bb7f74ab0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: ec9c4eee0dc5bc4eb7da490464ae30f0 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Parab2d

Description
-----------
Scales a parabola. thes is the scaling value. if thes is negative the direction of the symmetry axis 'xaxis' is reversed and the direction of the 'yaxis' too.
") Scaled;
		gp_Parab2d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: fba67a5039095eddccca14c1039ad8be ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax22d

Return
-------
None

Description
-----------
Changes the local coordinate system of the parabola. the 'location' point of a becomes the vertex of the parabola.
") SetAxis;
		void SetAxis(const gp_Ax22d & theA);

		/****************** SetFocal ******************/
		/**** md5 signature: 914118839d136348fff0bd2af4a9537c ****/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "
Parameters
----------
theFocal: float

Return
-------
None

Description
-----------
Changes the focal distance of the parabola warnings: it is possible to have thefocal = 0. raises constructionerror if thefocal < 0.0.
") SetFocal;
		void SetFocal(const Standard_Real theFocal);

		/****************** SetLocation ******************/
		/**** md5 signature: fea6486624f66c26e32103313f4d0c00 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the 'location' point of the parabola. it is the vertex of the parabola.
") SetLocation;
		void SetLocation(const gp_Pnt2d & theP);

		/****************** SetMirrorAxis ******************/
		/**** md5 signature: 281723b9c71ee4e90da8e3a736ceba20 ****/
		%feature("compactdefaultargs") SetMirrorAxis;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Modifies this parabola, by redefining its local coordinate system so that its origin and 'x direction' become those of the axis ma. the 'y direction' of the local coordinate system is then recomputed. the orientation of the local coordinate system is not modified.
") SetMirrorAxis;
		void SetMirrorAxis(const gp_Ax2d & theA);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 41be15349bfdbf87db07ecec6d33d1cd ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Parab2d

Description
-----------
Transforms an parabola with the transformation thet from class trsf2d.
") Transformed;
		gp_Parab2d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: f3112504d8f922313d0ee62e8d9fc9ad ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 2c746dedc8aae05728c2d583b3a2cce0 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Parab2d

Description
-----------
Translates a parabola in the direction of the vectorthe thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Parab2d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: 82da40ba35b417f0713a397be09f8f54 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Parab2d

Description
-----------
Translates a parabola from the point thep1 to the point thep2.
") Translated;
		gp_Parab2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

};



%extend gp_Parab2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Parab2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Parab2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Parab2d')
    }
};
%extend gp_Parab2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Pln *
***************/
class gp_Pln {
	public:
		/****************** gp_Pln ******************/
		/**** md5 signature: 140af8c29cb7bcbff8bb0020dde34c46 ****/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a plane coincident with oxy plane of the reference coordinate system.
") gp_Pln;
		 gp_Pln();

		/****************** gp_Pln ******************/
		/**** md5 signature: 7ef965f86daf93d3e23e0a60703eea5a ****/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
The coordinate system of the plane is defined with the axis placement thea3. the 'direction' of thea3 defines the normal to the plane. the 'location' of thea3 defines the location (origin) of the plane. the 'xdirection' and 'ydirection' of thea3 define the 'xaxis' and the 'yaxis' of the plane used to parametrize the plane.
") gp_Pln;
		 gp_Pln(const gp_Ax3 & theA3);

		/****************** gp_Pln ******************/
		/**** md5 signature: cd878bd00d8e7f7e40bc5c64f2ded125 ****/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a plane with the 'location' point <thep> and the normal direction <thev>.
") gp_Pln;
		 gp_Pln(const gp_Pnt & theP, const gp_Dir & theV);

		/****************** gp_Pln ******************/
		/**** md5 signature: 888b21523cb73deacf86d8e6b60df7fa ****/
		%feature("compactdefaultargs") gp_Pln;
		%feature("autodoc", "
Parameters
----------
theA: float
theB: float
theC: float
theD: float

Return
-------
None

Description
-----------
Creates a plane from its cartesian equation: @code thea * x + theb * y + thec * z + thed = 0.0 @endcode raises constructionerror if sqrt (thea*thea + theb*theb + thec*thec) <= resolution from gp.
") gp_Pln;
		 gp_Pln(const Standard_Real theA, const Standard_Real theB, const Standard_Real theC, const Standard_Real theD);

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the plane's normal axis.
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 44a7f776c114f4bc8a46f0e436e03316 ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA: float
theB: float
theC: float
theD: float

Description
-----------
Returns the coefficients of the plane's cartesian equation: @code thea * x + theb * y + thec * z + thed = 0. @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Contains ******************/
		/**** md5 signature: 505c74c81a15c8244323a9eb031db0f3 ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theLinearTolerance: float

Return
-------
bool

Description
-----------
Returns true if this plane contains the point thep. this means that - the distance between point thep and this plane is less than or equal to thelineartolerance, or - line l is normal to the 'main axis' of the local coordinate system of this plane, within the tolerance angulartolerance, and the distance between the origin of line l and this plane is less than or equal to thelineartolerance.
") Contains;
		Standard_Boolean Contains(const gp_Pnt & theP, const Standard_Real theLinearTolerance);

		/****************** Contains ******************/
		/**** md5 signature: 8d44abe0142c409a5d892b85aa8ca31a ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin
theLinearTolerance: float
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if this plane contains the line thel. this means that - the distance between point p and this plane is less than or equal to lineartolerance, or - line thel is normal to the 'main axis' of the local coordinate system of this plane, within the tolerance theangulartolerance, and the distance between the origin of line thel and this plane is less than or equal to thelineartolerance.
") Contains;
		Standard_Boolean Contains(const gp_Lin & theL, const Standard_Real theLinearTolerance, const Standard_Real theAngularTolerance);

		/****************** Direct ******************/
		/**** md5 signature: 2c90be540a5bf9418e7461f7f76c970a ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the ax3 is right handed.
") Direct;
		Standard_Boolean Direct();

		/****************** Distance ******************/
		/**** md5 signature: 24964ab9dd1f6799bfd0455d7b81296d ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
float

Description
-----------
Computes the distance between <self> and the point <thep>.
") Distance;
		Standard_Real Distance(const gp_Pnt & theP);

		/****************** Distance ******************/
		/**** md5 signature: 198724346be23e2bc86a254093c956fb ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin

Return
-------
float

Description
-----------
Computes the distance between <self> and the line <thel>.
") Distance;
		Standard_Real Distance(const gp_Lin & theL);

		/****************** Distance ******************/
		/**** md5 signature: 14db36f60da7d047b7f51555682697cd ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pln

Return
-------
float

Description
-----------
Computes the distance between two planes.
") Distance;
		Standard_Real Distance(const gp_Pln & theOther);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the plane's location (origin).
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: aaee3f75b4b0b4d3727886f40f1d286a ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Pln

Description
-----------
Performs the symmetrical transformation of a plane with respect to the point <thep> which is the center of the symmetry warnings: the normal direction to the plane is not changed. the 'xaxis' and the 'yaxis' are reversed.
") Mirrored;
		gp_Pln Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 0e2502af0a365506e551fbc184d8e996 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Pln

Description
-----------
Performs the symmetrical transformation of a plane with respect to an axis placement which is the axis of the symmetry. the transformation is performed on the 'location' point, on the 'xaxis' and the 'yaxis'. the resulting normal direction is the cross product between the 'xdirection' and the 'ydirection' after transformation if the initial plane was right handed, else it is the opposite.
") Mirrored;
		gp_Pln Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: dbb0d054805c887442482a051a9bdb57 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Pln

Description
-----------
Performs the symmetrical transformation of a plane with respect to an axis placement. the axis placement <a2> locates the plane of the symmetry. the transformation is performed on the 'location' point, on the 'xaxis' and the 'yaxis'. the resulting normal direction is the cross product between the 'xdirection' and the 'ydirection' after transformation if the initial plane was right handed, else it is the opposite.
") Mirrored;
		gp_Pln Mirrored(const gp_Ax2 & theA2);

		/****************** Position ******************/
		/**** md5 signature: c702d3a208cf0124b56544ef1f5c6ae7 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinate system of the plane .
") Position;
		const gp_Ax3 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: a66e3ce3f9504b1f0ce36b5ae26abdaf ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Pln

Description
-----------
Rotates a plane. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Pln Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: 2e3ad744b562b37602bc0d7050246d12 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 5a37d6e396a9b9dc90716cc868a30952 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Pln

Description
-----------
Scales a plane. thes is the scaling value.
") Scaled;
		gp_Pln Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Modifies this plane, by redefining its local coordinate system so that - its origin and 'main direction' become those of the axis thea1 (the 'x direction' and 'y direction' are then recomputed). raises constructionerror if the thea1 is parallel to the 'xaxis' of the plane.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: 549208ae587d601427fb98d16d4de1b7 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLoc: gp_Pnt

Return
-------
None

Description
-----------
Changes the origin of the plane.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****************** SetPosition ******************/
		/**** md5 signature: c788767c1fc0ca73bdf3541037626780 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the plane.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****************** SquareDistance ******************/
		/**** md5 signature: 7fbe88c31283387e08156a089bc874fa ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
float

Description
-----------
Computes the square distance between <self> and the point <thep>.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & theP);

		/****************** SquareDistance ******************/
		/**** md5 signature: 726f7e90111b550a0e03051ce3f6cdf3 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin

Return
-------
float

Description
-----------
Computes the square distance between <self> and the line <thel>.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Lin & theL);

		/****************** SquareDistance ******************/
		/**** md5 signature: bd937c8018e0c30032be03ab4d808364 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pln

Return
-------
float

Description
-----------
Computes the square distance between two planes.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pln & theOther);

		/****************** Transform ******************/
		/**** md5 signature: ad39e75f28af84e2a27f2cfbe322b0a3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: a0f51f2c7779cdb47a1bad32b7e3c2a9 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Pln

Description
-----------
Transforms a plane with the transformation thet from class trsf. the transformation is performed on the 'location' point, on the 'xaxis' and the 'yaxis'. the resulting normal direction is the cross product between the 'xdirection' and the 'ydirection' after transformation.
") Transformed;
		gp_Pln Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 6a8f35bf5a7da8b90e5bc907c51ed0ca ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Pln

Description
-----------
Translates a plane in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Pln Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: 4430861dd695a6808edb95f41a1bfa5f ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Pln

Description
-----------
Translates a plane from the point thep1 to the point thep2.
") Translated;
		gp_Pln Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** UReverse ******************/
		/**** md5 signature: b0197b2ee987c6cd2138becb024e1db6 ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the u parametrization of the plane reversing the xaxis.
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 4d0389515240266be0c86e204c81b7a9 ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the v parametrization of the plane reversing the yaxis.
") VReverse;
		void VReverse();

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the x axis of the plane.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the y axis of the plane.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Pln {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Pln {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Pln()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Pln')
    }
};
%extend gp_Pln {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Pnt *
***************/
class gp_Pnt {
	public:
		/****************** gp_Pnt ******************/
		/**** md5 signature: 099de985bdbcec96b9980976b3feac15 ****/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a point with zero coordinates.
") gp_Pnt;
		 gp_Pnt();

		/****************** gp_Pnt ******************/
		/**** md5 signature: 38c6c68bfa22a1daddd2c4838da7eb3e ****/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Creates a point from a xyz object.
") gp_Pnt;
		 gp_Pnt(const gp_XYZ & theCoord);

		/****************** gp_Pnt ******************/
		/**** md5 signature: 89fa34ea9824847657d3dce98df8da86 ****/
		%feature("compactdefaultargs") gp_Pnt;
		%feature("autodoc", "
Parameters
----------
theXp: float
theYp: float
theZp: float

Return
-------
None

Description
-----------
Creates a point with its 3 cartesian's coordinates: thexp, theyp, thezp.
") gp_Pnt;
		 gp_Pnt(const Standard_Real theXp, const Standard_Real theYp, const Standard_Real theZp);

		/****************** BaryCenter ******************/
		/**** md5 signature: faacda518a6b395ff8b8684b538dbb23 ****/
		%feature("compactdefaultargs") BaryCenter;
		%feature("autodoc", "
Parameters
----------
theAlpha: float
theP: gp_Pnt
theBeta: float

Return
-------
None

Description
-----------
Assigns the result of the following expression to this point (thealpha*this + thebeta*thep) / (thealpha + thebeta).
") BaryCenter;
		void BaryCenter(const Standard_Real theAlpha, const gp_Pnt & theP, const Standard_Real theBeta);

		/****************** ChangeCoord ******************/
		/**** md5 signature: 0e3894b34dd11dbea7adf08d1c89e1e7 ****/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the coordinates of this point. note: this syntax allows direct modification of the returned value.
") ChangeCoord;
		gp_XYZ ChangeCoord();

		/****************** Coord ******************/
		/**** md5 signature: 8be7c51c8cc2bc59521f97740b0be5d2 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns the coordinate of corresponding to the value of theindex: theindex = 1 => x is returned theindex = 2 => y is returned theindex = 3 => z is returned raises outofrange if theindex != {1, 2, 3}. raised if theindex != {1, 2, 3}.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: a056f18fedc0073150abc3612c7d01fe ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXp: float
theYp: float
theZp: float

Description
-----------
For this point gives its three coordinates thexp, theyp and thezp.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coord ******************/
		/**** md5 signature: 36c1be5bcfb562eadb6e4b004da8d3ca ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
For this point, returns its three coordinates as a xyz object.
") Coord;
		const gp_XYZ Coord();

		/****************** Distance ******************/
		/**** md5 signature: 9b81353e35619739142e6bdcae4f4017 ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt

Return
-------
float

Description
-----------
Computes the distance between two points.
") Distance;
		Standard_Real Distance(const gp_Pnt & theOther);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };

        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****************** IsEqual ******************/
		/**** md5 signature: 866076bc094329e46528454cace96967 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt
theLinearTolerance: float

Return
-------
bool

Description
-----------
Comparison returns true if the distance between the two points is lower or equal to thelineartolerance.
") IsEqual;
		Standard_Boolean IsEqual(const gp_Pnt & theOther, const Standard_Real theLinearTolerance);

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a point with respect to the point thep which is the center of the symmetry.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: d62d4e27193b622c076eedda443dd05d ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
Performs the symmetrical transformation of a point with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Pnt Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 895bbd5f51ce6cc09922789f1bae8aa1 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Pnt

Description
-----------
Performs the symmetrical transformation of a point with respect to a plane. the axis placement thea2 locates the plane of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Pnt Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: e26626a8fdddffe688d8ec14b1896d4d ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Pnt

Description
-----------
Rotates a point. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Mirrored;
		gp_Pnt Mirrored(const gp_Ax2 & theA2);

		/****************** Rotate ******************/
		/**** md5 signature: c26ecb0fe9ed773c4bd2ec6af298bfe8 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 9cfabdd2c743c9aa4b05075dcfe9d285 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Rotated;
		gp_Pnt Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
Scales a point. thes is the scaling value.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: ff1abdc34f75773777b61d17e8e084d6 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Scaled;
		gp_Pnt Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetCoord ******************/
		/**** md5 signature: 52cef977af7789ed4ebe28e0285a09a0 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
Changes the coordinate of range theindex: theindex = 1 => x is modified theindex = 2 => y is modified theindex = 3 => z is modified raised if theindex != {1, 2, 3}.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetCoord ******************/
		/**** md5 signature: fad469ec3e7a0663ac99248a42f8d4dd ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXp: float
theYp: float
theZp: float

Return
-------
None

Description
-----------
For this point, assigns the values thexp, theyp and thezp to its three coordinates.
") SetCoord;
		void SetCoord(const Standard_Real theXp, const Standard_Real theYp, const Standard_Real theZp);

		/****************** SetX ******************/
		/**** md5 signature: 1bf65ee31f0303d20dd96cc6dbcfa44e ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this point.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetXYZ ******************/
		/**** md5 signature: 310569de5a825945530b122be4e6ca69 ****/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of thecoord to this point.
") SetXYZ;
		void SetXYZ(const gp_XYZ & theCoord);

		/****************** SetY ******************/
		/**** md5 signature: 4d69a9fe7ed8a7d182afbae632001bd2 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the y coordinate of this point.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** SetZ ******************/
		/**** md5 signature: 50f9696665e382f6944bd96e35b0a063 ****/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: float

Return
-------
None

Description
-----------
Assigns the given value to the z coordinate of this point.
") SetZ;
		void SetZ(const Standard_Real theZ);

		/****************** SquareDistance ******************/
		/**** md5 signature: e963f6cbbfaed54cf3e1fbe75926f236 ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt

Return
-------
float

Description
-----------
Computes the square distance between two points.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt & theOther);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Transforms a point with the transformation t.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: b8b244cee1953af992aa6ca96ff8e3f7 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Transformed;
		gp_Pnt Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0ada1d82324919fb7ff289d966f45df1 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Translates a point in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Translates a point from the point thep1 to the point thep2.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 70fea41caf97670b5be8d4ee99722cf4 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Translated;
		gp_Pnt Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: 000ced473994371719256ec6ea61a643 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Translated;
		gp_Pnt Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this point, returns its x coordinate.
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		/**** md5 signature: 0648fd358f9622b8fa775d64dec0d0a4 ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
For this point, returns its three coordinates as a xyz object.
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this point, returns its y coordinate.
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 786e228d2eeaf64f99dd51d3ab338f77 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this point, returns its z coordinate.
") Z;
		Standard_Real Z();

};



%extend gp_Pnt {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Pnt {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Pnt()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Pnt')
    }
};
%extend gp_Pnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Pnt2d *
*****************/
class gp_Pnt2d {
	public:
		/****************** gp_Pnt2d ******************/
		/**** md5 signature: 15f9751e9c3d41985f179b71d5a5032a ****/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a point with zero coordinates.
") gp_Pnt2d;
		 gp_Pnt2d();

		/****************** gp_Pnt2d ******************/
		/**** md5 signature: 0b115859fd49adc9dce6d509324fa434 ****/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Creates a point with a doublet of coordinates.
") gp_Pnt2d;
		 gp_Pnt2d(const gp_XY & theCoord);

		/****************** gp_Pnt2d ******************/
		/**** md5 signature: ac15eb02af5890f339b11a9688b48bb2 ****/
		%feature("compactdefaultargs") gp_Pnt2d;
		%feature("autodoc", "
Parameters
----------
theXp: float
theYp: float

Return
-------
None

Description
-----------
Creates a point with its 2 cartesian's coordinates: thexp, theyp.
") gp_Pnt2d;
		 gp_Pnt2d(const Standard_Real theXp, const Standard_Real theYp);

		/****************** ChangeCoord ******************/
		/**** md5 signature: f799b091563773cd52b21654e211a935 ****/
		%feature("compactdefaultargs") ChangeCoord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the coordinates of this point. note: this syntax allows direct modification of the returned value.
") ChangeCoord;
		gp_XY ChangeCoord();

		/****************** Coord ******************/
		/**** md5 signature: 8be7c51c8cc2bc59521f97740b0be5d2 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns the coordinate of range theindex: theindex = 1 => x is returned theindex = 2 => y is returned raises outofrange if theindex != {1, 2}.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: 441658ba68cf9672400126d589e8a4c6 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXp: float
theYp: float

Description
-----------
For this point returns its two coordinates as a number pair.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Coord ******************/
		/**** md5 signature: 55c3583d2b85a3d85724dfd062f17fa4 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this point, returns its two coordinates as a number pair.
") Coord;
		const gp_XY Coord();

		/****************** Distance ******************/
		/**** md5 signature: 83a823e839651576a7291054dda0db6e ****/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt2d

Return
-------
float

Description
-----------
Computes the distance between two points.
") Distance;
		Standard_Real Distance(const gp_Pnt2d & theOther);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** IsEqual ******************/
		/**** md5 signature: dcdc340de48c0cde13c42d260d47b39e ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt2d
theLinearTolerance: float

Return
-------
bool

Description
-----------
Comparison returns true if the distance between the two points is lower or equal to thelineartolerance.
") IsEqual;
		Standard_Boolean IsEqual(const gp_Pnt2d & theOther, const Standard_Real theLinearTolerance);

		/****************** Mirror ******************/
		/**** md5 signature: 5f85e7eebe220829e022319813e0b5b1 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a point with respect to the point thep which is the center of the symmetry.
") Mirror;
		void Mirror(const gp_Pnt2d & theP);

		/****************** Mirror ******************/
		/**** md5 signature: ec42c083971941a78ed6667e3ee849d3 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2d & theA);

		/****************** Mirrored ******************/
		/**** md5 signature: a394e9cdf42df95aaeb896b295efd181 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
gp_Pnt2d

Description
-----------
Performs the symmetrical transformation of a point with respect to an axis placement which is the axis.
") Mirrored;
		gp_Pnt2d Mirrored(const gp_Pnt2d & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 084dc292f53e7e05aa08e651da8ea51d ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Mirrored;
		gp_Pnt2d Mirrored(const gp_Ax2d & theA);

		/****************** Rotate ******************/
		/**** md5 signature: 96011b42c3eec1be38fcc33efc511d13 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
Rotates a point. thea1 is the axis of the rotation. ang is the angular value of the rotation in radians.
") Rotate;
		void Rotate(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 80774d069fdedac1343712f2af5b8cc4 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Rotated;
		gp_Pnt2d Rotated(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: c464bf78519bd3beeec5dd2bb7f74ab0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
Scales a point. thes is the scaling value.
") Scale;
		void Scale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 63b2d5cdd488ba49fc8bae89b03b1d04 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Scaled;
		gp_Pnt2d Scaled(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetCoord ******************/
		/**** md5 signature: 52cef977af7789ed4ebe28e0285a09a0 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
Assigns the value xi to the coordinate that corresponds to theindex: theindex = 1 => x is modified theindex = 2 => y is modified raises outofrange if theindex != {1, 2}.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetCoord ******************/
		/**** md5 signature: a3837cf1cd8704bc76a1d90d6ec89b1d ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXp: float
theYp: float

Return
-------
None

Description
-----------
For this point, assigns the values thexp and theyp to its two coordinates.
") SetCoord;
		void SetCoord(const Standard_Real theXp, const Standard_Real theYp);

		/****************** SetX ******************/
		/**** md5 signature: 1bf65ee31f0303d20dd96cc6dbcfa44e ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this point.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetXY ******************/
		/**** md5 signature: a04e254971f4b44fa9cc1f7852c920de ****/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of coord to this point.
") SetXY;
		void SetXY(const gp_XY & theCoord);

		/****************** SetY ******************/
		/**** md5 signature: 4d69a9fe7ed8a7d182afbae632001bd2 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the y coordinate of this point.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** SquareDistance ******************/
		/**** md5 signature: 75c645d9981804bae577e693f134b33f ****/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Pnt2d

Return
-------
float

Description
-----------
Computes the square distance between two points.
") SquareDistance;
		Standard_Real SquareDistance(const gp_Pnt2d & theOther);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Transforms a point with the transformation thet.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 156a0e54c907356c56d5ce58236049de ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Transformed;
		gp_Pnt2d Transformed(const gp_Trsf2d & theT);

		/****************** Translate ******************/
		/**** md5 signature: 09ec5cd8c4d746c4df37ebfb0be314fb ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Translates a point in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translate;
		void Translate(const gp_Vec2d & theV);

		/****************** Translate ******************/
		/**** md5 signature: edde3614f43331c7884ace28c720ab8c ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Translates a point from the point thep1 to the point thep2.
") Translate;
		void Translate(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Translated ******************/
		/**** md5 signature: f9bac74279b6775189a223ba713e8f9f ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Translated;
		gp_Pnt2d Translated(const gp_Vec2d & theV);

		/****************** Translated ******************/
		/**** md5 signature: 1b5a02c1209fa5adf61f69d1b08ab171 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Translated;
		gp_Pnt2d Translated(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this point, returns its x coordinate.
") X;
		Standard_Real X();

		/****************** XY ******************/
		/**** md5 signature: 8129e296b053b8847fa5f009e7848507 ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this point, returns its two coordinates as a number pair.
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this point, returns its y coordinate.
") Y;
		Standard_Real Y();

};



%extend gp_Pnt2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Pnt2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Pnt2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Pnt2d')
    }
};
%extend gp_Pnt2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class gp_Quaternion *
**********************/
class gp_Quaternion {
	public:
		/****************** gp_Quaternion ******************/
		/**** md5 signature: 8fd7b50aec9da4510c148f23c42e1b2e ****/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an identity quaternion.
") gp_Quaternion;
		 gp_Quaternion();

		/****************** gp_Quaternion ******************/
		/**** md5 signature: 8cebe83ce1935c76fd992440dba8de74 ****/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float
theW: float

Return
-------
None

Description
-----------
Creates quaternion directly from component values.
") gp_Quaternion;
		 gp_Quaternion(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theW);

		/****************** gp_Quaternion ******************/
		/**** md5 signature: 186a9071fd1f4bab52cf360e731389af ****/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec

Return
-------
None

Description
-----------
Creates quaternion representing shortest-arc rotation operator producing vector thevecto from vector thevecfrom.
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theVecFrom, const gp_Vec & theVecTo);

		/****************** gp_Quaternion ******************/
		/**** md5 signature: 7fd5e10c59598813a82dcb16327b3428 ****/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec
theHelpCrossVec: gp_Vec

Return
-------
None

Description
-----------
Creates quaternion representing shortest-arc rotation operator producing vector thevecto from vector thevecfrom. additional vector thehelpcrossvec defines preferred direction for rotation and is used when thevecto and thevecfrom are directed oppositely.
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theVecFrom, const gp_Vec & theVecTo, const gp_Vec & theHelpCrossVec);

		/****************** gp_Quaternion ******************/
		/**** md5 signature: 67d9b3bd93552e61c41be50a935d92e9 ****/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Vec
theAngle: float

Return
-------
None

Description
-----------
Creates quaternion representing rotation on angle theangle around vector theaxis.
") gp_Quaternion;
		 gp_Quaternion(const gp_Vec & theAxis, const Standard_Real theAngle);

		/****************** gp_Quaternion ******************/
		/**** md5 signature: f72061baca48c37e52bb33d3fb34b2c9 ****/
		%feature("compactdefaultargs") gp_Quaternion;
		%feature("autodoc", "
Parameters
----------
theMat: gp_Mat

Return
-------
None

Description
-----------
Creates quaternion from rotation matrix 3*3 (which should be orthonormal skew-symmetric matrix).
") gp_Quaternion;
		 gp_Quaternion(const gp_Mat & theMat);

		/****************** Add ******************/
		/**** md5 signature: 89bc03e00ba8a3a9b28df641bf26e36f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
None

Description
-----------
Adds components of other quaternion; result is 'rotations mix'.
") Add;
		void Add(const gp_Quaternion & theOther);

		/****************** Added ******************/
		/**** md5 signature: 8b46bda795a294d1184244c8836f1f02 ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
Makes sum of quaternion components; result is 'rotations mix'.
") Added;
		gp_Quaternion Added(const gp_Quaternion & theOther);

		/****************** Dot ******************/
		/**** md5 signature: f91a72d22c72f7999ccfa16ca1a8b03b ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
float

Description
-----------
Computes inner product / scalar product / dot.
") Dot;
		Standard_Real Dot(const gp_Quaternion & theOther);

		/****************** GetEulerAngles ******************/
		/**** md5 signature: 858ec6e98f8ac9b013d0c47e564c3f13 ****/
		%feature("compactdefaultargs") GetEulerAngles;
		%feature("autodoc", "
Parameters
----------
theOrder: gp_EulerSequence

Return
-------
theAlpha: float
theBeta: float
theGamma: float

Description
-----------
Returns euler angles describing current rotation.
") GetEulerAngles;
		void GetEulerAngles(const gp_EulerSequence theOrder, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetMatrix ******************/
		/**** md5 signature: b713aea5ecd36799afb034f7a8cb805c ****/
		%feature("compactdefaultargs") GetMatrix;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Returns rotation operation as 3*3 matrix.
") GetMatrix;
		gp_Mat GetMatrix();

		/****************** GetRotationAngle ******************/
		/**** md5 signature: df2f57e7257eb50bc4a37dacae6aec21 ****/
		%feature("compactdefaultargs") GetRotationAngle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return rotation angle from -pi to pi.
") GetRotationAngle;
		Standard_Real GetRotationAngle();

		/****************** GetVectorAndAngle ******************/
		/**** md5 signature: c25ff6da9e4be0e2a3559f1af7e29e6f ****/
		%feature("compactdefaultargs") GetVectorAndAngle;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Vec

Return
-------
theAngle: float

Description
-----------
Convert a quaternion to axis+angle representation, preserve the axis direction and angle from -pi to +pi.
") GetVectorAndAngle;
		void GetVectorAndAngle(gp_Vec & theAxis, Standard_Real &OutValue);

		/****************** Invert ******************/
		/**** md5 signature: 27ae24404e0570a708e2e3589a9d9074 ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
Inverts quaternion (both rotation direction and norm).
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: b265662c44dfd7a96dad7992e3c425e6 ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Return inversed quaternion q^-1.
") Inverted;
		gp_Quaternion Inverted();

		/****************** IsEqual ******************/
		/**** md5 signature: 194ecc3e695bd2557b35338e153dfbd5 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
bool

Description
-----------
Simple equal test without precision.
") IsEqual;
		Standard_Boolean IsEqual(const gp_Quaternion & theOther);

		/****************** Multiplied ******************/
		/**** md5 signature: f63c763a6bb61294f87ae40ab0dca3a7 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
Multiply function - work the same as matrices multiplying. @code qq' = (cross(v,v') + wv' + w'v, ww' - dot(v,v')) @endcode result is rotation combination: q' than q (here q=this, q'=theq). notices that: @code qq' != q'q; qq^-1 = q; @endcode.
") Multiplied;
		gp_Quaternion Multiplied(const gp_Quaternion & theOther);

		/****************** Multiply ******************/
		/**** md5 signature: 1d8be55262472fb250e74724b4ecdfa6 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
None

Description
-----------
Adds rotation by multiplication.
") Multiply;
		void Multiply(const gp_Quaternion & theOther);

		/****************** Multiply ******************/
		/**** md5 signature: ced669a12f9467bc1c436087062a6afc ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theVec: gp_Vec

Return
-------
gp_Vec

Description
-----------
Rotates vector by quaternion as rotation operator.
") Multiply;
		gp_Vec Multiply(const gp_Vec & theVec);

		/****************** Negated ******************/
		/**** md5 signature: 4c5b02a3e13f06f61fe16a23f8d56de2 ****/
		%feature("compactdefaultargs") Negated;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Returns quaternion with all components negated. note that this operation does not affect neither rotation operator defined by quaternion nor its norm.
") Negated;
		gp_Quaternion Negated();

		/****************** Norm ******************/
		/**** md5 signature: 350002efee6c6e1339f68d9fdd29b06b ****/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns norm of quaternion.
") Norm;
		Standard_Real Norm();

		/****************** Normalize ******************/
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Scale quaternion that its norm goes to 1. the appearing of 0 magnitude or near is a error, so we can be sure that can divide by magnitude.
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: d58f1c9978a9da4b8d155ede031c091b ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Returns quaternion scaled so that its norm goes to 1.
") Normalized;
		gp_Quaternion Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverse direction of rotation (conjugate quaternion).
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: c7f823a29a9553c5d6df85c0a9066880 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Return rotation with reversed direction (conjugated quaternion).
") Reversed;
		gp_Quaternion Reversed();

		/****************** Scale ******************/
		/**** md5 signature: d90438501cb2e3c1df2f960e1732ab23 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
None

Description
-----------
Scale all components by quaternion by thescale; note that rotation is not changed by this operation (except 0-scaling).
") Scale;
		void Scale(const Standard_Real theScale);

		/****************** Scaled ******************/
		/**** md5 signature: 311b1fcd3c656bb24814aba6b2ad4069 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
gp_Quaternion

Description
-----------
Returns scaled quaternion.
") Scaled;
		gp_Quaternion Scaled(const Standard_Real theScale);

		/****************** Set ******************/
		/**** md5 signature: 0a5e78dcfe46f1c15ec4f35538edd5c5 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float
theW: float

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ, const Standard_Real theW);

		/****************** Set ******************/
		/**** md5 signature: ad310ae032124af045ddec68bbe1f321 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theQuaternion: gp_Quaternion

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const gp_Quaternion & theQuaternion);

		/****************** SetEulerAngles ******************/
		/**** md5 signature: 3d1d996912bb69649939bcb3dfb99030 ****/
		%feature("compactdefaultargs") SetEulerAngles;
		%feature("autodoc", "
Parameters
----------
theOrder: gp_EulerSequence
theAlpha: float
theBeta: float
theGamma: float

Return
-------
None

Description
-----------
Create a unit quaternion representing rotation defined by generalized euler angles.
") SetEulerAngles;
		void SetEulerAngles(const gp_EulerSequence theOrder, const Standard_Real theAlpha, const Standard_Real theBeta, const Standard_Real theGamma);

		/****************** SetIdent ******************/
		/**** md5 signature: c7362881acda19ff040f54aac2c65c5e ****/
		%feature("compactdefaultargs") SetIdent;
		%feature("autodoc", "Return
-------
None

Description
-----------
Make identity quaternion (zero-rotation).
") SetIdent;
		void SetIdent();

		/****************** SetMatrix ******************/
		/**** md5 signature: a4cbfa86f7b0850889e49d3a99812bf2 ****/
		%feature("compactdefaultargs") SetMatrix;
		%feature("autodoc", "
Parameters
----------
theMat: gp_Mat

Return
-------
None

Description
-----------
Create a unit quaternion by rotation matrix matrix must contain only rotation (not scale or shear) //! for numerical stability we find first the greatest component of quaternion and than search others from this one.
") SetMatrix;
		void SetMatrix(const gp_Mat & theMat);

		/****************** SetRotation ******************/
		/**** md5 signature: cf8784d6b71b8f58af12ffa7098db996 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec

Return
-------
None

Description
-----------
Sets quaternion to shortest-arc rotation producing vector thevecto from vector thevecfrom. if vectors thevecfrom and thevecto are opposite then rotation axis is computed as thevecfrom ^ (1,0,0) or thevecfrom ^ (0,0,1).
") SetRotation;
		void SetRotation(const gp_Vec & theVecFrom, const gp_Vec & theVecTo);

		/****************** SetRotation ******************/
		/**** md5 signature: 0c660ebf2aa10cb48307332420b5d9a6 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theVecFrom: gp_Vec
theVecTo: gp_Vec
theHelpCrossVec: gp_Vec

Return
-------
None

Description
-----------
Sets quaternion to shortest-arc rotation producing vector thevecto from vector thevecfrom. if vectors thevecfrom and thevecto are opposite then rotation axis is computed as thevecfrom ^ thehelpcrossvec.
") SetRotation;
		void SetRotation(const gp_Vec & theVecFrom, const gp_Vec & theVecTo, const gp_Vec & theHelpCrossVec);

		/****************** SetVectorAndAngle ******************/
		/**** md5 signature: 99b6d310a7d7edbc9970f6d714c01f21 ****/
		%feature("compactdefaultargs") SetVectorAndAngle;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Vec
theAngle: float

Return
-------
None

Description
-----------
Create a unit quaternion from axis+angle representation.
") SetVectorAndAngle;
		void SetVectorAndAngle(const gp_Vec & theAxis, const Standard_Real theAngle);

		/****************** SquareNorm ******************/
		/**** md5 signature: 868f14372a8827ce60e3f21bde3b1160 ****/
		%feature("compactdefaultargs") SquareNorm;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns square norm of quaternion.
") SquareNorm;
		Standard_Real SquareNorm();

		/****************** StabilizeLength ******************/
		/**** md5 signature: aaaf2fcf2c978a91cf9ac2310589bf1a ****/
		%feature("compactdefaultargs") StabilizeLength;
		%feature("autodoc", "Return
-------
None

Description
-----------
Stabilize quaternion length within 1 - 1/4. this operation is a lot faster than normalization and preserve length goes to 0 or infinity.
") StabilizeLength;
		void StabilizeLength();

		/****************** Subtract ******************/
		/**** md5 signature: 9ef89e00b18ea43c5e3d529b547464e9 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
None

Description
-----------
Subtracts components of other quaternion; result is 'rotations mix'.
") Subtract;
		void Subtract(const gp_Quaternion & theOther);

		/****************** Subtracted ******************/
		/**** md5 signature: e43e91f9c16e0366438805ee38a331ca ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
Makes difference of quaternion components; result is 'rotations mix'.
") Subtracted;
		gp_Quaternion Subtracted(const gp_Quaternion & theOther);

		/****************** W ******************/
		/**** md5 signature: b2eecf2441deefacde5c86194fd72729 ****/
		%feature("compactdefaultargs") W;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") W;
		Standard_Real W();

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 786e228d2eeaf64f99dd51d3ab338f77 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: dcdedaf1e0bc52cb9bc0dd8c635f10f1 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScale: float

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator *;
		gp_Quaternion operator *(const Standard_Real theScale);

		/****************** operator * ******************/
		/**** md5 signature: b519a6298d5bf2aa386a53bb7b786f21 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator *;
		gp_Quaternion operator *(const gp_Quaternion & theOther);

		/****************** operator * ******************/
		/**** md5 signature: dd038dab60466c206b35e47705edc0dc ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theVec: gp_Vec

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator *;
		gp_Vec operator *(const gp_Vec & theVec);


%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const gp_Quaternion other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****************** operator + ******************/
		/**** md5 signature: 8a4916c7f7f9f9981e41b258333dba26 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator +;
		gp_Quaternion operator +(const gp_Quaternion & theOther);


%extend{
    void __iadd_wrapper__(const gp_Quaternion other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****************** operator - ******************/
		/**** md5 signature: 2400ff17b24d500dd5a6327221c22f34 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator -;
		gp_Quaternion operator -();

		/****************** operator - ******************/
		/**** md5 signature: 60b31e4c0b9b796c593c9036083f2044 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Quaternion

Return
-------
gp_Quaternion

Description
-----------
No available documentation.
") operator -;
		gp_Quaternion operator -(const gp_Quaternion & theOther);


%extend{
    void __isub_wrapper__(const gp_Quaternion other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
};



%extend gp_Quaternion {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Quaternion {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Quaternion()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Quaternion')
    }
};
%extend gp_Quaternion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class gp_QuaternionNLerp *
***************************/
class gp_QuaternionNLerp {
	public:
		/****************** gp_QuaternionNLerp ******************/
		/**** md5 signature: a01b62f343ae78c29cbc993282b2b806 ****/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor,.
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp();

		/****************** gp_QuaternionNLerp ******************/
		/**** md5 signature: a3dc49965f8fc9eb5b1b3c4839244818 ****/
		%feature("compactdefaultargs") gp_QuaternionNLerp;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Constructor with initialization.
") gp_QuaternionNLerp;
		 gp_QuaternionNLerp(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Init ******************/
		/**** md5 signature: 307170b955ce7b69e82a89c8c86d7085 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with start and end values.
") Init;
		void Init(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** InitFromUnit ******************/
		/**** md5 signature: 032020104006f196b9b1aa3af37bb646 ****/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with start and end unit quaternions.
") InitFromUnit;
		void InitFromUnit(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Interpolate ******************/
		/**** md5 signature: ce97d06be5dda8783b3aa792c761c918 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion
theT: float

Return
-------
gp_Quaternion

Description
-----------
Compute interpolated quaternion between two quaternions. @param thestart first quaternion @param theend second quaternion @param thet normalized interpolation coefficient within 0..1 range, with 0 pointing to thestart and 1 to theend.
") Interpolate;
		static gp_Quaternion Interpolate(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd, Standard_Real theT);

		/****************** Interpolate ******************/
		/**** md5 signature: 9ba9baebd825100859017f381d1804ef ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theT: float
theResultQ: gp_Quaternion

Return
-------
None

Description
-----------
Set interpolated quaternion for thet position (from 0.0 to 1.0).
") Interpolate;
		void Interpolate(Standard_Real theT, gp_Quaternion & theResultQ);

};



%extend gp_QuaternionNLerp {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_QuaternionNLerp {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_QuaternionNLerp()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_QuaternionNLerp')
    }
};
%extend gp_QuaternionNLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class gp_QuaternionSLerp *
***************************/
class gp_QuaternionSLerp {
	public:
		/****************** gp_QuaternionSLerp ******************/
		/**** md5 signature: 66fbc74f555bc06073eb6c0f87894298 ****/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor,.
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp();

		/****************** gp_QuaternionSLerp ******************/
		/**** md5 signature: 17456e45790f76559348af2931e6d077 ****/
		%feature("compactdefaultargs") gp_QuaternionSLerp;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Constructor with initialization.
") gp_QuaternionSLerp;
		 gp_QuaternionSLerp(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Init ******************/
		/**** md5 signature: 307170b955ce7b69e82a89c8c86d7085 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with start and end values.
") Init;
		void Init(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** InitFromUnit ******************/
		/**** md5 signature: 032020104006f196b9b1aa3af37bb646 ****/
		%feature("compactdefaultargs") InitFromUnit;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion

Return
-------
None

Description
-----------
Initialize the tool with start and end unit quaternions.
") InitFromUnit;
		void InitFromUnit(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd);

		/****************** Interpolate ******************/
		/**** md5 signature: ce97d06be5dda8783b3aa792c761c918 ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theQStart: gp_Quaternion
theQEnd: gp_Quaternion
theT: float

Return
-------
gp_Quaternion

Description
-----------
Compute interpolated quaternion between two quaternions. @param thestart first quaternion @param theend second quaternion @param thet normalized interpolation coefficient within 0..1 range, with 0 pointing to thestart and 1 to theend.
") Interpolate;
		static gp_Quaternion Interpolate(const gp_Quaternion & theQStart, const gp_Quaternion & theQEnd, Standard_Real theT);

		/****************** Interpolate ******************/
		/**** md5 signature: 9ba9baebd825100859017f381d1804ef ****/
		%feature("compactdefaultargs") Interpolate;
		%feature("autodoc", "
Parameters
----------
theT: float
theResultQ: gp_Quaternion

Return
-------
None

Description
-----------
Set interpolated quaternion for thet position (from 0.0 to 1.0).
") Interpolate;
		void Interpolate(Standard_Real theT, gp_Quaternion & theResultQ);

};



%extend gp_QuaternionSLerp {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_QuaternionSLerp {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_QuaternionSLerp()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_QuaternionSLerp')
    }
};
%extend gp_QuaternionSLerp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Sphere *
******************/
class gp_Sphere {
	public:
		/****************** gp_Sphere ******************/
		/**** md5 signature: 8f3029d2ee745522f41b3401882eecb4 ****/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite sphere.
") gp_Sphere;
		 gp_Sphere();

		/****************** gp_Sphere ******************/
		/**** md5 signature: 88e7e45a96470b77aa78e9e60cf0de45 ****/
		%feature("compactdefaultargs") gp_Sphere;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theRadius: float

Return
-------
None

Description
-----------
Constructs a sphere with radius theradius, centered on the origin of thea3. thea3 is the local coordinate system of the sphere. warnings: it is not forbidden to create a sphere with null radius. raises constructionerror if theradius < 0.0.
") gp_Sphere;
		 gp_Sphere(const gp_Ax3 & theA3, const Standard_Real theRadius);

		/****************** Area ******************/
		/**** md5 signature: c02bdde385c5c793a22800891df9b9cd ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the area of the sphere.
") Area;
		Standard_Real Area();

		/****************** Coefficients ******************/
		/**** md5 signature: d2a72c55029fd5590f0555c1570db109 ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------

Return
-------
theA1: float
theA2: float
theA3: float
theB1: float
theB2: float
theB3: float
theC1: float
theC2: float
theC3: float
theD: float

Description
-----------
Computes the coefficients of the implicit equation of the quadric in the absolute cartesian coordinates system: @code thea1.x**2 + thea2.y**2 + thea3.z**2 + 2.(theb1.x.y + theb2.x.z + theb3.y.z) + 2.(thec1.x + thec2.y + thec3.z) + thed = 0.0 @endcode.
") Coefficients;
		void Coefficients(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Direct ******************/
		/**** md5 signature: 2c90be540a5bf9418e7461f7f76c970a ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the local coordinate system of this sphere is right-handed.
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
--- purpose ; returns the center of the sphere.
") Location;
		const gp_Pnt Location();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: a99c8241aaf642b110842c8bf9bfe9ea ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Sphere

Description
-----------
Performs the symmetrical transformation of a sphere with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Sphere Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: 78663102ade45731820b534be5da4b22 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Sphere

Description
-----------
Performs the symmetrical transformation of a sphere with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Sphere Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: 90ac71c1f32b2f1b46730b95c3c062bb ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Sphere

Description
-----------
Performs the symmetrical transformation of a sphere with respect to a plane. the axis placement thea2 locates the plane of the of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Sphere Mirrored(const gp_Ax2 & theA2);

		/****************** Position ******************/
		/**** md5 signature: c702d3a208cf0124b56544ef1f5c6ae7 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of the sphere.
") Position;
		const gp_Ax3 Position();

		/****************** Radius ******************/
		/**** md5 signature: e995997e31f334f223fb359fc7382a66 ****/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the radius of the sphere.
") Radius;
		Standard_Real Radius();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: b4a85964e1a4e01912b2cb06c8018b45 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Sphere

Description
-----------
Rotates a sphere. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Sphere Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 222049befdb053ac3f42d802c6293a02 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Sphere

Description
-----------
Scales a sphere. thes is the scaling value. the absolute value of s is used to scale the sphere.
") Scaled;
		gp_Sphere Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetLocation ******************/
		/**** md5 signature: 549208ae587d601427fb98d16d4de1b7 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLoc: gp_Pnt

Return
-------
None

Description
-----------
Changes the center of the sphere.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****************** SetPosition ******************/
		/**** md5 signature: c788767c1fc0ca73bdf3541037626780 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the sphere.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****************** SetRadius ******************/
		/**** md5 signature: be4d106826d464b8bee7d31497e6c4fa ****/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
theR: float

Return
-------
None

Description
-----------
Assigns ther the radius of the sphere. warnings: it is not forbidden to create a sphere with null radius. raises constructionerror if ther < 0.0.
") SetRadius;
		void SetRadius(const Standard_Real theR);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 71dca805732ae4b7ad43addc5dc49ab8 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Sphere

Description
-----------
Transforms a sphere with the transformation thet from class trsf.
") Transformed;
		gp_Sphere Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: 3b7775242f90986092f5ea95e5889222 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Sphere

Description
-----------
Translates a sphere in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Sphere Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: d1aa99cb24e9c452cb12a5c8c62a475a ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Sphere

Description
-----------
Translates a sphere from the point thep1 to the point thep2.
") Translated;
		gp_Sphere Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** UReverse ******************/
		/**** md5 signature: b0197b2ee987c6cd2138becb024e1db6 ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the u parametrization of the sphere reversing the yaxis.
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 4d0389515240266be0c86e204c81b7a9 ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the v parametrization of the sphere reversing the zaxis.
") VReverse;
		void VReverse();

		/****************** Volume ******************/
		/**** md5 signature: 3d99563b1983002307bec20217cc20c8 ****/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the volume of the sphere.
") Volume;
		Standard_Real Volume();

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis x of the sphere.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis y of the sphere.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Sphere {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Sphere {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Sphere()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Sphere')
    }
};
%extend gp_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Torus *
*****************/
class gp_Torus {
	public:
		/****************** gp_Torus ******************/
		/**** md5 signature: b1b979ff943931fcf91b4a8e9becb529 ****/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an indefinite torus.
") gp_Torus;
		 gp_Torus();

		/****************** gp_Torus ******************/
		/**** md5 signature: 23dbfcfa62b5bd0787a6845547f399ae ****/
		%feature("compactdefaultargs") gp_Torus;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3
theMajorRadius: float
theMinorRadius: float

Return
-------
None

Description
-----------
A torus centered on the origin of coordinate system thea3, with major radius themajorradius and minor radius theminorradius, and with the reference plane defined by the origin, the 'x direction' and the 'y direction' of thea3. warnings: it is not forbidden to create a torus with themajorradius = theminorradius = 0.0 raises constructionerror if theminorradius < 0.0 or if themajorradius < 0.0.
") gp_Torus;
		 gp_Torus(const gp_Ax3 & theA3, const Standard_Real theMajorRadius, const Standard_Real theMinorRadius);

		/****************** Area ******************/
		/**** md5 signature: c02bdde385c5c793a22800891df9b9cd ****/
		%feature("compactdefaultargs") Area;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the area of the torus.
") Area;
		Standard_Real Area();

		/****************** Axis ******************/
		/**** md5 signature: 8e27675ecbe6e648730266788c8e255c ****/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the symmetry axis of the torus.
") Axis;
		const gp_Ax1 Axis();

		/****************** Coefficients ******************/
		/**** md5 signature: 0a0c060f241af6d7d31073b1da484ffd ****/
		%feature("compactdefaultargs") Coefficients;
		%feature("autodoc", "
Parameters
----------
theCoef: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Computes the coefficients of the implicit equation of the surface in the absolute cartesian coordinate system: @code coef(1) * x^4 + coef(2) * y^4 + coef(3) * z^4 + coef(4) * x^3 * y + coef(5) * x^3 * z + coef(6) * y^3 * x + coef(7) * y^3 * z + coef(8) * z^3 * x + coef(9) * z^3 * y + coef(10) * x^2 * y^2 + coef(11) * x^2 * z^2 + coef(12) * y^2 * z^2 + coef(13) * x^2 * y * z + coef(14) * x * y^2 * z + coef(15) * x * y * z^2 + coef(16) * x^3 + coef(17) * y^3 + coef(18) * z^3 + coef(19) * x^2 * y + coef(20) * x^2 * z + coef(21) * y^2 * x + coef(22) * y^2 * z + coef(23) * z^2 * x + coef(24) * z^2 * y + coef(25) * x * y * z + coef(26) * x^2 + coef(27) * y^2 + coef(28) * z^2 + coef(29) * x * y + coef(30) * x * z + coef(31) * y * z + coef(32) * x + coef(33) * y + coef(34) * z + coef(35) = 0.0 @endcode raises dimensionerror if the length of thecoef is lower than 35.
") Coefficients;
		void Coefficients(TColStd_Array1OfReal & theCoef);

		/****************** Direct ******************/
		/**** md5 signature: 2c90be540a5bf9418e7461f7f76c970a ****/
		%feature("compactdefaultargs") Direct;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the ax3, the local coordinate system of this torus, is right handed.
") Direct;
		Standard_Boolean Direct();

		/****************** Location ******************/
		/**** md5 signature: becd3d5ba73b438c501a139df51b6b7f ****/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the torus's location.
") Location;
		const gp_Pnt Location();

		/****************** MajorRadius ******************/
		/**** md5 signature: 128082d838650d89e5451fc2ec2cdd95 ****/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the major radius of the torus.
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		/**** md5 signature: 5a903e1e296cb85037297fddc27e2870 ****/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the minor radius of the torus.
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Mirror ******************/
		/**** md5 signature: 095878518b088b42d55c3da09f68a84c ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Pnt & theP);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: 641bd8e6c87d2e800ec87720a0d8d35d ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
gp_Torus

Description
-----------
Performs the symmetrical transformation of a torus with respect to the point thep which is the center of the symmetry.
") Mirrored;
		gp_Torus Mirrored(const gp_Pnt & theP);

		/****************** Mirrored ******************/
		/**** md5 signature: ccacb6e90bd4de7e389afd7365fcd2fc ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Torus

Description
-----------
Performs the symmetrical transformation of a torus with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Torus Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: d11a538b0495a53b2b861aa239326232 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Torus

Description
-----------
Performs the symmetrical transformation of a torus with respect to a plane. the axis placement thea2 locates the plane of the of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Torus Mirrored(const gp_Ax2 & theA2);

		/****************** Position ******************/
		/**** md5 signature: c702d3a208cf0124b56544ef1f5c6ae7 ****/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of the torus.
") Position;
		const gp_Ax3 Position();

		/****************** Rotate ******************/
		/**** md5 signature: 424ab82daf880655bff8da4ef682e64b ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 7cd0037c869861e7c4984ff8cea1a0dd ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Torus

Description
-----------
Rotates a torus. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Torus Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: a931b3c1f3cc70761b0f4bcbe2fc2ef0 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 82dd7e80c01ce8b1d7d2aebbb8fe7dbc ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
gp_Torus

Description
-----------
Scales a torus. s is the scaling value. the absolute value of s is used to scale the torus.
") Scaled;
		gp_Torus Scaled(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetAxis ******************/
		/**** md5 signature: 23e0b01de6336ec5c57ea6909e327d35 ****/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Modifies this torus, by redefining its local coordinate system so that: - its origin and 'main direction' become those of the axis thea1 (the 'x direction' and 'y direction' are then recomputed). raises constructionerror if the direction of thea1 is parallel to the 'xdirection' of the coordinate system of the toroidal surface.
") SetAxis;
		void SetAxis(const gp_Ax1 & theA1);

		/****************** SetLocation ******************/
		/**** md5 signature: 549208ae587d601427fb98d16d4de1b7 ****/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLoc: gp_Pnt

Return
-------
None

Description
-----------
Changes the location of the torus.
") SetLocation;
		void SetLocation(const gp_Pnt & theLoc);

		/****************** SetMajorRadius ******************/
		/**** md5 signature: 847f370a77fa02a8bf45fa2b00b28b74 ****/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
theMajorRadius: float

Return
-------
None

Description
-----------
Assigns value to the major radius of this torus. raises constructionerror if themajorradius - minorradius <= resolution().
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real theMajorRadius);

		/****************** SetMinorRadius ******************/
		/**** md5 signature: 2bb295e6e4f7e9ad627ec256d511ddce ****/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
theMinorRadius: float

Return
-------
None

Description
-----------
Assigns value to the minor radius of this torus. raises constructionerror if theminorradius < 0.0 or if majorradius - theminorradius <= resolution from gp.
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real theMinorRadius);

		/****************** SetPosition ******************/
		/**** md5 signature: c788767c1fc0ca73bdf3541037626780 ****/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
theA3: gp_Ax3

Return
-------
None

Description
-----------
Changes the local coordinate system of the surface.
") SetPosition;
		void SetPosition(const gp_Ax3 & theA3);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 163cb63b4e1664daa518145e11148598 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Torus

Description
-----------
Transforms a torus with the transformation thet from class trsf.
") Transformed;
		gp_Torus Transformed(const gp_Trsf & theT);

		/****************** Translate ******************/
		/**** md5 signature: 0187bd9a09d9b334477a40e96047e03a ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Vec & theV);

		/****************** Translate ******************/
		/**** md5 signature: cde9f9ebda90da2c1df1a27191e7ab81 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Translated ******************/
		/**** md5 signature: c291a2c8eb33cbe7cbe1a744213b8f17 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Torus

Description
-----------
Translates a torus in the direction of the vector thev. the magnitude of the translation is the vector's magnitude.
") Translated;
		gp_Torus Translated(const gp_Vec & theV);

		/****************** Translated ******************/
		/**** md5 signature: f494e6671c4f91ca60714db72bceae40 ****/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
gp_Torus

Description
-----------
Translates a torus from the point thep1 to the point thep2.
") Translated;
		gp_Torus Translated(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** UReverse ******************/
		/**** md5 signature: b0197b2ee987c6cd2138becb024e1db6 ****/
		%feature("compactdefaultargs") UReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the u parametrization of the torus reversing the yaxis.
") UReverse;
		void UReverse();

		/****************** VReverse ******************/
		/**** md5 signature: 4d0389515240266be0c86e204c81b7a9 ****/
		%feature("compactdefaultargs") VReverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the v parametrization of the torus reversing the zaxis.
") VReverse;
		void VReverse();

		/****************** Volume ******************/
		/**** md5 signature: 3d99563b1983002307bec20217cc20c8 ****/
		%feature("compactdefaultargs") Volume;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the volume of the torus.
") Volume;
		Standard_Real Volume();

		/****************** XAxis ******************/
		/**** md5 signature: 900acbd3949b81ee383c3b457e95c597 ****/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis x of the torus.
") XAxis;
		gp_Ax1 XAxis();

		/****************** YAxis ******************/
		/**** md5 signature: 8db99d563f8cc2fa33e80ece09869c5c ****/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
Returns the axis y of the torus.
") YAxis;
		gp_Ax1 YAxis();

};



%extend gp_Torus {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Torus {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Torus()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Torus')
    }
};
%extend gp_Torus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class gp_Trsf *
****************/
class gp_Trsf {
	public:
		/****************** gp_Trsf ******************/
		/**** md5 signature: 8d27be753f710db915d5c753f537a389 ****/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns the identity transformation.
") gp_Trsf;
		 gp_Trsf();

		/****************** gp_Trsf ******************/
		/**** md5 signature: 6add598973f1df2d0eb2b3ed0eccd65d ****/
		%feature("compactdefaultargs") gp_Trsf;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Creates a 3d transformation from the 2d transformation thet. the resulting transformation has a homogeneous vectorial part, v3, and a translation part, t3, built from thet: a11 a12 0 a13 v3 = a21 a22 0 t3 = a23 0 0 1. 0 it also has the same scale factor as thet. this guarantees (by projection) that the transformation which would be performed by thet in a plane (2d space) is performed by the resulting transformation in the xoy plane of the 3d space, (i.e. in the plane defined by the origin (0., 0., 0.) and the vectors dx (1., 0., 0.), and dy (0., 1., 0.)). the scale factor is applied to the entire space.
") gp_Trsf;
		 gp_Trsf(const gp_Trsf2d & theT);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** Form ******************/
		/**** md5 signature: f29bb1eb1523b456c279366338ab9947 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. it can be: an identity transformation, a rotation, a translation, a mirror transformation (relative to a point, an axis or a plane), a scaling transformation, or a compound transformation.
") Form;
		gp_TrsfForm Form();

		/****************** GetRotation ******************/
		/**** md5 signature: 507be993084ed6437c3e6d646f1fc5b8 ****/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_XYZ

Return
-------
theAngle: float

Description
-----------
Returns the boolean true if there is non-zero rotation. in the presence of rotation, the output parameters store the axis and the angle of rotation. the method always returns positive value 'theangle', i.e., 0. < theangle <= pi. note that this rotation is defined only by the vectorial part of the transformation; generally you would need to check also the translational part to obtain the axis (gp_ax1) of rotation.
") GetRotation;
		Standard_Boolean GetRotation(gp_XYZ & theAxis, Standard_Real &OutValue);

		/****************** GetRotation ******************/
		/**** md5 signature: 2b6ec5870e6bdcf47232f9eb0ab62106 ****/
		%feature("compactdefaultargs") GetRotation;
		%feature("autodoc", "Return
-------
gp_Quaternion

Description
-----------
Returns quaternion representing rotational part of the transformation.
") GetRotation;
		gp_Quaternion GetRotation();

		/****************** HVectorialPart ******************/
		/**** md5 signature: e9352bf129ae39b98f78a562501e01bd ****/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Computes the homogeneous vectorial part of the transformation. it is a 3*3 matrix which doesn't include the scale factor. in other words, the vectorial part of this transformation is equal to its homogeneous vectorial part, multiplied by the scale factor. the coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.
") HVectorialPart;
		const gp_Mat HVectorialPart();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 8c8178aff8d9de38358efe4f66ee976d ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Computes the reverse transformation raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to resolution from package gp. computes the transformation composed with t and <self>. in a c++ implementation you can also write tcomposed = <self> * t. example: @code gp_trsf t1, t2, tcomp; ............... tcomp = t2.multiplied(t1); // or (tcomp = t2 * t1) gp_pnt p1(10.,3.,4.); gp_pnt p2 = p1.transformed(tcomp); // using tcomp gp_pnt p3 = p1.transformed(t1); // using t1 then t2 p3.transform(t2); // p3 = p2 !!! @endcode.
") Inverted;
		gp_Trsf Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 4a3d241c868ecfc4b59898855c5acee1 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative.
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		/**** md5 signature: a3abf3b187b687f3316b5161531d0cae ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Multiplied;
		gp_Trsf Multiplied(const gp_Trsf & theT);

		/****************** Multiply ******************/
		/**** md5 signature: f7e5c9868b36738395306823c3477607 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Computes the transformation composed with <self> and thet. <self> = <self> * thet.
") Multiply;
		void Multiply(const gp_Trsf & theT);

		/****************** Power ******************/
		/**** md5 signature: fe226a66f073d604b8a0d81d41f1ca71 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const Standard_Integer theN);

		/****************** Powered ******************/
		/**** md5 signature: 44dee5a5c6288f8c7134fd01d64c4535 ****/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Trsf

Description
-----------
Computes the following composition of transformations <self> * <self> * .......* <self>, then time. if then = 0 <self> = identity if then < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises if then < 0 and if the matrix of the transformation not inversible.
") Powered;
		gp_Trsf Powered(const Standard_Integer theN);

		/****************** PreMultiply ******************/
		/**** md5 signature: 42107802698e6c1a034595a950dbefa8 ****/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Computes the transformation composed with <self> and t. <self> = thet * <self>.
") PreMultiply;
		void PreMultiply(const gp_Trsf & theT);

		/****************** ScaleFactor ******************/
		/**** md5 signature: bf80fcb76494dd02d25b2cd942a598b0 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the scale factor.
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetDisplacement ******************/
		/**** md5 signature: bc729f850e51b221372c978f53e0e274 ****/
		%feature("compactdefaultargs") SetDisplacement;
		%feature("autodoc", "
Parameters
----------
theFromSystem1: gp_Ax3
theToSystem2: gp_Ax3

Return
-------
None

Description
-----------
Modifies this transformation so that it transforms the coordinate system defined by thefromsystem1 into the one defined by thetosystem2. after this modification, this transformation transforms: - the origin of thefromsystem1 into the origin of thetosystem2, - the 'x direction' of thefromsystem1 into the 'x direction' of thetosystem2, - the 'y direction' of thefromsystem1 into the 'y direction' of thetosystem2, and - the 'main direction' of thefromsystem1 into the 'main direction' of thetosystem2. warning when you know the coordinates of a point in one coordinate system and you want to express these coordinates in another one, do not use the transformation resulting from this function. use the transformation that results from settransformation instead. setdisplacement and settransformation create related transformations: the vectorial part of one is the inverse of the vectorial part of the other.
") SetDisplacement;
		void SetDisplacement(const gp_Ax3 & theFromSystem1, const gp_Ax3 & theToSystem2);

		/****************** SetForm ******************/
		/**** md5 signature: f031458a253112c7113669d552558620 ****/
		%feature("compactdefaultargs") SetForm;
		%feature("autodoc", "
Parameters
----------
theP: gp_TrsfForm

Return
-------
None

Description
-----------
No available documentation.
") SetForm;
		void SetForm(const gp_TrsfForm theP);

		/****************** SetMirror ******************/
		/**** md5 signature: 9ae229f07c38237a82abb04f8223ffd8 ****/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation. thep is the center of the symmetry.
") SetMirror;
		void SetMirror(const gp_Pnt & theP);

		/****************** SetMirror ******************/
		/**** md5 signature: 20f2e17deca99079b285391961ab328a ****/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation. thea1 is the center of the axial symmetry.
") SetMirror;
		void SetMirror(const gp_Ax1 & theA1);

		/****************** SetMirror ******************/
		/**** md5 signature: 2458ac702d5c513ec87af577e9535ef8 ****/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
Makes the transformation into a symmetrical transformation. thea2 is the center of the planar symmetry and defines the plane of symmetry by its origin, 'x direction' and 'y direction'.
") SetMirror;
		void SetMirror(const gp_Ax2 & theA2);

		/****************** SetRotation ******************/
		/**** md5 signature: c40af8780de5829d9a6d529a528c17ac ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
Changes the transformation into a rotation. thea1 is the rotation axis and theang is the angular value of the rotation in radians.
") SetRotation;
		void SetRotation(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** SetRotation ******************/
		/**** md5 signature: 987ac7613cdf0a3488f1e342439d9ee3 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theR: gp_Quaternion

Return
-------
None

Description
-----------
Changes the transformation into a rotation defined by quaternion. note that rotation is performed around origin, i.e. no translation is involved.
") SetRotation;
		void SetRotation(const gp_Quaternion & theR);

		/****************** SetRotationPart ******************/
		/**** md5 signature: 8c5113644708ca7c4e1104b931cda1ca ****/
		%feature("compactdefaultargs") SetRotationPart;
		%feature("autodoc", "
Parameters
----------
theR: gp_Quaternion

Return
-------
None

Description
-----------
Replaces the rotation part with specified quaternion.
") SetRotationPart;
		void SetRotationPart(const gp_Quaternion & theR);

		/****************** SetScale ******************/
		/**** md5 signature: 00b287ca07f8546ee0ae4a6a148df90f ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: float

Return
-------
None

Description
-----------
Changes the transformation into a scale. thep is the center of the scale and thes is the scaling value. raises constructionerror if <thes> is null.
") SetScale;
		void SetScale(const gp_Pnt & theP, const Standard_Real theS);

		/****************** SetScaleFactor ******************/
		/**** md5 signature: aafbc219c541a22e84af3131ca98c2be ****/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
None

Description
-----------
Modifies the scale factor. raises constructionerror if thes is null.
") SetScaleFactor;
		void SetScaleFactor(const Standard_Real theS);

		/****************** SetTransformation ******************/
		/**** md5 signature: 24bd7f24f8983593be0b8a50fb19e976 ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theFromSystem1: gp_Ax3
theToSystem2: gp_Ax3

Return
-------
None

Description
-----------
Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point the transformation is from the coordinate system 'thefromsystem1' to the coordinate system 'thetosystem2'. example: @code gp_ax3 thefromsystem1, thetosystem2; double x1, y1, z1; // are the coordinates of a point in the local system thefromsystem1 double x2, y2, z2; // are the coordinates of a point in the local system thetosystem2 gp_pnt p1 (x1, y1, z1) gp_trsf t; t.settransformation (thefromsystem1, thetosystem2); gp_pnt p2 = p1.transformed (t); p2.coord (x2, y2, z2); @endcode.
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theFromSystem1, const gp_Ax3 & theToSystem2);

		/****************** SetTransformation ******************/
		/**** md5 signature: 0745462ab5e4d17def9aec346b35bea2 ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theToSystem: gp_Ax3

Return
-------
None

Description
-----------
Modifies this transformation so that it transforms the coordinates of any point, (x, y, z), relative to a source coordinate system into the coordinates (x', y', z') which are relative to a target coordinate system, but which represent the same point the transformation is from the default coordinate system @code {p(0.,0.,0.), vx (1.,0.,0.), vy (0.,1.,0.), vz (0., 0. ,1.) } @endcode to the local coordinate system defined with the ax3 thetosystem. use in the same way as the previous method. fromsystem1 is defaulted to the absolute coordinate system.
") SetTransformation;
		void SetTransformation(const gp_Ax3 & theToSystem);

		/****************** SetTransformation ******************/
		/**** md5 signature: 3a12cdc1c4650d167b7f7d3a0fd125d8 ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
R: gp_Quaternion
theT: gp_Vec

Return
-------
None

Description
-----------
Sets transformation by directly specified rotation and translation.
") SetTransformation;
		void SetTransformation(const gp_Quaternion & R, const gp_Vec & theT);

		/****************** SetTranslation ******************/
		/**** md5 signature: 0b85665c662d04c53b16d4317c473334 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Changes the transformation into a translation. thev is the vector of the translation.
") SetTranslation;
		void SetTranslation(const gp_Vec & theV);

		/****************** SetTranslation ******************/
		/**** md5 signature: 370a79bc00245ee59924d61fcdf0c54c ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Makes the transformation into a translation where the translation vector is the vector (thep1, thep2) defined from point thep1 to point thep2.
") SetTranslation;
		void SetTranslation(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** SetTranslationPart ******************/
		/**** md5 signature: 1cfc8ffcc8a8b184c292bd08f8dec8d8 ****/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
Replaces the translation vector with the vector thev.
") SetTranslationPart;
		void SetTranslationPart(const gp_Vec & theV);

		/****************** SetValues ******************/
		/**** md5 signature: 2824051ae13eff24c35e73ba100d22d0 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
a11: float
a12: float
a13: float
a14: float
a21: float
a22: float
a23: float
a24: float
a31: float
a32: float
a33: float
a34: float

Return
-------
None

Description
-----------
Sets the coefficients of the transformation. the transformation of the point x,y,z is the point x',y',z' with: @code x' = a11 x + a12 y + a13 z + a14 y' = a21 x + a22 y + a23 z + a24 z' = a31 x + a32 y + a33 z + a34 @endcode the method value(i,j) will return aij. raises constructionerror if the determinant of the aij is null. the matrix is orthogonalized before future using.
") SetValues;
		void SetValues(const Standard_Real a11, const Standard_Real a12, const Standard_Real a13, const Standard_Real a14, const Standard_Real a21, const Standard_Real a22, const Standard_Real a23, const Standard_Real a24, const Standard_Real a31, const Standard_Real a32, const Standard_Real a33, const Standard_Real a34);

		/****************** Transforms ******************/
		/**** md5 signature: ba26ab7aff72ff32856094b1e250c94f ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float
theZ: float

Description
-----------
No available documentation.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Transforms ******************/
		/**** md5 signature: 8f9dd5cceda35c2463cf3d74007d1cb1 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Transformation of a triplet xyz with a trsf.
") Transforms;
		void Transforms(gp_XYZ & theCoord);

		/****************** TranslationPart ******************/
		/**** md5 signature: 6e19b500ee29d7f16325476cae8b6aaf ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the translation part of the transformation's matrix.
") TranslationPart;
		const gp_XYZ TranslationPart();

		/****************** Value ******************/
		/**** md5 signature: de381dc023424482347f7e2b0c3a6975 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
float

Description
-----------
Returns the coefficients of the transformation's matrix. it is a 3 rows * 4 columns matrix. this coefficient includes the scale factor. raises outofranged if therow < 1 or therow > 3 or thecol < 1 or thecol > 4.
") Value;
		Standard_Real Value(const Standard_Integer theRow, const Standard_Integer theCol);

		/****************** VectorialPart ******************/
		/**** md5 signature: bdd8d899188313a9c1b3691b370bb091 ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat

Description
-----------
Returns the vectorial part of the transformation. it is a 3*3 matrix which includes the scale factor.
") VectorialPart;
		gp_Mat VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: b852c4112a776404e70a5d4e78b8784a ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Trsf

Description
-----------
No available documentation.
") operator *;
		gp_Trsf operator *(const gp_Trsf & theT);


%extend{
    void __imul_wrapper__(const gp_Trsf other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_Trsf {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Trsf {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Trsf()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Trsf')
    }
};
%extend gp_Trsf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class gp_Trsf2d *
******************/
class gp_Trsf2d {
	public:
		/****************** gp_Trsf2d ******************/
		/**** md5 signature: a2842cead7c6914d1488c16aeca3c8d4 ****/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns identity transformation.
") gp_Trsf2d;
		 gp_Trsf2d();

		/****************** gp_Trsf2d ******************/
		/**** md5 signature: c6c9328acf9434f4dda10fa30184a1a2 ****/
		%feature("compactdefaultargs") gp_Trsf2d;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Creates a 2d transformation in the xy plane from a 3d transformation .
") gp_Trsf2d;
		 gp_Trsf2d(const gp_Trsf & theT);

		/****************** Form ******************/
		/**** md5 signature: f29bb1eb1523b456c279366338ab9947 ****/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Return
-------
gp_TrsfForm

Description
-----------
Returns the nature of the transformation. it can be an identity transformation, a rotation, a translation, a mirror (relative to a point or an axis), a scaling transformation, or a compound transformation.
") Form;
		gp_TrsfForm Form();

		/****************** HVectorialPart ******************/
		/**** md5 signature: 9070d23625b58bfd13b4a1ac1f266cef ****/
		%feature("compactdefaultargs") HVectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Returns the homogeneous vectorial part of the transformation. it is a 2*2 matrix which doesn't include the scale factor. the coefficients of this matrix must be multiplied by the scale factor to obtain the coefficients of the transformation.
") HVectorialPart;
		const gp_Mat2d HVectorialPart();

		/****************** Invert ******************/
		/**** md5 signature: 980f166f600d23a8c77565829af2eeff ****/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Invert;
		void Invert();

		/****************** Inverted ******************/
		/**** md5 signature: 4a87a39cc22573a261c142b1805b0bfd ****/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Return
-------
gp_Trsf2d

Description
-----------
Computes the reverse transformation. raises an exception if the matrix of the transformation is not inversible, it means that the scale factor is lower or equal to resolution from package gp.
") Inverted;
		gp_Trsf2d Inverted();

		/****************** IsNegative ******************/
		/**** md5 signature: 4a3d241c868ecfc4b59898855c5acee1 ****/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the determinant of the vectorial part of this transformation is negative..
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		/**** md5 signature: 0bae47e965ad147d9ddee6866d15b1be ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") Multiplied;
		gp_Trsf2d Multiplied(const gp_Trsf2d & theT);

		/****************** Multiply ******************/
		/**** md5 signature: 83bd30efc23d272e5df01cfeb71d71a0 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Computes the transformation composed from <self> and thet. <self> = <self> * thet.
") Multiply;
		void Multiply(const gp_Trsf2d & theT);

		/****************** Power ******************/
		/**** md5 signature: fe226a66f073d604b8a0d81d41f1ca71 ****/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
None

Description
-----------
No available documentation.
") Power;
		void Power(const Standard_Integer theN);

		/****************** Powered ******************/
		/**** md5 signature: 2f9e8990d35aa7f2e7b5d80c855a4931 ****/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "
Parameters
----------
theN: int

Return
-------
gp_Trsf2d

Description
-----------
Computes the following composition of transformations <self> * <self> * .......* <self>, then time. if then = 0 <self> = identity if then < 0 <self> = <self>.inverse() *...........* <self>.inverse(). //! raises if then < 0 and if the matrix of the transformation not inversible.
") Powered;
		gp_Trsf2d Powered(const Standard_Integer theN);

		/****************** PreMultiply ******************/
		/**** md5 signature: 8eb748a68d09bdd778340085d327b3fc ****/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
Computes the transformation composed from <self> and thet. <self> = thet * <self>.
") PreMultiply;
		void PreMultiply(const gp_Trsf2d & theT);

		/****************** RotationPart ******************/
		/**** md5 signature: 998e0caa47d024b1641265a66c85c396 ****/
		%feature("compactdefaultargs") RotationPart;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the angle corresponding to the rotational component of the transformation matrix (operation opposite to setrotation()).
") RotationPart;
		Standard_Real RotationPart();

		/****************** ScaleFactor ******************/
		/**** md5 signature: bf80fcb76494dd02d25b2cd942a598b0 ****/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the scale factor.
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetMirror ******************/
		/**** md5 signature: 388aadce60210db9d527f19a5a98b6ce ****/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Changes the transformation into a symmetrical transformation. thep is the center of the symmetry.
") SetMirror;
		void SetMirror(const gp_Pnt2d & theP);

		/****************** SetMirror ******************/
		/**** md5 signature: 485fdd406dbbef13d39717c7675b9756 ****/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "
Parameters
----------
theA: gp_Ax2d

Return
-------
None

Description
-----------
Changes the transformation into a symmetrical transformation. thea is the center of the axial symmetry.
") SetMirror;
		void SetMirror(const gp_Ax2d & theA);

		/****************** SetRotation ******************/
		/**** md5 signature: 601f5cab0dd42befb276d8a6bde69066 ****/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theAng: float

Return
-------
None

Description
-----------
Changes the transformation into a rotation. thep is the rotation's center and theang is the angular value of the rotation in radian.
") SetRotation;
		void SetRotation(const gp_Pnt2d & theP, const Standard_Real theAng);

		/****************** SetScale ******************/
		/**** md5 signature: d2cc5529eebc2d6fdfccc7345b08b22c ****/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d
theS: float

Return
-------
None

Description
-----------
Changes the transformation into a scale. thep is the center of the scale and thes is the scaling value.
") SetScale;
		void SetScale(const gp_Pnt2d & theP, const Standard_Real theS);

		/****************** SetScaleFactor ******************/
		/**** md5 signature: aafbc219c541a22e84af3131ca98c2be ****/
		%feature("compactdefaultargs") SetScaleFactor;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
None

Description
-----------
Modifies the scale factor.
") SetScaleFactor;
		void SetScaleFactor(const Standard_Real theS);

		/****************** SetTransformation ******************/
		/**** md5 signature: 648b6e972dffc1e8307f6e821456e152 ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theFromSystem1: gp_Ax2d
theToSystem2: gp_Ax2d

Return
-------
None

Description
-----------
Changes a transformation allowing passage from the coordinate system 'thefromsystem1' to the coordinate system 'thetosystem2'.
") SetTransformation;
		void SetTransformation(const gp_Ax2d & theFromSystem1, const gp_Ax2d & theToSystem2);

		/****************** SetTransformation ******************/
		/**** md5 signature: 9db880503eb061f6e7c09a97e2f0ae2e ****/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
theToSystem: gp_Ax2d

Return
-------
None

Description
-----------
Changes the transformation allowing passage from the basic coordinate system {p(0.,0.,0.), vx (1.,0.,0.), vy (0.,1.,0.)} to the local coordinate system defined with the ax2d thetosystem.
") SetTransformation;
		void SetTransformation(const gp_Ax2d & theToSystem);

		/****************** SetTranslation ******************/
		/**** md5 signature: 194545521d4415e63a0535fe8e484f50 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Changes the transformation into a translation. thev is the vector of the translation.
") SetTranslation;
		void SetTranslation(const gp_Vec2d & theV);

		/****************** SetTranslation ******************/
		/**** md5 signature: 6bdd6819723c7c3ba451dc5ee82dbe23 ****/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Makes the transformation into a translation from the point thep1 to the point thep2.
") SetTranslation;
		void SetTranslation(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** SetTranslationPart ******************/
		/**** md5 signature: 90998b7bd6da80ae9d5a13d99cde960c ****/
		%feature("compactdefaultargs") SetTranslationPart;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Replaces the translation vector with thev.
") SetTranslationPart;
		void SetTranslationPart(const gp_Vec2d & theV);

		/****************** SetValues ******************/
		/**** md5 signature: 03457aff397202bdadcf7b24752bfb08 ****/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
a11: float
a12: float
a13: float
a21: float
a22: float
a23: float

Return
-------
None

Description
-----------
Sets the coefficients of the transformation. the transformation of the point x,y is the point x',y' with: @code x' = a11 x + a12 y + a13 y' = a21 x + a22 y + a23 @endcode the method value(i,j) will return aij. raises constructionerror if the determinant of the aij is null. if the matrix as not a uniform scale it will be orthogonalized before future using.
") SetValues;
		void SetValues(const Standard_Real a11, const Standard_Real a12, const Standard_Real a13, const Standard_Real a21, const Standard_Real a22, const Standard_Real a23);

		/****************** Transforms ******************/
		/**** md5 signature: fa7acb5c2b81cd7673049034fcddc957 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float

Description
-----------
No available documentation.
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Transforms ******************/
		/**** md5 signature: 4dc62941ec30f61dd6f0de5964b8fff6 ****/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Transforms a doublet xy with a trsf2d.
") Transforms;
		void Transforms(gp_XY & theCoord);

		/****************** TranslationPart ******************/
		/**** md5 signature: 6f19325c1730ba0fd4b588033c32e399 ****/
		%feature("compactdefaultargs") TranslationPart;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
Returns the translation part of the transformation's matrix.
") TranslationPart;
		const gp_XY TranslationPart();

		/****************** Value ******************/
		/**** md5 signature: de381dc023424482347f7e2b0c3a6975 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theRow: int
theCol: int

Return
-------
float

Description
-----------
Returns the coefficients of the transformation's matrix. it is a 2 rows * 3 columns matrix. raises outofrange if therow < 1 or therow > 2 or thecol < 1 or thecol > 3.
") Value;
		Standard_Real Value(const Standard_Integer theRow, const Standard_Integer theCol);

		/****************** VectorialPart ******************/
		/**** md5 signature: 672fae35ed3393d8331524559101b431 ****/
		%feature("compactdefaultargs") VectorialPart;
		%feature("autodoc", "Return
-------
gp_Mat2d

Description
-----------
Returns the vectorial part of the transformation. it is a 2*2 matrix which includes the scale factor.
") VectorialPart;
		gp_Mat2d VectorialPart();

		/****************** operator * ******************/
		/**** md5 signature: 38afa6a03c04f954af48ca06f900c5d9 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Trsf2d

Description
-----------
No available documentation.
") operator *;
		gp_Trsf2d operator *(const gp_Trsf2d & theT);


%extend{
    void __imul_wrapper__(const gp_Trsf2d other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
};



%extend gp_Trsf2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Trsf2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Trsf2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Trsf2d')
    }
};
%extend gp_Trsf2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_Vec *
***************/
class gp_Vec {
	public:
		/****************** gp_Vec ******************/
		/**** md5 signature: b634a3310a804d9341aea7e6148a6c4e ****/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a zero vector.
") gp_Vec;
		 gp_Vec();

		/****************** gp_Vec ******************/
		/**** md5 signature: 295288e0cef120a387edd511c16b9dd1 ****/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir

Return
-------
None

Description
-----------
Creates a unitary vector from a direction thev.
") gp_Vec;
		 gp_Vec(const gp_Dir & theV);

		/****************** gp_Vec ******************/
		/**** md5 signature: 2134a3d4ef0ed3a83a8270dcaa872ad0 ****/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Creates a vector with a triplet of coordinates.
") gp_Vec;
		 gp_Vec(const gp_XYZ & theCoord);

		/****************** gp_Vec ******************/
		/**** md5 signature: 9d8aee611723d77714205fe230577101 ****/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float
theZv: float

Return
-------
None

Description
-----------
Creates a point with its three cartesian coordinates.
") gp_Vec;
		 gp_Vec(const Standard_Real theXv, const Standard_Real theYv, const Standard_Real theZv);

		/****************** gp_Vec ******************/
		/**** md5 signature: 7b1e47600fbfdd00ccc8fcf71257161b ****/
		%feature("compactdefaultargs") gp_Vec;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt
theP2: gp_Pnt

Return
-------
None

Description
-----------
Creates a vector from two points. the length of the vector is the distance between thep1 and thep2.
") gp_Vec;
		 gp_Vec(const gp_Pnt & theP1, const gp_Pnt & theP2);

		/****************** Add ******************/
		/**** md5 signature: e85bda124a8b054ccd5ebc04fa7ebb48 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
None

Description
-----------
Adds two vectors.
") Add;
		void Add(const gp_Vec & theOther);

		/****************** Added ******************/
		/**** md5 signature: 183b15e5f385c474defeca2d65c3d1e8 ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
gp_Vec

Description
-----------
Adds two vectors.
") Added;
		gp_Vec Added(const gp_Vec & theOther);

		/****************** Angle ******************/
		/**** md5 signature: b751708bd6823c4aec88a41b497d1d7e ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
float

Description
-----------
Computes the angular value between <self> and <theother> returns the angle value between 0 and pi in radian. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution from gp or theother.magnitude() <= resolution because the angular value is indefinite if one of the vectors has a null magnitude.
") Angle;
		Standard_Real Angle(const gp_Vec & theOther);

		/****************** AngleWithRef ******************/
		/**** md5 signature: bb859897169c57a7d85f6c14c8881f4a ****/
		%feature("compactdefaultargs") AngleWithRef;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theVRef: gp_Vec

Return
-------
float

Description
-----------
Computes the angle, in radians, between this vector and vector theother. the result is a value between -pi and pi. for this, thevref defines the positive sense of rotation: the angular value is positive, if the cross product this ^ theother has the same orientation as thevref relative to the plane defined by the vectors this and theother. otherwise, the angular value is negative. exceptions gp_vectorwithnullmagnitude if the magnitude of this vector, the vector theother, or the vector thevref is less than or equal to gp::resolution(). standard_domainerror if this vector, the vector theother, and the vector thevref are coplanar, unless this vector and the vector theother are parallel.
") AngleWithRef;
		Standard_Real AngleWithRef(const gp_Vec & theOther, const gp_Vec & theVRef);

		/****************** Coord ******************/
		/**** md5 signature: 8be7c51c8cc2bc59521f97740b0be5d2 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns the coordinate of range theindex: theindex = 1 => x is returned theindex = 2 => y is returned theindex = 3 => z is returned raised if theindex != {1, 2, 3}.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: 8826aee800a33929cf4796869323f263 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: float
theYv: float
theZv: float

Description
-----------
For this vector returns its three coordinates thexv, theyv, and thezv inline.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Cross ******************/
		/**** md5 signature: 9af4822f8d433d8492b843e063cf1c85 ****/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
None

Description
-----------
Computes the cross product between two vectors.
") Cross;
		void Cross(const gp_Vec & theRight);

		/****************** CrossCross ******************/
		/**** md5 signature: 19d896f736c61837393846379b6ab7f9 ****/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
Computes the triple vector product. <self> ^= (thev1 ^ thev2).
") CrossCross;
		void CrossCross(const gp_Vec & theV1, const gp_Vec & theV2);

		/****************** CrossCrossed ******************/
		/**** md5 signature: 29baacbf12bada613a78dcebac29b2a7 ****/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
gp_Vec

Description
-----------
Computes the triple vector product. <self> ^ (thev1 ^ thev2).
") CrossCrossed;
		gp_Vec CrossCrossed(const gp_Vec & theV1, const gp_Vec & theV2);

		/****************** CrossMagnitude ******************/
		/**** md5 signature: f669749b76d4aaeb158763d03a2cb3b1 ****/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
float

Description
-----------
Computes the magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||.
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_Vec & theRight);

		/****************** CrossSquareMagnitude ******************/
		/**** md5 signature: 1faad69f24a74292007cc4df0fdaf8dd ****/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
float

Description
-----------
Computes the square magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||**2.
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_Vec & theRight);

		/****************** Crossed ******************/
		/**** md5 signature: d3e31a702486c99de0e70b6942d62dd2 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
gp_Vec

Description
-----------
Computes the cross product between two vectors.
") Crossed;
		gp_Vec Crossed(const gp_Vec & theRight);

		/****************** Divide ******************/
		/**** md5 signature: 6b91e208468c68ac43147a4e287acb7d ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
Divides a vector by a scalar.
") Divide;
		void Divide(const Standard_Real theScalar);

		/****************** Divided ******************/
		/**** md5 signature: 7db4b094c0beb4e5ff8b70252b2c56b2 ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec

Description
-----------
Divides a vector by a scalar.
") Divided;
		gp_Vec Divided(const Standard_Real theScalar);

		/****************** Dot ******************/
		/**** md5 signature: ba68d52afc4f6fed97550f37aab6a56f ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
float

Description
-----------
Computes the scalar product.
") Dot;
		Standard_Real Dot(const gp_Vec & theOther);

		/****************** DotCross ******************/
		/**** md5 signature: 4e387a4bfab14f664547ee45402121c1 ****/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
float

Description
-----------
Computes the triple scalar product <self> * (thev1 ^ thev2).
") DotCross;
		Standard_Real DotCross(const gp_Vec & theV1, const gp_Vec & theV2);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** IsEqual ******************/
		/**** md5 signature: 2ac5ae9d97482a3a85db3acf17ae3ac7 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theLinearTolerance: float
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the two vectors have the same magnitude value and the same direction. the precision values are thelineartolerance for the magnitude and theangulartolerance for the direction.
") IsEqual;
		Standard_Boolean IsEqual(const gp_Vec & theOther, const Standard_Real theLinearTolerance, const Standard_Real theAngularTolerance);

		/****************** IsNormal ******************/
		/**** md5 signature: c474d74c78fda1700119b5b241af6d9b ****/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if abs(<self>.angle(theother) - pi/2.) <= theangulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or theother.magnitude() <= resolution from gp.
") IsNormal;
		Standard_Boolean IsNormal(const gp_Vec & theOther, const Standard_Real theAngularTolerance);

		/****************** IsOpposite ******************/
		/**** md5 signature: c911b88c3d88e6bc27e2c3ca57f43ed8 ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if pi - <self>.angle(theother) <= theangulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Vec & theOther, const Standard_Real theAngularTolerance);

		/****************** IsParallel ******************/
		/**** md5 signature: 31f65bb9984edf8b98acd924999056f9 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if angle(<self>, theother) <= theangulartolerance or pi - angle(<self>, theother) <= theangulartolerance this definition means that two parallel vectors cannot define a plane but two vectors with opposite directions are considered as parallel. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or other.magnitude() <= resolution from gp.
") IsParallel;
		Standard_Boolean IsParallel(const gp_Vec & theOther, const Standard_Real theAngularTolerance);

		/****************** Magnitude ******************/
		/**** md5 signature: 32ce43647be1c0dd397a58841fa1163e ****/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the magnitude of this vector.
") Magnitude;
		Standard_Real Magnitude();

		/****************** Mirror ******************/
		/**** md5 signature: b85d16d9949c4ef27a2fa6c3d76269ae ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Vec & theV);

		/****************** Mirror ******************/
		/**** md5 signature: cfb16cae08525c5f4ab330102e0377d4 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax1 & theA1);

		/****************** Mirror ******************/
		/**** md5 signature: ad34943401a2334beed8ccc79094d8df ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
None

Description
-----------
No available documentation.
") Mirror;
		void Mirror(const gp_Ax2 & theA2);

		/****************** Mirrored ******************/
		/**** md5 signature: 733ec5fa26b2fc8981d86078ca92a7eb ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec

Return
-------
gp_Vec

Description
-----------
Performs the symmetrical transformation of a vector with respect to the vector thev which is the center of the symmetry.
") Mirrored;
		gp_Vec Mirrored(const gp_Vec & theV);

		/****************** Mirrored ******************/
		/**** md5 signature: d260cd3e623d418030d1d2be064ff9d2 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1

Return
-------
gp_Vec

Description
-----------
Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Vec Mirrored(const gp_Ax1 & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: fa9fb7beec4415155d02add28a2e92fd ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA2: gp_Ax2

Return
-------
gp_Vec

Description
-----------
Performs the symmetrical transformation of a vector with respect to a plane. the axis placement thea2 locates the plane of the symmetry: (location, xdirection, ydirection).
") Mirrored;
		gp_Vec Mirrored(const gp_Ax2 & theA2);

		/****************** Multiplied ******************/
		/**** md5 signature: 598abd18bdd1d8d332b79ef313fc6288 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec

Description
-----------
Multiplies a vector by a scalar.
") Multiplied;
		gp_Vec Multiplied(const Standard_Real theScalar);

		/****************** Multiply ******************/
		/**** md5 signature: 94c083012ff2f3e798eccef399e23708 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
Multiplies a vector by a scalar.
") Multiply;
		void Multiply(const Standard_Real theScalar);

		/****************** Normalize ******************/
		/**** md5 signature: df5d0be92b25875af291db140fcd7cf4 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from gp.
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: aeef953109572684206e8085ce2bb249 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from gp.
") Normalized;
		gp_Vec Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reverses the direction of a vector.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 72f6b8c01fbd499ae4c92c2ddd1bec18 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
Reverses the direction of a vector.
") Reversed;
		gp_Vec Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: c26ecb0fe9ed773c4bd2ec6af298bfe8 ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: a33152801b7c9dfaa65a4be11a8c6cd7 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax1
theAng: float

Return
-------
gp_Vec

Description
-----------
Rotates a vector. thea1 is the axis of the rotation. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Vec Rotated(const gp_Ax1 & theA1, const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: 2d6b28bd34c257ef941fb69b6ae84ed6 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 480942da813646e347aedefb3586a4db ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
gp_Vec

Description
-----------
Scales a vector. thes is the scaling value.
") Scaled;
		gp_Vec Scaled(const Standard_Real theS);

		/****************** SetCoord ******************/
		/**** md5 signature: 52cef977af7789ed4ebe28e0285a09a0 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
Changes the coordinate of range theindex theindex = 1 => x is modified theindex = 2 => y is modified theindex = 3 => z is modified raised if theindex != {1, 2, 3}.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetCoord ******************/
		/**** md5 signature: 9c543f38d13b1e9d90b3bd288c111618 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float
theZv: float

Return
-------
None

Description
-----------
For this vector, assigns - the values thexv, theyv and thezv to its three coordinates.
") SetCoord;
		void SetCoord(const Standard_Real theXv, const Standard_Real theYv, const Standard_Real theZv);

		/****************** SetLinearForm ******************/
		/**** md5 signature: ba784cc1e5faf9ae13e32c11f8623030 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec
theA2: float
theV2: gp_Vec
theA3: float
theV3: gp_Vec
theV4: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thea2 * thev2 + thea3 * thev3 + thev4.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec & theV1, const Standard_Real theA2, const gp_Vec & theV2, const Standard_Real theA3, const gp_Vec & theV3, const gp_Vec & theV4);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 7da92e6de8028f7356740dde8f489c24 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec
theA2: float
theV2: gp_Vec
theA3: float
theV3: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thea2 * thev2 + thea3 * thev3.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec & theV1, const Standard_Real theA2, const gp_Vec & theV2, const Standard_Real theA3, const gp_Vec & theV3);

		/****************** SetLinearForm ******************/
		/**** md5 signature: a4f356d662bfeef6a3ed7c139e665222 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec
theA2: float
theV2: gp_Vec
theV3: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thea2 * thev2 + thev3.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec & theV1, const Standard_Real theA2, const gp_Vec & theV2, const gp_Vec & theV3);

		/****************** SetLinearForm ******************/
		/**** md5 signature: cf46b535053cf4f01ff451d327e50935 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec
theA2: float
theV2: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thea2 * thev2.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec & theV1, const Standard_Real theA2, const gp_Vec & theV2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 7b39ed526a79ef435bb15c19c3e4af5e ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thev2.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec & theV1, const gp_Vec & theV2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: f8d178ea5c355745bbbdc45ea3f30517 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
<self> is set to the following linear form: thev1 + thev2.
") SetLinearForm;
		void SetLinearForm(const gp_Vec & theV1, const gp_Vec & theV2);

		/****************** SetX ******************/
		/**** md5 signature: 1bf65ee31f0303d20dd96cc6dbcfa44e ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this vector.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetXYZ ******************/
		/**** md5 signature: 310569de5a825945530b122be4e6ca69 ****/
		%feature("compactdefaultargs") SetXYZ;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XYZ

Return
-------
None

Description
-----------
Assigns the three coordinates of thecoord to this vector.
") SetXYZ;
		void SetXYZ(const gp_XYZ & theCoord);

		/****************** SetY ******************/
		/**** md5 signature: 4d69a9fe7ed8a7d182afbae632001bd2 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this vector.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** SetZ ******************/
		/**** md5 signature: 50f9696665e382f6944bd96e35b0a063 ****/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this vector.
") SetZ;
		void SetZ(const Standard_Real theZ);

		/****************** SquareMagnitude ******************/
		/**** md5 signature: 65ee82a5930920204ad1cfebbc4cbbf2 ****/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the square magnitude of this vector.
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		/**** md5 signature: d490220c80e49ee10b08ea74fe9ca9f5 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
None

Description
-----------
Subtracts two vectors.
") Subtract;
		void Subtract(const gp_Vec & theRight);

		/****************** Subtracted ******************/
		/**** md5 signature: eda310ee34b23320e3e470ccb40edbb2 ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
gp_Vec

Description
-----------
Subtracts two vectors.
") Subtracted;
		gp_Vec Subtracted(const gp_Vec & theRight);

		/****************** Transform ******************/
		/**** md5 signature: 0737a7286be728220e1a55ba0d6eafc3 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
None

Description
-----------
Transforms a vector with the transformation thet.
") Transform;
		void Transform(const gp_Trsf & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 48cdf716cf3e31fccc783cccf9905ef6 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf

Return
-------
gp_Vec

Description
-----------
Transforms a vector with the transformation thet.
") Transformed;
		gp_Vec Transformed(const gp_Trsf & theT);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this vector, returns its x coordinate.
") X;
		Standard_Real X();

		/****************** XYZ ******************/
		/**** md5 signature: 0648fd358f9622b8fa775d64dec0d0a4 ****/
		%feature("compactdefaultargs") XYZ;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
For this vector, returns - its three coordinates as a number triple.
") XYZ;
		const gp_XYZ XYZ();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this vector, returns its y coordinate.
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 786e228d2eeaf64f99dd51d3ab338f77 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this vector, returns its z coordinate.
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: 9c18aa4e5462d66a6115348e9a28b890 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator *;
		gp_Vec operator *(const Standard_Real theScalar);

		/****************** operator * ******************/
		/**** md5 signature: 363bcfe1780d868514bd6db084048366 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
float

Description
-----------
No available documentation.
") operator *;
		Standard_Real operator *(const gp_Vec & theOther);


%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****************** operator + ******************/
		/**** md5 signature: 93b1480972ce5d4dbcc4bd90a181cd59 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator +;
		gp_Vec operator +(const gp_Vec & theOther);


%extend{
    void __iadd_wrapper__(const gp_Vec other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****************** operator - ******************/
		/**** md5 signature: 13506a405f58dab7716acf05b5ec6fc7 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator -;
		gp_Vec operator -(const gp_Vec & theRight);

		/****************** operator - ******************/
		/**** md5 signature: b019f223dbc17f31ce64d3eb0e5cdab5 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator -;
		gp_Vec operator -();


%extend{
    void __isub_wrapper__(const gp_Vec other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****************** operator / ******************/
		/**** md5 signature: 34acbb84206bf14cbc792d7112b3911e ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec

Description
-----------
No available documentation.
") operator /;
		gp_Vec operator /(const Standard_Real theScalar);


%extend{
    void __itruediv_wrapper__(const Standard_Real other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};



%extend gp_Vec {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Vec {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Vec()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Vec')
    }
};
%extend gp_Vec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class gp_Vec2d *
*****************/
class gp_Vec2d {
	public:
		/****************** gp_Vec2d ******************/
		/**** md5 signature: 05b7ab2bb2ecb94843cc3cd8e4ceb553 ****/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a zero vector.
") gp_Vec2d;
		 gp_Vec2d();

		/****************** gp_Vec2d ******************/
		/**** md5 signature: 48ade316c7b23d43fd89edfc1cb684e0 ****/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theV: gp_Dir2d

Return
-------
None

Description
-----------
Creates a unitary vector from a direction thev.
") gp_Vec2d;
		 gp_Vec2d(const gp_Dir2d & theV);

		/****************** gp_Vec2d ******************/
		/**** md5 signature: 1c89ec00eeaa8493fe1c579caa2aff50 ****/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Creates a vector with a doublet of coordinates.
") gp_Vec2d;
		 gp_Vec2d(const gp_XY & theCoord);

		/****************** gp_Vec2d ******************/
		/**** md5 signature: c963b436d75381130b6b1e226db6beba ****/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float

Return
-------
None

Description
-----------
Creates a point with its two cartesian coordinates.
") gp_Vec2d;
		 gp_Vec2d(const Standard_Real theXv, const Standard_Real theYv);

		/****************** gp_Vec2d ******************/
		/**** md5 signature: e982e1194c488fb27534f0c75cba7643 ****/
		%feature("compactdefaultargs") gp_Vec2d;
		%feature("autodoc", "
Parameters
----------
theP1: gp_Pnt2d
theP2: gp_Pnt2d

Return
-------
None

Description
-----------
Creates a vector from two points. the length of the vector is the distance between thep1 and thep2.
") gp_Vec2d;
		 gp_Vec2d(const gp_Pnt2d & theP1, const gp_Pnt2d & theP2);

		/****************** Add ******************/
		/**** md5 signature: c2895febe7400b6786be774a8ff75886 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const gp_Vec2d & theOther);

		/****************** Added ******************/
		/**** md5 signature: 432b9c6e72af81b9a938507d15331383 ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
Adds two vectors.
") Added;
		gp_Vec2d Added(const gp_Vec2d & theOther);

		/****************** Angle ******************/
		/**** md5 signature: da48acaf3f6b6c9d5c6f9dd22b93caac ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
float

Description
-----------
Computes the angular value between <self> and <theother> returns the angle value between -pi and pi in radian. the orientation is from <self> to theother. the positive sense is the trigonometric sense. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution from gp or theother.magnitude() <= resolution because the angular value is indefinite if one of the vectors has a null magnitude.
") Angle;
		Standard_Real Angle(const gp_Vec2d & theOther);

		/****************** Coord ******************/
		/**** md5 signature: 8be7c51c8cc2bc59521f97740b0be5d2 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns the coordinate of range theindex: theindex = 1 => x is returned theindex = 2 => y is returned raised if theindex != {1, 2}.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: cd6b81aa323a641be1b7710b8f29c3b9 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXv: float
theYv: float

Description
-----------
For this vector, returns its two coordinates thexv and theyv.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CrossMagnitude ******************/
		/**** md5 signature: e11325657c0deb816152066189faa4ab ****/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
float

Description
-----------
Computes the magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||.
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_Vec2d & theRight);

		/****************** CrossSquareMagnitude ******************/
		/**** md5 signature: ca8a6dee6a5b2fb5ea663d9a42f0da7b ****/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
float

Description
-----------
Computes the square magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||**2.
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_Vec2d & theRight);

		/****************** Crossed ******************/
		/**** md5 signature: d30b1ddf1a928da8d549ad74a3df9142 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
float

Description
-----------
Computes the crossing product between two vectors.
") Crossed;
		Standard_Real Crossed(const gp_Vec2d & theRight);

		/****************** Divide ******************/
		/**** md5 signature: 6b91e208468c68ac43147a4e287acb7d ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
No available documentation.
") Divide;
		void Divide(const Standard_Real theScalar);

		/****************** Divided ******************/
		/**** md5 signature: 50150c0b4b454d3725f7cb1cf03c1ade ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec2d

Description
-----------
Divides a vector by a scalar.
") Divided;
		gp_Vec2d Divided(const Standard_Real theScalar);

		/****************** Dot ******************/
		/**** md5 signature: 83f496aae5b485d051619c75b5a1cb37 ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
float

Description
-----------
Computes the scalar product.
") Dot;
		Standard_Real Dot(const gp_Vec2d & theOther);

		/****************** GetNormal ******************/
		/**** md5 signature: dcb93582d2e8508e17b0006ff62d302b ****/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") GetNormal;
		gp_Vec2d GetNormal();

		/****************** IsEqual ******************/
		/**** md5 signature: f6af12975fc1702dd89874d75f43ae4f ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theLinearTolerance: float
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if the two vectors have the same magnitude value and the same direction. the precision values are thelineartolerance for the magnitude and theangulartolerance for the direction.
") IsEqual;
		Standard_Boolean IsEqual(const gp_Vec2d & theOther, const Standard_Real theLinearTolerance, const Standard_Real theAngularTolerance);

		/****************** IsNormal ******************/
		/**** md5 signature: cd2423101287311ef4d810a997e7f783 ****/
		%feature("compactdefaultargs") IsNormal;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if abs(abs(<self>.angle(theother)) - pi/2.) <= theangulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or theother.magnitude() <= resolution from gp.
") IsNormal;
		Standard_Boolean IsNormal(const gp_Vec2d & theOther, const Standard_Real theAngularTolerance);

		/****************** IsOpposite ******************/
		/**** md5 signature: 1bf3ebb7fd93f4d54ba61e3d7c8fea8f ****/
		%feature("compactdefaultargs") IsOpposite;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if pi - abs(<self>.angle(theother)) <= theangulartolerance raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or theother.magnitude() <= resolution from gp.
") IsOpposite;
		Standard_Boolean IsOpposite(const gp_Vec2d & theOther, const Standard_Real theAngularTolerance);

		/****************** IsParallel ******************/
		/**** md5 signature: ac36646a5d155227bbf52a091e1eeaf8 ****/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d
theAngularTolerance: float

Return
-------
bool

Description
-----------
Returns true if abs(angle(<self>, theother)) <= theangulartolerance or pi - abs(angle(<self>, theother)) <= theangulartolerance two vectors with opposite directions are considered as parallel. raises vectorwithnullmagnitude if <self>.magnitude() <= resolution or theother.magnitude() <= resolution from gp.
") IsParallel;
		Standard_Boolean IsParallel(const gp_Vec2d & theOther, const Standard_Real theAngularTolerance);

		/****************** Magnitude ******************/
		/**** md5 signature: 32ce43647be1c0dd397a58841fa1163e ****/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the magnitude of this vector.
") Magnitude;
		Standard_Real Magnitude();

		/****************** Mirror ******************/
		/**** md5 signature: ea69e2d6868e004299bb83dd68d54283 ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a vector with respect to the vector thev which is the center of the symmetry.
") Mirror;
		void Mirror(const gp_Vec2d & theV);

		/****************** Mirror ******************/
		/**** md5 signature: 235268bdc819ae1aa6028dbccd7a8cfb ****/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
None

Description
-----------
Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
") Mirror;
		void Mirror(const gp_Ax2d & theA1);

		/****************** Mirrored ******************/
		/**** md5 signature: f8589ba6940d77412bec5604dacd9307 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theV: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
Performs the symmetrical transformation of a vector with respect to the vector thev which is the center of the symmetry.
") Mirrored;
		gp_Vec2d Mirrored(const gp_Vec2d & theV);

		/****************** Mirrored ******************/
		/**** md5 signature: 2a2565e4a18bdb5f501d2e7387b1ec22 ****/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "
Parameters
----------
theA1: gp_Ax2d

Return
-------
gp_Vec2d

Description
-----------
Performs the symmetrical transformation of a vector with respect to an axis placement which is the axis of the symmetry.
") Mirrored;
		gp_Vec2d Mirrored(const gp_Ax2d & theA1);

		/****************** Multiplied ******************/
		/**** md5 signature: a6a935e8f643ca63aae1566c1f6df1b6 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec2d

Description
-----------
Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from package gp.
") Multiplied;
		gp_Vec2d Multiplied(const Standard_Real theScalar);

		/****************** Multiply ******************/
		/**** md5 signature: 94c083012ff2f3e798eccef399e23708 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
No available documentation.
") Multiply;
		void Multiply(const Standard_Real theScalar);

		/****************** Normalize ******************/
		/**** md5 signature: df5d0be92b25875af291db140fcd7cf4 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: 86d603dc02ee841c7172dbf48966fb92 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Normalizes a vector raises an exception if the magnitude of the vector is lower or equal to resolution from package gp. reverses the direction of a vector.
") Normalized;
		gp_Vec2d Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: ec423c2fb50a9f76cc25647dc8893a02 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
Reverses the direction of a vector.
") Reversed;
		gp_Vec2d Reversed();

		/****************** Rotate ******************/
		/**** md5 signature: 82996f7fe32ff93d39eb7f8fd7b1cdfd ****/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "
Parameters
----------
theAng: float

Return
-------
None

Description
-----------
No available documentation.
") Rotate;
		void Rotate(const Standard_Real theAng);

		/****************** Rotated ******************/
		/**** md5 signature: 342d4aadc2457355ae59bfd448c70147 ****/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "
Parameters
----------
theAng: float

Return
-------
gp_Vec2d

Description
-----------
Rotates a vector. theang is the angular value of the rotation in radians.
") Rotated;
		gp_Vec2d Rotated(const Standard_Real theAng);

		/****************** Scale ******************/
		/**** md5 signature: 2d6b28bd34c257ef941fb69b6ae84ed6 ****/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		void Scale(const Standard_Real theS);

		/****************** Scaled ******************/
		/**** md5 signature: 2020e6e566e0a55494be8f23c73b9e99 ****/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "
Parameters
----------
theS: float

Return
-------
gp_Vec2d

Description
-----------
Scales a vector. thes is the scaling value.
") Scaled;
		gp_Vec2d Scaled(const Standard_Real theS);

		/****************** SetCoord ******************/
		/**** md5 signature: 52cef977af7789ed4ebe28e0285a09a0 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
Changes the coordinate of range theindex theindex = 1 => x is modified theindex = 2 => y is modified raises outofrange if theindex != {1, 2}.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetCoord ******************/
		/**** md5 signature: f7ce5829547d8c735ee00c7444b81655 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theXv: float
theYv: float

Return
-------
None

Description
-----------
For this vector, assigns the values thexv and theyv to its two coordinates.
") SetCoord;
		void SetCoord(const Standard_Real theXv, const Standard_Real theYv);

		/****************** SetLinearForm ******************/
		/**** md5 signature: bd906f0bd8e37987e9d9ae94dae4a5b5 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec2d
theA2: float
theV2: gp_Vec2d
theV3: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thea2 * thev2 + thev3.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec2d & theV1, const Standard_Real theA2, const gp_Vec2d & theV2, const gp_Vec2d & theV3);

		/****************** SetLinearForm ******************/
		/**** md5 signature: ce6784e542a49fe5902e1c951b0d7114 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec2d
theA2: float
theV2: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thea2 * thev2.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec2d & theV1, const Standard_Real theA2, const gp_Vec2d & theV2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: bec6015049757435b1b8c89845425c1e ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theV1: gp_Vec2d
theV2: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: thea1 * thev1 + thev2.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_Vec2d & theV1, const gp_Vec2d & theV2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 33d8769d59477c596bbfbd4c5da17e83 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theV1: gp_Vec2d
theV2: gp_Vec2d

Return
-------
None

Description
-----------
<self> is set to the following linear form: thev1 + thev2.
") SetLinearForm;
		void SetLinearForm(const gp_Vec2d & theV1, const gp_Vec2d & theV2);

		/****************** SetX ******************/
		/**** md5 signature: 1bf65ee31f0303d20dd96cc6dbcfa44e ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this vector.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetXY ******************/
		/**** md5 signature: a04e254971f4b44fa9cc1f7852c920de ****/
		%feature("compactdefaultargs") SetXY;
		%feature("autodoc", "
Parameters
----------
theCoord: gp_XY

Return
-------
None

Description
-----------
Assigns the two coordinates of thecoord to this vector.
") SetXY;
		void SetXY(const gp_XY & theCoord);

		/****************** SetY ******************/
		/**** md5 signature: 4d69a9fe7ed8a7d182afbae632001bd2 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the y coordinate of this vector.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** SquareMagnitude ******************/
		/**** md5 signature: 65ee82a5930920204ad1cfebbc4cbbf2 ****/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes the square magnitude of this vector.
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		/**** md5 signature: e0df287ba2f43c66cabb2b6ec4f2c10d ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
None

Description
-----------
Subtracts two vectors.
") Subtract;
		void Subtract(const gp_Vec2d & theRight);

		/****************** Subtracted ******************/
		/**** md5 signature: 091661a7d99b2cf0d7e78cbf6e194162 ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
Subtracts two vectors.
") Subtracted;
		gp_Vec2d Subtracted(const gp_Vec2d & theRight);

		/****************** Transform ******************/
		/**** md5 signature: 94f8045e6a4465708e872ec10cb3f4d1 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
None

Description
-----------
No available documentation.
") Transform;
		void Transform(const gp_Trsf2d & theT);

		/****************** Transformed ******************/
		/**** md5 signature: 07ec7b662dc14a46b6ff8505fe429a93 ****/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
theT: gp_Trsf2d

Return
-------
gp_Vec2d

Description
-----------
Transforms a vector with a trsf from gp.
") Transformed;
		gp_Vec2d Transformed(const gp_Trsf2d & theT);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this vector, returns its x coordinate.
") X;
		Standard_Real X();

		/****************** XY ******************/
		/**** md5 signature: 8129e296b053b8847fa5f009e7848507 ****/
		%feature("compactdefaultargs") XY;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
For this vector, returns its two coordinates as a number pair.
") XY;
		const gp_XY XY();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
For this vector, returns its y coordinate.
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		/**** md5 signature: c09f1676bca1324ffe97d50e03553e47 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
float

Description
-----------
No available documentation.
") operator *;
		Standard_Real operator *(const gp_Vec2d & theOther);

		/****************** operator * ******************/
		/**** md5 signature: 38df849c6336da76c6cdd4e71a2cdf28 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator *;
		gp_Vec2d operator *(const Standard_Real theScalar);


%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****************** operator + ******************/
		/**** md5 signature: 34d7a6c112671277428feb10d3747300 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator +;
		gp_Vec2d operator +(const gp_Vec2d & theOther);


%extend{
    void __iadd_wrapper__(const gp_Vec2d other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****************** operator - ******************/
		/**** md5 signature: cbda9d88ce3397da41adc1df0723fc91 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator -;
		gp_Vec2d operator -();

		/****************** operator - ******************/
		/**** md5 signature: a5367d44226c848185a1b97cde32ec50 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theRight: gp_Vec2d

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator -;
		gp_Vec2d operator -(const gp_Vec2d & theRight);


%extend{
    void __isub_wrapper__(const gp_Vec2d other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****************** operator / ******************/
		/**** md5 signature: b0e5e71aaabf55191684b3975d9eb54e ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") operator /;
		gp_Vec2d operator /(const Standard_Real theScalar);


%extend{
    void __itruediv_wrapper__(const Standard_Real other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};



%extend gp_Vec2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_Vec2d {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_Vec2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_Vec2d')
    }
};
%extend gp_Vec2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************
* class gp_XY *
**************/
class gp_XY {
	public:
		/****************** gp_XY ******************/
		/**** md5 signature: 481937d291f637c0bf2b607e21a1236b ****/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates xy object with zero coordinates (0,0).
") gp_XY;
		 gp_XY();

		/****************** gp_XY ******************/
		/**** md5 signature: 2954fedf69ba3bfdd8644975c9e365e4 ****/
		%feature("compactdefaultargs") gp_XY;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float

Return
-------
None

Description
-----------
A number pair defined by the xy coordinates.
") gp_XY;
		 gp_XY(const Standard_Real theX, const Standard_Real theY);

		/****************** Add ******************/
		/**** md5 signature: 0aea59d9b8e91f4da1fd1bc82c836d0c ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
None

Description
-----------
Computes the sum of this number pair and number pair theother @code <self>.x() = <self>.x() + theother.x() <self>.y() = <self>.y() + theother.y() @endcode.
") Add;
		void Add(const gp_XY & theOther);

		/****************** Added ******************/
		/**** md5 signature: 550ccb9bf6e21ceb48601cc416a4c7d3 ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
Computes the sum of this number pair and number pair theother @code new.x() = <self>.x() + theother.x() new.y() = <self>.y() + theother.y() @endcode.
") Added;
		gp_XY Added(const gp_XY & theOther);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeCoord(const Standard_Integer theIndex) {
            return (Standard_Real) $self->ChangeCoord(theIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeCoord(const Standard_Integer theIndex,Standard_Real value) {
            $self->ChangeCoord(theIndex)=value;
            }
        };
		/****************** Coord ******************/
		/**** md5 signature: f8e2ac672e52fd226debe419b91a5fdd ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns the coordinate of range theindex: theindex = 1 => x is returned theindex = 2 => y is returned raises outofrange if theindex != {1, 2}.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: 777710661e7d75e02bbe6cd9da6204dc ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float

Description
-----------
For this number pair, returns its coordinates x and y.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CrossMagnitude ******************/
		/**** md5 signature: b9d3fd498ec45080533a13dc2205b23d ****/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XY

Return
-------
float

Description
-----------
Computes the magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||.
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_XY & theRight);

		/****************** CrossSquareMagnitude ******************/
		/**** md5 signature: 9cbab779daca690572d69e0cc393cce2 ****/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XY

Return
-------
float

Description
-----------
Computes the square magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||**2.
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_XY & theRight);

		/****************** Crossed ******************/
		/**** md5 signature: 98e7234d929e0d7f7094422326680e37 ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
float

Description
-----------
@code double d = <self>.x() * theother.y() - <self>.y() * theother.x() @endcode.
") Crossed;
		Standard_Real Crossed(const gp_XY & theOther);

		/****************** Divide ******************/
		/**** md5 signature: 6b91e208468c68ac43147a4e287acb7d ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
Divides <self> by a real.
") Divide;
		void Divide(const Standard_Real theScalar);

		/****************** Divided ******************/
		/**** md5 signature: 8c7264e49e4e15080aa8f3a30084a613 ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XY

Description
-----------
Divides <self> by a real.
") Divided;
		gp_XY Divided(const Standard_Real theScalar);

		/****************** Dot ******************/
		/**** md5 signature: 203d0d5944994685eb4acb7a8c98b4e6 ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
float

Description
-----------
Computes the scalar product between <self> and theother.
") Dot;
		Standard_Real Dot(const gp_XY & theOther);

		/****************** IsEqual ******************/
		/**** md5 signature: 2b1e8940d16c5a3875e1354e0b967cc8 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY
theTolerance: float

Return
-------
bool

Description
-----------
Returns true if the coordinates of this number pair are equal to the respective coordinates of the number pair theother, within the specified tolerance thetolerance. i.e.: abs(<self>.x() - theother.x()) <= thetolerance and abs(<self>.y() - theother.y()) <= thetolerance and computations.
") IsEqual;
		Standard_Boolean IsEqual(const gp_XY & theOther, const Standard_Real theTolerance);

		/****************** Modulus ******************/
		/**** md5 signature: 2699d32c474eedddd33fd283c9bedcfe ****/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes sqrt (x*x + y*y) where x and y are the two coordinates of this number pair.
") Modulus;
		Standard_Real Modulus();

		/****************** Multiplied ******************/
		/**** md5 signature: 32129e6fa98206b895bbd9d0dbc2abf5 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XY

Description
-----------
@code new.x() = <self>.x() * thescalar; new.y() = <self>.y() * thescalar; @endcode.
") Multiplied;
		gp_XY Multiplied(const Standard_Real theScalar);

		/****************** Multiplied ******************/
		/**** md5 signature: ec4467f37006708c16cbab6f60a02570 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
@code new.x() = <self>.x() * theother.x(); new.y() = <self>.y() * theother.y(); @endcode.
") Multiplied;
		gp_XY Multiplied(const gp_XY & theOther);

		/****************** Multiplied ******************/
		/**** md5 signature: 32075de5ff84d6c32829b876df7d260e ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
gp_XY

Description
-----------
New = thematrix * <self>.
") Multiplied;
		gp_XY Multiplied(const gp_Mat2d & theMatrix);

		/****************** Multiply ******************/
		/**** md5 signature: 94c083012ff2f3e798eccef399e23708 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
@code <self>.x() = <self>.x() * thescalar; <self>.y() = <self>.y() * thescalar; @endcode.
") Multiply;
		void Multiply(const Standard_Real theScalar);

		/****************** Multiply ******************/
		/**** md5 signature: 4f77e5fd412b710b83f5993cd03e1e94 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
None

Description
-----------
@code <self>.x() = <self>.x() * theother.x(); <self>.y() = <self>.y() * theother.y(); @endcode.
") Multiply;
		void Multiply(const gp_XY & theOther);

		/****************** Multiply ******************/
		/**** md5 signature: 9fa69e1257a83260f98fe1bf1e332ad5 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
None

Description
-----------
<self> = thematrix * <self>.
") Multiply;
		void Multiply(const gp_Mat2d & theMatrix);

		/****************** Normalize ******************/
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.x() = <self>.x()/ <self>.modulus() <self>.y() = <self>.y()/ <self>.modulus() @endcode raises constructionerror if <self>.modulus() <= resolution from gp.
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: 8898944e3b7e692f706481a3f7cdaa51 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
@code new.x() = <self>.x()/ <self>.modulus() new.y() = <self>.y()/ <self>.modulus() @endcode raises constructionerror if <self>.modulus() <= resolution from gp.
") Normalized;
		gp_XY Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: 9c5e529aeddddf4802e298a017101b81 ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.x() = -<self>.x() <self>.y() = -<self>.y().
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: 3f676473578a78a63892a2a9be728f89 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
@code new.x() = -<self>.x() new.y() = -<self>.y() @endcode.
") Reversed;
		gp_XY Reversed();

		/****************** SetCoord ******************/
		/**** md5 signature: e616fdf75a83d77d3aaf1662378e0d5a ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
Modifies the coordinate of range theindex theindex = 1 => x is modified theindex = 2 => y is modified raises outofrange if theindex != {1, 2}.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetCoord ******************/
		/**** md5 signature: e607770359989dca6babf13f3f489305 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float

Return
-------
None

Description
-----------
For this number pair, assigns the values thex and they to its coordinates.
") SetCoord;
		void SetCoord(const Standard_Real theX, const Standard_Real theY);

		/****************** SetLinearForm ******************/
		/**** md5 signature: f4be5e8116b5c8dfc176c7d306a12ba0 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXY1: gp_XY
theA2: float
theXY2: gp_XY

Return
-------
None

Description
-----------
Computes the following linear combination and assigns the result to this number pair: @code thea1 * thexy1 + thea2 * thexy2 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XY & theXY1, const Standard_Real theA2, const gp_XY & theXY2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 1bcb5467e4199183bfa35fbae933fd05 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXY1: gp_XY
theA2: float
theXY2: gp_XY
theXY3: gp_XY

Return
-------
None

Description
-----------
-- computes the following linear combination and assigns the result to this number pair: @code thea1 * thexy1 + thea2 * thexy2 + thexy3 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XY & theXY1, const Standard_Real theA2, const gp_XY & theXY2, const gp_XY & theXY3);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 9bedff4d535ccad73cb118a63d2b0d6c ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXY1: gp_XY
theXY2: gp_XY

Return
-------
None

Description
-----------
Computes the following linear combination and assigns the result to this number pair: @code thea1 * thexy1 + thexy2 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XY & theXY1, const gp_XY & theXY2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: bf4882d80826559c3bdeffa200aede8b ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theXY1: gp_XY
theXY2: gp_XY

Return
-------
None

Description
-----------
Computes the following linear combination and assigns the result to this number pair: @code thexy1 + thexy2 @endcode.
") SetLinearForm;
		void SetLinearForm(const gp_XY & theXY1, const gp_XY & theXY2);

		/****************** SetX ******************/
		/**** md5 signature: 1bf65ee31f0303d20dd96cc6dbcfa44e ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate of this number pair.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetY ******************/
		/**** md5 signature: 4d69a9fe7ed8a7d182afbae632001bd2 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the y coordinate of this number pair.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** SquareModulus ******************/
		/**** md5 signature: 355ed50ec36f0efd762161071f1ceeb0 ****/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes x*x + y*y where x and y are the two coordinates of this number pair.
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Subtract ******************/
		/**** md5 signature: e3e2c4e485bf9f3f43cb609a03c015a0 ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
None

Description
-----------
@code <self>.x() = <self>.x() - theother.x() <self>.y() = <self>.y() - theother.y() @endcode.
") Subtract;
		void Subtract(const gp_XY & theOther);

		/****************** Subtracted ******************/
		/**** md5 signature: f11c2c10f430d270dfb273489de56364 ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
@code new.x() = <self>.x() - theother.x() new.y() = <self>.y() - theother.y() @endcode.
") Subtracted;
		gp_XY Subtracted(const gp_XY & theOther);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the x coordinate of this number pair.
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the y coordinate of this number pair.
") Y;
		Standard_Real Y();

		/****************** operator * ******************/
		/**** md5 signature: 313d5c173b07864133323c3ebb74d1f4 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
float

Description
-----------
No available documentation.
") operator *;
		Standard_Real operator *(const gp_XY & theOther);

		/****************** operator * ******************/
		/**** md5 signature: b7b68196f2cec5c311f8c59cff3fb710 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator *;
		gp_XY operator *(const Standard_Real theScalar);

		/****************** operator * ******************/
		/**** md5 signature: c102cce7afed6fe7ee6cb4da151be2c6 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat2d

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator *;
		gp_XY operator *(const gp_Mat2d & theMatrix);


%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const gp_XY other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const gp_Mat2d other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****************** operator + ******************/
		/**** md5 signature: cbc6099231d3db5976720aa710b80ca4 ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator +;
		gp_XY operator +(const gp_XY & theOther);


%extend{
    void __iadd_wrapper__(const gp_XY other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****************** operator - ******************/
		/**** md5 signature: 67c07ba3c8d9e3c28626b927db1ec14a ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "Return
-------
gp_XY

Description
-----------
No available documentation.
") operator -;
		gp_XY operator -();

		/****************** operator - ******************/
		/**** md5 signature: 0081cecc848380b2fd1cf6d9cb129fcb ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XY

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator -;
		gp_XY operator -(const gp_XY & theOther);


%extend{
    void __isub_wrapper__(const gp_XY other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****************** operator / ******************/
		/**** md5 signature: aa3470df1c66fed23aa151e38121ca60 ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XY

Description
-----------
No available documentation.
") operator /;
		gp_XY operator /(const Standard_Real theScalar);


%extend{
    void __itruediv_wrapper__(const Standard_Real other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};



%extend gp_XY {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_XY {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_XY()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_XY')
    }
};
%extend gp_XY {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************
* class gp_XYZ *
***************/
class gp_XYZ {
	public:
		/****************** gp_XYZ ******************/
		/**** md5 signature: 8e065ee14f52a32317aeda3dae3f3f86 ****/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an xyz object with zero coordinates (0,0,0).
") gp_XYZ;
		 gp_XYZ();

		/****************** gp_XYZ ******************/
		/**** md5 signature: b892e83e6b84ed612c3c11b26e35f125 ****/
		%feature("compactdefaultargs") gp_XYZ;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
None

Description
-----------
Creates an xyz with given coordinates.
") gp_XYZ;
		 gp_XYZ(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ);

		/****************** Add ******************/
		/**** md5 signature: 67bef2099e583349ca294561f4af58fc ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.x() = <self>.x() + theother.x() <self>.y() = <self>.y() + theother.y() <self>.z() = <self>.z() + theother.z() @endcode.
") Add;
		void Add(const gp_XYZ & theOther);

		/****************** Added ******************/
		/**** md5 signature: 02dca3aa1df695feacb2fb26bf5edb60 ****/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.x() = <self>.x() + theother.x() new.y() = <self>.y() + theother.y() new.z() = <self>.z() + theother.z() @endcode.
") Added;
		gp_XYZ Added(const gp_XYZ & theOther);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeCoord(const Standard_Integer theIndex) {
            return (Standard_Real) $self->ChangeCoord(theIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeCoord(const Standard_Integer theIndex,Standard_Real value) {
            $self->ChangeCoord(theIndex)=value;
            }
        };
		/****************** ChangeData ******************/
		/**** md5 signature: 44cc2d1ec4828f066e5752991dfd3e1e ****/
		%feature("compactdefaultargs") ChangeData;
		%feature("autodoc", "Return
-------
float *

Description
-----------
Returns a ptr to coordinates location. is useful for algorithms, but does not perform any checks!.
") ChangeData;
		Standard_Real * ChangeData();

		/****************** Coord ******************/
		/**** md5 signature: 8be7c51c8cc2bc59521f97740b0be5d2 ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns the coordinate of range theindex: theindex = 1 => x is returned theindex = 2 => y is returned theindex = 3 => z is returned //! raises outofrange if theindex != {1, 2, 3}.
") Coord;
		Standard_Real Coord(const Standard_Integer theIndex);

		/****************** Coord ******************/
		/**** md5 signature: 5ef85c73f9c80cea4d8dc9bec59c3e4d ****/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------

Return
-------
theX: float
theY: float
theZ: float

Description
-----------
No available documentation.
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Cross ******************/
		/**** md5 signature: 44b6cc9242ff22f43d9b071a9dafa3da ****/
		%feature("compactdefaultargs") Cross;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.x() = <self>.y() * theother.z() - <self>.z() * theother.y() <self>.y() = <self>.z() * theother.x() - <self>.x() * theother.z() <self>.z() = <self>.x() * theother.y() - <self>.y() * theother.x() @endcode.
") Cross;
		void Cross(const gp_XYZ & theOther);

		/****************** CrossCross ******************/
		/**** md5 signature: d58fa681888c289c2338ab4f793c27e3 ****/
		%feature("compactdefaultargs") CrossCross;
		%feature("autodoc", "
Parameters
----------
theCoord1: gp_XYZ
theCoord2: gp_XYZ

Return
-------
None

Description
-----------
Triple vector product computes <self> = <self>.cross(thecoord1.cross(thecoord2)).
") CrossCross;
		void CrossCross(const gp_XYZ & theCoord1, const gp_XYZ & theCoord2);

		/****************** CrossCrossed ******************/
		/**** md5 signature: b6fedc8f26bc509c64afb9ab2d9d1516 ****/
		%feature("compactdefaultargs") CrossCrossed;
		%feature("autodoc", "
Parameters
----------
theCoord1: gp_XYZ
theCoord2: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
Triple vector product computes new = <self>.cross(thecoord1.cross(thecoord2)).
") CrossCrossed;
		gp_XYZ CrossCrossed(const gp_XYZ & theCoord1, const gp_XYZ & theCoord2);

		/****************** CrossMagnitude ******************/
		/**** md5 signature: 31b6eb03cfba937fc1d4e26350b6b090 ****/
		%feature("compactdefaultargs") CrossMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XYZ

Return
-------
float

Description
-----------
Computes the magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||.
") CrossMagnitude;
		Standard_Real CrossMagnitude(const gp_XYZ & theRight);

		/****************** CrossSquareMagnitude ******************/
		/**** md5 signature: aab1ebd15cd47598cea6f9b2c8f8b206 ****/
		%feature("compactdefaultargs") CrossSquareMagnitude;
		%feature("autodoc", "
Parameters
----------
theRight: gp_XYZ

Return
-------
float

Description
-----------
Computes the square magnitude of the cross product between <self> and theright. returns || <self> ^ theright ||**2.
") CrossSquareMagnitude;
		Standard_Real CrossSquareMagnitude(const gp_XYZ & theRight);

		/****************** Crossed ******************/
		/**** md5 signature: 337f46c4918caa6ecc77fcbe1deffb1b ****/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.x() = <self>.y() * theother.z() - <self>.z() * theother.y() new.y() = <self>.z() * theother.x() - <self>.x() * theother.z() new.z() = <self>.x() * theother.y() - <self>.y() * theother.x() @endcode.
") Crossed;
		gp_XYZ Crossed(const gp_XYZ & theOther);

		/****************** Divide ******************/
		/**** md5 signature: 6b91e208468c68ac43147a4e287acb7d ****/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
Divides <self> by a real.
") Divide;
		void Divide(const Standard_Real theScalar);

		/****************** Divided ******************/
		/**** md5 signature: 22df661a2356ac58fbb0528184d4737c ****/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XYZ

Description
-----------
Divides <self> by a real.
") Divided;
		gp_XYZ Divided(const Standard_Real theScalar);

		/****************** Dot ******************/
		/**** md5 signature: 9d65717fd3f3f19504873fe7ad614fcd ****/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
float

Description
-----------
Computes the scalar product between <self> and theother.
") Dot;
		Standard_Real Dot(const gp_XYZ & theOther);

		/****************** DotCross ******************/
		/**** md5 signature: a54eeec0a1cc11020b7b2b4d29ee4646 ****/
		%feature("compactdefaultargs") DotCross;
		%feature("autodoc", "
Parameters
----------
theCoord1: gp_XYZ
theCoord2: gp_XYZ

Return
-------
float

Description
-----------
Computes the triple scalar product.
") DotCross;
		Standard_Real DotCross(const gp_XYZ & theCoord1, const gp_XYZ & theCoord2);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****************** GetData ******************/
		/**** md5 signature: e47b5b0ea190980bdbd67208fc1d8ad0 ****/
		%feature("compactdefaultargs") GetData;
		%feature("autodoc", "Return
-------
float *

Description
-----------
Returns a const ptr to coordinates location. is useful for algorithms, but does not perform any checks!.
") GetData;
		const Standard_Real * GetData();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****************** IsEqual ******************/
		/**** md5 signature: f95d99d49ea9ee51a45d7b7802e91efd ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ
theTolerance: float

Return
-------
bool

Description
-----------
Returns true if he coordinates of this xyz object are equal to the respective coordinates other, within the specified tolerance thetolerance. i.e.: abs(<self>.x() - theother.x()) <= thetolerance and abs(<self>.y() - theother.y()) <= thetolerance and abs(<self>.z() - theother.z()) <= thetolerance.
") IsEqual;
		Standard_Boolean IsEqual(const gp_XYZ & theOther, const Standard_Real theTolerance);

		/****************** Modulus ******************/
		/**** md5 signature: 2699d32c474eedddd33fd283c9bedcfe ****/
		%feature("compactdefaultargs") Modulus;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes sqrt (x*x + y*y + z*z) where x, y and z are the three coordinates of this xyz object.
") Modulus;
		Standard_Real Modulus();

		/****************** Multiplied ******************/
		/**** md5 signature: 4f02f17d09449e7bc0d36aff9a280f7d ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XYZ

Description
-----------
@code new.x() = <self>.x() * thescalar; new.y() = <self>.y() * thescalar; new.z() = <self>.z() * thescalar; @endcode.
") Multiplied;
		gp_XYZ Multiplied(const Standard_Real theScalar);

		/****************** Multiplied ******************/
		/**** md5 signature: 7ae2dfc6b2f7b6d173a9b3da78431f1a ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.x() = <self>.x() * theother.x(); new.y() = <self>.y() * theother.y(); new.z() = <self>.z() * theother.z(); @endcode.
") Multiplied;
		gp_XYZ Multiplied(const gp_XYZ & theOther);

		/****************** Multiplied ******************/
		/**** md5 signature: dcb20c1b76c36e98a12de7659a48c3c4 ****/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
gp_XYZ

Description
-----------
New = thematrix * <self>.
") Multiplied;
		gp_XYZ Multiplied(const gp_Mat & theMatrix);

		/****************** Multiply ******************/
		/**** md5 signature: 94c083012ff2f3e798eccef399e23708 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
None

Description
-----------
@code <self>.x() = <self>.x() * thescalar; <self>.y() = <self>.y() * thescalar; <self>.z() = <self>.z() * thescalar; @endcode.
") Multiply;
		void Multiply(const Standard_Real theScalar);

		/****************** Multiply ******************/
		/**** md5 signature: 1f54f3d3d1c9a3d0e021cf8a336ae046 ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.x() = <self>.x() * theother.x(); <self>.y() = <self>.y() * theother.y(); <self>.z() = <self>.z() * theother.z(); @endcode.
") Multiply;
		void Multiply(const gp_XYZ & theOther);

		/****************** Multiply ******************/
		/**** md5 signature: 43e66ac0fad88b413425b094e5c004ce ****/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
None

Description
-----------
<self> = thematrix * <self>.
") Multiply;
		void Multiply(const gp_Mat & theMatrix);

		/****************** Normalize ******************/
		/**** md5 signature: 587346cf1e1c12fdf674aedc915ccd95 ****/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.x() = <self>.x()/ <self>.modulus() <self>.y() = <self>.y()/ <self>.modulus() <self>.z() = <self>.z()/ <self>.modulus() @endcode raised if <self>.modulus() <= resolution from gp.
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		/**** md5 signature: 4831d449729805d4ef6171099bb6e815 ****/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
@code new.x() = <self>.x()/ <self>.modulus() new.y() = <self>.y()/ <self>.modulus() new.z() = <self>.z()/ <self>.modulus() @endcode raised if <self>.modulus() <= resolution from gp.
") Normalized;
		gp_XYZ Normalized();

		/****************** Reverse ******************/
		/**** md5 signature: 51c7e0d05769dec0ec2bb70e4d25e48d ****/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
@code <self>.x() = -<self>.x() <self>.y() = -<self>.y() <self>.z() = -<self>.z() @endcode.
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		/**** md5 signature: f0776d123b6467ad09f21416658daa62 ****/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
@code new.x() = -<self>.x() new.y() = -<self>.y() new.z() = -<self>.z() @endcode.
") Reversed;
		gp_XYZ Reversed();

		/****************** SetCoord ******************/
		/**** md5 signature: c4b478464992cf7989de7989abd51418 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
None

Description
-----------
For this xyz object, assigns the values thex, they and thez to its three coordinates.
") SetCoord;
		void SetCoord(const Standard_Real theX, const Standard_Real theY, const Standard_Real theZ);

		/****************** SetCoord ******************/
		/**** md5 signature: 52cef977af7789ed4ebe28e0285a09a0 ****/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theXi: float

Return
-------
None

Description
-----------
Modifies the coordinate of range theindex theindex = 1 => x is modified theindex = 2 => y is modified theindex = 3 => z is modified raises outofrange if theindex != {1, 2, 3}.
") SetCoord;
		void SetCoord(const Standard_Integer theIndex, const Standard_Real theXi);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 187eaf8a0109eb0d1bf1b2607b9db42c ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXYZ1: gp_XYZ
theA2: float
theXYZ2: gp_XYZ
theA3: float
theXYZ3: gp_XYZ
theXYZ4: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code thea1 * thexyz1 + thea2 * thexyz2 + thea3 * thexyz3 + thexyz4 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XYZ & theXYZ1, const Standard_Real theA2, const gp_XYZ & theXYZ2, const Standard_Real theA3, const gp_XYZ & theXYZ3, const gp_XYZ & theXYZ4);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 5505dee7539423f37f2420e473a2b697 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXYZ1: gp_XYZ
theA2: float
theXYZ2: gp_XYZ
theA3: float
theXYZ3: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code thea1 * thexyz1 + thea2 * thexyz2 + thea3 * thexyz3 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XYZ & theXYZ1, const Standard_Real theA2, const gp_XYZ & theXYZ2, const Standard_Real theA3, const gp_XYZ & theXYZ3);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 0d2cb15a10177b6d17bb7f330090698c ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXYZ1: gp_XYZ
theA2: float
theXYZ2: gp_XYZ
theXYZ3: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code thea1 * thexyz1 + thea2 * thexyz2 + thexyz3 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XYZ & theXYZ1, const Standard_Real theA2, const gp_XYZ & theXYZ2, const gp_XYZ & theXYZ3);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 31093560c7c246c91928850f7e63307e ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXYZ1: gp_XYZ
theA2: float
theXYZ2: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code thea1 * thexyz1 + thea2 * thexyz2 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XYZ & theXYZ1, const Standard_Real theA2, const gp_XYZ & theXYZ2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 2553d068b4732f6c2e9f3dadc95f1017 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theA1: float
theXYZ1: gp_XYZ
theXYZ2: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code thea1 * thexyz1 + thexyz2 @endcode.
") SetLinearForm;
		void SetLinearForm(const Standard_Real theA1, const gp_XYZ & theXYZ1, const gp_XYZ & theXYZ2);

		/****************** SetLinearForm ******************/
		/**** md5 signature: 840cca334d03ce271dc214917d8743a7 ****/
		%feature("compactdefaultargs") SetLinearForm;
		%feature("autodoc", "
Parameters
----------
theXYZ1: gp_XYZ
theXYZ2: gp_XYZ

Return
-------
None

Description
-----------
<self> is set to the following linear form: @code thexyz1 + thexyz2 @endcode.
") SetLinearForm;
		void SetLinearForm(const gp_XYZ & theXYZ1, const gp_XYZ & theXYZ2);

		/****************** SetX ******************/
		/**** md5 signature: 1bf65ee31f0303d20dd96cc6dbcfa44e ****/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "
Parameters
----------
theX: float

Return
-------
None

Description
-----------
Assigns the given value to the x coordinate.
") SetX;
		void SetX(const Standard_Real theX);

		/****************** SetY ******************/
		/**** md5 signature: 4d69a9fe7ed8a7d182afbae632001bd2 ****/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "
Parameters
----------
theY: float

Return
-------
None

Description
-----------
Assigns the given value to the y coordinate.
") SetY;
		void SetY(const Standard_Real theY);

		/****************** SetZ ******************/
		/**** md5 signature: 50f9696665e382f6944bd96e35b0a063 ****/
		%feature("compactdefaultargs") SetZ;
		%feature("autodoc", "
Parameters
----------
theZ: float

Return
-------
None

Description
-----------
Assigns the given value to the z coordinate.
") SetZ;
		void SetZ(const Standard_Real theZ);

		/****************** SquareModulus ******************/
		/**** md5 signature: 355ed50ec36f0efd762161071f1ceeb0 ****/
		%feature("compactdefaultargs") SquareModulus;
		%feature("autodoc", "Return
-------
float

Description
-----------
Computes x*x + y*y + z*z where x, y and z are the three coordinates of this xyz object.
") SquareModulus;
		Standard_Real SquareModulus();

		/****************** Subtract ******************/
		/**** md5 signature: a6f9eb29be8643b68c4e25dcc30cda9e ****/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
None

Description
-----------
@code <self>.x() = <self>.x() - theother.x() <self>.y() = <self>.y() - theother.y() <self>.z() = <self>.z() - theother.z() @endcode.
") Subtract;
		void Subtract(const gp_XYZ & theOther);

		/****************** Subtracted ******************/
		/**** md5 signature: 47a2e916ad56b8a5128e2af6ce944547 ****/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
@code new.x() = <self>.x() - theother.x() new.y() = <self>.y() - theother.y() new.z() = <self>.z() - theother.z() @endcode.
") Subtracted;
		gp_XYZ Subtracted(const gp_XYZ & theOther);

		/****************** X ******************/
		/**** md5 signature: 05c2850f49d76f9d0f9da9e2fdb99a8b ****/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the x coordinate.
") X;
		Standard_Real X();

		/****************** Y ******************/
		/**** md5 signature: 0142f6b6b08f82a328de2fb00d13afbf ****/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the y coordinate.
") Y;
		Standard_Real Y();

		/****************** Z ******************/
		/**** md5 signature: 786e228d2eeaf64f99dd51d3ab338f77 ****/
		%feature("compactdefaultargs") Z;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the z coordinate.
") Z;
		Standard_Real Z();

		/****************** operator * ******************/
		/**** md5 signature: 09bbcb3a3a80da33fc086afa08d18c86 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
float

Description
-----------
No available documentation.
") operator *;
		Standard_Real operator *(const gp_XYZ & theOther);

		/****************** operator * ******************/
		/**** md5 signature: d957e68a4dc2daa2ad5ed9aee2d7e106 ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator *;
		gp_XYZ operator *(const Standard_Real theScalar);

		/****************** operator * ******************/
		/**** md5 signature: d07f95a87eb281c3caf764b6ae47ed5d ****/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "
Parameters
----------
theMatrix: gp_Mat

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator *;
		gp_XYZ operator *(const gp_Mat & theMatrix);


%extend{
    void __imul_wrapper__(const Standard_Real other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const gp_XYZ other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}

%extend{
    void __imul_wrapper__(const gp_Mat other) {
    *self *= other;
    }
}
%pythoncode {
def __imul__(self, right):
    self.__imul_wrapper__(right)
    return self
}
		/****************** operator + ******************/
		/**** md5 signature: 8924adfbe261216bc106729e6a25edff ****/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator +;
		gp_XYZ operator +(const gp_XYZ & theOther);


%extend{
    void __iadd_wrapper__(const gp_XYZ other) {
    *self += other;
    }
}
%pythoncode {
def __iadd__(self, right):
    self.__iadd_wrapper__(right)
    return self
}
		/****************** operator - ******************/
		/**** md5 signature: 307e5e28b06e165c7bed9d6fa5019e70 ****/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "
Parameters
----------
theOther: gp_XYZ

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator -;
		gp_XYZ operator -(const gp_XYZ & theOther);


%extend{
    void __isub_wrapper__(const gp_XYZ other) {
    *self -= other;
    }
}
%pythoncode {
def __isub__(self, right):
    self.__isub_wrapper__(right)
    return self
}
		/****************** operator / ******************/
		/**** md5 signature: aab1675bb3218dd6795d705ce7dac9af ****/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "
Parameters
----------
theScalar: float

Return
-------
gp_XYZ

Description
-----------
No available documentation.
") operator /;
		gp_XYZ operator /(const Standard_Real theScalar);


%extend{
    void __itruediv_wrapper__(const Standard_Real other) {
    *self /= other;
    }
}
%pythoncode {
def __itruediv__(self, right):
    self.__itruediv_wrapper__(right)
    return self
}
};



%extend gp_XYZ {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend gp_XYZ {
%pythoncode {
    def __setstate__(self, state):
        inst = gp_XYZ()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of gp_XYZ')
    }
};
%extend gp_XYZ {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class hash<gp_Pnt> *
*********************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def gp_DX(*args):
	return gp.DX(*args)

@deprecated
def gp_DX2d(*args):
	return gp.DX2d(*args)

@deprecated
def gp_DY(*args):
	return gp.DY(*args)

@deprecated
def gp_DY2d(*args):
	return gp.DY2d(*args)

@deprecated
def gp_DZ(*args):
	return gp.DZ(*args)

@deprecated
def gp_OX(*args):
	return gp.OX(*args)

@deprecated
def gp_OX2d(*args):
	return gp.OX2d(*args)

@deprecated
def gp_OY(*args):
	return gp.OY(*args)

@deprecated
def gp_OY2d(*args):
	return gp.OY2d(*args)

@deprecated
def gp_OZ(*args):
	return gp.OZ(*args)

@deprecated
def gp_Origin(*args):
	return gp.Origin(*args)

@deprecated
def gp_Origin2d(*args):
	return gp.Origin2d(*args)

@deprecated
def gp_Resolution(*args):
	return gp.Resolution(*args)

@deprecated
def gp_XOY(*args):
	return gp.XOY(*args)

@deprecated
def gp_YOZ(*args):
	return gp.YOZ(*args)

@deprecated
def gp_ZOX(*args):
	return gp.ZOX(*args)

@deprecated
def gp_QuaternionNLerp_Interpolate(*args):
	return gp_QuaternionNLerp.Interpolate(*args)

@deprecated
def gp_QuaternionSLerp_Interpolate(*args):
	return gp_QuaternionSLerp.Interpolate(*args)

}
