/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorlexico;

import java.io.File;
/**
 *
 * @author Antho
 */
public class AnalizadorLexico {
    public static void main(String[] args) {
        String ruta = "C:/Users/Antho/Documents/NetBeansProjects/AnalizadorLexico/src/analizadorlexico/Lexer.flex";
        
        generarLexer(ruta);
    }
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        JFlex.Main.generate(archivo);
    }
}
