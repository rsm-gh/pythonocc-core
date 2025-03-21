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
%define STEPCONTROLDOCSTRING
"STEPControl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_stepcontrol.html"
%enddef
%module (package="OCC.Core", docstring=STEPCONTROLDOCSTRING) STEPControl


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
#include<STEPControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<StepRepr_module.hxx>
#include<gp_module.hxx>
#include<StepData_module.hxx>
#include<StepGeom_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<StepShape_module.hxx>
#include<TopTools_module.hxx>
#include<XSControl_module.hxx>
#include<IFSelect_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<StepBasic_module.hxx>
#include<Transfer_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Transfer.i
%import Interface.i
%import StepRepr.i
%import gp.i
%import StepData.i
%import StepGeom.i
%import Message.i
%import TopoDS.i
%import StepShape.i
%import TopTools.i
%import XSControl.i
%import IFSelect.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum STEPControl_StepModelType {
	STEPControl_AsIs = 0,
	STEPControl_ManifoldSolidBrep = 1,
	STEPControl_BrepWithVoids = 2,
	STEPControl_FacetedBrep = 3,
	STEPControl_FacetedBrepAndBrepWithVoids = 4,
	STEPControl_ShellBasedSurfaceModel = 5,
	STEPControl_GeometricCurveSet = 6,
	STEPControl_Hybrid = 7,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class STEPControl_StepModelType(IntEnum):
	STEPControl_AsIs = 0
	STEPControl_ManifoldSolidBrep = 1
	STEPControl_BrepWithVoids = 2
	STEPControl_FacetedBrep = 3
	STEPControl_FacetedBrepAndBrepWithVoids = 4
	STEPControl_ShellBasedSurfaceModel = 5
	STEPControl_GeometricCurveSet = 6
	STEPControl_Hybrid = 7
STEPControl_AsIs = STEPControl_StepModelType.STEPControl_AsIs
STEPControl_ManifoldSolidBrep = STEPControl_StepModelType.STEPControl_ManifoldSolidBrep
STEPControl_BrepWithVoids = STEPControl_StepModelType.STEPControl_BrepWithVoids
STEPControl_FacetedBrep = STEPControl_StepModelType.STEPControl_FacetedBrep
STEPControl_FacetedBrepAndBrepWithVoids = STEPControl_StepModelType.STEPControl_FacetedBrepAndBrepWithVoids
STEPControl_ShellBasedSurfaceModel = STEPControl_StepModelType.STEPControl_ShellBasedSurfaceModel
STEPControl_GeometricCurveSet = STEPControl_StepModelType.STEPControl_GeometricCurveSet
STEPControl_Hybrid = STEPControl_StepModelType.STEPControl_Hybrid
};
/* end python proxy for enums */

/* handles */
%wrap_handle(STEPControl_ActorRead)
%wrap_handle(STEPControl_ActorWrite)
%wrap_handle(STEPControl_Controller)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class STEPControl_ActorRead *
******************************/
class STEPControl_ActorRead : public Transfer_ActorOfTransientProcess {
	public:
		/****** STEPControl_ActorRead::STEPControl_ActorRead ******/
		/****** md5 signature: 3db9995490b830cc7f74e7be7a6678ca ******/
		%feature("compactdefaultargs") STEPControl_ActorRead;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
None

Description
-----------
No available documentation.
") STEPControl_ActorRead;
		 STEPControl_ActorRead(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** STEPControl_ActorRead::ComputeSRRWT ******/
		/****** md5 signature: f9ca4b8df5c4dc01a7e3ec56cae60587 ******/
		%feature("compactdefaultargs") ComputeSRRWT;
		%feature("autodoc", "
Parameters
----------
SRR: StepRepr_RepresentationRelationship
TP: Transfer_TransientProcess
Trsf: gp_Trsf
theLocalFactors: StepData_Factors

Return
-------
bool

Description
-----------
Computes transformation defined by given representation_relationship_with_transformation.
") ComputeSRRWT;
		Standard_Boolean ComputeSRRWT(const opencascade::handle<StepRepr_RepresentationRelationship> & SRR, const opencascade::handle<Transfer_TransientProcess> & TP, gp_Trsf & Trsf, const StepData_Factors & theLocalFactors);

		/****** STEPControl_ActorRead::ComputeTransformation ******/
		/****** md5 signature: d6414bb6e98eb222202073d5f4896a57 ******/
		%feature("compactdefaultargs") ComputeTransformation;
		%feature("autodoc", "
Parameters
----------
Origin: StepGeom_Axis2Placement3d
Target: StepGeom_Axis2Placement3d
OrigContext: StepRepr_Representation
TargContext: StepRepr_Representation
TP: Transfer_TransientProcess
Trsf: gp_Trsf
theLocalFactors: StepData_Factors

Return
-------
bool

Description
-----------
Computes transformation defined by two axis placements (in mapped_item or item_defined_transformation) taking into account their representation contexts (i.e. units, which may be different) returns true if transformation is computed and is not an identity.
") ComputeTransformation;
		Standard_Boolean ComputeTransformation(const opencascade::handle<StepGeom_Axis2Placement3d> & Origin, const opencascade::handle<StepGeom_Axis2Placement3d> & Target, const opencascade::handle<StepRepr_Representation> & OrigContext, const opencascade::handle<StepRepr_Representation> & TargContext, const opencascade::handle<Transfer_TransientProcess> & TP, gp_Trsf & Trsf, const StepData_Factors & theLocalFactors);

		/****** STEPControl_ActorRead::PrepareUnits ******/
		/****** md5 signature: 63ce94b1126b9c64ca3da9ab4aa6183a ******/
		%feature("compactdefaultargs") PrepareUnits;
		%feature("autodoc", "
Parameters
----------
rep: StepRepr_Representation
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
Set units and tolerances context by given shaperepresentation.
") PrepareUnits;
		void PrepareUnits(const opencascade::handle<StepRepr_Representation> & rep, const opencascade::handle<Transfer_TransientProcess> & TP, StepData_Factors & theLocalFactors);

		/****** STEPControl_ActorRead::Recognize ******/
		/****** md5 signature: b84cbd6b814e0bcf2e581fe12af7f160 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****** STEPControl_ActorRead::ResetUnits ******/
		/****** md5 signature: 8429c548f4f797bc814f8dd3c5320781 ******/
		%feature("compactdefaultargs") ResetUnits;
		%feature("autodoc", "
Parameters
----------
theModel: StepData_StepModel
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
Reset units and tolerances context to default (mm, radians, read.precision.val, etc.).
") ResetUnits;
		void ResetUnits(opencascade::handle<StepData_StepModel> & theModel, StepData_Factors & theLocalFactors);

		/****** STEPControl_ActorRead::SetModel ******/
		/****** md5 signature: 461c1771a4e752c1a120a7e3b022e295 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Set model.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** STEPControl_ActorRead::Transfer ******/
		/****** md5 signature: e4303fa9409798bd20ec402569b65ae8 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorRead::TransferShape ******/
		/****** md5 signature: b04993c045c693628fd7e63e3bc7af19 ******/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors
isManifold: bool (optional, default to Standard_True)
theUseTrsf: bool (optional, default to Standard_False)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Theusetrsf - special flag for using axis2placement from shaperepresentation for transform root shape.
") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const StepData_Factors & theLocalFactors, const Standard_Boolean isManifold = Standard_True, const Standard_Boolean theUseTrsf = Standard_False, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(STEPControl_ActorRead)

%extend STEPControl_ActorRead {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class STEPControl_ActorWrite *
*******************************/
class STEPControl_ActorWrite : public Transfer_ActorOfFinderProcess {
	public:
		/****** STEPControl_ActorWrite::STEPControl_ActorWrite ******/
		/****** md5 signature: e461b526cacb1525395052610f05dbcc ******/
		%feature("compactdefaultargs") STEPControl_ActorWrite;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPControl_ActorWrite;
		 STEPControl_ActorWrite();

		/****** STEPControl_ActorWrite::GroupMode ******/
		/****** md5 signature: 44598c40a7cf647432e4fecbf49d43ae ******/
		%feature("compactdefaultargs") GroupMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GroupMode;
		Standard_Integer GroupMode();

		/****** STEPControl_ActorWrite::IsAssembly ******/
		/****** md5 signature: 051fbb66b5b9566decb5e8a712f1cb3e ******/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "
Parameters
----------
theModel: StepData_StepModel
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Customizable method to check whether shape s should be written as assembly or not default implementation uses flag groupmode and analyses the shape itself note: this method can modify shape.
") IsAssembly;
		virtual Standard_Boolean IsAssembly(const opencascade::handle<StepData_StepModel> & theModel, TopoDS_Shape & S);

		/****** STEPControl_ActorWrite::Mode ******/
		/****** md5 signature: 017da31d79f3a481eb542e4aaf03f760 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
STEPControl_StepModelType

Description
-----------
No available documentation.
") Mode;
		STEPControl_StepModelType Mode();

		/****** STEPControl_ActorWrite::Recognize ******/
		/****** md5 signature: c8970d8be01e43b4712b350a7b483668 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Transfer_Finder> & start);

		/****** STEPControl_ActorWrite::SetGroupMode ******/
		/****** md5 signature: 0a92ec46366d237b14930d141f0676d4 ******/
		%feature("compactdefaultargs") SetGroupMode;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
None

Description
-----------
No available documentation.
") SetGroupMode;
		void SetGroupMode(const Standard_Integer mode);

		/****** STEPControl_ActorWrite::SetMode ******/
		/****** md5 signature: 4f6cbafbf6ebf4fcc86d459a7cc8d831 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
M: STEPControl_StepModelType

Return
-------
None

Description
-----------
No available documentation.
") SetMode;
		void SetMode(const STEPControl_StepModelType M);

		/****** STEPControl_ActorWrite::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** STEPControl_ActorWrite::Transfer ******/
		/****** md5 signature: de55557a60f11851f77e2ae7fac24dbd ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
FP: Transfer_FinderProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_FinderProcess> & FP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorWrite::TransferCompound ******/
		/****** md5 signature: 9cab98affbe0fb86b9dc56ce1b0bec9d ******/
		%feature("compactdefaultargs") TransferCompound;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") TransferCompound;
		opencascade::handle<Transfer_Binder> TransferCompound(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorWrite::TransferShape ******/
		/****** md5 signature: 228683b2f5c93fe53b041315fdac3204 ******/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors
shapeGroup: TopTools_HSequenceOfShape (optional, default to NULL)
isManifold: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors, const opencascade::handle<TopTools_HSequenceOfShape> & shapeGroup = NULL, const Standard_Boolean isManifold = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorWrite::TransferSubShape ******/
		/****** md5 signature: 56fdc5e8235c5ebcdb511f61cf21dd7b ******/
		%feature("compactdefaultargs") TransferSubShape;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
AX1: StepGeom_Axis2Placement3d
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors
shapeGroup: TopTools_HSequenceOfShape (optional, default to NULL)
isManifold: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") TransferSubShape;
		opencascade::handle<Transfer_Binder> TransferSubShape(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, opencascade::handle<StepGeom_Axis2Placement3d> & AX1, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors, const opencascade::handle<TopTools_HSequenceOfShape> & shapeGroup = NULL, const Standard_Boolean isManifold = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(STEPControl_ActorWrite)

%extend STEPControl_ActorWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class STEPControl_Controller *
*******************************/
class STEPControl_Controller : public XSControl_Controller {
	public:
		/****** STEPControl_Controller::STEPControl_Controller ******/
		/****** md5 signature: ddfea8b4c1fe8de254a503b0b32e5346 ******/
		%feature("compactdefaultargs") STEPControl_Controller;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the use of step norm (the first time) and returns a controller.
") STEPControl_Controller;
		 STEPControl_Controller();

		/****** STEPControl_Controller::ActorRead ******/
		/****** md5 signature: 5ac0aad8bce759b1e8eca4fdc80b538e ******/
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
opencascade::handle<Transfer_ActorOfTransientProcess>

Description
-----------
Returns the actor for read attached to the pair (norm,appli).
") ActorRead;
		opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** STEPControl_Controller::Customise ******/
		/****** md5 signature: 0ba1e38a71954b942c677f3a42125b9f ******/
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
No available documentation.
") Customise;
		virtual void Customise(opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPControl_Controller::Init ******/
		/****** md5 signature: 7a4f426a7cdbf379be5e43123bb3383c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Standard initialisation. it creates a controller for step and records it to various names, available to select it later returns true when done, false if could not be done.
") Init;
		static Standard_Boolean Init();

		/****** STEPControl_Controller::NewModel ******/
		/****** md5 signature: 91513f9ebe9e7d52eca2b6b58f6b9b0a ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates a new empty model ready to receive data of the norm. it is taken from step template model.
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** STEPControl_Controller::TransferWriteShape ******/
		/****** md5 signature: 51f54ac90a57b06cb5da980be6c88b27 ******/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
FP: Transfer_FinderProcess
model: Interface_InterfaceModel
modetrans: int (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Takes one shape and transfers it to the interfacemodel (already created by newmodel for instance) <modeshape> is to be interpreted by each kind of xstepadaptor returns a status: 0 ok 1 no result 2 fail -1 bad modeshape -2 bad model (requires a stepmodel) modeshape: 1 facetted brep, 2 shell, 3 manifold solid.
") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & shape, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%make_alias(STEPControl_Controller)

%extend STEPControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPControl_Reader *
***************************/
class STEPControl_Reader : public XSControl_Reader {
	public:
		/****** STEPControl_Reader::STEPControl_Reader ******/
		/****** md5 signature: ec8685d6b23db12d8dcd11649af265ac ******/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a reader object with an empty step model.
") STEPControl_Reader;
		 STEPControl_Reader();

		/****** STEPControl_Reader::STEPControl_Reader ******/
		/****** md5 signature: 18e78cd90eff01efbd1d8210145bfa01 ******/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a reader for step from an already existing session clears the session if it was not yet set for step.
") STEPControl_Reader;
		 STEPControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** STEPControl_Reader::FileUnits ******/
		/****** md5 signature: 4d122375a27d64900def6c7a2fc54f65 ******/
		%feature("compactdefaultargs") FileUnits;
		%feature("autodoc", "
Parameters
----------
theUnitLengthNames: TColStd_SequenceOfAsciiString
theUnitAngleNames: TColStd_SequenceOfAsciiString
theUnitSolidAngleNames: TColStd_SequenceOfAsciiString

Return
-------
None

Description
-----------
Returns sequence of all unit names for shape representations found in file.
") FileUnits;
		void FileUnits(TColStd_SequenceOfAsciiString & theUnitLengthNames, TColStd_SequenceOfAsciiString & theUnitAngleNames, TColStd_SequenceOfAsciiString & theUnitSolidAngleNames);

		/****** STEPControl_Reader::NbRootsForTransfer ******/
		/****** md5 signature: f207d70f9daf416ec0cdd237b676b8bd ******/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Determines the list of root entities from model which are candidate for a transfer to a shape (type of entities is product).
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****** STEPControl_Reader::ReadFile ******/
		/****** md5 signature: 43e0408ba769e2f8280c3d4118e4dbfe ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
filename: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file and returns the read status zero for a model which compies with the controller.
") ReadFile;
		virtual IFSelect_ReturnStatus ReadFile(Standard_CString filename);

		/****** STEPControl_Reader::ReadFile ******/
		/****** md5 signature: a114cde5b0c55bde8c8d4b7a6791062c ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
filename: str
theParams: StepData_ConfParameters

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file and returns the read status zero for a model which compies with the controller.
") ReadFile;
		IFSelect_ReturnStatus ReadFile(Standard_CString filename, const StepData_ConfParameters & theParams);

		/****** STEPControl_Reader::ReadStream ******/
		/****** md5 signature: 468612e1b7574162a37279817cf6848c ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theName: str
theIStream: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file from stream and returns the read status.
") ReadStream;
		virtual IFSelect_ReturnStatus ReadStream(Standard_CString theName, std::istream & theIStream);

		/****** STEPControl_Reader::SetSystemLengthUnit ******/
		/****** md5 signature: 510dfa5f705479dabe69cd18ff63f186 ******/
		%feature("compactdefaultargs") SetSystemLengthUnit;
		%feature("autodoc", "
Parameters
----------
theLengthUnit: float

Return
-------
None

Description
-----------
Sets system length unit used by transfer process. performs only if a model is not null.
") SetSystemLengthUnit;
		void SetSystemLengthUnit(const Standard_Real theLengthUnit);

		/****** STEPControl_Reader::StepModel ******/
		/****** md5 signature: a19eb8c75fefa8a51a41068202c028ed ******/
		%feature("compactdefaultargs") StepModel;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_StepModel>

Description
-----------
Returns the model as a stepmodel. it can then be consulted (header, product).
") StepModel;
		opencascade::handle<StepData_StepModel> StepModel();

		/****** STEPControl_Reader::SystemLengthUnit ******/
		/****** md5 signature: ea9818137c6810f4cc16c93250327aac ******/
		%feature("compactdefaultargs") SystemLengthUnit;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns system length unit used by transfer process. performs only if a model is not null.
") SystemLengthUnit;
		Standard_Real SystemLengthUnit();

		/****** STEPControl_Reader::TransferRoot ******/
		/****** md5 signature: 6197e07a7cce187793789d26466ddd30 ******/
		%feature("compactdefaultargs") TransferRoot;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a root given its rank in the list of candidate roots default is the first one returns true if a shape has resulted, false else same as inherited transferoneroot, kept for compatibility.
") TransferRoot;
		Standard_Boolean TransferRoot(const Standard_Integer num = 1, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend STEPControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPControl_Writer *
***************************/
class STEPControl_Writer {
	public:
		/****** STEPControl_Writer::STEPControl_Writer ******/
		/****** md5 signature: 6f4a8c36769e033687d99d18003d22b7 ******/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer from scratch.
") STEPControl_Writer;
		 STEPControl_Writer();

		/****** STEPControl_Writer::STEPControl_Writer ******/
		/****** md5 signature: 85192cc9fbbf82fa72f2bfe176891574 ******/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a writer from an already existing session if <scratch> is true (d), clears already recorded data.
") STEPControl_Writer;
		 STEPControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** STEPControl_Writer::Model ******/
		/****** md5 signature: f4f5279446847a999cd427bb3e3501ee ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "
Parameters
----------
newone: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<StepData_StepModel>

Description
-----------
Returns the produced model. produces a new one if not yet done or if <newone> is true this method allows for instance to edit product or header data before writing.
") Model;
		opencascade::handle<StepData_StepModel> Model(const Standard_Boolean newone = Standard_False);

		/****** STEPControl_Writer::PrintStatsTransfer ******/
		/****** md5 signature: 148fec90ff7b063449e9624a36399cda ******/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "
Parameters
----------
what: int
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Displays the statistics for the last translation. what defines the kind of statistics that are displayed: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. mode is used according to the use of what. if what is 0, mode is ignored. if what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of step entities in a step model, - 1 gives the number, identifier, type and result type for each step entity and/or its status (fail, warning, etc.), - 2 gives maximum information for each step entity (i.e. checks), - 3 gives the number of entities by the type of a step entity, - 4 gives the number of of step entities per result type and/or status, - 5 gives the number of pairs (step or result type and status), - 6 gives the number of pairs (step or result type and status) and the list of entity numbers in the step model.
") PrintStatsTransfer;
		void PrintStatsTransfer(const Standard_Integer what, const Standard_Integer mode = 0);

		/****** STEPControl_Writer::SetTolerance ******/
		/****** md5 signature: fc6e9b0c16aebccb1a4d05571a3e6ef6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
Sets a length-measure value that will be written to uncertainty-measure-with-unit when the next shape is translated.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****** STEPControl_Writer::SetWS ******/
		/****** md5 signature: 74ebce3f94d695bdeb4915fb004d07d2 ******/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets a specific session to <self>.
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** STEPControl_Writer::Transfer ******/
		/****** md5 signature: c4591ce3df70e3804f3be41e86c86eae ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
mode: STEPControl_StepModelType
compgraph: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Translates shape sh to a step entity. mode defines the step entity type to be output: - stepcontrolstd_asis translates a shape to its highest possible step representation. - stepcontrolstd_manifoldsolidbrep translates a shape to a step manifold_solid_brep or brep_with_voids entity. - stepcontrolstd_facetedbrep translates a shape into a step faceted_brep entity. - stepcontrolstd_shellbasedsurfacemodel translates a shape into a step shell_based_surface_model entity. - stepcontrolstd_geometriccurveset translates a shape into a step geometric_curve_set entity.
") Transfer;
		IFSelect_ReturnStatus Transfer(const TopoDS_Shape & sh, const STEPControl_StepModelType mode, const Standard_Boolean compgraph = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_Writer::Transfer ******/
		/****** md5 signature: f0cf09d91d7e8768a38076b515c98fcc ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
mode: STEPControl_StepModelType
theParams: StepData_ConfParameters
compgraph: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Translates shape sh to a step entity.
") Transfer;
		IFSelect_ReturnStatus Transfer(const TopoDS_Shape & sh, const STEPControl_StepModelType mode, const StepData_ConfParameters & theParams, const Standard_Boolean compgraph = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_Writer::UnsetTolerance ******/
		/****** md5 signature: 2d51d628282b502d22281b67c393ff77 ******/
		%feature("compactdefaultargs") UnsetTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets the tolerance formerly forced by settolerance.
") UnsetTolerance;
		void UnsetTolerance();

		/****** STEPControl_Writer::WS ******/
		/****** md5 signature: 4d866376b023ba3185e62899810cc121 ******/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_WorkSession>

Description
-----------
Returns the session used in <self>.
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

		/****** STEPControl_Writer::Write ******/
		/****** md5 signature: 14544d6ececf228a5871ef6afa0279ae ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theFileName: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Writes a step model in the file identified by filename.
") Write;
		IFSelect_ReturnStatus Write(Standard_CString theFileName);

		/****** STEPControl_Writer::WriteStream ******/
		/****** md5 signature: ce65ef735ad27a9e0fa213e50b058382 ******/
		%feature("compactdefaultargs") WriteStream;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOStream: std::ostream

Description
-----------
Writes a step model in the std::ostream.
") WriteStream;
		IFSelect_ReturnStatus WriteStream(std::ostream &OutValue);

};


%extend STEPControl_Writer {
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
def STEPControl_Controller_Init(*args):
	return STEPControl_Controller.Init(*args)

}
