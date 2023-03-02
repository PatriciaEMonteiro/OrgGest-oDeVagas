public with sharing class EntrevistasRealizadasController {
//Classe controller com ibnformações que serão usadas no Component

    @AuraEnabled
    public static List<CandidatoVaga__c> historicoEntrevistas(EntrevistasRealizadasTO entrevistasRealizadasTO){
        
        List<CandidatoVaga__c> listaHistoricoCandidato = new List<CandidatoVaga__c>();

        try {
            listaHistoricoCandidato = [SELECT Id, Vaga__r.Name, Vaga__r.Status__c, (SELECT Id, DataEntrevista__c, DetalhesEntrevista__c FROM Entrevista__r) FROM CandidatoVaga__c WHERE Contato__c = :entrevistasRealizadasTO.idContato];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return listaHistoricoCandidato;
    }

    //Classe TO
    public class EntrevistasRealizadasTO{
        @AuraEnabled public String idContato {get; set;}
    }
}