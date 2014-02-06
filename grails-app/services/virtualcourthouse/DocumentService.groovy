package virtualcourthouse

import grails.transaction.Transactional

@Transactional
class DocumentService {

    def createDocumentWithChildren(List grantee, 
									List grantor) 
    {
        Document newDocument = new Document( InstrumentTypes : instrumentType,
											bookNumber : bookNumber,
											BookTypes : bookType,
											Integer : pageNumber,
											String : instrumentNumber,
											Date : fileDate,
											Date : instrumentDate)
	

		for (grantee in params.list('grantee') {
			newDocument.grantee.add()
		}
		for (grantor in params.list('grantor') {
			newDocument.grantor.add()
		}

    }
}
