FROM mcr.microsoft.com/windows/nanoserver:1809

# Instalar Node.js
SHELL ["powershell", "-Command"]

# Download e instalação do Node.js
ADD https://nodejs.org/dist/v14.21.3/node-v14.21.3-win-x64.zip C:/node.zip
RUN Expand-Archive C:/node.zip C:/nodejs; \
    Remove-Item C:/node.zip; \
    $env:PATH = 'C:\nodejs\node-v14.21.3-win-x64;' + $env:PATH; \
    [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine)

# Configurar diretório de trabalho
WORKDIR /app

# Copiar arquivos do projeto
COPY . .

# Instalar dependências
RUN npm install

# Expor porta
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["npm", "start"]
