

/**
swing sliders taken from http://wiki.processing.org/index.php?title=Swing_JSliders_with_Processing
@author Ira Greenberg
http://wiki.processing.org/w/Swing_JSliders
 
Put ''Kite.java'' and KiteController.java in their own 
files and follow instructions outlined above.
*/
 
/*******************************
      KiteController class
*******************************/
//import com.iragreenberg.Kite;
//import java.awt.*;
//import javax.swing.event.*;
//import javax.swing.*;
 
//public class KiteController extends JPanel {
 
  private int w = 600, h = 422;
  private Kite kite;
 
  // constructor
  public KiteController() {
    setBackground(new Color(180, 180, 220));
 
    /* create 2 pane across layout
     left pane holds processing PApplet
     right pane holds user widgets */
    setLayout(new BoxLayout(this, BoxLayout.LINE_AXIS));
 
    // Instantiate Kite object
    kite = new Kite(400, 400);
 
    // right tools pane
    JPanel rtPanel = new JPanel();
    rtPanel.setOpaque(false);
    rtPanel.setLayout(new BoxLayout(rtPanel, BoxLayout.PAGE_AXIS));
 
    JLabel jl = new JLabel("   Drag the Kite String");
 
    // kite radius slider
    JSlider js0 = new JSlider(JSlider.HORIZONTAL, 10, 100, 40);
    js0.setBorder(BorderFactory.createTitledBorder("Kite Radius"));
    js0.setMajorTickSpacing(30);
    js0.setMinorTickSpacing(4);
    js0.setPaintTicks(true);
    js0.setPaintLabels(true);
 
    // handle js0 change events
    js0.addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent evt) {
        JSlider slider = (JSlider)evt.getSource();
 
        if (!slider.getValueIsAdjusting()) {
          kite.setRadius(slider.getValue());
        }
      }
    }
    );
 
    // kite sides slider
    JSlider js1 = new JSlider(JSlider.HORIZONTAL, 3, 63, 4);
    js1.setBorder(BorderFactory.createTitledBorder("Kite Sides"));
    js1.setMajorTickSpacing(12);
    js1.setMinorTickSpacing(1);
    js1.setPaintTicks(true);
    js1.setPaintLabels(true);
 
    // handle js1 change events
    js1.addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent evt) {
        JSlider slider = (JSlider)evt.getSource();
 
        if (!slider.getValueIsAdjusting()) {
          kite.setFeetCount(slider.getValue());
        }
      }
    }
    );
 
    // spring speed slider
    JSlider js2 = new JSlider(JSlider.HORIZONTAL, 1, 10, 5);
    js2.setBorder(BorderFactory.createTitledBorder("Spring Speed"));
    js2.setMajorTickSpacing(3);
    js2.setMinorTickSpacing(1);
    js2.setPaintTicks(true);
    js2.setPaintLabels(true);
 
    // handle js2 change events
    js2.addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent evt) {
        JSlider slider = (JSlider)evt.getSource();
 
        if (!slider.getValueIsAdjusting()) {
          kite.setSpringSpeed(slider.getValue()/20.0f);
        }
      }
    }
    );
 
    // spring damping slider
    JSlider js3 = new JSlider(JSlider.HORIZONTAL, 1, 10, 4);
    js3.setBorder(BorderFactory.createTitledBorder("Spring Damping"));
    js3.setMajorTickSpacing(1);
    js3.setMinorTickSpacing(1);
    js3.setPaintTicks(true);
    js3.setPaintLabels(true);
 
    // handle js3 change events
    js3.addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent evt) {
        JSlider slider = (JSlider)evt.getSource();
 
        if (!slider.getValueIsAdjusting()) {
          kite.setSpringDamping(1.0f - slider.getValue()/30.0f);
        }
      }
    }
    );
 
    // assemble tools pane
    rtPanel.add(jl);
    rtPanel.add(Box.createRigidArea(new Dimension(0,10)));
    rtPanel.add(js0);
    rtPanel.add(Box.createRigidArea(new Dimension(0,8)));
    rtPanel.add(js1);
    rtPanel.add(Box.createRigidArea(new Dimension(0,8)));
    rtPanel.add(js2);
    rtPanel.add(Box.createRigidArea(new Dimension(0,8)));
    rtPanel.add(js3);
 
 
    // Next comment taken directly from PApplet class: 
    /* "...ensures that the animation thread is started 
     and that other internal variables are properly set."*/
    kite.init(); 
 
    // add panes to larger JPanel
    add(kite);
    // create some space between panes
    add(Box.createRigidArea(new Dimension(4,0)));
    add(rtPanel);
    // add a little margin on right of panel
    add(Box.createRigidArea(new Dimension(4,0)));
  }
 
  // create external JFrame
  private static void createGUI() {
    // create new JFrame
    JFrame jf = new JFrame("Kite Swing Application");
 
    // this allows program to exit
    jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
 
    // You add things to the contentPane in a JFrame
    jf.getContentPane().add(new KiteController());
 
    // keep window from being resized
    jf.setResizable(false);
 
    // size frame
    jf.pack();
 
    // make frame visible
    jf.setVisible(true);
  }
 
  public static void main(String[] args) {
    // threadsafe way to create a Swing GUI
    javax.swing.SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        createGUI();
      }
    }
    );
  }
}
 
