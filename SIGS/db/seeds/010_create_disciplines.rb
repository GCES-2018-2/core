# Disciplines
puts "\t - Creating Disciplines"
discipline = Discipline.find_or_create_by(code: '876', name: 'Cálculo 3', department_id: 1)
discipline_2 = Discipline.find_or_create_by(code: '777', name: 'Cálculo 2', department_id: 1)
discipline_3 = Discipline.find_or_create_by(code: '773', name: 'Cálculo 1', department_id: 1)
discipline_4 = Discipline.find_or_create_by(code: '774', name: 'Artes Visuais', department_id: 3)

# FGA Disciplines
puts "\t - Adding actual FGA disciplines"

@fga_disciplines_data = [
  ['101095','Compiladores I',1],['120651','Desenvolvimento de Sofware',1],['104876','Sistemas de Controle Automotivo',1],['102865','Sistemas de Energia Solar e Eólica',1],
  ['206181','Sistemas Embarcados',1],['208621','Sistemas hidráulicos e Pneumáticos',1],['208191','Sistemas Hidroelétricos',1],['101109','Técnicas de Medição e Estimativa de Software',1],
  ['201294','Técnicas de Programação',1],['113778','Tecnologias de Fabricação 1',1],['113786','Tecnologias de Fabricação 2',1],['118991','Teoria Circuitos Eletrônicos 1',1],
  ['206156','Teoria Circuitos Eletrônicos 2',1],['119491','Teoria Eletr Digital 2',1],['120715','Teoria de Sist de Conversao',1],['119482','Teoria Eletr. Digital 1',1],
  ['203751','Materiais Compostos e Plásticos',1],['193658','Teoria Materiais de Construção de Engenharia',1],['119865','Lab. Materiais de Construção de Engenharia',1],['119972','Teoria Materiais de Construção de Engenharia ',1],
  ['119148','Teoria Circuitos Eletrônicos 1',1],['118991','TeoriaCircuitos Eletrônicos 1',1],['168009','Termodinâmica 1',1],['208272','Tóp. Avançados em Eletromag. Aplicado',1],
  ['103535','Topicos Esp. Em Matematica Aplicada',1],['103535','Topicos Esp. Em Matematica Aplicada',1],['121584','Topicos Especiais em Engenharia Aeroespacial 3',1],['107409','Tópicos Especiais em  Jogos Digitais',1],
  ['110141','Tópicos Especiais em  Programação',1],['107417','Tópicos Especiais em  Sistemas Críticos',1],['107689','Tópicos Especiais em Biblioteconomia e Ciência da Informação',1],['208281','Tópicos Especiais em Eletronica',1],
  ['104761','Tópicos Especiais em Engenharia Aeroespacial ',1],['203947','Topicos Especiais em Engenharia Automotiva',1],['206318','Tópicos Especiais em Engenharia de Energia',1],['193623','Tópicos Especiais em Engenharia de Software',1],
  ['121584','Web Semântica',1],['103527','Tópicos Especiais em Física Aplicada',1],['110159','Tópicos Especiais em Governança de TI',1],['102466','Tópicos Especiais em Instrumentação Biomédica',1],
  ['102491','Tópicos Especiais em Sistemas de Computação de Alto Desempenho',1],['101141','Trabalho de Concusão de Curso 1 (FGA)',1],['168033','Transferência de Calor',1],['208299','Transmissão e Distribuição de Energia Elétrica',1],
  ['206580','Testes de Software',1],['111111','Lab de Sist de C de Energia',1],['127728','Introducao a Web Semantica',1],['127698','Matematica Discreta 2',1],
  ['120863','Codificacao e Compressao de Sinais em Video',1],['127779','Eletronica de Alta Frequencia',1],['206300','Sensores e Transdutores',1],['222222','Fundamentos de Energia Nuclear',1],
  ['113034','Calculo  1',1],['113042','Calculo  2',1],['113051','Calculo  3',1],['333333','Disciplina Pós',1],
  ['101117','Fundamentos de Equações diferenciais para Engenharia',1],['118869','Fundamentos de Variável Complexa para Engenharia',1],['120791','Maquinas de Fluido',1],['444444','Tópicos Especiais em Engenharia Aeroespacial 4',1],
  ['120871','Eletronica Embarcada',1],['120944','Teoria Fisica Dispositivo Eletronicos',1],['120936','Pratica  Fisica Dispositivos Eletronicos',1],['555555','Topicos Especiais em Engenharia de Energia',1],
  ['666666','Topicos em Engenharia Aeroespacial 2',1],['120928','Teoria Circuitos Eletronicos 3',1],['777777','Tópicos Especiais em Eletronica 2',1],['119466','Pratica Elet Digital 1',1],
  ['888888','Tópicos Especiais em Eletronica 3',1],['103217','Sistemas de Informação Geográfica para Engenharia ',1],['116301','Computação Básica',1],['199176','Desenho Industrial Assistido por Computadores',1],
  ['201634','Eletricidade Aplicada',1],['193712','Engenharia de Segurança do Trabalho',1],['198005','Engenharia e Ambiente',1],['193321','Engenharia Econõmica',1],
  ['102512','Estágio Supervisionado',1],['168203','Fenômenos de Transporte',1],['118001','Física 1',1],['118010','Física 1 Experimental',1],
  ['193691','Física Moderna',1],['193682','Fundamentos da Teoria Eletromagnética',1],['201626','Gestão da Produção e Qualidade',1],['199133','Humanidades e Cidadania',1],
  ['113093','Introdução à Algebra Linear',1],['198013','Introdução à Engenharia',1],['195308','Mecânica dos Sólidos para Engenharia',1],['195413','Métodos Númericos para Engenharia',1],
  ['195332','Probabilidade Estatística Aplicada a Engenharia',1],['193861','Projeto Integrador Engenharia 1',1],['208175','Projeto Integrador Engenharia 2',1],['114634','Química Geral Experimental',1],
  ['114626','Química Geral Teórica',1],['167983','Sistemas Digitais',1],['102415','Trabalho de Conclusão de Curso 2',1],['195341','Orientação a Objetos',1],
  ['195316','Design Automotivo',1],['203734','Métodos Experimentais para Engenharia',1],['203793','Sistemas de Controle',1],['104779','Aerodinâmica Sistemas Aeroespaciais',1],
  ['208213','Ciências Aeroespaciais',1],['195324','Combustíveis e Biocombustíveis',1],['208167','Desenvolvimento Avançado de Software',1],['107425','Din Gases Sist Aeroespaciais',1],
  ['110094','Dinestaer',1],['108481','Mecânica do Vôo Espacial',1],['104787','Mecânica Estrut Aeroespaciais',1],['108499','Projeto de Sistemas Aeroespaciais',1],
  ['110108','Propulsão Aeroespacial',1],['101133','Sistemas Aeroespaciais',1],['201359','Elasticidade e Plásticidade Aplicada',1],['193879','Ergonomia do Produto',1],
  ['206296','Integração e Testes',1],['201367','Processos de Fabriacação',1],['203742','Projeto Elementos Automotivos',1],['206261','Projeto Sistemas Automotivos',1],
  ['163627','Conversão Eletromecanica Energia',1],['203866','Dinâmica dos Fluídos',1],['193666','Gestão Ambiental para Engenharia',1],['207004','Máquinas de Fluxo',1],
  ['168025','Máquinas Térmicas',1],['168009','Termodinâmica 1',1],['203882','Desenho de Software',1],['206601','Desenvolvimento Avançado de Software',1],
  ['193704','Estrutura de Dados e Algorítmos',1],['103209','Estrutura de Dados e Algorítmos 2',1],['206628','Gerência de Configuração de Software',1],['203874','Engenharia de Produto de Software',1],
  ['201316','Interação Humano Computador',1],['206598','Manutenção e Evolução de Software',1],['203891','Medição e Análise',1],['208655','Melhoria de Processo de Software',1],
  ['193640','Métodos de Desenvolvimento de Software',1],['208663','Produção e Profisionalismo em Engenharia de Software',1],['201308','Requisitos de Software',1],['193631','Sistemas de Bancos de Dados',1],
  ['203785','Circuitos Eletrônicos 1',1],['208221','Circuitos Eletrônicos 3',1],['201391','Materiais Elétr Mag Engenharia',1],['201642','Métodos Matemáticos Engenharia',1],
  ['201383','Microprocessadores e Microcontroladores',1],['203815','Princípios de Comunicação',1],['167991','Sistemas Digitais 2',1]
]

for data in @fga_disciplines_data do
  disc = Discipline.find_or_create_by(code: data[0], name: data[1], department_id: data[2])
end
