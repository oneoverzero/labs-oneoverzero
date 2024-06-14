---
id: 880
title: 'OOZ2Mars — Projecto MakerFaire 2015'
date: 2015-09-14T11:30:37+00:00
author: OOZ Labs
layout: post
guid: /?p=880
slug: /ooz2mars-projecto-makerfaire-2015/
twitterCardType:
  - summary_large_image
cardImageWidth:
  - "320"
cardImageHeight:
  - "320"
image: /wp-content/uploads/2015/09/Rover1.jpg
categories:
  - Informações
---
{{< youtube QPzqmFlk3zU >}}

Foi há dois meses atrás que tivemos a ideia de propor como projecto para a [Lisbon Maker Faire](http://makerfairelisbon.com/) deste ano uma experiência condução de um Rover em Marte.

Para ilustrar o que nos proporíamos a fazer, produzimos este vídeo.



A organização da Maker Faire gostou tanto do desafio que aceitou a nossa participação, o que nos fez iniciar os trabalhos de imediato.

Pegando na ideia de comandar um rover à distância, e do que sabemos do projecto da NASA, qualquer interacção com o mesmo tem um atraso que varia entre 4 e 24 minutos. Isto acontece devido à distância entre os dois planetas e também a variações na posição orbital.

Tipicamente entre o envio de um comando para Marte e o retorno com a confirmação passam-se 40 minutos (mais detalhes neste [link](http://blogs.esa.int/mex/2012/08/05/time-delay-between-mars-and-earth/) em Inglês). A NASA criou um sistema em que são enviadas directivas para o rover, e em que este pode ter autonomia na sua execução por forma a evitar obstáculos e escolher uma rota favorável.

No nosso caso vamos simplificar um pouco a experiência de comando, dando ao Comandante da Missão a hipótese de escolher uma sequência de comandos para envio. Os comandos serão executados pelo rover de imediato, evitando obstáculos que surjam pelo caminho.

Falando do hardware que vamos usar para este projecto, o rover tem dentro um computador Raspberry Pi 2, uma camera de vídeo, um Arduino Redboard ([Lisbon Mini Maker Faire edition](http://makerfairelisbon.com/en/2014/09/16/arduino-inmotion.html)) e um Arduino Pro Micro (compatível com o Arduino Leonardo).

Usa sensores de ultra-sons para detectar obstáculos à frente e atrás e tem dois módulos baseados no chip [L298](http://www.inmotion.pt/en/general-ics/193-full-bridge-motor-driver-dual-l298n.html) para controlo dos motores. Temos ainda dois circuitos para monitorar os níveis das baterias de lítio que alimentam todo o circuito.

&nbsp;<figure id="attachment_888" style="width: 640px" class="wp-caption aligncenter">

[<img class="wp-image-888 size-large" src="/wp-content/uploads/2015/09/Rover1-1024x1024.jpg" alt="Rover1" width="640" height="640" srcset="/wp-content/uploads/2015/09/Rover1-1024x1024.jpg 1024w, /wp-content/uploads/2015/09/Rover1-150x150.jpg 150w, /wp-content/uploads/2015/09/Rover1-300x300.jpg 300w, /wp-content/uploads/2015/09/Rover1-280x280.jpg 280w, /wp-content/uploads/2015/09/Rover1.jpg 1600w" sizes="(max-width: 640px) 100vw, 640px" />](/wp-content/uploads/2015/09/Rover1.jpg)<figcaption class="wp-caption-text">Imagem: o Rover fotografado por Basílio Vieira</figcaption></figure> 

&nbsp;

O rover comunica via wireless com o nosso servidor, ao qual demos o nome &#8220;Mission Control&#8221;, e é a partir dele que serão dadas todas as ordens de comando. São também enviados dados de telemetria sobre os obstáculos e os valores de carga das baterias.

O centro de comando consiste numa página web onde damos as ordens de comando e assistimos a uma transmissão vídeo a partir do rover, com um ligeiro atraso.

No fim de cada missão executada, o/a Comandante da Missão vai receber um certificado de participação na missão para recordação.

* * *

Para este projecto tivemos a ajuda preciosa do [Basílio Vieira](http://www.Basilio.eu/) que desenhou e imprimiu todas as peças à medida que necessitámos criar. As rodas, os suportes dos motores, os &#8220;linkage&#8221; que permitem a suspensão funcionar e ainda o suporte da câmera (que não consta da foto).

O [Nuno Correia](/equipa/nuno-correia/) construiu todo o chassis e painéis laterais, ajudando nas decisões do projecto, fornecendo o espaço OOZLabs para a construção e mantendo o stock do minibar em níveis aceitáveis.

O [Luís Correia](/equipa/luis-correia/) seleccionou o hardware e os módulos da electrónica, escreveu todo o código que corre nos dois Arduino (C++), o código que corre no Raspberry Pi 2 (Python) e trata comunicação de dados com Mission Control e ainda o código que corre em Mission Control (Javascript + Websockets).

* * *

Actualização 2015 09 21:
  
o código fonte usado no projecto está disponível [no Github](https://github.com/oneoverzero/MakerFaire2015)

* * *

O projecto não se fez só com a nossa vontade pelo que temos que agradecer a algumas pessoas e empresas:

  * [inMotion](http://inmotion.pt/) — forneceu os motores e os L298
  * [João Neves](http://mestrejoao.silvaneves.org/) — doou um servidor Dell PowerEdge R200
  * Luis Silva — emprestou um módulo WiFi de dimensões reduzidas
  * [Bruno Amaral](http://BrunoAmaral.eu/) — ajudou a criar o Mission Control web interface
  * [Lobsters](http://oneoverzero.org/) — ajudaram com todo o encorajamento que bem falta nos fez :p
  * [MEOCloud](http://meocloud.pt) — alojar imagens e documentos das missões
  * [SAPO Puny](http://sl.pt/) — fornece links curtos para todas as URL do projecto

&nbsp;

Contamos convosco na [Lisbon Maker Faire 2015](http://makerfairelisbon.com/pt/) a partir de sexta-feira à tarde até domingo!
