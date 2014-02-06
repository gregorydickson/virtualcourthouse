package virtualcourthouse

import grails.transaction.Transactional

@Transactional
class DocumentService {

    def createDocumentWithChildren( String questionText,  
                                      List choices
                                    ) 
    {
        Question newQuestion = new Question( text : questionText )
        choices.each {
            Answer result = create(newQuestion, it.text, it.correct.equals("on") ? true : false)
            newQuestion.addToAnswers(result)
        }
        newQuestion = persistQuestion(newQuestion)
        return newQuestion
    }
}
