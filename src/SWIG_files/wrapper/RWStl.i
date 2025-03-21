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
%define RWSTLDOCSTRING
"RWStl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_rwstl.html"
%enddef
%module (package="OCC.Core", docstring=RWSTLDOCSTRING) RWStl


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
#include<RWStl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<OSD_module.hxx>
#include<Message_module.hxx>
#include<Poly_module.hxx>
#include<DE_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<TopoDS_module.hxx>
#include<TShort_module.hxx>
#include<Bnd_module.hxx>
#include<IFSelect_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<MoniTool_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import OSD.i
%import Message.i
%import Poly.i
%import DE.i
%import TColStd.i
%import TCollection.i
%import TDocStd.i
%import XSControl.i
%import TopoDS.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************
* class RWStl *
**************/
%rename(rwstl) RWStl;
class RWStl {
	public:
		/****** RWStl::ReadAscii ******/
		/****** md5 signature: a4082bfc34c1229bc435c44951da6960 ******/
		%feature("compactdefaultargs") ReadAscii;
		%feature("autodoc", "
Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read triangulation from an ascii stl file in case of error, returns null handle.
") ReadAscii;
		static opencascade::handle<Poly_Triangulation> ReadAscii(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadBinary ******/
		/****** md5 signature: 715829aa852a6829b2792b5ff41018e6 ******/
		%feature("compactdefaultargs") ReadBinary;
		%feature("autodoc", "
Parameters
----------
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read triangulation from a binary stl file in case of error, returns null handle.
") ReadBinary;
		static opencascade::handle<Poly_Triangulation> ReadBinary(const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: 64c7a7ea1e7b324b70672cedadb30bca ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified stl file and returns its content as triangulation. in case of error, returns null handle.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(const OSD_Path & theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: 742addde06afd9d8130198556696e689 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: str
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified stl file and returns its content as triangulation. in case of error, returns null handle.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(Standard_CString theFile, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: 752aa6341824937d3d7f5d58f0ca70e0 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: str
theMergeAngle: float
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Read specified stl file and returns its content as triangulation. @param[in] thefile file path to read @param[in] themergeangle maximum angle in radians between triangles to merge equal nodes; m_pi/2 means ignore angle @param[in] theprogress progress indicator return result triangulation or null in case of error.
") ReadFile;
		static opencascade::handle<Poly_Triangulation> ReadFile(Standard_CString theFile, const Standard_Real theMergeAngle, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::ReadFile ******/
		/****** md5 signature: c6a3a71adb575f87eef05ec5d74e495a ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
theFile: str
theMergeAngle: float
theTriangList: Poly_Triangulation
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
None

Description
-----------
Read specified stl file and fills triangulation list for multi-domain case. @param[in] thefile file path to read @param[in] themergeangle maximum angle in radians between triangles to merge equal nodes; m_pi/2 means ignore angle @param[out] thetrianglist triangulation list for multi-domain case @param[in] theprogress progress indicator.
") ReadFile;
		static void ReadFile(Standard_CString theFile, const Standard_Real theMergeAngle, NCollection_Sequence<opencascade::handle<Poly_Triangulation> > & theTriangList, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::WriteAscii ******/
		/****** md5 signature: 8cb39ba5b5c9e3b27f4e1ec1bd12de9c ******/
		%feature("compactdefaultargs") WriteAscii;
		%feature("autodoc", "
Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Write the meshing in a file following the ascii format of an stl file. returns false if the cannot be opened;.
") WriteAscii;
		static Standard_Boolean WriteAscii(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl::WriteBinary ******/
		/****** md5 signature: 3a7e5b47e0a20ed5065a6f3593a90ac4 ******/
		%feature("compactdefaultargs") WriteBinary;
		%feature("autodoc", "
Parameters
----------
theMesh: Poly_Triangulation
thePath: OSD_Path
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Write triangulation to binary stl file. binary format of an stl file. returns false if the cannot be opened;.
") WriteBinary;
		static Standard_Boolean WriteBinary(const opencascade::handle<Poly_Triangulation> & theMesh, const OSD_Path & thePath, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend RWStl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class RWStl_ConfigurationNode *
********************************/
class RWStl_ConfigurationNode : public DE_ConfigurationNode {
	public:
		class RWStl_InternalSection {};
		RWStl_InternalSection InternalParameters;
		/****** RWStl_ConfigurationNode::RWStl_ConfigurationNode ******/
		/****** md5 signature: d26af6e8353fcb13772912acf02ff7f2 ******/
		%feature("compactdefaultargs") RWStl_ConfigurationNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes all field by default.
") RWStl_ConfigurationNode;
		 RWStl_ConfigurationNode();

		/****** RWStl_ConfigurationNode::RWStl_ConfigurationNode ******/
		/****** md5 signature: 6922c706819602fe0b180cba8a90d054 ******/
		%feature("compactdefaultargs") RWStl_ConfigurationNode;
		%feature("autodoc", "
Parameters
----------
theNode: RWStl_ConfigurationNode

Return
-------
None

Description
-----------
Copies values of all fields @param[in] thenode object to copy.
") RWStl_ConfigurationNode;
		 RWStl_ConfigurationNode(const opencascade::handle<RWStl_ConfigurationNode> & theNode);

		/****** RWStl_ConfigurationNode::BuildProvider ******/
		/****** md5 signature: 732af66bf7bddbff6fa20c9629ec35a7 ******/
		%feature("compactdefaultargs") BuildProvider;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_Provider>

Description
-----------
Creates new provider for the own format return new created provider.
") BuildProvider;
		virtual opencascade::handle<DE_Provider> BuildProvider();

		/****** RWStl_ConfigurationNode::CheckContent ******/
		/****** md5 signature: 2a770b41fb754bfe0ef0260c549f4919 ******/
		%feature("compactdefaultargs") CheckContent;
		%feature("autodoc", "
Parameters
----------
theBuffer: NCollection_Buffer

Return
-------
bool

Description
-----------
Checks the file content to verify a format @param[in] thebuffer read stream buffer to check content return standard_true if file is supported by a current provider.
") CheckContent;
		virtual bool CheckContent(const opencascade::handle<NCollection_Buffer> & theBuffer);

		/****** RWStl_ConfigurationNode::Copy ******/
		/****** md5 signature: 4559608ebdab2961e97de40732291656 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<DE_ConfigurationNode>

Description
-----------
Copies values of all fields return new object with the same field values.
") Copy;
		virtual opencascade::handle<DE_ConfigurationNode> Copy();

		/****** RWStl_ConfigurationNode::GetExtensions ******/
		/****** md5 signature: a58fd9c22a501a38d695eed6406f94bb ******/
		%feature("compactdefaultargs") GetExtensions;
		%feature("autodoc", "Return
-------
TColStd_ListOfAsciiString

Description
-----------
Gets list of supported file extensions return list of extensions.
") GetExtensions;
		virtual TColStd_ListOfAsciiString GetExtensions();

		/****** RWStl_ConfigurationNode::GetFormat ******/
		/****** md5 signature: 3a7e97ac1131aefae2f717c160d31ca9 ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets cad format name of associated provider return provider cad format.
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****** RWStl_ConfigurationNode::GetVendor ******/
		/****** md5 signature: dec3ae3842639c0f3f7b51f11891135d ******/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider return provider's vendor name.
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****** RWStl_ConfigurationNode::IsExportSupported ******/
		/****** md5 signature: 7b5a27f839d52b595deb06dd28df5230 ******/
		%feature("compactdefaultargs") IsExportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the export supporting return true if export is supported.
") IsExportSupported;
		virtual bool IsExportSupported();

		/****** RWStl_ConfigurationNode::IsImportSupported ******/
		/****** md5 signature: 54f008ecb7de4dd5dcaeefb3d1d06abc ******/
		%feature("compactdefaultargs") IsImportSupported;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks the import supporting return true if import is supported.
") IsImportSupported;
		virtual bool IsImportSupported();

		/****** RWStl_ConfigurationNode::Load ******/
		/****** md5 signature: 994009254510d81a5f0f9a326a356850 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theResource: DE_ConfigurationContext

Return
-------
bool

Description
-----------
Updates values according the resource @param[in] theresource input resource to use return true if theresource loading has ended correctly.
") Load;
		virtual bool Load(const opencascade::handle<DE_ConfigurationContext> & theResource);

		/****** RWStl_ConfigurationNode::Save ******/
		/****** md5 signature: d6023e92d8565d8e19b0fc2ce7e2a326 ******/
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Writes configuration to the string return result resource string.
") Save;
		virtual TCollection_AsciiString Save();

};


%extend RWStl_ConfigurationNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class RWStl_Provider *
***********************/
class RWStl_Provider : public DE_Provider {
	public:
		/****** RWStl_Provider::RWStl_Provider ******/
		/****** md5 signature: 20621107f2f8b09b43296b222bf5c8bf ******/
		%feature("compactdefaultargs") RWStl_Provider;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor configure translation process with global configuration.
") RWStl_Provider;
		 RWStl_Provider();

		/****** RWStl_Provider::RWStl_Provider ******/
		/****** md5 signature: d142e250a518828dbec2e4ea13799236 ******/
		%feature("compactdefaultargs") RWStl_Provider;
		%feature("autodoc", "
Parameters
----------
theNode: DE_ConfigurationNode

Return
-------
None

Description
-----------
Configure translation process @param[in] thenode object to copy.
") RWStl_Provider;
		 RWStl_Provider(const opencascade::handle<DE_ConfigurationNode> & theNode);

		/****** RWStl_Provider::GetFormat ******/
		/****** md5 signature: 3a7e97ac1131aefae2f717c160d31ca9 ******/
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets cad format name of associated provider return provider cad format.
") GetFormat;
		virtual TCollection_AsciiString GetFormat();

		/****** RWStl_Provider::GetVendor ******/
		/****** md5 signature: dec3ae3842639c0f3f7b51f11891135d ******/
		%feature("compactdefaultargs") GetVendor;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Gets provider's vendor name of associated provider return provider's vendor name.
") GetVendor;
		virtual TCollection_AsciiString GetVendor();

		/****** RWStl_Provider::Read ******/
		/****** md5 signature: 16f3a93c0e43348246bb95e8cba55754 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param[in] thews current work session @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl_Provider::Read ******/
		/****** md5 signature: 80a7afaed992615710ff04f2244e58af ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] thedocument document to save result @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl_Provider::Read ******/
		/****** md5 signature: 160b9f8794c7839a593c81d8887e0933 ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param[in] thews current work session @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl_Provider::Read ******/
		/****** md5 signature: 3008ec75ea1c7dea0f617472523275db ******/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Reads a cad file, according internal configuration @param[in] thepath path to the import cad file @param[out] theshape shape to save result @param theprogress[in] progress indicator return true if read operation has ended correctly.
") Read;
		virtual Standard_Boolean Read(TCollection_AsciiString thePath, TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl_Provider::Write ******/
		/****** md5 signature: 93e394221df3c4afc5c4770a04336d3a ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param[in] thews current work session @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl_Provider::Write ******/
		/****** md5 signature: f2990aef87163af009a5f37c83657fdd ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theDocument: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] thedocument document to export @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const opencascade::handle<TDocStd_Document> & theDocument, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl_Provider::Write ******/
		/****** md5 signature: 6079000f342ac160d056ffb0a9360302 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theWS: XSControl_WorkSession
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param[in] thews current work session @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, opencascade::handle<XSControl_WorkSession> & theWS, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** RWStl_Provider::Write ******/
		/****** md5 signature: 3b6e60d4eb25fa5818fa82e89a4fc295 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
thePath: str
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Writes a cad file, according internal configuration @param[in] thepath path to the export cad file @param[out] theshape shape to export @param theprogress[in] progress indicator return true if write operation has ended correctly.
") Write;
		virtual Standard_Boolean Write(TCollection_AsciiString thePath, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend RWStl_Provider {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class RWStl_Reader *
*********************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class RWStl_Reader:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def rwstl_ReadAscii(*args):
	return rwstl.ReadAscii(*args)

@deprecated
def rwstl_ReadBinary(*args):
	return rwstl.ReadBinary(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_ReadFile(*args):
	return rwstl.ReadFile(*args)

@deprecated
def rwstl_WriteAscii(*args):
	return rwstl.WriteAscii(*args)

@deprecated
def rwstl_WriteBinary(*args):
	return rwstl.WriteBinary(*args)

}
