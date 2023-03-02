trigger CandidatoVagaReprovadoTRIGGER on CandidatoVaga__c (after update) {
    
    //Trigger execução da BO CandidatoVagaReprovadoBO
    //A mesma executa quando um Candidato vaga é atualizado
    if(Trigger.isUpdate && Trigger.isAfter){
        CandidatoVagaReprovadoBO.updateCandidatoReprovado(Trigger.new);
    }
}