//
//  Data.swift
//  TiGuia
//
//  Created by Dara Vasconcelos on 24/11/20.
//

import Foundation
import SwiftUI

class Data{
    static var categories:[Category] = []
    var category:Category = Category()
  //  var subcategories:[Subcategory] = []
    var subcategory:Subcategory = Subcategory()
    var link:Link = Link()
    
    init() {
        self.category.title = "Computação"
        self.category.content = "Ciência da Computação é a ciência que estuda as técnicas, metodologias, instrumentos computacionais e aplicações tecnológicas, que automatizem os processos e desenvolvam soluções de processamento de dados de entrada e saída pautado no computador, de forma que se transforme em informação."
        Data.categories.append(self.category)
        //link 1
        self.link.titulo = "8 Coisas Para Você Saber Antes de Fazer Ciência da Computação"
        self.link.url = "https://medium.com/@thiago.barbosa/8-coisas-para-voce-saber-antes-de-fazer-ciencia-da-computacao-37fdffbc6156"
        self.link.image = "8 Coisas Para Você Saber Antes de Fazer Ciência da Computação"
        self.category.links.append(link)
        //2
        self.link.titulo = "Ganhando experiência em uma nova área"
        self.link.url = "https://medium.com/@edersantana/ganhando-experiência-em-uma-nova-área-de-trabalho-sem-pedir-permissão-pra-ninguém-a57fdfaae8ae"
        self.link.image = "ganhando experiencia em uma nova area"
        self.category.links.append(link)
        //3
        self.link.titulo = "10 cursos para quem gosta de tecnologia"
        self.link.url = "https://vaidebolsa.com.br/cursos-para-quem-gosta-de-tecnologia/"
        self.link.image = "10 cursos para quem gosta de tecnologia"
        self.category.links.append(link)
        //4
        self.link.titulo = "Áreas de atuação em computação"
        self.link.url = "https://blog.enem.com.br/areas-de-atuacao-em-computacao/"
        self.link.image = "areas de atuacao em computacao"
        self.category.links.append(link)
        
        
        //subcategorias
        //1
        self.subcategory.title = "Segurança da Informação"
        self.subcategory.content = "É a área responsável por montar uma  barreira de segurança para que dados não estejam ao alcance de golpistas e ataques digitais."
        self.subcategory.image = "seguranca da informacao"
        category.subcategories.append(subcategory)
        print(category.subcategories[0].title)
        //2
        subcategory = Subcategory()
        self.subcategory.title = "Engenharia de Software"
        self.subcategory.content = "É a área voltada à especificação, desenvolvimento, manutenção e criação de software, com a aplicação de práticas de gerência de projetos."
        self.subcategory.image = "engenharia de software"
        category.subcategories.append(subcategory)
        print(category.subcategories[0].title)
        print(category.subcategories[1].title)


        //3
        subcategory = Subcategory()
        self.subcategory.title = "Ciência de Dados"
        self.subcategory.content = "Estudo e a análise de dados econômicos, financeiros e sociais, que visa a extração de conhecimento e detecção de padrões."
        self.subcategory.image = "ciencia de dados"
        self.category.subcategories.append(subcategory)
        //4
        subcategory = Subcategory()
        self.subcategory.title = "Robótica"
        self.subcategory.content = "É a área que trata de sistemas compostos por partes mecânicas automáticas e controladas por circuitos integrados.."
        self.subcategory.image = "robotica"
        self.category.subcategories.append(subcategory)
        
        //5 teste
        subcategory = Subcategory()
        self.subcategory.title = "hgfhsgudfgsud"
        self.subcategory.content = "É a área que trata de sistemas compostos por partes mecânicas automáticas e controladas por circuitos integrados.."
        self.subcategory.image = "robotica"
        self.category.subcategories.append(subcategory)
        
        // sub da sub
        subcategory = Subcategory()
        self.subcategory.title = "Ciência de Dados"
        self.subcategory.content = "Estudo e a análise de dados econômicos, financeiros e sociais, que visa a extração de conhecimento e detecção de padrões."
        self.subcategory.image = "ciencia de dados"
        self.category.subcategories[0].subcategories.append(subcategory)
        
        subcategory = Subcategory()
        self.subcategory.title = "Ciência de Dados"
        self.subcategory.content = "Estudo e a análise de dados econômicos, financeiros e sociais, que visa a extração de conhecimento e detecção de padrões."
        self.subcategory.image = "ciencia de dados"
        self.category.subcategories[1].subcategories.append(subcategory)
    }
    
    func returnCategory() -> Category {
        return self.category
    }
}



