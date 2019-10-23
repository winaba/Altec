# Cadastro Altec

**Configuração**

Junto ao executável deve existir o arquivo 'config.ini' seguindo a seguinte estrutura:
```
[CONFIG]
From=seu_email@gmail.com
FromName=Teste Cadastro Altec.
Host=smtp.gmail.com
Port=465
Username=seu_email@gmail.com
Password=sua_senha
[SEND]
To=destinatario@gmail.com
Subject=Email de Cadastro Altec
Attachment=cliente.xml
```

**Dificuldades encontradas:**

Para acessar a API ```viacep```, o componente ```idHttp``` estava retornando o erro ```Could not load SSL library```

* Isto foi resolvido ao colar as dlls ```libeay32.dll``` e ```ssleay32.dll``` do Windows nas pastas ```System32``` e ```SysWow64```

Fonte: https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360016129534-Erro-Could-not-load-SSL-library-

**Particularidades do envio de e-mail**

Como este é apenas um teste de envio de e-mail, não foram implementadas camadas mais complexas de segurança.

Por tanto, para que o envio de e-mail funcione em contas como a do gmail é necessario que siga os passos abaixo:

Em Google Conta
* Acesse a aba ```Segurança```
* Ative a opção ```Acesso a app menos seguro```

Fonte: https://support.google.com/accounts/answer/6010255?hl=pt
