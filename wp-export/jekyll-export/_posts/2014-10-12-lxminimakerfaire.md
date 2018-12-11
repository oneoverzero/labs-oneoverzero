---
id: 39
title: OOZ Labs na Lisbon Mini Maker Faire
date: 2014-10-12T11:00:28+00:00
author: Luis Correia
layout: post
guid: http://labs.oneoverzero.org/?p=39
permalink: /lxminimakerfaire/
twitterCardType:
  - summary
cardImageWidth:
  - "320"
cardImageHeight:
  - "320"
image: /wp-content/uploads/2014/10/PAS-paint2113.jpg
categories:
  - Projectos
---
Estivemos na primeira <a href="http://makerfairelisbon.com/pt/" title="Lisbon Mini Maker Faire" target="_blank">Lisbon Mini Maker Faire</a> com um projecto, o <a href="http://makerfairelisbon.com/pt/2014/08/12/pointasatelliteinator.html" target="_blank">Point-A-Sateliteinator</a>.

Somos hackers e makers por natureza resolvemos aceitar o desafio dos organizadores da Lisbon Mini Maker Faire.

Trata-se de um dispositivo que literalmente aponta (com um dedo) para um satélite artificial.

[<img class="aligncenter size-medium wp-image-48" src="http://labs.oneoverzero.org/wp-content/uploads/2014/10/PAS-paint2113-300x199.jpg" alt="Point-A-Sateliteinator na Lisbon Mini Maker Faire" width="600" height="400" srcset="http://labs.oneoverzero.org/wp-content/uploads/2014/10/PAS-paint2113-300x199.jpg 300w, http://labs.oneoverzero.org/wp-content/uploads/2014/10/PAS-paint2113-225x150.jpg 225w" sizes="(max-width: 600px) 100vw, 600px" />](http://labs.oneoverzero.org/wp-content/uploads/2014/10/PAS-paint2113.jpg)

A ideia surge depois de termos tido conhecimento do site <a href="http://heavens-above.com/" title="Heavens Above" target="_blank">Heavens Above</a> e de ver regularmente a Estação Espacial Internacional (ISS) a passar sobre as nossas cabeças. 

Após muita discussão sobre a forma de executar o projecto, resolvemos seguir com uma construção baseada em materiais leves, neste caso kapaline. 

Por uma questão meramente prática o dispositivo que criámos dispõe de uma precisão aproximada, até porque as dimensões do próprio dispositivo impedem uma visualização exacta do objecto celeste.

Para o movimento de altura, entre o horizonte e a posição vertical, usamos um servo simples que executa um movimento de 90 graus.
  
Já o azimute necessita de girar 360 graus o que infelizmente não é possível fazer com servo simples, pelo que neste caso optamos por usar uma multiplicação de 1 para 2 com recurso a um elástico.

No que diz respeito aos satélites a &#8220;apontar&#8221;, escolhemos alguns que nos pareceram ser interessantes, um geo estacionário, o HISPASAT e três de órbitas variáveis. Para os de órbita variável, escolhemos a Estação Espacial Internacional (ISS), um satélite GPS e um satélite IRUDIUM.

A operacionalização deste projecto foi possível graças a um pequeno computador <a href="http://www.raspberrypi.org/help/what-is-a-raspberry-pi/" title="Raspberry Pi" target="_blank">Raspberry Pi</a>.

Usamos as informações disponíveis no <a href="http://www.celestrak.com/NORAD/elements/" title="Celestrak" target="_blank">Celestrak</a>, juntamente com um conjunto de scripts em python, que processam a informação, recolhendo os dados de altitude e azimute, e controlando directamente os servos.

Podem consultar a última versão do código que esteve a funcionar na Maker Faire no <a href="https://github.com/luisfcorreia/pas" title="github" target="_blank">github</a>.

Deixamos apenas um pormenor relevante, rapidamente percebemos que o &#8220;tracking&#8221; em tempo real do satélite era bastante lento, pelo que optamos por &#8220;aldrabar&#8221; um pouco e apresentar uma visão futura da localização do satélite. Por cada segundo que passava, avançamos 10 minutos.

Esta técnica permitia uma visualização mais simpática do movimento, mesmo sabendo que não correspondia à posição real.