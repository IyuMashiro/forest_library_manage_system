import com.LMS.forest.entity.Admin;
import com.LMS.forest.mapper.AdminMapper;
import com.LMS.forest.service.api.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-persist-mybatis.xml", "classpath:spring-persist-tx.xml"})
public class forestTest {
    @Autowired
    private DataSource dataSource;

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private AdminService adminService;

    @Test
    public void testTx(){
        Admin admin = new Admin(null,"kano","kano","123456");
        adminService.saveAdmin(admin);
    }

    @Test
    public void testing(){
        Logger logger = LoggerFactory.getLogger(forestTest.class);

        logger.debug("Debug level");
        logger.debug("Debug level");
        logger.debug("Debug level");

        logger.info("Info level");
        logger.info("Info level");
        logger.info("Info level");


        logger.warn("Warn level");
        logger.warn("Warn level");
        logger.warn("Warn level");

        logger.error("error level");
        logger.error("error level");
        logger.error("error level");
    }



    @Test
    public void testInsertAdmin(){
        Admin admin = new Admin(null,"kix","x","123456");
        int count = adminMapper.insert(admin);
        System.out.println("受影响的条数"+count);
    }

    @Test
    public void testConnection()throws SQLException {
        Connection connection = dataSource.getConnection();
        System.out.println(connection);
    }


}
