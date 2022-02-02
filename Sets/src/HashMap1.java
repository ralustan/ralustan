import java.util.Map;
import java.util.HashMap;
import java.util.SortedMap;

public class HashMap1 {

    public static void main(String[] args) {
        //create a map using Hash Map
        HashMap<Integer, String> carti = new HashMap<>();

        // Insert elements to the map
        carti.put(1, "Aventura");
        carti.put(2, "Fictiune");
        carti.put(4, "Copii");
        carti.putIfAbsent(1, "SF");
        carti.put(3, "SF");
        System.out.println("Map: " + carti);

        // Access keys of the map
        System.out.println("Keys: " + carti.keySet());

        // Access values of the map

        for (String value : carti.values()) {
            System.out.print(value);
            System.out.print(", ");
        }

        // Access entries of the map
        System.out.println("Entries: " + carti.entrySet());

        // Remove Elements from the map
        String value = carti.remove(3);
        System.out.println("Removed Value: " + value);

        //replace
        carti.replace(2, "Dragoste");


        System.out.println("Values: " + carti.values());


    }
}
