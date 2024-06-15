import java.net.URL;
import java.net.URLClassLoader;
import java.lang.reflect.Method;

public class Main {
    public static void main(String[] args) {
        try {
            URL[] classLoaderUrls = new URL[]{new URL("file:./calculator.jar")};
            
	    URLClassLoader urlClassLoader = new URLClassLoader(classLoaderUrls);
            
	    Class<?> calculatorClass = urlClassLoader.loadClass("com.example.Calculator");
            
	    Object calculatorInstance = calculatorClass.getDeclaredConstructor().newInstance();
            
	    Method addMethod = calculatorClass.getMethod("add", int.class, int.class);
            int result = (int) addMethod.invoke(calculatorInstance, 3, 3);
            System.out.println("Result of addition: " + result);
            
	    urlClassLoader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

