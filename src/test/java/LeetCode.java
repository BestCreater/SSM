//import org.junit.Test;
//
//import java.util.*;
//
//public class LeetCode {
//    public static void main(String[] args) {
//        System.out.println(longestPalindrome("babad"));
//    }
//    /*1--
//    * 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target 
//    * 的那 两个 整数，并返回它们的数组下标。你可以假设每种输入只会对应一个答案。但是，数组中
//    * 同一个元素在答案里不能重复出现。你可以按任意顺序返回答案。*/
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
//        return twoSum;
//    }
//    /*2--
//    * 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。*/
//    @Test
//    public static int lengthOfLongestSubstring(String s) {
//        int ans=0;
//        List<Integer> arrList=new ArrayList<>();
//        char[] chars = s.toCharArray();
//        for (int i = 0; i <chars.length ; i++) {
//            Set<Character> set = new HashSet<>();
//            for (int j = i; j <chars.length ; j++) {
//                if (set.contains(s.charAt(j))){
//                    break;
//                }
//                set.add(chars[j]);
//                arrList.add(set.size());
//            }
//        }
//        Collections.sort(arrList);
//        if(arrList.size()>=1){
//            ans=arrList.get(arrList.size()-1);
//        }
//        return ans;
//    }
//    /*给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。
//    请你找出并返回这两个正序数组的 中位数 。算法的时间复杂度应该为 O(log (m+n)) 。*/
//    @Test
//    public static double findMedianSortedArrays(int[] nums1, int[] nums2) {
//        int num3 []=new int[nums1.length+nums2.length];
//        double med=0;
//        for (int i = 0; i <nums1.length ; i++) {
//            num3[i]=nums1[i];
//        }
//        for (int i = 0; i <nums2.length ; i++) {
//            num3[num3.length-i-1]=nums2[i];
//        }
//        Arrays.sort(num3);
//        System.out.println(Arrays.toString(num3));
//        if (num3.length%2==0){
//            med=(double) (num3[num3.length/2-1]+(num3[num3.length/2]))/2;
//        }else {
//            med=num3[(num3.length+1)/2-1];
//        }
//        return med;
//    }
//    @Test
//    public static String  longestPalindrome(String s) {
//        String a="";
//        char cs[]=s.toCharArray();
//        for (int i=0;i<s.length();i++){
//            for (int j = 0; j <=i ; j++) {
//                if (s.charAt(i-j)==s.charAt(i+j)){
//
//                }
//            }
//        }
//        return a;
//    }
//    @Test
//    public String longestPalindrome() {
//        String s="";
//        List <String> arr=new ArrayList<>();
//        String left;
//        String right;
//        String mid;
//        if (s.length()==1){
//            return s;
//        }else if (s.length()==2){
//            if (s.charAt(0)==s.charAt(1)){
//                return s;
//            }else{
//                return s.substring(0,1);
//            }
//        }else{
//            for (int i = 0; i <=s.length()-2 ; i++) {
//                if (s.charAt(i)==s.charAt(i+1)){
//                    left=String.valueOf(s.charAt(i));
//                    right=String.valueOf(s.charAt(i+1));
//                    arr.add(left+right);
//                    for (int j = 1; j <s.length()-i-1&&j<=i; j++) {
//                        if (s.charAt(i-j)==s.charAt(i+j+1)){
//                            left=s.charAt(i-j)+left;
//                            right=right+s.charAt(i+j+1);
//                            arr.add(left+right);
//                        }else {
//                            break;
//                        }
//                    }
//                }
//            }
//            for (int i = 1; i <=s.length()-2 ; i++) {
//                if (s.charAt(i-1)==s.charAt(i+1)){
//                    left=String.valueOf(s.charAt(i-1));
//                    mid=String.valueOf(s.charAt(i));
//                    right=String.valueOf(s.charAt(i+1));
//                    arr.add(left+mid+right);
//                    for (int j = 2; j <s.length()-i&&j<=i; j++) {
//                        if (s.charAt(i-j)==s.charAt(i+j)){
//                            left=s.charAt(i-j)+left;
//                            right=right+s.charAt(i+j);
//                            arr.add(left+mid+right);
//                        }else {
//                            break;
//                        }
//                    }
//                }
//            }
//            for (String s1:arr) {
//                if (s1.length()>arr.get(0).length()){
//                    arr.set(0,s1);
//                }
//            }
//            if(arr.size()>0){
//                return arr.get(0);
//            }else{
//                return s.substring(0,1);
//            }
//        }
//    }
//}
