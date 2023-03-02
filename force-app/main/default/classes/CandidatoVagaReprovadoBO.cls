public with sharing class CandidatoVagaReprovadoBO {

    //TESTE PRÁTICO - PARTE 3 - QUESTÃO 25
    //Metodo para atualizar o campo Status do Contato(Candidato) quando o mesmo for reprovado 3 vezes
    public static void updateCandidatoReprovado(List<CandidatoVaga__c> listaCandidatosVaga){

        //Set para os IDs dos contatos e das vagas
        Set<Id> idContatos = new Set<Id>();
        for(CandidatoVaga__c candidatosVaga : listaCandidatosVaga){
            idContatos.add(candidatosVaga.Contato__c);
        }

        //Querys (Classe DAO 'CandidatoVagaReprovadoDAO')
        AggregateResult[] listaCandReprovados = CandidatoVagaReprovadoDAO.buscaCandidatosVaga(idContatos);

        List<Contact> listaContatos = CandidatoVagaReprovadoDAO.buscaConatosCandidato(idContatos);

        //Lista vazia para adicionar as modificações feitas
        List<Contact> listaContatosAtualizar = new List<Contact>();

        for(AggregateResult candidatoVaga: listaCandReprovados){
            for(Contact contatoCandidato : listaContatos){
                if(contatoCandidato.Id == candidatoVaga.get('Contato__c')){
                    contatoCandidato.Status__c = 'Reprovado Permanentemente';
                        listaContatosAtualizar.add(contatoCandidato);
                }
            }
        }

        //Atualiza a lista 'listaContatosAtualizar'
        update listaContatosAtualizar;
    }
}