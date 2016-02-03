public class helloW {
// Ctrl + ] & Ctrl + t //Jump to def and back

    interface HelloWorld {
        public void greet();
        public void greetSomeone(String someone);
    }

    public void sayHello() {

        class EnglishGreeting implements HelloWorld {
            String name = "-2- world";
            public void greet() {
                greetSomeone("world-woche ");
                greetSomeone("-NonSence");
                greetSomeone("tout le monde");
                for (int a =0; a < 9; a++) {
                    greetSomeone("Kontroll");
                }
            }
            public void greetSomeone(String someone) {
                name = someone;
                System.out.println("-1- Hello  " + name);
                System.out.println("-1- Hello  " + name);
                System.out.println("-1- Hello  " + name);
                System.out.println("-1- Hello  " + name);
                System.out.println("-1- Ciao  " + name);
                System.out.println("-1- Ciao  " + name);
                System.out.println("-1- Ciao  " + name);
                System.out.println("-1- Ciao  " + name);
                for (int ia =0; ia >9; ia ++) {
                    System.out.println("-kkk-");
                }
                for (int i =0; i>9; i ++) {
                    System.out.println ("www");
                    System.out.println ("S.Korea");
                    System.out.println ("N.Korea");
                    System.out.println ("Soul");
                    System.out.println ("China");
                    System.out.println ("China");
                    System.out.println ("China");
                    System.out.println ("China");
                    System.out.println ("China");
                }

            }
        }

        HelloWorld englishGreeting = new EnglishGreeting(); // ]]]]

        HelloWorld frenchGreeting = new HelloWorld() {
            String name = "tout le monde";
            public void greet() {
                greetSomeone("tout le monde");
            }
            public void greetSomeone(String someone) {
                name = someone;
                System.out.println("-3- Salut " + name);
            }
        };

        HelloWorld spanishGreeting = new HelloWorld() {
            String name = "-6- mundo";
            public void greet() {
                greetSomeone("-7- mundo");

            }
            public void greetSomeone(String someone) {
                name = someone;
                System.out.println("-4- Hola, " + name);
            }
        };
        englishGreeting.greet();
        frenchGreeting.greetSomeone("-5- Fred");
        frenchGreeting.greetSomeone("-5- Tai");
        spanishGreeting.greet();
    }

    public static void main(String... args) {
        helloW myApp = new helloW();
        myApp.sayHello();
        // myApp.sayHello();
    }
}
