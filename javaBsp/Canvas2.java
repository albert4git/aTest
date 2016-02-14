import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;

import javax.swing.JPanel;


public class Canvas2 extends JPanel {
    private Dimension preferredSize;

    public Canvas2(Dimension preferredSize) {
        this.preferredSize = preferredSize;
    }

    public Dimension getPreferredSize() {
        return preferredSize;
    }

    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Dimension size = getSize();
        int width = (int) size.getWidth();
        int height = (int) size.getHeight();
        g.drawLine(0, 0, width - 1, height - 1);
        g.drawLine(width - 1, 0, 0, height - 1);
        g.setColor(Color.BLUE);
        g.fillOval(width / 2 - 32, height / 2 - 32, 64, 64);
        g.setColor(Color.RED);
        g.drawString("This is Swing!", 60, 60);
        g.drawPolygon(new int[]{50,  100,  40, 110, 75},
                      new int[]{200,  200,  260, 260, 290}, 5);
    }
}
