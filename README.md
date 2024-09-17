# Teste Dev Mobile Cientec

## Desafio
Desenvolver um aplicativo para cadastro de pessoas em um dos serviços disponíveis, seguindo o layout proposto.

[Link para protótipo no figma](https://www.figma.com/proto/SjRzvgAi4EHBAnPXngrBnk/Teste-Dev-Mobile?type=design&node-id=1-2773&scaling=min-zoom&page-id=0%3A1&starting-point-node-id=1%3A2800&t=GV7ig0UZ4YBrXIGV-1)

### Premissas
- O aplicativo deve ser desenvolvido utilizando FLUTTER;
- O layout deve se adaptar à orientação vertical e horizontal do dispositivo.
O que será avaliado
- Organização e clareza de código;
- Arquitetura adotada;
- Manutenabilidade;
- Fidelidade ao layout (O Material Design pode ser utilizado como fonte de ícones);
- Experiência do usuário;
- Controle de versão;
- Testes automatizados.
Como aplicar
- Crie um repositório público no github/gitlab para subir o teste;
- Envie o link do repositório;
- Envie o arquivo .apk gerado por você.
Observações
O botão hambúrguer na toolbar e os botões na bottom-bar devem estar presentes no layout, porém, não
deve conter nenhuma ação.
Lembre-se de adicionar validação nos campos do formulário e avisar ao usuário caso algo esteja incorreto.
Os campos obrigatórios são:
- No formulário de cadastro: Nome, CPF e Telefone;
- Na tela de seleção de serviço: A escolha de uma opção de serviço;
- Na tela do motivo: O próprio motivo.
Não permita que o usuário siga o fluxo do aplicativo quando houver campos inválidos ou não selecionados.

--------------------------------------------------------------------

## Arquitetura do App e Decisões Técnicas

- **Arquitetura**: MVC / Repository Pattern
- Estrutura de pastas:
    ```
    lib/
    ├─── controllers/
    ├─── core/
    ├─── models/
    ├─── repositories/
    ├─── views/
        ├── components/
        ├── pages/
    ├─── main.dart
    ```
- **Dependências**: SharedPreferences
- **Estilo**: Estilição dos widgets do Material Design no ThemeData
- **Testes**: Testes unitários
