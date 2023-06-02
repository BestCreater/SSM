import org.junit.Test;
import utils.Http;

//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//
//import service.StaffService;
//
//
public class JunitTest {
//    @Autowired
//
//    private StaffService staffService;
    @Test
    public void addStaff(){
        System.out.println(Http.sendGet("http://47.112.156.17/api/uic/user/getCurrentUser", ""));
//        System.out.println(staffService.staffInfo("", 1));
    }

}
