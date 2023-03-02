public with sharing class CandidatoVagaBO {

    //TESTE PRÁTICO - PARTE 3 - QUESTÃO 24
    //Metodo para atualizar o campo Status do Contato(Candidato) quando o mesmo for aprovado
    public static void updateContatoCandidato(List<CandidatoVaga__c> listaCandidatosVaga){

        //Set para os IDs dos contatos e das vagas
        Set<Id> idCandidatoVaga = new Set<Id>();
        Set<Id> idContatos = new Set<Id>();
        for(CandidatoVaga__c candidatosVaga : listaCandidatosVaga){
            idCandidatoVaga.add(candidatosVaga.Id);
            idContatos.add(candidatosVaga.Contato__c);
        }

        //Chama a classe DAO que contem as querys
        List<CandidatoVaga__c> listaCandidatos = CandidatoVagaDAO.buscaCandidatosVaga(idCandidatoVaga);
        List<Contact> listContatosCandidatos = CandidatoVagaDAO.buscaContatosCandidatos(idContatos);

        //Lista vazia para adicionar as modificações feitas
        List<Contact> listaContatosAtualizar = new List<Contact>();

        //for percorre os candidatos das vagas e os contatos das vagas para fazer a atualização
        //quando o status de um candidato estiver 'Aprovado' , o status do contato fica como 'Contratado'
        for(CandidatoVaga__c candidatoVaga: listaCandidatos){
            for(Contact contatoCandidato : listContatosCandidatos){
                if(candidatoVaga.Status__c == 'Aprovado'){
                    if(contatoCandidato.Id == candidatoVaga.Contato__c){
                        contatoCandidato.Status__c = 'Contratado';
                        listaContatosAtualizar.add(contatoCandidato);
                    }
                }
            }
        }

        //Atualiza a lista 'listaContatosAtualizar'
        update listaContatosAtualizar;
    }

}