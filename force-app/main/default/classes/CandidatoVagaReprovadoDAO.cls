public with sharing class CandidatoVagaReprovadoDAO {

    //Query de Busca dos Candidatos(Contatos)
    public static List<Contact> buscaConatosCandidato(Set<Id> idContatos){
        return [SELECT Id, Status__c FROM Contact WHERE Id IN :idContatos];
    }

    //Query de Busca dos Candidatos(Contatos)
    public static AggregateResult[] buscaCandidatosVaga(Set<Id> idContatos){
        return [SELECT Contato__c, COUNT(Id) FROM CandidatoVaga__c WHERE Status__c = 'Reprovado' GROUP BY Contato__c HAVING COUNT(Id) >= 3 AND Contato__c = :idContatos];
    }

}