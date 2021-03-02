/* $Id: T3Data.cpp 541979 2017-07-24 18:47:22Z domrach $
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
 * Author:  NCBI Staff
 *
 * File Description:
 *   Convenience and optimization functions for CT3Data
 *
 * Remark:
 *   This code was originally generated by application DATATOOL
 *   using the following specifications:
 *   'taxon3.asn'.
 */

// standard includes
#include <ncbi_pch.hpp>

// generated includes
#include <objects/taxon3/T3Data.hpp>

// other includes
#include <objects/taxon3/T3StatusFlags.hpp>
#include <objects/taxon3/T3Reply.hpp>

// generated classes

BEGIN_NCBI_SCOPE

BEGIN_objects_SCOPE // namespace ncbi::objects::

// destructor
CT3Data::~CT3Data(void)
{
}

void CT3Data::GetTaxFlags (bool& is_species_level, bool& force_consult, bool& has_nucleomorphs) const
{
    is_species_level = true;
    force_consult = false;
    has_nucleomorphs = false;

    if (IsSetStatus()) {
        ITERATE (CT3Reply::TData::TStatus, status_it, GetStatus()) {
            if ((*status_it)->IsSetProperty()) {
                string prop = (*status_it)->GetProperty();
                if (NStr::EqualNocase(prop, "is_species_level")) {
                    if ((*status_it)->IsSetValue()
                        && (*status_it)->GetValue().IsBool()
                        && !(*status_it)->GetValue().GetBool()) {
                        is_species_level = false;
                    }
                } else if (NStr::EqualNocase(prop, "force_consult")) {
                    if ((*status_it)->IsSetValue()
                        && (*status_it)->GetValue().IsBool()
                        && (*status_it)->GetValue().GetBool()) {
                        force_consult = true;
                    }
                } else if (NStr::EqualNocase(prop, "has_nucleomorphs")) {
                    if ((*status_it)->IsSetValue()
                        && (*status_it)->GetValue().IsBool()
                        && (*status_it)->GetValue().GetBool()) {
                        has_nucleomorphs = true;
                    }
                }
            }
        }
    }
}


bool CT3Data::HasPlastids (void) const
{
    bool rval = false;
    if (IsSetStatus()) {
        ITERATE (CT3Reply::TData::TStatus, status_it, GetStatus()) {
            if ((*status_it)->IsSetProperty()
                && NStr::EqualNocase((*status_it)->GetProperty(), "has_plastids")
                && (*status_it)->IsSetValue()
                && (*status_it)->GetValue().IsBool()
                && (*status_it)->GetValue().GetBool()) {
                rval = true;
                break;
            }
        }
    }
    return rval;
}

#define NO_FLAG(a,f) (( a & f ) == 0)

void CT3Data::FilterOutDataParts( ITaxon3::fT3reply_parts to_remain )
{
    if( NO_FLAG( to_remain, ITaxon3::eT3reply_org ) ) {
	ResetOrg();
	SetOrg(); // empty org since it is mandatory
    }
    if( NO_FLAG( to_remain, ITaxon3::eT3reply_blast_lin ) ) {
	ResetBlast_name_lineage();
    }
    if( NO_FLAG( to_remain, ITaxon3::eT3reply_status ) ) {
	ResetStatus();
    }
    if( NO_FLAG( to_remain, ITaxon3::eT3reply_refresh ) ) {
	ResetRefresh();
    }
}

END_objects_SCOPE // namespace ncbi::objects::

END_NCBI_SCOPE

/* Original file checksum: lines: 57, chars: 1713, CRC32: a1b62eef */