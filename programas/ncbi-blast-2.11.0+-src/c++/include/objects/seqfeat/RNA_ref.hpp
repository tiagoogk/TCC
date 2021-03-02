/* $Id: RNA_ref.hpp 488648 2016-01-04 16:07:40Z asztalos $
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
 */

/// @RNA_ref.hpp
/// User-defined methods of the data storage class.
///
/// This file was originally generated by application DATATOOL
/// using the following specifications:
/// 'seqfeat.asn'.
///
/// New methods or data members can be added to it if needed.
/// See also: RNA_ref_.hpp


#ifndef OBJECTS_SEQFEAT_RNA_REF_HPP
#define OBJECTS_SEQFEAT_RNA_REF_HPP


// generated includes
#include <objects/seqfeat/RNA_ref_.hpp>

// generated classes

BEGIN_NCBI_SCOPE

BEGIN_objects_SCOPE // namespace ncbi::objects::

/////////////////////////////////////////////////////////////////////////////
class NCBI_SEQFEAT_EXPORT CRNA_ref : public CRNA_ref_Base
{
    typedef CRNA_ref_Base Tparent;
public:
    // constructor
    CRNA_ref(void);
    // destructor
    ~CRNA_ref(void);

    static string GetRnaTypeName (const CRNA_ref::EType rna_type);

    string GetRnaProductName(void) const;
    void SetRnaProductName(const string& product, string& remainder);

private:
    // Prohibit copy constructor and assignment operator
    CRNA_ref(const CRNA_ref& value);
    CRNA_ref& operator=(const CRNA_ref& value);

};

/////////////////// CRNA_ref inline methods

// constructor
inline
CRNA_ref::CRNA_ref(void)
{
}


/////////////////// end of CRNA_ref inline methods


END_objects_SCOPE // namespace ncbi::objects::

END_NCBI_SCOPE

#endif // OBJECTS_SEQFEAT_RNA_REF_HPP
/* Original file checksum: lines: 94, chars: 2540, CRC32: 568fe2b4 */
