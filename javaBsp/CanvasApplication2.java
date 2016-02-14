import java.awt.Dimension;

import javax.swing.JFrame;

public class CanvasApplication2 extends JFrame {

    public CanvasApplication2() {
        super("Canvas");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        getContentPane().add(new Canvas2(new Dimension(640, 480)));
        pack();
        setVisible(true);
    }

    public static void main(String[] args) {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    CanvasApplication2 gui = new CanvasApplication2();
                }
            });
    }
}
