/* $Id$
 * ===========================================================================
 *
 *                            PUBLIC DOMAIN NOTICE
 *               National Center for Biotechnology Information
 *
 *  This software/database is a "United States Government Work" under the
 *  terms of the United States Copyright Act.  It was written as part of
 *  the author's official duties as a United States Government employee and
 *  thus cannot be copyrighted.  This software/database is freely available
 *  to the public for use. The National Library of Medicine and the U.S.
 *  Government have not placed any restriction on its use or reproduction.
 *
 *  Although all reasonable efforts have been taken to ensure the accuracy
 *  and reliability of the software and data, the NLM and the U.S.
 *  Government do not and cannot warrant the performance or results that
 *  may be obtained by using this software or data. The NLM and the U.S.
 *  Government disclaim all warranties, express or implied, including
 *  warranties of performance, merchantability or fitness for any particular
 *  purpose.
 *
 *  Please cite the author in any work or product based on this material.
 *
 * ===========================================================================
 *
 * File Description:
 *   This code was generated by application DATATOOL
 *   using the following specifications:
 *   'genome_collection.asn'.
 *
 * ATTENTION:
 *   Don't edit or commit this file into CVS as this file will
 *   be overridden (by DATATOOL) without warning!
 * ===========================================================================
 */

// standard includes
#include <ncbi_pch.hpp>
#include <serial/serialimpl.hpp>

// generated includes
#include <objects/genomecoll/GC_AssemblyDesc.hpp>
#include <objects/general/Date.hpp>
#include <objects/genomecoll/GC_DbTagAlias.hpp>
#include <objects/genomecoll/GC_Project.hpp>
#include <objects/seq/Seq_annot.hpp>
#include <objects/seq/Seq_descr.hpp>
BEGIN_NCBI_SCOPE

BEGIN_objects_SCOPE // namespace ncbi::objects::


// generated classes

BEGIN_NAMED_ENUM_IN_INFO("", CGC_AssemblyDesc_Base::, ERelease_type, true)
{
    SET_ENUM_INTERNAL_NAME("GC-AssemblyDesc", "release-type");
    SET_ENUM_MODULE("NCBI-GenomeCollection");
    ADD_ENUM_VALUE("genbank", eRelease_type_genbank);
    ADD_ENUM_VALUE("refseq", eRelease_type_refseq);
}
END_ENUM_INFO

BEGIN_NAMED_ENUM_IN_INFO("", CGC_AssemblyDesc_Base::, ERelease_status, true)
{
    SET_ENUM_INTERNAL_NAME("GC-AssemblyDesc", "release-status");
    SET_ENUM_MODULE("NCBI-GenomeCollection");
    ADD_ENUM_VALUE("new", eRelease_status_new);
    ADD_ENUM_VALUE("gpipe", eRelease_status_gpipe);
    ADD_ENUM_VALUE("public", eRelease_status_public);
    ADD_ENUM_VALUE("suppressed", eRelease_status_suppressed);
    ADD_ENUM_VALUE("hup", eRelease_status_hup);
    ADD_ENUM_VALUE("withdrawn", eRelease_status_withdrawn);
}
END_ENUM_INFO

BEGIN_NAMED_ENUM_IN_INFO("", CGC_AssemblyDesc_Base::, ERelease_level, true)
{
    SET_ENUM_INTERNAL_NAME("GC-AssemblyDesc", "release-level");
    SET_ENUM_MODULE("NCBI-GenomeCollection");
    ADD_ENUM_VALUE("major", eRelease_level_major);
    ADD_ENUM_VALUE("patch", eRelease_level_patch);
    ADD_ENUM_VALUE("minor", eRelease_level_minor);
    ADD_ENUM_VALUE("other", eRelease_level_other);
}
END_ENUM_INFO

void CGC_AssemblyDesc_Base::ResetProjects(void)
{
    m_Projects.clear();
    m_set_State[0] &= ~0x3;
}

void CGC_AssemblyDesc_Base::ResetName(void)
{
    m_Name.erase();
    m_set_State[0] &= ~0xc;
}

void CGC_AssemblyDesc_Base::ResetSubmitter_name(void)
{
    m_Submitter_name.erase();
    m_set_State[0] &= ~0x30;
}

void CGC_AssemblyDesc_Base::ResetDisplay_name(void)
{
    m_Display_name.erase();
    m_set_State[0] &= ~0xc0;
}

void CGC_AssemblyDesc_Base::ResetLong_name(void)
{
    m_Long_name.erase();
    m_set_State[0] &= ~0x300;
}

void CGC_AssemblyDesc_Base::ResetFilesafe_name(void)
{
    m_Filesafe_name.erase();
    m_set_State[0] &= ~0xc00;
}

void CGC_AssemblyDesc_Base::ResetWgs_acc_prefix(void)
{
    m_Wgs_acc_prefix.erase();
    m_set_State[0] &= ~0x3000;
}

void CGC_AssemblyDesc_Base::ResetAnnot(void)
{
    m_Annot.clear();
    m_set_State[0] &= ~0x300000;
}

void CGC_AssemblyDesc_Base::ResetSynonyms(void)
{
    m_Synonyms.clear();
    m_set_State[0] &= ~0xc00000;
}

void CGC_AssemblyDesc_Base::ResetSubmitter_date(void)
{
    m_Submitter_date.Reset();
}

void CGC_AssemblyDesc_Base::SetSubmitter_date(CGC_AssemblyDesc_Base::TSubmitter_date& value)
{
    m_Submitter_date.Reset(&value);
}

CGC_AssemblyDesc_Base::TSubmitter_date& CGC_AssemblyDesc_Base::SetSubmitter_date(void)
{
    if ( !m_Submitter_date )
        m_Submitter_date.Reset(new TSubmitter_date());
    return (*m_Submitter_date);
}

void CGC_AssemblyDesc_Base::ResetDescr(void)
{
    m_Descr.Reset();
}

void CGC_AssemblyDesc_Base::SetDescr(CGC_AssemblyDesc_Base::TDescr& value)
{
    m_Descr.Reset(&value);
}

CGC_AssemblyDesc_Base::TDescr& CGC_AssemblyDesc_Base::SetDescr(void)
{
    if ( !m_Descr )
        m_Descr.Reset(new TDescr());
    return (*m_Descr);
}

void CGC_AssemblyDesc_Base::ResetSubmitter_organization(void)
{
    m_Submitter_organization.erase();
    m_set_State[1] &= ~0xc;
}

void CGC_AssemblyDesc_Base::Reset(void)
{
    ResetProjects();
    ResetName();
    ResetSubmitter_name();
    ResetDisplay_name();
    ResetLong_name();
    ResetFilesafe_name();
    ResetWgs_acc_prefix();
    ResetWgs_acc_number();
    ResetRelease_type();
    ResetRelease_status();
    ResetAnnot();
    ResetSynonyms();
    ResetSubmitter_date();
    ResetDescr();
    ResetPartial();
    ResetCoverage();
    ResetRelease_level();
    ResetSubmitter_organization();
}

BEGIN_NAMED_BASE_CLASS_INFO("GC-AssemblyDesc", CGC_AssemblyDesc)
{
    SET_CLASS_MODULE("NCBI-GenomeCollection");
    ADD_NAMED_MEMBER("projects", m_Projects, STL_list_set, (STL_CRef, (CLASS, (CGC_Project))))->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_STD_MEMBER("name", m_Name)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_STD_MEMBER("submitter-name", m_Submitter_name)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_STD_MEMBER("display-name", m_Display_name)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_MEMBER("long-name", m_Long_name, CStringUTF8, ())->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_STD_MEMBER("filesafe-name", m_Filesafe_name)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_STD_MEMBER("wgs-acc-prefix", m_Wgs_acc_prefix)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_STD_MEMBER("wgs-acc-number", m_Wgs_acc_number)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_ENUM_MEMBER("release-type", m_Release_type, ERelease_type)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_ENUM_MEMBER("release-status", m_Release_status, ERelease_status)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_MEMBER("annot", m_Annot, STL_list_set, (STL_CRef, (CLASS, (CSeq_annot))))->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_MEMBER("synonyms", m_Synonyms, STL_list_set, (STL_CRef, (CLASS, (CGC_DbTagAlias))))->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_REF_MEMBER("submitter-date", m_Submitter_date, CDate)->SetOptional();
    ADD_NAMED_REF_MEMBER("descr", m_Descr, CSeq_descr)->SetOptional();
    ADD_NAMED_STD_MEMBER("partial", m_Partial)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_STD_MEMBER("coverage", m_Coverage)->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_ENUM_MEMBER("release-level", m_Release_level, ERelease_level)->SetDefault(new TRelease_level(eRelease_level_major))->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_MEMBER("submitter-organization", m_Submitter_organization, CStringUTF8, ())->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    info->RandomOrder();
    info->CodeVersion(22001);
    info->DataSpec(ncbi::EDataSpec::eASN);
}
END_CLASS_INFO

// constructor
CGC_AssemblyDesc_Base::CGC_AssemblyDesc_Base(void)
    : m_Wgs_acc_number(0), m_Release_type((ERelease_type)(0)), m_Release_status((ERelease_status)(0)), m_Partial(0), m_Coverage(0), m_Release_level(eRelease_level_major)
{
    memset(m_set_State,0,sizeof(m_set_State));
}

// destructor
CGC_AssemblyDesc_Base::~CGC_AssemblyDesc_Base(void)
{
}



END_objects_SCOPE // namespace ncbi::objects::

END_NCBI_SCOPE

