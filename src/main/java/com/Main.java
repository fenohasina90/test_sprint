package main.java.com;

// import main.java.com.annotation.ScannerRacineProjet;
import main.java.com.annote.ClasspathScanner;

public class Main {
    public static void main(String[] args) {
        // ScannerRacineProjet.scannerDepuisRacine();
        // DetecteurAnnotation.afficherClassesAnnotees();
        ClasspathScanner.scanClasspath();
    }
}
