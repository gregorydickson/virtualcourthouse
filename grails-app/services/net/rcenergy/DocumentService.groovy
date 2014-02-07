package net.rcenergy

import grails.transaction.Transactional
import net.rcenergy.InstrumentTypes


@Transactional
class DocumentService {

    def createDocumentWithChildren(InstrumentTypes  instrumentType,
											Integer bookNumber,
											BookTypes bookType,
											Integer  pageNumber,
											String instrumentNumber,
											Date  fileDate,
											Date instrumentDate) 
    {
        Document newDocument = new Document(instrumentType : instrumentType,
											bookNumber : bookNumber,
											bookType : bookType,
											pageNumber : pageNumber,
											instrumentNumber : instrumentNumber,
											fileDate : fileDate,
											instrumentDate : instrumentDate)
	

		//for (grantee in params.list('grantee') {
		//	newDocument.grantee.add()
		//}
		//for (grantor in params.list('grantor') {
		//	newDocument.grantor.add()
		//}
		newDocument.save flush:true
		return newDocument
    }
}
