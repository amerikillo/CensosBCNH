/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasesJava;

import java.util.Vector;

/**
 *
 * @author Americo
 */
public class ElementosRepetidos {

    public Vector<String> cuentaElementos(Vector<String> v) {
        Vector<String> v2 = new Vector<String>();
        Vector<String> v3 = new Vector<String>();
        for (int i = 0; i < v.size(); i++) {
            int ban1 = 0;
            int tam = 0;
            for (int j = 0; j < v2.size(); j++) {
                if (v.elementAt(i).equals(v2.elementAt(j))) {
                    ban1 = 1;
                }
            }
            if (ban1 == 0) {
                v2.add(v.elementAt(i));
                for (int k = 0; k < v.size(); k++) {
                    System.out.println("***"+v.elementAt(i));
                    System.out.println(v.elementAt(k));
                    if (v.elementAt(i).equals(v.elementAt(k))) {
                        tam++;
                    }
                    System.out.println(tam);
                }
                System.out.println(v.elementAt(i) + "," + tam);
                v3.add(v.elementAt(i) + "," + tam);
            }
        }
        for (int i = 0; i < v3.size(); i++) {
            System.out.println("Elementos: " + v3.elementAt(i));
        }
        return(v3);
    }

}
