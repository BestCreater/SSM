//import org.junit.After;
//import org.junit.Test;
//import redis.clients.jedis.Jedis;
//import redis.clients.jedis.Transaction;
//
//public class TestJedisTx {
//    @After
//    public void cleanUsage(){
//        //在junit的单元测试中,用thread创建多个线程时,
//        //单元测试并不会等待主线程下启动的新线程是否执行结束,
//        //只要主线程结束完成,单元测试就会关闭,导致主线程中启动的新线程不能顺利执行完!
//        //由于这里的主线程由Junit提供，所以我直接在@After里面sleep
//        try {
//            Thread.sleep(2*1000);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
//    }
//
//
//    //乐观锁
//    @Test
//    public void testSyn(){
//        Thread t1 = new Thread(()->{
//            Jedis t1Jedis =  new Jedis("8.130.23.151",6379);
//            Transaction t1RedisTransaction = t1Jedis.multi();
//            t1RedisTransaction.set("money","200");
//            System.out.println("money修改成200:" + t1RedisTransaction.exec());
//            t1Jedis.close();
//        });
//        Thread t2 = new Thread(()->{
//            //监控money
//            Jedis t2Jedis =  new Jedis("8.130.23.151",6379);
//            t2Jedis.watch("money");
//            Transaction t2RedisTransaction = t2Jedis.multi();
//            System.out.println("t2开始监控money");
//            try{
//                t2RedisTransaction.set("money","100");
//                //t2已经开始监控了，此时让t1先执行完
//                t1.join();
//                System.out.println("money修改成100:" + t2RedisTransaction.exec());
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//            t2Jedis.close();
//        });
//
//        //让t2先执行，先监控
//        t2.start();
//        t1.start();
//
//    }
//
//
//}
