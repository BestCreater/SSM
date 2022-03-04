package utils;

import java.io.*;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RandomDataImpl implements RandomData{
    private List<String> addressList=new ArrayList<>();
    private String name;
    private SecureRandom r;
    private String [] sex={"男","女"};
    private String [] email={"@gmail.com","@yahoo.com","@msn.com","@hotmail.com","@aol.com",
            "@ask.com","@live.com","@qq.com","@0355.net","@163.com","@163.net","@263.net",
            "@3721.net","@yeah","@googlemail.com","@yeah.net"};
    private String telNum;
    private String time;
private String baseName="维启克伦翔旭鹏泽晨辰士以渝菁弘佩勋宁元建家致树炎德行时泰盛雄琛钧冠策腾楠榕风航" +
            "伟刚勇毅俊峰强军平保东文辉力明永健世广志义兴良海山仁波宁贵福生龙元全国胜学祥才发武新利清飞彬富顺" +
            "信子杰涛昌成康星光天达安岩中弘瑛玲憧萍雪珍滢筠柔竹霭凝晓欢霄枫芸菲寒伊亚宜可姬舒影荔枝丽秀娟英华" +
            "慧巧美静淑惠珠莹雪琳晗瑶佳涵盛雄琛钧冠策腾楠榕风航弘秀娟英华慧巧美娜静淑惠珠翠雅芝玉萍红娥玲芬庆" +
            "晋逸沅海乐嘉哲俊勤珍贞莉兰凤洁琳素云莲真环雪荣爱妹霞栋香月媛艳瑞凡佳嘉叶璧璐娅琦晶妍博维泰诗茜秋" +
            "珊莎锦黛青倩婷姣婉娴瑾颖露瑶怡婵雁蓓纨仪荷丹蓉眉君琴蕊薇菁梦岚苑婕馨瑗琰韵融园艺咏卿聪澜纯毓悦昭" +
            "冰爽琬茗羽希宁欣飘育涵琴晴丽美瑶梦茜倩希夕月悦乐彤影珍依沫玉灵瑶嫣倩妍萱漩娅媛怡佩淇雨娜莹娟文芳" +
            "莉雅芝文晨宇怡全子凡悦思奕泉坤恒钊钧铎铭皑柏镇淇淳一洁茹清吉克先依浩泓亮允元源渊和函妤宜云琪菱宣" +
            "沂健信媛凯伊欣可洋萍荣榕含佑明雄芝英义卿乾亦雅芝烨萱昊芸天岚昕尧鸿棋琳宸乔丞安毅凌惠珠";
    private String surname="赵钱孙李周吴郑王冯陈褚卫蒋沈韩杨朱秦尤许何吕施张孔曹严华金魏陶姜戚谢邹喻柏水窦章" +
            "云苏潘葛奚范彭郎鲁韦昌马苗凤花方俞任袁柳酆鲍史唐费廉岑薛雷贺倪汤滕殷罗毕郝邬安常乐于时傅皮卞齐康" +
            "伍余元卜顾孟平黄和穆萧尹姚邵湛汪祁毛禹狄米贝明臧计伏成戴谈宋茅庞熊纪舒屈项祝董梁杜阮蓝闵席季麻强" +
            "贾路娄危江童颜郭梅盛林刁钟徐邱骆高夏蔡田樊胡凌霍虞万支柯昝管卢莫经房裘缪干解应宗丁宣贲邓郁单杭洪" +
            "包诸左石崔吉钮龚程嵇邢滑裴陆荣翁荀羊於惠甄曲家封芮羿储靳汲邴糜松井段富巫乌焦巴弓牧隗山谷车侯宓蓬" +
            "全郗班仰秋仲伊宫宁仇栾暴甘钭厉戎祖武符刘景詹束龙叶幸司韶郜黎蓟薄印宿白怀蒲邰从鄂索咸籍赖卓蔺屠蒙" +
            "池乔阴鬱胥能苍双闻莘党翟谭贡劳逄姬申扶堵冉宰郦雍郤璩桑桂濮牛寿通边扈燕冀郏浦尚农温别庄晏柴瞿阎充" +
            "慕连茹习宦艾鱼容向古易慎戈廖庾终暨居衡步都耿满弘匡国文寇广禄阙东欧殳沃利蔚越夔隆师巩厍聂晁勾敖融" +
            "冷訾辛阚那简饶空曾毋沙乜养鞠须丰巢关蒯相查后荆红游竺权逯盖益桓公万俟司马上官欧阳夏侯诸葛闻人东方" +
            "赫连皇甫尉迟公羊澹台公冶宗政濮阳淳于单于太叔申屠公孙仲孙轩辕令狐钟离宇文长孙慕容鲜于闾丘司徒司空" +
            "丌官司寇仉督子车颛孙端木巫马公西漆雕乐正壤驷公良拓跋夹谷宰父谷梁晋楚闫法汝鄢涂钦段干百里东郭南门" +
            "呼延归海羊舌微生岳帅缑亢况郈有琴梁丘左丘东门西门商牟佘佴伯赏南宫墨哈谯笪年爱阳佟第五言福" ;
    private String [] superName={"欧阳","端木","上官","司马","东方","完颜","南宫",
            "夏侯","诸葛","公羊","皇甫","宗政", "申屠","公孙",
            "慕容","仲孙","宇文","司徒","司空","乐正","谷梁","贺兰","轩辕","令狐",
            "百里","呼延","东郭","南门","公玉","公仲",
            "左丘", "公伯","西门","南荣","东里",
            "达奚","褚师","吴铭"};
    @Override
    public String getName(int nameLength) {
        r=new SecureRandom();
        String min="";
        String xin="";
        int index=r.nextInt(surname.length())+1;
        xin=surname.substring(index-1,index);
        if ((r.nextInt(100)%20==0&&nameLength==3)||(nameLength==4)){
            xin=superName[r.nextInt(superName.length)];
            nameLength--;
        }
        for (int i = 0; i <nameLength-1 ; i++) {
            int temp = r.nextInt(baseName.length()) + 1;
            min += baseName.substring(temp - 1, temp);
        }
        name=xin+min;
        return name;
    }

    @Override
    public String getRandomName() {
        r=new SecureRandom();
        String ran=String.valueOf(System.currentTimeMillis());
        if (Integer.valueOf(ran.substring(ran.length()-1,ran.length()))%6==0) {
            name = getName(r.nextInt(3) + 2);
        }else {
            name=getName(r.nextInt(2)+2);
        }
        return name;
    }

    @Override
    public String crateCode(int codeLength) {
        r = new SecureRandom();
        String code="";
        for (int i = 0; i < codeLength; i++) {
            int type = r.nextInt(3);
            switch (type) {
                case 0:
                    char ch = (char) (r.nextInt(26) + 65);
                    code += ch;
                    break;
                case 1:
                    char xh = (char) (r.nextInt(26) + 97);
                    code += xh;
                    break;
                case 2:
                    int num = r.nextInt(10);
                    code += num;
                    break;
            }
        }
        return code;
    }

    @Override
    public String getSex() {
        r=new SecureRandom();
        return sex[r.nextInt(2)];
    }

    @Override
    public String getTelNum() {
        String [] num={"3","5","7","8","9"};
        telNum="1"+num[r.nextInt(5)];
        for (int i = 0; i <9 ; i++) {
            telNum+=r.nextInt(10);
        }
        return telNum;
    }

    @Override
    public String getTime(String startTime) throws ParseException {
        r=new SecureRandom();
        if (startTime==null){
            startTime="1950-01-01 00:00:00";
        }
        DateFormat dt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat st=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date=dt.parse(startTime);
        long ranTime=(long)(r.nextDouble()*(new Date().getTime()-date.getTime()));
        time=st.format((date.getTime()+ranTime));
        return time;
    }

    @Override
    public String getExactTime(String startTime,String endTime) throws ParseException {
        r=new SecureRandom();
        if (startTime==null){
            startTime="1950-01-01 00:00:00";
        }
        DateFormat dt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat st=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date start=dt.parse(startTime);
        Date end=dt.parse(endTime);
        long ranTime=(long)(r.nextDouble()*(end.getTime()-start.getTime()));
        time=st.format((start.getTime()+ranTime));
        return time;
    }

    @Override
    public String getEmail() {
        r=new SecureRandom();
        String em=crateCode(r.nextInt(3)+4)+email[r.nextInt(email.length)];
        return em;
    }

    @Override
    public String getAddress() {
        r=new SecureRandom();
        if (addressList.size()<=0) {
            FileInputStream fis = null;
            InputStreamReader isr = null;
            BufferedReader br = null; //用于包装InputStreamReader,提高处理性能。因为BufferedReader有缓冲
            try {
                String str = "";
                fis = new FileInputStream("src/main/java/util/address.txt");//从文件系统中的某个文件中获取字节
                isr = new InputStreamReader(fis);// InputStreamReader 是字节流通向字符流的桥梁,
                br = new BufferedReader(isr);// 从字符输入流中读取文件中的内容,封装了一个new InputStreamReader的对象
                while ((str = br.readLine()) != null) {
                    addressList.add(str);
                }
            } catch (FileNotFoundException e) {
                System.out.println("找不到指定文件");
            } catch (IOException e) {
                System.out.println("读取文件失败");
            } finally {
                try {
                    br.close();
                    isr.close();
                    fis.close();
                    // 关闭的时候最好按照先后顺序关闭最后开的先关闭所以先关s,再关n,最后关m
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return addressList.get(r.nextInt(addressList.size()));
    }
}