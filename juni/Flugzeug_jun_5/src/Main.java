import java.util.ArrayList;
import java.util.List;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the highlighted text
        // to see how IntelliJ IDEA suggests fixing it.

        Passagierflugzeug passagierflugzeug = new Passagierflugzeug(Fahrzeugtyp.PASSAGIERFLUGZEUG, "bezeichung1", new Registrierung(Land.CH, "kennzeichung1", "besitzer1"), 23, 12, 13, 40.44);
        Transportflugzeug transportflugzeug = new Transportflugzeug(Fahrzeugtyp.TRANSPORTFLUGZEUG, "bez2", new Registrierung(Land.DE, "aa", "bb"), 2.3, 20, 30.4, 30.46);
        //Luftfahrzeug f1 = LuftfahrzeugFactory.createLuftfahrzeug(Fahrzeugtyp.PASSAGIERFLUGZEUG);
        Hubschrauber hubschrauber = new Hubschrauber(Fahrzeugtyp.HUBSCHRAUBER, "hub", new Registrierung(Land.AT, "kenn_hub", "bes_hub"), 34.5, 34, 456.5, true);

        List<Luftfahrzeug> luftfahrzeugenList = new ArrayList<>();
        Passagierflugzeug passagierflugzeug2 = new Passagierflugzeug(Fahrzeugtyp.PASSAGIERFLUGZEUG, "bezeichung2p", new Registrierung(Land.CH, "kennzeichung1", "besitzer1"), 23, 12, 13, 40.44);
        Passagierflugzeug passagierflugzeug3 = new Passagierflugzeug(Fahrzeugtyp.PASSAGIERFLUGZEUG, "bezeichung3p", new Registrierung(Land.CH, "kennzeichung1", "besitzer1"), 23, 12, 13, 40.44);
        Transportflugzeug transportflugzeug2 = new Transportflugzeug(Fahrzeugtyp.TRANSPORTFLUGZEUG, "bez2t", new Registrierung(Land.DE, "aa", "bb"), 2.3, 20, 30.4, 30.46);
        Transportflugzeug transportflugzeug3 = new Transportflugzeug(Fahrzeugtyp.TRANSPORTFLUGZEUG, "bez3t", new Registrierung(Land.DE, "aa", "bb"), 2.3, 20, 30.4, 30.46);
        Transportflugzeug transportflugzeug4 = new Transportflugzeug(Fahrzeugtyp.TRANSPORTFLUGZEUG, "bez4t", new Registrierung(Land.DE, "aa", "bb"), 2.3, 20, 30.4, 30.46);
        Hubschrauber hubschrauber2 = new Hubschrauber(Fahrzeugtyp.HUBSCHRAUBER, "hub2", new Registrierung(Land.AT, "kenn_hub", "bes_hub"), 34.5, 34, 456.5, true);
        Hubschrauber hubschrauber3 = new Hubschrauber(Fahrzeugtyp.HUBSCHRAUBER, "hub3", new Registrierung(Land.AT, "kenn_hub", "bes_hub"), 34.5, 34, 456.5, true);
        Hubschrauber hubschrauber4 = new Hubschrauber(Fahrzeugtyp.HUBSCHRAUBER, "hub4", new Registrierung(Land.AT, "kenn_hub", "bes_hub"), 34.5, 34, 456.5, true);
        Hubschrauber hubschrauber5 = new Hubschrauber(Fahrzeugtyp.HUBSCHRAUBER, "hub5", new Registrierung(Land.AT, "kenn_hub", "bes_hub"), 34.5, 34, 456.5, true);
        luftfahrzeugenList.add(passagierflugzeug);
        luftfahrzeugenList.add(passagierflugzeug2);
        luftfahrzeugenList.add(passagierflugzeug3);
        luftfahrzeugenList.add(transportflugzeug);
        luftfahrzeugenList.add(transportflugzeug2);
        luftfahrzeugenList.add(transportflugzeug3);
        luftfahrzeugenList.add(transportflugzeug4);
        luftfahrzeugenList.add(hubschrauber);
        luftfahrzeugenList.add(hubschrauber2);
        luftfahrzeugenList.add(hubschrauber3);
        luftfahrzeugenList.add(hubschrauber4);
        luftfahrzeugenList.add(hubschrauber5);


        for (Luftfahrzeug luftfahrzeug : luftfahrzeugenList) {
            if (luftfahrzeug instanceof Hubschrauber) {
                System.out.println(luftfahrzeug);
            }
        }

        sumHours(luftfahrzeugenList);

        minHours(luftfahrzeugenList);

        maxTransport(luftfahrzeugenList);

        checkRegistrationAT(luftfahrzeugenList);

        System.out.println("before seil betätigen: " + hubschrauber5.isStatusSeilwinde());
        hubschrauber5.seilwindeBetaetigen();
        System.out.println("before nach 1 betätigen: " + hubschrauber5.isStatusSeilwinde());
        hubschrauber5.seilwindeBetaetigen();
        System.out.println("before nach 2 betätigen: " + hubschrauber5.isStatusSeilwinde());

    }

    public static void sumHours(List<Luftfahrzeug> luftfahrzeugenList) {
        // gesamten Flugstunden aller Luftfahrzeuge
        double sumHour = 0;
        for (Luftfahrzeug luftfahrzeug : luftfahrzeugenList) {
            sumHour += luftfahrzeug.getAnzahlFlugstunden();
        }
        System.out.println("sumHours: " + sumHour);
    }

    static void minHours(List<Luftfahrzeug> luftfahrzeugenList) {
        // wenigsten Flugstunden
        double minHour = Double.MAX_VALUE;
        for (Luftfahrzeug luftfahrzeug : luftfahrzeugenList) {

            if (luftfahrzeug instanceof Passagierflugzeug) {
                double flugStd = luftfahrzeug.getAnzahlFlugstunden();
                if (flugStd < minHour) {
                    minHour = flugStd;
                }
            }
        }
        System.out.println("min hours: " + minHour);
    }

    static void maxTransport(List<Luftfahrzeug> luftfahrzeugenList) {
        // Hubschrauber mit der Max. Transportkapazität
        double maxTra = Double.MIN_VALUE;
        for (Luftfahrzeug luftfahrzeug : luftfahrzeugenList) {
            if (luftfahrzeug instanceof Hubschrauber) {
               double tra = ((Hubschrauber) luftfahrzeug).getMaxTransportkapa();
               if(tra > maxTra) {
                   maxTra = tra;
               }
            }
        }
        System.out.println("Max Transport: " + maxTra);
    }

    static void checkRegistrationAT(List<Luftfahrzeug> luftfahrzeugenList) {
        System.out.println("------------AT------------");
        for (Luftfahrzeug luftfahrzeug : luftfahrzeugenList) {
            if(luftfahrzeug.getRegistrierung().getLand().equals(Land.AT)) {
                System.out.println(luftfahrzeug);
            }
        }
        System.out.println("------------AT-ENDE-----------");

    }
}