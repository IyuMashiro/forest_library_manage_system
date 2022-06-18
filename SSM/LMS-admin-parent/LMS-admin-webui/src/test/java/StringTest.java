import com.LMS.forest.util.ForestUtil;
import org.junit.Test;

public class StringTest {
    @Test
    public void md5Test(){
        String source = "123456";
        String encode = ForestUtil.md5(source);
        System.out.println(encode);
    }
}
