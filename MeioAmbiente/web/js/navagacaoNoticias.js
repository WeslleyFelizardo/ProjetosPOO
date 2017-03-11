/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Atribuindo a função ao evento que e disparado apos carregar a pagina
window.onload = manipulandoNoticias;

function manipulandoNoticias(){
                    
                        var url = window.location.href; // obtendo a url completa
                        var idNoticia = url.charAt(48); // obtendo apenas o valor do parametro
                        
                        var tituloNoticia1 = "Ministro discute áreas protegidas no Amazonas";
                        var tituloNoticia2 = "Febre amarela põe em risco algumas espécies de macacos";
                        var tituloNoticia3 = "Acordo prevê ações sustentáveis no TSE";
                        var tituloNoticia4 = "Estudo mostrará situação das florestas em PE";
                        
                        var caminhoImgNoticia1 = "img/imgNoticia1.png";
                        var caminhoImgNoticia2 = "img/imgNoticia2.jpeg";
                        var caminhoImgNoticia3 = "img/imgNoticia3.jpg";
                        var caminhoImgNoticia4 = "img/imgNoticia4.jpg";
                        
                        // Escondendo e mostrando os elementos e trocando seus conteudos e atributos
                        if(idNoticia == "1"){
                            $("#2").hide();
                            $("#3").hide();
                            $("#4").hide();
                            $("#link1").text(tituloNoticia2);
                            $("#link2").text(tituloNoticia3);
                            $("#link3").text(tituloNoticia4);
                            $("#img1").attr("src", caminhoImgNoticia2);
                            $("#img2").attr("src", caminhoImgNoticia3);
                            $("#img3").attr("src", caminhoImgNoticia4);
                            $("#link1").attr("href", "news.html?id=2");
                            $("#link2").attr("href", "news.html?id=3");
                            $("#link3").attr("href", "news.html?id=4");
                            $("#imgLink1").attr("href", "news.html?id=2");
                            $("#imgLink2").attr("href", "news.html?id=3");
                            $("#imgLink3").attr("href", "news.html?id=4");
                        }
                        else if(idNoticia == "2"){
                            $("#1").hide();
                            $("#3").hide();
                            $("#4").hide();
                            $("#link1").text(tituloNoticia1);
                            $("#link2").text(tituloNoticia3);
                            $("#link3").text(tituloNoticia4);
                            $("#img1").attr("src", caminhoImgNoticia1);
                            $("#img2").attr("src", caminhoImgNoticia3);
                            $("#img3").attr("src", caminhoImgNoticia4);
                            $("#link1").attr("href", "news.html?id=1");
                            $("#link2").attr("href", "news.html?id=3");
                            $("#link3").attr("href", "news.html?id=4");
                            $("#imgLink1").attr("href", "news.html?id=1");
                            $("#imgLink2").attr("href", "news.html?id=3");
                            $("#imgLink3").attr("href", "news.html?id=4");
                        }
                        else if(idNoticia == "3"){
                            $("#1").hide();
                            $("#2").hide();
                            $("#4").hide();
                            $("#link1").text(tituloNoticia1);
                            $("#link2").text(tituloNoticia2);
                            $("#link3").text(tituloNoticia4);
                            $("#img1").attr("src", caminhoImgNoticia1);
                            $("#img2").attr("src", caminhoImgNoticia2);
                            $("#img3").attr("src", caminhoImgNoticia4);
                            $("#link1").attr("href", "news.html?id=1");
                            $("#link2").attr("href", "news.html?id=2");
                            $("#link3").attr("href", "news.html?id=4");
                            $("#imgLink1").attr("href", "news.html?id=1");
                            $("#imgLink2").attr("href", "news.html?id=2");
                            $("#imgLink3").attr("href", "news.html?id=4");
                        }
                        else if(idNoticia == "4") {
                            $("#1").hide();
                            $("#2").hide();
                            $("#3").hide();
                            $("#link1").text(tituloNoticia1);
                            $("#link2").text(tituloNoticia2);
                            $("#link3").text(tituloNoticia3);
                             $("#img1").attr("src", caminhoImgNoticia1);
                            $("#img2").attr("src", caminhoImgNoticia2);
                            $("#img3").attr("src", caminhoImgNoticia3);
                            $("#link1").attr("href", "news.html?id=1");
                            $("#link2").attr("href", "news.html?id=2");
                            $("#link3").attr("href", "news.html?id=3");
                            $("#imgLink1").attr("href", "news.html?id=1");
                            $("#imgLink2").attr("href", "news.html?id=2");
                            $("#imgLink3").attr("href", "news.html?id=3");
                        }
   
		}

