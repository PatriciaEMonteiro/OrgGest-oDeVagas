import { LightningElement, api, track} from 'lwc';
import historicoEntrevistasCls from '@salesforce/apex/EntrevistasRealizadasController.historicoEntrevistas';

export default class EntrevistasRealizadasLWC extends LightningElement {
    
    @api recordId;
    listaDeEntrevistas = [];

    //Recebe/Manipula os dados da Controlle que foi importada
    connectedCallback(){
        console.log("recordId: " +this.recordId);
        historicoEntrevistasCls({
            entrevistasRealizadasTO: {idContato: this.recordId}

        })
        .then(result => {
            this.listaDeEntrevistas = result            
        })
        .catch(erro => {
            console.erro(' Ocorreu um erro: ' +erro);
        })

    }

}