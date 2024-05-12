/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define TNAMINGDOCSTRING
"TNaming module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_tnaming.html"
%enddef
%module (package="OCC.Core", docstring=TNAMINGDOCSTRING) TNaming


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


%{
#include<TNaming_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<TopTools_module.hxx>
#include<TopLoc_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TopAbs_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import TopTools.i
%import TopLoc.i
%import TopoDS.i
%import gp.i
%import TColStd.i
%import TopAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TNaming_Evolution {
	TNaming_PRIMITIVE = 0,
	TNaming_GENERATED = 1,
	TNaming_MODIFY = 2,
	TNaming_DELETE = 3,
	TNaming_REPLACE = 4,
	TNaming_SELECTED = 5,
};

enum TNaming_NameType {
	TNaming_UNKNOWN = 0,
	TNaming_IDENTITY = 1,
	TNaming_MODIFUNTIL = 2,
	TNaming_GENERATION = 3,
	TNaming_INTERSECTION = 4,
	TNaming_UNION = 5,
	TNaming_SUBSTRACTION = 6,
	TNaming_CONSTSHAPE = 7,
	TNaming_FILTERBYNEIGHBOURGS = 8,
	TNaming_ORIENTATION = 9,
	TNaming_WIREIN = 10,
	TNaming_SHELLIN = 11,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TNaming_Evolution(IntEnum):
	TNaming_PRIMITIVE = 0
	TNaming_GENERATED = 1
	TNaming_MODIFY = 2
	TNaming_DELETE = 3
	TNaming_REPLACE = 4
	TNaming_SELECTED = 5
TNaming_PRIMITIVE = TNaming_Evolution.TNaming_PRIMITIVE
TNaming_GENERATED = TNaming_Evolution.TNaming_GENERATED
TNaming_MODIFY = TNaming_Evolution.TNaming_MODIFY
TNaming_DELETE = TNaming_Evolution.TNaming_DELETE
TNaming_REPLACE = TNaming_Evolution.TNaming_REPLACE
TNaming_SELECTED = TNaming_Evolution.TNaming_SELECTED

class TNaming_NameType(IntEnum):
	TNaming_UNKNOWN = 0
	TNaming_IDENTITY = 1
	TNaming_MODIFUNTIL = 2
	TNaming_GENERATION = 3
	TNaming_INTERSECTION = 4
	TNaming_UNION = 5
	TNaming_SUBSTRACTION = 6
	TNaming_CONSTSHAPE = 7
	TNaming_FILTERBYNEIGHBOURGS = 8
	TNaming_ORIENTATION = 9
	TNaming_WIREIN = 10
	TNaming_SHELLIN = 11
TNaming_UNKNOWN = TNaming_NameType.TNaming_UNKNOWN
TNaming_IDENTITY = TNaming_NameType.TNaming_IDENTITY
TNaming_MODIFUNTIL = TNaming_NameType.TNaming_MODIFUNTIL
TNaming_GENERATION = TNaming_NameType.TNaming_GENERATION
TNaming_INTERSECTION = TNaming_NameType.TNaming_INTERSECTION
TNaming_UNION = TNaming_NameType.TNaming_UNION
TNaming_SUBSTRACTION = TNaming_NameType.TNaming_SUBSTRACTION
TNaming_CONSTSHAPE = TNaming_NameType.TNaming_CONSTSHAPE
TNaming_FILTERBYNEIGHBOURGS = TNaming_NameType.TNaming_FILTERBYNEIGHBOURGS
TNaming_ORIENTATION = TNaming_NameType.TNaming_ORIENTATION
TNaming_WIREIN = TNaming_NameType.TNaming_WIREIN
TNaming_SHELLIN = TNaming_NameType.TNaming_SHELLIN
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TNaming_DeltaOnModification)
%wrap_handle(TNaming_DeltaOnRemoval)
%wrap_handle(TNaming_NamedShape)
%wrap_handle(TNaming_Naming)
%wrap_handle(TNaming_TranslateTool)
%wrap_handle(TNaming_UsedShapes)
/* end handles declaration */

/* templates */
%template(TNaming_DataMapOfShapeMapOfShape) NCollection_DataMap<TopoDS_Shape,TNaming_MapOfShape>;
%template(TNaming_DataMapOfShapePtrRefShape) NCollection_DataMap<TopoDS_Shape,TNaming_PtrRefShape,TopTools_ShapeMapHasher>;
%template(TNaming_DataMapOfShapeShapesSet) NCollection_DataMap<TopoDS_Shape,TNaming_ShapesSet,TopTools_ShapeMapHasher>;
%template(TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape) NCollection_TListIterator<TopTools_IndexedDataMapOfShapeListOfShape>;
%template(TNaming_ListIteratorOfListOfMapOfShape) NCollection_TListIterator<TopTools_MapOfShape>;
%template(TNaming_ListIteratorOfListOfNamedShape) NCollection_TListIterator<opencascade::handle<TNaming_NamedShape>>;
%template(TNaming_ListOfIndexedDataMapOfShapeListOfShape) NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape>;

%extend NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TNaming_ListOfMapOfShape) NCollection_List<TopTools_MapOfShape>;

%extend NCollection_List<TopTools_MapOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TNaming_ListOfNamedShape) NCollection_List<opencascade::handle<TNaming_NamedShape>>;

%extend NCollection_List<opencascade::handle<TNaming_NamedShape>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TNaming_MapOfNamedShape) NCollection_Map<opencascade::handle<TNaming_NamedShape>>;
%template(TNaming_MapOfShape) NCollection_Map<TopoDS_Shape>;
/* end templates declaration */

/* typedefs */
typedef TNaming_DataMapOfShapeMapOfShape::Iterator TNaming_DataMapIteratorOfDataMapOfShapeMapOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_PtrRefShape, TopTools_ShapeMapHasher>::Iterator TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_ShapesSet, TopTools_ShapeMapHasher>::Iterator TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_MapOfShape> TNaming_DataMapOfShapeMapOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_PtrRefShape, TopTools_ShapeMapHasher> TNaming_DataMapOfShapePtrRefShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_ShapesSet, TopTools_ShapeMapHasher> TNaming_DataMapOfShapeShapesSet;
typedef NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape>::Iterator TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
typedef NCollection_List<TopTools_MapOfShape>::Iterator TNaming_ListIteratorOfListOfMapOfShape;
typedef NCollection_List<opencascade::handle<TNaming_NamedShape>>::Iterator TNaming_ListIteratorOfListOfNamedShape;
typedef NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape> TNaming_ListOfIndexedDataMapOfShapeListOfShape;
typedef NCollection_List<TopTools_MapOfShape> TNaming_ListOfMapOfShape;
typedef NCollection_List<opencascade::handle<TNaming_NamedShape>> TNaming_ListOfNamedShape;
typedef NCollection_Map<opencascade::handle<TNaming_NamedShape>>::Iterator TNaming_MapIteratorOfMapOfNamedShape;
typedef TNaming_MapOfShape::Iterator TNaming_MapIteratorOfMapOfShape;
typedef NCollection_Map<opencascade::handle<TNaming_NamedShape>> TNaming_MapOfNamedShape;
typedef NCollection_Map<TopoDS_Shape> TNaming_MapOfShape;
typedef TNaming_NamedShape * TNaming_PtrAttribute;
typedef TNaming_Node * TNaming_PtrNode;
typedef TNaming_RefShape * TNaming_PtrRefShape;
/* end typedefs declaration */

/****************
* class TNaming *
****************/
%rename(tnaming) TNaming;
class TNaming {
	public:
		/****************** ChangeShapes ******************/
		/**** md5 signature: 35b83a9835df68d47b84e7b0a4cc67d1 ****/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
M: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Remplace les shapes du label et des sous-labels par des copies.
") ChangeShapes;
		static void ChangeShapes(const TDF_Label & label, TopTools_DataMapOfShapeShape & M);

		/****************** Displace ******************/
		/**** md5 signature: f1e75faa1cad00c7f25ecf48dd5954ba ****/
		%feature("compactdefaultargs") Displace;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
aLocation: TopLoc_Location
WithOld: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Application de la location sur les shapes du label et de ses sous labels.
") Displace;
		static void Displace(const TDF_Label & label, const TopLoc_Location & aLocation, const Standard_Boolean WithOld = Standard_True);

		/****************** FindUniqueContext ******************/
		/**** md5 signature: a840eb0c1506c6b14b7841bb92bb32c8 ****/
		%feature("compactdefaultargs") FindUniqueContext;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Context: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Find unique context of shape <s>.
") FindUniqueContext;
		static TopoDS_Shape FindUniqueContext(const TopoDS_Shape & S, const TopoDS_Shape & Context);

		/****************** FindUniqueContextSet ******************/
		/**** md5 signature: f0bb2cb6f08fe13f1ef17596577f529e ****/
		%feature("compactdefaultargs") FindUniqueContextSet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Context: TopoDS_Shape
Arr: TopTools_HArray1OfShape

Return
-------
TopoDS_Shape

Description
-----------
Find unique context of shape <s>,which is pure concatenation of atomic shapes (compound). the result is concatenation of single contexts.
") FindUniqueContextSet;
		static TopoDS_Shape FindUniqueContextSet(const TopoDS_Shape & S, const TopoDS_Shape & Context, opencascade::handle<TopTools_HArray1OfShape> & Arr);

		/****************** IDList ******************/
		/**** md5 signature: 97de0b35f4f6abc04a631c65d32bacc4 ****/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "
Parameters
----------
anIDList: TDF_IDList

Return
-------
None

Description
-----------
Appends to <anidlist> the list of the attributes ids of this package. caution: <anidlist> is not cleared before use.
") IDList;
		static void IDList(TDF_IDList & anIDList);

		/****************** MakeShape ******************/
		/**** md5 signature: 630d783504c360aaf8c5e4c4900911e5 ****/
		%feature("compactdefaultargs") MakeShape;
		%feature("autodoc", "
Parameters
----------
MS: TopTools_MapOfShape

Return
-------
TopoDS_Shape

Description
-----------
Builds shape from map content.
") MakeShape;
		static TopoDS_Shape MakeShape(const TopTools_MapOfShape & MS);

		/****************** OuterShell ******************/
		/**** md5 signature: 7b4f5582736299aaaff85491e430e183 ****/
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "
Parameters
----------
theSolid: TopoDS_Solid
theShell: TopoDS_Shell

Return
-------
bool

Description
-----------
Returns true if outer shell is found and the found shell in <theshell>. print of tnaming enumeration =============================.
") OuterShell;
		static Standard_Boolean OuterShell(const TopoDS_Solid & theSolid, TopoDS_Shell & theShell);

		/****************** OuterWire ******************/
		/**** md5 signature: dd33967d99fbf8929938e36ba3c08e55 ****/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theWire: TopoDS_Wire

Return
-------
bool

Description
-----------
Returns true if outer wire is found and the found wire in <thewire>.
") OuterWire;
		static Standard_Boolean OuterWire(const TopoDS_Face & theFace, TopoDS_Wire & theWire);

		/****************** Print ******************/
		/**** md5 signature: 2b639b8df3fe00401374dd95e415224e ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
EVOL: TNaming_Evolution

Return
-------
S: Standard_OStream

Description
-----------
Prints the evolution <evol> as a string on the stream <s> and returns <s>.
") Print;
		static Standard_OStream & Print(const TNaming_Evolution EVOL, std::ostream &OutValue);

		/****************** Print ******************/
		/**** md5 signature: 0086f15e63801a19d591d96a9d20bb2a ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
NAME: TNaming_NameType

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of name type <name> as a string on the stream <s> and returns <s>.
") Print;
		static Standard_OStream & Print(const TNaming_NameType NAME, std::ostream &OutValue);

		/****************** Print ******************/
		/**** md5 signature: acadfcdd30dbbb74b400e87246c92ac0 ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
ACCESS: TDF_Label

Return
-------
S: Standard_OStream

Description
-----------
Prints the content of usedshapes private attribute as a string table on the stream <s> and returns <s>.
") Print;
		static Standard_OStream & Print(const TDF_Label & ACCESS, std::ostream &OutValue);

		/****************** Replicate ******************/
		/**** md5 signature: b05536a641bcb5721eea10c9d85c5058 ****/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
T: gp_Trsf
L: TDF_Label

Return
-------
None

Description
-----------
Replicates the named shape with the transformation <t> on the label <l> (and sub-labels if necessary) (tnaming_generated is set).
") Replicate;
		static void Replicate(const opencascade::handle<TNaming_NamedShape> & NS, const gp_Trsf & T, const TDF_Label & L);

		/****************** Replicate ******************/
		/**** md5 signature: be82fd2c07d5a19a591067e18daf4896 ****/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "
Parameters
----------
SH: TopoDS_Shape
T: gp_Trsf
L: TDF_Label

Return
-------
None

Description
-----------
Replicates the shape with the transformation <t> on the label <l> (and sub-labels if necessary) (tnaming_generated is set).
") Replicate;
		static void Replicate(const TopoDS_Shape & SH, const gp_Trsf & T, const TDF_Label & L);

		/****************** Substitute ******************/
		/**** md5 signature: 7442a06309ab6a50aecfb1cf15c3cc98 ****/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "
Parameters
----------
labelsource: TDF_Label
labelcible: TDF_Label
mapOldNew: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Subtituter les shapes sur les structures de source vers cible.
") Substitute;
		static void Substitute(const TDF_Label & labelsource, const TDF_Label & labelcible, TopTools_DataMapOfShapeShape & mapOldNew);

		/****************** SubstituteSShape ******************/
		/**** md5 signature: da4f9bfab8e604d3c3824a7968ba3ba0 ****/
		%feature("compactdefaultargs") SubstituteSShape;
		%feature("autodoc", "
Parameters
----------
accesslabel: TDF_Label
From: TopoDS_Shape
To: TopoDS_Shape

Return
-------
bool

Description
-----------
Substitutes shape in source structure.
") SubstituteSShape;
		static Standard_Boolean SubstituteSShape(const TDF_Label & accesslabel, const TopoDS_Shape & From, TopoDS_Shape & To);

		/****************** Transform ******************/
		/**** md5 signature: 974cbac4440c78b11585fb3e507cfca5 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
aTransformation: gp_Trsf

Return
-------
None

Description
-----------
Application de la transformation sur les shapes du label et de ses sous labels. warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <label>.
") Transform;
		static void Transform(const TDF_Label & label, const gp_Trsf & aTransformation);

		/****************** Update ******************/
		/**** md5 signature: 69bc78ea7b332ad3a707e4597841ba51 ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
mapOldNew: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Mise a jour des shapes du label et de ses fils en tenant compte des substitutions decrite par mapoldnew. //! warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <label>.
") Update;
		static void Update(const TDF_Label & label, TopTools_DataMapOfShapeShape & mapOldNew);

};


%extend TNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TNaming_Builder *
************************/
class TNaming_Builder {
	public:
		/****************** TNaming_Builder ******************/
		/**** md5 signature: e527eb08a85542f6ff17d0c3b731b83f ****/
		%feature("compactdefaultargs") TNaming_Builder;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Create an builder. warning: before addition copies the current value, and clear.
") TNaming_Builder;
		 TNaming_Builder(const TDF_Label & aLabel);

		/****************** Delete ******************/
		/**** md5 signature: e7d6c931d67eae5017e0e0a88560cecc ****/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "
Parameters
----------
oldShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape oldshape which was deleted from the current label. as an example, consider the case of a face removed by a boolean operation.
") Delete;
		void Delete(const TopoDS_Shape & oldShape);

		/****************** Generated ******************/
		/**** md5 signature: f09ef1a786b6dd431efdb86a1146dd88 ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
newShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape newshape which was generated during a topological construction. as an example, consider the case of a face generated in construction of a box.
") Generated;
		void Generated(const TopoDS_Shape & newShape);

		/****************** Generated ******************/
		/**** md5 signature: c7e28e797e6177c9154de8e9abf4e36c ****/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
oldShape: TopoDS_Shape
newShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape newshape which was generated from the shape oldshape during a topological construction. as an example, consider the case of a face generated from an edge in construction of a prism.
") Generated;
		void Generated(const TopoDS_Shape & oldShape, const TopoDS_Shape & newShape);

		/****************** Modify ******************/
		/**** md5 signature: 0c3df32d18f4244119459dc202463488 ****/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "
Parameters
----------
oldShape: TopoDS_Shape
newShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape newshape which is a modification of the shape oldshape. as an example, consider the case of a face split or merged in a boolean operation.
") Modify;
		void Modify(const TopoDS_Shape & oldShape, const TopoDS_Shape & newShape);

		/****************** NamedShape ******************/
		/**** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ****/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the namedshape which has been built or is under construction.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Select ******************/
		/**** md5 signature: f0fa18a8affb78f4f35d9d8e97c14fc8 ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
inShape: TopoDS_Shape

Return
-------
None

Description
-----------
Add a shape to the current label , this shape is unmodified. used for example to define a set of shapes under a label.
") Select;
		void Select(const TopoDS_Shape & aShape, const TopoDS_Shape & inShape);

};


%extend TNaming_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_CopyShape *
**************************/
class TNaming_CopyShape {
	public:
		/****************** CopyTool ******************/
		/**** md5 signature: 68dbabff764be4482b8310e46483bc53 ****/
		%feature("compactdefaultargs") CopyTool;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aMap: TColStd_IndexedDataMapOfTransientTransient
aResult: TopoDS_Shape

Return
-------
None

Description
-----------
Makes copy a set of shape(s), using the amap.
") CopyTool;
		static void CopyTool(const TopoDS_Shape & aShape, TColStd_IndexedDataMapOfTransientTransient & aMap, TopoDS_Shape & aResult);

		/****************** Translate ******************/
		/**** md5 signature: 979088cf76411c3c287d02989b1b7408 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aMap: TColStd_IndexedDataMapOfTransientTransient
aResult: TopoDS_Shape
TrTool: TNaming_TranslateTool

Return
-------
None

Description
-----------
Translates a transient shape(s) to transient.
") Translate;
		static void Translate(const TopoDS_Shape & aShape, TColStd_IndexedDataMapOfTransientTransient & aMap, TopoDS_Shape & aResult, const opencascade::handle<TNaming_TranslateTool> & TrTool);

		/****************** Translate ******************/
		/**** md5 signature: 1e92f022ff2e32420dfe6876b46407e3 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location
aMap: TColStd_IndexedDataMapOfTransientTransient

Return
-------
TopLoc_Location

Description
-----------
Translates a topological location to an other top. location.
") Translate;
		static TopLoc_Location Translate(const TopLoc_Location & L, TColStd_IndexedDataMapOfTransientTransient & aMap);

};


%extend TNaming_CopyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TNaming_DeltaOnModification *
************************************/
class TNaming_DeltaOnModification : public TDF_DeltaOnModification {
	public:
		/****************** TNaming_DeltaOnModification ******************/
		/**** md5 signature: c6d49c1244394b1dd9f9561df62966be ****/
		%feature("compactdefaultargs") TNaming_DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
Initializes a tdf_deltaonmodification.
") TNaming_DeltaOnModification;
		 TNaming_DeltaOnModification(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** Apply ******************/
		/**** md5 signature: ddf5e396da23832dcae51d48e78a347f ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		virtual void Apply();

};


%make_alias(TNaming_DeltaOnModification)

%extend TNaming_DeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TNaming_DeltaOnRemoval *
*******************************/
class TNaming_DeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		/****************** TNaming_DeltaOnRemoval ******************/
		/**** md5 signature: b4081e7f409b52375f3658210398109d ****/
		%feature("compactdefaultargs") TNaming_DeltaOnRemoval;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
Initializes a tdf_deltaonmodification.
") TNaming_DeltaOnRemoval;
		 TNaming_DeltaOnRemoval(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** Apply ******************/
		/**** md5 signature: ddf5e396da23832dcae51d48e78a347f ****/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		virtual void Apply();

};


%make_alias(TNaming_DeltaOnRemoval)

%extend TNaming_DeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_Identifier *
***************************/
class TNaming_Identifier {
	public:
		/****************** TNaming_Identifier ******************/
		/**** md5 signature: 62d0561d44133a83f74adfeb0d3107af ****/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "
Parameters
----------
Lab: TDF_Label
S: TopoDS_Shape
Context: TopoDS_Shape
Geom: bool

Return
-------
None

Description
-----------
No available documentation.
") TNaming_Identifier;
		 TNaming_Identifier(const TDF_Label & Lab, const TopoDS_Shape & S, const TopoDS_Shape & Context, const Standard_Boolean Geom);

		/****************** TNaming_Identifier ******************/
		/**** md5 signature: 04356eb4451661be5a0af4cea18e81dc ****/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "
Parameters
----------
Lab: TDF_Label
S: TopoDS_Shape
ContextNS: TNaming_NamedShape
Geom: bool

Return
-------
None

Description
-----------
No available documentation.
") TNaming_Identifier;
		 TNaming_Identifier(const TDF_Label & Lab, const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & ContextNS, const Standard_Boolean Geom);

		/****************** AncestorIdentification ******************/
		/**** md5 signature: 2b81eef5c1e7248648501fe054976064 ****/
		%feature("compactdefaultargs") AncestorIdentification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
Context: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AncestorIdentification;
		void AncestorIdentification(TNaming_Localizer & Localizer, const TopoDS_Shape & Context);

		/****************** ArgIsFeature ******************/
		/**** md5 signature: f6d4bd72536d6a3155180a2e5fe251af ****/
		%feature("compactdefaultargs") ArgIsFeature;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ArgIsFeature;
		Standard_Boolean ArgIsFeature();

		/****************** Feature ******************/
		/**** md5 signature: 5e47ba9d75b024609702b0386c463cc2 ****/
		%feature("compactdefaultargs") Feature;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") Feature;
		opencascade::handle<TNaming_NamedShape> Feature();

		/****************** FeatureArg ******************/
		/**** md5 signature: 75e9ac9e2a82e32346d3b72cb61aa353 ****/
		%feature("compactdefaultargs") FeatureArg;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") FeatureArg;
		opencascade::handle<TNaming_NamedShape> FeatureArg();

		/****************** GeneratedIdentification ******************/
		/**** md5 signature: 792d53fcca5597d2a6dda3e28d8d1167 ****/
		%feature("compactdefaultargs") GeneratedIdentification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") GeneratedIdentification;
		void GeneratedIdentification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** Identification ******************/
		/**** md5 signature: bffb3f583c54aac29a9d2c2e48c124e1 ****/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") Identification;
		void Identification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** InitArgs ******************/
		/**** md5 signature: 3463266be18332e599bcc5ed3dece74b ****/
		%feature("compactdefaultargs") InitArgs;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitArgs;
		void InitArgs();

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsFeature ******************/
		/**** md5 signature: 39e8d87b7bf0d8fafa0ee5ee48574888 ****/
		%feature("compactdefaultargs") IsFeature;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsFeature;
		Standard_Boolean IsFeature();

		/****************** MoreArgs ******************/
		/**** md5 signature: 1932bf348ab7f430b6ffb77926d3dee5 ****/
		%feature("compactdefaultargs") MoreArgs;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreArgs;
		Standard_Boolean MoreArgs();

		/****************** NamedShapeOfGeneration ******************/
		/**** md5 signature: a602a6f54d6c6371f0808dc2d3a65e1a ****/
		%feature("compactdefaultargs") NamedShapeOfGeneration;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShapeOfGeneration;
		opencascade::handle<TNaming_NamedShape> NamedShapeOfGeneration();

		/****************** NextArg ******************/
		/**** md5 signature: 488470e36350129f8d1a1c2101139be2 ****/
		%feature("compactdefaultargs") NextArg;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextArg;
		void NextArg();

		/****************** PrimitiveIdentification ******************/
		/**** md5 signature: 97edcda3511bdcf6c9506ccd8ea64bee ****/
		%feature("compactdefaultargs") PrimitiveIdentification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") PrimitiveIdentification;
		void PrimitiveIdentification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** ShapeArg ******************/
		/**** md5 signature: 7268253bc671d549c564c519c408a43b ****/
		%feature("compactdefaultargs") ShapeArg;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ShapeArg;
		TopoDS_Shape ShapeArg();

		/****************** ShapeContext ******************/
		/**** md5 signature: 046517dec276d0934d29122b6cafd283 ****/
		%feature("compactdefaultargs") ShapeContext;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ShapeContext;
		TopoDS_Shape ShapeContext();

		/****************** Type ******************/
		/**** md5 signature: ee0bfd0d4d6a95e55beea18c6f14b91c ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TNaming_NameType

Description
-----------
No available documentation.
") Type;
		TNaming_NameType Type();

};


%extend TNaming_Identifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_Iterator *
*************************/
class TNaming_Iterator {
	public:
		/****************** TNaming_Iterator ******************/
		/**** md5 signature: 2baf5b02176dfe6fc9dc3febb75e5210 ****/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "
Parameters
----------
anAtt: TNaming_NamedShape

Return
-------
None

Description
-----------
Iterates on all the history records in <anatt>.
") TNaming_Iterator;
		 TNaming_Iterator(const opencascade::handle<TNaming_NamedShape> & anAtt);

		/****************** TNaming_Iterator ******************/
		/**** md5 signature: da64a614fcaa5642e1dd0054ad6bea1c ****/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Iterates on all the history records in the current transaction.
") TNaming_Iterator;
		 TNaming_Iterator(const TDF_Label & aLabel);

		/****************** TNaming_Iterator ******************/
		/**** md5 signature: 961ae652f49f014e24c3713b9f4091b3 ****/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aTrans: int

Return
-------
None

Description
-----------
Iterates on all the history records in the transaction <atrans>.
") TNaming_Iterator;
		 TNaming_Iterator(const TDF_Label & aLabel, const Standard_Integer aTrans);

		/****************** Evolution ******************/
		/**** md5 signature: 807db9d74d271aa42843b60e4aab188f ****/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "Return
-------
TNaming_Evolution

Description
-----------
No available documentation.
") Evolution;
		TNaming_Evolution Evolution();

		/****************** IsModification ******************/
		/**** md5 signature: d84cb461ae1f7bb445d699b3caee967e ****/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the new shape is a modification (split, fuse,etc...) of the old shape.
") IsModification;
		Standard_Boolean IsModification();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a current item in the iteration.
") More;
		Standard_Boolean More();

		/****************** NewShape ******************/
		/**** md5 signature: c4db9c58041458e5fc402a0a744b1143 ****/
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the new shape in this iterator object.
") NewShape;
		const TopoDS_Shape NewShape();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves the iteration to the next item.
") Next;
		void Next();

		/****************** OldShape ******************/
		/**** md5 signature: 49f402645447653641aa0348df5a44eb ****/
		%feature("compactdefaultargs") OldShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the old shape in this iterator object. this shape can be a null one.
") OldShape;
		const TopoDS_Shape OldShape();

};


%extend TNaming_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TNaming_IteratorOnShapesSet *
************************************/
class TNaming_IteratorOnShapesSet {
	public:
		/****************** TNaming_IteratorOnShapesSet ******************/
		/**** md5 signature: 97a7ad19a39acfcf960c423fcad4ec99 ****/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet();

		/****************** TNaming_IteratorOnShapesSet ******************/
		/**** md5 signature: 43e3ae1b194f84be6645e17bc31f19dc ****/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "
Parameters
----------
S: TNaming_ShapesSet

Return
-------
None

Description
-----------
No available documentation.
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet(const TNaming_ShapesSet & S);

		/****************** Init ******************/
		/**** md5 signature: 79f82d92afe17d744e32b64b23233cc5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TNaming_ShapesSet

Return
-------
None

Description
-----------
Initialize the iteration.
") Init;
		void Init(const TNaming_ShapesSet & S);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a current item in the iteration.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next item.
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend TNaming_IteratorOnShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_Localizer *
**************************/
class TNaming_Localizer {
	public:
		/****************** TNaming_Localizer ******************/
		/**** md5 signature: 49d183c07e88d79902408e9b86bd879f ****/
		%feature("compactdefaultargs") TNaming_Localizer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Localizer;
		 TNaming_Localizer();

		/****************** Ancestors ******************/
		/**** md5 signature: 249e20f96ebf354ebf2c2f0cfd41ff44 ****/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum

Return
-------
TopTools_IndexedDataMapOfShapeListOfShape

Description
-----------
No available documentation.
") Ancestors;
		const TopTools_IndexedDataMapOfShapeListOfShape & Ancestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type);

		/****************** Backward ******************/
		/**** md5 signature: 016c931ceee337fc05c1e64d54f393e2 ****/
		%feature("compactdefaultargs") Backward;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
S: TopoDS_Shape
Primitives: TNaming_MapOfNamedShape
ValidShapes: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") Backward;
		void Backward(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & S, TNaming_MapOfNamedShape & Primitives, TopTools_MapOfShape & ValidShapes);

		/****************** FindFeaturesInAncestors ******************/
		/**** md5 signature: e0206583fcd95e7f42e8eb830a0a060b ****/
		%feature("compactdefaultargs") FindFeaturesInAncestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
In: TopoDS_Shape
AncInFeatures: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindFeaturesInAncestors;
		void FindFeaturesInAncestors(const TopoDS_Shape & S, const TopoDS_Shape & In, TopTools_MapOfShape & AncInFeatures);

		/****************** FindGenerator ******************/
		/**** md5 signature: 396ba219ecc4aa41ab3d44bd0912e343 ****/
		%feature("compactdefaultargs") FindGenerator;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
S: TopoDS_Shape
theListOfGenerators: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindGenerator;
		static void FindGenerator(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & S, TopTools_ListOfShape & theListOfGenerators);

		/****************** FindNeighbourg ******************/
		/**** md5 signature: a432bb9220952492e4158921ea252158 ****/
		%feature("compactdefaultargs") FindNeighbourg;
		%feature("autodoc", "
Parameters
----------
Cont: TopoDS_Shape
S: TopoDS_Shape
Neighbourg: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindNeighbourg;
		void FindNeighbourg(const TopoDS_Shape & Cont, const TopoDS_Shape & S, TopTools_MapOfShape & Neighbourg);

		/****************** FindShapeContext ******************/
		/**** md5 signature: 3080ebceae5e84f4b49f367cb2d966e0 ****/
		%feature("compactdefaultargs") FindShapeContext;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
theS: TopoDS_Shape
theSC: TopoDS_Shape

Return
-------
None

Description
-----------
Finds context of the shape <s>.
") FindShapeContext;
		static void FindShapeContext(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & theS, TopoDS_Shape & theSC);

		/****************** GoBack ******************/
		/**** md5 signature: a6ff591266d2ce72f53a7282d0120b6b ****/
		%feature("compactdefaultargs") GoBack;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Lab: TDF_Label
Evol: TNaming_Evolution
OldS: TopTools_ListOfShape
OldLab: TNaming_ListOfNamedShape

Return
-------
None

Description
-----------
No available documentation.
") GoBack;
		void GoBack(const TopoDS_Shape & S, const TDF_Label & Lab, const TNaming_Evolution Evol, TopTools_ListOfShape & OldS, TNaming_ListOfNamedShape & OldLab);

		/****************** Init ******************/
		/**** md5 signature: f1d09fe1c2db86931045549e32a5e2ee ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
US: TNaming_UsedShapes
CurTrans: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TNaming_UsedShapes> & US, const Standard_Integer CurTrans);

		/****************** IsNew ******************/
		/**** md5 signature: ff9f03fb517617ccaa57ffdaa1daf730 ****/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
NS: TNaming_NamedShape

Return
-------
bool

Description
-----------
No available documentation.
") IsNew;
		static Standard_Boolean IsNew(const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** SubShapes ******************/
		/**** md5 signature: f844c78d5c2f56db95a354e510879fd9 ****/
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum

Return
-------
TopTools_MapOfShape

Description
-----------
No available documentation.
") SubShapes;
		const TopTools_MapOfShape & SubShapes(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type);

};


%extend TNaming_Localizer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TNaming_Name *
*********************/
class TNaming_Name {
	public:
		/****************** TNaming_Name ******************/
		/**** md5 signature: a4aff2d86ba864c2474ceff03d471d7a ****/
		%feature("compactdefaultargs") TNaming_Name;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Name;
		 TNaming_Name();

		/****************** Append ******************/
		/**** md5 signature: ae06ad5f6fe1f9be7be3afe2b0a51e45 ****/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
arg: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const opencascade::handle<TNaming_NamedShape> & arg);

		/****************** Arguments ******************/
		/**** md5 signature: be638476169c3be8eb6c45ab65bd319e ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TNaming_ListOfNamedShape

Description
-----------
No available documentation.
") Arguments;
		const TNaming_ListOfNamedShape & Arguments();

		/****************** ContextLabel ******************/
		/**** md5 signature: 9967b59a06d78957ec944381f315be12 ****/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "
Parameters
----------
theLab: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") ContextLabel;
		void ContextLabel(const TDF_Label & theLab);

		/****************** ContextLabel ******************/
		/**** md5 signature: 24e75e2705dd32cd09af887dc318645d ****/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") ContextLabel;
		const TDF_Label & ContextLabel();


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
		/****************** Index ******************/
		/**** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") Index;
		void Index(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****************** Orientation ******************/
		/**** md5 signature: fb9858d598da2673e484eed6974efed9 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(const TopAbs_Orientation theOrientation);

		/****************** Orientation ******************/
		/**** md5 signature: 03010048da537511bfd11160d3c898dc ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Paste ******************/
		/**** md5 signature: 26f55b56dc1769098e5535c080f333bf ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TNaming_Name
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(TNaming_Name & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Shape ******************/
		/**** md5 signature: af489619aba91207399f153b1fdb75dc ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Shape;
		void Shape(const TopoDS_Shape & theShape);

		/****************** Shape ******************/
		/**** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		TopoDS_Shape Shape();

		/****************** ShapeType ******************/
		/**** md5 signature: 90faef4382ebff28c6bd3303987a742d ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "
Parameters
----------
aType: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
No available documentation.
") ShapeType;
		void ShapeType(const TopAbs_ShapeEnum aType);

		/****************** ShapeType ******************/
		/**** md5 signature: fdb6bbab82f138b7eb96684b837c482d ****/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** Solve ******************/
		/**** md5 signature: 327f0047e836e914c43f97af77251fc1 ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
aLab: TDF_Label
Valid: TDF_LabelMap

Return
-------
bool

Description
-----------
No available documentation.
") Solve;
		Standard_Boolean Solve(const TDF_Label & aLab, const TDF_LabelMap & Valid);

		/****************** StopNamedShape ******************/
		/**** md5 signature: 940a347c419778b1d92400dd9ecc55ce ****/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "
Parameters
----------
arg: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") StopNamedShape;
		void StopNamedShape(const opencascade::handle<TNaming_NamedShape> & arg);

		/****************** StopNamedShape ******************/
		/**** md5 signature: e4f39035ddcee3edb8b5590bd48040c0 ****/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") StopNamedShape;
		opencascade::handle<TNaming_NamedShape> StopNamedShape();

		/****************** Type ******************/
		/**** md5 signature: 117169560b15480745cd7dd3817ec7af ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
aType: TNaming_NameType

Return
-------
None

Description
-----------
No available documentation.
") Type;
		void Type(const TNaming_NameType aType);

		/****************** Type ******************/
		/**** md5 signature: ee0bfd0d4d6a95e55beea18c6f14b91c ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TNaming_NameType

Description
-----------
No available documentation.
") Type;
		TNaming_NameType Type();

};


%extend TNaming_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_NamedShape *
***************************/
class TNaming_NamedShape : public TDF_Attribute {
	public:
		/****************** TNaming_NamedShape ******************/
		/**** md5 signature: 5b226a78c722135cdb5da1643950aa84 ****/
		%feature("compactdefaultargs") TNaming_NamedShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_NamedShape;
		 TNaming_NamedShape();

		/****************** AfterUndo ******************/
		/**** md5 signature: 6a782c706f1e9291f121f77d889ed576 ****/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do after applying <anattdelta>.
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** BackupCopy ******************/
		/**** md5 signature: c0c9b77233d223451ec9a7e1bc2427c7 ****/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Copies the attribute contents into a new other attribute. it is used by backup().
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeRemoval ******************/
		/**** md5 signature: fb87f8354fd142d1ab3d9cd55ada4556 ****/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** BeforeUndo ******************/
		/**** md5 signature: d409c3f1c759e5fb3727056dd12910e7 ****/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do before applying <anattdelta>.
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****************** DeltaOnModification ******************/
		/**** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ****/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anOldAttribute: TDF_Attribute

Return
-------
opencascade::handle<TDF_DeltaOnModification>

Description
-----------
Makes a deltaonmodification between <self> and <anoldattribute.
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****************** DeltaOnModification ******************/
		/**** md5 signature: ede0663285b98e98df96462eca3a6ecf ****/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
aDelta: TDF_DeltaOnModification

Return
-------
None

Description
-----------
Applies a deltaonmodification to <self>.
") DeltaOnModification;
		virtual void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****************** DeltaOnRemoval ******************/
		/**** md5 signature: fce2b18e72dadcfc2bcbf283227db136 ****/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnRemoval>

Description
-----------
Makes a deltaonremoval on <self> because <self> has disappeared from the ds.
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****************** Dump ******************/
		/**** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the attribute on <astream>.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****************** Evolution ******************/
		/**** md5 signature: 807db9d74d271aa42843b60e4aab188f ****/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "Return
-------
TNaming_Evolution

Description
-----------
Returns the evolution of the attribute.
") Evolution;
		TNaming_Evolution Evolution();

		/****************** Get ******************/
		/**** md5 signature: 706b9ff7761aba97b57079b140b2bbf6 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the shapes contained in <ns>. returns a null shape if isempty.
") Get;
		TopoDS_Shape Get();

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Class method ============ returns the guid for named shapes.
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of the attribute.
") ID;
		const Standard_GUID & ID();

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. it is used by the copy algorithm.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 53b4ec32bedd752fc0ccd186074f75ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method pastes the current attribute to the label corresponding to the insertor. the pasted attribute may be a brand new one or a new version of the previous one.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** References ******************/
		/**** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
Adds the directly referenced attributes and labels to <adataset>. 'directly' means we have only to look at the first level of references.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		/**** md5 signature: c280e51bf6f4f3b5011b0c3698dfb001 ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Restores the contents from <anattribute> into this one. it is used when aborting a transaction.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SetVersion ******************/
		/**** md5 signature: 78536ff299eb6d6824ab1bc2f1e8c204 ****/
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "
Parameters
----------
version: int

Return
-------
None

Description
-----------
Set the version of the attribute.
") SetVersion;
		void SetVersion(const Standard_Integer version);

		/****************** Version ******************/
		/**** md5 signature: 4bb71e2d63c3ae8458fb62f8d03b21ff ****/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the version of the attribute.
") Version;
		Standard_Integer Version();

};


%make_alias(TNaming_NamedShape)

%extend TNaming_NamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TNaming_Naming *
***********************/
class TNaming_Naming : public TDF_Attribute {
	public:
		/****************** TNaming_Naming ******************/
		/**** md5 signature: cd65d37fe445371eb548066328512e48 ****/
		%feature("compactdefaultargs") TNaming_Naming;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Naming;
		 TNaming_Naming();

		/****************** ChangeName ******************/
		/**** md5 signature: f56a3dc2deefccbd731e242fd2faf15e ****/
		%feature("compactdefaultargs") ChangeName;
		%feature("autodoc", "Return
-------
TNaming_Name

Description
-----------
No available documentation.
") ChangeName;
		TNaming_Name & ChangeName();

		/****************** Dump ******************/
		/**** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****************** ExtendedDump ******************/
		/**** md5 signature: cdafdec412b1ac94fc1e049a6ac0bb97 ****/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "
Parameters
----------
aFilter: TDF_IDFilter
aMap: TDF_AttributeIndexedMap

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") ExtendedDump;
		virtual void ExtendedDump(std::ostream &OutValue, const TDF_IDFilter & aFilter, TDF_AttributeIndexedMap & aMap);

		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Following code from tdesignstd ==============================.
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetName ******************/
		/**** md5 signature: 797bac9ab1006319502b53ff025b7618 ****/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
TNaming_Name

Description
-----------
No available documentation.
") GetName;
		const TNaming_Name & GetName();

		/****************** ID ******************/
		/**** md5 signature: 18550bf05502080c8e2a8a16aabb4183 ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Deferred methods from tdf_attribute ===================================.
") ID;
		virtual const Standard_GUID & ID();

		/****************** Insert ******************/
		/**** md5 signature: c840f860441ae6b6c580b2a585213883 ****/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
under: TDF_Label

Return
-------
opencascade::handle<TNaming_Naming>

Description
-----------
No available documentation.
") Insert;
		static opencascade::handle<TNaming_Naming> Insert(const TDF_Label & under);

		/****************** IsDefined ******************/
		/**** md5 signature: 96257d1cfd02677e7d5918092c3e6fb1 ****/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDefined;
		Standard_Boolean IsDefined();

		/****************** Name ******************/
		/**** md5 signature: 43a576a93986358dd6e60ab2987a31b9 ****/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
where: TDF_Label
Selection: TopoDS_Shape
Context: TopoDS_Shape
Geometry: bool (optional, default to Standard_False)
KeepOrientation: bool (optional, default to Standard_False)
BNproblem: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Creates a namimg attribute at label <where> to identify the shape <selection>. geometry is standard_true if we are only interested by the underlying geometry (e.g. setting a constraint). <context> is used to find neighbours of <s> when required by the naming. if keeporientation is true the selection orientation is taken into account. bnproblem == true points out that context sub-shapes in df have orientation differences with context shape itself. instance method ===============.
") Name;
		static opencascade::handle<TNaming_NamedShape> Name(const TDF_Label & where, const TopoDS_Shape & Selection, const TopoDS_Shape & Context, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientation = Standard_False, const Standard_Boolean BNproblem = Standard_False);

		/****************** NewEmpty ******************/
		/**** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: a6ff306a759c68a191c0262635db980f ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		/**** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Regenerate ******************/
		/**** md5 signature: 05a2338f432d838f78697d953440f9a7 ****/
		%feature("compactdefaultargs") Regenerate;
		%feature("autodoc", "
Parameters
----------
scope: TDF_LabelMap

Return
-------
bool

Description
-----------
Regenerate only the name associated to me.
") Regenerate;
		Standard_Boolean Regenerate(TDF_LabelMap & scope);

		/****************** Restore ******************/
		/**** md5 signature: ddeae219d389a1d89eecb3e23c73522a ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Solve ******************/
		/**** md5 signature: 69bbb6172130b18c37589c097aed4400 ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
scope: TDF_LabelMap

Return
-------
bool

Description
-----------
Regenerate recursively the whole name with scope. if scope is empty it means that all the labels of the framework are valid.
") Solve;
		Standard_Boolean Solve(TDF_LabelMap & scope);

};


%make_alias(TNaming_Naming)

%extend TNaming_Naming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_NamingTool *
***************************/
class TNaming_NamingTool {
	public:
		/****************** BuildDescendants ******************/
		/**** md5 signature: 7926f142c131508f29512155d5f95f47 ****/
		%feature("compactdefaultargs") BuildDescendants;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Labels: TDF_LabelMap

Return
-------
None

Description
-----------
No available documentation.
") BuildDescendants;
		static void BuildDescendants(const opencascade::handle<TNaming_NamedShape> & NS, TDF_LabelMap & Labels);

		/****************** CurrentShape ******************/
		/**** md5 signature: 0ef4d077ff57fd4ff0dcbace038cfc32 ****/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
NS: TNaming_NamedShape
MS: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
No available documentation.
") CurrentShape;
		static void CurrentShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const opencascade::handle<TNaming_NamedShape> & NS, TopTools_IndexedMapOfShape & MS);

		/****************** CurrentShapeFromShape ******************/
		/**** md5 signature: 8d45a58b80e88b893687176b16d94e8b ****/
		%feature("compactdefaultargs") CurrentShapeFromShape;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
Acces: TDF_Label
S: TopoDS_Shape
MS: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
No available documentation.
") CurrentShapeFromShape;
		static void CurrentShapeFromShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const TDF_Label & Acces, const TopoDS_Shape & S, TopTools_IndexedMapOfShape & MS);

};


%extend TNaming_NamingTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TNaming_NewShapeIterator *
*********************************/
class TNaming_NewShapeIterator {
	public:
		/****************** TNaming_NewShapeIterator ******************/
		/**** md5 signature: 2a4486f9fdd3c78dfadf3442489de981 ****/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
Transaction: int
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TopoDS_Shape & aShape, const Standard_Integer Transaction, const TDF_Label & access);

		/****************** TNaming_NewShapeIterator ******************/
		/**** md5 signature: 141ccf0b4fb175df78bf5d046f067e10 ****/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****************** TNaming_NewShapeIterator ******************/
		/**** md5 signature: 609db790d2817dec99f05c07671f657d ****/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_NewShapeIterator

Return
-------
None

Description
-----------
Iterates from the current shape in <aniterator>.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TNaming_NewShapeIterator & anIterator);

		/****************** TNaming_NewShapeIterator ******************/
		/**** md5 signature: 1601b802df2ff029a6a08f3df82afe61 ****/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_Iterator

Return
-------
None

Description
-----------
Iterates from the current shape in <aniterator>.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TNaming_Iterator & anIterator);

		/****************** IsModification ******************/
		/**** md5 signature: d84cb461ae1f7bb445d699b3caee967e ****/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the new shape is a modification (split, fuse,etc...) of the old shape.
") IsModification;
		Standard_Boolean IsModification();

		/****************** Label ******************/
		/**** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** NamedShape ******************/
		/**** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ****/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Warning! can be a null shape if a descendant is deleted.
") Shape;
		const TopoDS_Shape Shape();

};


%extend TNaming_NewShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TNaming_OldShapeIterator *
*********************************/
class TNaming_OldShapeIterator {
	public:
		/****************** TNaming_OldShapeIterator ******************/
		/**** md5 signature: 0591db4a01d343a1392be5bf7b4bd0b6 ****/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
Transaction: int
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TopoDS_Shape & aShape, const Standard_Integer Transaction, const TDF_Label & access);

		/****************** TNaming_OldShapeIterator ******************/
		/**** md5 signature: 86ee4b957cbf8b33c2595110c2d733c5 ****/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****************** TNaming_OldShapeIterator ******************/
		/**** md5 signature: 6536f03d39325e774b6a8aba962ac0d4 ****/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_OldShapeIterator

Return
-------
None

Description
-----------
Iterates from the current shape in <aniterator>.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TNaming_OldShapeIterator & anIterator);

		/****************** TNaming_OldShapeIterator ******************/
		/**** md5 signature: d427bb8948dd8b4165b7f6ca2a35f18a ****/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_Iterator

Return
-------
None

Description
-----------
Iterates from the current shape in <aniterator>.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TNaming_Iterator & anIterator);

		/****************** IsModification ******************/
		/**** md5 signature: d84cb461ae1f7bb445d699b3caee967e ****/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the new shape is a modification (split, fuse,etc...) of the old shape.
") IsModification;
		Standard_Boolean IsModification();

		/****************** Label ******************/
		/**** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** NamedShape ******************/
		/**** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ****/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

};


%extend TNaming_OldShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_RefShape *
*************************/
class TNaming_RefShape {
	public:
		/****************** TNaming_RefShape ******************/
		/**** md5 signature: b3694f0f9a726a67d2d4c410e0552808 ****/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_RefShape;
		 TNaming_RefShape();

		/****************** TNaming_RefShape ******************/
		/**** md5 signature: 97cba1b7e49119d8e5f0a0a3edc5ef41 ****/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") TNaming_RefShape;
		 TNaming_RefShape(const TopoDS_Shape & S);


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
		/****************** FirstUse ******************/
		/**** md5 signature: e46533395323ec138eb9f0788412fd43 ****/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "
Parameters
----------
aPtr: TNaming_PtrNode

Return
-------
None

Description
-----------
No available documentation.
") FirstUse;
		void FirstUse(const TNaming_PtrNode & aPtr);

		/****************** FirstUse ******************/
		/**** md5 signature: 495ac9c816ba5c059737fcefd608bd4e ****/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "Return
-------
TNaming_PtrNode

Description
-----------
No available documentation.
") FirstUse;
		TNaming_PtrNode FirstUse();

		/****************** Label ******************/
		/**** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****************** NamedShape ******************/
		/**** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ****/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Shape ******************/
		/**** md5 signature: 4ad14bdfefa6edaba5ec8f3a5bcb98f4 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Shape;
		void Shape(const TopoDS_Shape & S);

		/****************** Shape ******************/
		/**** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

};


%extend TNaming_RefShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TNaming_SameShapeIterator *
**********************************/
class TNaming_SameShapeIterator {
	public:
		/****************** TNaming_SameShapeIterator ******************/
		/**** md5 signature: 6c037d9ef9b860505439a46995ae206f ****/
		%feature("compactdefaultargs") TNaming_SameShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_SameShapeIterator;
		 TNaming_SameShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****************** Label ******************/
		/**** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

};


%extend TNaming_SameShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TNaming_Scope *
**********************/
class TNaming_Scope {
	public:
		/****************** TNaming_Scope ******************/
		/**** md5 signature: b60b0c2f87dfd55211b1af2e90685b38 ****/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "Return
-------
None

Description
-----------
Withvalid = false.
") TNaming_Scope;
		 TNaming_Scope();

		/****************** TNaming_Scope ******************/
		/**** md5 signature: 8932f816adb73ddad549d33c17c373d0 ****/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "
Parameters
----------
WithValid: bool

Return
-------
None

Description
-----------
If <withvalid> the scope is defined by the map. if not on the whole framework.
") TNaming_Scope;
		 TNaming_Scope(const Standard_Boolean WithValid);

		/****************** TNaming_Scope ******************/
		/**** md5 signature: 268c46cd5cd358414148cf260c8c3319 ****/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "
Parameters
----------
valid: TDF_LabelMap

Return
-------
None

Description
-----------
Create a scope with a map. withvalid = true.
") TNaming_Scope;
		 TNaming_Scope(TDF_LabelMap & valid);

		/****************** ChangeValid ******************/
		/**** md5 signature: 86d84e474f21b877bdf2d277639f7521 ****/
		%feature("compactdefaultargs") ChangeValid;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
No available documentation.
") ChangeValid;
		TDF_LabelMap & ChangeValid();

		/****************** ClearValid ******************/
		/**** md5 signature: f75cb19c38c702d6e3a82709605286ee ****/
		%feature("compactdefaultargs") ClearValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearValid;
		void ClearValid();

		/****************** CurrentShape ******************/
		/**** md5 signature: aa251666a13ed76b453f16b476df78eb ****/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the current value of <ns> according to the valid scope.
") CurrentShape;
		TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** GetValid ******************/
		/**** md5 signature: c371157b895ee66ea6eea74aede1c22d ****/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
No available documentation.
") GetValid;
		const TDF_LabelMap & GetValid();

		/****************** IsValid ******************/
		/**** md5 signature: daf835546ae1359506d879d192f9cbc2 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		Standard_Boolean IsValid(const TDF_Label & L);

		/****************** Unvalid ******************/
		/**** md5 signature: e970908a0d0a073625221373380e13b4 ****/
		%feature("compactdefaultargs") Unvalid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") Unvalid;
		void Unvalid(const TDF_Label & L);

		/****************** UnvalidChildren ******************/
		/**** md5 signature: dc66e9c3e6a99a5fa20e3b02716bf14b ****/
		%feature("compactdefaultargs") UnvalidChildren;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
withroot: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") UnvalidChildren;
		void UnvalidChildren(const TDF_Label & L, const Standard_Boolean withroot = Standard_True);

		/****************** Valid ******************/
		/**** md5 signature: 3e508c54217f142842715bf4d0c369a0 ****/
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") Valid;
		void Valid(const TDF_Label & L);

		/****************** ValidChildren ******************/
		/**** md5 signature: 2c79ea717fc02455603de17841a774b9 ****/
		%feature("compactdefaultargs") ValidChildren;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
withroot: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") ValidChildren;
		void ValidChildren(const TDF_Label & L, const Standard_Boolean withroot = Standard_True);

		/****************** WithValid ******************/
		/**** md5 signature: 8866a58a3aceee3d9219aa3a6da5444f ****/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithValid;
		Standard_Boolean WithValid();

		/****************** WithValid ******************/
		/**** md5 signature: 1aca92f030cfe32c12c4b8a462301f59 ****/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
No available documentation.
") WithValid;
		void WithValid(const Standard_Boolean mode);

};


%extend TNaming_Scope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_Selector *
*************************/
class TNaming_Selector {
	public:
		/****************** TNaming_Selector ******************/
		/**** md5 signature: 70d603813b6d158c9258bc43212551f6 ****/
		%feature("compactdefaultargs") TNaming_Selector;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Create a selector on this label to select a shape. ==================.
") TNaming_Selector;
		 TNaming_Selector(const TDF_Label & aLabel);

		/****************** Arguments ******************/
		/**** md5 signature: c499cd07de035eeec365e9e3cb1fa454 ****/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "
Parameters
----------
args: TDF_AttributeMap

Return
-------
None

Description
-----------
Returns the attribute list args. this list contains the named shape on which the topological naming was built.
") Arguments;
		void Arguments(TDF_AttributeMap & args);

		/****************** IsIdentified ******************/
		/**** md5 signature: 171ef65d8719ba2ead9abac890b562d0 ****/
		%feature("compactdefaultargs") IsIdentified;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
selection: TopoDS_Shape
NS: TNaming_NamedShape
Geometry: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
To know if a shape is already identified (not selected) ======================================================= //! the label access defines the point of access to the data framework. selection is the shape for which we want to know whether it is identified or not. if true, ns is returned as the identity of selection. if geometry is true, ns will be the named shape containing the first appearance of selection and not any other shape. in other words, selection must be the only shape stored in ns.
") IsIdentified;
		static Standard_Boolean IsIdentified(const TDF_Label & access, const TopoDS_Shape & selection, opencascade::handle<TNaming_NamedShape> & NS, const Standard_Boolean Geometry = Standard_False);

		/****************** NamedShape ******************/
		/**** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ****/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the namedshape build or under construction, which contains the topological naming..
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Select ******************/
		/**** md5 signature: f6787249f27ffbeb261c45ccce5f3b3a ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
Selection: TopoDS_Shape
Context: TopoDS_Shape
Geometry: bool (optional, default to Standard_False)
KeepOrientatation: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Creates a topological naming on the label alabel given as an argument at construction time. if successful, the shape selection - found in the shape context - is now identified in the named shape returned in namedshape. if geometry is true, namedshape contains the first appearance of selection. this syntax is more robust than the previous syntax for this method.
") Select;
		Standard_Boolean Select(const TopoDS_Shape & Selection, const TopoDS_Shape & Context, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientatation = Standard_False);

		/****************** Select ******************/
		/**** md5 signature: 1b089f4a0c9e7f5c0183a64e085582fc ****/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
Selection: TopoDS_Shape
Geometry: bool (optional, default to Standard_False)
KeepOrientatation: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Creates a topological naming on the label alabel given as an argument at construction time. if successful, the shape selection is now identified in the named shape returned in namedshape. if geometry is true, namedshape contains the first appearance of selection.
") Select;
		Standard_Boolean Select(const TopoDS_Shape & Selection, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientatation = Standard_False);

		/****************** Solve ******************/
		/**** md5 signature: 3df66f09832bf5105dae6beb36286f58 ****/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap

Return
-------
bool

Description
-----------
Updates the topological naming on the label alabel given as an argument at construction time. the underlying shape returned in the method namedshape is updated. to read this shape, use the method tnaming_tool::getshape.
") Solve;
		Standard_Boolean Solve(TDF_LabelMap & Valid);

};


%extend TNaming_Selector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_ShapesSet *
**************************/
class TNaming_ShapesSet {
	public:
		/****************** TNaming_ShapesSet ******************/
		/**** md5 signature: 3867cd6e9fdf4394cc4aea0688c7148a ****/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_ShapesSet;
		 TNaming_ShapesSet();

		/****************** TNaming_ShapesSet ******************/
		/**** md5 signature: 78fcf6ecaac3ac3cbba72f336517ce05 ****/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") TNaming_ShapesSet;
		 TNaming_ShapesSet(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type = TopAbs_SHAPE);

		/****************** Add ******************/
		/**** md5 signature: 5d2382c33d1c9820807378c2a0badd9f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Adds the shape <s>.
") Add;
		Standard_Boolean Add(const TopoDS_Shape & S);

		/****************** Add ******************/
		/**** md5 signature: 694b6f3c32c0e6d71bc4fa40da255662 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Shapes: TNaming_ShapesSet

Return
-------
None

Description
-----------
Adds the shapes contained in <shapes>.
") Add;
		void Add(const TNaming_ShapesSet & Shapes);

		/****************** ChangeMap ******************/
		/**** md5 signature: 59a4fe45f6aed0c2e4b3d9af0228a846 ****/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TopTools_MapOfShape

Description
-----------
No available documentation.
") ChangeMap;
		TopTools_MapOfShape & ChangeMap();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all shapes.
") Clear;
		void Clear();

		/****************** Contains ******************/
		/**** md5 signature: f099b22f53dc3705b9de7f86b775b20a ****/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if <s> is in <self>.
") Contains;
		Standard_Boolean Contains(const TopoDS_Shape & S);

		/****************** Filter ******************/
		/**** md5 signature: c77e18f9d11a430ef7e8cda4de9aa38d ****/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "
Parameters
----------
Shapes: TNaming_ShapesSet

Return
-------
None

Description
-----------
Erases in <self> the shapes not contained in <shapes>.
") Filter;
		void Filter(const TNaming_ShapesSet & Shapes);

		/****************** IsEmpty ******************/
		/**** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Map ******************/
		/**** md5 signature: 3583c11e164a7116bd04e325b8161d42 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TopTools_MapOfShape

Description
-----------
No available documentation.
") Map;
		const TopTools_MapOfShape & Map();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Remove ******************/
		/**** md5 signature: 5449c02e45435de23a9951ba8c39aa95 ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Removes <s> in <self>.
") Remove;
		Standard_Boolean Remove(const TopoDS_Shape & S);

		/****************** Remove ******************/
		/**** md5 signature: f13ae410acbb09ecf50860c238d4414e ****/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
Shapes: TNaming_ShapesSet

Return
-------
None

Description
-----------
Removes in <self> the shapes contained in <shapes>.
") Remove;
		void Remove(const TNaming_ShapesSet & Shapes);

};


%extend TNaming_ShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TNaming_Tool *
*********************/
class TNaming_Tool {
	public:
		/****************** Collect ******************/
		/**** md5 signature: ef8694741dc8a5a15ddcb7a64161db4a ****/
		%feature("compactdefaultargs") Collect;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Labels: TNaming_MapOfNamedShape
OnlyModif: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Collect;
		static void Collect(const opencascade::handle<TNaming_NamedShape> & NS, TNaming_MapOfNamedShape & Labels, const Standard_Boolean OnlyModif = Standard_True);

		/****************** CurrentNamedShape ******************/
		/**** md5 signature: 147ce32f7bd73532989750f6a0b51960 ****/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Updated: TDF_LabelMap

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the namedshape of the last modification of <ns>. this shape is identified by a label.
") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape(const opencascade::handle<TNaming_NamedShape> & NS, const TDF_LabelMap & Updated);

		/****************** CurrentNamedShape ******************/
		/**** md5 signature: 30b845dfc2bf9683aac7c44f233fb27d ****/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns namedshape the last modification of <ns>.
") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** CurrentShape ******************/
		/**** md5 signature: a0362e0bcc3348f0c4fdd8452378294d ****/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the last modification of <ns>. returns the shape currentshape contained in the named shape attribute ns. currentshape is the current state of the entities if they have been modified in other attributes of the same data structure. each call to this function creates a new compound.
") CurrentShape;
		static TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** CurrentShape ******************/
		/**** md5 signature: 215ab93ac3381a87a82142c64be729d7 ****/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Updated: TDF_LabelMap

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape currentshape contained in the named shape attribute ns, and present in the updated attribute map updated. currentshape is the current state of the entities if they have been modified in other attributes of the same data structure. each call to this function creates a new compound. warning only the contents of updated are searched.r.
") CurrentShape;
		static TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS, const TDF_LabelMap & Updated);

		/****************** FindShape ******************/
		/**** md5 signature: b8f0c64cfdf6508bb0b1b137412bd585 ****/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
Arg: TNaming_NamedShape
S: TopoDS_Shape

Return
-------
None

Description
-----------
Returns the current shape (a wire or a shell) built (in the data framework) from the shapes of the argument named shape. it is used for identity name type computation.
") FindShape;
		static void FindShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const opencascade::handle<TNaming_NamedShape> & Arg, TopoDS_Shape & S);

		/****************** GeneratedShape ******************/
		/**** md5 signature: f0cadb1e38b87f8969e887a7314d2d10 ****/
		%feature("compactdefaultargs") GeneratedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Generation: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape generated from s or by a modification of s and contained in the named shape generation.
") GeneratedShape;
		static TopoDS_Shape GeneratedShape(const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & Generation);

		/****************** GetShape ******************/
		/**** md5 signature: cec4b1e0ab6aee147cf66c42538a59f2 ****/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the entities stored in the named shape attribute ns. if there is only one old-new pair, the new shape is returned. otherwise, a compound is returned. this compound is made out of all the new shapes found. each call to this function creates a new compound.
") GetShape;
		static TopoDS_Shape GetShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** HasLabel ******************/
		/**** md5 signature: 954def380083a98f46aca9ad63a0f44c ****/
		%feature("compactdefaultargs") HasLabel;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
aShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if <ashape> appears under a label.(dp).
") HasLabel;
		static Standard_Boolean HasLabel(const TDF_Label & access, const TopoDS_Shape & aShape);

		/****************** InitialShape ******************/
		/**** md5 signature: 81b1aa5e7722455cca164c9008574081 ****/
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
anAcces: TDF_Label
Labels: TDF_LabelList

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape created from the shape ashape contained in the attribute anacces.
") InitialShape;
		static TopoDS_Shape InitialShape(const TopoDS_Shape & aShape, const TDF_Label & anAcces, TDF_LabelList & Labels);

		/****************** Label ******************/
		/**** md5 signature: 0b54c4797f0a294a17228be81e2d2f85 ****/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
aShape: TopoDS_Shape

Return
-------
TransDef: int

Description
-----------
Returns the label of the first apparition of <ashape>. transdef is a value of the transaction of the first apparition of <ashape>.
") Label;
		static TDF_Label Label(const TDF_Label & access, const TopoDS_Shape & aShape, Standard_Integer &OutValue);

		/****************** NamedShape ******************/
		/**** md5 signature: 3956ffe795685626652ab82ae42f4692 ****/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
anAcces: TDF_Label

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the named shape attribute defined by the shape ashape and the label anaccess. this attribute is returned as a new shape. you call this function, if you need to create a topological attribute for existing data. example class mypkg_myclass { public: standard_boolean sameedge(const opencascade::handle<ocaftest_line>& , const opencascade::handle<caftest_line>& ); }; //! standard_boolean mypkg_myclass::sameedge (const opencascade::handle<ocaftest_line>& l1 const opencascade::handle<ocaftest_line>& l2) { opencascade::handle<tnaming_namedshape> ns1 = l1->namedshape(); opencascade::handle<tnaming_namedshape> ns2 = l2->namedshape(); //! return breptools::compare(ns1->get(),ns2->get()); } in the example above, the function sameedge is created to compare the edges having two lines for geometric supports. if these edges are found by breptools::compare to be within the same tolerance, they are considered to be the same. warning to avoid sharing of names, a selected attribute will not be returned. sharing of names makes it harder to manage the data structure. when the user of the name is removed, for example, it is difficult to know whether the name should be destroyed.
") NamedShape;
		static opencascade::handle<TNaming_NamedShape> NamedShape(const TopoDS_Shape & aShape, const TDF_Label & anAcces);

		/****************** OriginalShape ******************/
		/**** md5 signature: cb14e7b2e814c72e923631b51a543cf6 ****/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape contained as oldshape in <ns>.
") OriginalShape;
		static TopoDS_Shape OriginalShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** ValidUntil ******************/
		/**** md5 signature: 9f164e3076ba934991747c998e5f774c ****/
		%feature("compactdefaultargs") ValidUntil;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
S: TopoDS_Shape

Return
-------
int

Description
-----------
Returns the last transaction where the creation of s is valid.
") ValidUntil;
		static Standard_Integer ValidUntil(const TDF_Label & access, const TopoDS_Shape & S);

};


%extend TNaming_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TNaming_TranslateTool *
******************************/
class TNaming_TranslateTool : public Standard_Transient {
	public:
		/****************** Add ******************/
		/**** md5 signature: 6b673c7ba91c9e899062149b65350d5b ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** MakeCompSolid ******************/
		/**** md5 signature: 57fc159dd32fae99ace17587ea7b56d4 ****/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeCompSolid;
		void MakeCompSolid(TopoDS_Shape & S);

		/****************** MakeCompound ******************/
		/**** md5 signature: dcd3e74dd7b8a83db2f4e804d7ab98c8 ****/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeCompound;
		void MakeCompound(TopoDS_Shape & S);

		/****************** MakeEdge ******************/
		/**** md5 signature: 350c8c28f1fe9326aa82159933a81031 ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeEdge;
		void MakeEdge(TopoDS_Shape & S);

		/****************** MakeFace ******************/
		/**** md5 signature: 19694e210773e5f7ca5011597a8db511 ****/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeFace;
		void MakeFace(TopoDS_Shape & S);

		/****************** MakeShell ******************/
		/**** md5 signature: ef072484592d72c21a5082c6a15089ad ****/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeShell;
		void MakeShell(TopoDS_Shape & S);

		/****************** MakeSolid ******************/
		/**** md5 signature: 09e9258c227e928cb1c324e293a90586 ****/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeSolid;
		void MakeSolid(TopoDS_Shape & S);

		/****************** MakeVertex ******************/
		/**** md5 signature: 7395c8b131e7972d27b87d345265e3b9 ****/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeVertex;
		void MakeVertex(TopoDS_Shape & S);

		/****************** MakeWire ******************/
		/**** md5 signature: 37a383ff4a6c5af9e98059c2dfcddea8 ****/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeWire;
		void MakeWire(TopoDS_Shape & S);

		/****************** UpdateEdge ******************/
		/**** md5 signature: 32c88d6a80c068ef7bc4a8f3a213e626 ****/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Return
-------
None

Description
-----------
No available documentation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

		/****************** UpdateFace ******************/
		/**** md5 signature: a3dc337fc26d7c028daac8cce270aefe ****/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Return
-------
None

Description
-----------
No available documentation.
") UpdateFace;
		void UpdateFace(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

		/****************** UpdateShape ******************/
		/**** md5 signature: 8bf8def5c83f533e58852e9d10059929 ****/
		%feature("compactdefaultargs") UpdateShape;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") UpdateShape;
		void UpdateShape(const TopoDS_Shape & S1, TopoDS_Shape & S2);

		/****************** UpdateVertex ******************/
		/**** md5 signature: 996e38d30dc10b9ceef4cc601d23d36d ****/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Return
-------
None

Description
-----------
No available documentation.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

};


%make_alias(TNaming_TranslateTool)

%extend TNaming_TranslateTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_Translator *
***************************/
class TNaming_Translator {
	public:
		/****************** TNaming_Translator ******************/
		/**** md5 signature: 8e39179b5baea728f06e58e27cd7a796 ****/
		%feature("compactdefaultargs") TNaming_Translator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Translator;
		 TNaming_Translator();

		/****************** Add ******************/
		/**** md5 signature: 1c2c17ad83f5b4f9122afbf2d2376f4f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & aShape);

		/****************** Copied ******************/
		/**** md5 signature: e5699ddbbe3da727a49d616c89f9eac1 ****/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Returns copied shape.
") Copied;
		const TopoDS_Shape Copied(const TopoDS_Shape & aShape);

		/****************** Copied ******************/
		/**** md5 signature: d10333a4c793322b9feccf7e3a23523a ****/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeShape

Description
-----------
Returns datamap of results; (shape <-> copied shape).
") Copied;
		const TopTools_DataMapOfShapeShape & Copied();

		/****************** DumpMap ******************/
		/**** md5 signature: 0a2ceed5a21dd3be8407730ae50ff428 ****/
		%feature("compactdefaultargs") DumpMap;
		%feature("autodoc", "
Parameters
----------
isWrite: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") DumpMap;
		void DumpMap(const Standard_Boolean isWrite = Standard_False);

		/****************** IsDone ******************/
		/**** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ****/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

};


%extend TNaming_Translator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_UsedShapes *
***************************/
%nodefaultctor TNaming_UsedShapes;
class TNaming_UsedShapes : public TDF_Attribute {
	public:
		/****************** AfterUndo ******************/
		/**** md5 signature: 6a782c706f1e9291f121f77d889ed576 ****/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do after applying <anattdelta>.
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** BackupCopy ******************/
		/**** md5 signature: c0c9b77233d223451ec9a7e1bc2427c7 ****/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Copies the attribute contents into a new other attribute. it is used by backup().
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeRemoval ******************/
		/**** md5 signature: fb87f8354fd142d1ab3d9cd55ada4556 ****/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the table.
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** DeltaOnAddition ******************/
		/**** md5 signature: aa2ea5db23993a7e5b0a25784c07a50b ****/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnAddition>

Description
-----------
This method returns a null handle (no delta).
") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition();

		/****************** DeltaOnRemoval ******************/
		/**** md5 signature: fce2b18e72dadcfc2bcbf283227db136 ****/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnRemoval>

Description
-----------
This method returns a null handle (no delta).
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****************** Destroy ******************/
		/**** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ****/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****************** Dump ******************/
		/**** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ****/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the attribute on <astream>.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****************** GetID ******************/
		/**** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ****/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id: 2a96b614-ec8b-11d0-bee7-080009dc3333.
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		/**** md5 signature: 4697ce8a095fa6dcef0217708d19718f ****/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the id of the attribute.
") ID;
		const Standard_GUID & ID();

		/****************** Map ******************/
		/**** md5 signature: 9334310995a65460bf5da71aabb605e3 ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TNaming_DataMapOfShapePtrRefShape

Description
-----------
No available documentation.
") Map;
		TNaming_DataMapOfShapePtrRefShape & Map();

		/****************** NewEmpty ******************/
		/**** md5 signature: 8be17a4d2a4deeee198571712e76805e ****/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. it is used by the copy algorithm.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		/**** md5 signature: 53b4ec32bedd752fc0ccd186074f75ef ****/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method pastes the current attribute to the label corresponding to the insertor. the pasted attribute may be a brand new one or a new version of the previous one.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** References ******************/
		/**** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ****/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
Adds the directly referenced attributes and labels to <adataset>. 'directly' means we have only to look at the first level of references. //! for this, use only the addlabel() & addattribute() from dataset and do not try to modify information previously stored in <adataset>.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		/**** md5 signature: c280e51bf6f4f3b5011b0c3698dfb001 ****/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Restores the contents from <anattribute> into this one. it is used when aborting a transaction.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

};


%make_alias(TNaming_UsedShapes)

%extend TNaming_UsedShapes {
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
def tnaming_ChangeShapes(*args):
	return tnaming.ChangeShapes(*args)

@deprecated
def tnaming_Displace(*args):
	return tnaming.Displace(*args)

@deprecated
def tnaming_FindUniqueContext(*args):
	return tnaming.FindUniqueContext(*args)

@deprecated
def tnaming_FindUniqueContextSet(*args):
	return tnaming.FindUniqueContextSet(*args)

@deprecated
def tnaming_IDList(*args):
	return tnaming.IDList(*args)

@deprecated
def tnaming_MakeShape(*args):
	return tnaming.MakeShape(*args)

@deprecated
def tnaming_OuterShell(*args):
	return tnaming.OuterShell(*args)

@deprecated
def tnaming_OuterWire(*args):
	return tnaming.OuterWire(*args)

@deprecated
def tnaming_Print(*args):
	return tnaming.Print(*args)

@deprecated
def tnaming_Print(*args):
	return tnaming.Print(*args)

@deprecated
def tnaming_Print(*args):
	return tnaming.Print(*args)

@deprecated
def tnaming_Replicate(*args):
	return tnaming.Replicate(*args)

@deprecated
def tnaming_Replicate(*args):
	return tnaming.Replicate(*args)

@deprecated
def tnaming_Substitute(*args):
	return tnaming.Substitute(*args)

@deprecated
def tnaming_SubstituteSShape(*args):
	return tnaming.SubstituteSShape(*args)

@deprecated
def tnaming_Transform(*args):
	return tnaming.Transform(*args)

@deprecated
def tnaming_Update(*args):
	return tnaming.Update(*args)

@deprecated
def TNaming_CopyShape_CopyTool(*args):
	return TNaming_CopyShape.CopyTool(*args)

@deprecated
def TNaming_CopyShape_Translate(*args):
	return TNaming_CopyShape.Translate(*args)

@deprecated
def TNaming_CopyShape_Translate(*args):
	return TNaming_CopyShape.Translate(*args)

@deprecated
def TNaming_Localizer_FindGenerator(*args):
	return TNaming_Localizer.FindGenerator(*args)

@deprecated
def TNaming_Localizer_FindShapeContext(*args):
	return TNaming_Localizer.FindShapeContext(*args)

@deprecated
def TNaming_Localizer_IsNew(*args):
	return TNaming_Localizer.IsNew(*args)

@deprecated
def TNaming_NamedShape_GetID(*args):
	return TNaming_NamedShape.GetID(*args)

@deprecated
def TNaming_Naming_GetID(*args):
	return TNaming_Naming.GetID(*args)

@deprecated
def TNaming_Naming_Insert(*args):
	return TNaming_Naming.Insert(*args)

@deprecated
def TNaming_Naming_Name(*args):
	return TNaming_Naming.Name(*args)

@deprecated
def TNaming_NamingTool_BuildDescendants(*args):
	return TNaming_NamingTool.BuildDescendants(*args)

@deprecated
def TNaming_NamingTool_CurrentShape(*args):
	return TNaming_NamingTool.CurrentShape(*args)

@deprecated
def TNaming_NamingTool_CurrentShapeFromShape(*args):
	return TNaming_NamingTool.CurrentShapeFromShape(*args)

@deprecated
def TNaming_Selector_IsIdentified(*args):
	return TNaming_Selector.IsIdentified(*args)

@deprecated
def TNaming_Tool_Collect(*args):
	return TNaming_Tool.Collect(*args)

@deprecated
def TNaming_Tool_CurrentNamedShape(*args):
	return TNaming_Tool.CurrentNamedShape(*args)

@deprecated
def TNaming_Tool_CurrentNamedShape(*args):
	return TNaming_Tool.CurrentNamedShape(*args)

@deprecated
def TNaming_Tool_CurrentShape(*args):
	return TNaming_Tool.CurrentShape(*args)

@deprecated
def TNaming_Tool_CurrentShape(*args):
	return TNaming_Tool.CurrentShape(*args)

@deprecated
def TNaming_Tool_FindShape(*args):
	return TNaming_Tool.FindShape(*args)

@deprecated
def TNaming_Tool_GeneratedShape(*args):
	return TNaming_Tool.GeneratedShape(*args)

@deprecated
def TNaming_Tool_GetShape(*args):
	return TNaming_Tool.GetShape(*args)

@deprecated
def TNaming_Tool_HasLabel(*args):
	return TNaming_Tool.HasLabel(*args)

@deprecated
def TNaming_Tool_InitialShape(*args):
	return TNaming_Tool.InitialShape(*args)

@deprecated
def TNaming_Tool_Label(*args):
	return TNaming_Tool.Label(*args)

@deprecated
def TNaming_Tool_NamedShape(*args):
	return TNaming_Tool.NamedShape(*args)

@deprecated
def TNaming_Tool_OriginalShape(*args):
	return TNaming_Tool.OriginalShape(*args)

@deprecated
def TNaming_Tool_ValidUntil(*args):
	return TNaming_Tool.ValidUntil(*args)

@deprecated
def TNaming_UsedShapes_GetID(*args):
	return TNaming_UsedShapes.GetID(*args)

}
