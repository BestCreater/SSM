
import com.alibaba.fastjson.JSONObject;
import entity.LogLogin;
import entity.Staff;
import entity.User;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Transaction;
import service.*;
import utils.Http;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class MyTest {
//    @Test
//    public int[] twoSum(int[] nums, int target) {
//        int [] twoSum=new int[2];
//        for(int i=0;i<nums.length-1;i++){
//            for(int j=i+1;j<nums.length;j++){
//                if (nums[i]+nums[j]==target){
//                    twoSum[0]=i;
//                    twoSum[1]=j;
//                    break;
//                }
//            }
//        }
//        System.out.println(Arrays.toString(twoSum));
//        return twoSum;
//    }
    @Test
    public void Redis(){
        Jedis jedis=new Jedis("8.130.23.151",6379);
        System.out.println(jedis.ping());
        System.out.println("清空数据"+jedis.flushDB());
        System.out.println("判断键是否存在"+jedis.exists("username"));
        System.out.println("新增键"+jedis.set("username","admin"));
        System.out.println("新增键"+jedis.set("pwd","admin123pwd"));
        System.out.println("所有键：");
        Set<String> keys=jedis.keys("*");
        System.out.println(keys);
        System.out.println("删除键"+jedis.del("pwd"));
        System.out.println("判断键是否存在"+jedis.exists("pwd"));
        System.out.println("返回随机键"+jedis.randomKey());
        System.out.println("重命名"+jedis.rename("username","Admin"));
        System.out.println("重命名后"+jedis.get("Admin"));
        System.out.println("根据索引查询"+jedis.select(0));
        System.out.println("清空当前库"+jedis.flushDB());
        System.out.println("清空所有库"+jedis.flushAll());
        System.out.println("当前库key数目"+jedis.dbSize());
    }
    @Test
    public void redisTX(){
        Jedis jedis=new Jedis("8.130.23.151",6379);
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("username","admin");
        jsonObject.put("password","hnist");
        //开启事务
        Transaction multi = jedis.multi();
        try {
            multi.watch("user1","user2");//乐观锁
            multi.set("user1",jsonObject.toJSONString());
            multi.set("user2",jsonObject.toJSONString());
            multi.exec();//提交事务
        }catch (Exception e){
            multi.discard();//放弃事务
            e.printStackTrace();
        }finally {
            System.out.println(jedis.mget("user1","user2"));
            jedis.close();
        }

    }
    @Test
    public void asd(){
         Map<String, String> channels=new ConcurrentHashMap<>();
         if (channels.isEmpty()){
             System.out.println(123);
         }if (channels.keySet().isEmpty()){
            System.out.println(4564);
        }
    }
    @Test
    public void testsd(){
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService =(UserService)context.getBean("UserServiceImpl");
        StaffService staffService=(StaffService)context.getBean("StaffServiceImpl");
        LogService logService=(LogService)context.getBean("LogServiceImpl");
        System.out.println(logService.pageLog(null,1));
        User user=new User();
        user.setUser_id(2);
        user.setUsername("super");
        user.setEmail("567@");
        user.setPassword("2222222");
        System.out.println(userService.userInfo(null,1));

//        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserService userService =(UserService)context.getBean("UserServiceImpl");
////        for (User user:userService.userInfo("超级",0)) {
////            System.out.println(user);
////        }
//        System.out.println(userService.updateUser(2,"on"));
//        int arr[]=new int[5];
//        SecureRandom r=new SecureRandom();
//        for (int i = 0; i <5 ; i++) {
//            int temp=r.nextInt(10);
//            for (int j = 0; j <arr.length ; j++) {
//                if (arr[j]==temp){i--;break;}
//                else if (j==arr.length-1){ arr[i]=temp;}
//            }
//        }
//        Arrays.sort(arr);
//        System.out.println(Arrays.toString(arr));
    }
    @Test
    public void address(){
//        JSONObject object=SendReq("http://pv.sohu.com/cityjson?ie=utf-8")

        String st=Http.sendGet("https://ip.ws.126.net/ipquery","ip=190.20.0.1");
        Map<String,Object> address=JSONObject.parseObject(st);
        System.out.println(address);
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
        LogService logService =(LogService) context.getBean("LogServiceImpl");
        UserService userService=(UserService)context.getBean("UserServiceImpl");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        User user=new User();
        user.setUsername("Admin");
        user.setPassword("123456");
        System.out.println(userService.login(user));
//        user.setUser_id(1);
//        logService.addLogLogin(new LogLogin(1,user,System.currentTimeMillis(),new Date(),"190.20.0.1",address.get("province").toString()+address.get("city").toString()));
//        System.out.println(logService.logLogin(null,1));
    }
}
