//
//  Data.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 24/11/20.
//

import Foundation
import SwiftUI


var categories:[Category] = []
var category:Category = Category()
var subcategories:[Subcategory] = []
var subcategory:Subcategory = Subcategory()
var link:Link = Link()

func adicionaCategoria(){
    category.title = "Computação"
    category.content = "Ciência da Computação é a ciência que estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas, que automatizem os processos e desenvolvam soluções de processamento de dados de entrada e saída pautado no computador, de forma que se transforme em informação."
    //link 1
   link.titulo = "8 Coisas Para Você Saber Antes de Fazer Ciência da Computação"
    link.url = "https://medium.com/@thiago.barbosa/8-coisas-para-voce-saber-antes-de-fazer-ciencia-da-computacao-37fdffbc6156"
    link.image = Image("8 Coisas Para Você Saber Antes de Fazer Ciência da Computação")
    category.links.append(link)
    //2
    link.titulo = "Ganhando experiência em uma nova área"
     link.url = "https://medium.com/@edersantana/ganhando-experiência-em-uma-nova-área-de-trabalho-sem-pedir-permissão-pra-ninguém-a57fdfaae8ae"
     link.image = Image("ganhando experiencia em uma nova area")
     category.links.append(link)
    //3
    link.titulo = "10 cursos para quem gosta de tecnologia"
     link.url = "https://vaidebolsa.com.br/cursos-para-quem-gosta-de-tecnologia/"
     link.image = Image("10 cursos para quem gosta de tecnologia")
     category.links.append(link)
    //4
    link.titulo = "Áreas de atuação em computação"
     link.url = "https://blog.enem.com.br/areas-de-atuacao-em-computacao/"
     link.image = Image("areas de atuacao em computacao")
     category.links.append(link)
    
    
    //subcategorias
    //1
    subcategory.title = "Segurança da Informação"
    subcategory.content = "É a área responsável por montar uma  barreira de segurança para que dados não estejam ao alcance de golpistas e ataques digitais."
    subcategory.image = Image("seguranca da informacao")
    category.subcategory.append(subcategory)
    //2
    subcategory.title = "Engenharia de Software"
    subcategory.content = "É a área voltada à especificação, desenvolvimento, manutenção e criação de software, com a aplicação de práticas de gerência de projetos."
    subcategory.image = Image("engenharia de software")
    category.subcategory.append(subcategory)
    //3
    subcategory.title = "Ciência de Dados"
    subcategory.content = "Estudo e a análise de dados econômicos, financeiros e sociais, que visa a extração de conhecimento e detecção de padrões."
    subcategory.image = Image("ciencia de dados")
    category.subcategory.append(subcategory)
    //4
    subcategory.title = "Robótica"
    subcategory.content = "É a área que trata de sistemas compostos por partes mecânicas automáticas e controladas por circuitos integrados.."
    subcategory.image = Image("robotica")
    category.subcategory.append(subcategory)

}
