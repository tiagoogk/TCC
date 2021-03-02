/*  $Id: remote_updater.hpp 614636 2020-08-20 13:02:57Z fukanchi $
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
* Authors:  Sergiy Gotvyanskyy, NCBI
*           Colleen Bolin, NCBI
*
* File Description:
*   Front-end class for making remote request to MLA and taxon
* 
* ===========================================================================
*/

#ifndef __REMOTE_UPDATER_HPP_INCLUDED__
#define __REMOTE_UPDATER_HPP_INCLUDED__

#include <corelib/ncbimisc.hpp>
#include<functional>

BEGIN_NCBI_SCOPE

class CSerialObject;

BEGIN_SCOPE(objects)

class CSeq_entry_EditHandle;
class CSeq_entry;
class CSeqdesc;
class CSeq_descr;
class COrg_ref;
class CMLAClient;
class CAuth_list;
class IObjtoolsListener;
class CPub;

BEGIN_SCOPE(edit)

class CCachedTaxon3_impl;

class NCBI_XOBJEDIT_EXPORT CRemoteUpdater
{
public:

   using FLogger = function<void(const string&)>;

   // With this constructor, an exception is thrown 
   // if the updater cannot retrieve a publication for a PMID.
   CRemoteUpdater(bool enable_caching = true);
   // With this constructor, failure to retrieve 
   // a publication for a PMID is logged with the supplied message listener.
   // If no message listener is supplied, an exception is thrown.
   CRemoteUpdater(IObjtoolsListener* pMessageListener);
   ~CRemoteUpdater();

   void UpdatePubReferences(CSerialObject& obj);
   void UpdatePubReferences(CSeq_entry_EditHandle& obj);
   void SetMaxMlaAttempts(int max);

   NCBI_DEPRECATED void UpdateOrgFromTaxon(FLogger /*f_logger*/, CSeq_entry& entry);
   void UpdateOrgFromTaxon(FLogger f_logger, CSeq_entry_EditHandle& obj);
   NCBI_DEPRECATED void UpdateOrgFromTaxon(FLogger f_logger, CSeqdesc& obj);

   void UpdateOrgFromTaxon(CSeq_entry& entry);
   void UpdateOrgFromTaxon(CSeqdesc& desc);


   void ClearCache();
   static void ConvertToStandardAuthors(CAuth_list& auth_list);
   static void PostProcessPubs(CSeq_entry_EditHandle& obj);
   static void PostProcessPubs(CSeq_entry& obj);
   static void PostProcessPubs(CPubdesc& pubdesc);

   void SetMLAClient(CMLAClient& mlaClient);
   // Use either shared singleton or individual instances
   static CRemoteUpdater& GetInstance();

private:
   void xUpdatePubReferences(CSeq_entry& entry);
   void xUpdatePubReferences(CSeq_descr& descr);
   void xUpdateOrgTaxname(FLogger f_logger, COrg_ref& org); 
   void xUpdateOrgTaxname(COrg_ref& org);
   bool xUpdatePubPMID(list<CRef<CPub>>& pubs, TEntrezId id);

   IObjtoolsListener* m_pMessageListener=nullptr;
   CRef<CMLAClient>  m_mlaClient;
   auto_ptr<CCachedTaxon3_impl>  m_taxClient;
   bool m_enable_caching=true;
   CMutex m_Mutex;
   DECLARE_CLASS_STATIC_MUTEX(m_static_mutex);
   int m_MaxMlaAttempts=3;
};

END_SCOPE(edit)
END_SCOPE(objects)
END_NCBI_SCOPE

#endif
