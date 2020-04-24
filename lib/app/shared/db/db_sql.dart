const String dbsql_dbName = "pdv.db";

const String dbsql_createdb = ''' 
  CREATE TABLE Produtos(
    produtoId INTEGER PRIMARY KEY,
    produtoGrupoId INTEGER,
    codBarras TEXT,
    precoVenda REAL,
    produto TEXT,
    isAtivo INTEGER
  );

  CREATE TABLE ProdutoGrupos(
    produtoGrupoId INTEGER PRIMARY KEY,
    produtoGrupoPaiId INTEGER,
    grupo TEXT,
    isAtivo INTEGER
  );   

  CREATE TABLE Venda(
    vendaId INTEGER PRIMARY KEY    
  );

  CREATE TABLE VendaProduto(
    id INTEGRER PRIMARY KEY,
    vendaId INTEGER ,
    produtoId INTEGER,
    descricao TEXT,
    quantidade REAL,
    precoUnitario REAL,
    valorTotal REAL
  );
''';

const String dbsql_updatedb_v2 = '''alter table ProdutoGrupos add column grupoNomeCompleto TEXT''';
