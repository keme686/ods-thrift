namespace java org.asam.ods
namespace cpp org.asam.ods
namespace py ods
namespace csharp Asam.ods

/**
* The ASAM ODS data types.
*    DT_xxx  Basic data types.
*    DS_xxx  Sequence of basic data type.
*    ||
*    |+- T == Type, S == Sequences.
*    +-- D == Datatype.
*/
enum DataType {
   DT_UNKNOWN,           // Unknown datatype.
   DT_STRING,            // String.
   DT_SHORT,             // Short value (16 bit).
   DT_FLOAT,             // Float value (32 bit).
   DT_BOOLEAN,           // Boolean value.
   DT_BYTE,              // Byte value (8 bit).
   DT_LONG,              // Long value (32 bit).
   DT_DOUBLE,            // Double precision float value (64 bit).
   DT_LONGLONG,          // LongLong value (64 bit).
   DT_ID,                // LongLong value (64 bit). Not used. DT_LONGLONG is
                         // used instead.
   DT_DATE,              // Date. Meaning: YYYYMMDDhhmmsslllcccnnn....   -
                         // YYYY = year, required.   - MM = month, optional.  
                         // - DD =  day, optional.   - hh =  hour, optional.  
                         // - mm =  minute, optional.   - ss =  second,
                         // optional.   - lll =  millisec, optional, not
                         // supported by Oracle timestamp.   - ccc =  microse,
                         // optional, not supported by Oracle timestamp.   -
                         // nnn =  nanosec, optional, not supported by Oracle
                         // timestamp.
   DT_BYTESTR,           // Bytestream.
   DT_BLOB,              // Blob.
   DT_COMPLEX,           // Complex value (32 bit each part).
   DT_DCOMPLEX,          // Complex value (64 bit each part).
   DS_STRING,            // String sequence.
   DS_SHORT,             // Short sequence.
   DS_FLOAT,             // Float sequence.
   DS_BOOLEAN,           // Boolean sequene.
   DS_BYTE,              // Byte sequence.
   DS_LONG,              // Long sequence.
   DS_DOUBLE,            // Double sequence.
   DS_LONGLONG,          // Longlong sequence.
   DS_COMPLEX,           // Complex sequence.
   DS_DCOMPLEX,          // Double complex sequence.
   DS_ID,                // LongLong sequence. Not used. DS_LONGLONG is used
                         // instead.
   DS_DATE,              // Date sequence.
   DS_BYTESTR,           // Bytestream sequence.
   DT_EXTERNALREFERENCE, // External reference.
   DS_EXTERNALREFERENCE, // Sequence of external reference.
   DT_ENUM,              // The enumeration datatype.
   DS_ENUM               // The enumeration sequence datatype.
};


// Datatype definitions (T_xxx).
typedef string     T_STRING;
typedef bool       T_BOOLEAN;
typedef i16        T_SHORT;
typedef double     T_FLOAT; //Thrift does not support float data type, its parent type(double) is used
typedef byte       T_BYTE; //NEED REVIEW - because T_BYTE is unsigned 8-bit type but byte in thrift is signed
typedef i64        T_LONG;
typedef double     T_DOUBLE;
typedef T_STRING   T_DATE;
typedef binary     T_BLOB;

// Sequence definitions (S_xxx).
typedef list<T_BYTE> T_BYTESTR;
typedef list<T_BOOLEAN> S_BOOLEAN;
typedef list<T_BYTE> S_BYTE;
typedef list<T_DOUBLE> S_DOUBLE;
typedef list<T_FLOAT> S_FLOAT;
typedef list<T_LONG> S_LONG;
typedef list<T_SHORT> S_SHORT;
typedef list<T_STRING> S_STRING;
typedef list<T_DATE> S_DATE;
typedef list<T_BYTESTR> S_BYTESTR;

typedef list<S_STRING> SS_STRING;
typedef list<S_SHORT> SS_SHORT;
typedef list<S_FLOAT> SS_FLOAT;
typedef list<S_BOOLEAN> SS_BOOLEAN;
typedef list<S_BYTE> SS_BYTE;
typedef list<S_LONG> SS_LONG;
typedef list<S_DOUBLE> SS_DOUBLE;
typedef list<S_DATE> SS_DATE;
typedef list<S_BYTESTR> SS_BYTESTR;

typedef list<T_BLOB> S_BLOB;


/**
* The ASAM ODS 64 bit integer structure.  This type is represented in the
* datatype enumeration by DT_LONGLONG.
*/
struct T_LONGLONG {
   T_LONG high; // The most significant 32 bits of the 64 bit value.
   T_LONG low;  // The least significant 32 bits of the 64 bit value.
};

/**
* The ASAM ODS complex data structure.  This type is represented in the
* datatype enumeration by DT_COMPLEX.
*/
struct T_COMPLEX {
   T_FLOAT r; // The real part of the complex number.
   T_FLOAT i; // The imaginary part of the complex number.
};

/**
* The ASAM ODS double-precision complex data structure. This type is
* represented in the datatype enumeration by DT_DCOMPLEX.
*/
struct T_DCOMPLEX {
   T_DOUBLE r; // The real part of the double precision complex number.
   T_DOUBLE i; // The imaginary part of the double precision complex number.
};

/**
* The description of a reference object, the reference object can be an
* internal ASAM ODS object or an external object. This type is
* represented in the datatype enumeration by DT_EXTERNALREFERENCE.
*/
struct T_ExternalReference {
   T_STRING description; // Description of the external reference.
   T_STRING mimeType;    // MIME-type of the external object.
   T_STRING location;    // Location of the external reference. (asam path or
                         // URL)
};


typedef list<T_COMPLEX> S_COMPLEX;
typedef list<T_DCOMPLEX> S_DCOMPLEX;
typedef list<T_LONGLONG> S_LONGLONG;
typedef list<S_LONGLONG> SS_LONGLONG;
typedef list<S_COMPLEX> SS_COMPLEX;
typedef list<S_DCOMPLEX> SS_DCOMPLEX;
typedef list<T_ExternalReference> S_ExternalReference;
typedef list<S_ExternalReference> SS_ExternalReference;


struct AoNameMap{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: DT_STRING entity_name,
	14: DS_STRING alias_names,
	15: optional list<AoFile> ao_file_children,
	16: list<AoAttributeMap> attribute_mapping,
	17: AoEnvironment environment,
}

struct AoAttributeMap{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: DT_STRING attribute_name,
	14: DS_STRING alias_names,
	15: optional list<AoFile> ao_file_children,
	16: AoNameMap name_mapping,
}

struct AoParameter{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: DT_ENUM parameter_datatype,
	14: DT_STRING pvalue,
	15: optional list<AoFile> ao_file_children,
	16: optional AoUnit unit,
	17: AoParameterSet parameter_set,
}

struct AoParameterSet{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: optional list<AoFile> ao_file_children,
	14: optional list<AoParameter> parameters,
}
struct AoEnvironment{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DS_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: optional DT_STRING meaning_of_aliases,
	14: optional DT_LONG max_test_level,
	15: optional DT_STRING base_model_version,
	16: optional DT_STRING application_model_type,
	17: optional DT_STRING application_model_version,
	18: optional DT_STRING timezone,
	19: optional list<AoFile> ao_file_children,
	20: optional list<AoTest> tests,
	21: optional list<AoUnitUnderTest> uuts,
	22: optional list<AoTestEquipment> equipments,
	23: optional list<AoTestSequence> sequences,
	24: optional list<AoNameMap> entity_mapping,
}


struct AoTest{
	1: DS_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: optional AoEnvironment environment,
	14: optional list<AoFile> ao_file_children,
	//15: list<AoSubTest/AoMeasurement> children, 
}

struct AoSubTest{
	1: DS_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: optional list<AoFile> ao_file_children,
	//14: list<AoSubTest/AoMeasurement> children,
	//15: AoSubTest/AoTest parent_test,
}

struct AoMeasurement{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: optional DT_DATE measurement_begin,
	14: optional DT_DATE measurement_end,
	15: optional DT_DATE ao_values_accessed,
	16: optional DT_STRING ao_values_accessed_by,
	17: optional DT_DATE ao_values_modified,
	18: optional DT_STRING ao_values_modified_by,
	19: optional DT_ENUM ao_storagetype,
	20: optional DT_LONGLONG ao_mea_size,
	21: optional list<AoFile> ao_file_children,
	//22: AoTest/AoSubTest test,
	23: AoMeasurementQuantity measurement_quantities,
	24: list<AoSubmatrix> submatrices,
	//25: optional list<AoUnitUnderTest/AoUnitUnderTestPart> units_under_test,
	//26: optional list<AoTestSequence/AoTestSequencePart> sequences,
	//27: optional list<AoTestEquipment/AoTestEquipmentPart> equipments,
}

struct AoMeasurementQuantity{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: 
}
struct AoUserGroup{
	1: DT_STRING name,
	2: DT_LONGLONG id,
	3: optional DT_STRING version,
	4: optional DT_STRING description,
	5: optional DT_DATE version_date,
	6: optional DT_STRING mime_type,
	7: optional DT_EXTERNALREFERENCE external_references,
	8: optional DT_LONGLONG objecttype,
	9: optional DT_DATE ao_created,
	10: optional DT_STRING ao_created_by,
	11: optional DT_DATE ao_last_modified,
	12: optional DT_STRING ao_last_modified_by,
	13: DT_SHORT superuser_flag,
	14: optional list<AoFile> ao_file_children,
	15: list<AoUser> users,	
}