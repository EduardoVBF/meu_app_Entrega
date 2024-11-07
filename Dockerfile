FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

# Instalar Node.js
SHELL ["powershell", "-Command"]
RUN Invoke-WebRequest -Uri https://nodejs.org/dist/v14.21.3/node-v14.21.3-x64.msi -OutFile node.msi; \
    Start-Process msiexec.exe -ArgumentList '/i', 'node.msi', '/quiet', '/norestart' -Wait; \
    Remove-Item -Force node.msi

# Copiar arquivos da aplicação
WORKDIR /app
COPY . .

# Instalar dependências
RUN npm install

# Expor porta
EXPOSE 8080

# Comando para iniciar a aplicação
CMD ["npm", "start"]
