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

## Relátorio de Desenvolvimento
Aqui será descrito o processo de desenvolvimento do aplicativo.

### Arquitetura do App e Decisões Técnicas

- **Arquitetura**: MVC / Repository Pattern
- Estrutura de pastas:
    ```
    lib/
    ├─── features/
        ├─── controllers/
        ├─── core/
        ├─── models/
        ├─── repositories/
        ├─── views/
            ├── components/
            ├── pages/
    ├─── res
    ├─── main.dart
    ```
- **Dependências**: nenhuma dependência externa
- **Estilo**: Estilição dos widgets do Material Design no ThemeData
- **Testes**: Testes unitários

### Observações
O objetivo foi desenvolver o aplicativo sem o uso de pacotes externos, garantindo um código mais simples, limpo e fácil de manter. A estrutura de pastas foi organizada de forma estratégica para facilitar a manutenção e a escalabilidade do projeto.
Todos commits foram feitos direto na main pois o projeto é pequeno e não houve necessidade de criar branches.
Como nenhum pacote de injeção de dependência foi utilizado, os controllers foram instanciados globalmente no main.dart e passados como parâmetros para as páginas, evitando a criação de instâncias desnecessárias. Já os repositories foram instanciados localmente nos controllers.
Os tamanhos, cores e demais estilos visuais foram definidos com base em ferramentas externas ao Figma, o que limitou a precisão em relação ao layout original.
Além disso, foi necessário ajustar o posicionamento dos botões para permitir a rolagem adequada da tela em dispositivos no modo horizontal.
