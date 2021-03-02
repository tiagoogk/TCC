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
#include <objects/genomecoll/GC_Genome.hpp>
#include <objects/general/Dbtag.hpp>
#include <objects/genomecoll/GC_GenomicPart.hpp>
#include <objects/genomecoll/GC_Project.hpp>
#include <objects/seq/Seq_descr.hpp>
BEGIN_NCBI_SCOPE

BEGIN_objects_SCOPE // namespace ncbi::objects::


// generated classes

void CGC_Genome_Base::ResetId(void)
{
    m_Id.clear();
    m_set_State[0] &= ~0x3;
}

void CGC_Genome_Base::ResetProjects(void)
{
    m_Projects.clear();
    m_set_State[0] &= ~0xc;
}

void CGC_Genome_Base::ResetDescr(void)
{
    m_Descr.Reset();
}

void CGC_Genome_Base::SetDescr(CGC_Genome_Base::TDescr& value)
{
    m_Descr.Reset(&value);
}

CGC_Genome_Base::TDescr& CGC_Genome_Base::SetDescr(void)
{
    if ( !m_Descr )
        m_Descr.Reset(new TDescr());
    return (*m_Descr);
}

void CGC_Genome_Base::ResetChr_names(void)
{
    m_Chr_names.clear();
    m_set_State[0] &= ~0xc0;
}

void CGC_Genome_Base::ResetParts(void)
{
    m_Parts.clear();
    m_set_State[0] &= ~0x300;
}

void CGC_Genome_Base::Reset(void)
{
    ResetId();
    ResetProjects();
    ResetDescr();
    ResetChr_names();
    ResetParts();
}

BEGIN_NAMED_BASE_CLASS_INFO("GC-Genome", CGC_Genome)
{
    SET_CLASS_MODULE("NCBI-GenomeCollection");
    ADD_NAMED_MEMBER("id", m_Id, STL_list_set, (STL_CRef, (CLASS, (CDbtag))))->SetSetFlag(MEMBER_PTR(m_set_State[0]));
    ADD_NAMED_MEMBER("projects", m_Projects, STL_list_set, (STL_CRef, (CLASS, (CGC_Project))))->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_REF_MEMBER("descr", m_Descr, CSeq_descr)->SetOptional();
    ADD_NAMED_MEMBER("chr-names", m_Chr_names, STL_list_set, (STD, (string)))->SetSetFlag(MEMBER_PTR(m_set_State[0]))->SetOptional();
    ADD_NAMED_MEMBER("parts", m_Parts, STL_list_set, (STL_CRef, (CLASS, (CGC_GenomicPart))))->SetSetFlag(MEMBER_PTR(m_set_State[0]));
    info->RandomOrder();
    info->CodeVersion(22001);
    info->DataSpec(ncbi::EDataSpec::eASN);
}
END_CLASS_INFO

// constructor
CGC_Genome_Base::CGC_Genome_Base(void)
{
    memset(m_set_State,0,sizeof(m_set_State));
}

// destructor
CGC_Genome_Base::~CGC_Genome_Base(void)
{
}



END_objects_SCOPE // namespace ncbi::objects::

END_NCBI_SCOPE

