---
id: 925
title: 'Projecto OOZ2Mars — Construção do Rover (hardware)'
date: 2015-11-10T11:03:24+00:00
author: OOZ Labs
layout: post
guid: /?p=925
slug: /ooz2mars-rover-hardware/
twitterCardType:
  - summary_large_image
cardImageWidth:
  - "320"
cardImageHeight:
  - "320"
image: /wp-content/uploads/2015/11/2015-09-19-22.23.44.jpg
categories:
  - Projectos
  - Tutorials
---
{{< youtube cmBac6a1gzE >}}
Tal como tinha sido prometido durante a Lisbon Maker Faire, vamos descrever o nosso Rover (hardware).

Brevemente será publicado o artigo sobre o software que faz o Rover andar.

&nbsp;



A nossa réplica do Mars Rover inspira-se nas dimensões dos Rovers da NASA, Spirit e Opportunity, tendo sido escolhida a escala 1/4 . O elemento que achamos fascinante (e que não nos cansamos de ver) é o modelo de suspensão. Esta suspensão dá pelo nome de &#8220;[rocker-bogie](http://mars.nasa.gov/mer/mission/spacecraft_rover_wheels.html)&#8221; e é essencialmente um design que a NASA tem usado em todas as missões de [exploração a Marte](http://mars.nasa.gov/mer/overview/).

Decidimos usar um misto das tecnologias existentes, e se a parte &#8220;[rocker-bogie](http://mars.nasa.gov/mer/mission/spacecraft_rover_wheels.html)&#8221; é inspirada pelos rovers gémeos Spirit e Opportunity, o diferencial é inspirado no rover Curiosity. Podem ver uma excelente explicação destes tipos de suspensões neste [link](http://www.alicesastroinfo.com/2012/07/mars-rover-rocker-bogie-differential/).

A ideia por trás desta suspensão sem molas nem amortecedores é permitir que o rover ultrapasse obstáculos maiores do que o diâmetro de uma roda, tolerando inclinações laterais até 45º. O diferencial mantém o chassis do rover o mais horizontal possível. Por erro na montagem das peças, o segmento &#8220;rocker-bogie&#8221; acabou por ficar montado ao contrário do que os rovers originais.

Depois de várias considerações, escolhemos construir o chassis do Rover numa estrutura em madeira. Embora não seja leve, é de fácil construção e, em caso de algum erro, podemos facilmente corrigir.

&nbsp;<figure id="attachment_933" style="width: 640px" class="wp-caption aligncenter">

[<img class="wp-image-933 size-large" src="/wp-content/uploads/2015/11/2015-09-19-22.23.44-1024x768.jpg" alt="As três gerações do nosso Mars Rover" width="640" height="480" srcset="/wp-content/uploads/2015/11/2015-09-19-22.23.44-1024x768.jpg 1024w, /wp-content/uploads/2015/11/2015-09-19-22.23.44-300x225.jpg 300w, /wp-content/uploads/2015/11/2015-09-19-22.23.44-280x210.jpg 280w" sizes="(max-width: 640px) 100vw, 640px" />](/wp-content/uploads/2015/11/2015-09-19-22.23.44.jpg)<figcaption class="wp-caption-text">As três gerações do nosso Mars Rover</figcaption></figure> 

A electrónica do Rover tem duas facetas, por um lado, obter dados de telemetria, por outro controlar o movimento. No exterior, o Rover tem uma câmara de vídeo, a placa wireless e três sensores de ultrassons para detectar e (na maioria das vezes) evitar colisões. Estes sensores estão ligados ao Arduino Makerfaire Edition, que também lê a tensão das duas baterias, enviando os valores quatro vezes por segundo para o Raspberry Pi 2 (raspi2).

O raspi2 é o cérebro do nosso rover e as funções principais são: enviar dados de telemetria para o &#8220;Mission Control&#8221;, manter um livestream da câmara frontal, receber e processar os comandos vindos do Comandante da Missão. a câmera e a placa wireless estão ligadas directamente ao raspi2. Usamos o módulo de câmera específico do Raspberry Pi pois o tratamento de imagem é efectuado pelo GPU, reduzindo a carga no processador do raspi2. A placa wireless utiliza a norma 802.11n para conseguirmos melhor largura de banda para transmissão de dados.

O Arduino MakerFaire Edition 2014 é responsável pela leitura dos três sensores de ultrasons que nos informam da distância para os obstáculos. Este Arduino também lê as tensões das baterias. A informação de telemetria recolhida é enviada para o raspi2 através da porta série interna, usando um &#8220;level shifter&#8221;, pois os dois dispositivos usam tensões de funcionamento diferentes.

O Arduino Leonardo recebe e processa a lista de comandos vindos do raspi2. Os comandos são executados em sequência, sendo apenas interrompidos em caso de colisão iminente. O rover executa comandos para evitar o obstéculo, retomando a sequência logo que não tiver mais nenhum obstáculo à sua volta.

Para comando dos motores, usamos um circuito baseado no chip L298 que é o mais indicado para o tipo de motores que temos no nosso rover. Ao contrário dos [multicopters](/series/serie-1/) que utilizam motores trifásicos com controladores bastante complexos, os motores de escovas podem ser comandados com quatro transístores de potência. O chip L298 contém dentro dois conjuntos de quatro transistores de potência capazes de fornecer a corrente suficiente.

&nbsp;<figure id="attachment_939" style="width: 640px" class="wp-caption aligncenter">

[<img class="wp-image-939 size-large" src="/wp-content/uploads/2015/11/Schematic-Arduino-Touch-Wardrobe-1024x576.jpg" alt="Exemplo de implementação" width="640" height="360" srcset="/wp-content/uploads/2015/11/Schematic-Arduino-Touch-Wardrobe.jpg 1024w, /wp-content/uploads/2015/11/Schematic-Arduino-Touch-Wardrobe-300x169.jpg 300w, /wp-content/uploads/2015/11/Schematic-Arduino-Touch-Wardrobe-280x158.jpg 280w" sizes="(max-width: 640px) 100vw, 640px" />](/wp-content/uploads/2015/11/Schematic-Arduino-Touch-Wardrobe.jpg)<figcaption class="wp-caption-text">Exemplo de implementação</figcaption></figure> 

Construímos dois módulos idênticos em protoboard e usámos um dissipador que tínhamos por aqui para dissipar algum calor extra. Nunca notámos alguma espécie de aquecimento anormal durante os três dias da feira. O nosso Rover movimenta-se da mesma forma que um tanque de guerra, sendo que os motores são controlados aos pares como se fossem apenas dois, o motor esquerdo e motor direito.

As peças azuis foram modeladas e impressas pelo [Basílio Vieira](/projectos/convidado-especial-basilio-vieira/) que foi o nosso convidado especial para este projecto. Os modelos foram criados no [Sketchup](http://www.sketchup.com/) e impressas numa [BEETHEFIRST](https://beeverycreative.com/beethefirst-plus/) da BeeVeryCreative.

Em antecipação da explicação mais detalhada do software, juntamos aqui os links para todos os módulos que usámos para criar esta Experiência de condução de um Rover &#8220;em Marte&#8221;.

&nbsp;

Código fonte do projecto

  * <a href="https://github.com/oneoverzero/MakerFaire2015" target="_blank">Maker Faire 2015</a> — Software de controlo
  * <a href="https://github.com/luisfcorreia/MFL2015_MISCTL" target="_blank">MFL2015</a> — Interface Mission Control

&nbsp;

Bibliotecas adicionais

  * [mosquitto.org](http://mosquitto.org) — Linux, Servidor de Mensagens MQTT
  * [paho-mqtt](https://eclipse.org/paho/clients/python/) — Linux, ligações python para MQTT
  * [RunningMedian](http://playground.arduino.cc/Main/RunningMedian) — Arduino, obter mediana de uma série de valores
  * [NewPing](http://playground.arduino.cc/Code/NewPing) — Arduino, ler distância de objectos com sensores ultrasons
  * [<span class="pl-s">LMotorController</span>](https://github.com/lukagabric/Ernesto-Arduino/tree/master/Ernesto/Classes/LMotorController) — Arduino, controlador de motores

&nbsp;

Lista de componentes

<li style="text-align: left;">
  <a href="http://www.inmotion.pt/en/boards-and-kits/1152-raspberry-pi-2-with-transcend-8gb-class-10-card.html" target="_blank">Raspberry Pi 2</a>
</li>
<li style="text-align: left;">
  <a href="http://www.inmotion.pt/en/camera-module/796-raspberry-pi-camera-board.html">Câmara Interna para Raspberry Pi</a>
</li>
  * <a href="http://www.inmotion.pt/en/arduino-clones/408-breadboard-arduino-compatible-parts-kit-add-on.html" target="_blank">Arduino PTH</a> + <a href="http://www.inmotion.pt/en/atmel-avr/427-atmega328-with-arduino-optiboot-uno.html" target="_blank">Atmega 328p</a>
  * <a href="http://www.inmotion.pt/en/arduino-boards/486-arduino-leonardo-headers.html" target="_blank">Arduino Leonardo</a>
  * <a href="http://www.inmotion.pt/en/general-ics/193-full-bridge-motor-driver-dual-l298n.html" target="_blank">Controlador de motores L298</a>
  * <a href="http://www.inmotion.pt/en/adafruit/1101-txb0104-bi-directional-level-shifter.html" target="_blank">Level shifter</a>
  * <a href="http://www.inmotion.pt/en/gearmotors/829-29-1-metal-gearmotor-37dx52l-mm-with-64-cpr-encoder.html" target="_blank">Motor com caixa redutora</a>
  * <a href="http://www.inmotion.pt/en/proximity/526-ultrasound-sensor-hc-sr04.html" target="_blank">Sensores de ultrasons</a>

Glossário:

  * level-shifter — adaptador de sinais que permite que o Arduino (5V) comunique com o Raspberry Pi (3.3v)
  * shield — placa que liga nos pinos do Arduino e que permite expansão
  * GPU — processador gráfico
  * Protoboard — Placa de circuito impresso para prototipagem com furação e ilhas para soldar componentes

Nota: links válidos a 4 de novembro de 2015
