#!/usr/bin/env bash 

cd infraestructure

# Declara variavel para reutilização nas validações do diretório
PACKAGE="package"

# Cria o diretório e instala as dependências da função lambda
if [ -d $PACKAGE ]
then
	echo "O Diretório "$PACKAGE" já existe."
	echo "============================================="
	echo "Removendo arquivos antigos do diretório "$PACKAGE"..."
	rm -rf $PACKAGE
	echo "Arquivos removidos."
	echo "============================================="
else
	echo "============================================="
	echo "Criando o diretório "$PACKAGE"..."
	mkdir $PACKAGE
	echo "O diretório "$PACKAGE" foi criado."
	echo "============================================="
fi

# Declara variavel que localiza o requirements com as dependências do projeto
FILE_REQUIREMENTS=./requirements/lambda_requirements.txt

# Verifica se o arquivo lambda_requirements existe
if [ -f $FILE_REQUIREMENTS ]
then
	echo "============================================="
	echo "Instalando dependências localizadas no "$FILE_REQUIREMENTS""
	pip install --target ./package -r $FILE_REQUIREMENTS
	echo "Dependências instaladas com sucesso."
	echo "============================================="	
fi


cd $PACKAGE

# Declara variavel que localiza a função lambda para reutilização no código.
LAMBDA_FUNCTION=../../etl/lambda_function.py

# Verifica se o arquivo lambda_function.py existe
if [ -f $LAMBDA_FUNCTION ]
then
	echo "============================================="
	echo "Copiando função Handler..."
	cp $LAMBDA_FUNCTION .
	echo "Compactando arquivo lambda_function_payload.zip"
	zip -r9 ../lambda_function_payload.zip . #Compacta o pacote para o deploy
	echo "Arquivo compactado com sucesso!"
	echo "============================================="
fi

cd ..
