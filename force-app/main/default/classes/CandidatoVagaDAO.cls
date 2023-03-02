public with sharing class CandidatoVagaDAO {
//Classe DAO para querys da classe CandidatoVagaBO

    //Busca lista de Contato dos Candidatos
    public static List<Contact> buscaContatosCandidatos(Set<Id> idContatos) {
        return [SELECT Id, Status__c FROM Contact WHERE Id IN :idContatos];
    }

    //Busca lista de Candidatos da vaga
    public static List<CandidatoVaga__c> buscaCandidatosVaga(Set<Id> idCandidatos){
        return [SELECT Id, Status__c, Contato__c FROM CandidatoVaga__c WHERE Id IN :idCandidatos];
    }

}