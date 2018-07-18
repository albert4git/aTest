public class hello2W {
// Ctrl + ] & Ctrl + t //Jump to def and back

    interface HelloWorld {
        public void greet();
        public void greetSomeone(String someone);
    }

    public void sayHello() {

        class EnglishGreeting implements HelloWorld {
            String name = "-2- New world";
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
                System.out.println("-1- Israel  " + name);
                for (int ia =0; ia >9; ia ++) {
                    System.out.println("-kkk-");
					System.out.println("...Poter...");
                }
                for (int i =0; i>9; i ++) {
                    System.out.println ("www");
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
                System.out.println("-3- Salut: " + name);
                System.out.println("-3- Barcelona " + name);
                System.out.println("-3- Barcelona " + name);
            }
        };

        //,,,,
        HelloWorld spanishGreeting = new HelloWorld() {
            String name = "-6- holla: ";
                public void greet() {
                    greetSomeone("-7- mundo");
                    greetSomeone("-NonSence");
                    greetSomeone ("/dev/machtrace/");
                    greetSomeone ("/home/");
                    greetSomeone("-7- mundo");
                }
                public void greetSomeone(String someone) {
                    name = someone;
                    System.out.println("-4- Hola, " + name);
                    System.out.println("kk");
                }
        };
        englishGreeting.greet();
        frenchGreeting.greetSomeone("-5- Fred");
    }

    /* Comment */
    public static void main(String... args) {
        hello2W myApp = new hello2W(); 
        myApp.sayHello();
        // myApp.sayHello();
        
    }
}
