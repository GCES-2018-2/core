# Disciplines

puts "\t - Adding actual FGA disciplines"

@fga_disciplines_data = [
  ['101095','Compiladores I',2],
  ['120651','Desenvolvimento de Sofware',2],
  ['104876','Sistemas de Controle Automotivo',2],
  ['102865','Sistemas de Energia Solar e Eólica',2],
  ['206181','Sistemas Embarcados',2],
  ['208621','Sistemas hidráulicos e Pneumáticos',2],
  ['208191','Sistemas Hidroelétricos',2],
  ['101109','Técnicas de Medição e Estimativa de Software',2],
  ['201294','Técnicas de Programação',2],
  ['113778','Tecnologias de Fabricação 1',2],
  ['113786','Tecnologias de Fabricação 2',2],
  ['118991','Teoria Circuitos Eletrônicos 1',2],
  ['206156','Teoria Circuitos Eletrônicos 2',2],
  ['119491','Teoria Eletr Digital 2',2],
  ['120715','Teoria de Sist de Conversao',2],
  ['119482','Teoria Eletr. Digital 1',2],
  ['203751','Materiais Compostos e Plásticos',2],
  ['193658','Teoria Materiais de Construção de Engenharia',2],
  ['119865','Lab. Materiais de Construção de Engenharia',2],
  ['119972','Teoria Materiais de Construção de Engenharia ',2],
  ['119148','Teoria Circuitos Eletrônicos 1',2],
  ['118991','TeoriaCircuitos Eletrônicos 1',2],
  ['168009','Termodinâmica 1',2],
  ['208272','Tóp. Avançados em Eletromag. Aplicado',2],
  ['103535','Topicos Esp. Em Matematica Aplicada',2],
  ['103535','Topicos Esp. Em Matematica Aplicada',2],
  ['121584','Topicos Especiais em Engenharia Aeroespacial 3',2],
  ['107409','Tópicos Especiais em  Jogos Digitais',2],
  ['110141','Tópicos Especiais em  Programação',2],
  ['107417','Tópicos Especiais em  Sistemas Críticos',2],
  ['107689','Tópicos Especiais em Biblioteconomia e Ciência da Informação',2],
  ['208281','Tópicos Especiais em Eletronica',2],
  ['104761','Tópicos Especiais em Engenharia Aeroespacial ',2],
  ['203947','Topicos Especiais em Engenharia Automotiva',2],
  ['206318','Tópicos Especiais em Engenharia de Energia',2],
  ['193623','Tópicos Especiais em Engenharia de Software',2],
  ['121584','Web Semântica',2],
  ['103527','Tópicos Especiais em Física Aplicada',2],
  ['110159','Tópicos Especiais em Governança de TI',2],
  ['102466','Tópicos Especiais em Instrumentação Biomédica',2],
  ['102491','Tópicos Especiais em Sistemas de Computação de Alto Desempenho',2],
  ['101141','Trabalho de Concusão de Curso 1 (FGA)',2],
  ['168033','Transferência de Calor',2],
  ['208299','Transmissão e Distribuição de Energia Elétrica',2],
  ['206580','Testes de Software',2],
  ['111111','Lab de Sist de C de Energia',2],
  ['127728','Introducao a Web Semantica',2],
  ['127698','Matematica Discreta 2',2],
  ['120863','Codificacao e Compressao de Sinais em Video',2],
  ['127779','Eletronica de Alta Frequencia',2],
  ['206300','Sensores e Transdutores',2],
  ['222222','Fundamentos de Energia Nuclear',2],
  ['113034','Calculo  1',2],
  ['113042','Calculo  2',2],
  ['113051','Calculo  3',2],
  ['333333','Disciplina Pós',2],
  ['101117','Fundamentos de Equações diferenciais para Engenharia',2],
  ['118869','Fundamentos de Variável Complexa para Engenharia',2],
  ['120791','Maquinas de Fluido',2],
  ['444444','Tópicos Especiais em Engenharia Aeroespacial 4',2],
  ['120871','Eletronica Embarcada',2],
  ['120944','Teoria Fisica Dispositivo Eletronicos',2],
  ['120936','Pratica  Fisica Dispositivos Eletronicos',2],
  ['555555','Topicos Especiais em Engenharia de Energia',2],
  ['666666','Topicos em Engenharia Aeroespacial 2',2],
  ['120928','Teoria Circuitos Eletronicos 3',2],
  ['777777','Tópicos Especiais em Eletronica 2',2],
  ['119466','Pratica Elet Digital 1',2],
  ['888888','Tópicos Especiais em Eletronica 3',2],
  ['103217','Sistemas de Informação Geográfica para Engenharia ',2],
  ['116301','Computação Básica',2],
  ['199176','Desenho Industrial Assistido por Computadores',2],
  ['201634','Eletricidade Aplicada',2],
  ['193712','Engenharia de Segurança do Trabalho',2],
  ['198005','Engenharia e Ambiente',2],
  ['193321','Engenharia Econõmica',2],
  ['102512','Estágio Supervisionado',2],
  ['168203','Fenômenos de Transporte',2],
  ['118001','Física 1',2],
  ['118010','Física 1 Experimental',2],
  ['193691','Física Moderna',2],
  ['193682','Fundamentos da Teoria Eletromagnética',2],
  ['201626','Gestão da Produção e Qualidade',2],
  ['199133','Humanidades e Cidadania',2],
  ['113093','Introdução à Algebra Linear',2],
  ['198013','Introdução à Engenharia',2],
  ['195308','Mecânica dos Sólidos para Engenharia',2],
  ['195413','Métodos Númericos para Engenharia',2],
  ['195332','Probabilidade Estatística Aplicada a Engenharia',2],
  ['193861','Projeto Integrador Engenharia 1',2],
  ['208175','Projeto Integrador Engenharia 2',2],
  ['114634','Química Geral Experimental',2],
  ['114626','Química Geral Teórica',2],
  ['167983','Sistemas Digitais',2],
  ['102415','Trabalho de Conclusão de Curso 2',2],
  ['195341','Orientação a Objetos',2],
  ['195316','Design Automotivo',2],
  ['203734','Métodos Experimentais para Engenharia',2],
  ['203793','Sistemas de Controle',2],
  ['104779','Aerodinâmica Sistemas Aeroespaciais',2],
  ['208213','Ciências Aeroespaciais',2],
  ['195324','Combustíveis e Biocombustíveis',2],
  ['208167','Desenvolvimento Avançado de Software',2],
  ['107425','Din Gases Sist Aeroespaciais',2],
  ['110094','Dinestaer',2],
  ['108481','Mecânica do Vôo Espacial',2],
  ['104787','Mecânica Estrut Aeroespaciais',2],
  ['108499','Projeto de Sistemas Aeroespaciais',2],
  ['110108','Propulsão Aeroespacial',2],
  ['101133','Sistemas Aeroespaciais',2],
  ['201359','Elasticidade e Plásticidade Aplicada',2],
  ['193879','Ergonomia do Produto',2],
  ['206296','Integração e Testes',2],
  ['201367','Processos de Fabriacação',2],
  ['203742','Projeto Elementos Automotivos',2],
  ['206261','Projeto Sistemas Automotivos',2],
  ['163627','Conversão Eletromecanica Energia',2],
  ['203866','Dinâmica dos Fluídos',2],
  ['193666','Gestão Ambiental para Engenharia',2],
  ['207004','Máquinas de Fluxo',2],
  ['168025','Máquinas Térmicas',2],
  ['168009','Termodinâmica 1',2],
  ['203882','Desenho de Software',2],
  ['206601','Desenvolvimento Avançado de Software',2],
  ['193704','Estrutura de Dados e Algorítmos',2],
  ['103209','Estrutura de Dados e Algorítmos 2',2],
  ['206628','Gerência de Configuração de Software',2],
  ['203874','Engenharia de Produto de Software',2],
  ['201316','Interação Humano Computador',2],
  ['206598','Manutenção e Evolução de Software',2],
  ['203891','Medição e Análise',2],
  ['208655','Melhoria de Processo de Software',2],
  ['193640','Métodos de Desenvolvimento de Software',2],
  ['208663','Produção e Profisionalismo em Engenharia de Software',2],
  ['201308','Requisitos de Software',2],
  ['193631','Sistemas de Bancos de Dados',2],
  ['203785','Circuitos Eletrônicos 1',2],
  ['208221','Circuitos Eletrônicos 3',2],
  ['201391','Materiais Elétr Mag Engenharia',2],
  ['201642','Métodos Matemáticos Engenharia',2],
  ['201383','Microprocessadores e Microcontroladores',2],
  ['203815','Princípios de Comunicação',2],
  ['167991','Sistemas Digitais 2',2]
]

puts "Creating Disciplines"
discipline = Discipline.find_or_create_by(code: '876', name: 'Cálculo 3', department_id: 1)
discipline_2 = Discipline.find_or_create_by(code: '777', name: 'Cálculo 2', department_id: 1)
discipline_3 = Discipline.find_or_create_by(code: '773', name: 'Cálculo 1', department_id: 1)
discipline_4 = Discipline.find_or_create_by(code: '774', name: 'Artes Visuais', department_id: 3)
