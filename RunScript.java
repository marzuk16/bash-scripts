import java.io.IOException;
import java.io.InputStream;

public class RunScript {
    public static void main(String[] args) {
        try {
            //Run the process
            Process p = Runtime.getRuntime().exec("./play.sh");
            //Get the input stream
            InputStream is = p.getInputStream();

            //Read script execution results
            int i=0;
            StringBuffer sb = new StringBuffer();
            while((i = is.read()) != -1) sb.append((char)i);

            System.out.println(sb.toString());
        } catch (IOException e) {
            //TODO: handle exception
            e.printStackTrace();
        }
    }
}