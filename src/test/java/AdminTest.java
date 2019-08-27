import com.baizhi.Application;
import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class AdminTest {
    @Autowired
    private AdminService adminService;

    //1.根据用户名查找
    @Test
    public void findByUsername() {
        Admin admin = adminService.findByUsername("admin");
        System.out.println(admin);
    }

}
