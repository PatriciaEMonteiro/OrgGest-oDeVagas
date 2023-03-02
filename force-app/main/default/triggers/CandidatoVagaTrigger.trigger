trigger CandidatoVagaTrigger on CandidatoVaga__c (after update) {

    //Trigger execução da BO CandidatoVagaBO
    //A mesma executa quando um Candidato vaga é atualizado
    if(Trigger.isUpdate && Trigger.isAfter){
        CandidatoVagaBO.updateContatoCandidato(Trigger.new);
    }
}