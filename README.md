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

Isto foi resolvido ao colar as dlls ```libeay32.dll``` e ```ssleay32.dll``` do Windows nas pastas ```System32``` e ```SysWow64```
* fonte: https://atendimento.tecnospeed.com.br/hc/pt-br/articles/360016129534-Erro-Could-not-load-SSL-library-

