---
id: 696
title: 'Anda comigo ver os aviões&#8230; Com um Raspberry Pi'
date: 2015-02-25T13:00:22+00:00
author: Nuno Correia
layout: post
guid: /?p=696
slug: /anda-comigo-ver-os-avioes-com-um-raspberry-pi/
twitterCardType:
  - summary_large_image
cardImageWidth:
  - "320"
cardImageHeight:
  - "320"
categories:
  - Projectos
  - Tutorials
tags:
  - ads-b
  - Raspberry Pi
  - rtl-sdr
  - sdr
---
Não&#8230; não é sobre a música de &#8220;[Os Azeitonas](http://pt.wikipedia.org/wiki/Os_Azeitonas "Os Azeitonas")&#8221; que estamos a falar, mas como conseguir ver os aviões em nossa casa recorrendo a um Raspberry Pi e um _dongle_ usb cuja utilização inicial seria para ver TV digital no computador.

<img class="aligncenter wp-image-701 size-full" src="/wp-content/uploads/2015/02/ne_r820t_1g.jpg" alt="_ne_r820t_1g" width="458" height="458" srcset="/wp-content/uploads/2015/02/ne_r820t_1g.jpg 458w, /wp-content/uploads/2015/02/ne_r820t_1g-150x150.jpg 150w, /wp-content/uploads/2015/02/ne_r820t_1g-300x300.jpg 300w, /wp-content/uploads/2015/02/ne_r820t_1g-280x280.jpg 280w" sizes="(max-width: 458px) 100vw, 458px" />

Aparentemente, estes dispositivos possuem um sintonizador, que usando drivers ligeiramente alterados permitem transformá-lo num [rádio definido por software](http://pt.wikipedia.org/wiki/R%C3%A1dio_Definido_por_Software "SDR") (em inglês: <span lang="en" xml:lang="en"><i><b>S</b>oftware <b>D</b>efined <b>R</b>adio</i></span> ou SDR) e com o qual podemos &#8220;espreitar&#8221; as ondas do éter compreendidas entre os 24 e os 1766MHz (chipset RTL2832U + sintonizador Rafael Micro R820T), o que nos permite por menos de 20€ ter um rádio definido por software a um preço bem acessivel.

&#8220;Então e a cena dos aviões, pah!?!&#8221;, ok, ok&#8230; Então como é que vamos conseguir ver os aviões? Os aviões transmitem na frequência 1090MHz a sua identificação, altitude, velocidade, direção, latitude, longitude, o que nos permite colocá-lo no mapa e vermos a sua progressão.

Depois de finalizarmos a instalação inicial do [Raspbian](http://www.raspbian.org/ "Raspbian") no nosso Raspberry Pi (expansão do espaço no cartão sd e alteração da password que vem por defeito para o utlizador _pi_) devemos actualizar o nosso sistema operativo com as ultimas actualizações através dos seguintes comandos:
  
`<br />
sudo apt-get update<br />
sudo apt-get upgrade<br />
` 
  
Tendo o nosso Raspberry Pi com o software fresquinho, vamos adicionar mais uns pózinhos:
  
`<br />
sudo apt-get install git cmake libusb-1.0-0-dev build-essential<br />
` 
  
Terminada a instalação, já nos vai ser possível clonar o repositório onde se encontram os drivers e aplicações que nos irão permitir aceder a todas as frequências que o sintonizador consegue &#8220;ouvir&#8221;.
  
`<br />
sudo git clone git://git.osmocom.org/rtl-sdr.git<br />
` 
  
Tchanan! Agora vamos passar à instalação;
  
`<br />
cd rtl-sdr/<br />
mkdir build<br />
cd build<br />
cmake ../ -DINSTALL_UDEV_RULES=ON<br />
make<br />
sudo make install<br />
sudo ldconfig<br />
cd ~<br />
sudo cp ./rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/<br />
` 
  
Agora vamos criar um ficheiro novo com
  
`<br />
sudo nano /etc/modprobe.d/raspi-blacklist.conf<br />
` 
  
e adicionam as linhas seguintes:
  
`<br />
blacklist dvb_usb_rtl28xxu<br />
blacklist rtl2832<br />
blacklist rtl2830<br />
` 
  
Para gravar e sair _Ctrl+X_ e depois
  
`<br />
sudo reboot<br />
` 
  
Se tudo correu como era suposto correr&#8230; bem&#8230; então quando executarmos o próximo comando o dongle será detectado
  
`<br />
rtl_test<br />
` 
  
Pois bem, se o Raspberry Pi já detecta o nosso _dongle_ DVB-T, vamos então descodificar os sinais que andam pelos 1090MHz e para isso vamos instalar o _dump1090_ que nos vai permitir descodificar o sinal bem como visualizarmos em qualquer _browser_ os aviões num mapa. Então vamos lá&#8230;
  
`<br />
cd ~ (goes to your home directory)<br />
git clone git://github.com/mutability/dump1090.git</p>
<p>cd dump1090<br />
make<br />
` 

Portanto, quando a compilação do programa terminar já o podemos executar usando
  
`./dump1090 --interactive`
  
Se a antena do _dongle_ estiver perto de uma janela e não houver muitos obstáculos à volta devem começar a aparecer no ecran alguns aviões, mas ainda vamos afinar mais um bocadinho o nosso setup.
  
Antes de continuarmos à procura dos aviões, vamos verificar qual a margem de erro do nosso sintonizador, e para isso vamos fazer mais uns testes e vamos executar o próximo comando e deixá-lo correr durante uns 5 minutos
  
`rtl_test -p`
  
Passados os 5 minutos façam Ctrl+C e anotem o valor de erro acumulado (no meu caso é de 55ppm) e agora sim, vamos executar o dump1090 com tudo e mais um par de botas (mais ou menos)
  
`<br />
cd ~/dump1090/<br />
./dump1090 --enable-agc --net --aggressive --fix --metric --ppm 55<br />
` 
  
Agora sim, em principio devemos &#8220;ver&#8221; mais aviões (desde que eles estejam lá), embora a antena stock não esteja optimizada para a frequência em causa e seja bastante [fácil](http://antirez.com/news/46 "ADS-B Dipole DIY") fazer uma.
  
Agora é só abrir um browser e colocar o endereço de ip do Raspberry Pi e a porta 8080
  
`<br />
http://endereco.ip.do.raspberry.pi:8080<br />
` 
  
[<img class="aligncenter size-large wp-image-706" src="/wp-content/uploads/2015/02/2015-02-22-184115_1024x744_scrot-1024x744.png" alt="2015-02-22-184115_1024x744_scrot" width="640" height="465" srcset="/wp-content/uploads/2015/02/2015-02-22-184115_1024x744_scrot.png 1024w, /wp-content/uploads/2015/02/2015-02-22-184115_1024x744_scrot-300x218.png 300w, /wp-content/uploads/2015/02/2015-02-22-184115_1024x744_scrot-280x203.png 280w" sizes="(max-width: 640px) 100vw, 640px" />](/wp-content/uploads/2015/02/2015-02-22-184115_1024x744_scrot.png)
  
Et voilá! O vosso próprio <a title="FlightRadar24" href="http://www.flightradar24.com/" target="_blank">Flightradar24</a> ou <a title="FlightAware" href="https://flightaware.com/live/" target="_blank">Flight Aware</a>, projectos para os quais podem participar, como podem ver <a title="PiAware" href="http://flightaware.com/adsb/piaware/" target="_blank">aqui</a> e <a title="FlightRadar24 e DVB-T Stick" href="http://www.flightradar24.com/dvbt-stick" target="_blank">aqui</a>.