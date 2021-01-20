import 'package:flutter/material.dart';
import 'package:rapido/rapido.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DocumentList documentList = DocumentList("Notas", labels: {
    "CPF/CNPJ": "documento_emitente",
    "E-mail": "email_emitente",
    "Razão social": "razao_social_emitente",
    "Nome Fantasia": "nome_fantasia_emitente",
    "Telefone": "telefone_emitente",
    "CEP": "cep_emitente",
    "Cidade": "cidade_emitente",
    "Endereço": "endereco_emitente",
    "Complemento": "complemento_emitente",
    "Inscrição Municipal": "im_emitente",
    "Inscrição Estadual": "ie_emitente",

    "CPF/CNPJ Destinatario": "documento_destinatario",
    "E-mail Destinatario": "email_destinatario",
    "Razão social Destinatario": "razao_social_destinatario",
    "Nome Fantasia Destinatario": "nome_fantasia_destinatario",
    "Telefone Destinatario": "telefone_destinatario",
    "CEP Destinatario": "cep_destinatario",
    "Cidade Destinatario": "cidade_destinatario",
    "Endereço Destinatario": "endereco_destinatario",
    "Complemento Destinatario": "complemento_destinatario",
    "Inscrição Municipal Destinatario": "im_destinatario",
    "Inscrição Estadual Destinatario": "ie_destinatario",

    "Serviço": "servico",
    "Atividade": "atividade",
    "Exigibilidade de ISS Variável:": "exigibilidade_iss",
    "Discriminação do Serviço": "discriminacao_serviço",
    "Valor do Serviço": "valor_servico",
    "Desconto Condicionado": "desconto_condicionado",
    "Deduções": "deducoes",
    "Desconto Incondicionado": "desconto_incondicionado",
    "Alíquota (%)": "aliquota",
    "Total de ISS (R\$)": "total_iss",

    "Total de ISS (R\$)": "valor_iss",
    "Base de Cálculo": "base_calculo:",
    "Valor de ISS": "valor_de_iss",
    "Valor Líquido": "valor_liquido",

    "Observações": "observacoes"
  });

  @override
  Widget build(BuildContext context) {
    return DocumentListScaffold(
      documentList,
      emptyListWidget: Center(
        child: Text("Nenhuma nota cadastrada"),
      ),
      customItemBuilder: customItemBuilder,
      
    );
  }

  Widget customItemBuilder(int index, Document doc, BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;

    return Card(
      child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Text(
                    doc["razao_social_emitente"],
                    style: textTheme.headline,
                  ),
                  Text(
                    doc["nome_fantasia_emitente"],
                    style: textTheme.headline,
                  ),
                ],
              ),
            ),
            DocumentActionsButton(documentList, index: index),
          ],
        ),
    );
  }
}
