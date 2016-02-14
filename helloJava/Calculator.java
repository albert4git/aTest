import java.awt.BorderLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;

public class Calculator extends JFrame {

    public Calculator() {
        super("Calculator");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        getContentPane().setLayout(new BorderLayout());
        JLabel display = new JLabel("0", SwingConstants.RIGHT);
        JPanel buttonsPanel = new JPanel(new GridLayout(6, 3));
        buttonsPanel.add(new JButton("AC"));
        buttonsPanel.add(new JButton("+"));
        buttonsPanel.add(new JButton("-"));
        buttonsPanel.add(new JButton("C"));
        buttonsPanel.add(new JButton("*"));
        buttonsPanel.add(new JButton("/"));
        buttonsPanel.add(new JButton("7"));
        buttonsPanel.add(new JButton("8"));
        buttonsPanel.add(new JButton("9"));
        buttonsPanel.add(new JButton("4"));
        buttonsPanel.add(new JButton("5"));
        buttonsPanel.add(new JButton("6"));
        buttonsPanel.add(new JButton("1"));
        buttonsPanel.add(new JButton("2"));
        buttonsPanel.add(new JButton("3"));
        buttonsPanel.add(new JButton("."));
        buttonsPanel.add(new JButton("0"));
        buttonsPanel.add(new JButton("="));
        getContentPane().add(display, BorderLayout.NORTH);
        getContentPane().add(buttonsPanel, BorderLayout.CENTER);
        pack();
        setVisible(true);
    }

    public static void main(String[] args) {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    Calculator gui = new Calculator();
                }
            });
    }
}
