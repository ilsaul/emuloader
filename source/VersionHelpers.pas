unit versionhelpers;
{
/******************************************************************
*                                                                 *
*  VersionHelpers.h -- This module defines helper functions to    *
*                      promote version check with proper          *
*                      comparisons.                               *
*                                                                 *
*  Copyright (c) Microsoft Corp.  All rights reserved.            *
*                                                                 *
******************************************************************/

Header translation copyright (c) 2014 - J. Peter Mugaas

Written: Feb 19, 2014 - J. Peter Mugaas <jpmugaas@suddenlink.net>

Copyright
Portions of this software are Copyright (c) 2014, J. Peter Mugaas - http://www.jpetermugaas.com

License terms described in LICENSE.TXT
}
interface

{$ALIGN ON}
{$MINENUMSIZE 4}
uses Windows;

// Delphi 4
{$IFDEF VER120}
  {$DEFINE DCC}
  {$DEFINE VCL_40}
  {$DEFINE DELPHI_4}
{$ENDIF}

// C++Builder 4
{$IFDEF VER125}
  {$DEFINE DCC}
  {$DEFINE VCL_40}
  {$DEFINE CBUILDER_4}
{$ENDIF}

// Delphi & C++Builder 5
{$IFDEF VER130}
  {$DEFINE DCC}
  {$DEFINE VCL_50}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_5}
  {$ELSE}
    {$DEFINE DELPHI_5}
  {$ENDIF}
{$ENDIF}

//Delphi & C++Builder 6
{$IFDEF VER140}
  {$DEFINE DCC}
  {$DEFINE VCL_60}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_6}
  {$ELSE}
    {$DEFINE DELPHI_6}
  {$ENDIF}
{$ENDIF}

//Delphi 7
{$IFDEF VER150}
  {$DEFINE DCC}
  {$DEFINE VCL_70}
  {$DEFINE DELPHI_7} // there was no C++ Builder 7
{$ENDIF}

//Delphi 8
{$IFDEF VER160}
  {$DEFINE DCC}
  {$DEFINE VCL_80}
  {$DEFINE DELPHI_8} // there was no C++ Builder 8
{$ENDIF}

//Delphi 2005
{$IFDEF VER170}
  {$DEFINE DCC}
  {$DEFINE VCL_2005}
  {$DEFINE DELPHI_2005} // there was no C++Builder 2005
{$ENDIF}

// NOTE: CodeGear decided to make Highlander be a non-breaking release
// (no interface changes, thus fully backwards compatible without any
// end user code changes), so VER180 applies to both BDS 2006 and
// Highlander prior to the release of RAD Studio 2007.  Use VER185 to
// identify Highlanger specifically.

//Delphi & C++Builder 2006
//Delphi & C++Builder 2007 (Highlander)
{$IFDEF VER180}
  {$DEFINE DCC}
  {$DEFINE VCL_2006}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_2006}
  {$ELSE}
    {$DEFINE DELPHI_2006}
  {$ENDIF}
{$ENDIF}

//Delphi & C++Builder 2007 (Highlander)
{$IFDEF VER185}
  {$DEFINE DCC}
  {$UNDEF VCL_2006}
  {$DEFINE VCL_2007}
  {$IFDEF CBUILDER}
    {$UNDEF CBUILDER_2006}
    {$DEFINE CBUILDER_2007}
  {$ELSE}
    {$UNDEF DELPHI_2006}
    {$DEFINE DELPHI_2007}
  {$ENDIF}
{$ENDIF}

// BDS 2007 NET personality uses VER190 instead of 185.
//Delphi .NET 2007
{$IFDEF VER190}
  {$DEFINE DCC}
  {$IFDEF CIL}
    //Delphi 2007
    {$DEFINE VCL_2007}
    {$DEFINE DELPHI_2007}
  {$ENDIF}
{$ENDIF}

//Delphi & C++Builder 2009 (Tiburon)
{$IFDEF VER200}
  {$DEFINE DCC}
  {$DEFINE VCL_2009}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_2009}
  {$ELSE}
    {$DEFINE DELPHI_2009}
  {$ENDIF}
{$ENDIF}

//Delphi & C++Builder 2010 (Weaver)
{$IFDEF VER210}
  {$DEFINE DCC}
  {$DEFINE VCL_2010}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_2010}
  {$ELSE}
    {$DEFINE DELPHI_2010}
  {$ENDIF}
{$ENDIF}

//Delphi & C++Builder XE (Fulcrum)
{$IFDEF VER220}
//REMOVE DCC DEFINE after the next Fulcrum beta.
//It will be defined there.
  {$IFNDEF DCC}
    {$DEFINE DCC}
  {$ENDIF}
  {$DEFINE VCL_XE}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE}
  {$ELSE}
    {$DEFINE DELPHI_XE}
  {$ENDIF}
{$ENDIF}

// DCC is now defined by the Delphi compiler starting in XE2

//Delphi & CBuilder XE2 (Pulsar)
{$IFDEF VER230}
  {$DEFINE VCL_XE2}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE2}
  {$ELSE}
    {$DEFINE DELPHI_XE2}
  {$ENDIF}
{$ENDIF}

//Delphi & CBuilder XE3 (Waterdragon)
//Delphi & CBuilder XE3.5 (Quintessence - early betas only)
{$IFDEF VER240}
  {$DEFINE VCL_XE3}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE3}
  {$ELSE}
    {$DEFINE DELPHI_XE3}
  {$ENDIF}
{$ENDIF}

//Delphi & CBuilder XE4 (Quintessence)
{$IFDEF VER250}
  {$UNDEF VCL_XE3}
  {$DEFINE VCL_XE4}
  {$IFDEF CBUILDER}
    {$UNDEF CBUILDER_XE3}
    {$DEFINE CBUILDER_XE4}
  {$ELSE}
    {$UNDEF DELPHI_XE3}
    {$DEFINE DELPHI_XE4}
  {$ENDIF}
{$ENDIF}

//Delphi & CBuilder XE5 (Zephyr)
{$IFDEF VER260}
  {$DEFINE VCL_XE5}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE5}
  {$ELSE}
    {$DEFINE DELPHI_XE5}
  {$ENDIF}
{$ENDIF}

//Delphi & CBuilder AppMethod
//AppMethod is just XE5 for mobile only, VCL is removed
{$IFDEF VER265}
  {$DEFINE VCL_XE5}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE5}
  {$ELSE}
    {$DEFINE DELPHI_XE5}
  {$ENDIF}
{$ENDIF}

//Delphi & CBuilder XE6 (Proteus)
{$IFDEF VER270}
  {$DEFINE VCL_XE6}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE6}
  {$ELSE}
    {$DEFINE DELPHI_XE6}
  {$ENDIF}
{$ENDIF}

//Delphi & CBuilder XE7 (Carpathia)
{$IFDEF VER280}
  {$DEFINE VCL_XE7}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE7}
  {$ELSE}
    {$DEFINE DELPHI_XE7}
  {$ENDIF}
{$ENDIF}

//Delphi & CBuilder XE8 (Elbrus)
{$IFDEF VER290}
  {$DEFINE VCL_XE8}
  {$IFDEF CBUILDER}
    {$DEFINE CBUILDER_XE8}
  {$ELSE}
    {$DEFINE DELPHI_XE8}
  {$ENDIF}
{$ENDIF}

// Delphi.NET
// Covers D8+
{$IFDEF CIL}
  // Platform specific conditional. Used for platform specific code.
  {$DEFINE DOTNET}
  {$DEFINE STRING_IS_UNICODE}
  {$DEFINE STRING_IS_IMMUTABLE}
{$ENDIF}

// FPC (2+)

{$IFDEF FPC}
  // TODO: In FreePascal 4.2.0+, a Delphi-like UnicodeString type is supported.
  // However, String/(P)Char do not map to UnicodeString/(P)WideChar unless
  // either {$MODE DelphiUnicode} or {$MODESWITCH UnicodeStrings} is used.
  // We should consider enabling one of them so Indy uses the same Unicode logic
  // in Delphi 2009+ and FreePascal 4.2.0+ and reduces IFDEFs (in particular,
  // STRING_UNICODE_MISMATCH, see further below).  However, FreePascal's RTL
  // is largely not UnicodeString-enabled yet...
  {$MODE Delphi}
  //note that we may need further defines for widget types depending on
  //what we do and what platforms we support in FPC.
  //I'll let Marco think about that one.
  {$IFDEF UNIX}
    {$DEFINE USE_BASEUNIX}
    {$IFDEF LINUX}
      //In Linux for I386, you can choose between a Kylix-libc API or
      //the standard RTL Unix API.  Just pass -dKYLIXCOMPAT to the FPC compiler.
      //I will see what I can do about the Makefile.
      {$IFDEF KYLIXCOMPAT}
        {$IFDEF CPUI386}
          {$UNDEF USE_BASEUNIX}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
    {$IFDEF USE_BASEUNIX}
      {$UNDEF KYLIXCOMPAT}
    {$ENDIF}
  {$ENDIF}

  // FPC_FULLVERSION was added in FPC 2.2.4
  // Have to use Declared() or else Delphi compiler chokes, since it
  // evaluates $IF statements before $IFDEF statements...

  {$MACRO ON} // must be on in order to use versioning macros
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20701)}
    {$DEFINE FPC_2_7_1_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20604)}
    {$DEFINE FPC_2_6_4_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20600)}
    {$DEFINE FPC_2_6_0_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20404)}
    {$DEFINE FPC_2_4_4_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20402)}
    {$DEFINE FPC_2_4_2_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20400)}
    {$DEFINE FPC_2_4_0_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20204)}
    {$DEFINE FPC_2_2_4_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20202)}
    {$DEFINE FPC_2_2_2_OR_ABOVE}
  {$IFEND}
  {$IF DECLARED(FPC_FULLVERSION) AND (FPC_FULLVERSION >= 20105)}
    {$DEFINE FPC_2_1_5_OR_ABOVE}
  {$IFEND}

  // just in case
  {$IFDEF FPC_2_7_1}
    {$DEFINE FPC_2_7_1_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_6_4}
    {$DEFINE FPC_2_6_4_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_6_0}
    {$DEFINE FPC_2_6_0_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_4_4}
    {$DEFINE FPC_2_4_4_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_4_2}
    {$DEFINE FPC_2_4_2_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_4_0}
    {$DEFINE FPC_2_4_0_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_2_4}
    {$DEFINE FPC_2_2_4_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_2_2}
    {$DEFINE FPC_2_2_2_OR_ABOVE}
  {$ENDIF}
  {$IFDEF FPC_2_1_5}
    {$DEFINE FPC_2_1_5_OR_ABOVE}
  {$ENDIF}

  {$IFDEF FPC_2_7_1_OR_ABOVE}
    {$DEFINE FPC_2_6_4_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_6_4}
      {$DEFINE FPC_2_6_4_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_6_4_OR_ABOVE}
    {$DEFINE FPC_2_6_0_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_6_0}
      {$DEFINE FPC_2_6_0_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_6_0_OR_ABOVE}
    {$DEFINE FPC_2_4_4_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_4_4}
      {$DEFINE FPC_2_4_4_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_4_4_OR_ABOVE}
    {$DEFINE FPC_2_4_2_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_4_2}
      {$DEFINE FPC_2_4_2_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_4_2_OR_ABOVE}
    {$DEFINE FPC_2_4_0_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_4_0}
      {$DEFINE FPC_2_4_0_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_4_0_OR_ABOVE}
    {$DEFINE FPC_2_2_4_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_2_4}
      {$DEFINE FPC_2_2_4_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_2_4_OR_ABOVE}
    {$DEFINE FPC_2_2_2_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_2_2}
      {$DEFINE FPC_2_2_2_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_2_2_OR_ABOVE}
    {$DEFINE FPC_2_2_0_OR_ABOVE}
  {$ELSE}
    {$IFDEF VER2_2}
      {$DEFINE FPC_2_2_0_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {$IFDEF FPC_2_2_0_OR_ABOVE}
    {$DEFINE FPC_2_1_5_OR_ABOVE}
  {$ELSE}
    {$IFDEF FPC_2_1_5}
      {$DEFINE FPC_2_1_5_OR_ABOVE}
    {$ENDIF}
  {$ENDIF}

  {.$IFDEF FPC_2_7_1_OR_ABOVE}
    // support for RawByteString and UnicodeString
    {.$DEFINE VCL_2009}
    {.$DEFINE DELPHI_2009}
  {.$ELSE}
    {$DEFINE VCL_70}
    {$DEFINE DELPHI_7}
  {.$ENDIF}
{$ENDIF}

// end FPC

{$IFDEF VCL_XE8}
  {$DEFINE VCL_XE8_OR_ABOVE}
{$ENDIF}

{$IFDEF VCL_XE8_OR_ABOVE}
  {$DEFINE VCL_XE7_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_XE7}
    {$DEFINE VCL_XE7_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE7_OR_ABOVE}
  {$DEFINE VCL_XE6_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_XE6}
    {$DEFINE VCL_XE6_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE6_OR_ABOVE}
  {$DEFINE VCL_XE5_OR_ABOVE}
  {$DEFINE VCL_XE5_UPDATE2_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_XE5}
    {$DEFINE VCL_XE5_OR_ABOVE}
    // TODO: figure out how to detect this version
    {.$DEFINE VCL_XE5_UPDATE2_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE5_OR_ABOVE}
  {$DEFINE VCL_XE4_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_XE4}
    {$DEFINE VCL_XE4_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE4_OR_ABOVE}
  {$DEFINE VCL_XE3_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_XE3}
    {$DEFINE VCL_XE3_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE3_OR_ABOVE}
  {$DEFINE VCL_XE2_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_XE2}
    {$DEFINE VCL_XE2_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE2_OR_ABOVE}
  {$DEFINE VCL_XE_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_XE}
    {$DEFINE VCL_XE_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE_OR_ABOVE}
  {$DEFINE VCL_2010_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_2010}
    {$DEFINE VCL_2010_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2010_OR_ABOVE}
  {$DEFINE VCL_2009_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_2009}
    {$DEFINE VCL_2009_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2009_OR_ABOVE}
  {$DEFINE VCL_2007_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_2007}
    {$DEFINE VCL_2007_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2007_OR_ABOVE}
  {$DEFINE VCL_2006_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_2006}
    {$DEFINE VCL_2006_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2006_OR_ABOVE}
  {$DEFINE VCL_2005_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_2005}
    {$DEFINE VCL_2005_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2005_OR_ABOVE}
  {$DEFINE VCL_8_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_80}
    {$DEFINE VCL_8_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_8_OR_ABOVE}
  {$DEFINE VCL_7_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_70}
    {$DEFINE VCL_7_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_7_OR_ABOVE}
  {$DEFINE VCL_6_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_60}
    {$DEFINE VCL_6_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_6_OR_ABOVE}
  {$DEFINE VCL_5_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_50}
    {$DEFINE VCL_5_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_5_OR_ABOVE}
  {$DEFINE VCL_4_OR_ABOVE}
{$ELSE}
  {$IFDEF VCL_40}
    {$DEFINE VCL_4_OR_ABOVE}
  {$ENDIF}
{$ENDIF}

// Normalize Delphi compiler defines to match FPC for consistency:
//
// CPU32 - any 32-bit CPU
// CPU64 - any 64-bit CPU
// WINDOWS - any Windows platform (32-bit, 64-bit, CE)
// WIN32 - Windows 32-bit
// WIN64 - Windows 64-bit
// WINCE - Windows CE
//
// Consult the "Free Pascal Programmer's Guide", Appendix G for the complete
// list of defines that are used. Do not work on this unless you understand
// what the FreePascal developers are doing.  Not only do you have to
// descriminate with operating systems, but also with chip architectures
// are well.
//
// DCC Pulsar+ define the following values:
// ASSEMBLER
// DCC
// CONDITIONALEXPRESSIONS
// NATIVECODE
// UNICODE
// MACOS
// MACOS32
// MACOS64
// MSWINDOWS
// WIN32
// WIN64
// LINUX
// POSIX
// POSIX32
// CPU386
// CPUX86
// CPUX64
//
// Kylix defines the following values:
// LINUX
// (others??)
//

{$IFNDEF FPC}
  // TODO: We need to use ENDIAN_BIG for big endian chip architectures,
  // such as 680x0, PowerPC, Sparc, and MIPS, once DCC supports them,
  // provided it does not already define its own ENDIAN values by then...
  {$DEFINE ENDIAN_LITTLE}
  {$IFNDEF VCL_6_OR_ABOVE}
    {$DEFINE MSWINDOWS}
  {$ENDIF}
  {$IFDEF MSWINDOWS}
    {$DEFINE WINDOWS}
  {$ENDIF}
  // TODO: map Pulsar's non-Windows platform defines...
  {$IFDEF VCL_XE2_OR_ABOVE}
    {$IFDEF CPU386}
      //any 32-bit CPU
      {$DEFINE CPU32}
      //Intel 386 compatible chip architecture
      {$DEFINE CPUI386}
    {$ENDIF}
    {$IFDEF CPUX86}
      {$DEFINE CPU32}
    {$ENDIF}
    {$IFDEF CPUX64}
      //any 64-bit CPU
      {$DEFINE CPU64}
      //AMD64 compatible chip architecture
      {$DEFINE CPUX86_64}  //historical name for AMD64
      {$DEFINE CPUAMD64}
    {$ENDIF}
  {$ELSE}
    {$IFNDEF DOTNET}
      {$IFNDEF KYLIX}
        {$DEFINE I386}
      {$ENDIF}
    {$ENDIF}
    {$DEFINE CPU32}
  {$ENDIF}
{$ENDIF}

{$IFDEF DOTNET}
  //differences in DotNET Framework versions.
  {$IFDEF VCL_2007_OR_ABOVE}
    {$DEFINE DOTNET_2}
    {$DEFINE DOTNET_2_OR_ABOVE}
  {$ELSE}
    {$DEFINE DOTNET_1_1}
  {$ENDIF}
  {$DEFINE DOTNET_1_1_OR_ABOVE}
  // Extra include used in D7 for testing. Remove later when all comps are
  // ported. Used to selectively exclude non ported parts. Allowed in places
  // IFDEFs are otherwise not permitted.
  {$DEFINE DOTNET_EXCLUDE}
{$ENDIF}

// Check for available features

{$IFDEF CBUILDER}
  // When generating a C++ HPP file, if a class has no explicit constructor
  // defined and contains compiler-managed members (xxxString, TDateTime,
  // Variant, DelphiInterface, etc), the HPP will contain a forwarding
  // inline constructor that implicitally initializes those managed members,
  // which will overwrite any non-default initializations performed inside
  // of InitComponent() overrides! In this situation, the workaround is to
  // define an explicit constructor that forwards to the base class constructor
  // manually.
  {$DEFINE WORKAROUND_INLINE_CONSTRUCTORS}
{$ENDIF}

{$IFDEF VCL_5_OR_ABOVE}
  {$IFNDEF FPC}
    {$IFNDEF KYLIX}
      {$DEFINE HAS_RemoveFreeNotification}
    {$ENDIF}
  {$ENDIF}
  {$DEFINE HAS_GetObjectProp}
  {$DEFINE HAS_TObjectList}
{$ENDIF}

{$IFDEF VCL_6_OR_ABOVE}
  {$DEFINE HAS_PCardinal}
  {$DEFINE HAS_PByte}
  {$DEFINE HAS_PWord}
  {$DEFINE HAS_PPointer}
  {$DEFINE HAS_TList_Assign}
  {$DEFINE HAS_sLineBreak}
  {$DEFINE HAS_RaiseLastOSError}
  {$DEFINE HAS_SysUtils_IncludeExcludeTrailingPathDelimiter}
  {$DEFINE HAS_SysUtils_DirectoryExists}
  {$DEFINE HAS_UNIT_DateUtils}
  {$DEFINE HAS_UNIT_StrUtils}
  {$DEFINE HAS_UNIT_Types}
  {$DEFINE HAS_TryStrToInt}
  {$DEFINE HAS_TryStrToInt64}
  {$DEFINE HAS_TryEncodeDate}
  {$DEFINE HAS_TryEncodeTime}
  {$DEFINE HAS_ENUM_ELEMENT_VALUES}
  {$IFNDEF FPC}
    {$DEFINE HAS_IInterface}
    {$DEFINE HAS_TSelectionEditor}
    {$DEFINE HAS_TStringList_CaseSensitive}
    {$IFNDEF KYLIX}
      {$DEFINE HAS_DEPRECATED}
      {$DEFINE HAS_SYMBOL_PLATFORM}
      {$DEFINE HAS_UNIT_PLATFORM}
      {$IFDEF VCL_60}
        // Delphi 6 has an annoying bug that if a class method is declared as
        // deprecated, the compiler will emit a "symbol is deprecated" warning
        // on the method's implementation!  So we will have to wrap implementations
        // of deprecated methods with {$WARN SYMBOL_DEPRECATED OFF} directives
        // to disable that warning.
        {$DEFINE DEPRECATED_IMPL_BUG}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
  {$IFNDEF DOTNET}
    //Widget defines are omitted in .NET
    {$DEFINE VCL_60_PLUS}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_7_OR_ABOVE}
  {$IFNDEF FPC}
    {$DEFINE HAS_UInt64}
    {$DEFINE HAS_NAMED_THREADS}
    {$DEFINE HAS_TStrings_ValueFromIndex}
  {$ENDIF}
  {$DEFINE HAS_TFormatSettings}
  {$DEFINE HAS_PosEx}
  {$IFNDEF VCL_70}
    // not implemented in D7
    {$DEFINE HAS_STATIC_TThread_Queue}
  {$ENDIF}
  {$IFNDEF CIL}
    {$IFNDEF VCL_80}
      // not implemented in D8 or .NET
      {$DEFINE HAS_STATIC_TThread_Synchronize}
    {$ENDIF}
  {$ENDIF}
{$ELSE}
  {$IFDEF CBUILDER_6}
    {$DEFINE HAS_NAMED_THREADS}
  {$ENDIF}
{$ENDIF}

{$IFNDEF VCL_2005_OR_ABOVE}
  {$IFDEF DCC}
    {$DEFINE HAS_InterlockedCompareExchange_Pointers}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2006_OR_ABOVE}
  {$DEFINE USE_INLINE}
  {$DEFINE HAS_2PARAM_FileAge}
  {$DEFINE HAS_System_RegisterExpectedMemoryLeak}
  {$IFNDEF FREE_ON_FINAL}
    {$IFNDEF DOTNET}
      {$DEFINE REGISTER_EXPECTED_MEMORY_LEAK}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2007_OR_ABOVE}
  {$IFNDEF CBUILDER_2007}
    // class properties are broken in C++Builder 2007, causing AVs at compile-time
    {$DEFINE HAS_CLASSPROPERTIES}
  {$ENDIF}
  // Native(U)Int exist but are buggy, so do not use them yet
  {.$DEFINE HAS_NativeInt}
  {.$DEFINE HAS_NativeUInt}
  {$DEFINE HAS_StrToInt64Def}
  {$DEFINE HAS_DWORD_PTR}
  {$DEFINE HAS_ULONG_PTR}
  {$DEFINE HAS_ULONGLONG}
  {$DEFINE HAS_PGUID}
  {$DEFINE HAS_PPAnsiChar}
  {$DEFINE HAS_CurrentYear}
  {$IFNDEF DOTNET}
    {$DEFINE HAS_TIMEUNITS}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_2009_OR_ABOVE}
  {$IFNDEF DOTNET}
    {$DEFINE STRING_IS_UNICODE}
    {$DEFINE HAS_UnicodeString}
    {$DEFINE HAS_TEncoding}
    {$DEFINE HAS_TCharacter}
    {$DEFINE HAS_InterlockedCompareExchangePointer}
    {$DEFINE HAS_WIDE_TCharArray}
    {$DEFINE HAS_UNIT_AnsiStrings}
    {$DEFINE HAS_PUInt64}
    {$IFDEF VCL_2009}
      // TODO: need to differentiate between RTM and Update 1
      // FmtStr() is broken in RTM but was fixed in Update 1
      {$DEFINE BROKEN_FmtStr}
    {$ENDIF}
  {$ENDIF}
  {$DEFINE HAS_CLASSVARS}
  {$DEFINE HAS_DEPRECATED_MSG}
  {$DEFINE HAS_TBytes}
  // Native(U)Int are still buggy, so do not use them yet
  {.$DEFINE HAS_NativeInt}
  {.$DEFINE HAS_NativeUInt}
  {$DEFINE HAS_UINT8}
  {$DEFINE HAS_UINT32}
{$ENDIF}

{$IFDEF VCL_2010_OR_ABOVE}
  {$DEFINE HAS_CLASSCONSTRUCTOR}
  {$DEFINE HAS_CLASSDESTRUCTOR}
  {$DEFINE HAS_DELAYLOAD}
  {$DEFINE HAS_TThread_NameThreadForDebugging}
  {$DEFINE DEPRECATED_TThread_SuspendResume}
  // Native(U)Int are finally ok to use now
  {$DEFINE HAS_NativeInt}
  {$DEFINE HAS_NativeUInt}
  {$DEFINE HAS_USHORT}
{$ENDIF}

{$IFDEF VCL_XE_OR_ABOVE}
  {$DEFINE HAS_TFormatSettings_Object}
  {$DEFINE HAS_LocaleCharsFromUnicode}
  {$DEFINE HAS_UnicodeFromLocaleChars}
  {$DEFINE HAS_PVOID}
  {$DEFINE HAS_ULONG64}
  {$IFNDEF DOTNET}
    {$DEFINE HAS_TInterlocked}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE2_OR_ABOVE}
  {$DEFINE HAS_SIZE_T}
  {$DEFINE HAS_LONG}
  {$DEFINE HAS_ComponentPlatformsAttribute}
  {$DEFINE HAS_ComponentPlatformsAttribute_Win32}
  {$DEFINE HAS_ComponentPlatformsAttribute_Win64}
  {$DEFINE HAS_ComponentPlatformsAttribute_OSX32}
  {$DEFINE HAS_DIRECTIVE_WARN_DEFAULT}
{$ENDIF}

{$IFDEF VCL_XE3_OR_ABOVE}
  {$DEFINE HAS_DIRECTIVE_ZEROBASEDSTRINGS}
  {$DEFINE HAS_SysUtils_TStringHelper}
  {$IFDEF NEXTGEN}
    {$DEFINE DCC_NEXTGEN}
    {$DEFINE HAS_MarshaledAString}
    {$DEFINE USE_MARSHALLED_PTRS}
    {$IFDEF AUTOREFCOUNT}
      {$DEFINE USE_OBJECT_ARC}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

{$IFDEF VCL_XE4_OR_ABOVE}
  {$DEFINE HAS_AnsiStrings_StrPLCopy}
  {$DEFINE HAS_AnsiStrings_StrLen}
  {$DEFINE HAS_Character_TCharHelper}
  {$DEFINE HAS_ComponentPlatformsAttribute_iOS_Simulator}
  {$DEFINE HAS_ComponentPlatformsAttribute_iOS_Device}
  // technically, these are present in XE4, but they are not used yet
  {.$DEFINE HAS_ComponentPlatformsAttribute_Android}
  {.$DEFINE HAS_ComponentPlatformsAttribute_Linux32}
  {.$DEFINE HAS_ComponentPlatformsAttribute_WinNX32}
{$ENDIF}

{$IFDEF VCL_XE5_OR_ABOVE}
  {$DEFINE HAS_ComponentPlatformsAttribute_Android}
{$ENDIF}

{$IFDEF VCL_XE5_UPDATE2_OR_ABOVE}
  {$DEFINE HAS_DIRECTIVE_HPPEMIT_LINKUNIT}
{$ENDIF}

{$IFDEF VCL_XE7_OR_ABOVE}
  {$DEFINE HAS_TNetEncoding}
{$ENDIF}

{$IFDEF FPC}
  {$DEFINE USE_INLINE}
  {$DEFINE USE_CLASSINLINE}
  {$DEFINE USE_TBitBtn} //use Bit Buttons instead of Buttons
  {$DEFINE FPC_REINTRODUCE_BUG}
  {$DEFINE FPC_CIRCULAR_BUG}
  {$DEFINE NO_REDECLARE}
  {$DEFINE BYTE_COMPARE_SETS}
  {$DEFINE HAS_QWord} // TODO: when was QWord introduced?
  {$DEFINE HAS_PQWord} // TODO: when was PQWord introduced?
  {$IFDEF FPC_2_1_5_OR_ABOVE}
    {$DEFINE HAS_UInt64}
    {.$DEFINE HAS_PUInt64} // TODO: is this defined?
  {$ENDIF}
  {$IFDEF FPC_2_2_0_OR_ABOVE}
    {$DEFINE HAS_InterlockedCompareExchange_Pointers}
  {$ENDIF}
  {$IFDEF FPC_2_2_2_OR_ABOVE}
    {$DEFINE HAS_SharedPrefix}
  {$ENDIF}
  {$IFDEF FPC_2_2_4_OR_ABOVE}
    {$DEFINE HAS_SIZE_T}
  {$ENDIF}
  {$DEFINE HAS_PtrInt}
  {$DEFINE HAS_PtrUInt}
  {$DEFINE HAS_PGUID}
  {$DEFINE HAS_LPGUID}
  {$DEFINE HAS_PPAnsiChar}
  {$DEFINE HAS_ENUM_ELEMENT_VALUES}
  {$IFDEF WINDOWS}
    {$DEFINE HAS_ULONG_PTR}
    {.$DEFINE HAS_ULONGLONG} // TODO: is this defined?
  {$ENDIF}
  {$DEFINE HAS_UNIT_ctypes}
  {$DEFINE HAS_sLineBreak}
  {$IFDEF FPC_HAS_UNICODESTRING}
    {$DEFINE HAS_UnicodeString}
  {$ELSE}
    {$IFDEF FPC_2_4_0_OR_ABOVE}
      {$DEFINE HAS_UnicodeString}
    {$ENDIF}
  {$ENDIF}
  {$IFDEF FPC_2_4_4_OR_ABOVE}
    {$DEFINE DEPRECATED_TThread_SuspendResume}
    {$DEFINE HAS_DEPRECATED} // TODO: when was deprecated introduced?
    {$DEFINE HAS_DEPRECATED_MSG}
  {$ENDIF}
  {$IFDEF FPC_2_6_0_OR_ABOVE}
    {$DEFINE HAS_NativeInt}
    {$DEFINE HAS_NativeUInt}
  {$ENDIF}
  {$IFDEF FPC_2_7_1_OR_ABOVE}
    {$DEFINE HAS_UINT8}
    {$DEFINE HAS_UINT32}
  {$ENDIF}
  {$IFDEF FPC_UNICODESTRINGS}
    {$DEFINE STRING_IS_UNICODE}
  {$ENDIF}
{$ENDIF}
{$IFDEF WIN32}
  {$DEFINE WIN32_OR_WIN64}
{$ENDIF}
{$IFDEF WIN64}
  {$DEFINE WIN32_OR_WIN64}
{$ENDIF}

// High-performance counters are not reliable on multi-core systems, and have
// been known to cause problems with TIdIOHandler.ReadLn() timeouts in Windows
// XP SP3, both 32-bit and 64-bit.  Refer to these discussions for more info:
//
// http://www.virtualdub.org/blog/pivot/entry.php?id=106
// http://blogs.msdn.com/oldnewthing/archive/2008/09/08/8931563.aspx
//
// Do not enable thus unless you know it will work correctly on your systems!
{$IFDEF WINDOWS}
  {.$DEFINE USE_HI_PERF_COUNTER_FOR_TICKS}
{$ENDIF}

{$UNDEF STREAM_SIZE_64}
{$IFDEF FPC}
  {$DEFINE STREAM_SIZE_64}
{$ELSE}
  {$IFDEF VCL_6_OR_ABOVE}
    {$DEFINE STREAM_SIZE_64}
  {$ENDIF}
{$ENDIF}

{$IFNDEF FREE_ON_FINAL}
  {$IFNDEF REGISTER_EXPECTED_MEMORY_LEAK}
    {$IFDEF USE_FASTMM4}
      {$DEFINE REGISTER_EXPECTED_MEMORY_LEAK}
    {$ENDIF}
    {$IFDEF USE_MADEXCEPT}
      {$DEFINE REGISTER_EXPECTED_MEMORY_LEAK}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

{$IFDEF REGISTER_EXPECTED_MEMORY_LEAK}
  {$IFDEF DOTNET}
    {$UNDEF REGISTER_EXPECTED_MEMORY_LEAK}
  {$ENDIF}
  {$IFDEF VCL_CROSS_COMPILE}
    // RLebeau: should this be enabled for Windows, at least?
    {$UNDEF REGISTER_EXPECTED_MEMORY_LEAK}
  {$ENDIF}
{$ENDIF}

{$IFDEF DEBUG}
  {$UNDEF USE_INLINE}
{$ENDIF}

// RLebeau 9/5/2013: it would take a lot of work to re-write Indy to support
// both 0-based and 1-based string indexing, so we'll just turn off 0-based
// indexing for now...
{$IFDEF HAS_DIRECTIVE_ZEROBASEDSTRINGS}
  {$ZEROBASEDSTRINGS OFF}
{$ENDIF}
type
  //this is necessary because Borland still doesn't support QWord
  // (unsigned 64bit type).
  {$IFNDEF HAS_QWord}
  qword = {$IFDEF HAS_UInt64}UInt64{$ELSE}Int64{$ENDIF};
  {$ENDIF}
  {$IFNDEF HAS_LPOID}
    {$EXTERNALSYM LPVOID}
  LPVOID = Pointer;
  {$ENDIF}
  {$IFNDEF DWORD_PTR}
   {$EXTERNALSYM DWORD_PTR}
   {$IFDEF WIN32}
  DWORD_PTR = Cardinal;
    {$ENDIF}
    {$IFDEF WIN64}
  DWORD_PTR = QWord;
    {$ENDIF}
  {$ENDIF}
    {$EXTERNALSYM DWORDLONG}
  DWORDLONG = QWord;
    {$EXTERNALSYM ULONGLONG}
  ULONGLONG = QWord;
  {$EXTERNALSYM _OSVERSIONINFOEXA}
  _OSVERSIONINFOEXA = record
    dwOSVersionInfoSize : DWORD;
    dwMajorVersion : DWORD;
    dwMinorVersion : DWORD;
    dwBuildNumber : DWORD;
    dwPlatformId : DWORD;
    szCSDVersion : Array[0..127] of AnsiChar;
    wServicePackMajor : WORD;
    wServicePackMinor : WORD;
    wSuiteMask : WORD;
    wProductType : Byte;
    wReserved : Byte;
  end;
  {$EXTERNALSYM OSVERSIONINFOEXA}
  OSVERSIONINFOEXA = _OSVERSIONINFOEXA;
  {$EXTERNALSYM TOSVersionInfoExA}
  TOSVersionInfoExA = OSVERSIONINFOEXA;
  {$EXTERNALSYM POSVERSIONINFOEXA}
  POSVERSIONINFOEXA = ^OSVERSIONINFOEXA;
  {$EXTERNALSYM LPOSVERSIONINFOEXA}
  LPOSVERSIONINFOEXA = ^OSVERSIONINFOEXA;

  {$EXTERNALSYM _OSVERSIONINFOEXW}
  _OSVERSIONINFOEXW = record
    dwOSVersionInfoSize : DWORD;
    dwMajorVersion : DWORD;
    dwMinorVersion : DWORD;
    dwBuildNumber : DWORD;
    dwPlatformId : DWORD;
    szCSDVersion : Array[0..127] of WideChar;
    wServicePackMajor : WORD;
    wServicePackMinor : WORD;
    wSuiteMask : WORD;
    wProductType : Byte;
    wReserved : Byte;
  end;
  {$EXTERNALSYM OSVERSIONINFOEXA}
  OSVERSIONINFOEXW = _OSVERSIONINFOEXW;
  {$EXTERNALSYM TOSVersionInfoExW}
  TOSVersionInfoExW = OSVERSIONINFOEXW;
  {$EXTERNALSYM POSVERSIONINFOEXW}
  POSVERSIONINFOEXW = ^OSVERSIONINFOEXW;
  {$EXTERNALSYM LPOSVERSIONINFOEXW}
  LPOSVERSIONINFOEXW = ^OSVERSIONINFOEXW;
  {$EXTERNALSYM _SYSTEM_INFO}
  _SYSTEM_INFO = record
    case Integer of
    0 : (dwOemId : DWORD);  // Obsolete field...do not use
    1 : (wProcessorArchitecture : WORD;
         wReserved : WORD;
         dwPageSize : DWORD;
         lpMinimumApplicationAddress : LPVOID;
         lpMaximumApplicationAddress : LPVOID;
         dwActiveProcessorMask : DWORD_PTR;
         dwNumberOfProcessors : DWORD;
         dwProcessorType : DWORD;
         dwAllocationGranularity : DWORD;
         wProcessorLevel : WORD;
         wProcessorRevision : WORD);
  end;
  {$EXTERNALSYM SYSTEM_INFO}
  SYSTEM_INFO = _SYSTEM_INFO;
  {$EXTERNALSYM LPSYSTEM_INFO}
  LPSYSTEM_INFO = ^SYSTEM_INFO;

type
  {$EXTERNALSYM LPFN_GetProductInfo}
  LPFN_GetProductInfo = function(const dwOSMajorVersion : DWORD;
    const dwOSMinorVersion : DWORD;
    const dwSpMajorVersion : DWORD;
    const dwSpMinorVersion : DWORD;
    var pdwReturnedProductType : DWORD) : BOOL stdcall;
  {$EXTERNALSYM LPFN_GetSystemInfo}
  LPFN_GetSystemInfo = procedure(out lpSystemInfo :  versionhelpers._SYSTEM_INFO) stdcall;
  {$EXTERNALSYM LPFN_GetNativeSystemInfo }
  LPFN_GetNativeSystemInfo = procedure(out lpSystemInfo :  versionhelpers._SYSTEM_INFO) stdcall;
  {$EXTERNALSYM LPFN_VerifyVersionInfoW}
  LPFN_VerifyVersionInfoW = function(var VersionInformation : versionhelpers.OSVERSIONINFOEXW;
    const dwTypeMask : DWORD;
    const dwlConditionMask : versionhelpers.DWORDLONG) : BOOL stdcall;
  {$EXTERNALSYM LPFN_VerSetConditionMask}
  LPFN_VerSetConditionMask = function(const ConditionMask : versionhelpers.ULONGLONG;
   const TypeMask : DWORD;
   const Condition : BYTE ) : versionhelpers.ULONGLONG stdcall;
  {$EXTERNALSYM LPFN_IsWow64Process}
  LPFN_IsWow64Process = function(hProcess : THANDLE; out Wow64Process : BOOL) : BOOL stdcall;

var
  {$EXTERNALSYM GetSystemInfo}
  GetSystemInfo : LPFN_GetSystemInfo = nil;
  {$EXTERNALSYM GetNativeSystemInfo}
  GetNativeSystemInfo : LPFN_GetNativeSystemInfo = nil;
  {$EXTERNALSYM IsWow64Process}
  IsWow64Process : LPFN_IsWow64Process = nil;
  {$EXTERNALSYM LPFN_VerifyVersionInfoW}
  VerifyVersionInfoW : LPFN_VerifyVersionInfoW = nil;
  {$EXTERNALSYM VerSetConditionMask}
  VerSetConditionMask : LPFN_VerSetConditionMask = nil;
  {$EXTERNALSYM GetProductInfo}
  GetProductInfo : LPFN_GetProductInfo = nil;

{$EXTERNALSYM IsWindowsVersionOrGreater}
function IsWindowsVersionOrGreater(const wMajorVersion, wMinorVersion, wServicePackMajor : Word) : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindowsXPOrGreater}
function IsWindowsXPOrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindowsXPSP1OrGreater}
function IsWindowsXPSP1OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindowsXPSP2OrGreater}
function IsWindowsXPSP2OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindowsXPSP3OrGreater}
function IsWindowsXPSP3OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindowsVistaOrGreater}
function IsWindowsVistaOrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindowsVistaSP1OrGreater}
function IsWindowsVistaSP1OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindowsVistaSP2OrGreater}
function IsWindowsVistaSP2OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindows7OrGreater}
function IsWindows7OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindows7SP1OrGreater}
function IsWindows7SP1OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindows8OrGreater}
function IsWindows8OrGreater: Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindows8Point1OrGreater}
function IsWindows8Point1OrGreater: Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}
{$EXTERNALSYM IsWindows10OrGreater}
function IsWindows10OrGreater : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}

{$EXTERNALSYM IsWindowsServer}
function IsWindowsServer : Boolean; {$IFDEF USE_INLINE}inline;{$ENDIF}

const
//from winnt.h
  {$EXTERNALSYM VER_EQUAL}
  VER_EQUAL                       = 1;
  {$EXTERNALSYM VER_GREATER}
  VER_GREATER                     = 2;
  {$EXTERNALSYM VER_GREATER_EQUAL}
  VER_GREATER_EQUAL               = 3;
  {$EXTERNALSYM VER_LESS}
  VER_LESS                        = 4;
  {$EXTERNALSYM VER_LESS_EQUAL}
  VER_LESS_EQUAL                  = 5;
  {$EXTERNALSYM VER_AND}
  VER_AND                         = 6;
  {$EXTERNALSYM VER_OR}
  VER_OR                          = 7;

  {$EXTERNALSYM VER_CONDITION_MASK}
  VER_CONDITION_MASK              = 7;
  {$EXTERNALSYM VER_NUM_BITS_PER_CONDITION_MASK}
  VER_NUM_BITS_PER_CONDITION_MASK = 3;

//
// RtlVerifyVersionInfo() type mask bits
//
  {$EXTERNALSYM VER_MINORVERSION}
  VER_MINORVERSION                = $0000001;
  {$EXTERNALSYM VER_MAJORVERSION}
  VER_MAJORVERSION                = $0000002;
  {$EXTERNALSYM VER_BUILDNUMBER}
  VER_BUILDNUMBER                 = $0000004;
  {$EXTERNALSYM VER_PLATFORMID}
  VER_PLATFORMID                  = $0000008;
  {$EXTERNALSYM VER_SERVICEPACKMINOR}
  VER_SERVICEPACKMINOR            = $0000010;
  {$EXTERNALSYM VER_SERVICEPACKMAJOR}
  VER_SERVICEPACKMAJOR            = $0000020;
  {$EXTERNALSYM VER_SUITENAME}
  VER_SUITENAME                   = $0000040;
  {$EXTERNALSYM VER_PRODUCT_TYPE}
  VER_PRODUCT_TYPE                = $0000080;

//
// RtlVerifyVersionInfo() os product type values
//

  {$EXTERNALSYM  VER_NT_WORKSTATION}
  VER_NT_WORKSTATION              = $0000001;
  {$EXTERNALSYM  VER_NT_DOMAIN_CONTROLLER}
  VER_NT_DOMAIN_CONTROLLER        = $0000002;
  {$EXTERNALSYM VER_NT_SERVER}
  VER_NT_SERVER                   = $0000003;

  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_INTEL}
  PROCESSOR_ARCHITECTURE_INTEL           = 0;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_MIPS}
  PROCESSOR_ARCHITECTURE_MIPS            = 1;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_ALPHA}
  PROCESSOR_ARCHITECTURE_ALPHA           = 2;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_PPC}
  PROCESSOR_ARCHITECTURE_PPC             = 3;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_SHX}
  PROCESSOR_ARCHITECTURE_SHX             = 4;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_ARM}
  PROCESSOR_ARCHITECTURE_ARM             = 5;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_IA64}
  PROCESSOR_ARCHITECTURE_IA64            = 6;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_ALPHA64}
  PROCESSOR_ARCHITECTURE_ALPHA64         = 7;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_MSIL}
  PROCESSOR_ARCHITECTURE_MSIL            = 8;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_AMD64}
  PROCESSOR_ARCHITECTURE_AMD64           = 9;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_IA32_ON_WIN64}
  PROCESSOR_ARCHITECTURE_IA32_ON_WIN64   = 10;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_UNKNOWN}
  PROCESSOR_ARCHITECTURE_UNKNOWN         = $FFFF;

  //ntdef.h

  {$EXTERNALSYM VER_SERVER_NT}
  VER_SERVER_NT                       = $80000000;
  {$EXTERNALSYM VER_WORKSTATION_NT}
  VER_WORKSTATION_NT                  = $40000000;
  {$EXTERNALSYM VER_SUITE_SMALLBUSINESS}
  VER_SUITE_SMALLBUSINESS             = $00000001;
  {$EXTERNALSYM VER_SUITE_ENTERPRISE}
  VER_SUITE_ENTERPRISE                = $00000002;
  {$EXTERNALSYM VER_SUITE_BACKOFFICE}
  VER_SUITE_BACKOFFICE                = $00000004;
  {$EXTERNALSYM VER_SUITE_COMMUNICATIONS}
  VER_SUITE_COMMUNICATIONS            = $00000008;
  {$EXTERNALSYM VER_SUITE_TERMINAL}
  VER_SUITE_TERMINAL                  = $00000010;
  {$EXTERNALSYM VER_SUITE_SMALLBUSINESS_RESTRICTED}
  VER_SUITE_SMALLBUSINESS_RESTRICTED  = $00000020;
  {$EXTERNALSYM VER_SUITE_EMBEDDEDNT}
  VER_SUITE_EMBEDDEDNT                = $00000040;
  {$EXTERNALSYM VER_SUITE_DATACENTER}
  VER_SUITE_DATACENTER                = $00000080;
  {$EXTERNALSYM VER_SUITE_SINGLEUSERTS}
  VER_SUITE_SINGLEUSERTS              = $00000100;
  {$EXTERNALSYM VER_SUITE_PERSONAL}
  VER_SUITE_PERSONAL                  = $00000200;
  {$EXTERNALSYM  VER_SUITE_BLADE}
  VER_SUITE_BLADE                     = $00000400;
  {$EXTERNALSYM VER_SUITE_EMBEDDED_RESTRICTED}
  VER_SUITE_EMBEDDED_RESTRICTED       = $00000800;
  {$EXTERNALSYM VER_SUITE_SECURITY_APPLIANCE}
  VER_SUITE_SECURITY_APPLIANCE        = $00001000;
  {$EXTERNALSYM VER_SUITE_STORAGE_SERVER}
  VER_SUITE_STORAGE_SERVER            = $00002000;
  {$EXTERNALSYM VER_SUITE_COMPUTE_SERVER}
  VER_SUITE_COMPUTE_SERVER            = $00004000;
  {$EXTERNALSYM VER_SUITE_WH_SERVER}
  VER_SUITE_WH_SERVER                 = $00008000;

  //from sdkddkver.h
  {$EXTERNALSYM _WIN32_WINNT_NT4}
  _WIN32_WINNT_NT4                 = $0400;
  {$EXTERNALSYM _WIN32_WINNT_WIN2K}
  _WIN32_WINNT_WIN2K               = $0500;
  {$EXTERNALSYM _WIN32_WINNT_WINXP}
  _WIN32_WINNT_WINXP               = $0501;
  {$EXTERNALSYM _WIN32_WINNT_WS03}
  _WIN32_WINNT_WS03                = $0502;
  {$EXTERNALSYM _WIN32_WINNT_WIN6}
  _WIN32_WINNT_WIN6                = $0600;
  {$EXTERNALSYM _WIN32_WINNT_VISTA}
  _WIN32_WINNT_VISTA               = $0600;
  {$EXTERNALSYM _WIN32_WINNT_WS08}
  _WIN32_WINNT_WS08                = $0600;
  {$EXTERNALSYM _WIN32_WINNT_LONGHORN}
  _WIN32_WINNT_LONGHORN            = $0600;
  {$EXTERNALSYM _WIN32_WINNT_WIN7}
  _WIN32_WINNT_WIN7                = $0601;
  {$EXTERNALSYM _WIN32_WINNT_WIN8}
  _WIN32_WINNT_WIN8                = $0602;
  {$EXTERNALSYM _WIN32_WINNT_WINBLUE}
  _WIN32_WINNT_WINBLUE             = $0603;
  {$EXTERNALSYM _WIN32_WINNT_WINTHRESHOLD}
  _WIN32_WINNT_WINTHRESHOLD        = $0A00; //* ABRACADABRA_THRESHOLD*/
  {$EXTERNALSYM _WIN32_WINNT_WIN10}
  _WIN32_WINNT_WIN10               = $0A00; //* ABRACADABRA_THRESHOLD*/


   //WinUser.h
  {$EXTERNALSYM SM_TABLETPC}
  SM_TABLETPC             = 86;
  {$EXTERNALSYM SM_MEDIACENTER}
  SM_MEDIACENTER          = 87;
  {$EXTERNALSYM SM_STARTER}
  SM_STARTER              = 88;
  {$EXTERNALSYM SM_SERVERR2}
  SM_SERVERR2             = 89;
  //ntdef.h


//
// Product types
// This list grows with each OS release.
//
// There is no ordering of values to ensure callers
// do an equality test i.e. greater-than and less-than
// comparisons are not useful.
//
// NOTE: Values in this list should never be deleted.
//       When a product-type 'X' gets dropped from a
//       OS release onwards, the value of 'X' continues
//       to be used in the mapping table of GetProductInfo.
//
  {$EXTERNALSYM PRODUCT_UNDEFINED}
  PRODUCT_UNDEFINED                          = $00000000;

  {$EXTERNALSYM PRODUCT_ULTIMATE}
  PRODUCT_ULTIMATE                           = $00000001;
  {$EXTERNALSYM PRODUCT_HOME_BASIC}
  PRODUCT_HOME_BASIC                         = $00000002;
  {$EXTERNALSYM PRODUCT_HOME_PREMIUM}
  PRODUCT_HOME_PREMIUM                       = $00000003;
  {$EXTERNALSYM PRODUCT_ENTERPRISE}
  PRODUCT_ENTERPRISE                         = $00000004;
  {$EXTERNALSYM PRODUCT_HOME_BASIC_N}
  PRODUCT_HOME_BASIC_N                       = $00000005;
  {$EXTERNALSYM PRODUCT_BUSINESS}
  PRODUCT_BUSINESS                           = $00000006;
  {$EXTERNALSYM  PRODUCT_STANDARD_SERVER}
  PRODUCT_STANDARD_SERVER                    = $00000007;
  {$EXTERNALSYM PRODUCT_DATACENTER_SERVER}
  PRODUCT_DATACENTER_SERVER                  = $00000008;
  {$EXTERNALSYM PRODUCT_SMALLBUSINESS_SERVER}
  PRODUCT_SMALLBUSINESS_SERVER               = $00000009;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_SERVER}
  PRODUCT_ENTERPRISE_SERVER                  = $0000000A;
  {$EXTERNALSYM PRODUCT_STARTER}
  PRODUCT_STARTER                            = $0000000B;
  {$EXTERNALSYM PRODUCT_DATACENTER_SERVER_CORE }
  PRODUCT_DATACENTER_SERVER_CORE             = $0000000C;
  {$EXTERNALSYM PRODUCT_STANDARD_SERVER_CORE}
  PRODUCT_STANDARD_SERVER_CORE               = $0000000D;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_SERVER_CORE}
  PRODUCT_ENTERPRISE_SERVER_CORE             = $0000000E;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_SERVER_IA64}
  PRODUCT_ENTERPRISE_SERVER_IA64             = $0000000F;
  {$EXTERNALSYM PRODUCT_BUSINESS_N}
  PRODUCT_BUSINESS_N                         = $00000010;
  {$EXTERNALSYM PRODUCT_WEB_SERVER}
  PRODUCT_WEB_SERVER                         = $00000011;
  {$EXTERNALSYM PRODUCT_CLUSTER_SERVER}
  PRODUCT_CLUSTER_SERVER                     = $00000012;
  {$EXTERNALSYM PRODUCT_HOME_SERVER}
  PRODUCT_HOME_SERVER                        = $00000013;
  {$EXTERNALSYM PRODUCT_STORAGE_EXPRESS_SERVER}
  PRODUCT_STORAGE_EXPRESS_SERVER             = $00000014;
  {$EXTERNALSYM PRODUCT_STORAGE_STANDARD_SERVER}
  PRODUCT_STORAGE_STANDARD_SERVER            = $00000015;
  {$EXTERNALSYM PRODUCT_STORAGE_WORKGROUP_SERVER}
  PRODUCT_STORAGE_WORKGROUP_SERVER           = $00000016;
  {$EXTERNALSYM PRODUCT_STORAGE_ENTERPRISE_SERVER}
  PRODUCT_STORAGE_ENTERPRISE_SERVER          = $00000017;
  {$EXTERNALSYM PRODUCT_SERVER_FOR_SMALLBUSINESS}
  PRODUCT_SERVER_FOR_SMALLBUSINESS           = $00000018;
  {$EXTERNALSYM PRODUCT_SMALLBUSINESS_SERVER_PREMIUM}
  PRODUCT_SMALLBUSINESS_SERVER_PREMIUM       = $00000019;
  {$EXTERNALSYM PRODUCT_HOME_PREMIUM_N}
  PRODUCT_HOME_PREMIUM_N                     = $0000001A;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_N}
  PRODUCT_ENTERPRISE_N                       = $0000001B;
  {$EXTERNALSYM PRODUCT_ULTIMATE_N}
  PRODUCT_ULTIMATE_N                         = $0000001C;
  {$EXTERNALSYM PRODUCT_WEB_SERVER_CORE}
  PRODUCT_WEB_SERVER_CORE                    = $0000001D;
  {$EXTERNALSYM PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT}
  PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT   = $0000001E;
  {$EXTERNALSYM PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY}
  PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY     = $0000001F;
  {$EXTERNALSYM PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING }
  PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING    = $00000020;
  {$EXTERNALSYM PRODUCT_SERVER_FOUNDATION}
  PRODUCT_SERVER_FOUNDATION                  = $00000021;
  {$EXTERNALSYM PRODUCT_HOME_PREMIUM_SERVER}
  PRODUCT_HOME_PREMIUM_SERVER                = $00000022;
  {$EXTERNALSYM PRODUCT_SERVER_FOR_SMALLBUSINESS_V}
  PRODUCT_SERVER_FOR_SMALLBUSINESS_V         = $00000023;
  {$EXTERNALSYM PRODUCT_STANDARD_SERVER_V}
  PRODUCT_STANDARD_SERVER_V                  = $00000024;
  {$EXTERNALSYM PRODUCT_DATACENTER_SERVER_V}
  PRODUCT_DATACENTER_SERVER_V                = $00000025;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_SERVER_V}
  PRODUCT_ENTERPRISE_SERVER_V                = $00000026;
  {$EXTERNALSYM PRODUCT_DATACENTER_SERVER_CORE_V}
  PRODUCT_DATACENTER_SERVER_CORE_V           = $00000027;
  {$EXTERNALSYM PRODUCT_STANDARD_SERVER_CORE_V}
  PRODUCT_STANDARD_SERVER_CORE_V             = $00000028;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_SERVER_CORE_V}
  PRODUCT_ENTERPRISE_SERVER_CORE_V           = $00000029;
  {$EXTERNALSYM PRODUCT_HYPERV}
  PRODUCT_HYPERV                             = $0000002A;
  {$EXTERNALSYM PRODUCT_STORAGE_EXPRESS_SERVER_CORE}
  PRODUCT_STORAGE_EXPRESS_SERVER_CORE        = $0000002B;
  {$EXTERNALSYM PRODUCT_STORAGE_STANDARD_SERVER_CORE}
  PRODUCT_STORAGE_STANDARD_SERVER_CORE       = $0000002C;
  {$EXTERNALSYM PRODUCT_STORAGE_WORKGROUP_SERVER_CORE}
  PRODUCT_STORAGE_WORKGROUP_SERVER_CORE      = $0000002D;
  {$EXTERNALSYM PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE}
  PRODUCT_STORAGE_ENTERPRISE_SERVER_CORE     = $0000002E;
  {$EXTERNALSYM PRODUCT_STARTER_N}
  PRODUCT_STARTER_N                          = $0000002F;
  {$EXTERNALSYM PRODUCT_PROFESSIONAL}
  PRODUCT_PROFESSIONAL                       = $00000030;
  {$EXTERNALSYM PRODUCT_PROFESSIONAL_N}
  PRODUCT_PROFESSIONAL_N                     = $00000031;
  {$EXTERNALSYM PRODUCT_SB_SOLUTION_SERVER}
  PRODUCT_SB_SOLUTION_SERVER                 = $00000032;
  {$EXTERNALSYM PRODUCT_SERVER_FOR_SB_SOLUTIONS}
  PRODUCT_SERVER_FOR_SB_SOLUTIONS            = $00000033;
  {$EXTERNALSYM PRODUCT_STANDARD_SERVER_SOLUTIONS}
  PRODUCT_STANDARD_SERVER_SOLUTIONS          = $00000034;
  {$EXTERNALSYM PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE}
  PRODUCT_STANDARD_SERVER_SOLUTIONS_CORE     = $00000035;
  {$EXTERNALSYM PRODUCT_SB_SOLUTION_SERVER_EM}
  PRODUCT_SB_SOLUTION_SERVER_EM              = $00000036;
  {$EXTERNALSYM PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM}
  PRODUCT_SERVER_FOR_SB_SOLUTIONS_EM         = $00000037;
  {$EXTERNALSYM PRODUCT_SOLUTION_EMBEDDEDSERVER}
  PRODUCT_SOLUTION_EMBEDDEDSERVER            = $00000038;
  {$EXTERNALSYM PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE}
  PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE       = $00000039;
  {$EXTERNALSYM PRODUCT_PROFESSIONAL_EMBEDDED}
  PRODUCT_PROFESSIONAL_EMBEDDED              = $0000003A;
  {$EXTERNALSYM PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT}
  PRODUCT_ESSENTIALBUSINESS_SERVER_MGMT      = $0000003B;
  {$EXTERNALSYM PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL}
  PRODUCT_ESSENTIALBUSINESS_SERVER_ADDL      = $0000003C;
  {$EXTERNALSYM PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC}
  PRODUCT_ESSENTIALBUSINESS_SERVER_MGMTSVC   = $0000003D;
  {$EXTERNALSYM PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC}
  PRODUCT_ESSENTIALBUSINESS_SERVER_ADDLSVC   = $0000003E;
  {$EXTERNALSYM PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE}
  PRODUCT_SMALLBUSINESS_SERVER_PREMIUM_CORE  = $0000003F;
  {$EXTERNALSYM PRODUCT_CLUSTER_SERVER_V}
  PRODUCT_CLUSTER_SERVER_V                   = $00000040;
  {$EXTERNALSYM PRODUCT_EMBEDDED}
  PRODUCT_EMBEDDED                           = $00000041;
  {$EXTERNALSYM PRODUCT_STARTER_E}
  PRODUCT_STARTER_E                          = $00000042;
  {$EXTERNALSYM PRODUCT_HOME_BASIC_E}
  PRODUCT_HOME_BASIC_E                       = $00000043;
  {$EXTERNALSYM PRODUCT_HOME_PREMIUM_E}
  PRODUCT_HOME_PREMIUM_E                     = $00000044;
  {$EXTERNALSYM PRODUCT_PROFESSIONAL_E}
  PRODUCT_PROFESSIONAL_E                     = $00000045;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_E}
  PRODUCT_ENTERPRISE_E                       = $00000046;
  {$EXTERNALSYM PRODUCT_ULTIMATE_E}
  PRODUCT_ULTIMATE_E                         = $00000047;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_EVALUATION}
  PRODUCT_ENTERPRISE_EVALUATION              = $00000048;
  {$EXTERNALSYM PRODUCT_MULTIPOINT_STANDARD_SERVER}
  PRODUCT_MULTIPOINT_STANDARD_SERVER         = $0000004C;
  {$EXTERNALSYM PRODUCT_MULTIPOINT_PREMIUM_SERVER}
  PRODUCT_MULTIPOINT_PREMIUM_SERVER          = $0000004D;
  {$EXTERNALSYM PRODUCT_STANDARD_EVALUATION_SERVER}
  PRODUCT_STANDARD_EVALUATION_SERVER         = $0000004F;
  {$EXTERNALSYM PRODUCT_DATACENTER_EVALUATION_SERVER}
  PRODUCT_DATACENTER_EVALUATION_SERVER       = $00000050;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_N_EVALUATION}
  PRODUCT_ENTERPRISE_N_EVALUATION            = $00000054;
  {$EXTERNALSYM PRODUCT_EMBEDDED_AUTOMOTIVE}
  PRODUCT_EMBEDDED_AUTOMOTIVE                = $00000055;
  {$EXTERNALSYM PRODUCT_EMBEDDED_INDUSTRY_A}
  PRODUCT_EMBEDDED_INDUSTRY_A                = $00000056;
  {$EXTERNALSYM PRODUCT_THINPC}
  PRODUCT_THINPC                             = $00000057;
  {$EXTERNALSYM PRODUCT_EMBEDDED_A}
  PRODUCT_EMBEDDED_A                         = $00000058;
  {$EXTERNALSYM PRODUCT_EMBEDDED_INDUSTRY}
  PRODUCT_EMBEDDED_INDUSTRY                  = $00000059;
  {$EXTERNALSYM PRODUCT_EMBEDDED_E}
  PRODUCT_EMBEDDED_E                         = $0000005A;
  {$EXTERNALSYM PRODUCT_EMBEDDED_INDUSTRY_E}
  PRODUCT_EMBEDDED_INDUSTRY_E                = $0000005B;
  {$EXTERNALSYM PRODUCT_EMBEDDED_INDUSTRY_A_E}
  PRODUCT_EMBEDDED_INDUSTRY_A_E              = $0000005C;
  {$EXTERNALSYM PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER}
  PRODUCT_STORAGE_WORKGROUP_EVALUATION_SERVER= $0000005F;
  {$EXTERNALSYM PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER}
  PRODUCT_STORAGE_STANDARD_EVALUATION_SERVER = $00000060;
  {$EXTERNALSYM PRODUCT_CORE_ARM}
  PRODUCT_CORE_ARM                           = $00000061;
  {$EXTERNALSYM PRODUCT_CORE_N}
  PRODUCT_CORE_N                             = $00000062;
  {$EXTERNALSYM PRODUCT_CORE_COUNTRYSPECIFIC}
  PRODUCT_CORE_COUNTRYSPECIFIC               = $00000063;
  {$EXTERNALSYM PRODUCT_CORE_SINGLELANGUAGE}
  PRODUCT_CORE_SINGLELANGUAGE                = $00000064;
  {$EXTERNALSYM PRODUCT_CORE}
  PRODUCT_CORE                               = $00000065;
  {$EXTERNALSYM PRODUCT_PROFESSIONAL_WMC}
  PRODUCT_PROFESSIONAL_WMC                   = $00000067;
  {$EXTERNALSYM PRODUCT_MOBILE_CORE}
  PRODUCT_MOBILE_CORE                        = $00000068;
  {$EXTERNALSYM PRODUCT_EMBEDDED_INDUSTRY_EVAL}
  PRODUCT_EMBEDDED_INDUSTRY_EVAL             = $00000069;
  {$EXTERNALSYM PRODUCT_EMBEDDED_INDUSTRY_E_EVAL}
  PRODUCT_EMBEDDED_INDUSTRY_E_EVAL           = $0000006A;
  {$EXTERNALSYM PRODUCT_EMBEDDED_EVAL}
  PRODUCT_EMBEDDED_EVAL                      = $0000006B;
  {$EXTERNALSYM PRODUCT_NANO_SERVER}
  PRODUCT_NANO_SERVER                        = $0000006D;
  {$EXTERNALSYM PRODUCT_EMBEDDED_E_EVAL}
  PRODUCT_EMBEDDED_E_EVAL                    = $0000006C;
  {$EXTERNALSYM PRODUCT_CLOUD_STORAGE_SERVER}
  PRODUCT_CLOUD_STORAGE_SERVER               = $0000006E;
  {$EXTERNALSYM PRODUCT_CONNECTED_CAR}
  PRODUCT_CONNECTED_CAR                      = $00000075;
  {$EXTERNALSYM PRODUCT_INDUSTRY_HANDHELD}
  PRODUCT_INDUSTRY_HANDHELD                  = $00000076;
  {$EXTERNALSYM PRODUCT_PPI_PRO}
  PRODUCT_PPI_PRO                            = $00000077;
  {$EXTERNALSYM PRODUCT_ARM64_SERVER}
  PRODUCT_ARM64_SERVER                       = $00000078;
  {$EXTERNALSYM PRODUCT_EDUCATION}
  PRODUCT_EDUCATION                          = $00000079;
  {$EXTERNALSYM PRODUCT_EDUCATION_N}
  PRODUCT_EDUCATION_N                        = $0000007A;
  {$EXTERNALSYM PRODUCT_IOTUAP}
  PRODUCT_IOTUAP                             = $0000007B;
  {$EXTERNALSYM PRODUCT_CLOUD_HOST_INFRASTRUCTURE_SERVER}
  PRODUCT_CLOUD_HOST_INFRASTRUCTURE_SERVER   = $0000007C;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_S}
  PRODUCT_ENTERPRISE_S                       = $0000007D;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_S_N}
  PRODUCT_ENTERPRISE_S_N                     = $0000007E;
  {$EXTERNALSYM PRODUCT_PROFESSIONAL_S}
  PRODUCT_PROFESSIONAL_S                     = $0000007F;
  {$EXTERNALSYM PRODUCT_PROFESSIONAL_S_N}
  PRODUCT_PROFESSIONAL_S_N                   = $00000080;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_S_EVALUATION}
  PRODUCT_ENTERPRISE_S_EVALUATION            = $00000081;
  {$EXTERNALSYM PRODUCT_ENTERPRISE_S_N_EVALUATION}
  PRODUCT_ENTERPRISE_S_N_EVALUATION          = $00000082;

  {$EXTERNALSYM PRODUCT_UNLICENSED}
  PRODUCT_UNLICENSED                         = $ABCDABCD;

implementation
var KernelDLL : THandle = 0;

procedure GetKernelHandle; {$IFDEF USE_INLINE}inline;{$ENDIF}
begin
  if KernelDLL = 0 then
    KernelDLL := GetModuleHandle('Kernel32.dll')
end;

function FixupStub(hDll: THandle; const AName:{$IFDEF WINCE}TIdUnicodeString{$ELSE}string{$ENDIF}): Pointer;
{$IFDEF USE_INLINE}inline;{$ENDIF}
begin
  Result := Windows.GetProcAddress(hDll, {$IFDEF WINCE}PWideChar{$ELSE}PChar{$ENDIF}(AName));
end;

//stub section
function stub_GetProductInfo(const dwOSMajorVersion : DWORD;
    const dwOSMinorVersion : DWORD;
    const dwSpMajorVersion : DWORD;
    const dwSpMinorVersion : DWORD;
    var pdwReturnedProductType : DWORD) : BOOL stdcall;
begin
  GetKernelHandle;
  GetProductInfo:= FixupStub( KernelDLL, 'GetProductInfo');
  if Assigned(versionhelpers.GetProductInfo) then begin
    Result := versionhelpers.GetProductInfo(dwOSMajorVersion,dwOSMinorVersion, dwSpMajorVersion, dwSpMinorVersion, pdwReturnedProductType);
  end else begin
    GetProductInfo := stub_GetProductInfo;
    SetLastError(ERROR_CALL_NOT_IMPLEMENTED);
    Result := False;
  end;
end;

procedure stub_GetSystemInfo(out lpSystemInfo :  versionhelpers._SYSTEM_INFO) stdcall;
begin
  GetKernelHandle;
  versionhelpers.GetNativeSystemInfo := FixupStub( KernelDLL, 'GetSystemInfo');

  if Assigned(GetNativeSystemInfo) then begin
    versionhelpers.GetNativeSystemInfo(lpSystemInfo);
  end else begin
    versionhelpers.GetNativeSystemInfo := stub_GetSystemInfo;
    SetLastError(ERROR_CALL_NOT_IMPLEMENTED);
  end;
end;

procedure stub_GetNativeSystemInfo(out lpSystemInfo :  versionhelpers._SYSTEM_INFO) stdcall;
begin
  GetKernelHandle;
  versionhelpers.GetNativeSystemInfo := FixupStub( KernelDLL, 'GetNativeSystemInfo');

  if Assigned(versionhelpers.GetNativeSystemInfo) then begin
    versionhelpers.GetNativeSystemInfo(lpSystemInfo);
  end else begin
    versionhelpers.GetNativeSystemInfo := stub_GetNativeSystemInfo;
    SetLastError(ERROR_CALL_NOT_IMPLEMENTED);
  end;
end;

function stub_VerifyVersionInfoW(var VersionInformation : versionhelpers.OSVERSIONINFOEXW;
    const dwTypeMask : DWORD;
    const dwlConditionMask : versionhelpers.DWORDLONG) : BOOL stdcall;
begin
  GetKernelHandle;
  versionhelpers.VerifyVersionInfoW := FixupStub( KernelDLL, 'VerifyVersionInfoW');
  if Assigned(versionhelpers.VerifyVersionInfoW) then begin
    Result := versionhelpers.VerifyVersionInfoW(VersionInformation,dwTypeMask,dwlConditionMask);
  end else begin
    versionhelpers.VerifyVersionInfoW := stub_VerifyVersionInfoW;
    SetLastError(ERROR_CALL_NOT_IMPLEMENTED);
    Result := False;
  end;
end;

function stub_VerSetConditionMask(const ConditionMask : ULONGLONG;
   const TypeMask : DWORD;
   const Condition : BYTE ) : ULONGLONG stdcall;
begin
  GetKernelHandle;
  @versionhelpers.VerSetConditionMask :=  FixupStub( KernelDLL, 'VerSetConditionMask');
  if Assigned(versionhelpers.VerSetConditionMask) then begin
    Result := versionhelpers.VerSetConditionMask(ConditionMask,TypeMask, Condition);
  end else begin
    versionhelpers.VerSetConditionMask := stub_VerSetConditionMask;

// For documentation sakes here's the old version of the macro that got
// changed to call an API
//         VER_SET_CONDITION(_m_,_t_,_c_)  _m_=(_m_|(_c_<<(1<<_t_)))
//
    Result :=  ConditionMask or (Condition shl (1 shl TypeMask));
  end;
end;

function stub_IsWow64Process(hProcess : THANDLE; out Wow64Process : BOOL) : BOOL stdcall;
begin
  GetKernelHandle;
  @versionhelpers.IsWow64Process :=  FixupStub( KernelDLL, 'IsWow64Process');
  if Assigned(versionhelpers.IsWow64Process) then begin
    Result :=  versionhelpers.IsWow64Process(hProcess,Wow64Process);
  end else begin
    versionhelpers.IsWow64Process := stub_IsWow64Process;
    SetLastError(ERROR_CALL_NOT_IMPLEMENTED);
    Result := False;
  end;
end;
// end stubs

//initialize stubs
procedure InitStuds;
begin
  versionhelpers.GetSystemInfo := stub_GetSystemInfo;
  versionhelpers.GetNativeSystemInfo := stub_GetNativeSystemInfo;
  versionhelpers.VerifyVersionInfoW := stub_VerifyVersionInfoW;
  versionhelpers.VerSetConditionMask := stub_VerSetConditionMask;
  versionhelpers.IsWow64Process := stub_IsWow64Process;
  versionhelpers.GetProductInfo := stub_GetProductInfo;
end;

function IsWindowsVersionOrGreater(const wMajorVersion, wMinorVersion, wServicePackMajor : Word) : Boolean;
var
  osvi : versionhelpers.OSVERSIONINFOEXW;
  dwlConditionMask : versionhelpers.DWORDLONG;
begin
  FillChar(osvi,SizeOf(osvi),0);
  osvi.dwOSVersionInfoSize := SizeOf(osvi);
  dwlConditionMask :=
    versionhelpers.VerSetConditionMask(
      versionhelpers.VerSetConditionMask(
        versionhelpers.VerSetConditionMask(
            0, versionhelpers.VER_MAJORVERSION, versionhelpers.VER_GREATER_EQUAL),
      versionhelpers.VER_MINORVERSION, versionhelpers.VER_GREATER_EQUAL),
    versionhelpers.VER_SERVICEPACKMAJOR, versionhelpers.VER_GREATER_EQUAL);
  osvi.dwMajorVersion := wMajorVersion;
  osvi.dwMinorVersion := wMinorVersion;
  osvi.wServicePackMajor := wServicePackMajor;
  Result := versionhelpers.VerifyVersionInfoW(osvi,
    versionhelpers.VER_MAJORVERSION or versionhelpers.VER_MINORVERSION or versionhelpers.VER_SERVICEPACKMAJOR, dwlConditionMask) <> False;
end;

function IsWindowsXPOrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_WINXP),
    LOBYTE(versionhelpers._WIN32_WINNT_WINXP),0);
end;

function IsWindowsXPSP1OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_WINXP),
    LOBYTE(versionhelpers._WIN32_WINNT_WINXP), 1);
end;

function IsWindowsXPSP2OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_WINXP),
    LOBYTE(versionhelpers._WIN32_WINNT_WINXP), 2);
end;

function IsWindowsXPSP3OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(_WIN32_WINNT_WINXP),
    LOBYTE(versionhelpers._WIN32_WINNT_WINXP), 3);
end;

function IsWindowsVistaOrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_VISTA),
    LOBYTE(versionhelpers._WIN32_WINNT_VISTA), 0);
end;

function IsWindowsVistaSP1OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_VISTA),
    LOBYTE(versionhelpers._WIN32_WINNT_VISTA), 1);
end;

function IsWindowsVistaSP2OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_VISTA),
    LOBYTE(versionhelpers._WIN32_WINNT_VISTA), 2);
end;

function IsWindows7OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_WIN7),
    LOBYTE(versionhelpers._WIN32_WINNT_WIN7), 0);
end;

function IsWindows7SP1OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(_WIN32_WINNT_WIN7), LOBYTE(_WIN32_WINNT_WIN7), 1);
end;

function IsWindows8OrGreater: Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(_WIN32_WINNT_WIN8), LOBYTE(_WIN32_WINNT_WIN8), 0);
end;

function IsWindows8Point1OrGreater: Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_WINBLUE),
    LOBYTE(versionhelpers._WIN32_WINNT_WINBLUE), 0);
end;

function IsWindowsThresholdOrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_WINTHRESHOLD),
    LOBYTE(versionhelpers._WIN32_WINNT_WINTHRESHOLD), 0);
end;

function IsWindows10OrGreater : Boolean;
begin
  Result := versionhelpers.IsWindowsVersionOrGreater(HIBYTE(versionhelpers._WIN32_WINNT_WINTHRESHOLD),
    LOBYTE(versionhelpers._WIN32_WINNT_WINTHRESHOLD), 0);
end;

function IsWindowsServer : Boolean;
var
  osvi : versionhelpers.OSVERSIONINFOEXW;
  dwlConditionMask : versionhelpers.DWORDLONG;
begin
  FillChar(osvi,SizeOf(osvi),0);
  osvi.dwOSVersionInfoSize := SizeOf(osvi);
  osvi.wProductType := versionhelpers.VER_NT_WORKSTATION;
  dwlConditionMask := versionhelpers.VerSetConditionMask( 0, versionhelpers.VER_PRODUCT_TYPE, versionhelpers.VER_EQUAL );
  Result := not versionhelpers.VerifyVersionInfoW(osvi, versionhelpers.VER_PRODUCT_TYPE, dwlConditionMask);
end;

initialization
  InitStuds;
end.
